Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FED14A4E9
	for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 18:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740336844; cv=none; b=qP1sKZI9WhQdlnjB+C9DasWK97Qf8/s03W1HBWM8xPv21FDe+UUruNxrQfCRgZWiZTRHA2j7mpFPaoNXnRDsdo9nJMy+6Zg3hUH50F+kNpdYvP7nkhHFTuRbzgpf8JeMMQKbHz0mn505CPRrcgKxuVfx71NDR7lv/p9Kwu/pTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740336844; c=relaxed/simple;
	bh=I7LFEMlKLKlLigshCfzL/qbzRtVcEoIQI1KeyJZlmfA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mje6P53zjNVq3ED2kwJbZLvKy3CHia8H+nwzKiOO6dG0yq7LVNW0jRIl9Hd2jy7UpablY6QSJ5Pc5JXUJhxuSjQuTz+x8XBJo4Hx7faKkIKKDE9v3eHKBWFot2XmF/6fmda7ZdgHzRAqz40w1UPjzOlHJxGmbRWMzqtZArvAJyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBURlTVi; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBURlTVi"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so34839295e9.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 10:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740336841; x=1740941641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gYta+DLZiUeLkHIWrvvwJBHUyubLAgb6F/kyuT3eWew=;
        b=WBURlTVi91MkInpJb5OGzFfyrlMSAwnKnt7se1Pbk9Oaoc+utaxgGgkvbleWmb/If1
         EjNJ+IeoNImdxFor//KMR6wzZKnX33Sq08mmh/42WdOJaWa+eJ1bCP4/nDJRJR57ueDR
         qU6boy8D0w6bTO06EjzLVUowZMk+wkNzpzbGQf7eteIjDWSXi0/Skg4b1F/6NHd+cPXy
         1jdSaRHPxhwWGDG8ziEUw18OJbl/IZU1ZjGB5hp//QKoo25sjhxn7ejNTVtd9RHoI5ik
         TsRL8+NXXSrmcTz04ovGPxqOTyKkxD2K0wjHO6PYvDUzAsscgdRNGZE1qfBqpZpJIiQ2
         9RYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740336841; x=1740941641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gYta+DLZiUeLkHIWrvvwJBHUyubLAgb6F/kyuT3eWew=;
        b=Y7GL68cc9RAsgtb9TT8HJOc/1fHgyu4vp+SKGHbz0idIEc2BMpBnFqddwqHqigIkTK
         npPsYA4lnikAePYOh8XJHjTVKRszn/SKeQBiqIR2RSmhQd9RWiQHtcIVrWuo/62BrOBZ
         rlM2IGOsU1KoV/hzd5GkLPPXhhTTIfaV93bX64GO1BHD3DvZQqB4+ahKavwmDt8ME+TL
         E4iY6RR+mqNa849NkwGmVz31fRLr3BXSJCFQfdoC9Rkxwg3bb01v00PaHA5EmIDH2skH
         wZPa+HLzwL+hv5KyN+cHwzHxLDYT97paomJmXe9Lxs+Pab1S8/1Hc4vsz0TJZdpgcnuj
         LkIw==
X-Forwarded-Encrypted: i=1; AJvYcCXJXVWhY/FYiN+vm5b7hiI4dABqmChv3bjzjQM7SKt+4JHk3TKecajpLBJO5iJpnWIQRJj5VuGGmrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzY7TUvUYGEyYU5x2UNbtefEw2T163xl7v8psnhc0iwJVq0ciIk
	QHLmJuFwfAzX6kcLHJqVfNTuAwXqBtPVsVV7IkKcSBrF20B8j/wWM12mvw==
