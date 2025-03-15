Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFF21A0BFE
	for <linux-doc@vger.kernel.org>; Sat, 15 Mar 2025 21:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742073203; cv=none; b=Nc0VfjFuRS+aLgFPHpR+aix7+RGHTUPN58iVPHWn0CdzgiG3njq6zlQIbYnf8obEzSkFGs6lIunHFddPLRXBNsoHWTX8GQkxD6n8j85uHTDL2nabBqVmRTE73pSYLneJt3Rln+8Zj1YVgTpUesFohPTtm7KjNSOE0oRpTuQpwW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742073203; c=relaxed/simple;
	bh=jn2kbFwyQQ66jyfhkaW7sPjX9Irg9u66uO6Mu14vxBU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ur/y7zT6Sr0jqYYnAJHyFkJBMQmKhhXdFaD4Z0LKKobnwOxo0TEGQxMkdRFiX2eBi6Vppfb1t9u8VMCRZn5wVUCm9ooMQPVH/D2gc/rm0nKy7qxPUoUx7ntdEX4BMEyqNrRsKFQ5PXbwbmrvv/ziKB/w6+dvanXcJwY8s4OGAUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QGIZA8A0; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGIZA8A0"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso4027335e9.0
        for <linux-doc@vger.kernel.org>; Sat, 15 Mar 2025 14:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742073200; x=1742678000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/tJKat2QAckBOZxJUWt5rfLHO+YRyqVbSCaW0dLLlwE=;
        b=QGIZA8A0KhD9trbEbODA0UM0Md5/gMV6wvywRZc/PVuLArmvHSiTaQe9hnpNsAFfhY
         js04quLD+NFrjL3l5pTUuevZ4TqTeN+C+VisuYbCEt+RFmNyvKUCRS1eDjf+KAZXLrrr
         1No6LVxDPHOmTQ04ERfA0kBp4JnOWNQxw56ih5hiNgIr0LlE9YUtZYVxE+HiOlJ91Zlk
         8vuaCG+NKcteJMCQ1tRf/8JBQly9mH6IAGp0T4Ub4tDg66Epex108w/OfWxwXUQjW0gv
         n/ZUnPVxkIbvAfWZ0cMYSnKPbLY9SXK9wujn77jOGZs4hiWR4IJyjT5H4HIAjxXYfvWK
         cFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742073200; x=1742678000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/tJKat2QAckBOZxJUWt5rfLHO+YRyqVbSCaW0dLLlwE=;
        b=Xc9cYykfowZfkdc/FghKPhG1nVJ/s6RueqmwjgjbQEXSEP+8yn9wN6Xyf25M0MlpWA
         +5VousaXZeV/t8+jdlulMCUWOafKZZJChgOMXLBBw5rueGKxe4o39ANEftwUkBH4Jyj4
         HBf4tukhhqu3DyB6AL89emZzmtNJ27hZRPDbuSAZ+7nJE70lZkVameuZdlbqjwghVubP
         LsMoXWJ7khuqg2XVuBe3vt6kbe9xe8hSjSEDLAuJucVfOeBDfQTYJ1c2Q5kTOtMrYZIr
         gZTqCQjPZk0Lv451Xpu11D6jP24JLmZox0KVZDBhzcX2vEeuNtJy/ajBQPQRb78unqnB
         f8Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXujXHl6iFXbgP+/r7o/UFMrv08vXp0fiOI+WbVm+zqXtl0B1CvGXIutmaEAXKNti9aD8MHB/DACO0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe9RsNO+jSMr36b2tqzVHKLT8x/lZY796ikMVRvZDI+tCP9e/s
	F6dIhO6wnpWrxqRg0rUP5SShhTk8Ov1v6Tbq840RHmtn+MCAxrZj
