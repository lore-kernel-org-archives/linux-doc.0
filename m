Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402203939A6
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352707; cv=none; b=aiBJqmAZhP3CycUF/Q2IegcBP6MGFC9EQ9lsWX3FUoS7yEaOjFWXwRwqcrk45j9XvtLik6xF1TWlz2W/2wf/pc/P02V41eXgsWDY1iCV3nqzVJIZ83HdTAeowi+W6W5d5Y3WKoyXc5RkGQW7MTWZJYb43K0dkkgru4YPiW9drfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352707; c=relaxed/simple;
	bh=EOXPbDEivtxPohwSijzPtKQiERO851idj46E4kIjh74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CUebF+kwkYx2qj3vjK1ethxyu0LsqU6DjHM8e3vWv1xmC4h5pgInMsuSnm+MAKN7ca+z4FJllL5+SIkavu6GqpWL0AJ4+v8EQDkfsQOnbcDAubVnICE9RHMQmv9Amof+KtWFQEAJQNpg/r9DhOuzPjozavAoUwyvS/5ILTj7dSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B/e3FFGd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B/e3FFGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UImAYT2NpHnBWtVaSbpsrLwKhtieXrfYKA2luRUhl24=;
	b=B/e3FFGdrwzbMI1P0i6toj3b3o3z7mqvW0nPi4Y0ADppteB29n+phFNDXACPAtmpzunPg7
	lneZdy8pgZC0t8UZbxTABwOI/RCrNRLTzwzeM+eSGf/rOXK7XyqWhy6wGToA9lVctoBdgA
	CZko27Xy5ugPfhM3DxGZ5ZZRI+snW0w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-6jYtQVULOwGf3zqxEOSBrQ-1; Mon,
 06 Jul 2026 11:45:00 -0400
X-MC-Unique: 6jYtQVULOwGf3zqxEOSBrQ-1
X-Mimecast-MFC-AGG-ID: 6jYtQVULOwGf3zqxEOSBrQ_1783352697
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23FAF18007E9;
	Mon,  6 Jul 2026 15:44:57 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98E5A195604E;
	Mon,  6 Jul 2026 15:44:48 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 5/8] mm/khugepaged: Refactor the PTE state checks into a helper
Date: Mon,  6 Jul 2026 09:44:52 -0600
Message-ID: <20260706154500.39178-6-npache@redhat.com>
In-Reply-To: <20260706154500.39178-1-npache@redhat.com>
References: <20260706154500.39178-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

For anonymous collapse, the collapse_scan_pmd() and
__collapse_huge_page_isolate() functions share a large portion of their
logic. These functions both check the state of the PTEs and verify the
following:
	- max_pte_* values are not exceeded
	- uffd is not active
	- lazyfree properties
	- non-anonymous

Merge these checks into a helper collapse_check_pte() to reduce code
duplication. We also add a helper struct for this function called
pte_check_context which allows us to pass the required parameters in a
clean and elegant manner.

A helper function is also introduced pte_check_fail() to provide a clean
interface to set the pte_check_context failure results and return
PTE_CHECK_FAIL state. This helps reduce code duplications across the new
collapse_check_pte function.

Two slight modifications are done to the original functionality. We now
warn (instead of crash) if the anon test fails, and we leverage the
vm_normal_folio function instead of page->folio, this should be
functionally equivalent.

No other functional changes intended.

This patch is heavily based off work done by Lance Yang, but modified to
deal with conflicts and feedback received during the review cycle [1].

[1] https://lore.kernel.org/all/20251008043748.45554-1-lance.yang@linux.dev/
Suggested-by: David Hildenbrand <david@kernel.org>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 295 +++++++++++++++++++++++++-----------------------
 1 file changed, 155 insertions(+), 140 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 676f75773a6c..c4ea2dc1591b 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -63,6 +63,12 @@ enum scan_result {
 	SCAN_PAGE_DIRTY_OR_WRITEBACK,
 };
 
+enum pte_check_result {
+	PTE_CHECK_SUCCEED,
+	PTE_CHECK_FAIL,
+	PTE_CHECK_CONTINUE,
+};
+
 #define CREATE_TRACE_POINTS
 #include <trace/events/huge_memory.h>
 
@@ -117,6 +123,20 @@ struct collapse_control {
 	DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
 };
 
