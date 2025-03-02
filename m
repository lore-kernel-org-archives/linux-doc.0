Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFF215C158
	for <linux-doc@vger.kernel.org>; Sun,  2 Mar 2025 07:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740901697; cv=none; b=RysSqMicWpM6BInC5gHGI9ZsiwJfsQBJEFVuVpYqvUluMwz/roug0SDaki9FiFFyOGngFpQllv+VgeYVm1bwPsFgpYPzJPvLi+4Wg/Z/huqDizUKHKUNf2GC2pemkT7QphxgjkbO2Ht4DqEcPmMW9y3uumEgA4vogbUR1t4cihw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740901697; c=relaxed/simple;
	bh=CwIoFgF9Xdzdp8GS05ANM0gF2Hb59dVWQLZdv2vY0OU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hJpRbQudWVT1nkfanv7cSHfwyd+a/149EHu4tRSVfGNRNoTGE8fH+HJRoV6+fvvQ1dpDL+2tWVecWTZfdxS+T4bc4GHwcyOVMZ1Rx+PyOVPYj+riamWpVDkkTmkgdW4/hhKS/t55Xsg5dpGQZ/FLKUSo4cTZudIevQ3zT6smXTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QASWtKqW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QASWtKqW"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f2f391864so1873005f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 01 Mar 2025 23:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740901694; x=1741506494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nemhl9Cr90qIFaXebYNbB4KFaewOhB/e7h3MaZM4v4g=;
        b=QASWtKqWOAF351l4PCC91IgAyDT2l099RVxFD8FPcBrEKH734d1GyRQTh/31/bb0lf
         9Q4c5uxyS1B/1jnnvxIVSD3lsHI+OacYKzGvm59c13NXtklZpBHeKg8StxD+4jMBjYtA
         MaRnr16uMTk8T66nD1+eGWblEXX571Yg1Ql4REfzZZrPbEamixWBMlRNFQCLCaXRK4su
         dgLadHQ+G5leg/0IeZXkonWDzJ5s6KDx5m0c6LpNwqKm6ZKnrnLjMwqZEeS3wjf8Zso6
         FucnG9PnOCub4aJYMX4M2mvNZNoIlc9lclrZyQiucaQlbJ8qFos1g1oI1fWJam/wRCJs
         FRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740901694; x=1741506494;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nemhl9Cr90qIFaXebYNbB4KFaewOhB/e7h3MaZM4v4g=;
        b=dO0zG3YkLPVJofJgHXoUc5goQooyP0sLwmBgq3D8DFIr/vs8pVG9HkkM6hzFdIz/uG
         eFLF39ukjCHrugDcnZPV8EEDxMToZMkj1nfHlKs+EdaaNnNp5PFWIG00RksNXocRSWTX
         v4oFV3E5B4BYKYu9bqsclWnL2YvQEGvcEmQozvoY5jJeVq77WuInA7OUZTzFfQge7Hlx
         FQGfzwZ0o4hZlrkbZ+yChZvGsf2Vl+H5ZYT2ZRMUagcxiN8GiEhoqHIaUOztIpcWZ6Ms
         pSYPDphfieroPxpFa51jrMeux8BHabD3p0eIKf+aRirrUKrRtGTNG6IcSOQD9znvM5Qq
         TXzA==
X-Forwarded-Encrypted: i=1; AJvYcCV657RTHEjU7e4eyjrB1iLRHnJHy9yWa38JgLPhQgqWGCKhjKPagPNwnwVh2m7pSbFoEB3MpOmulos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE/bB8zJ992rJT26OReNNekGt4J6rb/oH73JEmf+V/y3qVocGE
	kJXreGxZ3rjZVobwNVp4WAVpoKfzsGuGbmxqNYKDX5fK8IkGCktB
X-Gm-Gg: ASbGnctVm3UsLROjKrSKwyyGkGR9e9AXiQvMnanREyNSa0aYnlBo3bc3qDYDcM9p7pL
	ue+4xuYxzgsHmNOciGNUCXNi3Emhyr2WG9JhiWszPoMZQR/K2eTtOTGQRmr+/c/YbO0L9PkANqW
	GSHrCoOAqz6zx4s/VtxNG+6WAOkLaKnDAWQ9zAdM7/aAY0a5Q2LIjcrj+4D0NALXmGGddvaf2nV
	Ie0bi+xmJmXMwNnoqrWiEhJkt69K/fEKajUWWDV0efMvYkzDgtk9ykn0DQ72watdrQGWrccWdiH
	nrX7EILtvzcoaRAGpd/qLEaChpcTj3gS8NtMC3Cl6ZVDF8+geKxU58mpzbGM/GH4oCjjrRwb18u
	/eeQlTudo78ps/1XdB4Ackxrszg==
