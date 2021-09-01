Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE3DC43214
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 10:27:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39CF26102A
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 10:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236087AbhIAK2o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 06:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236042AbhIAK2e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 06:28:34 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49F5C0613D9
        for <linux-doc@vger.kernel.org>; Wed,  1 Sep 2021 03:27:37 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n13-20020a17090a4e0d00b0017946980d8dso4256173pjh.5
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 03:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=518HupvIQCSXRVp99CqpRO5a1xTSLdj8DGXeA6lhEY4=;
        b=Y6M3ibKJavixp8Ry7n8ce9KBCRxVCGyN2t1uMMIP32bU4t5swLyVv9Ivy2BIe8owOE
         9cmom46LgABhKiSWeNAMR04fXUTnoxwPO9TAIoUcpT2sp6zpMgt8X3cWTDQYK612rQai
         KOsBiDmVb+aBMXo/9JiiDbWVNHoFFvN8Ezkr0NjsTq1vCkkb3VgmO/EXGqUZ6qCLVCbR
         J84ub+n/Uexrw3CYDNS6zHwP22UP2EZtcJBkgpG6Q8n+j2AW1wGFwRCbl7A0Ofk63BCR
         Mk0fXE4kMqwlwdWVFW8Hdrhqds/ElHlZul2t84kfJZZLJSpHZtrgBKtLMwHChstoX5z+
         ilcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=518HupvIQCSXRVp99CqpRO5a1xTSLdj8DGXeA6lhEY4=;
        b=fUzoew1MRpFK61HXBNk8YJLPPGv98FYb9idJ/ILLqiLQBMtmodGxEoLCKh1VhCjYmp
         OfPU9H5KB9zguFouDqiHkdMGaf4jRpy0eL+bZYvKcdMHwNQkoEwWiYuHWT/hyik8K7mM
         F8ub5t/TjtmH1mZtmSc/LPQs63Wl6u4IWWFQxMPQOwvINd2MJSnoelCCespLm8eTohXx
         yVfCvY+2YFLlZYtlk7T3EXx3nisgA6rWJS8/hqXhBfqknVVyofuoocyiUL0+BcbVAVU4
         5wLDKsDHSoZsLvTX+j7rRZHqgpxK4iNVDz6NjCi5hZ0mwyZkNvB6aFO+Ntm8o5JqVdcD
         9UwQ==
X-Gm-Message-State: AOAM5334+SyKxkpXjr0TKbFOLB84Rz/O8CK8NhKRSb82SjonKa4awz/j
        9WYWKa0GF5BYZb/UVWIVjTeS8A==
X-Google-Smtp-Source: ABdhPJz38k5blrwBPkL0BY6MfMdghSsVRZA6NL5LdyEl42xlFeEXls7W8ELQa3mq0+LeniVaXAWLOw==
X-Received: by 2002:a17:90a:1282:: with SMTP id g2mr11130251pja.230.1630492057159;
        Wed, 01 Sep 2021 03:27:37 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id i10sm5291497pfk.87.2021.09.01.03.27.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Sep 2021 03:27:36 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, vbabka@suse.cz
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 1/2] mm: introduce pmd_install() helper
Date:   Wed,  1 Sep 2021 18:27:21 +0800
Message-Id: <20210901102722.47686-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210901102722.47686-1-zhengqi.arch@bytedance.com>
References: <20210901102722.47686-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently we have three times the same few lines repeated in the
code. Deduplicate them by newly introduced pmd_install() helper.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
---
 mm/filemap.c  | 11 ++---------
 mm/internal.h |  1 +
 mm/memory.c   | 34 ++++++++++++++++------------------
 3 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index c90b6e4984c9..923cbba1bf37 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -3209,15 +3209,8 @@ static bool filemap_map_pmd(struct vm_fault *vmf, struct page *page)
 	    }
 	}
 
-	if (pmd_none(*vmf->pmd)) {
-		vmf->ptl = pmd_lock(mm, vmf->pmd);
-		if (likely(pmd_none(*vmf->pmd))) {
-			mm_inc_nr_ptes(mm);
-			pmd_populate(mm, vmf->pmd, vmf->prealloc_pte);
-			vmf->prealloc_pte = NULL;
-		}
-		spin_unlock(vmf->ptl);
-	}
+	if (pmd_none(*vmf->pmd))
+		pmd_install(mm, vmf->pmd, &vmf->prealloc_pte);
 
 	/* See comment in handle_pte_fault() */
 	if (pmd_devmap_trans_unstable(vmf->pmd)) {
diff --git a/mm/internal.h b/mm/internal.h
index b1001ebeb286..18256e32a14c 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -47,6 +47,7 @@ bool __folio_end_writeback(struct folio *folio);
 
 void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *start_vma,
 		unsigned long floor, unsigned long ceiling);
+void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte);
 
 static inline bool can_madv_lru_vma(struct vm_area_struct *vma)
 {
diff --git a/mm/memory.c b/mm/memory.c
index 39e7a1495c3c..ef7b1762e996 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -433,9 +433,20 @@ void free_pgtables(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	}
 }
 
+void pmd_install(struct mm_struct *mm, pmd_t *pmd, pgtable_t *pte)
+{
+	spinlock_t *ptl = pmd_lock(mm, pmd);
+
+	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
+		mm_inc_nr_ptes(mm);
+		pmd_populate(mm, pmd, *pte);
+		*pte = NULL;
+	}
+	spin_unlock(ptl);
+}
+
 int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 {
-	spinlock_t *ptl;
 	pgtable_t new = pte_alloc_one(mm);
 	if (!new)
 		return -ENOMEM;
@@ -455,13 +466,7 @@ int __pte_alloc(struct mm_struct *mm, pmd_t *pmd)
 	 */
 	smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
 
-	ptl = pmd_lock(mm, pmd);
-	if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
-		mm_inc_nr_ptes(mm);
-		pmd_populate(mm, pmd, new);
-		new = NULL;
-	}
-	spin_unlock(ptl);
+	pmd_install(mm, pmd, &new);
 	if (new)
 		pte_free(mm, new);
 	return 0;
@@ -4027,17 +4032,10 @@ vm_fault_t finish_fault(struct vm_fault *vmf)
 				return ret;
 		}
 
-		if (vmf->prealloc_pte) {
-			vmf->ptl = pmd_lock(vma->vm_mm, vmf->pmd);
-			if (likely(pmd_none(*vmf->pmd))) {
-				mm_inc_nr_ptes(vma->vm_mm);
-				pmd_populate(vma->vm_mm, vmf->pmd, vmf->prealloc_pte);
-				vmf->prealloc_pte = NULL;
-			}
-			spin_unlock(vmf->ptl);
-		} else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd))) {
+		if (vmf->prealloc_pte)
+			pmd_install(vma->vm_mm, vmf->pmd, &vmf->prealloc_pte);
+		else if (unlikely(pte_alloc(vma->vm_mm, vmf->pmd)))
 			return VM_FAULT_OOM;
-		}
 	}
 
 	/* See comment in handle_pte_fault() */
-- 
2.11.0

