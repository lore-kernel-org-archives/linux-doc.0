Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1B3125A9
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773606014; cv=none; b=dQEqey14jOIYiAqFl5D5Pk/uxlR5Dv2yF5q89D4FsXbBqIFDETaAAZ7qx2PNJ0Fyp7Wuh7Oou/9/NwFNHhPFwOUu+Nl2oKWbPR1Hh0eht+lG6HmO9LcEAkBFVfREu3fxh6sbaGGeE2VGVS8HS1xFX8hRtIbTO57nvjtit7NLmRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773606014; c=relaxed/simple;
	bh=ADS+D532xAxun/YgHvZWAlDeIQk/4CVDyRfYy5VQM1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxgnsBHZtTEAjzc/huw1vymUxyshBF4UtoJSLaIoKNHW07iiUhJx8ywO4X49YFL59P2zO6XHPNX0Uuiegy20W1zCdnTB/Ea3hBI9fLogIKnHfon6gU+KwIqXl00bEHaWau3dQwwqrUCx8IF+jxigmt02QNhez2gAlvSOjPL+gT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cLgeMeqd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cLgeMeqd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB184C4CEF7;
	Sun, 15 Mar 2026 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773606014;
	bh=ADS+D532xAxun/YgHvZWAlDeIQk/4CVDyRfYy5VQM1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cLgeMeqd0WyKkAZ6Q4pm5lvHiMmhL2Iy0sjF8d9kMcb0LroCLd8IhOEJC7A0WxtUN
	 UaB1K0Gp+1io06h/NX0H98DFY4I6bgTm27aopzxey71DUb5KBjHd5GI4wuRiD1SZkl
	 Pnr1crgkO+lJtZk27ZPSHAsg6CHT+tCqBjy4e2NnS6InpfEFGYPO4DfKcVukSUz401
	 2hwYQtCP1EzoI/zZ/xcuciMiwu8plo/Rfb9/qBV0Vz5QUCs0BA8SiRnGlgMIWu+2Rl
	 9cPyyPZe2Wu7SHoov0CVfU/jxNZcPKNFJYDQVQ5gM3K78DQC4MKRrEu6PKdn7eDtME
	 Ftu7U0V38dGbw==
Date: Sun, 15 Mar 2026 20:20:11 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Kit Dallege <xaum.io@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, corbet@lwn.net, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Docs/mm: document Swap
Message-ID: <9c842f9f-b039-45ad-a80d-3e48c8fd3ba5@lucifer.local>
References: <20260314152536.100531-1-xaum.io@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260314152536.100531-1-xaum.io@gmail.com>

NAK.

Again, you've not even bothered checking MAINTAINERS to see who
maintains/reviews swap to cc them, your commit message is cookie-cutter,
and you've demonstrated zero understanding of what you're writing about.

A quick glance suggests the 'documentation' is pointless handwaving
too. This is not worth maintainer time.

Also you've not even bothered to see how patches are sent and so have sent
all these documentation patches separately which SCREAMS 'I just got Claude
to do everything, and maybe I had a cursary glance at it'.

We do NOT want this thanks.

On Sat, Mar 14, 2026 at 04:25:36PM +0100, Kit Dallege wrote:
> Fill in the swap.rst stub created in commit 481cc97349d6
> ("mm,doc: Add new documentation structure") as part of
> the structured memory management documentation following
> Mel Gorman's book outline.
>
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/mm/swap.rst | 154 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>
> diff --git a/Documentation/mm/swap.rst b/Documentation/mm/swap.rst
> index 78819bd4d745..89a93cc081d4 100644
> --- a/Documentation/mm/swap.rst
> +++ b/Documentation/mm/swap.rst
> @@ -3,3 +3,157 @@
>  ====
>  Swap
>  ====
> +
> +Swap allows the kernel to evict anonymous pages (those not backed by a
> +file) to a swap device so that physical memory can be reused.  When the

This is useless tautology.

> +pages are needed again, they are read back in.  The swap subsystem spans

This is useless handwaving.

> +several files: ``mm/swapfile.c`` manages swap devices, ``mm/swap_state.c``
> +implements the swap cache, ``mm/page_io.c`` handles disk I/O, and
> +``mm/zswap.c`` provides an optional compressed cache layer.

Yeah who cares about page faults around swap, or softleaves (zero mentions)
or data structures or etc. etc.

I mean I won't go on.

> +
> +.. contents:: :local:
> +
> +Swap Entries
> +============
> +
> +A swap entry is a compact identifier that encodes which swap device to use
> +and the offset within that device.  When a page is swapped out, its page
> +table entry is replaced with a swap entry so that the kernel knows where to

'Page table entry'... At which level?

