Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E551FC7DB;
	Thu, 19 Dec 2024 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734598417; cv=none; b=L9+07uKO8D/WhyZIWZtsl9VinaBWqhhrBCcN1g9VCe4azsyIG7MrWA1iY0OxPqBVIurGXk7lSWsfgMhytEP8+poXX6PNXRbDUEvZg2jAcyEQ4+dt8Y3apz2a2sNh3bGC9AOV6KP0CMax2LzzEYsHOrbnqOKINFa9C9TFmPb33A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734598417; c=relaxed/simple;
	bh=+E3aAnGgXo/GVv5ABF7ssnxbSsuqBs/q3Zv4+16KBEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXo8CelxeQn2T/losFMkepO39sUW0zeloypBojE8T6aoNZt0ARCaynJJldSSrWtn5d5JFAdiRkMJcjjapxTxIhvT7apvQ7Nomywpw0OuGHX7Wif03no+eF82tOTlA3Rb7tiijv2jaU3ZXCa2onW7yRFdQP9ov9/8X8fjEREkeLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=H7ZsEvMh; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="H7ZsEvMh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y+Qk/0H1J88ExtAGJUeKlKBfrqM5/qWl+ERPzAhjs/k=; b=H7ZsEvMhH7+0jhe7C/Tf4SloAr
	Jy1WC3G49A4eMdpAyYm8x3GpCZYt6mjP3ZQG0VVu2dxUmjmNlHM9ZXvk6ShP1fAjTcoR3FbLt4X6N
	1tfoiCcCguzCis+Dl5WifEv1uvds5ixMnulKwjUTpcyKCBH8JXpwIc+oxu7MjxFyQqDVRKjtynQrE
	NCiRY63JOWzCif4T07+l2Ao/gR/HtoEd6OC9Q0Zaco2UxvJBduvnA4iR7RXea/7z/OR2LewyHjifg
	TiewiNN8bPt1gkGit3hH05UCtyk1wkBmTrQlSOBgZZwJl5Fq38zAnjD+x0GgO9EM+GCc2N9JOWpSI
	7d7nomQw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOCHQ-00000005Pw6-0A3a;
	Thu, 19 Dec 2024 08:53:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3F6BA3003FF; Thu, 19 Dec 2024 09:53:11 +0100 (CET)
Date: Thu, 19 Dec 2024 09:53:11 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241219085311.GA26551@noisy.programming.kicks-ass.net>
References: <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
 <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net>
 <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
 <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>

On Wed, Dec 18, 2024 at 09:58:12AM -0800, Suren Baghdasaryan wrote:
	
> And remove_vma will be just freeing the vmas. Is that correct?

Yep.

> I'm a bit confused because the original thinking was that
> vma_mark_detached() would drop the last refcnt and if it's 0 we would
> free the vma right there. If that's still what we want to do then I
> think the above sequence should look like this:

Right; sorry about that. So my initial objection to that extra sync was
based on the reasons presented -- but having had to look at the unmap
path again (my mm-foo is somewhat rusty, I've not done much the past few
years) I realized that keeping a VMA alive beyond unmapping PTEs is just
plain daft.

So yes, back to your original semantics, but cleaned up to not need that
extra sync point -- instead relying on the natural placement of
vma_start_write() after unhooking from the mm. And not for reasons of
the race, but for reasons of integrity -- VMA without PTEs is asking for
more trouble.
