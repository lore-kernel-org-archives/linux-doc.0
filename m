Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3641C261B9E
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501933; cv=none; b=EPxQWaGw24Z8gsGsqOW69RHhzKt5MO7bZV5KmuH6v+pX6/3CETPZcXLtn2cR41gwlNxqO6WXXqwnLYTew83A/jd/sZ9v1k0zN+Bw0ySrJOOkOHqW3PLzUZjS8NJph1Bs/HwkecpL28yQHO+QSkoUdb/10T4C3moEUI/u7SKgizU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501933; c=relaxed/simple;
	bh=Db99xEdjutR/ihiJgzhUw2Ke0ml5qJ4KwBmCGT7lLV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=noQQZ4klVTzPWkMW+JAMp7IrrKt9p25K0MyiwDHadmf4+yUM6CxndbqF1QKrj/sFLe6jSQ1wHBzaNW3fG+RHjKQn49eLipC5zizmlB1cZ5uSiFhdJSS/sNti+hlxO0kPO46LJBo29Ixp8noIZWrzYSbKe3oraGN9STRqRBmI2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipIzE4aJ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipIzE4aJ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso2268909f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 08:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501930; x=1774106730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKGBFuBHRuN31ZFNKDqDxImcJys3tewsom9xKohaWaM=;
        b=ipIzE4aJc/sjS8aDq6rQM6LupvjuoibzVB8iFgem46HXFxohh+ki0wMpwQQVBzLiLp
         kkE6WyyffSFPZSrwr3WGpXt+83L7tBigXV+MyX0PWT/IBLTy6zyTY3x47PFd/1GTBPMo
         YHe69nMfo5mU0f7bqhECgHyOTLBfoeo/rDgesCQwI973McaKfUY1n9tKu10kj9NcTrl3
         AuVbPOY3lIJnpm1SzRNfkHQUTQGkWc1dsaqSkcc6Im9ABqZjRXHBj3JF7fX/NjhdvGG2
         RITRyL1OhDIo8tD+BsxyByTqYwWWkgHK4yvqZmDTvTR+kq3js8c3JyX3KIxr8/KVW00+
         QSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501930; x=1774106730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKGBFuBHRuN31ZFNKDqDxImcJys3tewsom9xKohaWaM=;
        b=IJQgS1UDtLHHdGvD0srlZyb76n0oWcXjhzSxUItIlS6by0DMQVxmmWgrw/A9EmTsmg
         SGpVj9Kd/hoOL2Z4b2QEcnXm4s4MU1XtdbaMq33VZzJuKN78oeZ2zHRcOMdUL2RR4Tgx
         B4pCMYMXSphvZdgrYBiUVH1fNLLyn7aVDGfsL9sVdoKMz/vTPv49oz49e4bvWqiW34qC
         ag22fM8UqKdfTocYIIpIoN4Ai7ZfNYPhsMejojTVga7eSFXDlr+e6L7cbpLgzlb8ChWH
         4tKvX+52T+MrH/3PwFKoLHslvxekRAPUD69tI4L1ysK1V1a4Pw0/AAoP3coFx6V8Wg39
         Kq2A==
X-Forwarded-Encrypted: i=1; AJvYcCXGyxsvMso/fzG5esnrHsWUxBGPCOTIvOkSQu3iXoiNwMdPCOpng5dN4UI0jwxkfs6oYo8a0Dwl3DE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wSmgsCUGLN8kax2/pDcRX/+aG3FEeSxypGzG4WI6udQzdSxY
	Mq6RVUMZHlNfoUcVdybSVWwiFoqj5GGl+kgAPPXJvb0xOVgT1BxMICL8xR+nM72xI/0=
