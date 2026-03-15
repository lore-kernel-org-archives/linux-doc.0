Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A9231830
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606699; cv=none; b=nVQCpzSCbq0xSToBKNAO0Wep69ta4XWryA3iljQ5M/amUwdiDJAA25Bzt/UG/s3+EfCfBg8AILGDnMuxxuP3vKeR4qyD6HbS7pfeYnvEzZ3NtGsu0yLC0MU/Q+n/FyM9E8EVacJ7UBhCqb3Au/VQcK4bp45J4pIA37A80mBwrPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606699; c=relaxed/simple;
	bh=Vbd5cPi6DGWcwTyjcTv64Xb+7YxCsKk+bXPAu3e423s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cNvzbB7tbm1It4gpRLePf0osmD0ANr/z6I3ew+4QdyO6oEayBYFJapB3v0CXdExDxbiYI0lIeTIL74b7hMA7d2zkWNPuzErhI4AYuakUGDauBz+aWHxWqnvftF3YURoopu0XI+LIDVKtmj+xyjC5ykrZLq6GIBmGUZ6rqJNzlVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WwRzPuLl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WwRzPuLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937F0C4CEF7;
	Sun, 15 Mar 2026 20:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773606699;
	bh=Vbd5cPi6DGWcwTyjcTv64Xb+7YxCsKk+bXPAu3e423s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WwRzPuLlxeTz/W+gVhRV4mbUEhu6ulzYBLI6tIheDGHkjifenibuWYbhHtC1KdyCD
	 hJQYukTyf0Qd1ntLiKdk1PtMLfJkbYehGAXFz5aYCvqXtUdpisOZ44OAVKcoCmrDV0
	 nvVsNFvjjdE0OXwT1EQmbwseJkDbnm4yDDXYctQ3YiCLBI69k1VX3a+BXJXA1U3Mg6
	 7Bnj8MWA+c429prsbd8nMyzSSDXSxXM3QpKzavYS2KhVWJLRFA4J5Gl0xfESPQWl0W
	 UBv/1w8LW9UxEQWYrdxPqGNcVt2Zq1qOKKVkHAvJMKH/JjGFsC9Xh5jai1Gxn7/2Xi
	 5ihf2oAPShWGg==
Date: Sun, 15 Mar 2026 20:31:35 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document Virtually Contiguous Memory Allocation
Message-ID: <9f4d7c12-a01f-4046-91fa-dd70c0d7a564@lucifer.local>
References: <20260314152532.100411-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314152532.100411-1-xaum.io@gmail.com>

NAK because AI slop again obviously.

BTW we don't capitalise the first letter of subject lines. Even 5 minutes
glance at the mailing list would tell you that, and it's _yet more_
evidence for this being low-effort AI slop.

Even the patch subject line screams LLM-generated - and why are you
capitalising it as if vmalloc is abbreviated VCMA?...

Again you've not looked up who to cc- for this, you've got Claude to
generate a useless commit message so you demonstrate no understanding, the
documentation is pointless handwaving, etc.

On Sat, Mar 14, 2026 at 04:25:32PM +0100, Kit Dallege wrote:
> Fill in the vmalloc.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/vmalloc.rst | 128 +++++++++++++++++++++++++++++++++++
>  1 file changed, 128 insertions(+)
>
> diff --git a/Documentation/mm/vmalloc.rst b/Documentation/mm/vmalloc.rst
> index 363fe20d6b9f..2c478b341e73 100644
> --- a/Documentation/mm/vmalloc.rst
> +++ b/Documentation/mm/vmalloc.rst
> @@ -3,3 +3,131 @@
>  ======================================
>  Virtually Contiguous Memory Allocation
>  ======================================
> +
> +``vmalloc()`` allocates memory that is contiguous in kernel virtual address
> +space but may be backed by physically discontiguous pages.  This is useful

May be backed?...

> +for large allocations where finding a contiguous physical range would be
> +difficult or impossible.  The implementation is in ``mm/vmalloc.c``.

Is this the only time we use it?

Kernel stacks are vmalloc()'d but a grep shows 0 results.

Also kvmalloc() shows zero results.

This is just useless AI slop handwaving that would need a total rewrite by
maintainers, so what use is this 'contribution'?

> +
> +.. contents:: :local:
> +
> +How It Works
> +============
> +
> +A vmalloc allocation has three steps: reserve a range of kernel virtual
> +addresses, allocate physical pages (individually, via the page allocator),
> +and create page table mappings that connect the two.
> +
> +Virtual Address Management
> +--------------------------
> +
> +The kernel reserves a large region of virtual address space for vmalloc
> +(on x86-64 this is hundreds of terabytes).  Within this region, allocated

I love that you (read Claude) are vague about 'hundreds of terabytes', you
can literally see how much for 4 level and 5 level page tables...

Etc. etc.

