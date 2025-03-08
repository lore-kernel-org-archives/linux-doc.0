Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185C62904
	for <linux-doc@vger.kernel.org>; Sat,  8 Mar 2025 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470461; cv=none; b=n3XsRMk3/8rwpud87qpEyEY0YeSyNM2tjQ46zZ/Dm4F9jqYyvB4yIIypWuIscErKnbBqv8CSAMHLgn65nbitJKvIG5tDykKeZ5oos1YcFVunv9wCgbGpchZjblHmFZ42AXSiCXNEMi4ONZAhGwsmt7sJvFCOzdHVicua8l70SYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470461; c=relaxed/simple;
	bh=kLh7vsiwyiRruuOrk3SyXEPc/yuLSYJc04oXkcOKcpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BU5KKApog6M9dgr7jqXzzhKyAVXHF8ut/tbh83RWa5V9kZFwuIcGnv3aq7dGWSC//DicCiJGEaSx/nj0B/NZbIh3sbHJ/BT5BpNwOck489Ae6AlPcr+GGDjNphbvjfapMOWo3stDpQNOIfPuzOQXLFxZ0Hf/APcsDPKqN5g0qv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcYJ1lG+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcYJ1lG+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1558795f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 08 Mar 2025 13:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741470457; x=1742075257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gz8rdYBjDWtVICITTkqM0G0gYcDxAwfcMXdZkz5lYRk=;
        b=JcYJ1lG+VEY5EMh3MTkMuTVD7L2/7SNH9/9IvrHmTUSjw3wGo3UbX2i9BXL4B2gEFJ
         S+haqMNyfjzYnuXeaBdoisbkQi8OmHKhUFbdVqa4x4RKyLrWfa8y75ye6GPdt12+15vo
         TmqVGlroXEEfVcFg982iFmX8YbAAXuOAdtkRYIJdLYEwHfFyaBj1zZ6ZePPBtXUdj3+E
         sPEGWUXzup3TxSoZL3YjtpSCKFVbvDV4iNnDe9PsM9wFMxu2H+HID/HW+muVHTlQ+pHk
         I39ERSJzytaJnUb8NdcpEj1ibtNkIPteFXe84Eb9cOmtkmyI9Ic1tyTzXZLPnj+fuqNK
         A1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741470457; x=1742075257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gz8rdYBjDWtVICITTkqM0G0gYcDxAwfcMXdZkz5lYRk=;
        b=svkmVMJ5UHgOiVT4DFdZXdhO8nJHGPg3HDny+w/AaxzbwPlMHEzFi+97c9jpEQ84is
         ib2a8sgNoDyxPrgeUhCRu/xlNBmpWXq66UfRnvEDyxFQHZnMVWexx74PXeUNqnRlSEb9
         hMWQRiiuLJ5MaPkejnI3iwFqbYaCeD5F+Lp0NpTCPO3b6P8sLQglMCGdYpf3Maea3AHI
         665H6dxRImROGBToHOvJEr01ImA8cZGK4K6vNChgrsnCRVlfRWRu1z1ARW3LQkPtv53o
         1xG7hMzZyIx9Cwc6xB8tERJRnKICsrEQ+SsKuWUZPIjDbfALOXLNI/FXvOOU0KjRUfZ9
         cWkw==
X-Forwarded-Encrypted: i=1; AJvYcCWxhptx+3QIa5eT9RzppJJFgMIm28GCzhg8hR1/1D8k8ua49HHXKKRp+v0WrsR/cP07oFwn3bhR30I=@vger.kernel.org
X-Gm-Message-State: AOJu0YydOO4lrQSxGINwnoWpzLTXLHFk+QAG3XUonGDcnbhWcwPTjM1Y
	csaBytHepJVbJG2PFWIbNJTMdjTh0CrsrPslZ8/2XNOljQz2OD6J0+BRwa/J
X-Gm-Gg: ASbGncv6nhzJhUNX+SIu1vRjuR/IlmMrf9mK2tdrA5MfZRa8l7fQNG3xYXKvCv/B71r
	hiF5qjV7+dVOF9diEvSgumoVegO8zTwGv4GfOXB2HStHo9+mcRui5irejlX9cAhKXtzACmnHhi9
	zyFRTwyKS9Iii7PRIzhf356xph1Jx9z9kDRQM6jXALqCpXKnXEW+D66fzjJjEchIabTytzPqrDa
	AWmcSrRhpda9ilpC6SEDg47RBNNsMjmrGJ1MqRW0nxAoS3ZUlH0q+pdUNy+boM6n4T4r7J5dsDd
	sDD6RY9TbMv/Kq3vPiCGmbfhilWf7/EgtH5Zg3x52rwb1wJB3+VNJgiS3e2TT6e/eae9RIukTq5
	+bSlQcbcTQab2JIvqm4nHlyAjvfXa4BVs4pdi
X-Google-Smtp-Source: AGHT+IFrCln5Y3n4wK6o+O7r/hZHYr+IlKG4OdgcsQ5CvIWTEProowlDcQ6VWA1ePV6VzJuFLc7mgg==
X-Received: by 2002:a05:6000:1aca:b0:391:2e6a:30de with SMTP id ffacd0b85a97d-39132d57a67mr4621617f8f.19.1741470457138;
        Sat, 08 Mar 2025 13:47:37 -0800 (PST)
