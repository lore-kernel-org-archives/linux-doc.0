Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDB51DED63
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 15:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773501938; cv=none; b=S1lBafQhyRNtgny6vO6B4m5pg6L7ww+ua2yQQqVAdFWfajoybXihFsZqdo88mv/BpxBXkKFgE+nx4zEdamae7SVYgJ03cpEA42dPVpXfMMv7CTJqb1VmQ0lSEtGxKdMnXHRt7OnQ9GT3xk3Hs8fJSX9qkXSvjfioTy0yGJd1v4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773501938; c=relaxed/simple;
	bh=ZEMLdp79ECkeqdxdn15F1IyjkUVQdowEbuLo5IwJjeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QlI7GYFJP+8qKWQBBF5a/3hL09w8l7TEjDcF185/TdBAHVxPbBOeVKjL8h61J/GA0znSaFRIcma7cZEZBnmEVPKuhaZMAsVCUTPGekvC14r0u87VM8RhdEuNmZXUb0ugspf0yt8PFL6ptzcFgkZhWP45JE/aLgPdO0y8kyZKGTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8cjWk5H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8cjWk5H"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-483487335c2so30061125e9.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773501935; x=1774106735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d2eBAZtzNWnpWbtJR/5rxUrUpXwLDR+PqKZhvhnDrwI=;
        b=M8cjWk5HTx66CI6RgOF73WZt2llcTxZcrcHD6EJbD0n2LZulhYx5pFHGFG7xNgaLnw
         rVgwrDO6g7YAmrpKhsYFUTwTunIg67bUqrh/J2ihcUV4Hb3Albl3JVlrvEYrNfeEo0D4
         UjyAB/XQ+tHGMCSx1HNYmct9ETRWk2PoEe/6+/928uADwu1Yd6reLjeWNPpO0wjs6w+o
         /5wGBUUjZK/LRAfo0wky8yAUAl91K0V/YEoKdAhmB+a65IZ1esTl432tEbM6xnFKh2ug
         /GqjHqb7pS17cqxwW0r6/pCGs0oho/ZhlvnJuVKxPLsN0P+Qzn+p/5eKnMe70GZPIKQ5
         POew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773501935; x=1774106735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2eBAZtzNWnpWbtJR/5rxUrUpXwLDR+PqKZhvhnDrwI=;
        b=aOu0doQ1RXAFmWKwfLKcmcNx0GW73oP7ec0eMZ3TlGrwYlMDLXLmfvdEn29eff5yFa
         AZ/wnPwRanup+NKqEEhwtEMvPrhOQIKLzzlIXFjGbwOlmRdP0tKx/NUmu017RmE1Y6vn
         BjpvGcL5qKqLjscxXU1C16OBwnkmRn2bQYh7GqNuYOQcjKOqBi9OHfhLSuR0bhpDz3R5
         y9jhtpe/LF7q+ZFDEGVWNYjg3od556SfZE9rHOZBFGEUafjlLWd0qKGV11FJ2mlO4IHF
         YQBeYlpSnqDq2y6L9h7N1Pu8HUsj5zLGpKTEZpb3diPwoj6HozQPY9NolwIPb84Jgv20
         NUAg==
X-Forwarded-Encrypted: i=1; AJvYcCXlaFIwyio2O7z49AfOGkp2uqeb5CyyQQfr8+0OXq8zSwaO/elm/vDaV+ToVNytfBNf7P+PSTHhAmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQMik1ob6IziBncFPZw1jTljKJxSFdi21h+uI+gcj3iVUxS6h
	T8fZAsgsL1GVhfENzFkt0DpFUCiFMsRt1QFJGtA5ziQbcYsATctBlrYG
X-Gm-Gg: ATEYQzyM+m6eWaNa3CsYadIZr9yI99YB1EPnBJL2feczBxBnRzeXTtQrUPeEfh5/k+w
	ooIABuhe8r4C3dNSXdKETBvcEm2gdCrKFCcQiBEG5f0DwasJni4P/N4IXDbkN6bHyLZc4hqJJlh
	HFeVS0Cd/LnZlFPXEvSpmnODLzL6X2xEWqQj2pcuJdDJrRgaPMf+JdWT1nvAYscBtPuQkDDrGNF
	2io2W9U/5icavA2MsKscjRqi+Ak+LwV9cSGt48Up4JpbAVTc44ijDMxX79oKXkROqY6O/UTGhMa
	notMmA3XyhXJSlcDkY3A1iXE1b0dN1izDEkOYGlA4vLxS7ByyhKqmV/0V7pxtSEVit5Sitm3zsn
	eCNmBqkuM3FpZEImYaqD5cF8q9QamJ5/qtd0kiUBT40MQT1qtTw+5dlGlTyvWD+EG9MoC6fEOKH
	CCTjLy5XwSM4GdszjSa2EoJTw1b5hJO2whQqve/aPhMeGkB0mwV5C3SrHZQxGdzYfp/890KGKi6
	8hUlztDs6KypEFeWuKYSAPVoIXH7w==
X-Received: by 2002:a05:600c:3552:b0:485:3a59:99ca with SMTP id 5b1f17b1804b1-485566fab0bmr113391445e9.16.1773501934612;
        Sat, 14 Mar 2026 08:25:34 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm30479525f8f.34.2026.03.14.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 08:25:34 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>
