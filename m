Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6975C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AC22206A5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Wgzm21bN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIPAkr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbgIONDs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:03:48 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF2BC061223
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:03:35 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bg9so1308996plb.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ihCUQw41R9FsrvHiFmfh05nKlVrGscgM2mtw6HnVyB4=;
        b=Wgzm21bNvJZeUfE39i61WSjnncEdFvnHsL6LRcbfbG8qMG80SsNRb0yky3uwNluR3+
         umeMtCxwqly+HGJDLRnGorII5eM5IdLf1djntn6fwT/R5UYUthd+BHyHoE4LKDZktijr
         BpJYY8arAS8SfRzbOhUm/N4L4wd9Ob4CRxu6GZwVvSNL22KgZrpmAG6UinFkq1NYYmqi
         TRDTb4+UgBz2JjAPc/D3vBT6t28H6VBjmoZo6G5kcrkxVlBQtc0+mkc06gyxgAGNvCus
         Np4R0taSFSkEnjfVEMOsgW5itFIzztw5KRRwOtKB9RYurZSqtjBLrImHSHKyvmMwWdPq
         pdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ihCUQw41R9FsrvHiFmfh05nKlVrGscgM2mtw6HnVyB4=;
        b=YCcMpCJB2ThzQ3brDFqFwwH/VXiPewhfETGGLx8QLdcEUDVLM/MleXnar+ArMAIfti
         lW4tCeJeOSZ/O8+4YiIANrm+XaNRmG9miardRK0ZhawgzROrl+gxKkzzwWeOrcX5RYh5
         hnnKchdqYP/WLF/zSkdy6os78+0IgBwpSNtiv/slsXuQugWo/q62yxMInRdJRoMWZnpb
         ZxahklO+34O7g0V1QhMNSekbX0EPxY7vuoPDpRnQa3Ox4vjhUdb0LM7xUB2UxrgOqklv
         WraaunfolPbgtKNT9bhkY7IPfzsXQh/RmqYpfoXw8K0dekfO3Sl60CjqBw+J8QNK7g0+
         lIqw==
X-Gm-Message-State: AOAM5337k0La7i9u7nCTaXC+jRLkmbRytRTUVxM+x8RK1/KQdviNxFto
        JyvNZvm1SqEyyQzSTg6BboNNVQ==
X-Google-Smtp-Source: ABdhPJwx+1+21x7mTbb5CN2n3sjsO5NUiwrurWvh4dnjgbleOwi+3x3ysk5XetVWc3sCkJRiFuSnPA==
X-Received: by 2002:a17:902:70c2:b029:d1:dea3:a4d6 with SMTP id l2-20020a17090270c2b02900d1dea3a4d6mr3314865plt.4.1600175015447;
        Tue, 15 Sep 2020 06:03:35 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.03.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:03:34 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [RFC PATCH 21/24] mm/hugetlb: Merge pte to huge pmd only for gigantic page
Date:   Tue, 15 Sep 2020 20:59:44 +0800
Message-Id: <20200915125947.26204-22-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Merge pte to huge pmd if it has ever been split. Now only support
gigantic page which's vmemmap pages size is an integer multiple of
PMD_SIZE. This is the simplest case to handle.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/hugetlb.h |   7 +++
 mm/hugetlb.c            | 104 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index e3aa192f1c39..c56df0da7ae5 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -611,6 +611,13 @@ static inline bool vmemmap_pmd_huge(pmd_t *pmd)
 }
 #endif
 
+#ifndef vmemmap_pmd_mkhuge
+static inline pmd_t vmemmap_pmd_mkhuge(struct page *page)
+{
+	return pmd_mkhuge(mk_pmd(page, PAGE_KERNEL));
+}
+#endif
+
 #ifndef VMEMMAP_HPAGE_SHIFT
 #define VMEMMAP_HPAGE_SHIFT		PMD_SHIFT
 #endif
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 28c154679838..3ca36e259b4e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1759,6 +1759,62 @@ static void __remap_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
 	}
 }
 