Received: from [192.168.0.28] (cpc83567-brig19-2-0-cust951.3-3.cable.virginm.net. [86.9.27.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c0e308dsm10113531f8f.67.2025.03.08.13.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 13:47:35 -0800 (PST)
Message-ID: <cfac5a05-4f61-4cbd-94c2-311bfad6784e@gmail.com>
Date: Sat, 8 Mar 2025 21:47:34 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/mm: Physical Memory: Populate the "Zones" section
To: Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, corbet@lwn.net, linux-mm@kvack.org,
 linux-doc@vger.kernel.org
References: <20250223185359.338647-1-jiwen7.qi@gmail.com>
 <Z77a2dP9BbiN9MWQ@kernel.org>
Content-Language: en-US
From: Jiwen Qi <jiwen7.qi@gmail.com>
In-Reply-To: <Z77a2dP9BbiN9MWQ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike,

Thanks for your comments!

On 2/26/25 09:11, Mike Rapoport wrote:
> (adding Lorenzo as well)
> 
> On Sun, Feb 23, 2025 at 06:53:59PM +0000, Jiwen Qi wrote:
>> Briefly describe what zones are and the fields of struct zone.
>> 
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
> 
> node_zones array or list rather than field
>
I'll revise the first paragraph as follows:
As we have mentioned, each zone in memory is described by a ``struct zone``
which is an element of the ``node_zones`` array of the node it belongs to. 
``struct zone`` is the core data structure of the page allocator. A zone
represents a range of physical memory and may have holes.
 
>> +zone represents a range of physical memory. A zone may have holes. The
> 
> I believe it's important to mention that struct zone is the core data
> structure of the page allocator.
> 
See the change above

>> +``spanned_pages`` field represents the total pages spanned by the zone,
>> +the ``present_pages`` field represents the physical pages existing within the
>> +zone and the managed_page field represents the pages managed by the buddy system.
> 
> I don't think these belong here, they are anyway described below.
> 
I'll removed it. See the change above

>> +
>> +Linux uses the GFP flags, see ``include/linux/gfp_types.h``, specified by
> 
> As Bagas suggested, a link to Documentation/core-api/mm-api.rst
> <mm-api-gfp-flags> would be better here.
> 
I'll change it to "Linux uses the GFP flags, see :ref:`mm-api-gfp-flags`, specified by" as suggested.

>> +a memory allocation to determine the highest zone in a node from which
>> +the memory allocation can allocate memory. Linux first allocates memory from
>> +that zone, if Linux can't allocate the requested amount of memory from the zone,
>> +it will allocate memory from the next lower zone in the node, the process
>> +continues up to and including the lowest zone. For example, if a node contains
>> +``ZONE_DMA32``, ``ZONE_NORMAL`` and ``ZONE_MOVABLE`` and the highest zone of a
>> +memory allocation is ``ZONE_MOVABLE``, the order of the zones from which Linux
>> +allocates memory is ``ZONE_MOVABLE`` > ``ZONE_NORMAL`` > ``ZONE_DMA32``.
> 
> In this paragraph I'd replace Linux with page allocator. 
> 
Bagas suggested using the kernel. I'll use the page allocator as suggested.

>> +
>> +At runtime, free pages in a zone are in the Per-CPU Pagesets (PCP) or free areas
>> +of the zone. The Per-CPU Pagesets is pointed by the ``per_cpu_pageset`` filed.
>> +The free areas is pointed by the ``free_area`` field. The Per-CPU Pagesets are
> 
> No need to mention fields here, IMO
> 
I'll remove the fields as suggested.

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
>> +Here we briefly describe fields of this structure:
>>  
>> -   This section is incomplete. Please list and describe the appropriate fields.
>> +General
>> +~~~~~~~
>> +
>> +``_watermark``
>> +  The watermarks for this zone. The min watermark is the point where boosting is
>> +  ignored and an allocation may trigger direct reclaim and direct compaction.
> 
> I afraid it's not clear what "min watermark is the point" means. 
> 
> A watermark by itself does not trigger events, it's rather a threshold
> value for amount of free pages for some events to happen.
> 
> I'd phrase this as 
> 
>   When amount of free pages in a zone is below min watermark, boosting is
>   ignored ...
> 
> The same applies to other watermark descriptions below.
> 
I'll change it to "When the amount of free pages in a zone is below the min
watermark, boosting is ignored..." as suggested. Other watermark descriptions
will be changed too.

>> +  It is also used to throttle direct reclaim. The low watermark is the point
>> +  where kswapd is woken up. The high watermark is the point where kswapd stops
>> +  reclaiming (a zone is balanced) when the ``NUMA_BALANCING_MEMORY_TIERING``
>> +  bit of ``sysctl_numa_balancing_mode`` is not set. The promo watermark is used
>> +  for memory tiering and NUMA balancing. It is the point where kswapd stops
>> +  reclaiming when the ``NUMA_BALANCING_MEMORY_TIERING`` bit of
>> +  ``sysctl_numa_balancing_mode`` is set. The watermarks are set by
>> +  ``__setup_per_zone_wmarks()``. the min watermark is calculated according to
> 
> I don't think it's important to mention which function sets the watermarks.
> This also applies to "initialized in foo()" and "setup in bar()" below.
> 
People who read this section will probably also read the source code, so mentioning the
functions is helpful for them. I prefer to keep them, but I'll remove them if you
still prefer that.

>> +  ``vm.min_free_kbytes`` sysctl. The other three watermarks are set according
>> +  to the distance between two watermarks. The distance is caculated according
>> +  to ``vm.watermark_scale_factor`` sysctl.
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
> 
> I realize that it's copied from comment in include/linux/mmzone.h, but I
> really fail to parse the description of this field. 
> 
> I believe lowmem_reserve_ratio in Documentation/admin-guide/sysctl/vm.rst
> gives much better description of how this field is used and it should be
> the basic of the text here.
> 
I'll change the description as follows:
  The array of the amounts of the memory reserved in this zone for memory
  allocations. For example, if the highest zone a memory allocation can
  allocate memory from is ``ZONE_MOVABLE``, the amount of memory reserved in
  this zone for this allocation is ``lowmem_reserve[ZONE_MOVABLE]`` when
  attempting to allocate memory from this zone. This is a mechanism the page
  allocator uses to prevent allocations which could use ``highmem`` from using
  too much ``lowmem``. For some specialised workloads on ``highmem`` machines,
  it is dangerous for the kernel to allow process memory to be allocated from
  the ``lowmem`` zone. This is because that memory could then be pinned via the
  ``mlock()`` system call, or by unavailability of swapspace.
  ``vm.lowmem_reserve_ratio`` sysctl determines how aggressive the kernel is in
  defending these lower zones. This array is recalculated by
  ``setup_per_zone_lowmem_reserve()`` at runtime if ``vm.lowmem_reserve_ratio``
  sysctl changes.

>> +  This array is recalculated by ``setup_per_zone_lowmem_reserve()`` at runtime
>> +  if ``vm.lowmem_reserve_ratio`` sysctl changes.
>> +
>> +``node``
>> +  The index of the node this zone belongs to. Available only when
>> +  ``CONFIG_NUMA`` is enabled because there is only one zone in a UMA system.
>> +
>> +``zone_pgdat``
>> +  Pointer to the pglist_data of the node this zone belongs to.
> 
>                   ^ ``struct pglist_data``
I'll change it to "Pointer to the ``struct pglist_data`` of the node".

>> +
>> +``per_cpu_pageset``
>> +  Pointer to the Per-CPU Pagesets (PCP) allocated and initialized by
>> +  ``setup_zone_pageset()``. By handling most frequent allocations and frees
>> +  locally on each CPU, the Per-CPU Pagesets improve performance and scalability
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
> 
>                                                 ^ in the zone
> 
I'll replace "system" with "zone".

>> +  ``include/linux/pageblock-flags.h``. The memory is allocated in
>> +  ``setup_usemap()``. Each pageblock occupies ``NR_PAGEBLOCK_BITS`` bits.
>> +  Defined only when ``CONFIG_FLATMEM`` is enabled. The flags is stored in
>> +  ``mem_section`` when ``CONFIG_SPARSEMEM`` is enabled.
>> +
>> +``span_seqlock``
>> +  The seqlock to protect ``zone_start_pfn`` and ``spanned_pages``. It is a
>> +  seqlock because it has to be read outside of ``zone->lock``, and it is done in
>> +  the main allocator path.  But, it is written quite infrequently. Defined only
>> +  when ``CONFIG_MEMORY_HOTPLUG`` is enabled.
>> +
>> +``initialized``
>> +  The flag indicating if the zone is initialized. Set by
>> +  ``init_currently_empty_zone()`` during boot.
>> +
>> +``free_area``
>> +  Free areas of different sizes. It is initialized by ``zone_init_free_lists()``.
> 
> Here I'd love to see more details about what free area is.
> 
I'll update it as follows:
  The array of free areas, where each element corresponds to a specific order
  which is a power of two. The buddy allocator uses this structure to manage
  free memory efficiently. When allocating, it tries to find the smallest
  sufficient block, if the smallest sufficient block is larger than the
  requested size, it will be recursively split into the next smaller blocks
  until the required size is reached. When a page is freed, it may be merged
  with its buddy to form a larger block. It is initialized by
  ``zone_init_free_lists()``.

>> +
>> +``unaccepted_pages``
>> +  The list of pages to be accepted. All pages on the list are ``MAX_PAGE_ORDER``.
>> +  Defined only when ``CONFIG_UNACCEPTED_MEMORY`` is enabled.
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
>> +
>> +``compact_blockskip_flush``
>> +  Set to true when compaction migration scanner and free scanner meet, which
>> +  means the ``PB_migrate_skip`` bits should be cleared.
>> +
>> +``contiguous``
>> +  Set to true when the zone is contiguous (there is no hole).
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
>> base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
>> -- 
>> 2.34.1
>> 
> 

--
Regards,
Jiwen
