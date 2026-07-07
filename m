Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6149E385D8B
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 06:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407423; cv=none; b=FLcNjELSTOp1MtOtrU/GEVwE+Mv+qMYhf1l/o5+LP0K192ESthZObBjTMy7GsXPrYr9HXPldObajGKQNSjjHtc8gDCiAJp4A1RAAqZd0SYDPLdWXElCIFw+ckNoBI+UBWhn6Ip9JAa/XQCpopjqleyQm+7FY2dCzMnI4Q341S1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407423; c=relaxed/simple;
	bh=Yn6Q+8GnYlNXJzkpUayPJQNdvcW7QhLJ7slDTUH0s5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BoZPryAD3bAXPsQ38M23Vi53cKzzOmz2YKVtuaI0cWZI2M2Xq+cUlRAqXnw+hlkOLSr22jw9OrYZV/gR06KjtRZx/Y3F4ZJPZmFsw6jPpWx5Kd53mx6JYy85sFa+JpOMZC++W3cGKlueti3QD0sVAgKw6Ac7Ebtohw7b8BLCjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A47IAmZm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LqaJ/riC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A47IAmZm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LqaJ/riC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783407421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c0FBWE8Jb5+vMlrP70d2roSOjCV4VZTmyKyzdZd5y78=;
	b=A47IAmZm7FeS/wJVPxxVj7fHbJUZOlQ897si8dDMrjWMNFZXfldeznOxqpnO6tESzQSA9U
	AoNy6XEVfCDsRpkaW+g3kaghqdSDosaA9dWIQXlQzJ4wHXfnyTLTHWS19A+iKJDYDhdNqR
	HC3B+R1q3l7PIkaqoRBxJU8XH+tVh40=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-rkBeaJ-hMRqRp3egiJN2KQ-1; Tue, 07 Jul 2026 02:57:00 -0400
X-MC-Unique: rkBeaJ-hMRqRp3egiJN2KQ-1
X-Mimecast-MFC-AGG-ID: rkBeaJ-hMRqRp3egiJN2KQ_1783407419
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-493bf840a69so27535395e9.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 23:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783407419; x=1784012219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0FBWE8Jb5+vMlrP70d2roSOjCV4VZTmyKyzdZd5y78=;
        b=LqaJ/riCRO/ceVIxkCsWnOgcLb4+3lgVyIf5E2cZzvP5D+TRSpkgD9gY+om4ERKLfs
         QIhaCsTW1+LxjOG4V6p6ZPJiPEmuVu5i6u/oBSzzf+TNT0T/SuASE+q+iCAtYQMq8AJA
         KDGWGMpJFBvTYOC7WdWiLQpKwxC8e0E7a/zTqDKVFDCMfFSUwindfdmNHnOAoQC8+1n+
         tdpSzou45uumEfxd3MkjF4JQFHx4yv4YAlB9yuGcx+BFVMXHg8NHwjB8UpVRcc0q99Uf
         rvwlKSv5TAWwXO5QQj1GsAdnPJRMBh7nG1cmg9/805bFVK588PXo2yJ0dfKED0p0JU3a
         lyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783407419; x=1784012219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0FBWE8Jb5+vMlrP70d2roSOjCV4VZTmyKyzdZd5y78=;
        b=e5jvkcYP1hyOKfJWfG8wSpSX9oo6cSrDXLFgfp8Y/gR0Fs8lWEd8TT/zr6gN5JN9J4
         3a7/yqfBSmj9qzyh2RzGgS7GLqpKEaxRWbfJ7AzO0RQji51S/x/UGHamReBHuoJY7ZiC
         Rt5X0gDfAVOQqThnv386P7MNfU2bda0y4ZFsTNWqCced/P4xQB8Ukr6uwjfMfpZJadOl
         K0GhSm/KaGHm69+EFdudfOfEhCQMTYAXy9BxojcYamPzi5HVAtdSdMf9jwaf2lSDicgx
         I8EkD14phXAatcdpfc2LXdcYIkvAqM0sxw3i19Jo4O5icW2p17qNyKcnHhtnLfpxfTfT
         EmoQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMPnukMAEQRPeekUceF7X6EqlGuIZ4hVZQmz6JbraSRKHNlk/DFppIWPof0ivej52sEpTDhLMPecc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JuhimOThc52HhsLuvfYzHdGDCliAPd3rX9uWuwaV++cAsLoZ
	nR2f4pe/cP73+iQof3HJ305S46Bmr2f9Fiz8FIneqMTUdDAHcnNJR4XJtQ4GKzNEvCA9bGxdIPI
	ZY2aNyJC+15th7H134g1PPRlyyJjNesQCtGm+raR1zQHt6y7yylr4kHL4UXT70g==
