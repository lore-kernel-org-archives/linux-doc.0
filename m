Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007BE1078F
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740361420; cv=none; b=aHPU4b8yutSnTS1yukHTo0R0vnhwgKpaRCcClajJsq02k3GWi6UIBmMmI0KT1JXHiuYcfbXGY/DWn5AipbbLrHLyUI3ifS1fMKJbtuRBWN14ghf5ft2sB3Jz9eUfI+Z2Y1zGIz6UiIT9tI1xDFvAJuQrLgsaP82pA76uvFugtLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740361420; c=relaxed/simple;
	bh=OA31MLZOVg1gK0lWRU0egW+63gYQy3vwYm2sS+xeE5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIEqeZc6XdqetfsEaZ+H7Xk97ysVErexKvfBq1p2HOHL7kQki70xVrWiA68s1+0kNx/JEiURg88p2R4C6NE1Bf0WWcG3Gq+7i8XrCa8W1LHgMkhc0Wvtt7N7XjIazwuoebadhOd2wuEi0Nl2D8bNxbiy5CY1eOxB6wjzvCe5CCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpynMQ5Y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpynMQ5Y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220c8cf98bbso86950755ad.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 17:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740361418; x=1740966218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cB4bxYAMQ9VenSnuFbkUpppNf2x/mTeUTjCdr95qJ/c=;
        b=SpynMQ5YBxdc9GG4V1j9A3ebw0iSXXDIRrH7rkvZdE+hK/mq39KdxXWFX3eH2A0BLd
         Uap43wQnc1GdxBKUSN44lpl7MXgxI51ahowcYQihacT2jcYnHxW2+Uf1C7oLI3HUcsj/
         rddQjmMsK1oBe9z46W1AopePDWBj7iWiTTtQvZpuX8dmTKQDLikDj/11Dq0/TL2h0UEs
         uCwc/ewwEXoEe3lcRRyyfaagKQHqXimP6GPr0tdBymasVvPOamHclOWkDS1QQdE3I6PA
         sSLR5TzPNGI9VVa6Hhw1RFUGb6HmRdEyngvbluI4w7iPHnzZDIET/6NcDyA1+0992n65
         URaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740361418; x=1740966218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cB4bxYAMQ9VenSnuFbkUpppNf2x/mTeUTjCdr95qJ/c=;
        b=aWeJNDL0iuv6y1Q6RKn84spbpEKHkjVuq3O5JMZpftoeLzI25Y2cK1aTJkWLKfMgu2
         vKlujVZjTppMoEWzCEc1WpvhxwXx20odwsGWHr5zaJxnd436qNFRn4UJRQJ6SwHmGR2L
         iMgfIGt4/FD/uX87zbcY0sRtLPAcqlVx5C/O7nfJ7K6heeJ9kaPeQA2nMbt3wzh6JeVf
         Z8cHjsQxeO2UHPBOD6KuYQ/0whHXqN3mylMFWUQdAOFrQ7eNmUYIgNxEgke323dQ1whC
         0itfZJ7+WSNmeB16H+oGtnDYsAzHxwZT4hMNnB6U/QwWDn2f1fzl+O/TYMywICm2Rr8x
         +Rvg==
X-Forwarded-Encrypted: i=1; AJvYcCWgyn4qn/pPoj1H4DHE9Dycj5qP/vISHCbpn5WAWQAy9kcOedId5hufqNodvB9OG+YQ0D73Boi2u94=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFN/6QzUl/X6KRuXm5ybI3Kjoy6lgUiA2Uoc1WPDGD7fQP7bCu
	NXS7ebEtuOqdYpvFygtRiQftkaEKhkC9IH1ydvPzGusz+IE8w8IE
X-Gm-Gg: ASbGncseMKKj7mdX3ndb6Oxs6gN8Jit/JTmwfms/RDEu0BiftXS1ssUWGjif4IqksS4
	uexfeHxV3mxPOCNW3FYyPIGDBXLvRh1gdYRHNUlW+iSAWAS6yELCGD7JIx4zKZqYD8oEI9I5vcS
	6ieeZ/bySlkkdhm5XwadaUED3hRaPhAP9V1cGkFXM2LzFvkE98PYlK8yG5KVsCcws6ERuLG/+bn
	+S/pNXcKaYVJaw5jENGlSdXTbhyKh38H41GKg5npqeuVAhRFnNgBEi4jbgkPgNuaEFMBX0JO5fC
	ZR4C+i2v8I/s4ycEpUYPtYAjzw==
