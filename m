Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD40F341047
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070610; cv=none; b=R7CSOuFWtOsvytQZRcYKG1xcW0CsCY2UxRhZojK4uIiwKkLe/uI0hR8wQccBRIDIy/fDPI1PLvP1ONbfEcIxiNzgmhvcIP0F9vSzyZofD57MO8i9s1nlMcgLfoCNWpsPqRwQrVwyc91GVX7ix6hX/Dc6f2Dqch31I2cOMUeo8AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070610; c=relaxed/simple;
	bh=Y7sCa5kzbSaXK1aXojRzFnSoIYlAHDHsLF1LEBfWR5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T8tLYSzvTlc6HcNqdxeNOAfeNIV9dUXNJJI52Tg/RfgJRIUp3wBI8+VuqdVpN56xYhJACekhn46/+z7qfMqUVWV3NBJL85G7ZjNHymATtAkLov/1cheoSIoVQfaDS/azFxcmQtx4TlQBggYCc7fWs5ve40UYevF7bCS5x/51pgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2O8+TcT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2O8+TcT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2F7C116B1;
	Thu, 18 Dec 2025 15:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070610;
	bh=Y7sCa5kzbSaXK1aXojRzFnSoIYlAHDHsLF1LEBfWR5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P2O8+TcTjqvbgm2TkqTmdyQo8GQn6PVcio+sXSeDTu5eqazyatMIpJSkd5gfQqZ8H
	 hUwwPgQlCp3OCt7Kk0X+H9Yj81sUKKopTY0FK13Vwq9oJNLfN2vqHa6SlXj+6qqdkf
	 hzqrBIpYDqGEx6eJ+7d1GAcgtGGzyGsMRwXVivXtg5FSXKpns57gWRuQVVY+LW6rpM
	 4jkF9Vm6LYFH7eTmPVh9VNIGzhmSFQnvRwtI+ktK1JreaeKMwRh+nPHJ6AC1yK3KZB
	 vCGPpg/hIrMUU6phOivPsmVmHfKrnBYioBn3ocl/ENZFUVGuW6n0BYGLW1F2CjSfQq
	 Q6eoeoPxqFhjA==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 26F9DF40078;
	Thu, 18 Dec 2025 10:10:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 18 Dec 2025 10:10:09 -0500
X-ME-Sender: <xms:URlEaeGgpV6D2iJnLNK7CpfN0XdRo69y6DMZTy9ETWbU9G_sp12QGg>
    <xme:URlEaendMa1VYBsgy5zkFwekkxtR76gh_2GQx4FIVSELCmMqJKqdYGL1jBMsfYWut
    KvWWWFs2n0ssQt6ESz1EHbT9S8kQ7wdTw9VwphIjSWw6Gl6w3aP6g>
X-ME-Received: <xmr:URlEaa_GxUZWlrmjyy_8-ILb973BByJVLJ2I4TYxcVCWBbUoQoh1ZihFEELfIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhudefjeehhfektdeuvdefveejffdvhfevtddugfduffejfeeikeelhedvtedvveen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrug
    horhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:URlEafmp3DpJ39qVGUXD3eZEYhgR6WDnfof5qNm1LHV16RgMQvi7ag>
    <xmx:URlEaYldgiNwACMBfy5XHqlbYT5Gu0rLqDMbxt761U72mCSrK-exgQ>
    <xmx:URlEaTs42iIF_xuecYkgYdqxLQ31xlbd5HsrupeYz3VVeXjruw6sMQ>
    <xmx:URlEaSLa5u7HORTspWTmMttNYkjqPTQ0TLOHJePOHVp-risIlExkvA>
    <xmx:URlEaYhWEAc72QlfY8w5O6zkgS5opnGfzgs0yX10SawpZQzVOiz-8tVw>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:10:08 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv2 08/14] mm/hugetlb: Refactor code around vmemmap_walk
Date: Thu, 18 Dec 2025 15:09:39 +0000
Message-ID: <20251218150949.721480-9-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218150949.721480-1-kas@kernel.org>
References: <20251218150949.721480-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To prepare for removing fake head pages, the vmemmap_walk code is being reworked.

The reuse_page and reuse_addr variables are being eliminated. There will
no longer be an expectation regarding the reuse address in relation to
the operated range. Instead, the caller will provide head and tail
vmemmap pages, along with the vmemmap_start address where the head page
is located.

Currently, vmemmap_head and vmemmap_tail are set to the same page, but
this will change in the future.

