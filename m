Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BADE39150B
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783352690; cv=none; b=UHSyxvwcBl3ybydGii6dxSZqE5LKm+Yf6XGJe31IkFGu1l+B57IT58Ql9cmEovWQ6sPJSVWnwwksrMzg/7PNSF1Ab1u2KVlNJkdvlcyh5SYUluQbOXzcfGqteIFPgHQJM2lotwz+HQRwb1Ecl0XzxEXDWvfBqer5QRBZgTPChCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783352690; c=relaxed/simple;
	bh=QL9GHCm5HjSsMd/9MeK8fWy0ESkk9qgo8I0SbSR0JoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KUldhEFP3z95xCUEHpjynTEHEFEJ6BI5EDTHvjXB6oK1C/lbvi1jyjM2hacbJ3t9pqOVItyabW8f+H9t6lF1rvnpKqWQTXyVyd25myT8bVw9TBXwKI+WQyblCzTR7dhxfTItUnCu41dZr7k1DSWFZIf22KvWjOp9tSR5CrsFHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CCnhAZ2V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CCnhAZ2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783352688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Cr9Tv04iscHstsqijOSB1nXfodRf1ay3tseK8r1HWU=;
	b=CCnhAZ2VvohDMQZcnjvazPybyXXvclBULrlXVrooXoFRHo3RJWbbaWe0MsLn1U5qCG+nk0
	nLyTajgO8JEEonOtsGBk281LbFyiWaIM/snKnNJTHBEYkNaIzGSUVhDpKNDzS/e03TWvUi
	lrxXiSckCP3GRR7Do5qz7DYvGg/CVlE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-PHuIRXnBPDCgGhZSdEPIPw-1; Mon,
 06 Jul 2026 11:44:42 -0400
X-MC-Unique: PHuIRXnBPDCgGhZSdEPIPw-1
X-Mimecast-MFC-AGG-ID: PHuIRXnBPDCgGhZSdEPIPw_1783352678
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A7D11802673;
	Mon,  6 Jul 2026 15:44:38 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.58.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 28439195604B;
	Mon,  6 Jul 2026 15:44:29 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
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
Subject: [PATCH 3/8] mm/khugepaged: introduce a count_collapse_event() helper
Date: Mon,  6 Jul 2026 09:44:50 -0600
Message-ID: <20260706154500.39178-4-npache@redhat.com>
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

Provide a simple helper function to help reduce a often used, and
duplicate pattern across the khugepaged code.

When collapsing to a PMD we need to record a vm_event and the mTHP_stat
event. When doing mTHP collapse we only update the mTHP stat.

Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 48b008a3c891..7047253a6fb6 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -692,6 +692,14 @@ static inline bool collapse_is_young(struct collapse_control *cc, pte_t pteval,
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
@@ -712,9 +720,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 		if (pte_none_or_zero(pteval)) {
 			if (++none_or_zero > max_ptes_none) {
 				result = SCAN_EXCEED_NONE_PTE;
-				if (is_pmd_order(order))
-					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_NONE);
+				count_collapse_event(order, THP_SCAN_EXCEED_NONE_PTE,
+						MTHP_STAT_COLLAPSE_EXCEED_NONE);
 				goto out;
 			}
 			continue;
@@ -756,9 +763,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			 */
 			if (++shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
-				if (is_pmd_order(order))
-					count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
-				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SHARED);
+				count_collapse_event(order, THP_SCAN_EXCEED_SHARED_PTE,
+						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
 				goto out;
 			}
 		}
@@ -1267,15 +1273,12 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
 	folio = __folio_alloc(gfp, order, node, &cc->alloc_nmask);
 	if (!folio) {
 		*foliop = NULL;
-		if (is_pmd_order(order))
-			count_vm_event(THP_COLLAPSE_ALLOC_FAILED);
-		count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC_FAILED);
+		count_collapse_event(order, THP_COLLAPSE_ALLOC_FAILED,
+				MTHP_STAT_COLLAPSE_ALLOC_FAILED);
 		return SCAN_ALLOC_HUGE_PAGE_FAIL;
 	}
 
-	if (is_pmd_order(order))
-		count_vm_event(THP_COLLAPSE_ALLOC);
-	count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC);
+	count_collapse_event(order, THP_COLLAPSE_ALLOC, MTHP_STAT_COLLAPSE_ALLOC);
 
 	if (unlikely(mem_cgroup_charge(folio, mm, gfp))) {
 		folio_put(folio);
@@ -1665,8 +1668,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (pte_none_or_zero(pteval)) {
 			if (++none_or_zero > max_ptes_none) {
 				result = SCAN_EXCEED_NONE_PTE;
-				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_NONE_PTE,
 						MTHP_STAT_COLLAPSE_EXCEED_NONE);
 				goto out_unmap;
 			}
@@ -1675,8 +1677,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (!pte_present(pteval)) {
 			if (++unmapped > max_ptes_swap) {
 				result = SCAN_EXCEED_SWAP_PTE;
-				count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SWAP_PTE,
 						MTHP_STAT_COLLAPSE_EXCEED_SWAP);
 				goto out_unmap;
 			}
@@ -1734,8 +1735,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (folio_maybe_mapped_shared(folio)) {
 			if (++shared > max_ptes_shared) {
 				result = SCAN_EXCEED_SHARED_PTE;
-				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SHARED_PTE,
 						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
 				goto out_unmap;
 			}
-- 
2.54.0

