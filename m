Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC772D9EE7
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501940; cv=none; b=kMWMiRa4V4msHgYY9E9Jw6QxB8Uhjj/K+NFZjQuoeyp4Y/8fxePAHKO6ZUdw+3fA+RGxWYp0sO8dWrqBukhEua5WnAIeIdHgaiy182p17jNk0RuSyOnJSIJrkGwTGlwKfneOmGuge/zcMH5IAAzULuiTvKDKsJiXT30N1yIs9Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501940; c=relaxed/simple;
	bh=aC3RfSIgnhP3J7btbGnHt6mxktJhiRn3AhnDk1/2MPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WG6GZN61RGEByWu1Ufq3Ss02deFzl8tDJaVwYTwGGnVaJbqP4l0rMXQQtaGoJqRfIBggfpOohO5YfvdMOrFZRmEYRfodia67yUhTthmJBjYK4Z+kirG8Dojzckko//Bq3rAvyxQPFdj9iiYdIEOV34g2Y2BACcZzQ62YhFXLXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNFer9Ix; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNFer9Ix"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so2999571f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 08:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501937; x=1774106737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIz1kkSGyHzWi6Er8nXwrnDFrMDopmJhQ9G+kvCuRCE=;
        b=bNFer9IxMvyeVFOdRD3xRHS6fHQWCwCuXw0I+IFIZCSiih6SE4iHJd46t7nvE9L5oh
         AU7+aL6oRyqGBd22ir3vGPvLcc4+5DpuuPsFhr7UA0aXLT7SIGbgyX84BQQ5Sl/84gy5
         dQVm4D6owi1Qu7eLYpYZzaq2JMAs0xFxyOrOI8seycTmOWpyNOBoh4xCaZ8yRDSHKpFt
         VrpFBRMaKeB7JqUpp/uqQuBZIe3glYdG+0Vx3h9FZ+HOpTX4hIxuMRVVrH+q0C4riEuT
         2T3kdvYfftTL6Yd6G5QWVUX9g/acRCbCESJdhNl51KgSWmievZwepieDCYMvgq+nYddR
         hqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501937; x=1774106737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIz1kkSGyHzWi6Er8nXwrnDFrMDopmJhQ9G+kvCuRCE=;
        b=VcDPpvXav0mOcsNPhignUDRYCq2JfIQXg4zQJiAC9ZaEFKlhbt2VGZ6bp8QvS22K/s
         DxKpdRJaeLLY6m/gxpglwxyY5rYRqj+2O7UAGKw12q7zeuDF32gnetP9mskyVU16WkMh
         /xV+HuiKQUXnOBE8U2WwyZ0Hvv1kDxmJeg64JvpksO40l4fdqlDjO6ZwYsSJBdTSQ7j1
         1GTqq1cHwuKXnbwoqbsBt/Mu19EVMv1KPFOkeEFoSK9BUnI+LfY04VO2j1baJDFj7/Vb
         ij0OfymksAeQQjyhnxXKA13OuWsnZIVqr6fBJ3antQsPQAPYQ/PESwTPDt2pWvu4bwC3
         GxVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZNdicijRe49f/G/mLsyHDWx2t91F3mkcp6aQNnsN3VYQQejlIkfcSbWXxUIvr5g3BQ2l5J/OqP7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3eM2V5Dc7xfgxKCYZmQEZ4jfhQoBo4TgD0314W81YdCvFLtUZ
	29qCMTQjf5wTuZJUTKnLZI4ZRKZb4oCbiSUxl3TF143H2rfRdDaAs+Ff