The only functional change is that __hugetlb_vmemmap_optimize_folio()
will abandon optimization if memory allocation fails.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 mm/hugetlb_vmemmap.c | 198 ++++++++++++++++++-------------------------
 1 file changed, 83 insertions(+), 115 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ba0fb1b6a5a8..d18e7475cf95 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -24,8 +24,9 @@
  *
  * @remap_pte:		called for each lowest-level entry (PTE).
  * @nr_walked:		the number of walked pte.
- * @reuse_page:		the page which is reused for the tail vmemmap pages.
- * @reuse_addr:		the virtual address of the @reuse_page page.
+ * @vmemmap_start:	the start of vmemmap range, where head page is located
+ * @vmemmap_head:	the page to be installed as first in the vmemmap range
+ * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
  * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
  *			or is mapped from.
  * @flags:		used to modify behavior in vmemmap page table walking
@@ -34,11 +35,14 @@
 struct vmemmap_remap_walk {
 	void			(*remap_pte)(pte_t *pte, unsigned long addr,
 					     struct vmemmap_remap_walk *walk);
+
 	unsigned long		nr_walked;
-	struct page		*reuse_page;
-	unsigned long		reuse_addr;
+	unsigned long		vmemmap_start;
+	struct page		*vmemmap_head;
+	struct page		*vmemmap_tail;
 	struct list_head	*vmemmap_pages;
 
+
 /* Skip the TLB flush when we split the PMD */
 #define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
 /* Skip the TLB flush when we remap the PTE */
@@ -140,14 +144,7 @@ static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
 {
 	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
 
-	/*
-	 * The reuse_page is found 'first' in page table walking before
-	 * starting remapping.
-	 */
-	if (!vmemmap_walk->reuse_page)
-		vmemmap_walk->reuse_page = pte_page(ptep_get(pte));
-	else
-		vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
+	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
 	vmemmap_walk->nr_walked++;
 
 	return 0;
@@ -207,18 +204,12 @@ static void free_vmemmap_page_list(struct list_head *list)
 static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 			      struct vmemmap_remap_walk *walk)
 {
-	/*
-	 * Remap the tail pages as read-only to catch illegal write operation
-	 * to the tail pages.
-	 */
-	pgprot_t pgprot = PAGE_KERNEL_RO;
 	struct page *page = pte_page(ptep_get(pte));
 	pte_t entry;
 
 	/* Remapping the head page requires r/w */
-	if (unlikely(addr == walk->reuse_addr)) {
-		pgprot = PAGE_KERNEL;
-		list_del(&walk->reuse_page->lru);
+	if (unlikely(addr == walk->vmemmap_start)) {
+		list_del(&walk->vmemmap_head->lru);
 
 		/*
 		 * Makes sure that preceding stores to the page contents from
@@ -226,9 +217,16 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
 		 * write.
 		 */
 		smp_wmb();
+
+		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
+	} else {
+		/*
+		 * Remap the tail pages as read-only to catch illegal write
+		 * operation to the tail pages.
+		 */
+		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
 	}
 
-	entry = mk_pte(walk->reuse_page, pgprot);
 	list_add(&page->lru, walk->vmemmap_pages);
 	set_pte_at(&init_mm, addr, pte, entry);
 }
@@ -255,16 +253,13 @@ static inline void reset_struct_pages(struct page *start)
 static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 				struct vmemmap_remap_walk *walk)
 {
-	pgprot_t pgprot = PAGE_KERNEL;
 	struct page *page;
 	void *to;
 
-	BUG_ON(pte_page(ptep_get(pte)) != walk->reuse_page);
-
 	page = list_first_entry(walk->vmemmap_pages, struct page, lru);
 	list_del(&page->lru);
 	to = page_to_virt(page);
-	copy_page(to, (void *)walk->reuse_addr);
+	copy_page(to, (void *)walk->vmemmap_start);
 	reset_struct_pages(to);
 
 	/*
@@ -272,7 +267,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
 	 * before the set_pte_at() write.
 	 */
 	smp_wmb();
-	set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
+	set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL));
 }
 
 /**
@@ -282,33 +277,29 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
  *             to remap.
  * @end:       end address of the vmemmap virtual address range that we want to
  *             remap.
- * @reuse:     reuse address.
- *
  * Return: %0 on success, negative error code otherwise.
  */
-static int vmemmap_remap_split(unsigned long start, unsigned long end,
-			       unsigned long reuse)
+static int vmemmap_remap_split(unsigned long start, unsigned long end)
 {
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= NULL,
+		.vmemmap_start	= start,
 		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
 	};
 