+static void __replace_huge_page_pte_vmemmap(pte_t *ptep, unsigned long start,
+					    unsigned int nr, struct page *huge,
+					    struct list_head *free_pages)
+{
+	unsigned long addr;
+	unsigned long end = start + (nr  << PAGE_SHIFT);
+
+	for (addr = start; addr < end; addr += PAGE_SIZE, ptep++) {
+		struct page *page;
+		pte_t old = *ptep;
+		pte_t entry;
+
+		prepare_vmemmap_page(huge);
+
+		entry = mk_pte(huge++, PAGE_KERNEL);
+		VM_WARN_ON(!pte_present(old));
+		page = pte_page(old);
+		list_add(&page->lru, free_pages);
+
+		set_pte_at(&init_mm, addr, ptep, entry);
+	}
+}
+
+static void replace_huge_page_pmd_vmemmap(pmd_t *pmd, unsigned long start,
+					  struct page *huge,
+					  struct list_head *free_pages)
+{
+	unsigned long end = start + VMEMMAP_HPAGE_SIZE;
+
+	flush_cache_vunmap(start, end);
+	__replace_huge_page_pte_vmemmap(pte_offset_kernel(pmd, start), start,
+					VMEMMAP_HPAGE_NR, huge, free_pages);
+	flush_tlb_kernel_range(start, end);
+}
+
+static pte_t *merge_vmemmap_pte(pmd_t *pmdp, unsigned long addr)
+{
+	pte_t *pte;
+	struct page *page;
+
+	pte = pte_offset_kernel(pmdp, addr);
+	page = pte_page(*pte);
+	set_pmd(pmdp, vmemmap_pmd_mkhuge(page));
+
+	return pte;
+}
+
+static void merge_huge_page_pmd_vmemmap(pmd_t *pmd, unsigned long start,
+					struct page *huge,
+					struct list_head *free_pages)
+{
+	replace_huge_page_pmd_vmemmap(pmd, start, huge, free_pages);
+	pte_free_kernel(&init_mm, merge_vmemmap_pte(pmd, start));
+	flush_tlb_kernel_range(start, start + VMEMMAP_HPAGE_SIZE);
+}
+
 static inline void alloc_vmemmap_pages(struct hstate *h, struct list_head *list)
 {
 	int i;
@@ -1772,6 +1828,15 @@ static inline void alloc_vmemmap_pages(struct hstate *h, struct list_head *list)
 	}
 }
 
+static inline void dissolve_compound_page(struct page *page, unsigned int order)
+{
+	int i;
+	unsigned int nr_pages = 1 << order;
+
+	for (i = 1; i < nr_pages; i++)
+		set_page_refcounted(page + i);
+}
+
 static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 	pmd_t *pmd;
@@ -1791,10 +1856,45 @@ static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 				    __remap_huge_page_pte_vmemmap);
 	if (!freed_vmemmap_hpage_dec(pmd_page(*pmd)) && pmd_split(pmd)) {
 		/*
-		 * Todo:
-		 * Merge pte to huge pmd if it has ever been split.
+		 * Merge pte to huge pmd if it has ever been split. Now only
+		 * support gigantic page which's vmemmap pages size is an
+		 * integer multiple of PMD_SIZE. This is the simplest case
+		 * to handle.
 		 */
 		clear_pmd_split(pmd);
+
+		if (IS_ALIGNED(nr_vmemmap(h), VMEMMAP_HPAGE_NR)) {
+			unsigned long addr = (unsigned long)head;
+			unsigned long end = addr + nr_vmemmap_size(h);
+
+			spin_unlock(ptl);
+
+			for (; addr < end; addr += VMEMMAP_HPAGE_SIZE) {
+				void *to;
+				struct page *page;
+
+				page = alloc_pages(GFP_VMEMMAP_PAGE & ~__GFP_NOFAIL,
+						   VMEMMAP_HPAGE_ORDER);
+				if (!page)
+					goto out;
+
+				to = page_to_virt(page);
+				memcpy(to, (void *)addr, VMEMMAP_HPAGE_SIZE);
+
+				/*
+				 * Make sure that any data that writes to the
+				 * @to is made visible to the physical page.
+				 */
+				flush_kernel_vmap_range(to, VMEMMAP_HPAGE_SIZE);
+
+				merge_huge_page_pmd_vmemmap(pmd++, addr, page,
+							    &remap_pages);
+			}
+
+out:
+			free_vmemmap_page_list(&remap_pages);
+			return;
+		}
 	}
 	spin_unlock(ptl);
 }
-- 
2.20.1

