Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC2BC64E7B
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 06:48:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA03D223B0
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 06:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="pYEZWv1T"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgKTGsG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 01:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgKTGsG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 01:48:06 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A21DC0613CF
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 22:48:06 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id y7so6912680pfq.11
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 22:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=40WMQjbHo+8UGODnuWlLj4XyZtBc8woPFg0/w4orzdo=;
        b=pYEZWv1T0tL0lGNesIdLrYCxfDzq2+HKtxnPtQ7I+tcNYvWauOzOqq0rdsqoL3WCcz
         gSbp3+T3jVQU2RQum5FMqHrZWgxIfr2wp5A9v8Cdhd5DGbXmD2L4bxkzY42kmjG9cIUH
         fAi5wKFAFOzIfV1MLERSFvqnsWmR0MiuMwB6eS3DtARTH1H+WS+z2Zvfs+I9znah3LUG
         BcPOCYm53JSvO+hY+tWTemSSZs5KVGP1P4qBwSB3Xz5mMDup831mnAdWrSkDgEtY9uGJ
         gLFXOzJvW8cnd23ADjilhcGhbk8n2VG4Jvg4RLxQ2Qiv1a/m4igF7uP0iyCqD9lg+Miv
         h38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=40WMQjbHo+8UGODnuWlLj4XyZtBc8woPFg0/w4orzdo=;
        b=kEArYckcYHXzNiAqRltKG+bDlvGj1taFZ/5V9Jl419UmvVyEMxRx7vg0r2qjAfYOLD
         mpS5rYP5bfZIghMesAP0knk7O+4QwU0zBegjl+V+U6DYA0YT1x965v/siFmFt3AKxicf
         XM8akJsI9iQ/IQY1eZK8/moEZ5EK3MhvfwCqhvfoePHlGx8UjaOKj67n/jfj1seyKY+g
         ocGgNUcB/DmAKuEXGopMcIr7EutSy5wO1/xnb5Virxyx3xsTyQTd0Eqy2Ug55LX9PbbM
         dTC+OP6TGB/cbuEII2mulg6tEa7132A/HwQD1AN8UQeeVuB5l+Tckfb68LY5jeFKVPtp
         c18Q==
X-Gm-Message-State: AOAM5323Hgk26/lD+oUDGQ9EzD7p3bHbfWD8Dp0lKyQ9Z5dYz3vipXbs
        WC7fjDBZXhJlzUai3c77O3sfqQ==
X-Google-Smtp-Source: ABdhPJzXjuTO9HWUVhtlJ0CQGQ7elxxZ9bu50VSldbcP9gEyfov/85MTLykB2qt4TG3pamTawMR/rg==
X-Received: by 2002:a17:90a:b303:: with SMTP id d3mr4023927pjr.207.1605854885928;
        Thu, 19 Nov 2020 22:48:05 -0800 (PST)
Received: from localhost.localdomain ([103.136.221.72])
        by smtp.gmail.com with ESMTPSA id 23sm2220278pfx.210.2020.11.19.22.47.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 22:48:05 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v5 12/21] mm/hugetlb: Introduce remap_huge_page_pmd_vmemmap helper
Date:   Fri, 20 Nov 2020 14:43:16 +0800
Message-Id: <20201120064325.34492-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201120064325.34492-1-songmuchun@bytedance.com>
References: <20201120064325.34492-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The __free_huge_page_pmd_vmemmap and __remap_huge_page_pmd_vmemmap are
almost the same code. So introduce remap_free_huge_page_pmd_vmemmap
helper to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 108 +++++++++++++++++++++------------------------------
 1 file changed, 45 insertions(+), 63 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 361c4174e222..06e2b8a7b7c8 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -252,6 +252,47 @@ static inline int freed_vmemmap_hpage_dec(struct page *page)
 	return atomic_dec_return_relaxed(&page->_mapcount) + 1;
 }
 