X-Gm-Gg: ASbGnctEfL2jTv1+8w+It/zWVMsQ4W1VrFgH8OELnVltLJDLmUGNPenBMNzRxbsrAa8
	eFGrIIkXgWRjQI4JNxPHbpExnlQmG4KfWk6eqZgbKlrR2z0+APHxR7nNu0QHOYspYXtZSkayWhG
	cCRTzh8eHyK+Qt3HC4AmmlIAtQJi7Os7bSp3fnuaakopIIXH5sc4MdYTHCw7BVJ0o9bSqLVEQdE
	60UG/Jqw26be7xRtAoLwh7l2GltNsYAvpCGMjccTglcCo3bsRmgVv1J1Ow+JS9FurY0W12N443M
	/xmkXXNCTvIDrkEXuFB9FtSIrsIo8HiyzZkDrLTxUXlXJr4MhJdXy36d8o52C7Fc8w3g9QVMV7G
	F
X-Google-Smtp-Source: AGHT+IGKQH5RhyYsJgGEfcxrvNkfynXTyBuxAPgyuslN1rcIBJJcu8B/LN9mMUuyk8Cp9+OpaoF3Zw==
X-Received: by 2002:a05:600c:524a:b0:439:86c4:a8ec with SMTP id 5b1f17b1804b1-439ae1f1147mr95843765e9.15.1740336840341;
        Sun, 23 Feb 2025 10:54:00 -0800 (PST)