+struct pte_check_context {
+	struct collapse_control *cc;
+	struct vm_area_struct *vma;
+	unsigned int order;
+	struct folio *folio;
+	int none_or_zero;
+	int shared;
+	int unmapped;
+	enum scan_result result;
+	unsigned int max_ptes_none;
+	unsigned int max_ptes_swap;
+	unsigned int max_ptes_shared;
+};
+
 /**
  * struct khugepaged_scan - cursor for scanning
  * @mm_head: the head of the mm list to scan
@@ -700,74 +720,130 @@ static void count_collapse_event(unsigned int order, enum vm_event_item vm_event
 	count_mthp_stat(order, mthp_event);
 }
 
+/*
+ * pte_check_fail() - A simple helper to set the pte_check_context result and
+ * return PTE_CHECK_FAIL.
+ */
+static enum pte_check_result pte_check_fail(struct pte_check_context *ctx,
+		enum scan_result result)
+{
+	ctx->result = result;
+	return PTE_CHECK_FAIL;
+}
+
+/*
+ * collapse_check_pte() - Check if a PTE is suitable for collapse
+ *
+ * Check if a PTE is suitable for collapse based on the following criteria:
+ * - max_pte_* values are not exceeded
+ * - uffd is not active
+ * - lazyfree properties are not present
+ * - only anonymous pages are present
+ *
+ * a helper struct pte_check_context is used to pass and store relevant
+ * information between the collapse_check_pte() function and the caller.
+ *
+ * Return: PTE_CHECK_SUCCEED if the PTE is suitable for collapse,
+ *         PTE_CHECK_FAIL if the PTE is not suitable for collapse,
+ *         PTE_CHECK_CONTINUE if the scan should continue to check the next PTE.
+ */
+static enum pte_check_result collapse_check_pte(pte_t pteval,
+		unsigned long addr, struct pte_check_context *ctx)
+{
+	if (pte_none_or_zero(pteval)) {
+		if (++ctx->none_or_zero > ctx->max_ptes_none) {
+			count_collapse_event(ctx->order, THP_SCAN_EXCEED_NONE_PTE,
+					MTHP_STAT_COLLAPSE_EXCEED_NONE);
+			return pte_check_fail(ctx, SCAN_EXCEED_NONE_PTE);
+		}
+		return PTE_CHECK_CONTINUE;
+	}
+	if (!pte_present(pteval)) {
+		if (ctx->unmapped == -1)
+			return pte_check_fail(ctx, SCAN_PTE_NON_PRESENT);
+		if (++ctx->unmapped > ctx->max_ptes_swap) {
+			count_collapse_event(ctx->order, THP_SCAN_EXCEED_SWAP_PTE,
+					MTHP_STAT_COLLAPSE_EXCEED_SWAP);
+			return pte_check_fail(ctx, SCAN_EXCEED_SWAP_PTE);
+		}
+		if (pte_swp_uffd_wp_any(pteval))
+			return pte_check_fail(ctx, SCAN_PTE_UFFD_WP);
+		return PTE_CHECK_CONTINUE;
+	}
+	/*
+	 * Don't collapse if any of the small PTEs are armed with uffd
+	 * write protection. Marking the new huge pmd as write protected
+	 * could bring userfault messages that fall outside of the
+	 * registered range.
+	 */
+	if (pte_uffd_wp(pteval))
+		return pte_check_fail(ctx, SCAN_PTE_UFFD_WP);
+
+	ctx->folio = vm_normal_folio(ctx->vma, addr, pteval);
+	if (unlikely(!ctx->folio) || unlikely(folio_is_zone_device(ctx->folio)))
+		return pte_check_fail(ctx, SCAN_PAGE_NULL);
+
+	/*
+	 * If the vma has the VM_DROPPABLE flag, the collapse will
+	 * preserve the lazyfree property without needing to skip.
+	 */
+	if (ctx->cc->is_khugepaged && !(ctx->vma->vm_flags & VM_DROPPABLE) &&
+	    folio_test_lazyfree(ctx->folio) && !pte_dirty(pteval))
+		return pte_check_fail(ctx, SCAN_PAGE_LAZYFREE);
+
+	if (folio_maybe_mapped_shared(ctx->folio)) {
+		/*
+		 * TODO: Support shared pages without leading to further
+		 * mTHP collapses. Currently bringing in new pages via
+		 * shared may cause a future higher order collapse on a
+		 * rescan of the same range.
+		 */
+		if (++ctx->shared > ctx->max_ptes_shared) {
+			count_collapse_event(ctx->order, THP_SCAN_EXCEED_SHARED_PTE,
+					MTHP_STAT_COLLAPSE_EXCEED_SHARED);
+			return pte_check_fail(ctx, SCAN_EXCEED_SHARED_PTE);
+		}
+	}
+
+	if (!folio_test_anon(ctx->folio)) {
+		VM_WARN_ON_FOLIO(!folio_test_anon(ctx->folio), ctx->folio);
+		return pte_check_fail(ctx, SCAN_PAGE_ANON);
+	}
+	return PTE_CHECK_SUCCEED;
+}
+
 static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
 		unsigned int order, struct list_head *compound_pagelist)
 {
-	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, order);
-	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, order);
 	const unsigned long nr_pages = 1UL << order;
