Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFD535964;
	Tue, 14 Jan 2025 01:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736819384; cv=none; b=gd9jSFZhsf3qMvUWWtDX30itgzMDPFd1cGQFjLYfFgwM5HhU5KZB9LISAjzOKxlAgzTSN3mmGdgyqtOmcezQNnv+fHyVtLFzLqf3O3r2JflySiAGdY3VrqUXjKBiWU99wPnqirk8yXNMRw1jdz197o6xgAPcfIrkMMR+yJSFmkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736819384; c=relaxed/simple;
	bh=mEwwVxZsOa74/UtS5l50FT1Xo2CjrKWzccjjK1vMdLk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sy42oWDTDhx3vNmy/P+dvE5TgurLrVSmGZu00asE/EATsC7mnHA9yM9OQnRNKB9oe9srGLblpC9XGRG95uxWjixUQkZ9IrxeXUOJSw96k3vBetetX4YM3anG/SfLtcqOUk6W2z64U3vDzk3Ot2lmDF9+xqxCEvYnB604Lj5OPi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=p4Y87sN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="p4Y87sN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6FDC4CEE2;
	Tue, 14 Jan 2025 01:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736819383;
	bh=mEwwVxZsOa74/UtS5l50FT1Xo2CjrKWzccjjK1vMdLk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p4Y87sN083j1dvVO7M5OPgB6lrxOLXYuhUzeY+KR+3cz+8o4/YlZpu/5trqeYE2i1
	 8gcqS8FbnplZQKl/E1EImldyQYFhcqLgSFSw88vzi+H4kpIu8A8HMasOfCxEuVv4gV
	 +JAHPXvE4GmBhZgwZPOR0H48khGJBk5mRviexno0=
Date: Mon, 13 Jan 2025 17:49:41 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Suren Baghdasaryan <surenb@google.com>, peterz@infradead.org,
 willy@infradead.org, liam.howlett@oracle.com, david.laight.linux@gmail.com,
 mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
 oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
 peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
 brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
 hughd@google.com, lokeshgidra@google.com, minchan@google.com,
 jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
 pasha.tatashin@soleen.com, klarasmodin@gmail.com,
 richard.weiyang@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
Message-Id: <20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
In-Reply-To: <f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
References: <20250111042604.3230628-1-surenb@google.com>
	<f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Jan 2025 12:14:19 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> A nit on subject, I mean this is part of what this series does, and hey -
> we have only so much text to put in here - but isn't this both
> reimplementing per-VMA lock as a refcount _and_ importantly allocating VMAs
> using the RCU typesafe mechanism?
> 
> Do we have to do both in one series? Can we split this out? I mean maybe
> that's just churny and unnecessary, but to me this series is 'allocate VMAs
> RCU safe and refcount VMA lock' or something like this. Maybe this is
> nitty... but still :)
> 
> One general comment here - this is a really major change in how this stuff
> works, and yet I don't see any tests anywhere in the series.
> 
> I know it's tricky to write tests for this, but the new VMA testing
> environment should make it possible to test a _lot_ more than we previously
> could.
> 
> However due to some (*ahem*) interesting distribution of where functions
> are, most notably stuff in kernel/fork.c, I guess we can't test
> _everything_ there effectively.
> 
> But I do feel like we should be able to do better than having absolutely no
> testing added for this?
> 
> I think there's definitely quite a bit you could test now, at least in
> asserting fundamentals in tools/testing/vma/vma.c.
> 
> This can cover at least detached state asserts in various scenarios.
> 
> But that won't cover off the really gnarly stuff here around RCU slab
> allocation, and determining precisely how to test that in a sensible way is
> maybe less clear.
> 
> But I'd like to see _something_ here please, this is more or less
> fundamentally changing how all VMAs are allocated and to just have nothing
> feels unfortunate.
> 
> I'm already nervous because we've hit issues coming up to v9 and we're not
> 100% sure if a recent syzkaller is related to these changes or not, I'm not
> sure how much we can get assurances with tests but I'd like something.

Thanks.

Yes, we're at -rc7 and this series is rather in panic mode and it seems
unnecessarily risky so I'm inclined to set it aside for this cycle.

If the series is considered super desirable and if people are confident
that we can address any remaining glitches during two months of -rc
then sure, we could push the envelope a bit.  But I don't believe this
is the case so I'm thinking let's give ourselves another cycle to get
this all sorted out?