X-Gm-Gg: ASbGncucuo2ejX7nMnTgp5XOQqOPZiVdW65szdMlpYArRZb8fEZwn4SYev2PpGFzq5Q
	ylFao2Fe6rah7WRqh+PVzXCpGsA/vnnpJ23FceF8RNDOx8+UX79LOBA8fOW2WU8rCvraL1CZQft
	GZq2bajOSbgdYfX3HP75f4sK/v8UsSTBK99ccjOZ0g3B4AuRUDF8E3Vpxbl2WCyv+aErQCY+ewn
	w1jTygDi3RnSFH2+bwkf9lpbnfTidyazV3hptlmqaCX8KbGEa9RMw/EFWa3n3nQ6c7naoX8kOcc
	ulBDZDhl2Usmy1nVFW34oJYTr+GCln2/grMw+RaU87PMACSvXp88DF9muomSzFq7Uurb9cRi/Eq
	06JxQ42LpctTXhEaSc7w=
X-Google-Smtp-Source: AGHT+IFi7vyK+WpAf0ZG7Fr3tZKf0xhJnR3/jXSxxQVPaYi0mgkLkfGKJLlYCR2FlnWXmteR3vTSSQ==
X-Received: by 2002:a05:6000:4020:b0:390:f902:f973 with SMTP id ffacd0b85a97d-3971d13629bmr8910290f8f.8.1742073199460;
        Sat, 15 Mar 2025 14:13:19 -0700 (PDT)