X-Google-Smtp-Source: AGHT+IGVzL7zs1RZdDMdsoy/mR5B026KhVJ1hgHKZYTJKivvG7eWwbYnrMwlsUjxzqS3cWuRZtMZvQ==
X-Received: by 2002:a17:903:1cc:b0:220:e336:94e with SMTP id d9443c01a7336-221a0ed738emr170388865ad.15.1740361417725;
        Sun, 23 Feb 2025 17:43:37 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545cff5sm166764945ad.125.2025.02.23.17.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 17:43:36 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 29C864209E40; Mon, 24 Feb 2025 08:43:33 +0700 (WIB)
Date: Mon, 24 Feb 2025 08:43:33 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jiwen Qi <jiwen7.qi@gmail.com>, akpm@linux-foundation.org
Cc: corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] docs/mm: Physical Memory: Populate the "Zones" section
Message-ID: <Z7vOxT7SeO6erBnd@archie.me>
References: <20250223185359.338647-1-jiwen7.qi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9QNy9+WpE7ZOOuNh"
Content-Disposition: inline
In-Reply-To: <20250223185359.338647-1-jiwen7.qi@gmail.com>


--9QNy9+WpE7ZOOuNh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 06:53:59PM +0000, Jiwen Qi wrote:
> Briefly describe what zones are and the fields of struct zone.
>=20

Cc'ing Mike.

> Signed-off-by: Jiwen Qi <jiwen7.qi@gmail.com>
> ---
>  Documentation/mm/physical_memory.rst | 259 ++++++++++++++++++++++++++-
>  1 file changed, 257 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/phys=
ical_memory.rst
> index 71fd4a6acf42..227997694851 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -338,10 +338,265 @@ Statistics
> =20
>  Zones
>  =3D=3D=3D=3D=3D
> +As we have mentioned, each zone in memory is described by a ``struct zon=
e``
> +which is an element of the ``node_zones`` field of the node it belongs t=
o. A
> +zone represents a range of physical memory. A zone may have holes. The
                                          ..., and may have holes.
> +``spanned_pages`` field represents the total pages spanned by the zone,
> +the ``present_pages`` field represents the physical pages existing withi=
n the
; and the ...
> +zone and the managed_page field represents the pages managed by the budd=
y system.
> +
> +Linux uses the GFP flags, see ``include/linux/gfp_types.h``, specified by
                          or (see :ref:`Documentation/core-api/mm-api.rst <=
mm-api-gfp-flags>` for reference on these flags)?
> +a memory allocation to determine the highest zone in a node from which
> +the memory allocation can allocate memory. Linux first allocates memory =
=66rom
                                              The kernel first ...
> +that zone, if Linux can't allocate the requested amount of memory from t=
he zone,
> +it will allocate memory from the next lower zone in the node, the process
> +continues up to and including the lowest zone. For example, if a node co=
ntains
> +``ZONE_DMA32``, ``ZONE_NORMAL`` and ``ZONE_MOVABLE`` and the highest zon=
e of a
> +memory allocation is ``ZONE_MOVABLE``, the order of the zones from which=
 Linux
> +allocates memory is ``ZONE_MOVABLE`` > ``ZONE_NORMAL`` > ``ZONE_DMA32``.
=2E.. from which the kernel allocates ...
> +
> +At runtime, free pages in a zone are in the Per-CPU Pagesets (PCP) or fr=
ee areas
> +of the zone. The Per-CPU Pagesets is pointed by the ``per_cpu_pageset`` =
filed.
> +The free areas is pointed by the ``free_area`` field. The Per-CPU Pagese=
ts are
> +a vital mechanism in the Linux kernel's memory management system. By han=
dling
> +most frequent allocations and frees locally on each CPU, the Per-CPU Pag=
esets
> +improve performance and scalability, especially on systems with many cor=
es. The
> +page allocator in the Linux kernel employs a two-step strategy for memory
> +allocation, starting with the Per-CPU Pagesets before falling back to th=
e buddy
> +allocator. Pages are transferred between the Per-CPU Pagesets and the gl=
obal
> +free areas (managed by the buddy allocator) in batches. This minimizes t=
he
> +overhead of frequent interactions with the global buddy allocator. Free =
areas in
> +a zone are represented by an array of ``free_area``, where each element
> +corresponds to a specific order which is a power of two."
> +
> +Architecture specific code calls free_area_init() to initializes zones.
> +
> +Zone structure
> +--------------
> =20
> -.. admonition:: Stub
> +The zones structure ``struct zone`` is declared in ``include/linux/mmzon=
e.h``.
                                      ... defined in ...