X-Google-Smtp-Source: AGHT+IEwzOf/PQmtRAP4famS7UN0RjBjXHwfW8qsnylW2K7HMe9eysvdyuU9rW10+40HuWaZDhIsag==
X-Received: by 2002:a05:6000:186f:b0:390:fbba:e64e with SMTP id ffacd0b85a97d-390fbbb1cc2mr3809334f8f.38.1740901693762;
        Sat, 01 Mar 2025 23:48:13 -0800 (PST)
Received: from [192.168.0.28] (cpc83567-brig19-2-0-cust951.3-3.cable.virginm.net. [86.9.27.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d69sm10818486f8f.60.2025.03.01.23.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Mar 2025 23:48:12 -0800 (PST)
Message-ID: <75b4cb02-cbc9-4603-9c97-4f8006406faf@gmail.com>
Date: Sun, 2 Mar 2025 07:48:10 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jiwen Qi <jiwen7.qi@gmail.com>
Subject: Re: [PATCH] docs/mm: Physical Memory: Populate the "Zones" section
To: Bagas Sanjaya <bagasdotme@gmail.com>, akpm@linux-foundation.org
Cc: corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>
References: <20250223185359.338647-1-jiwen7.qi@gmail.com>
 <Z7vOxT7SeO6erBnd@archie.me>
Content-Language: en-US
In-Reply-To: <Z7vOxT7SeO6erBnd@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bagas,

Thanks for your comments!

On 2/24/25 01:43, Bagas Sanjaya wrote:
> On Sun, Feb 23, 2025 at 06:53:59PM +0000, Jiwen Qi wrote:
>> Briefly describe what zones are and the fields of struct zone.
>>
>
> Cc'ing Mike.
>
>> Signed-off-by: Jiwen Qi <jiwen7.qi@gmail.com>
>> ---
>>  Documentation/mm/physical_memory.rst | 259 ++++++++++++++++++++++++++-
>>  1 file changed, 257 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
>> index 71fd4a6acf42..227997694851 100644
>> --- a/Documentation/mm/physical_memory.rst
>> +++ b/Documentation/mm/physical_memory.rst
>> @@ -338,10 +338,265 @@ Statistics
>> 
>>  Zones
>>  =====
>> +As we have mentioned, each zone in memory is described by a ``struct zone``
>> +which is an element of the ``node_zones`` field of the node it belongs to. A
>> +zone represents a range of physical memory. A zone may have holes. The
>                                           ..., and may have holes.
I will change it to "a range of physical memory and may have holes." as suggested.
>> +``spanned_pages`` field represents the total pages spanned by the zone,
>> +the ``present_pages`` field represents the physical pages existing within the
> ; and the ...
I will remove this part as suggested by Mike.
>> +zone and the managed_page field represents the pages managed by the buddy system.
>> +
>> +Linux uses the GFP flags, see ``include/linux/gfp_types.h``, specified by
>                           or (see :ref:`Documentation/core-api/mm-api.rst <mm-api-gfp-flags>` for reference on these flags)?
I will change it to "Linux uses the GFP flags, see :ref:`mm-api-gfp-flags`, specified by" as suggested.
>> +a memory allocation to determine the highest zone in a node from which
>> +the memory allocation can allocate memory. Linux first allocates memory from
>                                               The kernel first ...
I will change it to "The kernel first allocates memory from" as suggested.
>> +that zone, if Linux can't allocate the requested amount of memory from the zone,
>> +it will allocate memory from the next lower zone in the node, the process
>> +continues up to and including the lowest zone. For example, if a node contains
>> +``ZONE_DMA32``, ``ZONE_NORMAL`` and ``ZONE_MOVABLE`` and the highest zone of a
>> +memory allocation is ``ZONE_MOVABLE``, the order of the zones from which Linux
>> +allocates memory is ``ZONE_MOVABLE`` > ``ZONE_NORMAL`` > ``ZONE_DMA32``.
> ... from which the kernel allocates ...
I will replace "Linux" with "the kernel" as suggested.
>> +
>> +At runtime, free pages in a zone are in the Per-CPU Pagesets (PCP) or free areas
>> +of the zone. The Per-CPU Pagesets is pointed by the ``per_cpu_pageset`` filed.
>> +The free areas is pointed by the ``free_area`` field. The Per-CPU Pagesets are
>> +a vital mechanism in the Linux kernel's memory management system. By handling
>> +most frequent allocations and frees locally on each CPU, the Per-CPU Pagesets
>> +improve performance and scalability, especially on systems with many cores. The
>> +page allocator in the Linux kernel employs a two-step strategy for memory
>> +allocation, starting with the Per-CPU Pagesets before falling back to the buddy
>> +allocator. Pages are transferred between the Per-CPU Pagesets and the global
>> +free areas (managed by the buddy allocator) in batches. This minimizes the
>> +overhead of frequent interactions with the global buddy allocator. Free areas in
>> +a zone are represented by an array of ``free_area``, where each element
>> +corresponds to a specific order which is a power of two."
>> +
>> +Architecture specific code calls free_area_init() to initializes zones.
>> +
>> +Zone structure
>> +--------------
>> 
>> -.. admonition:: Stub
>> +The zones structure ``struct zone`` is declared in ``include/linux/mmzone.h``.
>                                       ... defined in ...
I will change it as suggested.
>> +Here we briefly describe fields of this structure:
>> 
>> -   This section is incomplete. Please list and describe the appropriate fields.
>> +General
>> +~~~~~~~
>> +
>> +``_watermark``
>> +  The watermarks for this zone. The min watermark is the point where boosting is
>> +  ignored and an allocation may trigger direct reclaim and direct compaction.
>> +  It is also used to throttle direct reclaim. The low watermark is the point
>> +  where kswapd is woken up. The high watermark is the point where kswapd stops
>> +  reclaiming (a zone is balanced) when the ``NUMA_BALANCING_MEMORY_TIERING``
>> +  bit of ``sysctl_numa_balancing_mode`` is not set. The promo watermark is used
>> +  for memory tiering and NUMA balancing. It is the point where kswapd stops
>> +  reclaiming when the ``NUMA_BALANCING_MEMORY_TIERING`` bit of
>> +  ``sysctl_numa_balancing_mode`` is set. The watermarks are set by
>> +  ``__setup_per_zone_wmarks()``. the min watermark is calculated according to
>> +  ``vm.min_free_kbytes`` sysctl. The other three watermarks are set according
>> +  to the distance between two watermarks. The distance is caculated according
>> +  to ``vm.watermark_scale_factor`` sysctl.
> The distance itself is calculated taking ``vm.watermark_scale_factor`` into
> account.
I will change it to "The distance itself is calculated taking
``vm.watermark_scale_factor`` sysctl into account" as suggested.
>> +
>> +``watermark_boost``
>> +  The number of pages which are used to boost watermarks to increase reclaim
>> +  pressure to reduce the likelihood of future fallbacks and wake kswapd now
>> +  as the node may be balanced overall and kswapd will not wake naturally.
>> +
>> +``nr_reserved_highatomic``
>> +  The number of pages which are reserved for high-order atomic allocations.
>> +
>> +``nr_free_highatomic``
>> +  The number of free pages in reserved highatomic pageblocks
>> +
>> +``lowmem_reserve``
>> +  The array of the amounts of the memory reserved in this zone for memory
>> +  allocations. For example, if the highest zone a memory allocation can
>> +  allocate memory from is ``ZONE_MOVABLE``, the amount of memory reserved in
>> +  this zone for this allocation is ``lowmem_reserve[ZONE_MOVABLE]`` when
>> +  attempting to allocate memory from this zone. The reason is that we don't know
>> +  if the memory that we're going to allocate will be freeable or/and it will be
>> +  released eventually, so to avoid totally wasting several GB of ram we must
>> +  reserve some of the lower zone memory (otherwise we risk to run OOM on the
>> +  lower zones despite there being tons of freeable ram on the higher zones).
>> +  This array is recalculated by ``setup_per_zone_lowmem_reserve()`` at runtime
>> +  if ``vm.lowmem_reserve_ratio`` sysctl changes.
>> +
>> +``node``
>> +  The index of the node this zone belongs to. Available only when
>> +  ``CONFIG_NUMA`` is enabled because there is only one zone in a UMA system.
>> +
>> +``zone_pgdat``
>> +  Pointer to the pglist_data of the node this zone belongs to.
>> +
>> +``per_cpu_pageset``
>> +  Pointer to the Per-CPU Pagesets (PCP) allocated and initialized by
>> +  ``setup_zone_pageset()``. By handling most frequent allocations and frees
>> +  locally on each CPU, the Per-CPU Pagesets improve performance and scalability
>                           PCP improves ...
I will change it to "PCP improves performance and scalability" as suggested.
>> +  on systems with many cores.
>> +
>> +``pageset_high_min``
>> +  Copied to the ``high_min`` of the Per-CPU Pagesets for faster access.
>> +
>> +``pageset_high_max``
>> +  Copied to the ``high_max`` of the Per-CPU Pagesets for faster access.
>> +
>> +``pageset_batch``
>> +  Copied to the ``batch`` of the Per-CPU Pagesets for faster access. The
>> +  ``batch``, ``high_min`` and ``high_max`` of the Per-CPU Pagesets are used to
>> +  calculate the number of elements the Per-CPU Pagesets obtain from the buddy
>> +  allocator under a single hold of the lock for efficiency. They are also used
>> +  to decide if the Per-CPU Pagesets return pages to the buddy allocator in page
>> +  free process.
>> +
>> +``pageblock_flags``
>> +  The pointer to the flags for the pageblocks in the system. See
>> +  ``include/linux/pageblock-flags.h``. The memory is allocated in
> (see ``include/linux/pageblock-flags.h`` for flags list).
I'll change it to "system (see ``include/linux/pageblock-flags.h`` for flags list)." as suggested.
>> +  ``setup_usemap()``. Each pageblock occupies ``NR_PAGEBLOCK_BITS`` bits.
>> +  Defined only when ``CONFIG_FLATMEM`` is enabled. The flags is stored in
>> +  ``mem_section`` when ``CONFIG_SPARSEMEM`` is enabled.
>> +
>> +``spanned_pages``
>> +  The total pages spanned by the zone, including holes, which is calculated as:
>> +  ``spanned_pages`` = ``zone_end_pfn`` - ``zone_start_pfn``. It is initialized
>> +  by ``calculate_node_totalpages()``.
>> +
>> +``nr_isolate_pageblock``
>> +  Number of isolated pageblocks. It is used to solve incorrect freepage counting
>> +  problem due to racy retrieving migratetype of pageblock. Protected by
>> +  ``zone->lock``. Defined only when ``CONFIG_MEMORY_ISOLATION`` is enabled.
>> +
>> +``span_seqlock``
>> +  The seqlock to protect ``zone_start_pfn`` and ``spanned_pages``. It is a
>> +  seqlock because it has to be read outside of ``zone->lock``, and it is done in
>> +  the main allocator path.  But, it is written quite infrequently. Defined only
>                                However, the seqlock is ...
I'll change it to "However, the seqlock is written quite infrequently." as suggested.
>> +  when ``CONFIG_MEMORY_HOTPLUG`` is enabled.
>> +
>> +``initialized``
>> +  The flag indicating if the zone is initialized. Set by
>> +  ``init_currently_empty_zone()`` during boot.
>> +
>> +``percpu_drift_mark``
>> +  When free pages are below this point, additional steps are taken when reading
>> +  the number of free pages to avoid per-cpu counter drift allowing watermarks
>> +  to be breached. It is updated in ``refresh_zone_stat_thresholds()``.
>> +
>> +Compaction control
>> +~~~~~~~~~~~~~~~~~~
>> +
>> +``compact_cached_free_pfn``
>> +  The PFN where compaction free scanner should start in the next scan.
>> +
>> +``compact_cached_migrate_pfn``
>> +  The PFNs where compaction migration scanner should start in the next scan.
>> +  This array has two elements, the first one is used in ``MIGRATE_ASYNC`` mode,
>> +  the other is used in ``MIGRATE_SYNC`` mode.
> This array has two elements: the first one is ..., and the other one is ...
I'll change it as suggested.
>> +
>> +``compact_init_migrate_pfn``
>> +  The initial migration PFN which is initialized to 0 at boot time, and to the
>> +  first pageblock with migratable pages in the zone after a full compaction
>> +  finishes. It is used to check if a scan is a whole zone scan or not.
>> +
>> +``compact_blockskip_flush``
>> +  Set to true when compaction migration scanner and free scanner meet, which
>> +  means the ``PB_migrate_skip`` bits should be cleared.
>> +
>> +``contiguous``
>> +  Set to true when the zone is contiguous (there is no hole).
>                                              (in other words, no hole).
I'll change it as suggested.
>> +
>> +Statistics
>> +~~~~~~~~~~
>> +
>> +``vm_stat``
>> +  VM statistics for the zone. The items tracked are defined by
>> +  ``enum zone_stat_item``.
>> +
>> +``vm_numa_event``
>> +  VM NUMA event statistics for the zone. The items tracked are defined by
>> +  ``enum numa_stat_item``.
>> +
>> +``per_cpu_zonestats``
>> +  Per-CPU VM statistics for the zone. It records VM statistics and VM NUMA event
>> +  statistics on a per-CPU basis. It reduces updates to the global ``vm_stat``
>> +  and ``vm_numa_event`` fields of the zone to improve performance.
>> 
>>  .. _pages:
>> 
>>
>
> Thanks.
>

--
Regards,
Jiwen