X-Gm-Gg: AfdE7cnbnEnq53LTuSMLzsKxhjsSrx44TSF3W05GH3Clta6qeHa+zNY1IL1BS2gHdSE
	ELUGbVd26HfrIoXbMOKTGQtjzkVwSH+xsmV3io0ZV8JE5CdepaDA9Ewyzm/Xs4PoiiZY3Ka6fqW
	1aYNpPPP9iwCZo9asDX9zMI5+oKU2dZ+mmatNzMJ5RRgnvGFvQ6wMnPtnujd+tQVMrjwUCh0nTU
	genaQHxustN4uLTugIfAxUzdkwoxiU1J8MGVBYz/CqpZ12q0Jp9Q50iYjPo2jKI3z0adaZdOICE
	cvL4W+cleV4ZAJjGCHG/FC9dRNha/KNp4RrC18zIZLlMtHi2fFPfGhJqams5JrNvqGofXsd9zVj
	bQBnvajK0VgOR/WTSUuH4y59kyWasmlat
X-Received: by 2002:a05:600c:83c9:b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-493df040597mr40628295e9.10.1783407418842;
        Mon, 06 Jul 2026 23:56:58 -0700 (PDT)
X-Received: by 2002:a05:600c:83c9:b0:493:bc31:b2ae with SMTP id 5b1f17b1804b1-493df040597mr40628075e9.10.1783407418369;
        Mon, 06 Jul 2026 23:56:58 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm30919825e9.14.2026.07.06.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 23:56:57 -0700 (PDT)
Date: Tue, 7 Jul 2026 02:56:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sourav Panda <souravpanda@google.com>
Cc: muchun.song@linux.dev, osalvador@suse.de, akpm@linux-foundation.org,
	david@kernel.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, mhklinux@outlook.com, fvdl@google.com,
	gthelen@google.com, mike.kravetz@oracle.com,
	pasha.tatashin@soleen.com, rientjes@google.com, riel@surriel.com,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] mm/hugetlb: Dynamic, NUMA-aware HugePage Cache &
 Free Page Reporting
Message-ID: <20260707024744-mutt-send-email-mst@kernel.org>
References: <20260707064235.1386552-1-souravpanda@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707064235.1386552-1-souravpanda@google.com>

On Tue, Jul 07, 2026 at 06:42:29AM +0000, Sourav Panda wrote:
> Overview
> This patch series introduces a dynamic, NUMA-aware HugePage Cache,
> backed by a kernel shrinker to safely return memory under pressure, and
> integrates it with Free Page Reporting (virtio-balloon) for HugeTLB,
> specifically targeting gigantic (1GB) hugepages. The goal is to solve
> the tradeoff between allocation latency and memory
> fungibility in virtualized and heterogeneous cloud environments.
> 
> ---
> 
> The Core Problem: Allocation Latency vs. Memory Fungibility
> 
> With highly heterogeneous workloads, latency-critical applications demand
> gigantic hugepages. However, dynamic runtime allocation of 1GB pages
> from the buddy allocator (via CMA) is slow.
> 
> To bypass this latency, operators often pre-allocate hugepages
> statically. However, this locks up the memory: when the HugeTLB
> workloads are idle, that memory is completely unavailable for other
> buddy-allocator workloads (e.g., page cache, anonymous memory). If buddy
> memory is exhausted, the system will OOM even if gigabytes of HugeTLB
> pages are sitting idle.
> 
> This series resolves this challenge by delivering Dynamic Fungibility:
> 
> 1.  Dynamic Caching: Intercepts freed surplus hugepages and recycles
>     them into a NUMA-aware cache instead of dissolving them immediately.
> 2.  Fast Allocations: Satisfies subsequent dynamic allocations
>     instantly from this warm, local hugepage cache.
> 3.  Kernel Shrinker Integration: Registers a NUMA-aware kernel shrinker
>     to dynamically dissolve cached pages back to the buddy allocator
>     under memory pressure, restoring host/guest memory fungibility.
> 4.  Free Page Reporting Integration: For virtualized environments (Guest
>     VMs),

