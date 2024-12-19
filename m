Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA4778F5E;
	Thu, 19 Dec 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629022; cv=none; b=Y7jIOGStkdZaQ8uaoPLLhlZKV8vfYCxz1jVUpAc90G3xijPVomJrlYTCZwYOD3RaOC2Ax8iLR3SokCp4gjZljh0vWl4bksIEXvQgF8Z0Y+E2axGSxCirPpb6GgfIfCryOvNMmQ8VCTy96nS8r6nVnybPqmz50bi0ttq+g1D5ycc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629022; c=relaxed/simple;
	bh=FVdsstdYo1x93kNdJeMFOt+PwmAPJh0DEqKDqqvNAP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uticOeZfUl7YGRy+NRLVZCvNotSS932X0/13+B3sfWnUqMaBFE0UBGecQycUxOgt4uG+B64QJgd9Wa6CxJQmCKBt/P50Vv5srrjsBMNhc9u1+tjHx1i59MaZ9B6vv1Stwjunf+DIFUIsmDgJZUvFudvjMeCk4dWcGmeyL5hSgTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZUpj/1RL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZUpj/1RL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M9Qh+L84iUm811E7p+zo33hZ53fiZU6quO+Nz9GYMQs=; b=ZUpj/1RLl3eaXTlzJHdcfrKnA2
	RXZ2cFIHYsCx3ffzv84Jar+yMYz/wnGHNtz7s7sXbkkC32DgURVrftp1PcMF/xZkNaLMNafyNJbS5
	1TwS8v51lKUtBRS27cnJ/4sUZXcdfla5dCtXvrwHDAk/KWq/03Q8yzAWmbJXUOqyCZw+BwPSpdMT4
	Ygygg1Eqt3YSk5ZIvad1A3oPKjqJ6ROP/YG9qxbf849lAd3ZBipCFEjxvpaI6+Q7pXoZpNF4/Z5Au
	XdB/uu8/gXArbulneBb+98WXqyOlDIKuaqcGBvv9kvCH2qrGiuxmWZoe9o2GEh8y3dTBWOq8fMiPU
	9EoMDlww==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKF7-00000004WXm-0zMD;
	Thu, 19 Dec 2024 17:23:22 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4D7DF3003FF; Thu, 19 Dec 2024 18:23:20 +0100 (CET)
Date: Thu, 19 Dec 2024 18:23:20 +0100
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
Message-ID: <20241219172320.GC26279@noisy.programming.kicks-ass.net>
References: <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com>
 <20241219091334.GC26551@noisy.programming.kicks-ass.net>
 <CAJuCfpFSJLhkv4o6ZKQKDWKsg2OKYa9kwRLERJkF=B+nzoujCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpFSJLhkv4o6ZKQKDWKsg2OKYa9kwRLERJkF=B+nzoujCQ@mail.gmail.com>

On Thu, Dec 19, 2024 at 08:14:24AM -0800, Suren Baghdasaryan wrote:
> On Thu, Dec 19, 2024 at 1:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Dec 18, 2024 at 01:53:17PM -0800, Suren Baghdasaryan wrote:
> >
> > > Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> > > was doing.
> > >
> > > Then I think vma_start_write() should remain inside
> > > vms_gather_munmap_vmas() and all vmas in mas_detach should be
> >
> > No, it must not. You really are not modifying anything yet (except the
> > split, which we've already noted mark write themselves).
> >
> > > write-locked, even the ones we are not modifying. Otherwise what would
> > > prevent the race I mentioned before?
> > >
> > > __mmap_region
> > >     __mmap_prepare
> > >         vms_gather_munmap_vmas // adds vmas to be unmapped into mas_detach,
> > >                                                       // some locked
> > > by __split_vma(), some not locked
> > >
> > >                                      lock_vma_under_rcu()
> > >                                          vma = mas_walk // finds
> > > unlocked vma also in mas_detach
> > >                                          vma_start_read(vma) //
> > > succeeds since vma is not locked
> > >                                          // vma->detached, vm_start,
> > > vm_end checks pass
> > >                                      // vma is successfully read-locked
> > >
> > >        vms_clean_up_area(mas_detach)
> > >             vms_clear_ptes
> > >                                      // steps on a cleared PTE
> >
> > So here we have the added complexity that the vma is not unhooked at
> > all. Is there anything that would prevent a concurrent gup_fast() from
> > doing the same -- touch a cleared PTE?
> >
> > AFAICT two threads, one doing overlapping mmap() and the other doing
> > gup_fast() can result in exactly this scenario.
> >
> > If we don't care about the GUP case, when I'm thinking we should not
> > care about the lockless RCU case either.
> >
> > >     __mmap_new_vma
> > >         vma_set_range // installs new vma in the range
> > >     __mmap_complete
> > >         vms_complete_munmap_vmas // vmas are write-locked and detached
> > > but it's too late
> >
> > But at this point that old vma really is unhooked, and the
> > vma_write_start() here will ensure readers are gone and it will clear
> > PTEs *again*.
> 
> So, to summarize, you want vma_start_write() and vma_mark_detached()
> to be done when we are removing the vma from the tree, right?

*after*

> Something like:
 
  vma_iter_store()
  vma_start_write()
  vma_mark_detached()

By having vma_start_write() after being unlinked you get the guarantee
of no concurrency. New lookups cannot find you (because of that
vma_iter_store()) and existing readers will be waited for.

> And the race I described is not a real problem since the vma is still
> in the tree, so gup_fast() does exactly that and will simply reinstall
> the ptes.

Just so.
