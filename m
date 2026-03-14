Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3670296BD1
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501936; cv=none; b=AiJ55lrtzoNgETWmU9qAgLR6xPI5nydcmoqUSkg+dGVjIsNxeNUC8QFXpUMQ2/o42S9dJWiEqvm/MKfMnvYA1cI1wU3pnTN9vCIgfXu/yWCWS8sT0ouC5rZMDwT3rYLb21bR0X3v9sAB/o2bbooS7EDtEZvBGQDtvWX5qzz3v1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501936; c=relaxed/simple;
	bh=iGTqyHWQMobIOg7moFOXAf5gLv0LScwVIC3O29EhBNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hYKzcb6pF8eDKjEIyzgJEs65D4EHpyeq5xQmjV49tTmCgEf3pFSXU7iiOTumN/+H/UdDneYng2qGDsyL4dOVzgbHF0qmQHBKfDDzr7N0wcJL2KX2CQweMontzrQdpe0SyDHUvbXW5n8jdtLQUjptOhiGV5tcWE7QE7rPJNBWRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yhz50twL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yhz50twL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso27302345e9.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501933; x=1774106733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNO6G/5iszc0dA2Qr9qRG/4piwdA9zP6EkYX9lmlJQ4=;
        b=Yhz50twLHywsJJBuIJS6LW6GMJ7WSCDzxK9OqGgl3FzErc2VB0b+gG1ELb72iaWjJD
         UgVEZZBp55VXRx5uZm9Wkhfq1D6f1xNcnn+ROPQOcPE6AlU+lTgvsuC4xfkYvP/NwGg4
         5GN6/x6HL6HL5Q/IQb74ZfJRHtYHKOzAmzEORq5ZyBIKAXxVjPo8yOitlJdF1i7uJWIQ
         e5jav1R7nftuCn4qwHZI80AKx2J7eVmi01Ng27M6yjeJnbQlfxaO5BcOTUXp2zrTw0A9
         h0NLK6o1M/U/FoWFAOk1lO7PsQK5j8Nb9UT8Qcq1errHs28f8zuahE1nMpHDBJcS8p7t
         RK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501933; x=1774106733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNO6G/5iszc0dA2Qr9qRG/4piwdA9zP6EkYX9lmlJQ4=;
        b=jXhkV2p/z451x+39B9WRRB4aj6iFVx4X1xeAsg6kbNuiySYErFUGxNT1SfoPUGljFF
         SP3mbtiMQjkuKFyUOtKdX5H+ICW3PrpsawBh9SzWMJUETbBi3U6F2klhn1R9hEwuzIdr
         O6ZpK0KzWtYaWVV78WejlHaYA5OSHIOgmEY559KewN4ntb+pLk1NkyM1eDHxNvY2bPZr
         dTDhv+rMXEVj3Kcx7wUEMpCs+zHO+UhkUHemtlRa4mHBIKlL6i7SugPGtU/5zl3pGsiU
         dP9t0M6oYHCBpQJtqLE31MjBBQgrzkeQe69X21SWy0+ymTEHREgf30bO48L0RjhaPG8q
         NdOA==
X-Forwarded-Encrypted: i=1; AJvYcCWCNIhqO0NY6Qa25RRpZ2Ld0fphd243/za7gWrlIEa6Axoj+3z8OiodsMrldBx8VKPoR2DDjAR8gRk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkZKB10u3K4B2dqxzw4W120AZlpEwg3UVVJuCapFa42aqCIs3b
	4lF9Z4PtKVcVuDfrnwrM9CSTfK+xcWR5StOtab9Xi+U0Fq3R+ANEDm8gVdS17gE5CxQ=
X-Gm-Gg: ATEYQzxQL5bZ2oaQnH6KlmYyBHAgyFlmDQh5x92PTtPt/uuwjXqnkmAou1ADdh2WqMU
	VUYQ6dd2B0j+5C9KTs2GECnWg4fJW7TKbZ2ioh+d5afn8end1nWBv3wRuSp6rbIjXtJQFoFHjOm
	Utv8832/RFGa7sHxb28mGaC68f3s0yEEJsZAJocz+3tETnONznPa8X2ooAOxkHDVDt4hGAqZIKW
	cto1QmpnYw7utq0oBn7jrmILKV3K+M//LV6y18wB9z3WM0RJqVPKdIUFd/dIdI1VYWvZrd8DeLJ
	A5LyKjsVb4cm+ZHJArIOsQt5GZRUilMZbsU67wsvCytHOJNCpHSp7wQe4+f9WHQCnNWdFfnGTig
	fn1TlDSwc4mOmjb+IL8MPIFob+vex4UFgZvar7gIxAzaH96dd34aB00Lk3NVgJRGwID6ec1ySEL
	2IEDcvzLq5Ghr/dBvosU42XnM3saNoCrtdfWDjX9hO5zlU/Y+08NkI6UXiqQABz1HpfwFwscSMy
	avhbKw1ohmtZtXoRIDCCkQPFC2boA==
