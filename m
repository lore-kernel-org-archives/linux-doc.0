Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3282421E0AD;
	Sat,  6 Dec 2025 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062190; cv=none; b=rycmWb1TSmLzsLgfCuEuvEoRG6NZx7vodPt/5v4zXZyA3BKh04ljHhlOEuf01CH9CEYnqmAk0cRny9RuRkDYVMMVZomkcGuUFZk2vNHmlvLwTQ9R9w/pRk6BG6E+ZK3vC5Zp4DWGbB62ZyfbMLtMgo6R7p1YQFTI+igTR3mFDiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062190; c=relaxed/simple;
	bh=m2cubONKoqyouhwjy5FzgZ2+Xsu+q1kb9+zbsNKB/zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h0y34mvhZWKblO/A2yVRlqQVjN62gxVbwJNuahnNeC1OwAGoAqvs/os4BX4RkkS/M9/3KqGLp1mYxs2Pl/mo/Lzd3ut0xgwaauNDwwC5aTNV57LDVMtOmsGZYGQabnVxmdwD/eWhxbwqCf6ydUUD8QPjb2cpvaIgGcYfbHQUFZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vs0AFiqx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vs0AFiqx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44A1C4CEF5;
	Sat,  6 Dec 2025 23:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062190;
	bh=m2cubONKoqyouhwjy5FzgZ2+Xsu+q1kb9+zbsNKB/zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vs0AFiqx4sv5ON1LrRehbcWHnt0bKbzqw9H6i6u+eWwECq4C+UiijXJaSaOG8e8HU
	 fqQ0D+QI7BIIhuOyp4e9SAq26BG8jyWFrU00LnDw7jrxAZddu0AclewTAeh3Emz12H
	 bQgA4J+KII14fokMXT7jg3HOCtmERbpqDN4Ic/ennaaNWbbqOhNxwjphfmu8DJBDAS
	 6fYtfdklD7nRXb+FPDt0IVo5kL4swcQtVUWx9uAyZUv7cn7EgYKUT8bCZVSOyK1M96
	 wUwH63bRlpHKf9SjyRrlvI6COfBrdniFDwd0rV6Pe60KEyUzNuYfY7+NJpR9m0/BgG
	 ls73uYoFD3ZdQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Graf <graf@amazon.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [RFC PATCH 02/10] kho: disable scratch-only earlier in boot
Date: Sun,  7 Dec 2025 00:02:12 +0100
Message-ID: <20251206230222.853493-3-pratyush@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230222.853493-1-pratyush@kernel.org>
References: <20251206230222.853493-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Background
==========

Scratch areas
-------------

When KHO is used, allocations are only allowed from scratch areas. The
scratch areas are pre-reserved chunks of memory that are known to not
have any preserved memory. They can safely be used until KHO is able to
parse its serialized data to find out which pages are preserved.

The scratch areas are generally sized to ensure enough memory is available for
early boot allocations. They should not be excessively large to ensure
less memory is wasted.

Gigantic hugepage allocation
----------------------------

Gigantic hugepages are allocated early in boot before memblock releases
pages to the buddy allocator. This is to ensure enough contiguous chunks
of memory are available to satisfy huge page allocations. On x86 this is
done in setup_arch(). On other architectures, including ARM64 (the only
other arch that supports KHO), this is done in mm_core_init().

Problem
=======

Currently during KHO boot, scratch-only mode is active when hugepage
allocations are attempted on both x86 and ARM64. Since scratch areas are
generally not large enough to accommodate the allocation, this
allocation fails and results in gigantic hugepages being unavailable.

Solution
========

Moving KHO memory init
----------------------

Move KHO memory initialization before gigantic hugepage allocation.
Disable scratch-only as soon as the bitmaps are deserialized, since
there is no longer a reason to stay in scratch-only mode. Since on x86
this can get called twice, once from setup_arch() and once from the
generic path in mm_core_init(), add a variable to catch this and skip
double-initialization.

Re-ordering hugepage allocation
-------------------------------

KHO memory initialization uses the struct page to store the order. On
x86, This is not available until paging_init(). If kho_memory_init() is
called before paging_init() it will cause a page fault when trying to
access the struct pages.

