Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A431C55ABD
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48959208B6
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:14:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Ep+CuZUX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbgKHON4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:13:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbgKHONy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:13:54 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE06C0613D3
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:13:54 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id h6so4621767pgk.4
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qFvWVRuWHt463dQDdqukGR7bqLaRSs18WBT8QT/EalE=;
        b=Ep+CuZUX/uBfg+ywqlNDPDWSezOzVFRCpwC4tRkIO5YtwQn+xjHA9ywAq9dgs2V1cT
         jVd/BxEsvDq9s1xrtgaq60SbNKEhiZcSX2L2HsARVmWDr6r245JppS+LyNIjaUXHFZkt
         /c2+xuW2xqGJCmK6CUkwZ5gEI57L7XM+D8+7c3GBNsP6rKWjLpiz7p757SnSXKbxBQu6
         0571GGcCt7T+9UlS5tlBl3PEI2liBVMWR4ZlYm1LzJ8q2DwYuMyZT5gjFQp0spvSijy0
         G3nHtcUyF+HOwPf6AD2tiDiMxG+sMdqtIiB+8YjqqPEkJx7OMKBWwt1NWQD7GvMwMQSx
         mZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qFvWVRuWHt463dQDdqukGR7bqLaRSs18WBT8QT/EalE=;
        b=m2f21gNCZbg0k1ct2ZyX7udT+39u0JL2/YbVSeNz0v1nJ6bf8BZQ6NIj/pkZVdxrdz
         1HOFqrYsgdHsF3SUrW4Ydu/a4EXdKx2zFrbJTEunwxB+S0yIGphVfdIRLnGVjFwHGEc/
         P1N+u7Dstv5Uv+lQJXWHCkS5pPTWcA4K9TAsbnklGsK29gyzMvev48Lc0Rn0pozL8QJ9
         HaHem0T6X1r8llU/X046GQ8uRaejvaapzcVBniaVKm/rep0dJC4TQbBIPSqjFNTFYHL+
         ba1HKGpzkLqUp4Fw3GkmRy9utEdUXOjsrh6fphRgX7qBINm1X7gC+7S7J1GJCQgNQC8l
         0MbQ==
X-Gm-Message-State: AOAM532a3Pa2wEmJISSgr2knZleoR/1EmBxT+b5NM6wDs5nDLoiwlhLW
        5dxyz3u4VOIr8Zeu/zRq4AK2xQ==
X-Google-Smtp-Source: ABdhPJz7zuNAIV4IAVZhc7gKx9qk6parvKFljufOCjpJdrnjCZATqW0v3rLLOKJQc2CnPwKMO8GR7w==
X-Received: by 2002:a63:3202:: with SMTP id y2mr9079909pgy.97.1604844834110;
        Sun, 08 Nov 2020 06:13:54 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.13.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:13:53 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 13/21] mm/hugetlb: Use PG_slab to indicate split pmd
Date:   Sun,  8 Nov 2020 22:11:05 +0800
Message-Id: <20201108141113.65450-14-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we allocate hugetlb page from buddy, we may need split huge pmd
to pte. When we free the hugetlb page, we can merge pte to pmd. So
we need to distinguish whether the previous pmd has been split. The
page table is not allocated from slab. So we can reuse the PG_slab
to indicate that the pmd has been split.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 5d3806476212..9b1ac52d9fdd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1565,6 +1565,25 @@ static void split_vmemmap_huge_page(struct hstate *h, struct page *head,
 	flush_tlb_kernel_range(start, addr);
 }
 
+static inline bool pmd_split(pmd_t *pmd)
+{
+	return PageSlab(pmd_page(*pmd));
+}
+
+static inline void set_pmd_split(pmd_t *pmd)
+{
+	/*
+	 * We should not use slab for page table allocation. So we can set
+	 * PG_slab to indicate that the pmd has been split.
+	 */
+	__SetPageSlab(pmd_page(*pmd));
+}
+
+static inline void clear_pmd_split(pmd_t *pmd)
+{
+	__ClearPageSlab(pmd_page(*pmd));
+}
+
 static void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 	pmd_t *pmd;
@@ -1579,6 +1598,7 @@ static void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 	if (vmemmap_pmd_huge(pmd)) {
 		VM_BUG_ON(!pgtable_pages_to_prealloc_per_hpage(h));
 		split_vmemmap_huge_page(h, head, pmd);
+		set_pmd_split(pmd);
 	}
 
 	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages,
@@ -1651,11 +1671,12 @@ static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 	ptl = vmemmap_pmd_lock(pmd);
 	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &remap_pages,
 				    __remap_huge_page_pte_vmemmap);
-	if (!freed_vmemmap_hpage_dec(pmd_page(*pmd))) {
+	if (!freed_vmemmap_hpage_dec(pmd_page(*pmd)) && pmd_split(pmd)) {
 		/*
 		 * Todo:
 		 * Merge pte to huge pmd if it has ever been split.
 		 */
+		clear_pmd_split(pmd);
 	}
 	spin_unlock(ptl);
 }
-- 
2.11.0