X-Gm-Gg: ATEYQzwQDUU815XSYi8Lv9+JXmf0Q86DynfgfJJ6hh64yGnU4PeWqKYqmQs03+/Atfq
	EuCkgRlCJNEcJXODGlNgBEbFytPHX98l+h5NUq7aU0y9vyCjACA6w1o2uyht12Dx8dTuWMZm7uz
	6caONEoozRJriT2z1htzTXHHnmr0OFr9SQrfv9eO9/hAn3EMjJ0yYzTznRGq5C+VcdDizZ5ZRdY
	09fEiOq8fKKZrysGJkuWVjWNX1eDxFWrbH4jbDK2ZJcE6nEyKEzRIL/IyAwKxLToKSDwzyUw417
	W2baL8s9x//stp+RPu/5R9dhok8GmASDkffK+s0CV5D0vOIxYkpLhSrZ7g5U9rCaM9i8VI9LDZf
	PJvXUdhspC9a3HtLmICnuqY6ivIzh02ou0FdtO9Lx8GjHJljq5t0AaQSQJE4yrue5zUEf6IC2E9
	CeZx5vCydMCNahpE7vhpWUj8QrGSqJoGqBfOb9yboC1Iyz4WFUSvMSrHAJO8j5frkOHDUEyXsj+
	VDJ5+SIlepd7pbE8xQIZJme3ODeGQ==
X-Received: by 2002:a05:6000:2501:b0:439:ac8f:5da5 with SMTP id ffacd0b85a97d-43a04d7817emr13583033f8f.8.1773501930372;
        Sat, 14 Mar 2026 08:25:30 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe228986sm23705107f8f.35.2026.03.14.08.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:25:29 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH] Docs/mm: document Boot Memory
Date: Sat, 14 Mar 2026 16:25:27 +0100
Message-ID: <20260314152527.100295-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fill in the bootmem.rst stub created in commit 481cc97349d6
("mm,doc: Add new documentation structure") as part of
the structured memory management documentation following
Mel Gorman's book outline.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/mm/bootmem.rst | 139 +++++++++++++++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/Documentation/mm/bootmem.rst b/Documentation/mm/bootmem.rst
index eb2b31eedfa1..b20520f53603 100644
--- a/Documentation/mm/bootmem.rst
+++ b/Documentation/mm/bootmem.rst
@@ -3,3 +3,142 @@
 ===========
 Boot Memory
 ===========