Received: from localhost (cpc83567-brig19-2-0-cust951.3-3.cable.virginm.net. [86.9.27.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f3e26sm85098165e9.23.2025.02.23.10.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 10:53:59 -0800 (PST)
From: Jiwen Qi <jiwen7.qi@gmail.com>
To: akpm@linux-foundation.org
Cc: corbet@lwn.net,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/mm: Physical Memory: Populate the "Zones" section
Date: Sun, 23 Feb 2025 18:53:59 +0000
Message-Id: <20250223185359.338647-1-jiwen7.qi@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Briefly describe what zones are and the fields of struct zone.

Signed-off-by: Jiwen Qi <jiwen7.qi@gmail.com>
---
 Documentation/mm/physical_memory.rst | 259 ++++++++++++++++++++++++++-
 1 file changed, 257 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index 71fd4a6acf42..227997694851 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -338,10 +338,265 @@ Statistics
 
 Zones
 =====
+As we have mentioned, each zone in memory is described by a ``struct zone``
+which is an element of the ``node_zones`` field of the node it belongs to. A
+zone represents a range of physical memory. A zone may have holes. The
+``spanned_pages`` field represents the total pages spanned by the zone,
+the ``present_pages`` field represents the physical pages existing within the
+zone and the managed_page field represents the pages managed by the buddy system.
+
+Linux uses the GFP flags, see ``include/linux/gfp_types.h``, specified by
+a memory allocation to determine the highest zone in a node from which
+the memory allocation can allocate memory. Linux first allocates memory from
+that zone, if Linux can't allocate the requested amount of memory from the zone,
+it will allocate memory from the next lower zone in the node, the process
+continues up to and including the lowest zone. For example, if a node contains
+``ZONE_DMA32``, ``ZONE_NORMAL`` and ``ZONE_MOVABLE`` and the highest zone of a
+memory allocation is ``ZONE_MOVABLE``, the order of the zones from which Linux
+allocates memory is ``ZONE_MOVABLE`` > ``ZONE_NORMAL`` > ``ZONE_DMA32``.
+
+At runtime, free pages in a zone are in the Per-CPU Pagesets (PCP) or free areas
+of the zone. The Per-CPU Pagesets is pointed by the ``per_cpu_pageset`` filed.
+The free areas is pointed by the ``free_area`` field. The Per-CPU Pagesets are
+a vital mechanism in the Linux kernel's memory management system. By handling
+most frequent allocations and frees locally on each CPU, the Per-CPU Pagesets
+improve performance and scalability, especially on systems with many cores. The
+page allocator in the Linux kernel employs a two-step strategy for memory
+allocation, starting with the Per-CPU Pagesets before falling back to the buddy
+allocator. Pages are transferred between the Per-CPU Pagesets and the global
+free areas (managed by the buddy allocator) in batches. This minimizes the
+overhead of frequent interactions with the global buddy allocator. Free areas in
+a zone are represented by an array of ``free_area``, where each element
+corresponds to a specific order which is a power of two."
+
+Architecture specific code calls free_area_init() to initializes zones.
+
+Zone structure
+--------------
 
-.. admonition:: Stub
+The zones structure ``struct zone`` is declared in ``include/linux/mmzone.h``.
+Here we briefly describe fields of this structure:
 
-   This section is incomplete. Please list and describe the appropriate fields.
+General
+~~~~~~~
+
+``_watermark``
+  The watermarks for this zone. The min watermark is the point where boosting is
+  ignored and an allocation may trigger direct reclaim and direct compaction.
+  It is also used to throttle direct reclaim. The low watermark is the point
+  where kswapd is woken up. The high watermark is the point where kswapd stops
+  reclaiming (a zone is balanced) when the ``NUMA_BALANCING_MEMORY_TIERING``
+  bit of ``sysctl_numa_balancing_mode`` is not set. The promo watermark is used
+  for memory tiering and NUMA balancing. It is the point where kswapd stops
+  reclaiming when the ``NUMA_BALANCING_MEMORY_TIERING`` bit of
+  ``sysctl_numa_balancing_mode`` is set. The watermarks are set by
+  ``__setup_per_zone_wmarks()``. the min watermark is calculated according to
+  ``vm.min_free_kbytes`` sysctl. The other three watermarks are set according
+  to the distance between two watermarks. The distance is caculated according
+  to ``vm.watermark_scale_factor`` sysctl.
+
+``watermark_boost``
+  The number of pages which are used to boost watermarks to increase reclaim
+  pressure to reduce the likelihood of future fallbacks and wake kswapd now
+  as the node may be balanced overall and kswapd will not wake naturally.
+
+``nr_reserved_highatomic``
+  The number of pages which are reserved for high-order atomic allocations.
+
+``nr_free_highatomic``
+  The number of free pages in reserved highatomic pageblocks
+
+``lowmem_reserve``
+  The array of the amounts of the memory reserved in this zone for memory
+  allocations. For example, if the highest zone a memory allocation can
+  allocate memory from is ``ZONE_MOVABLE``, the amount of memory reserved in
+  this zone for this allocation is ``lowmem_reserve[ZONE_MOVABLE]`` when
+  attempting to allocate memory from this zone. The reason is that we don't know
+  if the memory that we're going to allocate will be freeable or/and it will be
+  released eventually, so to avoid totally wasting several GB of ram we must
+  reserve some of the lower zone memory (otherwise we risk to run OOM on the
+  lower zones despite there being tons of freeable ram on the higher zones).
+  This array is recalculated by ``setup_per_zone_lowmem_reserve()`` at runtime
+  if ``vm.lowmem_reserve_ratio`` sysctl changes.
+
+``node``
+  The index of the node this zone belongs to. Available only when
+  ``CONFIG_NUMA`` is enabled because there is only one zone in a UMA system.
+
+``zone_pgdat``
+  Pointer to the pglist_data of the node this zone belongs to.
+
+``per_cpu_pageset``
+  Pointer to the Per-CPU Pagesets (PCP) allocated and initialized by
+  ``setup_zone_pageset()``. By handling most frequent allocations and frees
+  locally on each CPU, the Per-CPU Pagesets improve performance and scalability
+  on systems with many cores.
+
+``pageset_high_min``
+  Copied to the ``high_min`` of the Per-CPU Pagesets for faster access.
+
+``pageset_high_max``
+  Copied to the ``high_max`` of the Per-CPU Pagesets for faster access.
+
+``pageset_batch``
+  Copied to the ``batch`` of the Per-CPU Pagesets for faster access. The
+  ``batch``, ``high_min`` and ``high_max`` of the Per-CPU Pagesets are used to
+  calculate the number of elements the Per-CPU Pagesets obtain from the buddy
+  allocator under a single hold of the lock for efficiency. They are also used
+  to decide if the Per-CPU Pagesets return pages to the buddy allocator in page
+  free process.
+
+``pageblock_flags``
+  The pointer to the flags for the pageblocks in the system. See
+  ``include/linux/pageblock-flags.h``. The memory is allocated in
+  ``setup_usemap()``. Each pageblock occupies ``NR_PAGEBLOCK_BITS`` bits.
+  Defined only when ``CONFIG_FLATMEM`` is enabled. The flags is stored in
+  ``mem_section`` when ``CONFIG_SPARSEMEM`` is enabled.
+
+``zone_start_pfn``
+  The start pfn of the zone. It is initialized by
+  ``calculate_node_totalpages()``.
+
+``managed_pages``
+  The present pages managed by the buddy system, which is calculated as:
+  ``managed_pages`` = ``present_pages`` - ``reserved_pages``, ``reserved_pages``
+  includes pages allocated by the memblock allocator. It should be used by page
+  allocator and vm scanner to calculate all kinds of watermarks and thresholds.
+  It is accessed using ``atomic_long_xxx()`` functions. It is initialized in
+  ``free_area_init_core()`` and then is reinitialized when memblock allocator
+  frees pages into buddy system.
+
+``spanned_pages``
+  The total pages spanned by the zone, including holes, which is calculated as:
+  ``spanned_pages`` = ``zone_end_pfn`` - ``zone_start_pfn``. It is initialized
+  by ``calculate_node_totalpages()``.
+
+``present_pages``
+  The physical pages existing within the zone, which is calculated as:
+  ``present_pages`` = ``spanned_pages`` - ``absent_pages`` (pages in holes). It
+  may be used by memory hotplug or memory power management logic to figure out
+  unmanaged pages by checking (``present_pages`` - ``managed_pages``). Write
+  access to ``present_pages`` at runtime should be protected by
+  ``mem_hotplug_begin/done()``. Any reader who can't tolerant drift of
+  ``present_pages`` should use ``get_online_mems()`` to get a stable value. It
+  is initialized by ``calculate_node_totalpages()``.
+
+``present_early_pages``
+  The present pages existing within the zone located on memory available since
+  early boot, excluding hotplugged memory. Defined only when
+  ``CONFIG_MEMORY_HOTPLUG`` is enabled and initialized by
+  ``calculate_node_totalpages()``.
+
+``cma_pages``
+  The pages reserved for CMA use. These pages behave like ``ZONE_MOVABLE`` when
+  they are not used for CMA. Defined only when ``CONFIG_CMA`` is enabled.
+
+``name``
+  The name of the zone. It is a pointer to the corresponding element of
+  the ``zone_names`` array.
+
+``nr_isolate_pageblock``
+  Number of isolated pageblocks. It is used to solve incorrect freepage counting
+  problem due to racy retrieving migratetype of pageblock. Protected by
+  ``zone->lock``. Defined only when ``CONFIG_MEMORY_ISOLATION`` is enabled.
+
+``span_seqlock``
+  The seqlock to protect ``zone_start_pfn`` and ``spanned_pages``. It is a
+  seqlock because it has to be read outside of ``zone->lock``, and it is done in
+  the main allocator path.  But, it is written quite infrequently. Defined only
+  when ``CONFIG_MEMORY_HOTPLUG`` is enabled.
+
+``initialized``
+  The flag indicating if the zone is initialized. Set by
+  ``init_currently_empty_zone()`` during boot.
+
+``free_area``
+  Free areas of different sizes. It is initialized by ``zone_init_free_lists()``.
+
+``unaccepted_pages``
+  The list of pages to be accepted. All pages on the list are ``MAX_PAGE_ORDER``.
+  Defined only when ``CONFIG_UNACCEPTED_MEMORY`` is enabled.
+
+``flags``
+  The zone flags. The least three bits are used and defined by
+  ``enum zone_flags``. ``ZONE_BOOSTED_WATERMARK`` (bit 0): zone recently boosted
+  watermarks. Cleared when kswapd is woken. ``ZONE_RECLAIM_ACTIVE`` (bit 1):
+  kswapd may be scanning the zone. ``ZONE_BELOW_HIGH`` (bit 2): zone is below
+  high watermark.
+
+``lock``
+  The main lock that protects the internal data structures of the page allocator
+  specific to the zone, especially protects ``free_area``.
+
+``percpu_drift_mark``
+  When free pages are below this point, additional steps are taken when reading
+  the number of free pages to avoid per-cpu counter drift allowing watermarks
+  to be breached. It is updated in ``refresh_zone_stat_thresholds()``.
+
+Compaction control
+~~~~~~~~~~~~~~~~~~
+
+``compact_cached_free_pfn``
+  The PFN where compaction free scanner should start in the next scan.
+
+``compact_cached_migrate_pfn``
+  The PFNs where compaction migration scanner should start in the next scan.
+  This array has two elements, the first one is used in ``MIGRATE_ASYNC`` mode,
+  the other is used in ``MIGRATE_SYNC`` mode.
+
+``compact_init_migrate_pfn``
+  The initial migration PFN which is initialized to 0 at boot time, and to the
+  first pageblock with migratable pages in the zone after a full compaction
+  finishes. It is used to check if a scan is a whole zone scan or not.
+
+``compact_init_free_pfn``
+  The initial free PFN which is initialized to 0 at boot time and to the last
+  pageblock with free ``MIGRATE_MOVABLE`` pages in the zone. It is used to check
+  if it is the start of a scan.
+
+``compact_considered``
+  The number of compactions attempted since last failure. It is reset in
+  ``defer_compaction()`` when a compaction fails to result in a page allocation
+  success. It is increased by 1 in ``compaction_deferred()`` when a compaction
+  should be skipped. ``compaction_deferred()`` is called before
+  ``compact_zone()`` is called, ``compaction_defer_reset()`` is called when
+  ``compact_zone()`` returns ``COMPACT_SUCCESS``, ``defer_compaction()`` is
+  called when ``compact_zone()`` returns ``COMPACT_PARTIAL_SKIPPED`` or
+  ``COMPACT_COMPLETE``.
+
+``compact_defer_shift``
+  The number of compactions skipped before trying again is
+  ``1<<compact_defer_shift``. It is increased by 1 in ``defer_compaction()``.
+  It is reset in ``compaction_defer_reset()`` when a direct compaction results
+  in a page allocation success. Its maximum value is ``COMPACT_MAX_DEFER_SHIFT``.
+
+``compact_order_failed``
+  The minimum compaction failed order. It is set in ``compaction_defer_reset()``
+  when a compaction succeeds and in ``defer_compaction()`` when a compaction
+  fails to result in a page allocation success.
+
+``compact_blockskip_flush``
+  Set to true when compaction migration scanner and free scanner meet, which
+  means the ``PB_migrate_skip`` bits should be cleared.
+
+``contiguous``
+  Set to true when the zone is contiguous (there is no hole).
+
+Statistics
+~~~~~~~~~~
+
+``vm_stat``
+  VM statistics for the zone. The items tracked are defined by
+  ``enum zone_stat_item``.
+
+``vm_numa_event``
+  VM NUMA event statistics for the zone. The items tracked are defined by
+  ``enum numa_stat_item``.
+
+``per_cpu_zonestats``
+  Per-CPU VM statistics for the zone. It records VM statistics and VM NUMA event
+  statistics on a per-CPU basis. It reduces updates to the global ``vm_stat``
+  and ``vm_numa_event`` fields of the zone to improve performance.
 
 .. _pages:
 

base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
-- 
2.34.1