-	struct page *page = NULL;
 	struct folio *folio = NULL;
 	unsigned long addr = start_addr;
-	pte_t *_pte;
-	int none_or_zero = 0, shared = 0, referenced = 0;
+	pte_t *_pte, pteval;
+	int referenced = 0;
 	enum scan_result result = SCAN_FAIL;
+	enum pte_check_result pte_check;
+	struct pte_check_context ctx = {
+		.cc = cc,
+		.vma = vma,
+		.order = order,
+		.unmapped = -1, /* don't check swap PTEs */
+		.max_ptes_none = collapse_max_ptes_none(cc, vma, order),
+		.max_ptes_shared = collapse_max_ptes_shared(cc, order),
+	};
 
 	for (_pte = pte; _pte < pte + nr_pages;
 	     _pte++, addr += PAGE_SIZE) {
-		pte_t pteval = ptep_get(_pte);
-		if (pte_none_or_zero(pteval)) {
-			if (++none_or_zero > max_ptes_none) {
-				result = SCAN_EXCEED_NONE_PTE;
-				count_collapse_event(order, THP_SCAN_EXCEED_NONE_PTE,
-						MTHP_STAT_COLLAPSE_EXCEED_NONE);
-				goto out;
-			}
-			continue;
-		}
-		if (!pte_present(pteval)) {
-			result = SCAN_PTE_NON_PRESENT;
-			goto out;
-		}
-		if (pte_uffd_wp(pteval)) {
-			result = SCAN_PTE_UFFD_WP;
-			goto out;
-		}
-		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
-			result = SCAN_PAGE_NULL;
-			goto out;
-		}
-
-		folio = page_folio(page);
-		VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
-
-		/*
-		 * If the vma has the VM_DROPPABLE flag, the collapse will
-		 * preserve the lazyfree property without needing to skip.
-		 */
-		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
-		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
-			result = SCAN_PAGE_LAZYFREE;
+		pteval = ptep_get(_pte);
+		pte_check = collapse_check_pte(pteval, addr, &ctx);
+		if (pte_check == PTE_CHECK_FAIL) {
+			result = ctx.result;
 			goto out;
 		}
+		if (pte_check == PTE_CHECK_CONTINUE)
+			continue;
+		folio = ctx.folio;
 
