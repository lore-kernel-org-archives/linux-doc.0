Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA562E6CD9;
	Mon, 15 Dec 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765802334; cv=none; b=YI2AhOKj/qTe0kqzXA1zQ9iknw1DYWiZj7W/ERgSuexhdoiLqeUs1KHRTlbMxYmoM3iRh0yepGFAQUXv4VCBjS4XwtadqQq2lOKYRFFvQLCWpUoS0gopg1PSoFYGyQs0hBOjt82KiMKnFxvkJ9dBXPrYaHZGlzZozoxzmJ0pTKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765802334; c=relaxed/simple;
	bh=dXqRxpdXYNuaM5saDL8Jk1BNUPxMEBKmBzi5d7CGSfw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLdoJclgaDQMNcB0z8bc6AE43d1rmzg+NJVbB5q36UqgfQfhniqCSyfq0HTr4SQX7G7SmPxyY3QRODrV6uiG87NYq+hp4Uk7WuKUk97Y0qpQrXP31x5aY69ACCT+omdip7Rt+qKRB7yodczjG9HO6kULvmKEYQfr1HcVcdwWUbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EiSq5tAN; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=EiSq5tAN; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EiSq5tAN";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="EiSq5tAN"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IJmsIws2mLYC652kvn3o4ft4IK0jQqiU6SZLxP6Ytqo=;
	b=EiSq5tAN8xJGoKtGeYhSE57XqFDqGACwNiGtuBJWFNPuoQhTT9mhwjUW8WumkSkME+FipFboe
	WSME+CqunWjgfjA/YSu1KwtIUVc2jCshk/sV41e3VzntzrLHpbkOvIbQof5XypWpcJ/1in3FfoV
	FJgAOLCg+cOxg91bWWbHB/Q=
Received: from canpmsgout10.his.huawei.com (unknown [172.19.92.130])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dVKNk4fjjz1BG31;
	Mon, 15 Dec 2025 20:38:30 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=IJmsIws2mLYC652kvn3o4ft4IK0jQqiU6SZLxP6Ytqo=;
	b=EiSq5tAN8xJGoKtGeYhSE57XqFDqGACwNiGtuBJWFNPuoQhTT9mhwjUW8WumkSkME+FipFboe
	WSME+CqunWjgfjA/YSu1KwtIUVc2jCshk/sV41e3VzntzrLHpbkOvIbQof5XypWpcJ/1in3FfoV
	FJgAOLCg+cOxg91bWWbHB/Q=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dVKLd6Kn6z1K968;
	Mon, 15 Dec 2025 20:36:41 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (unknown [7.185.36.8])
	by mail.maildlp.com (Postfix) with ESMTPS id C3F291402C6;
	Mon, 15 Dec 2025 20:38:39 +0800 (CST)
Received: from huawei.com (10.50.85.135) by dggpemf500012.china.huawei.com
 (7.185.36.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 15 Dec
 2025 20:38:38 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>,
	<lorenzo.stoakes@oracle.com>, <corbet@lwn.net>
CC: <ziy@nvidia.com>, <baolin.wang@linux.alibaba.com>,
	<Liam.Howlett@oracle.com>, <npache@redhat.com>, <ryan.roberts@arm.com>,
	<dev.jain@arm.com>, <baohua@kernel.org>, <lance.yang@linux.dev>,
	<vbabka@suse.cz>, <rppt@kernel.org>, <surenb@google.com>, <mhocko@suse.com>,
	<wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>, <linux-mm@kvack.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Zhang Qilong
	<zhangqilong3@huawei.com>
Subject: [PATCH next 1/2] mm/huge_memory: Implementation of THP COW for executable file mmap
Date: Mon, 15 Dec 2025 20:34:06 +0800
Message-ID: <20251215123407.380813-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215123407.380813-1-zhangqilong3@huawei.com>
References: <20251215123407.380813-1-zhangqilong3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500012.china.huawei.com (7.185.36.8)

During the user-space hot patching, the involved executable file
segments of private mapping will be modified. If the modification
meets THP mapping, the PMD entry will be cleared at first and do
page COW fault handle.

Currently, khugepaged may attempt to merge scattered file pages
into THP. However, due to the single page COW, the modified
executable segments can not be mapped in THP once again for hot
patched process. Hence it can not benefit form khugepaged efforts.
The executable segment mapped in page granularity may reduce the
iTLB cache hit rate compared with the original THP mapping.

For user-space hot patching, we introduce THP COW support for the
executable mapping. If the exec COW meets THP mapping, it will
allocate a anonymous THP and map it to remain PMD mapping.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 include/linux/huge_mm.h |  1 +
 mm/huge_memory.c        | 87 +++++++++++++++++++++++++++++++++++++++++
 mm/memory.c             | 12 ++++++
 3 files changed, 100 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index f381339842fa..bae856a53e1f 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -23,10 +23,11 @@ static inline void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
 {
 }
 #endif
 
 vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf);