Subject: [PATCH] Docs/mm: document Virtually Contiguous Memory Allocation
Date: Sat, 14 Mar 2026 16:25:32 +0100
Message-ID: <20260314152532.100411-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fill in the vmalloc.rst stub created in commit 481cc97349d6
("mm,doc: Add new documentation structure") as part of
the structured memory management documentation following
Mel Gorman's book outline.

Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/mm/vmalloc.rst | 128 +++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/mm/vmalloc.rst b/Documentation/mm/vmalloc.rst
index 363fe20d6b9f..2c478b341e73 100644
--- a/Documentation/mm/vmalloc.rst
+++ b/Documentation/mm/vmalloc.rst
@@ -3,3 +3,131 @@
 ======================================
 Virtually Contiguous Memory Allocation
 ======================================
+
+``vmalloc()`` allocates memory that is contiguous in kernel virtual address
+space but may be backed by physically discontiguous pages.  This is useful
+for large allocations where finding a contiguous physical range would be
+difficult or impossible.  The implementation is in ``mm/vmalloc.c``.
+
+.. contents:: :local:
+
+How It Works
+============
+
+A vmalloc allocation has three steps: reserve a range of kernel virtual
+addresses, allocate physical pages (individually, via the page allocator),
+and create page table mappings that connect the two.
+
+Virtual Address Management
+--------------------------
+
+The kernel reserves a large region of virtual address space for vmalloc
+(on x86-64 this is hundreds of terabytes).  Within this region, allocated
+and free ranges are tracked by ``struct vmap_area`` nodes organized in two
+red-black trees — one sorted by address for the busy areas, and one
+augmented with subtree maximum gap size for the free areas.  The augmented
+tree allows free-space searches in O(log n) time.
+
+Each allocated area also has a ``struct vm_struct`` that records the
+virtual address, size, array of backing ``struct page`` pointers, and flags
+indicating how the area was created (``VM_ALLOC`` for vmalloc,
+``VM_IOREMAP`` for I/O mappings, ``VM_MAP`` for vmap, etc.).
+
+Guard Pages
+-----------
+
+By default, each vmalloc area is surrounded by a guard page — an unmapped
+page that causes an immediate fault if code overruns the allocation.  This
+costs one page of virtual address space (not physical memory) per
+allocation.  The ``VM_NO_GUARD`` flag disables this for internal users that
+manage their own safety margins.
+
+Huge Page Support
+-----------------
+
+On architectures that support it, vmalloc can use PMD- or PUD-level
+mappings instead of individual PTEs, reducing TLB pressure for large
+allocations.  ``vmalloc_huge()`` requests this explicitly.  The decision
+is per-architecture: each architecture provides callbacks
+(``arch_vmap_pmd_supported()``, ``arch_vmap_pud_supported()``) to indicate
+which levels are available.
+
+Even when huge pages are requested, the allocator falls back to base pages
+transparently if the physical pages cannot be allocated at the required
+alignment.
+
+Lazy TLB Flushing
+-----------------
+
+Unmapping a vmalloc area requires a global TLB flush (IPI to all CPUs) to
+ensure no stale translations remain.  To amortize this cost, vmalloc defers
+the flush: page table entries are cleared immediately but the TLB
+invalidation is batched across multiple frees.  The flush is forced when
+the free area needs to be reused or when ``vm_unmap_aliases()`` is called
+explicitly.
+
+Per-CPU Allocations
+-------------------
+
+The per-CPU allocator uses vmalloc internally to obtain virtually
+contiguous backing for per-CPU variables across all CPUs.  It allocates
+multiple vmalloc areas with specific size and alignment requirements in a
+single call, ensuring that each CPU's copy is at a consistent offset from
+the per-CPU base.
+
+vmap and Temporary Mappings
+===========================
+
+Besides vmalloc (which allocates both virtual space and physical pages),
+the subsystem provides two related mechanisms:
+
+- **vmap/vunmap**: maps an existing array of ``struct page`` pointers into
+  contiguous kernel virtual space.  This is used when pages have already
+  been allocated (e.g., by a device driver) and just need a contiguous
+  kernel mapping.
+
+- **vm_map_ram/vm_unmap_ram**: lightweight temporary mappings for
+  short-lived use, with lower overhead than full vmap.
+
+Freeing
+=======
+
+``vfree()`` can be called from any context, including interrupt handlers.
+When called from interrupt context the actual work (page table teardown,
+TLB flush, page freeing) is deferred to a workqueue.  This is safe because
+the virtual address range is immediately removed from the busy tree, so no
+new mappings can be created in the freed region.
+
+Page Table Management
+=====================
+
+vmalloc maintains its own kernel page tables to map virtual addresses to
+the backing physical pages.  On allocation, page table entries are created
+at the appropriate level (PTE, PMD, or PUD depending on huge page support).
+On free, the entries are cleared.
+
+The page table setup must handle architectures where the kernel page tables
+are not shared across all CPUs.  On such systems, a vmalloc fault mechanism
+lazily propagates new mappings: when a CPU accesses a vmalloc address for
+the first time and takes a fault, the fault handler copies the page table
+entry from the reference page table (init_mm) into the CPU's page table.
+
+NUMA Awareness
+==============
+
+By default, vmalloc allocates physical pages from any NUMA node.  The
+``vmalloc_node()`` and ``vzalloc_node()`` variants prefer a specific node,
+which is useful for data structures that are predominantly accessed from
+one node.  The pages are still mapped into the global kernel virtual
+address space, so they remain accessible from all CPUs regardless of
+which node they were allocated from.
+
+KASAN Integration
+=================
+
+When KASAN (Kernel Address Sanitizer) is enabled with
+``CONFIG_KASAN_VMALLOC``, vmalloc allocates shadow memory to track the
+validity of each vmalloc region.  The shadow memory is itself vmalloc'd
+and mapped lazily.  This allows KASAN to detect out-of-bounds accesses
+and use-after-free bugs in vmalloc'd memory, which is particularly useful
+for catching bugs in kernel modules (whose code and data are vmalloc'd).
-- 
2.53.0

