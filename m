Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178D973446;
	Wed, 15 Jan 2025 15:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736955331; cv=none; b=ROjs41wFZQMYP2tpZ9c4KPTA5MgeWVHYbdfbAH9pliSFPzhPs+NuPsew3ShxdujaVywSf1Q1tUxby85dlCmbJhIuLlPPOJQa6RkIq4VLpq4TEiIehl0ik/2BXDlfdDIuPO+j0HFMVr+Zct1pzY6lFIBBe5oLAU8tCoexH8x8pBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736955331; c=relaxed/simple;
	bh=nuD6oQN2Oxje3fHPln/F+BIIrO8kDyplL3tAAALA70w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stiUJvsbnVWBbp448UxcEhmvLFwnhnADdaUJcnFKGx1CfQtq3mx5oDyB2l6C9gLSMKSSxlQg4rQVmTlDC375cUSRx3F20uStC4geZhy6zKGrB0LrjBcER3CfdVBhyA05bo6pg3nfcylKyhRMDeRswvssXa4Mkv3Is3ZTrD+RO9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AXm0BFtd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AXm0BFtd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3HTKz80HDkCdBoGCl80Fbou++jlhoRe3M27zjaUp9J0=; b=AXm0BFtdykEtYDgyEGlMUERUiW
	mXKI4ISR2rIRogZm7NcvNnfSX4sHGjbTTj/NFWPyjVXp5lTtLEPp+pjaxl9ZRrEiBWF+tuqGLLnnS
	WayZ12ByZ8h94dWCCBKVVApWzsX6Sfq9YXWbBBeAiWQulhn7MjZK2J+Bu2yygoVl868zHuOK8qsxs
	WP3lQU/JEYqnYoAUFmINaLy5fv+KsDGQeIDktQRQODaETrRkLUKSLseyrTDI0/1oNrq6pbm989Ba/
	kAGjPltgb47owRWidjnUA2nqkfFvGWkaG0jR6iTryrogOVkNmvOWCq9Ni04h1XqXVNkI7y0wInkMA
	iY0Mn/ww==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tY5QC-0000000FTzx-2PCY;
	Wed, 15 Jan 2025 15:35:08 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id CAD233004DE; Wed, 15 Jan 2025 16:35:07 +0100 (CET)
Date: Wed, 15 Jan 2025 16:35:07 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, akpm@linux-foundation.org,
	willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com,
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 11/17] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20250115153507.GF8362@noisy.programming.kicks-ass.net>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-12-surenb@google.com>
 <gdipfy63r4wxiqlnglsjzatpej6jjswimuzadm2l57o2e45u56@qfd763n4ysft>
 <CAJuCfpGu4UVXiBaivTVOGNBVVz3rhZ+VY27gT3_R0cTij5fTGw@mail.gmail.com>
 <20250115104841.GX5388@noisy.programming.kicks-ass.net>
 <20250115111334.GE8385@noisy.programming.kicks-ass.net>
 <CAJuCfpEF14gXsGs9WMiHDqz8irrrzQrxFmbdzS-qT4xihdhWjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJuCfpEF14gXsGs9WMiHDqz8irrrzQrxFmbdzS-qT4xihdhWjQ@mail.gmail.com>

On Wed, Jan 15, 2025 at 07:00:37AM -0800, Suren Baghdasaryan wrote:
> On Wed, Jan 15, 2025 at 3:13 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Wed, Jan 15, 2025 at 11:48:41AM +0100, Peter Zijlstra wrote:
> > > On Sat, Jan 11, 2025 at 12:14:47PM -0800, Suren Baghdasaryan wrote:
> > >
> > > > > Replacing down_read_trylock() with the new routine loses an acquire
> > > > > fence. That alone is not a problem, but see below.
> > > >
> > > > Hmm. I think this acquire fence is actually necessary. We don't want
> > > > the later vm_lock_seq check to be reordered and happen before we take
> > > > the refcount. Otherwise this might happen:
> > > >
> > > > reader             writer
> > > > if (vm_lock_seq == mm_lock_seq) // check got reordered
> > > >         return false;
> > > >                        vm_refcnt += VMA_LOCK_OFFSET
> > > >                        vm_lock_seq == mm_lock_seq
> > > >                        vm_refcnt -= VMA_LOCK_OFFSET
> > > > if (!__refcount_inc_not_zero_limited())
> > > >         return false;
> > > >
> > > > Both reader's checks will pass and the reader would read-lock a vma
> > > > that was write-locked.
> > >
> > > Hmm, you're right. That acquire does matter here.
> >
> > Notably, it means refcount_t is entirely unsuitable for anything
> > SLAB_TYPESAFE_BY_RCU, since they all will need secondary validation
> > conditions after the refcount succeeds.
> 
> Thanks for reviewing, Peter!
> Yes, I'm changing the code to use atomic_t instead of refcount_t and
> it comes out quite nicely I think. I had to add two small helper
> functions:
> vm_refcount_inc() - similar to refcount_add_not_zero() but with an
> acquired fence.
> vm_refcnt_sub() - similar to refcount_sub_and_test(). I could use
> atomic_sub_and_test() but that would add unnecessary acquire fence in
> the pagefault path, so I'm using refcount_sub_and_test() logic
> instead.

Right.

> For SLAB_TYPESAFE_BY_RCU I think we are ok with the
> __vma_enter_locked()/__vma_exit_locked() transition in the
> vma_mark_detached() before freeing the vma and would not need
> secondary validation. In __vma_enter_locked(), vm_refcount gets
> VMA_LOCK_OFFSET set, which prevents readers from taking the refcount.
> In __vma_exit_locked() vm_refcnt transitions to 0, so again that
> prevents readers from taking the refcount. IOW, the readers won't get
> to the secondary validation and will fail early on
> __refcount_inc_not_zero_limited(). I think this transition correctly
> serves the purpose of waiting for current temporary readers to exit
> and preventing new readers from read-locking and using the vma.

Consider:

    CPU0				CPU1

    rcu_read_lock();
    vma = vma_lookup(mm, vaddr);

    ... cpu goes sleep for a *long time* ...

    					__vma_exit_locked();
					vma_area_free()
					..
					vma = vma_area_alloc();
					vma_mark_attached();

    ... comes back once vma is re-used ...

    vma_start_read()
      vm_refcount_inc(); // success!!

At which point we need to validate vma is for mm and covers vaddr, which
is what patch 15 does, no?



Also, I seem to have forgotten some braces back in 2008 :-)

---
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 10a971c2bde3..c1356b52f8ea 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -115,9 +115,10 @@ enum _slab_flag_bits {
  *   rcu_read_lock();
  *   obj = lockless_lookup(key);
  *   if (obj) {
- *     if (!try_get_ref(obj)) // might fail for free objects
+ *     if (!try_get_ref(obj)) { // might fail for free objects
  *       rcu_read_unlock();
  *       goto begin;
+ *     }
  *
  *     if (obj->key != key) { // not the object we expected
  *       put_ref(obj);