+vm_fault_t do_huge_pmd_exec_cow(struct vm_fault *vmf);
 bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			   pmd_t *pmd, unsigned long addr, unsigned long next);
 int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma, pmd_t *pmd,
 		 unsigned long addr);
 int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma, pud_t *pud,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index aae283b00857..35ecd62f64c4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2137,10 +2137,97 @@ vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
 fallback:
 	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
 	return VM_FAULT_FALLBACK;
 }
 
+vm_fault_t do_huge_pmd_exec_cow(struct vm_fault *vmf)
+{
+	vm_fault_t ret;
+	struct vm_area_struct *vma = vmf->vma;
+	struct folio *folio, *src_folio;
+	pmd_t orig_pmd = vmf->orig_pmd;
+	unsigned long haddr = vmf->address & PMD_MASK;
+	struct mmu_notifier_range range;
+	pgtable_t pgtable = NULL;
+
+	ret = vmf_anon_prepare(vmf);
+	if (ret)
+		return ret;
+
+	folio = vma_alloc_anon_folio_pmd(vma, haddr);
+	if (!folio)
+		return VM_FAULT_FALLBACK;
+
+	if (!arch_needs_pgtable_deposit()) {
+		pgtable = pte_alloc_one(vma->vm_mm);
+		if (!pgtable) {
+			ret = VM_FAULT_OOM;
+			goto release;
+		}
+	}
+
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
+				haddr, haddr + HPAGE_PMD_SIZE);
+	mmu_notifier_invalidate_range_start(&range);
+	vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(pmdp_get(vmf->pmd), orig_pmd)))
+		goto unlock_ptl;
+
+	ret = check_stable_address_space(vma->vm_mm);
+	if (ret)
+		goto unlock_ptl;
+
+	src_folio = pmd_folio(orig_pmd);
+	if (!folio_trylock(src_folio)) {
+		ret = VM_FAULT_FALLBACK;
+		goto unlock_ptl;
+	}
+
+	/*
+	 * If uptodate bit is not set, it means this source folio is
+	 * stale or invalid now, this memory data in it is not
+	 * untrustworthy. So we just avoid copying it and fallback.
+	 */
+	if (!folio_test_uptodate(src_folio)) {
+		ret = VM_FAULT_FALLBACK;
+		goto unlock_folio;
+	}
+
+	if (copy_user_large_folio(folio, src_folio, haddr, vma)) {
+		ret = VM_FAULT_HWPOISON;
+		goto unlock_folio;
+	}
+	folio_mark_uptodate(folio);
+
+	folio_unlock(src_folio);
+	pmdp_huge_clear_flush(vma, haddr, vmf->pmd);
+	folio_remove_rmap_pmd(src_folio, folio_page(src_folio, 0), vma);
+	add_mm_counter(vma->vm_mm, mm_counter_file(src_folio), -HPAGE_PMD_NR);
+	folio_put(src_folio);
+
+	map_anon_folio_pmd_pf(folio, vmf->pmd, vma, haddr);
+	if (pgtable)
+		pgtable_trans_huge_deposit(vma->vm_mm, vmf->pmd, pgtable);
+	mm_inc_nr_ptes(vma->vm_mm);
+	spin_unlock(vmf->ptl);
+	mmu_notifier_invalidate_range_end(&range);
+
+	return ret;
+
+unlock_folio:
+	folio_unlock(src_folio);
+unlock_ptl:
+	spin_unlock(vmf->ptl);
+	mmu_notifier_invalidate_range_end(&range);
+release:
+	if (pgtable)
+		pte_free(vma->vm_mm, pgtable);
+	folio_put(folio);
+
+	return ret;
+}
+
 static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
 					   unsigned long addr, pmd_t pmd)
 {
 	struct page *page;
 
diff --git a/mm/memory.c b/mm/memory.c
index 1c66ee83a7ab..e282adec9165 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6133,10 +6133,22 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf)
 			if (!(ret & VM_FAULT_FALLBACK))
 				return ret;
 		}
 	}
 
+
+	if (is_exec_mapping(vma->vm_flags) &&
+	    is_cow_mapping(vma->vm_flags)) {
+		/* Skip special and shmem */
+		if (vma_is_special_huge(vma) || vma_is_shmem(vma))
+			goto split;
+
+		ret = do_huge_pmd_exec_cow(vmf);
+		if (!(ret & VM_FAULT_FALLBACK))
+			return ret;
+	}
+
 split:
 	/* COW or write-notify handled on pte level: split pmd. */
 	__split_huge_pmd(vma, vmf->pmd, vmf->address, false);
 
 	return VM_FAULT_FALLBACK;
-- 
2.43.0