> +Here we briefly describe fields of this structure:
> =20
> -   This section is incomplete. Please list and describe the appropriate =
fields.
> +General
> +~~~~~~~
> +
> +``_watermark``
> +  The watermarks for this zone. The min watermark is the point where boo=
sting is
> +  ignored and an allocation may trigger direct reclaim and direct compac=
tion.
> +  It is also used to throttle direct reclaim. The low watermark is the p=
oint
> +  where kswapd is woken up. The high watermark is the point where kswapd=
 stops
> +  reclaiming (a zone is balanced) when the ``NUMA_BALANCING_MEMORY_TIERI=
NG``
> +  bit of ``sysctl_numa_balancing_mode`` is not set. The promo watermark =
is used
> +  for memory tiering and NUMA balancing. It is the point where kswapd st=
ops
> +  reclaiming when the ``NUMA_BALANCING_MEMORY_TIERING`` bit of
> +  ``sysctl_numa_balancing_mode`` is set. The watermarks are set by
> +  ``__setup_per_zone_wmarks()``. the min watermark is calculated accordi=
ng to
> +  ``vm.min_free_kbytes`` sysctl. The other three watermarks are set acco=
rding
> +  to the distance between two watermarks. The distance is caculated acco=
rding
> +  to ``vm.watermark_scale_factor`` sysctl.
The distance itself is calculated taking ``vm.watermark_scale_factor`` into
account.
> +
> +``watermark_boost``
> +  The number of pages which are used to boost watermarks to increase rec=
laim
> +  pressure to reduce the likelihood of future fallbacks and wake kswapd =
now
> +  as the node may be balanced overall and kswapd will not wake naturally.
> +
> +``nr_reserved_highatomic``
> +  The number of pages which are reserved for high-order atomic allocatio=
ns.
> +
> +``nr_free_highatomic``
> +  The number of free pages in reserved highatomic pageblocks
> +
> +``lowmem_reserve``
> +  The array of the amounts of the memory reserved in this zone for memory
> +  allocations. For example, if the highest zone a memory allocation can
> +  allocate memory from is ``ZONE_MOVABLE``, the amount of memory reserve=
d in
> +  this zone for this allocation is ``lowmem_reserve[ZONE_MOVABLE]`` when
> +  attempting to allocate memory from this zone. The reason is that we do=
n't know
> +  if the memory that we're going to allocate will be freeable or/and it =
will be
> +  released eventually, so to avoid totally wasting several GB of ram we =
must
> +  reserve some of the lower zone memory (otherwise we risk to run OOM on=
 the
> +  lower zones despite there being tons of freeable ram on the higher zon=
es).
> +  This array is recalculated by ``setup_per_zone_lowmem_reserve()`` at r=
untime
> +  if ``vm.lowmem_reserve_ratio`` sysctl changes.
> +
> +``node``
> +  The index of the node this zone belongs to. Available only when
> +  ``CONFIG_NUMA`` is enabled because there is only one zone in a UMA sys=
tem.
> +
> +``zone_pgdat``
> +  Pointer to the pglist_data of the node this zone belongs to.
> +
> +``per_cpu_pageset``
> +  Pointer to the Per-CPU Pagesets (PCP) allocated and initialized by
> +  ``setup_zone_pageset()``. By handling most frequent allocations and fr=
ees
> +  locally on each CPU, the Per-CPU Pagesets improve performance and scal=
ability
                          PCP improves ...
