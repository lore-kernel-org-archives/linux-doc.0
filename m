Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CE9168DA;
	Tue, 14 Jan 2025 04:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736827750; cv=none; b=WXPS2dImTAbctAOf/N6VMrUQKVZ62OviMaI9QeFJkhYLxvsrdO6tV+HGtusipMTJQiQo3iyqb4B6Yr+90IRhWCVlAbfnZCmZgImq7XcM87IfgK4+e0wo6e1HP50DqRdx+qTlLnSzC/RNN/5Tb3Bh/2lK0Q5Lt1JF1RHPYp+al8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736827750; c=relaxed/simple;
	bh=k8BVBYg2pk+wfA0RFCFTXXR4rPws/DbIwVFuoNOymkY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Shme3idhCjaJF5txIK6EqbhG0Tt7epGkg6pZof2ZYU/hjNj+pmodocQnpmzTSvKRsBskN7U4yLQjcQtLm4nKpVzMVQRzNE3FcXerBmBAmfC3C7toAxy9+U+r3fJnidOhatWCwsmC/yDzSeSeA5t+zFpB8Q3q8atZhlziQoRwMYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=i8W5LaDV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="i8W5LaDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE6CC4CEDF;
	Tue, 14 Jan 2025 04:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1736827750;
	bh=k8BVBYg2pk+wfA0RFCFTXXR4rPws/DbIwVFuoNOymkY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i8W5LaDVMdMeRKjuKIAp+oe+0aLo9cXzqnuGJ7Up5hGRVTQeTLxjAkNXp1M2uS1VX
	 84b12xeTyOofei9sMCqGEZU4OhRbo9fmchzbiqh3vGx6cxKUC0Lno+MCCZySBwh7XO
	 FQzK+dBEPxlogpQauZpOHxHP/JTGROSvcME9Z+4Y=
Date: Mon, 13 Jan 2025 20:09:08 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, peterz@infradead.org,
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
Message-Id: <20250113200908.d821636a39e9ca6130a90e24@linux-foundation.org>
In-Reply-To: <CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
References: <20250111042604.3230628-1-surenb@google.com>
	<f5e26a57-ec77-4df8-8b4f-5a718a046894@lucifer.local>
	<20250113174941.8c6d5defe18c8b1a7e477ace@linux-foundation.org>
	<CAJuCfpE0Kdd8EnsjOJ0WW8QcDYbWji3S_LEu+=J9aTVioFMQ+w@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Jan 2025 18:53:11 -0800 Suren Baghdasaryan <surenb@google.com> wrote:

> On Mon, Jan 13, 2025 at 5:49 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> >
> > Yes, we're at -rc7 and this series is rather in panic mode and it seems
> > unnecessarily risky so I'm inclined to set it aside for this cycle.
> >
> > If the series is considered super desirable and if people are confident
> > that we can address any remaining glitches during two months of -rc
> > then sure, we could push the envelope a bit.  But I don't believe this
> > is the case so I'm thinking let's give ourselves another cycle to get
> > this all sorted out?
> 
> I didn't think this series was in panic mode with one real issue that
> is not hard to address (memory ordering in
> __refcount_inc_not_zero_limited()) but I'm obviously biased and might
> be missing the big picture. In any case, if it makes people nervous I
> have no objections to your plan.

Well, I'm soliciting opinions here.  What do others think?

And do you see much urgency with these changes?