> +find the data on a subsequent fault.  Swap entries are also used internally
> +as keys into the swap cache.
> +
> +Swap Devices
> +============
> +
> +A swap device is a disk partition or file registered with the ``swapon()``
> +system call.  Each device is described by a ``swap_info_struct`` that holds
> +the device's extent map, cluster state, and per-CPU allocation hints.
> +
> +The kernel maps virtual swap offsets to disk locations through a tree of
> +``swap_extent`` structures.  For raw partitions the mapping is trivial
> +(one extent covering the whole device); for swap files the mapping follows
> +the file's block layout on disk.
> +
> +Cluster Allocation
> +------------------
> +
> +Swap space is allocated in clusters (groups of contiguous slots, typically
> +32 pages).  Each cluster tracks which slots are free and whether it has
> +pending discards.  Per-CPU hints point to the most recently used cluster
> +so that allocations from the same CPU tend to land in the same cluster,
> +improving spatial locality for both SSDs and spinning disks.
> +
> +When a cluster is full, the allocator scans for a new one.  Under heavy
> +swap pressure, it may also reclaim slots from full clusters if the pages
> +they reference have since been freed or swapped back in.
> +
> +TRIM / Discard
> +--------------
> +
> +For SSD-backed swap, the kernel can issue discard (TRIM) commands when
> +swap slots are freed.  This is batched per-cluster: once all slots in a
> +cluster are free, a single discard is issued for the entire range.  This
> +avoids the overhead of per-page discards while still informing the device
> +that the blocks are unused.
> +
> +Swap counts
> +-----------
> +
> +Each swap slot has a reference count tracking how many page table entries
> +point to it (due to ``fork()`` and copy-on-write).  For slots referenced
> +by very many processes, a continuation mechanism extends the counter
> +beyond its inline capacity.
> +
> +Swap Cache
> +==========
> +
> +The swap cache keeps recently swapped-in (or about to be swapped-out)
> +pages in memory, indexed by their swap entry.  This serves several
> +purposes:
> +
> +- **Deduplication**: when multiple processes share a swapped page (via
> +  ``fork()``), only one copy is read from disk; subsequent faults find
> +  the page in the swap cache.
> +- **Write coalescing**: if a page is modified and swapped out again before
> +  the previous write completes, the swap cache absorbs the update without
> +  issuing a new write.
> +- **Readahead**: when one page is swapped in, adjacent swap entries are
> +  speculatively read to exploit spatial and temporal locality.
> +
> +The swap cache is implemented as a per-cluster array of pointers
> +(the "swap table"), providing O(1) lookup by swap entry.
> +See also Documentation/mm/swap-table.rst.
> +
> +Readahead
> +---------
> +
> +Swap readahead pre-fetches pages from swap before they are faulted in.
> +Two strategies are used:
> +
> +- **Cluster readahead**: reads a window of swap entries around the faulting
> +  entry, betting on spatial locality in the swap device.
> +- **VMA readahead**: uses the virtual address layout to predict which swap
> +  entries will be needed next, which is more effective when the access
> +  pattern follows the process's address space layout rather than the swap
> +  device layout.
> +
> +``vm.page-cluster`` controls the readahead window size (as a power of two).
> +
> +Compressed Swap (zswap)
> +=======================
> +
> +zswap (``mm/zswap.c``) is an optional write-behind compressed cache that
> +sits between the reclaim path and the swap device.  When reclaim evicts a
> +page, zswap attempts to compress it and store the compressed data in a
> +RAM-based pool (using the zsmalloc allocator).
> +
> +If the page is faulted back in before the pool fills, no disk I/O occurs —
> +the page is decompressed directly from memory.  This is significantly
> +faster than reading from even an SSD.
> +
> +Pool Management
> +---------------
> +
> +Each zswap pool pairs a compression algorithm (lzo, lz4, zstd, etc.) with
> +a zsmalloc memory pool.  Per-CPU compression contexts avoid lock
> +contention during compression and decompression.
> +
> +When the pool reaches its size limit (controlled by
> +``/sys/module/zswap/parameters/max_pool_percent``), the oldest entries are
> +evicted: zswap writes them out to the backing swap device, falling back to
> +the normal swap I/O path.  An LRU list tracks entries for this purpose.
> +
> +Writeback
> +---------
> +
> +zswap writeback decompresses the page, allocates a swap slot, and writes
> +the uncompressed page to the swap device.  This is the slow path —
> +ideally most pages are either faulted back in from the compressed cache
> +or freed without ever reaching disk.
> +
> +Zero-Filled Pages
> +=================
> +
> +``mm/page_io.c`` maintains a bitmap (``swap_zeromap``) tracking swap slots
> +that contained zero-filled pages.  When such a page is swapped in, the
> +kernel returns a zeroed page without performing any I/O.  When a zero
> +page is swapped out, the bitmap bit is set instead of issuing a write.
> +This optimization is significant for workloads that allocate large amounts
> +of memory that is never written to.
> +
> +Swap I/O
> +========
> +
> +``mm/page_io.c`` handles the mechanics of reading and writing pages to
> +swap.  The I/O path checks three layers in order before falling through to
> +disk:
> +
> +1. The zero page bitmap — if the slot is known to be zero-filled, return
> +   a zeroed page (read) or set the bit (write) with no I/O.
> +2. zswap — if enabled, attempt to store/load the page in the compressed
> +   cache.
> +3. Block I/O — submit a bio to the swap device, using the swap extent
> +   tree to map the slot to a disk sector.
> +
> +For swap files (as opposed to raw partitions), the I/O follows the
> +filesystem's block mapping rather than issuing direct device I/O.
> --
> 2.53.0
>
>
>