> +and free ranges are tracked by ``struct vmap_area`` nodes organized in two
> +red-black trees — one sorted by address for the busy areas, and one
> +augmented with subtree maximum gap size for the free areas.  The augmented
> +tree allows free-space searches in O(log n) time.
> +
> +Each allocated area also has a ``struct vm_struct`` that records the
> +virtual address, size, array of backing ``struct page`` pointers, and flags
> +indicating how the area was created (``VM_ALLOC`` for vmalloc,
> +``VM_IOREMAP`` for I/O mappings, ``VM_MAP`` for vmap, etc.).
> +
> +Guard Pages
> +-----------
> +
> +By default, each vmalloc area is surrounded by a guard page — an unmapped
> +page that causes an immediate fault if code overruns the allocation.  This
> +costs one page of virtual address space (not physical memory) per
> +allocation.  The ``VM_NO_GUARD`` flag disables this for internal users that
> +manage their own safety margins.
> +
> +Huge Page Support
> +-----------------
> +
> +On architectures that support it, vmalloc can use PMD- or PUD-level

Yeah no need to mention what PMD or PUD are...

> +mappings instead of individual PTEs, reducing TLB pressure for large
> +allocations.  ``vmalloc_huge()`` requests this explicitly.  The decision
> +is per-architecture: each architecture provides callbacks
> +(``arch_vmap_pmd_supported()``, ``arch_vmap_pud_supported()``) to indicate
> +which levels are available.
> +
> +Even when huge pages are requested, the allocator falls back to base pages
> +transparently if the physical pages cannot be allocated at the required
> +alignment.
> +
> +Lazy TLB Flushing
> +-----------------
> +
> +Unmapping a vmalloc area requires a global TLB flush (IPI to all CPUs) to
> +ensure no stale translations remain.  To amortize this cost, vmalloc defers
> +the flush: page table entries are cleared immediately but the TLB
> +invalidation is batched across multiple frees.  The flush is forced when
> +the free area needs to be reused or when ``vm_unmap_aliases()`` is called
> +explicitly.
> +
> +Per-CPU Allocations
> +-------------------
> +
> +The per-CPU allocator uses vmalloc internally to obtain virtually
> +contiguous backing for per-CPU variables across all CPUs.  It allocates
> +multiple vmalloc areas with specific size and alignment requirements in a
> +single call, ensuring that each CPU's copy is at a consistent offset from
> +the per-CPU base.
> +
> +vmap and Temporary Mappings
> +===========================
> +
> +Besides vmalloc (which allocates both virtual space and physical pages),
> +the subsystem provides two related mechanisms:
> +
> +- **vmap/vunmap**: maps an existing array of ``struct page`` pointers into
> +  contiguous kernel virtual space.  This is used when pages have already
> +  been allocated (e.g., by a device driver) and just need a contiguous
> +  kernel mapping.
> +
> +- **vm_map_ram/vm_unmap_ram**: lightweight temporary mappings for
> +  short-lived use, with lower overhead than full vmap.
> +
> +Freeing
> +=======
> +
> +``vfree()`` can be called from any context, including interrupt handlers.
> +When called from interrupt context the actual work (page table teardown,
> +TLB flush, page freeing) is deferred to a workqueue.  This is safe because
> +the virtual address range is immediately removed from the busy tree, so no
> +new mappings can be created in the freed region.
> +
> +Page Table Management
> +=====================
> +
> +vmalloc maintains its own kernel page tables to map virtual addresses to
> +the backing physical pages.  On allocation, page table entries are created
> +at the appropriate level (PTE, PMD, or PUD depending on huge page support).
> +On free, the entries are cleared.
> +
> +The page table setup must handle architectures where the kernel page tables
> +are not shared across all CPUs.  On such systems, a vmalloc fault mechanism
> +lazily propagates new mappings: when a CPU accesses a vmalloc address for
> +the first time and takes a fault, the fault handler copies the page table
> +entry from the reference page table (init_mm) into the CPU's page table.
> +
> +NUMA Awareness
> +==============
> +
> +By default, vmalloc allocates physical pages from any NUMA node.  The
> +``vmalloc_node()`` and ``vzalloc_node()`` variants prefer a specific node,
> +which is useful for data structures that are predominantly accessed from
> +one node.  The pages are still mapped into the global kernel virtual
> +address space, so they remain accessible from all CPUs regardless of
> +which node they were allocated from.
> +
> +KASAN Integration
> +=================
> +
> +When KASAN (Kernel Address Sanitizer) is enabled with
> +``CONFIG_KASAN_VMALLOC``, vmalloc allocates shadow memory to track the
> +validity of each vmalloc region.  The shadow memory is itself vmalloc'd
> +and mapped lazily.  This allows KASAN to detect out-of-bounds accesses
> +and use-after-free bugs in vmalloc'd memory, which is particularly useful
> +for catching bugs in kernel modules (whose code and data are vmalloc'd).
> --
> 2.53.0
>
>
>