I was going to look into this part, thanks for working on this.

> cached pages trigger background Free Page Reporting via
>     virtio-balloon. This allows the host to reclaim the physical memory
>     while the guest retains its Vmemmap Optimization (HVO) metadata
>     savings (~14GB saved per 1TB VM)!

Why "!" - that's 1.5%, seems surprisingly modest.
Are you sure it's working as intended?

>   +---------------+   Slow Allocate  +---------------------+
>   | Buddy         | ---------------> | Active HugeTLB Page |
>   | Allocator     |                  +---------------------+
>   +---------------+                    |                ^
>     ^                                  | (1) Free to    | (2) Fast
>     | (3) Under                        v     Cache      |     Allocate
>     | Pressure                       +---------------------+
>     | Shrink()  <------------------- | HugeTLB Cache       |
>                                      +---------------------+
>                                        |
>                                        v (4) Free Page Reporting
>                                          (Host Reclaim in the case
>                                           of virtualization)
> 
> ---
> 
> Patch Series Structure
> 
> Patch 1/6: mm/hugetlb: add Kconfig and basic cache infrastructure
>   - Introduces the CONFIG_HUGETLB_CACHE option, hstate tracking fields,
>     and the HPG_cached page flag.
>   - Establishes the clean helper API (hugetlb_folio_is_cached(),
>     hugetlb_cache_remove(), hugetlb_cache_add()) and updates
>     remove_hugetlb_folio() to be cache-aware, eliminating inline #ifdef
>     blocks.
> Patch 2/6: mm/hugetlb: implement cache recycling and allocation
>   - Hooks up recycling in free_huge_folio() (up to the cache limit) and
>     allocation in alloc_surplus_hugetlb_folio().
>   - Implements MRU allocation policy for maximum warmth, poison safety
>     checks, and MTE/dcache cleaning.
> Patch 3/6: mm/hugetlb: add sysfs interfaces for cache
>   - Exposes global and per-node sysfs attributes (max_cached_huge_pages,
>     nr_cached_hugepages) for dynamic userspace control, including NUMA
>     memory policy scaling.
>   - Supports dynamic delta adjustments (+1/-1) to safely scale cache
>     sizes alongside concurrent background reclaim operations.
> Patch 4/6: mm/hugetlb: add memory shrinker for cache
>   - Registers a NUMA-aware kernel shrinker to evict and dissolve cached
>     gigantic pages back to buddy under memory pressure.
> Patch 5/6: Documentation/admin-guide/mm/hugetlbpage.rst: document cache
>     interfaces
>   - Documents the Kconfig option, sysfs attributes, and shrinker
>     behavior in the admin guide.
> Patch 6/6: mm/hugetlb: support free page reporting for cached hugepages
>   - Integrates the cache with the Free Page Reporting framework (virtio-
>     balloon), introducing the HPG_reported flag and the
>     reporting/isolation/draining lifecycle.
> Sourav Panda (6):
>   mm/hugetlb: add Kconfig and basic cache infrastructure
>   mm/hugetlb: implement cache recycling and allocation
>   mm/hugetlb: add sysfs interfaces for cache
>   mm/hugetlb: add memory shrinker for cache
>   Documentation/admin-guide/mm/hugetlbpage.rst: document cache
>     interfaces
>   mm/hugetlb: support free page reporting for cached hugepages
> 
>  Documentation/admin-guide/mm/hugetlbpage.rst |  34 +-
>  fs/Kconfig                                   |   9 +
>  include/linux/hugetlb.h                      |  45 ++
>  include/linux/page_reporting.h               |   1 +
>  mm/hugetlb.c                                 | 590 ++++++++++++++++++-
>  mm/hugetlb_internal.h                        |   9 +
>  mm/hugetlb_sysfs.c                           | 158 +++++
>  mm/page_reporting.c                          |  10 +-
>  mm/page_reporting.h                          |   6 +
>  9 files changed, 844 insertions(+), 18 deletions(-)
> 
> -- 
> 2.55.0.rc0.799.gd6f94ed593-goog