-	/* See the comment in the vmemmap_remap_free(). */
-	BUG_ON(start - reuse != PAGE_SIZE);
-
-	return vmemmap_remap_range(reuse, end, &walk);
+	return vmemmap_remap_range(start, end, &walk);
 }
 
 /**
  * vmemmap_remap_free - remap the vmemmap virtual address range [@start, @end)
- *			to the page which @reuse is mapped to, then free vmemmap
- *			which the range are mapped to.
+ *			to use @vmemmap_head/tail, then free vmemmap which
+ *			the range are mapped to.
  * @start:	start address of the vmemmap virtual address range that we want
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @reuse:	reuse address.
+ * @vmemmap_head: the page to be installed as first in the vmemmap range
+ * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
  * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
  *		responsibility to free pages.
  * @flags:	modifications to vmemmap_remap_walk flags
@@ -316,69 +307,40 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end,
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_free(unsigned long start, unsigned long end,
-			      unsigned long reuse,
+			      struct page *vmemmap_head,
+			      struct page *vmemmap_tail,
 			      struct list_head *vmemmap_pages,
 			      unsigned long flags)
 {
 	int ret;
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_remap_pte,
-		.reuse_addr	= reuse,
+		.vmemmap_start	= start,
+		.vmemmap_head	= vmemmap_head,
+		.vmemmap_tail	= vmemmap_tail,
 		.vmemmap_pages	= vmemmap_pages,
 		.flags		= flags,
 	};
-	int nid = page_to_nid((struct page *)reuse);
-	gfp_t gfp_mask = GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN;
+
+	ret = vmemmap_remap_range(start, end, &walk);
+	if (!ret || !walk.nr_walked)
+		return ret;
+
+	end = start + walk.nr_walked * PAGE_SIZE;
 
 	/*
-	 * Allocate a new head vmemmap page to avoid breaking a contiguous
-	 * block of struct page memory when freeing it back to page allocator
-	 * in free_vmemmap_page_list(). This will allow the likely contiguous
-	 * struct page backing memory to be kept contiguous and allowing for
-	 * more allocations of hugepages. Fallback to the currently
-	 * mapped head page in case should it fail to allocate.
+	 * vmemmap_pages contains pages from the previous vmemmap_remap_range()
+	 * call which failed.  These are pages which were removed from
+	 * the vmemmap. They will be restored in the following call.
 	 */
-	walk.reuse_page = alloc_pages_node(nid, gfp_mask, 0);
-	if (walk.reuse_page) {
-		copy_page(page_to_virt(walk.reuse_page),
-			  (void *)walk.reuse_addr);
-		list_add(&walk.reuse_page->lru, vmemmap_pages);
-		memmap_pages_add(1);
-	}
+	walk = (struct vmemmap_remap_walk) {
+		.remap_pte	= vmemmap_restore_pte,
+		.vmemmap_start	= start,
+		.vmemmap_pages	= vmemmap_pages,
+		.flags		= 0,
+	};
 
-	/*
-	 * In order to make remapping routine most efficient for the huge pages,
-	 * the routine of vmemmap page table walking has the following rules
-	 * (see more details from the vmemmap_pte_range()):
-	 *
-	 * - The range [@start, @end) and the range [@reuse, @reuse + PAGE_SIZE)
-	 *   should be continuous.
-	 * - The @reuse address is part of the range [@reuse, @end) that we are
-	 *   walking which is passed to vmemmap_remap_range().
-	 * - The @reuse address is the first in the complete range.
-	 *
-	 * So we need to make sure that @start and @reuse meet the above rules.
-	 */
-	BUG_ON(start - reuse != PAGE_SIZE);
-
-	ret = vmemmap_remap_range(reuse, end, &walk);
-	if (ret && walk.nr_walked) {
-		end = reuse + walk.nr_walked * PAGE_SIZE;
-		/*
-		 * vmemmap_pages contains pages from the previous
-		 * vmemmap_remap_range call which failed.  These
-		 * are pages which were removed from the vmemmap.
-		 * They will be restored in the following call.
-		 */
-		walk = (struct vmemmap_remap_walk) {
-			.remap_pte	= vmemmap_restore_pte,
-			.reuse_addr	= reuse,
-			.vmemmap_pages	= vmemmap_pages,
-			.flags		= 0,
-		};
-
-		vmemmap_remap_range(reuse, end, &walk);
-	}
+	vmemmap_remap_range(start + PAGE_SIZE, end, &walk);
 
 	return ret;
 }
@@ -415,29 +377,27 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
  *		to remap.
  * @end:	end address of the vmemmap virtual address range that we want to
  *		remap.
- * @reuse:	reuse address.
  * @flags:	modifications to vmemmap_remap_walk flags
  *
  * Return: %0 on success, negative error code otherwise.
  */
 static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