Received: from localhost (cpc83567-brig19-2-0-cust951.3-3.cable.virginm.net. [86.9.27.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d2010de59sm59386715e9.33.2025.03.15.14.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 14:13:18 -0700 (PDT)
From: Jiwen Qi <jiwen7.qi@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	rppt@kernel.org,
	bagasdotme@gmail.com
Subject: [PATCH v2] docs/mm: Physical Memory: Populate the "Zones" section
Date: Sat, 15 Mar 2025 21:13:17 +0000
Message-Id: <20250315211317.27612-1-jiwen7.qi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250223185359.338647-1-jiwen7.qi@gmail.com>
References: <20250223185359.338647-1-jiwen7.qi@gmail.com>
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
Changes since v1:
 - Addressed review comments from Bagas Sanjaya.
 - Addressed review comments from Mike Rapoport.

 Documentation/mm/physical_memory.rst | 266 ++++++++++++++++++++++++++-
 1 file changed, 264 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
index 71fd4a6acf42..d3ac106e6b14 100644
--- a/Documentation/mm/physical_memory.rst
+++ b/Documentation/mm/physical_memory.rst
@@ -338,10 +338,272 @@ Statistics
 
 Zones
 =====
+As we have mentioned, each zone in memory is described by a ``struct zone``
+which is an element of the ``node_zones`` array of the node it belongs to.
+``struct zone`` is the core data structure of the page allocator. A zone
+represents a range of physical memory and may have holes.
+
+The page allocator uses the GFP flags, see :ref:`mm-api-gfp-flags`, specified by
+a memory allocation to determine the highest zone in a node from which the
+memory allocation can allocate memory. The page allocator first allocates memory
+from that zone, if the page allocator can't allocate the requested amount of
+memory from the zone, it will allocate memory from the next lower zone in the
+node, the process continues up to and including the lowest zone. For example, if
+a node contains ``ZONE_DMA32``, ``ZONE_NORMAL`` and ``ZONE_MOVABLE`` and the
+highest zone of a memory allocation is ``ZONE_MOVABLE``, the order of the zones
+from which the page allocator allocates memory is ``ZONE_MOVABLE`` >
+``ZONE_NORMAL`` > ``ZONE_DMA32``.
+
+At runtime, free pages in a zone are in the Per-CPU Pagesets (PCP) or free areas
+of the zone. The Per-CPU Pagesets are a vital mechanism in the kernel's memory
+management system. By handling most frequent allocations and frees locally on
+each CPU, the Per-CPU Pagesets improve performance and scalability, especially
+on systems with many cores. The page allocator in the kernel employs a two-step
+strategy for memory allocation, starting with the Per-CPU Pagesets before
+falling back to the buddy allocator. Pages are transferred between the Per-CPU
+Pagesets and the global free areas (managed by the buddy allocator) in batches.
+This minimizes the overhead of frequent interactions with the global buddy
+allocator.
+
+Architecture specific code calls free_area_init() to initializes zones.
+
+Zone structure
+--------------
+The zones structure ``struct zone`` is defined in ``include/linux/mmzone.h``.
+Here we briefly describe fields of this structure:
 
-.. admonition:: Stub
+General
+~~~~~~~
 
-   This section is incomplete. Please list and describe the appropriate fields.
+``_watermark``
+  The watermarks for this zone. When the amount of free pages in a zone is below
+  the min watermark, boosting is ignored, an allocation may trigger direct
+  reclaim and direct compaction, it is also used to throttle direct reclaim.
+  When the amount of free pages in a zone is below the low watermark, kswapd is
+  woken up. When the amount of free pages in a zone is above the high watermark,
+  kswapd stops reclaiming (a zone is balanced) when the
+  ``NUMA_BALANCING_MEMORY_TIERING`` bit of ``sysctl_numa_balancing_mode`` is not
+  set. The promo watermark is used for memory tiering and NUMA balancing. When
+  the amount of free pages in a zone is above the promo watermark, kswapd stops
+  reclaiming when the ``NUMA_BALANCING_MEMORY_TIERING`` bit of
+  ``sysctl_numa_balancing_mode`` is set. The watermarks are set by
+  ``__setup_per_zone_wmarks()``. The min watermark is calculated according to
+  ``vm.min_free_kbytes`` sysctl. The other three watermarks are set according
+  to the distance between two watermarks. The distance itself is calculated
+  taking ``vm.watermark_scale_factor`` sysctl into account.
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
+  attempting to allocate memory from this zone. This is a mechanism the page
+  allocator uses to prevent allocations which could use ``highmem`` from using
+  too much ``lowmem``. For some specialised workloads on ``highmem`` machines,
+  it is dangerous for the kernel to allow process memory to be allocated from
+  the ``lowmem`` zone. This is because that memory could then be pinned via the
+  ``mlock()`` system call, or by unavailability of swapspace.
+  ``vm.lowmem_reserve_ratio`` sysctl determines how aggressive the kernel is in
+  defending these lower zones. This array is recalculated by
+  ``setup_per_zone_lowmem_reserve()`` at runtime if ``vm.lowmem_reserve_ratio``
+  sysctl changes.
+
+``node``
+  The index of the node this zone belongs to. Available only when
+  ``CONFIG_NUMA`` is enabled because there is only one zone in a UMA system.
+
+``zone_pgdat``
+  Pointer to the ``struct pglist_data`` of the node this zone belongs to.
+
+``per_cpu_pageset``
+  Pointer to the Per-CPU Pagesets (PCP) allocated and initialized by
+  ``setup_zone_pageset()``. By handling most frequent allocations and frees
+  locally on each CPU, PCP improves performance and scalability on systems with
+  many cores.
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
+  The pointer to the flags for the pageblocks in the zone (see
+  ``include/linux/pageblock-flags.h`` for flags list). The memory is allocated
+  in ``setup_usemap()``. Each pageblock occupies ``NR_PAGEBLOCK_BITS`` bits.
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
+  the main allocator path. However, the seqlock is written quite infrequently.
+  Defined only when ``CONFIG_MEMORY_HOTPLUG`` is enabled.
+
+``initialized``
+  The flag indicating if the zone is initialized. Set by
+  ``init_currently_empty_zone()`` during boot.
+
+``free_area``
+  The array of free areas, where each element corresponds to a specific order
+  which is a power of two. The buddy allocator uses this structure to manage
+  free memory efficiently. When allocating, it tries to find the smallest
+  sufficient block, if the smallest sufficient block is larger than the
+  requested size, it will be recursively split into the next smaller blocks
+  until the required size is reached. When a page is freed, it may be merged
+  with its buddy to form a larger block. It is initialized by
+  ``zone_init_free_lists()``.
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
+  This array has two elements: the first one is used in ``MIGRATE_ASYNC`` mode,
+  and the other one is used in ``MIGRATE_SYNC`` mode.
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
+  Set to true when the zone is contiguous (in other words, no hole).
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

