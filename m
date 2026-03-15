Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B9621CA03
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773607014; cv=none; b=Byogy19VFbzUQoe0+JHVANgXyWHJ+P0oVEqglhr7BzIlerxMN+l+XNqd0yKDqbiPN5WwlcNzF+QPK+QUnRWMQ+IG+u6dJLB/yjk6af760te6Yxks/ZwYc8eXRMWr1aaikEGT2v5HMo27R1slUEsbP7POoAXmTRpkeXslZhx+gc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773607014; c=relaxed/simple;
	bh=fylH2F6Q3TWkBt7kBP6ifbZuZ+BJ5lqmGt2yIxZdfXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDJAbyCsG79simXGzz6Y2v3x+iAbUh1mCZUIpVMfOvhVWLtjhLbVh3X2MwUREeyByOZwimwMGGnQRnj3sq/4tNFO8GfBeBvc9l0X2btYrd2FsiGM6Rlxr5UdlQEZNCH6uDo2BrelSrUUJcZQBP/lp9PnoufehgfDg7tLUSssyiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=js0b9oKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="js0b9oKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF5BC4CEF7;
	Sun, 15 Mar 2026 20:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773607014;
	bh=fylH2F6Q3TWkBt7kBP6ifbZuZ+BJ5lqmGt2yIxZdfXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=js0b9oKFkQ41n1WGxLExWtor9uaHW8hKqcbTbH/Myn19UVRUzEhAJZlbuphM1wL4s
	 j+Bk5uVzvwlbMhdc3e5LGHyhWLwPhmAfC9ZPaF6ebEtHDYAu4zXkJaVQU9T7nUUTpV
	 gn9PJSLn4lOxA1t3GKFbWXT+jBPRaG/nn/6twMyhyDJp3zavKeVIpWUjY2H6aAT3Lk
	 +vSbJBza8BRdyjM7lzF2BNrp2nsmSNjpsmmlHDOHZbvAGKZGYmoj4M9MVA+Ye+0fJy
	 90w8cfbDuLw+PivtrA0N5cO4OEXQXq4+CBTK2/nnolO+kEGXUu+T7XVK3ABXoBQMgU
	 jmMWHrInP7akA==
Date: Sun, 15 Mar 2026 20:36:51 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] Docs/mm: document Page Allocation
Message-ID: <9b8a1636-ab8a-46ce-98d9-fc68d774e969@lucifer.local>
References: <20260314152530.100357-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314152530.100357-1-xaum.io@gmail.com>

NAK.

Because AI slop obviously, please don't send this kind of stuff.

This time I will +cc the page alloc maintainer for you, who I am sure will
be overjoyed by this...

Same reasons as the rest, I'm already annoyed you didn't bother to put this
in a series even. If you didn't lazily get Claude to do everything, you're
doing a very good job at seeming like you did.

On Sat, Mar 14, 2026 at 04:25:30PM +0100, Kit Dallege wrote:
> Fill in the page_allocation.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/page_allocation.rst | 219 +++++++++++++++++++++++++++
>  1 file changed, 219 insertions(+)
>
> diff --git a/Documentation/mm/page_allocation.rst b/Documentation/mm/page_allocation.rst
> index d9b4495561f1..4d0c1f2db9af 100644
> --- a/Documentation/mm/page_allocation.rst
> +++ b/Documentation/mm/page_allocation.rst
> @@ -3,3 +3,222 @@
>  ===============
>  Page Allocation
>  ===============
> +
> +The page allocator is the kernel's primary interface for obtaining and
> +releasing physical page frames.  It is built on the buddy algorithm and
> +implemented in ``mm/page_alloc.c``

Page frames... Which are? And how is that useful

Primary? So what's the secondary, or tertiary, etc.  'interface' for
'obtaining' and 'releasing' (hint: we use other words for these) 'page
frames' (hint: we don't really refer to these as page frames) ?

.
> +
> +.. contents:: :local:
> +
> +Buddy Allocator
> +===============
> +
> +Free pages are grouped by order (power-of-two size) in per-zone
> +``free_area`` arrays, where order 0 is a single page and the maximum is
> +``MAX_PAGE_ORDER``.  To satisfy an allocation of order N, the allocator
> +looks for a free block of that order.  If none is available, it splits

Nope. Alot are in PCP lists. Claude mentions this below but you're already
hand waving in a way that's actively unhelpful.

> +higher-order block in half repeatedly until one of the right size is
> +produced.  When a page is freed, the allocator checks whether its "buddy"
> +(the adjacent block of the same order) is also free; if so, the two are
> +merged into a block of the next higher order.  This coalescing continues
> +as high as possible, rebuilding large contiguous blocks over time.