X-Received: by 2002:a05:600c:8b72:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-485566f7a1bmr110614145e9.22.1773501932414;
        Sat, 14 Mar 2026 08:25:32 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm26590350f8f.21.2026.03.14.08.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:25:31 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH] Docs/mm: document Page Allocation
Date: Sat, 14 Mar 2026 16:25:30 +0100
Message-ID: <20260314152530.100357-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fill in the page_allocation.rst stub created in commit 481cc97349d6
("mm,doc: Add new documentation structure") as part of
the structured memory management documentation following
Mel Gorman's book outline.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/mm/page_allocation.rst | 219 +++++++++++++++++++++++++++
 1 file changed, 219 insertions(+)

diff --git a/Documentation/mm/page_allocation.rst b/Documentation/mm/page_allocation.rst
index d9b4495561f1..4d0c1f2db9af 100644
--- a/Documentation/mm/page_allocation.rst
+++ b/Documentation/mm/page_allocation.rst
@@ -3,3 +3,222 @@
 ===============
 Page Allocation
 ===============
+
+The page allocator is the kernel's primary interface for obtaining and
+releasing physical page frames.  It is built on the buddy algorithm and
+implemented in ``mm/page_alloc.c``.
+
+.. contents:: :local:
+
+Buddy Allocator
+===============
+
+Free pages are grouped by order (power-of-two size) in per-zone
+``free_area`` arrays, where order 0 is a single page and the maximum is
+``MAX_PAGE_ORDER``.  To satisfy an allocation of order N, the allocator
+looks for a free block of that order.  If none is available, it splits a
+higher-order block in half repeatedly until one of the right size is
+produced.  When a page is freed, the allocator checks whether its "buddy"
+(the adjacent block of the same order) is also free; if so, the two are
+merged into a block of the next higher order.  This coalescing continues
+as high as possible, rebuilding large contiguous blocks over time.
+
+Migratetypes
+============
+
+Each pageblock (typically 2MB on x86) carries a migratetype tag that
+describes the kind of allocations it serves:
+
+- **MIGRATE_UNMOVABLE**: kernel allocations that cannot be relocated
+  (slab objects, page tables).
+- **MIGRATE_MOVABLE**: user pages and other content that can be migrated
+  or reclaimed (used by compaction and memory hot-remove).
+- **MIGRATE_RECLAIMABLE**: caches that can be dropped under pressure
+  (page cache, dentries).
+- **MIGRATE_CMA**: reserved for the contiguous memory allocator;
+  behaves as movable when not in use by CMA.
+- **MIGRATE_ISOLATE**: temporarily prevents allocation from a range,
+  used during compaction and memory hot-remove.
+
+When a free list for the requested migratetype is empty, the allocator
+falls back to other types in a defined order.  It may also "steal" an
+entire pageblock from another migratetype if it needs to take pages from
+it, changing the pageblock's tag to reduce future fragmentation.  This
+fallback and stealing logic is a key mechanism for balancing fragmentation
+against allocation success.
+
+Per-CPU Pagesets
+================
+
+Most order-0 allocations are served from per-CPU page lists (PCP) rather
+than the global ``free_area``.  This avoids taking the zone lock on the
+common path, which is critical for scalability on large systems.
+
+Each CPU maintains lists of free pages grouped by migratetype.  Pages are
+moved between the per-CPU lists and the buddy in batches.  The batch size
+and high watermark for each per-CPU list are tuned based on zone size and
+the number of CPUs.
+
+When a per-CPU list is empty, a batch of pages is taken from the buddy.
+When it exceeds its high watermark, excess pages are returned.
+``lru_add_drain()`` and ``drain_all_pages()`` flush per-CPU lists when
+the system needs an accurate count of free pages, such as during memory
+hot-remove.
+
+GFP Flags
+=========
+
+Every allocation request carries a set of GFP (Get Free Pages) flags,
+defined in ``include/linux/gfp.h``, that describe what the allocator is
+allowed to do:
+
+Zone selection
+  ``__GFP_DMA``, ``__GFP_DMA32``, ``__GFP_HIGHMEM``, ``__GFP_MOVABLE``
+  select the highest zone the allocation may use.  ``gfp_zone()`` maps
+  flags to a zone type; the allocator then scans the zonelist from that
+  zone downward.
+
+Reclaim and compaction
+  ``__GFP_DIRECT_RECLAIM`` allows the allocator to invoke direct reclaim.
+  ``__GFP_KSWAPD_RECLAIM`` allows it to wake kswapd.  Together these form
+  ``GFP_KERNEL``, the most common flag combination.
+
+Retry behavior
+  ``__GFP_NORETRY`` gives up after one attempt at reclaim.
+  ``__GFP_RETRY_MAYFAIL`` retries as long as progress is being made.
+  ``__GFP_NOFAIL`` never fails — the allocator retries indefinitely,
+  which is appropriate only for small allocations in contexts that
+  cannot handle failure.
+
+Migratetype
+  ``__GFP_MOVABLE`` and ``__GFP_RECLAIMABLE`` select the migratetype.
+  ``gfp_migratetype()`` maps flags to the appropriate type.
+
+Allocation Path
+===============
+
+Fast path
+---------
+
+``get_page_from_freelist()`` is the fast path.  It walks the zonelist
+(an ordered list of zones across all nodes, starting with the preferred
+node) looking for a zone with enough free pages above its watermarks.
+When it finds one, it pulls a page from the per-CPU list or buddy.
+
+The fast path also checks NUMA locality, cpuset constraints, and memory
+cgroup limits.  If no zone can satisfy the request, control passes to
+the slow path.
+
+Slow path
+---------
+
+``__alloc_pages_slowpath()`` engages increasingly aggressive measures:
+
+1. Wake kswapd to begin background reclaim.
+2. Attempt direct reclaim — the allocating task itself reclaims pages.
+3. Attempt direct compaction — migrate pages to create contiguous blocks
+   (for high-order allocations).
+4. Retry with lowered watermarks if progress was made.
+5. As a last resort, invoke the OOM killer (see Documentation/mm/oom.rst).
+
+Each step may succeed, in which case the allocation is retried.  The
+``__GFP_NORETRY``, ``__GFP_RETRY_MAYFAIL``, and ``__GFP_NOFAIL`` flags
+control how far down this chain the allocator goes.
+
+Watermarks
+==========
+
+Each zone maintains min, low, high, and promo watermarks that govern
+reclaim behavior:
+
+- **min**: below this level, only emergency allocations (those with
+  ``__GFP_MEMALLOC`` or from the OOM victim) can proceed.  Direct reclaim
+  may be triggered.
+- **low**: when free pages drop below this level, kswapd is woken to
+  begin background reclaim.
+- **high**: kswapd stops reclaiming when free pages reach this level.
+  The zone is considered "balanced."
+- **promo**: used for NUMA memory tiering; controls when kswapd stops
+  reclaiming when tier promotion is enabled.
+
+The min watermark is derived from ``vm.min_free_kbytes``.  The distance
+between watermarks is scaled by ``vm.watermark_scale_factor``.
+
+Watermark boosting temporarily raises watermarks after a pageblock is
+stolen from a different migratetype, increasing reclaim pressure to
+recover from the fragmentation event.
+
+High-Atomic Reserves
+--------------------
+
+The allocator reserves a small number of high-order pageblocks for atomic
+(non-sleeping) allocations.  When a high-order atomic allocation succeeds
+from unreserved memory, the containing pageblock is moved to the reserve.
+When memory pressure is high, unreserved pageblocks are released back to
+the general pool.
+
+Compaction
+==========
+
+Memory compaction (``mm/compaction.c``) creates contiguous free blocks for
+high-order allocations by relocating movable pages.  It runs two scanners
+across a zone: one walks from the bottom to find movable in-use pages, the
+other walks from the top to find free pages.  Movable pages are migrated
+to the free locations, consolidating free space in the middle.
+
+Sync modes
+----------
+
+Compaction operates in three modes:
+
+- **ASYNC**: skips pages that require blocking to isolate or migrate.
+  Used in the allocation fast path and by kcompactd.
+- **SYNC_LIGHT**: allows some blocking but skips pages under writeback.
+- **SYNC**: allows full blocking.  Used when direct compaction is the
+  last option before OOM.
+
+Deferral
+--------
+
+When compaction fails for a given order in a zone, it is deferred for an
+exponentially increasing number of attempts to avoid wasting CPU on zones
+that are too fragmented.  A successful high-order allocation resets the
+deferral.
+
+kcompactd
+---------
+
+Each node has a kcompactd kernel thread that performs background
+compaction.  It is woken when kswapd finishes reclaiming but high-order
+allocations are still failing due to fragmentation.  kcompactd runs at
+low priority to avoid interfering with foreground work.
+
+Capture Control
+---------------
+
+During direct compaction, the allocator uses a capture mechanism: when
+compaction frees a block of the right order, the allocation can claim it
+immediately rather than racing with other allocators on the free list.
+
+Page Isolation
+==============
+
+``mm/page_isolation.c`` supports marking pageblocks as ``MIGRATE_ISOLATE``
+to prevent new allocations from those ranges.  Existing free pages are
+moved out; the caller then migrates all in-use pages away.  Once the range
+is fully evacuated, it can be used for a contiguous allocation or taken
+offline.
+
+This mechanism is used by:
+
+- **CMA** (contiguous memory allocator): reserves regions at boot for
+  device drivers that need physically contiguous buffers.  The reserved
+  pages serve normal movable allocations until a CMA allocation claims
+  the range.
+- **Memory hot-remove**: isolates a memory block before offlining it.
+- **alloc_contig_range()**: general-purpose contiguous allocation used
+  by gigantic huge pages and other subsystems.
+
+The isolation process must handle pageblocks that straddle the requested
+range boundaries, compound pages (huge pages, THP) that overlap the
+boundary, and unmovable pages that prevent evacuation.
-- 
2.53.0