-			       unsigned long reuse, unsigned long flags)
+			       unsigned long flags)
 {
 	LIST_HEAD(vmemmap_pages);
 	struct vmemmap_remap_walk walk = {
 		.remap_pte	= vmemmap_restore_pte,
-		.reuse_addr	= reuse,
+		.vmemmap_start	= start,
 		.vmemmap_pages	= &vmemmap_pages,
 		.flags		= flags,
 	};
 
-	/* See the comment in the vmemmap_remap_free(). */
-	BUG_ON(start - reuse != PAGE_SIZE);
+	start += HUGETLB_VMEMMAP_RESERVE_SIZE;
 
 	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
 		return -ENOMEM;
 
-	return vmemmap_remap_range(reuse, end, &walk);
+	return vmemmap_remap_range(start, end, &walk);
 }
 
 DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
@@ -454,8 +414,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 					   struct folio *folio, unsigned long flags)
 {
 	int ret;
-	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
-	unsigned long vmemmap_reuse;
+	unsigned long vmemmap_start, vmemmap_end;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
@@ -466,18 +425,16 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
 	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
 		synchronize_rcu();
 
+	vmemmap_start	= (unsigned long)folio;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-	vmemmap_reuse	= vmemmap_start;
-	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
 
 	/*
 	 * The pages which the vmemmap virtual address range [@vmemmap_start,
-	 * @vmemmap_end) are mapped to are freed to the buddy allocator, and
-	 * the range is mapped to the page which @vmemmap_reuse is mapped to.
+	 * @vmemmap_end) are mapped to are freed to the buddy allocator.
 	 * When a HugeTLB page is freed to the buddy allocator, previously
 	 * discarded vmemmap pages must be allocated and remapping.
 	 */
-	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, vmemmap_reuse, flags);
+	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
 	if (!ret) {
 		folio_clear_hugetlb_vmemmap_optimized(folio);
 		static_branch_dec(&hugetlb_optimize_vmemmap_key);
@@ -565,9 +522,9 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 					    struct list_head *vmemmap_pages,
 					    unsigned long flags)
 {
-	int ret = 0;
-	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
-	unsigned long vmemmap_reuse;
+	unsigned long vmemmap_start, vmemmap_end;
+	struct page *vmemmap_head, *vmemmap_tail;
+	int nid, ret = 0;
 
 	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
 	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
@@ -592,18 +549,31 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
 	 */
 	folio_set_hugetlb_vmemmap_optimized(folio);
 
+	nid = folio_nid(folio);
+	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
+
+	if (!vmemmap_head) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	copy_page(page_to_virt(vmemmap_head), folio);
+	list_add(&vmemmap_head->lru, vmemmap_pages);
+	memmap_pages_add(1);
+
+	vmemmap_tail	= vmemmap_head;
+	vmemmap_start	= (unsigned long)folio;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-	vmemmap_reuse	= vmemmap_start;
-	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
 
 	/*
-	 * Remap the vmemmap virtual address range [@vmemmap_start, @vmemmap_end)
-	 * to the page which @vmemmap_reuse is mapped to.  Add pages previously
-	 * mapping the range to vmemmap_pages list so that they can be freed by
-	 * the caller.
+	 * Remap the vmemmap virtual address range [@vmemmap_start, @vmemmap_end).
+	 * Add pages previously mapping the range to vmemmap_pages list so that
+	 * they can be freed by the caller.
 	 */
-	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end, vmemmap_reuse,
+	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
+				 vmemmap_head, vmemmap_tail,
 				 vmemmap_pages, flags);
+out:
 	if (ret) {
 		static_branch_dec(&hugetlb_optimize_vmemmap_key);
 		folio_clear_hugetlb_vmemmap_optimized(folio);
@@ -632,21 +602,19 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
 
 static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
 {
-	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
-	unsigned long vmemmap_reuse;
+	unsigned long vmemmap_start, vmemmap_end;
 
 	if (!vmemmap_should_optimize_folio(h, folio))
 		return 0;
 
+	vmemmap_start	= (unsigned long)folio;
 	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
-	vmemmap_reuse	= vmemmap_start;
-	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
 
 	/*
 	 * Split PMDs on the vmemmap virtual address range [@vmemmap_start,
 	 * @vmemmap_end]
 	 */
-	return vmemmap_remap_split(vmemmap_start, vmemmap_end, vmemmap_reuse);
+	return vmemmap_remap_split(vmemmap_start, vmemmap_end);
 }
 
 static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,
-- 
2.51.2

