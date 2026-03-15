Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C540C220F38
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606358; cv=none; b=I71/wgSD5OFEyUf0eHPgoPVX/SB4T9KG5sAwKVoBnpuBU5NVy1xhtLwYwVsOwMv7cEWu4vQBOUqZBiJclNvhLYKssq4HFsH1d3CwhZvvyuP7zXbYfDSIFxzquRldjGPV0M07YHSSQsS9TIwqoHuZPcQ2vU2/Hf5bnW5yQGZOEcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606358; c=relaxed/simple;
	bh=sgRC+UgRjYWfAtg2Gh8ZUTPf4K9hJS3ZcITRUG2mzJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FSruBnH3lQoCNeC9YVfuGj1T5Gu/WLdN/JvtfTVr0sHzjPS1D1OmjjoLS/qdEq6mbrE8yjMwNLYijTJFbsDKtV6YMWDCrd2JRvsp02SoHjQxsQUgul+GevCaF4FZrq5wn151elET40Gev1RoIeEswNzLqhGwbRa4M3bitp7GhlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqGHc/zU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqGHc/zU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96B3C4CEF7;
	Sun, 15 Mar 2026 20:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773606358;
	bh=sgRC+UgRjYWfAtg2Gh8ZUTPf4K9hJS3ZcITRUG2mzJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqGHc/zUlNQ3N25R09KuPAjq1k6oyFacL7HUkShhQvBPzYHY3EHOqjnuc9x2eiB+B
	 cUrh0Ls+REzQzGwVPtJFk9sHdUAqx63bBj1v+WOzgm8iYRDNc/PDpA7oJsmOu6HQw9
	 3MqfBZGdmu2qb7CRZ6ZNrzAar95L1iWGIqlXQMKE7xQ2uIEX0uCwIhHki7nyj5ukH9
	 Dj9E50CxLS4V0gCdr0ok/bqpCEElcY6cgusnFiqK877xja1kA5nHvYhp1aa9t4p524
	 V8C+1pHUC7Gcv2b75+P36hqNYE48My1i4z79GLXMdvn9bcYYloc3RjY0aKRqdi2FSb
	 wvTXCsFOB7Vkw==
Date: Sun, 15 Mar 2026 20:25:55 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document Page Reclaim
Message-ID: <8b43807b-b542-4861-8757-3e008d0e39d2@lucifer.local>
References: <20260314152534.100473-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314152534.100473-1-xaum.io@gmail.com>

NAK because clearly AI slop, again.

(side note - 'page' reclaim is a misnomer now, we should just call this doc
reclaim - we reclaim folios not pages :)

Anway, again, you've not bothered finding out who maintains reclaim, I just
looked and it took me 10 seconds:

MEMORY MANAGEMENT - RECLAIM
M:	Andrew Morton <akpm@linux-foundation.org>
M:	Johannes Weiner <hannes@cmpxchg.org>
R:	David Hildenbrand <david@kernel.org> <- by chance you have David :)
R:	Michal Hocko <mhocko@kernel.org>
R:	Qi Zheng <zhengqi.arch@bytedance.com>
R:	Shakeel Butt <shakeel.butt@linux.dev>
R:	Lorenzo Stoakes <ljs@kernel.org>
L:	linux-mm@kvack.org
S:	Maintained
F:	mm/vmscan.c
F:	mm/workingset.c

You've not even done that, let alone thought to cc- anybody on that list, 5
minutes glancing over the mailing list would tell you this is is common
courtesy.

The documentation is useless hand-waving that maintainers would have to
essentially rewrite for you on 'review'.

This is not a good use of maintainer time, and we don't want stuff we could
generate ourselves.

On Sat, Mar 14, 2026 at 04:25:34PM +0100, Kit Dallege wrote:
> Fill in the page_reclaim.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.

You've also, again, used a copy/paste meaningless, worthless commit message - 5
minutes glacing through the linux-mm list would tell you what we expect.

