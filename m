Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE0156669;
	Wed, 18 Dec 2024 09:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514892; cv=none; b=UHc6dC+d1EErjiIgcPmZouzsLVSypk+RNChegqTbIjNbBUEenB2m5naicb0sHSCQRt/o3OBgErkkYe2UuxUr92DdlTLGrbrOrEvCqTAiZa2eHPyNRGoFk5SiApCFp5ePKUTcjJ7QaWMObHNminHx2RxEzxIYLRNYJK3/0AzgFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514892; c=relaxed/simple;
	bh=13QAhbRjan08XBeFEhfpBy/Dr9HlX8T3FrQVI7PlHYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZNa6J7cYNQOYMqTBvBC7wmB8HSyYI/Tu7F2Wt0tqxmjEvi0+adfYj0DKtIKOY3TzPzkz+g1azItBrJl4tkNJsiwxPESTSvXbHt1fwjPW/1bPhAzqByBVqW64d/T1qaYfJzyNtdxuID6fokv/00UxtcoFI1sLOHTqKEOA37OgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FqvimX+6; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FqvimX+6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+fAmL7GJf78nGDkmx//Bq8X/X+N3cQCfDHep37xE3Ik=; b=FqvimX+6+e0AWVocIqyU2abwr7
	YLayjW0MU500m5v+sbMVzluwXVJd7sWBk+g2/I3RTTSNM3X9rCz1oMyqJoRGWrUXBgtWacOTW5ce+
	dlyiidEz9YmObS2/QYrYGydGQsSIVpehi6f5WRhNvy5hRozxRrtNzLqWSD1TQJz5MGQn7rcslupXk
	3Nb+MO7B1kOIImsv0yLHzHutIEz17zT+HQBFN90Xnw3Ykz4RWbvvgY5xkiESQiShExuIwH2eq2ZdG
	xTbV5Uwbc+OYKpFgnGUqIIW9dIqHn9jG0UoTl5SKNdZFYJBhwwF9jX7hJEaS16btKGUC8QV3PayOK
	LXLB2G7g==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqYD-00000005DVr-0ty3;
	Wed, 18 Dec 2024 09:41:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5B9253002A0; Wed, 18 Dec 2024 10:41:04 +0100 (CET)
Date: Wed, 18 Dec 2024 10:41:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241218094104.GC2354@noisy.programming.kicks-ass.net>
References: <20241216192419.2970941-1-surenb@google.com>
 <20241216192419.2970941-11-surenb@google.com>
 <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>

On Tue, Dec 17, 2024 at 08:27:46AM -0800, Suren Baghdasaryan wrote:

> > So I just replied there, and no, I don't think it makes sense. Just put
> > the kmem_cache_free() in vma_refcount_put(), to be done on 0.
> 
> That's very appealing indeed and makes things much simpler. The
> problem I see with that is the case when we detach a vma from the tree
> to isolate it, then do some cleanup and only then free it. That's done
> in vms_gather_munmap_vmas() here:
> https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1240 and we
> even might reattach detached vmas back:
> https://elixir.bootlin.com/linux/v6.12.5/source/mm/vma.c#L1312. IOW,
> detached state is not final and we can't destroy the object that
> reached this state. 

Urgh, so that's the munmap() path, but arguably when that fails, the
map stays in place.

I think this means you're marking detached too soon; you should only
mark detached once you reach the point of no return.

That said, once you've reached the point of no return; and are about to
go remove the page-tables, you very much want to ensure a lack of
concurrency.

So perhaps waiting for out-standing readers at this point isn't crazy.

Also, I'm having a very hard time reading this maple tree stuff :/
Afaict vms_gather_munmap_vmas() only adds the VMAs to be removed to a
second tree, it does not in fact unlink them from the mm yet.

AFAICT it's vma_iter_clear_gfp() that actually wipes the vmas from the
mm -- and that being able to fail is mind boggling and I suppose is what
gives rise to much of this insanity :/

Anyway, I would expect remove_vma() to be the one that marks it detached
(it's already unreachable through vma_lookup() at this point) and there
you should wait for concurrent readers to bugger off.

> We could change states to: 0=unused (we can free
> the object), 1=detached, 2=attached, etc. but then vma_start_read()
> should do something like refcount_inc_more_than_one() instead of
> refcount_inc_not_zero(). Would you be ok with such an approach?

Urgh, I would strongly suggest ditching refcount_t if we go this route.
The thing is; refcount_t should remain a 'simple' straight forward
interface and not allow people to do the wrong thing. Its not meant to
be the kitchen sink -- we have atomic_t for that.

Anyway, the more common scheme at that point is using -1 for 'free', I
think folio->_mapcount uses that even. For that see:
atomic_add_negative*().

> > Additionally, having vma_end_write() would allow you to put a lockdep
> > annotation in vma_{start,end}_write() -- which was I think the original
> > reason I proposed it a while back, that and having improved clarity when
> > reading the code, since explicitly marking the end of a section is
> > helpful.
> 
> The vma->vmlock_dep_map is tracking vma->vm_refcnt, not the
> vma->vm_lock_seq (similar to how today vma->vm_lock has its lockdep
> tracking that rw_semaphore). If I implement vma_end_write() then it
> will simply be something like:
> 
> void vma_end_write(vma)
> {
>          vma_assert_write_locked(vma);
>          vma->vm_lock_seq = UINT_MAX;
> }
> 
> so, vmlock_dep_map would not be involved.

That's just weird; why would you not track vma_{start,end}_write() with
the exclusive side of the 'rwsem' dep_map ?

> If you want to track vma->vm_lock_seq with a separate lockdep, that
> would be more complicated. Specifically for vma_end_write_all() that
> would require us to call rwsem_release() on all locked vmas, however
> we currently do not track individual locked vmas. vma_end_write_all()
> allows us not to worry about tracking them, knowing that once we do
> mmap_write_unlock() they all will get unlocked with one increment of
> mm->mm_lock_seq. If your suggestion is to replace vma_end_write_all()
> with vma_end_write() and unlock vmas individually across the mm code,
> that would be a sizable effort. If that is indeed your ultimate goal,
> I can do that as a separate project: introduce vma_end_write(),
> gradually add them in required places (not yet sure how complex that
> would be), then retire vma_end_write_all() and add a lockdep for
> vma->vm_lock_seq.

Yeah, so ultimately I think it would be clearer if you explicitly mark
the point where the vma modification is 'done'. But I don't suppose we
have to do that here.
