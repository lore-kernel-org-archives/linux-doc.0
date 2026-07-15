Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08D2BEC5E
	for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 03:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084448; cv=none; b=uZwY/kea7ZPXvJqwLVRVuv0hG1459jz5l8CiL/uA3vnnzkLky7W/rkKtuUPeV+LbnoO+CSWgXBc2PdXYrIjgj1tQU+fwCERj55TznoWXgVVvTkWD0hwDCOMcTq6KrfouuAgToysNgMizXgUYUcNIC2NOGLjYHqNMeTXlA7QHL0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084448; c=relaxed/simple;
	bh=KNyBXRp2XfsPB9KVTckBxEueI9znAQwXbhU5Asq5cUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=is1JNlJtSeJPTFa3cTjBkkIX09uyiiFYfCoYsfWIBPpOxoJRBWTNTmj2JdMMy3NBpsgj0Ga+/d99lJqBmTygm0aq30iyxA9jAMkQxq7CTkVyZF3+hkZiNTInjLXhpmc++4dXEnSNtZb3+daHY1FwEp8DZmvMwqw1obc2grDY+HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BA0vNDRy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BA0vNDRy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iPhmQGvxVsdgikGQPOW7y5soGlfMNgvozbvH3hbHJ10=;
	b=BA0vNDRyJwBJPLJm/a+FbRG87rADry077NCMZBLqktH10eXGCTFGtX5UieIoUrYNAeJxEr
	4OGnJtSNfrbs5mjSFlhQm3GUj2ER6MnN7XYEdS4qwIKxzc7HICoTM/Hj6Q/7+EhmouVsH3
	ctDEio84PnQQGh5wjdcecG69K3h2lqY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-282-kbESWq2OMgy90tgGrgby2Q-1; Tue,
 14 Jul 2026 23:00:40 -0400
X-MC-Unique: kbESWq2OMgy90tgGrgby2Q-1
X-Mimecast-MFC-AGG-ID: kbESWq2OMgy90tgGrgby2Q_1784084437
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 273AA19560B2;
	Wed, 15 Jul 2026 03:00:37 +0000 (UTC)
Received: from p1.redhat.com (unknown [10.22.76.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A581A180028B;
	Wed, 15 Jul 2026 03:00:25 +0000 (UTC)
From: Nico Pache <npache@redhat.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Nico Pache <npache@redhat.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Usama Arif <usama.arif@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 3/7] mm/khugepaged: introduce a count_collapse_event() helper
Date: Tue, 14 Jul 2026 20:59:32 -0600
Message-ID: <20260715025941.1571316-4-npache@redhat.com>
In-Reply-To: <20260715025941.1571316-1-npache@redhat.com>
References: <20260715025941.1571316-1-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Provide a simple helper function to help reduce a often used, and
duplicate pattern across the khugepaged code.

When collapsing to a PMD we need to record a vm_event and the mTHP_stat
event. When doing mTHP collapse we only update the mTHP stat.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Acked-by: Usama Arif <usama.arif@linux.dev>
Signed-off-by: Nico Pache <npache@redhat.com>
---
 mm/khugepaged.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e92e2b928f17..f65bbe2051b3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -689,6 +689,14 @@ static inline bool collapse_is_referenced(struct collapse_control *cc, pte_t pte
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
+						MTHP_STAT_COLLAPSE_EXCEED_NONE);
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
+						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
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
+				MTHP_STAT_COLLAPSE_ALLOC_FAILED);
 		return SCAN_ALLOC_HUGE_PAGE_FAIL;
 	}
 
-	if (is_pmd_order(order))
-		count_vm_event(THP_COLLAPSE_ALLOC);
-	count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC);
+	count_collapse_event(order, THP_COLLAPSE_ALLOC, MTHP_STAT_COLLAPSE_ALLOC);
 
 	if (unlikely(mem_cgroup_charge(folio, mm, gfp))) {
 		folio_put(folio);
@@ -1662,8 +1665,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (pte_none_or_zero(pteval)) {
 			if (++none_or_zero > max_ptes_none) {
 				result = SCAN_EXCEED_NONE_PTE;
-				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_NONE_PTE,
 						MTHP_STAT_COLLAPSE_EXCEED_NONE);
 				goto out_unmap;
 			}
@@ -1672,8 +1674,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		if (!pte_present(pteval)) {
 			if (++unmapped > max_ptes_swap) {
 				result = SCAN_EXCEED_SWAP_PTE;
-				count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
-				count_mthp_stat(HPAGE_PMD_ORDER,
+				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SWAP_PTE,
 						MTHP_STAT_COLLAPSE_EXCEED_SWAP);
 				goto out_unmap;
 			}
@@ -1731,8 +1732,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
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