-		/* See collapse_scan_pmd(). */
-		if (folio_maybe_mapped_shared(folio)) {
-			/*
-			 * TODO: Support shared pages without leading to further
-			 * mTHP collapses. Currently bringing in new pages via
-			 * shared may cause a future higher order collapse on a
-			 * rescan of the same range.
-			 */
-			if (++shared > max_ptes_shared) {
-				result = SCAN_EXCEED_SHARED_PTE;
-				count_collapse_event(order, THP_SCAN_EXCEED_SHARED_PTE,
-						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
-				goto out;
-			}
-		}
 		/*
 		 * TODO: In some cases of partially-mapped folios, we'd actually
 		 * want to collapse.
@@ -844,13 +920,13 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
-		trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
+		trace_mm_collapse_huge_page_isolate(folio, ctx.none_or_zero,
 						    referenced, result, order);
 		return result;
 	}
 out:
 	release_pte_pages(pte, _pte, compound_pagelist);
-	trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
+	trace_mm_collapse_huge_page_isolate(folio, ctx.none_or_zero,
 					    referenced, result, order);
 	return result;
 }
@@ -1616,24 +1692,30 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		struct vm_area_struct *vma, unsigned long start_addr,
 		bool *lock_dropped, struct collapse_control *cc)
 {
-	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
-	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
-	unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
 	enum tva_type tva_flags = cc->is_khugepaged ? TVA_KHUGEPAGED : TVA_FORCED_COLLAPSE;
 	pmd_t *pmd;
 	pte_t *pte, *_pte, pteval;
 	int i;
-	int none_or_zero = 0, shared = 0, referenced = 0;
-	enum scan_result result = SCAN_FAIL;
-	struct page *page = NULL;
 	struct folio *folio = NULL;
+	int referenced = 0;
+	enum scan_result result = SCAN_FAIL;
 	unsigned long addr;
 	unsigned long enabled_orders;
 	spinlock_t *ptl;
-	int node = NUMA_NO_NODE, unmapped = 0;
+	int node = NUMA_NO_NODE;
+	enum pte_check_result pte_check;
 
 	VM_BUG_ON(start_addr & ~HPAGE_PMD_MASK);
 
+	struct pte_check_context ctx = {
+		.cc = cc,
+		.vma = vma,
+		.order = HPAGE_PMD_ORDER,
+		.max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER),
+		.max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER),
+		.max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER),
+	};
+
 	result = find_pmd_or_thp_or_none(mm, start_addr, &pmd);
 	if (result != SCAN_SUCCEED) {
 		cc->progress++;
@@ -1649,7 +1731,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 	 * scan all pages to populate the bitmap for mTHP collapse.
 	 */
 	if (enabled_orders != BIT(HPAGE_PMD_ORDER))
-		max_ptes_none = KHUGEPAGED_MAX_PTES_LIMIT;
+		ctx.max_ptes_none = KHUGEPAGED_MAX_PTES_LIMIT;
 
 	pte = pte_offset_map_lock(mm, pmd, start_addr, &ptl);
 	if (!pte) {
@@ -1665,81 +1747,14 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 
 		cc->progress++;
 
-		if (pte_none_or_zero(pteval)) {
-			if (++none_or_zero > max_ptes_none) {
-				result = SCAN_EXCEED_NONE_PTE;
-				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_NONE_PTE,
-						MTHP_STAT_COLLAPSE_EXCEED_NONE);
-				goto out_unmap;
-			}
-			continue;
-		}
-		if (!pte_present(pteval)) {
-			if (++unmapped > max_ptes_swap) {
-				result = SCAN_EXCEED_SWAP_PTE;
-				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SWAP_PTE,
-						MTHP_STAT_COLLAPSE_EXCEED_SWAP);
-				goto out_unmap;
-			}
-			/*
-			 * Always be strict with uffd-wp
-			 * enabled swap entries.  Please see
-			 * comment below for pte_uffd_wp().
-			 */
-			if (pte_swp_uffd_wp_any(pteval)) {
-				result = SCAN_PTE_UFFD_WP;
-				goto out_unmap;
-			}
-			continue;
-		}
-		if (pte_uffd_wp(pteval)) {
-			/*
-			 * Don't collapse the page if any of the small
-			 * PTEs are armed with uffd write protection.
-			 * Here we can also mark the new huge pmd as
-			 * write protected if any of the small ones is
-			 * marked but that could bring unknown
-			 * userfault messages that falls outside of
-			 * the registered range.  So, just be simple.
-			 */
-			result = SCAN_PTE_UFFD_WP;
-			goto out_unmap;
-		}
-
-		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
-			result = SCAN_PAGE_NULL;
-			goto out_unmap;
-		}
-		folio = page_folio(page);
-
-		/*
-		 * If the vma has the VM_DROPPABLE flag, the collapse will
-		 * preserve the lazyfree property without needing to skip.
-		 */
-		if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) &&
-		    folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
-			result = SCAN_PAGE_LAZYFREE;
-			goto out_unmap;
-		}
-
-		if (!folio_test_anon(folio)) {
-			result = SCAN_PAGE_ANON;
+		pte_check = collapse_check_pte(pteval, addr, &ctx);
+		if (pte_check == PTE_CHECK_FAIL) {
+			result = ctx.result;
 			goto out_unmap;
 		}
-
-		/*
-		 * We treat a single page as shared if any part of the THP
-		 * is shared.
-		 */
-		if (folio_maybe_mapped_shared(folio)) {
-			if (++shared > max_ptes_shared) {
-				result = SCAN_EXCEED_SHARED_PTE;
-				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SHARED_PTE,
-						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
-				goto out_unmap;
-			}
-		}
+		if (pte_check == PTE_CHECK_CONTINUE)
+			continue;
+		folio = ctx.folio;
 
 		/* Set bit for occupied pages */
 		__set_bit(i, cc->mthp_present_ptes);
@@ -1781,7 +1796,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 	}
 	if (cc->is_khugepaged &&
 		   (!referenced ||
-		    (unmapped && referenced < HPAGE_PMD_NR / 2))) {
+		    (ctx.unmapped && referenced < HPAGE_PMD_NR / 2))) {
 		result = SCAN_LACK_REFERENCED_PAGE;
 	} else {
 		result = SCAN_SUCCEED;
@@ -1792,13 +1807,13 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		/* collapse_huge_page expects the lock to be dropped before calling */
 		mmap_read_unlock(mm);
 		result = mthp_collapse(mm, start_addr, referenced,
-				       unmapped, cc, enabled_orders);
+				       ctx.unmapped, cc, enabled_orders);
 		/* mmap_lock was released above, set lock_dropped */
 		*lock_dropped = true;
 	}
 out:
 	trace_mm_khugepaged_scan_pmd(mm, folio, referenced,
-				     none_or_zero, result, unmapped);
+				     ctx.none_or_zero, result, ctx.unmapped);
 	return result;
 }
 
-- 
2.54.0