> +  on systems with many cores.
> +
> +``pageset_high_min``
> +  Copied to the ``high_min`` of the Per-CPU Pagesets for faster access.
> +
> +``pageset_high_max``
> +  Copied to the ``high_max`` of the Per-CPU Pagesets for faster access.
> +
> +``pageset_batch``
> +  Copied to the ``batch`` of the Per-CPU Pagesets for faster access. The
> +  ``batch``, ``high_min`` and ``high_max`` of the Per-CPU Pagesets are u=
sed to
> +  calculate the number of elements the Per-CPU Pagesets obtain from the =
buddy
> +  allocator under a single hold of the lock for efficiency. They are als=
o used
> +  to decide if the Per-CPU Pagesets return pages to the buddy allocator =
in page
> +  free process.
> +
> +``pageblock_flags``
> +  The pointer to the flags for the pageblocks in the system. See
> +  ``include/linux/pageblock-flags.h``. The memory is allocated in
(see ``include/linux/pageblock-flags.h`` for flags list).
> +  ``setup_usemap()``. Each pageblock occupies ``NR_PAGEBLOCK_BITS`` bits.
> +  Defined only when ``CONFIG_FLATMEM`` is enabled. The flags is stored in
> +  ``mem_section`` when ``CONFIG_SPARSEMEM`` is enabled.
> +
> +``zone_start_pfn``
> +  The start pfn of the zone. It is initialized by
> +  ``calculate_node_totalpages()``.
> +
> +``managed_pages``
> +  The present pages managed by the buddy system, which is calculated as:
> +  ``managed_pages`` =3D ``present_pages`` - ``reserved_pages``, ``reserv=
ed_pages``
> +  includes pages allocated by the memblock allocator. It should be used =
by page
> +  allocator and vm scanner to calculate all kinds of watermarks and thre=
sholds.
> +  It is accessed using ``atomic_long_xxx()`` functions. It is initialize=
d in
> +  ``free_area_init_core()`` and then is reinitialized when memblock allo=
cator
> +  frees pages into buddy system.
> +
> +``spanned_pages``
> +  The total pages spanned by the zone, including holes, which is calcula=
ted as:
> +  ``spanned_pages`` =3D ``zone_end_pfn`` - ``zone_start_pfn``. It is ini=
tialized
> +  by ``calculate_node_totalpages()``.
> +
> +``present_pages``
> +  The physical pages existing within the zone, which is calculated as:
> +  ``present_pages`` =3D ``spanned_pages`` - ``absent_pages`` (pages in h=
oles). It
> +  may be used by memory hotplug or memory power management logic to figu=
re out
> +  unmanaged pages by checking (``present_pages`` - ``managed_pages``). W=
rite
> +  access to ``present_pages`` at runtime should be protected by
> +  ``mem_hotplug_begin/done()``. Any reader who can't tolerant drift of
> +  ``present_pages`` should use ``get_online_mems()`` to get a stable val=
ue. It
> +  is initialized by ``calculate_node_totalpages()``.
> +
> +``present_early_pages``
> +  The present pages existing within the zone located on memory available=
 since
> +  early boot, excluding hotplugged memory. Defined only when
> +  ``CONFIG_MEMORY_HOTPLUG`` is enabled and initialized by
> +  ``calculate_node_totalpages()``.
> +
> +``cma_pages``
> +  The pages reserved for CMA use. These pages behave like ``ZONE_MOVABLE=
`` when
> +  they are not used for CMA. Defined only when ``CONFIG_CMA`` is enabled.
> +
> +``name``
> +  The name of the zone. It is a pointer to the corresponding element of
> +  the ``zone_names`` array.
> +
> +``nr_isolate_pageblock``
> +  Number of isolated pageblocks. It is used to solve incorrect freepage =
counting
> +  problem due to racy retrieving migratetype of pageblock. Protected by
> +  ``zone->lock``. Defined only when ``CONFIG_MEMORY_ISOLATION`` is enabl=
ed.
> +
> +``span_seqlock``
> +  The seqlock to protect ``zone_start_pfn`` and ``spanned_pages``. It is=
 a
> +  seqlock because it has to be read outside of ``zone->lock``, and it is=
 done in
> +  the main allocator path.  But, it is written quite infrequently. Defin=
ed only
                               However, the seqlock is ...
> +  when ``CONFIG_MEMORY_HOTPLUG`` is enabled.
> +
> +``initialized``
> +  The flag indicating if the zone is initialized. Set by
> +  ``init_currently_empty_zone()`` during boot.
> +
> +``free_area``
> +  Free areas of different sizes. It is initialized by ``zone_init_free_l=
ists()``.
> +
> +``unaccepted_pages``
> +  The list of pages to be accepted. All pages on the list are ``MAX_PAGE=
_ORDER``.
> +  Defined only when ``CONFIG_UNACCEPTED_MEMORY`` is enabled.
> +
> +``flags``
> +  The zone flags. The least three bits are used and defined by
> +  ``enum zone_flags``. ``ZONE_BOOSTED_WATERMARK`` (bit 0): zone recently=
 boosted
> +  watermarks. Cleared when kswapd is woken. ``ZONE_RECLAIM_ACTIVE`` (bit=
 1):