This is such a useless abbreviated description of the buddy allocator as to
be frankly worthless.

> +
> +Migratetypes
> +============
> +
> +Each pageblock (typically 2MB on x86) carries a migratetype tag that

Ha! You (read; Claude) don't even define what a pageblock is or what it's
for... as if people ought to 'just know', somehow...

Again, you're proactively wasting our time with this, it's not wanted or
helpful.

And etc. etc. etc. the whole document would need to be thrown away and
rewritten, and we could choose to do that ourselves without your 'help',
thanks.

> +describes the kind of allocations it serves:
> +
> +- **MIGRATE_UNMOVABLE**: kernel allocations that cannot be relocated
> +  (slab objects, page tables).
> +- **MIGRATE_MOVABLE**: user pages and other content that can be migrated
> +  or reclaimed (used by compaction and memory hot-remove).
> +- **MIGRATE_RECLAIMABLE**: caches that can be dropped under pressure
> +  (page cache, dentries).
> +- **MIGRATE_CMA**: reserved for the contiguous memory allocator;
> +  behaves as movable when not in use by CMA.
> +- **MIGRATE_ISOLATE**: temporarily prevents allocation from a range,
> +  used during compaction and memory hot-remove.
> +
> +When a free list for the requested migratetype is empty, the allocator
> +falls back to other types in a defined order.  It may also "steal" an
> +entire pageblock from another migratetype if it needs to take pages from
> +it, changing the pageblock's tag to reduce future fragmentation.  This
> +fallback and stealing logic is a key mechanism for balancing fragmentation
> +against allocation success.
> +
> +Per-CPU Pagesets
> +================
> +
> +Most order-0 allocations are served from per-CPU page lists (PCP) rather
> +than the global ``free_area``.  This avoids taking the zone lock on the
> +common path, which is critical for scalability on large systems.
> +
> +Each CPU maintains lists of free pages grouped by migratetype.  Pages are
> +moved between the per-CPU lists and the buddy in batches.  The batch size
> +and high watermark for each per-CPU list are tuned based on zone size and
> +the number of CPUs.
> +
> +When a per-CPU list is empty, a batch of pages is taken from the buddy.
> +When it exceeds its high watermark, excess pages are returned.
> +``lru_add_drain()`` and ``drain_all_pages()`` flush per-CPU lists when
> +the system needs an accurate count of free pages, such as during memory
> +hot-remove.
> +
> +GFP Flags
> +=========
> +
> +Every allocation request carries a set of GFP (Get Free Pages) flags,
> +defined in ``include/linux/gfp.h``, that describe what the allocator is
> +allowed to do:
> +
> +Zone selection
> +  ``__GFP_DMA``, ``__GFP_DMA32``, ``__GFP_HIGHMEM``, ``__GFP_MOVABLE``
> +  select the highest zone the allocation may use.  ``gfp_zone()`` maps
> +  flags to a zone type; the allocator then scans the zonelist from that
> +  zone downward.
> +
> +Reclaim and compaction
> +  ``__GFP_DIRECT_RECLAIM`` allows the allocator to invoke direct reclaim.
> +  ``__GFP_KSWAPD_RECLAIM`` allows it to wake kswapd.  Together these form
> +  ``GFP_KERNEL``, the most common flag combination.
> +
> +Retry behavior
> +  ``__GFP_NORETRY`` gives up after one attempt at reclaim.
> +  ``__GFP_RETRY_MAYFAIL`` retries as long as progress is being made.
> +  ``__GFP_NOFAIL`` never fails — the allocator retries indefinitely,
> +  which is appropriate only for small allocations in contexts that
> +  cannot handle failure.
> +
> +Migratetype
> +  ``__GFP_MOVABLE`` and ``__GFP_RECLAIMABLE`` select the migratetype.
> +  ``gfp_migratetype()`` maps flags to the appropriate type.
> +
> +Allocation Path
> +===============
> +
> +Fast path
> +---------
> +
> +``get_page_from_freelist()`` is the fast path.  It walks the zonelist
> +(an ordered list of zones across all nodes, starting with the preferred
> +node) looking for a zone with enough free pages above its watermarks.
> +When it finds one, it pulls a page from the per-CPU list or buddy.
> +
> +The fast path also checks NUMA locality, cpuset constraints, and memory
> +cgroup limits.  If no zone can satisfy the request, control passes to
> +the slow path.
> +
> +Slow path
> +---------
> +
> +``__alloc_pages_slowpath()`` engages increasingly aggressive measures:
> +
> +1. Wake kswapd to begin background reclaim.
> +2. Attempt direct reclaim — the allocating task itself reclaims pages.
> +3. Attempt direct compaction — migrate pages to create contiguous blocks
> +   (for high-order allocations).
> +4. Retry with lowered watermarks if progress was made.
> +5. As a last resort, invoke the OOM killer (see Documentation/mm/oom.rst).
> +
> +Each step may succeed, in which case the allocation is retried.  The
> +``__GFP_NORETRY``, ``__GFP_RETRY_MAYFAIL``, and ``__GFP_NOFAIL`` flags
> +control how far down this chain the allocator goes.
> +
> +Watermarks
> +==========
> +
> +Each zone maintains min, low, high, and promo watermarks that govern
> +reclaim behavior:
> +
> +- **min**: below this level, only emergency allocations (those with
> +  ``__GFP_MEMALLOC`` or from the OOM victim) can proceed.  Direct reclaim
> +  may be triggered.
> +- **low**: when free pages drop below this level, kswapd is woken to
> +  begin background reclaim.
> +- **high**: kswapd stops reclaiming when free pages reach this level.
> +  The zone is considered "balanced."
> +- **promo**: used for NUMA memory tiering; controls when kswapd stops
> +  reclaiming when tier promotion is enabled.
> +
> +The min watermark is derived from ``vm.min_free_kbytes``.  The distance
> +between watermarks is scaled by ``vm.watermark_scale_factor``.
> +
> +Watermark boosting temporarily raises watermarks after a pageblock is
> +stolen from a different migratetype, increasing reclaim pressure to
> +recover from the fragmentation event.
> +
> +High-Atomic Reserves
> +--------------------
> +
> +The allocator reserves a small number of high-order pageblocks for atomic
> +(non-sleeping) allocations.  When a high-order atomic allocation succeeds
> +from unreserved memory, the containing pageblock is moved to the reserve.
> +When memory pressure is high, unreserved pageblocks are released back to
> +the general pool.
> +
> +Compaction
> +==========
> +
> +Memory compaction (``mm/compaction.c``) creates contiguous free blocks for
> +high-order allocations by relocating movable pages.  It runs two scanners
> +across a zone: one walks from the bottom to find movable in-use pages, the
> +other walks from the top to find free pages.  Movable pages are migrated
> +to the free locations, consolidating free space in the middle.
> +
> +Sync modes
> +----------
> +
> +Compaction operates in three modes:
> +
> +- **ASYNC**: skips pages that require blocking to isolate or migrate.
> +  Used in the allocation fast path and by kcompactd.
> +- **SYNC_LIGHT**: allows some blocking but skips pages under writeback.
> +- **SYNC**: allows full blocking.  Used when direct compaction is the
> +  last option before OOM.
> +
> +Deferral
> +--------
> +
> +When compaction fails for a given order in a zone, it is deferred for an
> +exponentially increasing number of attempts to avoid wasting CPU on zones
> +that are too fragmented.  A successful high-order allocation resets the
> +deferral.
> +
> +kcompactd
> +---------
> +
> +Each node has a kcompactd kernel thread that performs background
> +compaction.  It is woken when kswapd finishes reclaiming but high-order
> +allocations are still failing due to fragmentation.  kcompactd runs at
> +low priority to avoid interfering with foreground work.
> +
> +Capture Control
> +---------------
> +
> +During direct compaction, the allocator uses a capture mechanism: when
> +compaction frees a block of the right order, the allocation can claim it
> +immediately rather than racing with other allocators on the free list.
> +
> +Page Isolation
> +==============
> +
> +``mm/page_isolation.c`` supports marking pageblocks as ``MIGRATE_ISOLATE``
> +to prevent new allocations from those ranges.  Existing free pages are
> +moved out; the caller then migrates all in-use pages away.  Once the range
> +is fully evacuated, it can be used for a contiguous allocation or taken
> +offline.
> +
> +This mechanism is used by:
> +
> +- **CMA** (contiguous memory allocator): reserves regions at boot for
> +  device drivers that need physically contiguous buffers.  The reserved
> +  pages serve normal movable allocations until a CMA allocation claims
> +  the range.
> +- **Memory hot-remove**: isolates a memory block before offlining it.
> +- **alloc_contig_range()**: general-purpose contiguous allocation used
> +  by gigantic huge pages and other subsystems.
> +
> +The isolation process must handle pageblocks that straddle the requested
> +range boundaries, compound pages (huge pages, THP) that overlap the
> +boundary, and unmovable pages that prevent evacuation.
> --
> 2.53.0
>
>
>