+static inline void free_vmemmap_page_list(struct list_head *list)
+{
+	struct page *page, *next;
+
+	list_for_each_entry_safe(page, next, list, lru) {
+		list_del(&page->lru);
+		free_vmemmap_page(page);
+	}
+}
+
+typedef void (*remap_pte_fn)(struct page *reuse, pte_t *ptep,
+			     unsigned long start, unsigned long end,
+			     struct list_head *pages);
+
+static void remap_huge_page_pmd_vmemmap(struct hstate *h, pmd_t *pmd,
+					unsigned long addr,
+					struct list_head *pages,
+					remap_pte_fn remap_fn)
+{
+	unsigned long next;
+	unsigned long start = addr + RESERVE_VMEMMAP_SIZE;
+	unsigned long end = addr + vmemmap_pages_size_per_hpage(h);
+	struct page *reuse = NULL;
+
+	flush_cache_vunmap(start, end);
+
+	addr = start;
+	do {
+		pte_t *ptep;
+
+		ptep = pte_offset_kernel(pmd, addr);
+		if (!reuse)
+			reuse = pte_page(ptep[TAIL_PAGE_REUSE]);
+
+		next = vmemmap_hpage_addr_end(addr, end);
+		remap_fn(reuse, ptep, addr, next, pages);
+	} while (pmd++, addr = next, addr != end);
+
+	flush_tlb_kernel_range(start, end);
+}
+
 static void __remap_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
 					  unsigned long start,
 					  unsigned long end,
@@ -286,31 +327,6 @@ static void __remap_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
 	}
 }
 
-static void __remap_huge_page_pmd_vmemmap(struct hstate *h, pmd_t *pmd,
-					  unsigned long addr,
-					  struct list_head *remap_pages)
-{
-	unsigned long next;
-	unsigned long start = addr + RESERVE_VMEMMAP_SIZE;
-	unsigned long end = addr + vmemmap_pages_size_per_hpage(h);
-	struct page *reuse = NULL;
-
-	addr = start;
-	do {
-		pte_t *ptep;
-
-		ptep = pte_offset_kernel(pmd, addr);
-		if (!reuse)
-			reuse = pte_page(ptep[TAIL_PAGE_REUSE]);
-
-		next = vmemmap_hpage_addr_end(addr, end);
-		__remap_huge_page_pte_vmemmap(reuse, ptep, addr, next,
-					      remap_pages);
-	} while (pmd++, addr = next, addr != end);
-
-	flush_tlb_kernel_range(start, end);
-}
-
 static inline void alloc_vmemmap_pages(struct hstate *h, struct list_head *list)
 {
 	int i;
@@ -339,8 +355,8 @@ void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 	BUG_ON(!pmd);
 
 	ptl = vmemmap_pmd_lock(pmd);
-	__remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head,
-				      &remap_pages);
+	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &remap_pages,
+				    __remap_huge_page_pte_vmemmap);
 	if (!freed_vmemmap_hpage_dec(pmd_page(*pmd))) {
 		/*
 		 * Todo:
@@ -350,16 +366,6 @@ void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 	spin_unlock(ptl);
 }
 
-static inline void free_vmemmap_page_list(struct list_head *list)
-{
-	struct page *page, *next;
-
-	list_for_each_entry_safe(page, next, list, lru) {
-		list_del(&page->lru);
-		free_vmemmap_page(page);
-	}
-}
-
 static void __free_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
 					 unsigned long start,
 					 unsigned long end,
@@ -382,31 +388,6 @@ static void __free_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
 	}
 }
 
-static void __free_huge_page_pmd_vmemmap(struct hstate *h, pmd_t *pmd,
-					 unsigned long addr,
-					 struct list_head *free_pages)
-{
-	unsigned long next;
-	unsigned long start = addr + RESERVE_VMEMMAP_SIZE;
-	unsigned long end = addr + vmemmap_pages_size_per_hpage(h);
-	struct page *reuse = NULL;
-
-	addr = start;
-	do {
-		pte_t *ptep;
-
-		ptep = pte_offset_kernel(pmd, addr);
-		if (!reuse)
-			reuse = pte_page(ptep[TAIL_PAGE_REUSE]);
-
-		next = vmemmap_hpage_addr_end(addr, end);
-		__free_huge_page_pte_vmemmap(reuse, ptep, addr, next,
-					     free_pages);
-	} while (pmd++, addr = next, addr != end);
-
-	flush_tlb_kernel_range(start, end);
-}
-
 static void split_vmemmap_pmd(pmd_t *pmd, pte_t *pte_p, unsigned long addr)
 {
 	int i;
@@ -465,7 +446,8 @@ void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 	if (vmemmap_pmd_huge(pmd))
 		split_vmemmap_huge_page(head, pmd);
 
-	__free_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages);
+	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages,
+				    __free_huge_page_pte_vmemmap);
 	freed_vmemmap_hpage_inc(pmd_page(*pmd));
 	spin_unlock(ptl);
 
-- 
2.11.0