X-Gm-Gg: ATEYQzxkb2UDcG8cbwnVw/cwqUPeOsVuzZe+oYbtruOjH8U9KN/wB3GpN1Wcb/WbC0G
	5OiJKZ67nb/anrM6z03qGh/sjVrvv1T9FRTB4exSXqZQZge3rNEap+JZ4Ak0f6XfWCqioSLQFRW
	vx9kxZERo7qyo0ujf8AcZEz41rTblyFnND6h1ysA3tyNWzgGez6FCFeH92fbLBKm3B/xFHBjyxv
	nHAIm864lbX6RG7mBV3Xy2fRpp9FkexRHAD6VVNTa1JiqAz18MePE+0J2psZFeTll7gldfNbiKr
	EosZI3VJiHhRyEpXBNOx6YaVBh62525pMD9J+aamWGp9vOlDjX5U788+gXH7koYts5xg2wPxzIy
	v93MIS2a1oFqKmoJJrqgEOQTF5pjZaNewyqJAdgtmPbTJesoYLWNfEMoUjMujYI3Hju/W1QnhvC
	lyDO6w6pko3tr7PS2rbGJBeSopYxs9rS1ZImg69RGI7uuog0uzqmmb399ZKluhHiLI3aMGpDVB3
	bHqU7SS5QEebQrccs3f+P73IiF+dQ==
X-Received: by 2002:a05:600c:468e:b0:485:3f58:d9d with SMTP id 5b1f17b1804b1-48556714b67mr114810065e9.32.1773501936605;
        Sat, 14 Mar 2026 08:25:36 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a72cdsm27061433f8f.9.2026.03.14.08.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:25:36 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH] Docs/mm: document Page Reclaim
Date: Sat, 14 Mar 2026 16:25:34 +0100
Message-ID: <20260314152534.100473-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fill in the page_reclaim.rst stub created in commit 481cc97349d6
("mm,doc: Add new documentation structure") as part of
the structured memory management documentation following
Mel Gorman's book outline.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/mm/page_reclaim.rst | 164 ++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/Documentation/mm/page_reclaim.rst b/Documentation/mm/page_reclaim.rst
index 50a30b7f8ac3..bfa53bee98c2 100644
--- a/Documentation/mm/page_reclaim.rst
+++ b/Documentation/mm/page_reclaim.rst
@@ -3,3 +3,167 @@
 ============
 Page Reclaim
 ============
