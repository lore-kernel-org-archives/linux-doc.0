Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799AF3B8930
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871535; cv=none; b=Snkss/YPtUjmYWtQmWHYdIK4rJhM6H0R5fqrqmfVm7NIdy14HcF7gdS42MM54GJE6QKxnjqLboOy+/t+8OP6gVuo5rgMoMn7kxWjr4GXn47e/lcC9Wq2iq2tDHvlkixCLF/XyD6yW6W5uS9QMubicU2TiLHmTysJMgFxv/7Lp2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871535; c=relaxed/simple;
	bh=C9KrXbUFI/wTtvIMDZPEqxUqUQDs+7HwRf1I3BaFkk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0w2dAQnAgEDiQ1DDIS344Q829YyJcbBbTyGXzxdlu6xxjIrsx+Qor9Jl8riesngwoIMUOtnS11m33rKIFfp/BskK/RR0YQ7PUZpIhR8Kd0V1aj7Utm82P//E66UFFLk0J9DFmmK81ztEbsxhcEvTfassXAYEykV3KI+vpWO6w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u2G6hqEi; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u2G6hqEi"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785871531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=geBTcCptRliUmzhkX/SVMpzDuh58iStAuLW+HnKYxWU=;
	b=u2G6hqEi51nhf0mr0uDzHxvKicocCqA6MAzaVDI4UjoE1Ie6BmiaQpyPM/o6o0cAU4xnKi
	Ou0JgTb+njRMLuI2VrHhPphBJrcIf3hd3lWV0/VwUHHFcLtPVpZNBc55Xum4DioltpPCd+
	mTeeHNr4k6j0TzYke7FIaxBSitAhOzc=
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Date: Tue, 04 Aug 2026 13:25:01 -0600
Subject: [PATCH v3 3/7] mm/khugepaged: introduce a count_collapse_event()
 helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-khugepaged_pte_refactor-v3-3-0364cad642a0@linux.dev>
References: <20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev>
In-Reply-To: <20260804-khugepaged_pte_refactor-v3-0-0364cad642a0@linux.dev>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 "Nico Pache (Red Hat)" <nico.pache@linux.dev>
X-Migadu-Flow: FLOW_OUT

Provide a simple helper function to help reduce a often used, and
duplicate pattern across the khugepaged code.

When collapsing to a PMD we need to record a vm_event and the mTHP_stat
event. When doing mTHP collapse we only update the mTHP stat.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
---
 mm/khugepaged.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 9b15c1740943..a2691587a510 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -689,6 +689,14 @@ static inline bool pte_is_referenced(struct collapse_control *cc, pte_t pteval,
 		mmu_notifier_test_young(vma->vm_mm, addr));
 }
 
+static void count_collapse_event(unsigned int order, enum vm_event_item vm_event,
+		enum mthp_stat_item mthp_event)
+{
+	if (is_pmd_order(order))
+		count_vm_event(vm_event);
+	count_mthp_stat(order, mthp_event);
+}
+
 static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
 		unsigned int order, struct list_head *compound_pagelist)
@@ -709,9 +717,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		if (pte_none_or_zero(pteval)) {
 			if (++none_or_zero > max_ptes_none) {
 				result = SCAN_EXCEED_NONE_PTE;
-				if (is_pmd_order(order))
-					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_NONE);
+				count_collapse_event(order, THP_SCAN_EXCEED_NONE_PTE,
+						     MTHP_STAT_COLLAPSE_EXCEED_NONE);
 				goto out;
 			}
 			continue;
@@ -753,9 +760,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			 */
 			if (++shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
-				if (is_pmd_order(order))
-					count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
-				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SHARED);
+				count_collapse_event(order, THP_SCAN_EXCEED_SHARED_PTE,
+						     MTHP_STAT_COLLAPSE_EXCEED_SHARED);
 				goto out;
 			}
 		}
@@ -1264,15 +1270,12 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
 	folio = __folio_alloc(gfp, order, node, &cc->alloc_nmask);
 	if (!folio) {
 		*foliop = NULL;
-		if (is_pmd_order(order))
-			count_vm_event(THP_COLLAPSE_ALLOC_FAILED);
-		count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC_FAILED);
+		count_collapse_event(order, THP_COLLAPSE_ALLOC_FAILED,
+				     MTHP_STAT_COLLAPSE_ALLOC_FAILED);
 		return SCAN_ALLOC_HUGE_PAGE_FAIL;
 	}
 
-	if (is_pmd_order(order))
-		count_vm_event(THP_COLLAPSE_ALLOC);
-	count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC);
+	count_collapse_event(order, THP_COLLAPSE_ALLOC, MTHP_STAT_COLLAPSE_ALLOC);
 
 	if (unlikely(mem_cgroup_charge(folio, mm, gfp))) {
 		folio_put(folio);
@@ -1662,9 +1665,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (pte_none_or_zero(pteval)) {
 			if (++none_or_zero > max_ptes_none) {
 				result = SCAN_EXCEED_NONE_PTE;
-				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
-						MTHP_STAT_COLLAPSE_EXCEED_NONE);
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_NONE_PTE,
+						     MTHP_STAT_COLLAPSE_EXCEED_NONE);
 				goto out_unmap;
 			}
 			continue;
@@ -1672,9 +1674,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (!pte_present(pteval)) {
 			if (++unmapped > max_ptes_swap) {
 				result = SCAN_EXCEED_SWAP_PTE;
-				count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
-						MTHP_STAT_COLLAPSE_EXCEED_SWAP);
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SWAP_PTE,
+						     MTHP_STAT_COLLAPSE_EXCEED_SWAP);
 				goto out_unmap;
 			}
 			/*
@@ -1731,9 +1732,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (folio_maybe_mapped_shared(folio)) {
 			if (++shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
-				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
-						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SHARED_PTE,
+						     MTHP_STAT_COLLAPSE_EXCEED_SHARED);
 				goto out_unmap;
 			}
 		}

-- 
2.55.0

