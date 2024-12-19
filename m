Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15C9154C04;
	Thu, 19 Dec 2024 17:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630175; cv=none; b=C5UMA5VlR+nu6PcK1xb0C2EA57IEE/cuBscZJ3T8CXDh/C1baoehe5Kg7llylp1CaPT26JlquEtQVQmMhEd87/7PgxOxSEjbUHMbBhaeiIYykPsLtJgrzVZyFNJXpIyllEYTewqTfuGsLLIs08qmA8p8seb9J9gX9D8OSlFxCM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630175; c=relaxed/simple;
	bh=LiAAMfzP0lSgGPbPgIgmNW21TrDwc19WbquzPRAblAk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKagrVN1lYFcieg0Jrz017zwmBGXxlr3mM5xOHGac/id4pgxFW3Jx6pHGjCyzvHtOfOWzItZyhrer4xLYA0k2rLABxYtE4IO0fI3SwnQVevqOT+bbeGwnhYnmzR/E7v94go2esGYEi5t1FXop8uYv0zxlEJHNSCsrdzDVq8lwlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BphpnbGJ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BphpnbGJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NEQDKyVI+AwN6pRWZtj3HZw9vQa6BI/m9sUYwrx/tAI=; b=BphpnbGJpLqou1jtZkLRmrRsQj
	vymEjXQ1M61YmaIhfG+aYUAjnLdxPUhrb04k1Q6DEs0TOqeg4fgTpTMHdEnkeklfxLGDB6/DVl1xT
	egg6dgaDmX7afuydnRPMyh0nr5s4xpWDxczoo596nwq5WKqkk17LmkeeiyIEWGR9L//Oe/FYQv2J0
	aoLdHkR6+cmVSGde/fM/6g5nIm/tngwDjG8CYXj0SSPylyO9Lk9ehlmmzFKcMc2s/lKBgQVBZaHvi
	pv9PfyUtWC2yJEOALc0/ZpcU/K7iBr0fC6BwScLTAq0v5i0G8qnuRcNBw3vJioqVuW9VMjZg07wg3
	gpbSIZnA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKXj-00000004b1L-1atm;
	Thu, 19 Dec 2024 17:42:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9A17130031E; Thu, 19 Dec 2024 18:42:35 +0100 (CET)
Date: Thu, 19 Dec 2024 18:42:35 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
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
Message-ID: <20241219174235.GD26279@noisy.programming.kicks-ass.net>
References: <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
 <20241219112011.GA34942@noisy.programming.kicks-ass.net>
 <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wfzu6jvbazlxdybsjc54aoivleif6memaxaacd56bcep24nkv3@s3e3aj253hd6>

On Thu, Dec 19, 2024 at 12:16:45PM -0500, Liam R. Howlett wrote:

> Well, hold on - it is taken out of the rmap/anon vma chain here.  It is
> completely unhooked except the vma tree at this point.  We're not adding
> complexity, we're dealing with it.

So I'm not entirely sure I understand the details here -- this is again
about being able to do rollback when things fail?

There is comment above the vms_clean_up_area() call in __mmap_prepare(),
but its not making sense atm.

> >Is there anything that would prevent a concurrent gup_fast() from
> > > doing the same -- touch a cleared PTE?
> 
> Where does gup_fast() install PTEs?  Doesn't it bail once a READ_ONCE()
> on any level returns no PTE?

I think you're right, GUP doesn't, but any 'normal' page-table walker
will.

> > > AFAICT two threads, one doing overlapping mmap() and the other doing
> > > gup_fast() can result in exactly this scenario.
> 
> The mmap() call will race with the gup_fast(), but either the nr_pinned
> will be returned from gup_fast() before vms_clean_up_area() removes the
> page table (or any higher level), or gup_fast() will find nothing.

Agreed.

> > > If we don't care about the GUP case, when I'm thinking we should not
> > > care about the lockless RCU case either.
> > 
> > Also, at this point we'll just fail to find a page, and that is nothing
> > special. The problem with accessing an unmapped VMA is that the
> > page-table walk will instantiate page-tables.
> 
> I think there is a problem if we are reinstalling page tables on a vma
> that's about to be removed.  I think we are avoiding this with our
> locking though?

So this is purely about the overlapping part, right? We need to remove
the old pages, install the new mapping and have new pages populate the
thing.

But either way around, the range stays valid and page-tables stay
needed.

> > Given this is an overlapping mmap -- we're going to need to those
> > page-tables anyway, so no harm done.
> 
> Well, maybe?  The mapping may now be an anon vma vs a file backed, or
> maybe it's PROT_NONE?

The page-tables don't care about all that no? The only thing where it
matters is for things like THP, because that affects the level of
page-tables, but otherwise it's all page-table content (ptes).

> > Only after the VMA is unlinked must we ensure we don't accidentally
> > re-instantiate page-tables.
> 
> It's not as simple as that, unfortunately.  There are vma callbacks for
> drivers (or hugetlbfs, or whatever) that do other things.  So we need to
> clean up the area before we are able to replace the vma and part of that
> clean up is the page tables, or anon vma chain, and/or closing a file.
> 
> There are other ways of finding the vma as well, besides the vma tree.
> We are following the locking so that we are safe from those perspectives
> as well, and so the vma has to be unlinked in a few places in a certain
> order.

For RCU lookups only the mas tree matters -- and its left present there.

If you really want to block RCU readers, I would suggest punching a hole
in the mm_mt. All the traditional code won't notice anyway, this is all
with mmap_lock held for writing.