+
+Page reclaim frees memory by evicting pages that can be reloaded from disk
+or regenerated.  File-backed pages are dropped (clean) or written back
+(dirty); anonymous pages are swapped out.  The bulk of the implementation
+is in ``mm/vmscan.c``.
+
+.. contents:: :local:
+
+When Reclaim Runs
+=================
+
+Reclaim is triggered in two ways:
+
+- **kswapd**: a per-node kernel thread that runs in the background when
+  free pages in any zone drop below the low watermark.  It reclaims until
+  free pages reach the high watermark, then sleeps.
+
+- **Direct reclaim**: when an allocation cannot be satisfied even after
+  kswapd has been woken, the allocating task reclaims pages synchronously
+  in its own context.  This adds latency to the allocation but is necessary
+  when background reclaim cannot keep up.
+
+Reclaim Priority
+================
+
+The reclaim path operates at decreasing priority levels (from
+``DEF_PRIORITY`` down to 0).  At each level, a larger fraction of the LRU
+lists is scanned.  At the default priority, only 1/4096th of pages are
+considered; at priority 0, the entire list is scanned.
+
+If a full scan at priority 0 still does not free enough memory, the OOM
+killer is invoked (see Documentation/mm/oom.rst).  This escalation
+prevents the system from spinning indefinitely in reclaim.
+
+Scan Control
+============
+
+Each reclaim invocation is parameterized by a ``struct scan_control`` that
+captures the allocation context: which GFP flags were used, how many pages
+are needed, which node or memory cgroup to reclaim from, and whether
+writeback or swap are allowed.  This struct threads through the entire
+reclaim stack, ensuring consistent policy at every level.
+
+LRU Lists
+=========
+
+Each ``lruvec`` (one per node, or per node and memory cgroup combination)
+maintains lists of pages ordered by access recency.
+
+Classic LRU
+-----------
+
+The classic scheme uses four LRU lists per lruvec: active and inactive for
+both anonymous and file-backed pages.  This approximates a second-chance
+(clock) algorithm:
+
+- Pages start on the inactive list when first allocated.
+- If accessed again while on the inactive list, they are promoted to the
+  active list.
+- Reclaim scans the inactive list and evicts pages that have not been
+  recently accessed.
+- To prevent the active list from growing without bound, pages are
+  periodically demoted from active to inactive.
+
+The split between anonymous and file-backed lists allows the reclaim path
+to balance eviction pressure between the two types based on their relative
+cost.  Swapping anonymous pages is generally more expensive than dropping
+clean file pages, so the scanner adjusts the ratio using IO cost
+accounting and the ``vm.swappiness`` tunable.
+
+Multi-Gen LRU
+-------------
+
+The multi-gen LRU is an alternative reclaim algorithm that groups pages
+into generations by access time rather than a simple active/inactive
+split.  It is documented separately in Documentation/mm/multigen_lru.rst.
+
+LRU Batching
+------------
+
+To avoid taking the lruvec lock on every page access, LRU operations are
+batched per-CPU (``mm/swap.c``).  Functions like ``folio_add_lru()`` and
+``folio_mark_accessed()`` queue pages into per-CPU folio batches that are
+drained to the actual LRU lists periodically or when the batch is full.
+This batching is critical for scalability on systems with many CPUs.
+
+Reclaiming Pages
+================
+
+The core reclaim loop (``shrink_node()``) divides its work between page
+cache / anonymous pages and slab caches.  For each lruvec, it scans the
+inactive LRU lists, evaluating each page:
+
+- **Clean file pages** can be dropped immediately — they can be re-read
+  from disk.
+- **Dirty file pages** are queued for writeback.  Reclaim typically skips
+  them and returns later, but under severe pressure it may wait for
+  writeback to complete.
+- **Anonymous pages** are swapped out if swap space is available and
+  ``vm.swappiness`` allows it.
+- **Mapped pages** require TLB invalidation (unmapping) before they can
+  be freed.  The rmap (reverse mapping) system is used to find and
+  remove all page table entries pointing to the page.
+- **Unevictable pages** (locked with ``mlock()``) are skipped entirely.
+  See Documentation/mm/unevictable-lru.rst.
+
+Memory Cgroup Reclaim
+---------------------
+
+When memory cgroup limits are exceeded, reclaim targets only the pages
+belonging to that cgroup.  Each memory cgroup has its own lruvec per node,
+so the scanner can isolate its pages without disturbing the rest of the
+system.  ``try_to_free_mem_cgroup_pages()`` is the entry point for
+cgroup-scoped reclaim.
+
+NUMA Demotion
+-------------
+
+On systems with tiered memory (e.g., fast DRAM and slower persistent
+memory), reclaim can demote pages to a slower tier instead of evicting
+them.  This keeps the data in memory but frees the faster tier for
+actively accessed pages.
+
+Shrinkers
+=========
+
+Besides page cache and anonymous pages, kernel caches (dentries, inodes,
+and driver-specific caches) are reclaimed through the shrinker interface
+(``mm/shrinker.c``).  A shrinker registers two callbacks:
+
+- ``count_objects()``: report how many objects are reclaimable.
+- ``scan_objects()``: free up to a requested number of objects.
+
+The reclaim path calls all registered shrinkers proportionally to the
+amount of reclaimable memory they report.  Shrinkers are NUMA-aware: on
+NUMA systems, each shrinker is called with the node being reclaimed so it
+can prioritize freeing objects local to that node.
+
+Per-memcg shrinker tracking uses bitmap arrays (``shrinker_info``) so that
+the reclaim path only invokes shrinkers that actually have objects in the
+target cgroup, avoiding unnecessary work when there are many cgroups.
+
+Working Set Detection
+=====================
+
+When a page is evicted, a compact shadow entry is stored in its place in
+the page cache or swap cache.  The shadow records the eviction timestamp
+(in terms of the lruvec's nonresident age counter) and the cgroup and
+node that owned the page.
+
+If the page is faulted back in (a "refault"), the shadow entry allows the
+kernel to compute the *refault distance* — how many other pages were
+activated or evicted between this page's eviction and its refault.  If the
+refault distance is shorter than the size of the inactive list, the page
+was part of the active working set and is immediately activated rather
+than placed on the inactive list.  This reduces thrashing by protecting
+frequently accessed pages that would otherwise be repeatedly evicted and
+refaulted.
+
+Shadow entries consume a small amount of memory.  To prevent them from
+accumulating indefinitely, a shrinker reclaims shadow entries from page
+cache radix tree nodes that contain only shadows and no actual pages.
+
+This logic is implemented in ``mm/workingset.c``.
-- 
2.53.0