> +  kswapd may be scanning the zone. ``ZONE_BELOW_HIGH`` (bit 2): zone is =
below
> +  high watermark.
> +
> +``lock``
> +  The main lock that protects the internal data structures of the page a=
llocator
> +  specific to the zone, especially protects ``free_area``.
> +
> +``percpu_drift_mark``
> +  When free pages are below this point, additional steps are taken when =
reading
> +  the number of free pages to avoid per-cpu counter drift allowing water=
marks
> +  to be breached. It is updated in ``refresh_zone_stat_thresholds()``.
> +
> +Compaction control
> +~~~~~~~~~~~~~~~~~~
> +
> +``compact_cached_free_pfn``
> +  The PFN where compaction free scanner should start in the next scan.
> +
> +``compact_cached_migrate_pfn``
> +  The PFNs where compaction migration scanner should start in the next s=
can.
> +  This array has two elements, the first one is used in ``MIGRATE_ASYNC`=
` mode,
> +  the other is used in ``MIGRATE_SYNC`` mode.
This array has two elements: the first one is ..., and the other one is ...
> +
> +``compact_init_migrate_pfn``
> +  The initial migration PFN which is initialized to 0 at boot time, and =
to the
> +  first pageblock with migratable pages in the zone after a full compact=
ion
> +  finishes. It is used to check if a scan is a whole zone scan or not.
> +
> +``compact_init_free_pfn``
> +  The initial free PFN which is initialized to 0 at boot time and to the=
 last
> +  pageblock with free ``MIGRATE_MOVABLE`` pages in the zone. It is used =
to check
> +  if it is the start of a scan.
> +
> +``compact_considered``
> +  The number of compactions attempted since last failure. It is reset in
> +  ``defer_compaction()`` when a compaction fails to result in a page all=
ocation
> +  success. It is increased by 1 in ``compaction_deferred()`` when a comp=
action
> +  should be skipped. ``compaction_deferred()`` is called before
> +  ``compact_zone()`` is called, ``compaction_defer_reset()`` is called w=
hen
> +  ``compact_zone()`` returns ``COMPACT_SUCCESS``, ``defer_compaction()``=
 is
> +  called when ``compact_zone()`` returns ``COMPACT_PARTIAL_SKIPPED`` or
> +  ``COMPACT_COMPLETE``.
> +
> +``compact_defer_shift``
> +  The number of compactions skipped before trying again is
> +  ``1<<compact_defer_shift``. It is increased by 1 in ``defer_compaction=
()``.
> +  It is reset in ``compaction_defer_reset()`` when a direct compaction r=
esults
> +  in a page allocation success. Its maximum value is ``COMPACT_MAX_DEFER=
_SHIFT``.
> +
> +``compact_order_failed``
> +  The minimum compaction failed order. It is set in ``compaction_defer_r=
eset()``
> +  when a compaction succeeds and in ``defer_compaction()`` when a compac=
tion
> +  fails to result in a page allocation success.
> +
> +``compact_blockskip_flush``
> +  Set to true when compaction migration scanner and free scanner meet, w=
hich
> +  means the ``PB_migrate_skip`` bits should be cleared.
> +
> +``contiguous``
> +  Set to true when the zone is contiguous (there is no hole).
                                             (in other words, no hole).
> +
> +Statistics
> +~~~~~~~~~~
> +
> +``vm_stat``
> +  VM statistics for the zone. The items tracked are defined by
> +  ``enum zone_stat_item``.
> +
> +``vm_numa_event``
> +  VM NUMA event statistics for the zone. The items tracked are defined by
> +  ``enum numa_stat_item``.
> +
> +``per_cpu_zonestats``
> +  Per-CPU VM statistics for the zone. It records VM statistics and VM NU=
MA event
> +  statistics on a per-CPU basis. It reduces updates to the global ``vm_s=
tat``
> +  and ``vm_numa_event`` fields of the zone to improve performance.
> =20
>  .. _pages:
> =20
>=20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--9QNy9+WpE7ZOOuNh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7vOwAAKCRD2uYlJVVFO
o+MfAQDaNST5lw7YfNFlVcVoZNGpu/wkMLCFZB/RpCiXLhM+ngEA6mit48MAhz17
45JBdAOwNrcbV72aNvl1nLue8KdZogM=
=lSy7
-----END PGP SIGNATURE-----

--9QNy9+WpE7ZOOuNh--