I mean I say 'you', this was Claude surely?

>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/page_reclaim.rst | 164 ++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
>
> diff --git a/Documentation/mm/page_reclaim.rst b/Documentation/mm/page_reclaim.rst
> index 50a30b7f8ac3..bfa53bee98c2 100644
> --- a/Documentation/mm/page_reclaim.rst
> +++ b/Documentation/mm/page_reclaim.rst
> @@ -3,3 +3,167 @@
>  ============
>  Page Reclaim
>  ============
> +
> +Page reclaim frees memory by evicting pages that can be reloaded from disk
> +or regenerated.  File-backed pages are dropped (clean) or written back

Or regenerated?... This isn't doctor who?

> +(dirty); anonymous pages are swapped out.  The bulk of the implementation
> +is in ``mm/vmscan.c``.

Yeah let's not bother discuss what clean or dirty means, or why that matters, or
anything useful...

etc.

> +
> +.. contents:: :local:
> +
> +When Reclaim Runs
> +=================
> +
> +Reclaim is triggered in two ways:
> +
> +- **kswapd**: a per-node kernel thread that runs in the background when
> +  free pages in any zone drop below the low watermark.  It reclaims until
> +  free pages reach the high watermark, then sleeps.
> +
> +- **Direct reclaim**: when an allocation cannot be satisfied even after
> +  kswapd has been woken, the allocating task reclaims pages synchronously
> +  in its own context.  This adds latency to the allocation but is necessary
> +  when background reclaim cannot keep up.
> +
> +Reclaim Priority
> +================
> +
> +The reclaim path operates at decreasing priority levels (from
> +``DEF_PRIORITY`` down to 0).  At each level, a larger fraction of the LRU
> +lists is scanned.  At the default priority, only 1/4096th of pages are
> +considered; at priority 0, the entire list is scanned.
> +
> +If a full scan at priority 0 still does not free enough memory, the OOM
> +killer is invoked (see Documentation/mm/oom.rst).  This escalation
> +prevents the system from spinning indefinitely in reclaim.
> +
> +Scan Control
> +============
> +
> +Each reclaim invocation is parameterized by a ``struct scan_control`` that
> +captures the allocation context: which GFP flags were used, how many pages
> +are needed, which node or memory cgroup to reclaim from, and whether
> +writeback or swap are allowed.  This struct threads through the entire
> +reclaim stack, ensuring consistent policy at every level.
> +
> +LRU Lists
> +=========
> +
> +Each ``lruvec`` (one per node, or per node and memory cgroup combination)
> +maintains lists of pages ordered by access recency.
> +
> +Classic LRU
> +-----------
> +
> +The classic scheme uses four LRU lists per lruvec: active and inactive for
> +both anonymous and file-backed pages.  This approximates a second-chance
> +(clock) algorithm:
> +
> +- Pages start on the inactive list when first allocated.
> +- If accessed again while on the inactive list, they are promoted to the
> +  active list.
> +- Reclaim scans the inactive list and evicts pages that have not been
> +  recently accessed.
> +- To prevent the active list from growing without bound, pages are
> +  periodically demoted from active to inactive.
> +
> +The split between anonymous and file-backed lists allows the reclaim path
> +to balance eviction pressure between the two types based on their relative
> +cost.  Swapping anonymous pages is generally more expensive than dropping
> +clean file pages, so the scanner adjusts the ratio using IO cost
> +accounting and the ``vm.swappiness`` tunable.
> +
> +Multi-Gen LRU
> +-------------
> +
> +The multi-gen LRU is an alternative reclaim algorithm that groups pages
> +into generations by access time rather than a simple active/inactive
> +split.  It is documented separately in Documentation/mm/multigen_lru.rst.
> +
> +LRU Batching
> +------------
> +
> +To avoid taking the lruvec lock on every page access, LRU operations are
> +batched per-CPU (``mm/swap.c``).  Functions like ``folio_add_lru()`` and
> +``folio_mark_accessed()`` queue pages into per-CPU folio batches that are
> +drained to the actual LRU lists periodically or when the batch is full.
> +This batching is critical for scalability on systems with many CPUs.
> +
> +Reclaiming Pages
> +================
> +
> +The core reclaim loop (``shrink_node()``) divides its work between page
> +cache / anonymous pages and slab caches.  For each lruvec, it scans the
> +inactive LRU lists, evaluating each page:
> +
> +- **Clean file pages** can be dropped immediately — they can be re-read
> +  from disk.
> +- **Dirty file pages** are queued for writeback.  Reclaim typically skips
> +  them and returns later, but under severe pressure it may wait for
> +  writeback to complete.
> +- **Anonymous pages** are swapped out if swap space is available and
> +  ``vm.swappiness`` allows it.
> +- **Mapped pages** require TLB invalidation (unmapping) before they can
> +  be freed.  The rmap (reverse mapping) system is used to find and
> +  remove all page table entries pointing to the page.
> +- **Unevictable pages** (locked with ``mlock()``) are skipped entirely.
> +  See Documentation/mm/unevictable-lru.rst.
> +
> +Memory Cgroup Reclaim
> +---------------------
> +
> +When memory cgroup limits are exceeded, reclaim targets only the pages
> +belonging to that cgroup.  Each memory cgroup has its own lruvec per node,
> +so the scanner can isolate its pages without disturbing the rest of the
> +system.  ``try_to_free_mem_cgroup_pages()`` is the entry point for
> +cgroup-scoped reclaim.
> +
> +NUMA Demotion
> +-------------
> +
> +On systems with tiered memory (e.g., fast DRAM and slower persistent
> +memory), reclaim can demote pages to a slower tier instead of evicting
> +them.  This keeps the data in memory but frees the faster tier for
> +actively accessed pages.
> +
> +Shrinkers
> +=========
> +
> +Besides page cache and anonymous pages, kernel caches (dentries, inodes,
> +and driver-specific caches) are reclaimed through the shrinker interface
> +(``mm/shrinker.c``).  A shrinker registers two callbacks:
> +
> +- ``count_objects()``: report how many objects are reclaimable.
> +- ``scan_objects()``: free up to a requested number of objects.
> +
> +The reclaim path calls all registered shrinkers proportionally to the
> +amount of reclaimable memory they report.  Shrinkers are NUMA-aware: on
> +NUMA systems, each shrinker is called with the node being reclaimed so it
> +can prioritize freeing objects local to that node.
> +
> +Per-memcg shrinker tracking uses bitmap arrays (``shrinker_info``) so that
> +the reclaim path only invokes shrinkers that actually have objects in the
> +target cgroup, avoiding unnecessary work when there are many cgroups.
> +
> +Working Set Detection
> +=====================
> +
> +When a page is evicted, a compact shadow entry is stored in its place in
> +the page cache or swap cache.  The shadow records the eviction timestamp
> +(in terms of the lruvec's nonresident age counter) and the cgroup and
> +node that owned the page.
> +
> +If the page is faulted back in (a "refault"), the shadow entry allows the
> +kernel to compute the *refault distance* — how many other pages were
> +activated or evicted between this page's eviction and its refault.  If the
> +refault distance is shorter than the size of the inactive list, the page
> +was part of the active working set and is immediately activated rather
> +than placed on the inactive list.  This reduces thrashing by protecting
> +frequently accessed pages that would otherwise be repeatedly evicted and
> +refaulted.
> +
> +Shadow entries consume a small amount of memory.  To prevent them from
> +accumulating indefinitely, a shrinker reclaims shadow entries from page
> +cache radix tree nodes that contain only shadows and no actual pages.
> +
> +This logic is implemented in ``mm/workingset.c``.
> --
> 2.53.0
>
>
>