But Hugepage allocations are done before paging_init(). Move them to
just after paging_init(), and call kho_memory_init() right before that.
While in theory it might result in more chances in failing hugepage
allocations, in practice it will likely not have a huge impact, since
usually systems leave a fair bit of margin for non-hugepage workloads.

Testing results
===============

Normal boot
-----------

On my test system with 7GiB of memory, I tried allocating 6 1G
hugepages. I can get a maximum of 4 1G hugepages both with and without
this patch.

    [    0.039182] HugeTLB: allocating 6 of page size 1.00 GiB failed.  Only allocated 4 hugepages.

KHO boot
--------

Without this patch, I cannot get any hugepages:

    [    0.098201] HugeTLB: allocating 6 of page size 1.00 GiB failed.  Only allocated 0 hugepages.

With this patch, I am again able to get 4:

    [    0.194657] HugeTLB: allocating 6 of page size 1.00 GiB failed.  Only allocated 4 hugepages.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---

Notes:
    Only tested on x86 so far, not yet on ARM64. This patch can also be
    taken independent of the rest of the series. Even with plain KHO with
    live update not even enabled, gigantic hugepages fail to allocate
    because of scratch-only.

 arch/x86/kernel/setup.c            | 12 +++++++-----
 kernel/liveupdate/kexec_handover.c | 11 ++++++++++-
 mm/memblock.c                      |  1 -
 mm/mm_init.c                       |  8 ++------
 4 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 74aa904be6dc..9bf00287c408 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -1203,11 +1203,6 @@ void __init setup_arch(char **cmdline_p)
 	initmem_init();
 	dma_contiguous_reserve(max_pfn_mapped << PAGE_SHIFT);
 
-	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
-		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
-		hugetlb_bootmem_alloc();
-	}
-
 	/*
 	 * Reserve memory for crash kernel after SRAT is parsed so that it
 	 * won't consume hotpluggable memory.
@@ -1219,6 +1214,13 @@ void __init setup_arch(char **cmdline_p)
 
 	x86_init.paging.pagetable_init();
 
+	kho_memory_init();
+
+	if (boot_cpu_has(X86_FEATURE_GBPAGES)) {
+		hugetlb_cma_reserve(PUD_SHIFT - PAGE_SHIFT);
+		hugetlb_bootmem_alloc();
+	}
+
 	kasan_init();
 
 	/*
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 9aa128909ecf..4cfd5690f356 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1432,14 +1432,23 @@ static void __init kho_release_scratch(void)
 	}
 }
 
+static bool kho_memory_initialized;
+
 void __init kho_memory_init(void)
 {
+	if (kho_memory_initialized)
+		return;
+
+	kho_memory_initialized = true;
+
 	if (kho_in.scratch_phys) {
 		kho_scratch = phys_to_virt(kho_in.scratch_phys);
-		kho_release_scratch();
 
 		if (!kho_mem_deserialize(kho_get_fdt()))
 			kho_in.fdt_phys = 0;
+
+		memblock_clear_kho_scratch_only();
+		kho_release_scratch();
 	} else {
 		kho_reserve_scratch();
 	}
diff --git a/mm/memblock.c b/mm/memblock.c
index c7869860e659..a5682dff526d 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2342,7 +2342,6 @@ void __init memblock_free_all(void)
 	free_unused_memmap();
 	reset_all_zones_managed_pages();
 
-	memblock_clear_kho_scratch_only();
 	pages = free_low_memory_core_early();
 	totalram_pages_add(pages);
 }
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7712d887b696..93cec06c1c8a 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2679,6 +2679,8 @@ void __init __weak mem_init(void)
 void __init mm_core_init(void)
 {
 	arch_mm_preinit();
+
+	kho_memory_init();
 	hugetlb_bootmem_alloc();
 
 	/* Initializations relying on SMP setup */
@@ -2697,12 +2699,6 @@ void __init mm_core_init(void)
 	kmsan_init_shadow();
 	stack_depot_early_init();
 
-	/*
-	 * KHO memory setup must happen while memblock is still active, but
-	 * as close as possible to buddy initialization
-	 */
-	kho_memory_init();
-
 	memblock_free_all();
 	mem_init();
 	kmem_cache_init();
-- 
2.43.0