+
+The kernel needs a memory allocator long before the page allocator is ready.
+The memblock allocator fills this role, managing physical memory from the
+earliest stages of boot until the buddy allocator takes over.  The
+implementation is in ``mm/memblock.c`` and ``mm/mm_init.c``.
+
+.. contents:: :local:
+
+Memblock
+========
+
+Memblock tracks physical memory as two arrays of regions: ``memory`` (all
+usable RAM reported by firmware) and ``reserved`` (memory already allocated
+or otherwise unavailable).  A free page is one that appears in ``memory``
+but not in ``reserved``.  These two arrays, along with global state such as
+the allocation direction and address limit, are held in a single
+``struct memblock`` instance.
+
+Each region is a ``struct memblock_region`` recording a base address, size,
+NUMA node ID, and a set of flags:
+
+- **HOTPLUG**: memory that may be physically removed at runtime.
+- **MIRROR**: memory with hardware mirroring for reliability.
+- **NOMAP**: memory that should not be directly mapped by the kernel
+  (e.g., firmware-reserved ranges that are usable but not mappable).
+- **DRIVER_MANAGED**: memory whose lifecycle is managed by a device driver.
+
+Region Management
+-----------------
+
+Firmware and architecture code populate the arrays early in boot.
+``memblock_add()`` registers a range of usable RAM.  ``memblock_reserve()``
+marks a range as taken — this is used for the kernel image itself, device
+tree blobs, initrd, and other early allocations.
+
+When regions are added, overlapping ranges are merged automatically.
+Internally, ``memblock_add_range()`` handles insertion, overlap detection,
+and merging in a single pass.  If the region array is full, it is doubled
+in size — using memblock itself to allocate the new array.
+
+``memblock_remove()`` deletes a range from the ``memory`` array (used when
+firmware reports memory that turns out to be unusable).
+``memblock_phys_free()`` removes a range from ``reserved``, making it
+available for allocation again.
+
+Allocation
+----------
+
+Memblock allocation scans the ``memory`` array for a range that does not
+overlap ``reserved``, respecting NUMA node affinity and a configurable
+address limit (``memblock.current_limit``).
+
+The search can run in two directions:
+
+- **Top-down** (default): allocates from the highest available address.
+  This keeps low memory free for devices with addressing limitations.
+- **Bottom-up**: allocates from the lowest available address.  Used on
+  some architectures during early boot to keep allocations predictable.
+
+Once a suitable range is found it is added to ``reserved``.  The main
+allocation functions are ``memblock_alloc()`` for virtual addresses and
+``memblock_phys_alloc()`` for physical addresses.  Both support NUMA-aware
+variants that prefer a specific node.
+
+Iteration
+---------
+
+Memblock provides iterator macros for walking memory ranges:
+
+- ``for_each_mem_range()`` iterates over free ranges (memory minus
+  reserved).
+- ``for_each_reserved_mem_region()`` iterates over reserved ranges.
+- ``for_each_mem_pfn_range()`` iterates by page frame number, which is
+  used heavily during page and zone initialization.
+
+These iterators handle the subtraction of reserved regions from memory
+regions internally, presenting the caller with a simple sequence of
+available ranges.
+
+Transition to the Page Allocator
+================================
+
+Once the buddy allocator is initialized, memblock releases its free pages
+via ``memblock_free_all()``.  This walks all free ranges and hands each
+page to the buddy allocator.  After this point memblock is no longer used
+for allocation and its data structures can be freed (on systems that
+support it, the memblock arrays themselves are returned to the page
+allocator via ``memblock_discard()``).
+
+Named Reservations
+------------------
+
+The ``reserve_mem`` kernel command line parameter allows firmware or boot
+loaders to reserve named memory regions that persist across kexec.  These
+are tracked separately and can be looked up by name at runtime with
+``reserve_mem_find_by_name()``.
+
+Page and Zone Initialization
+============================
+
+``mm/mm_init.c`` bridges memblock and the page allocator.  Its primary
+responsibilities are determining zone boundaries and initializing
+``struct page`` for every physical page frame.
+
+Zone Topology
+-------------
+
+The function ``free_area_init()`` is called by architecture code to set up
+nodes and zones.  It calculates zone boundaries based on architectural
+constraints (which address ranges can be used for DMA, which are always
+mapped, etc.) and kernel command line parameters:
+
+- ``kernelcore=`` sets the amount of memory that must be in non-movable
+  zones.
+- ``movablecore=`` sets the amount of memory to place in ``ZONE_MOVABLE``.
+- ``movable_node`` allows entire NUMA nodes to be treated as movable.
+- ``kernelcore=mirror`` restricts non-movable memory to mirrored regions.
+
+These parameters control the boundary between ``ZONE_MOVABLE`` and the
+other zones, which in turn affects how much memory is available for
+transparent huge pages, memory hot-remove, and CMA.
+
+Struct Page Initialization
+--------------------------
+
+Every physical page frame needs an initialized ``struct page`` before the
+page allocator can manage it.  On small systems this is done synchronously
+during boot.  On large systems with hundreds of gigabytes of RAM, this
+initialization can take a significant amount of time.
+
+With ``CONFIG_DEFERRED_STRUCT_PAGE_INIT``, only pages in the boot node's
+lower zones are initialized during early boot — enough to get the system
+running.  The remaining pages are initialized in parallel by worker threads
+(via the padata framework) before they are first needed.  This can save
+several seconds of boot time on large NUMA systems.
+
+Each page is initialized by setting its flags, reference count, and links
+to the owning node and zone.  Pages in memory holes or ``NOMAP`` regions
+are marked as reserved and are never handed to the page allocator.
-- 
2.53.0

