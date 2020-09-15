Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827ECC43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4A8F120770
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="gHURAa2q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgIPAmy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgIONCo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:02:44 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B957C061226
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:02:35 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id j34so1946365pgi.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVV3WTmK6XA7LtxrkcMYqgHDOYcKykPcvtWqvODpAvM=;
        b=gHURAa2qwURYUv/ja5UoRzgyS1wkJkFAoxB36PqJjiqmVMoqDqHbzyNT1qlRaW9R9w
         FFwUBjf79ioO3vM8rMphZORI5NfLer+NOcsdXapnm3limLJGlHbEIUIJEfLqoWkMoNsv
         Xj3zBK/49fR4GZYSNgUft4ZoNumz1JNrGmeyCzNSWArndSMd5B2QPwYll2w3SdctsHuw
         Q2a+6wpYZYqAqe+r8BFxUtd60lFitcBA2aCxd9pFA0Mnz3rRX7EDutZSxJAcUaenBr8L
         B0Mm+xGXz3o/8hk8vLZqqA6TGfPoDAn5cHutkKLV5C2gjF/HoxkxihfB8ltGatni1xkf
         aOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVV3WTmK6XA7LtxrkcMYqgHDOYcKykPcvtWqvODpAvM=;
        b=Wpjv/bDPpWf4+jYBZ5QkTD9DOtw4oEL5peXHxMEqOhNQtgzkgvLiJlDDBzkOUQ5KUd
         bFaG4a9dDr+XxVtc/qe37L03TAt1MYrXvMAjhfhF4wGDSMjrNwCscfMTJ1x9r/7SIfi+
         lJdG7GPewjSvHaZJlu2n7PE2KxhTwjqeI5xnCgzBUUHMWiG5jNIAV7NBJ6rjdCZL8W6f
         taTo3TaUZfqJpPWF6Ak2KQIJEVrxzvSyPgo6fgGyrYEqejV0XzMukQpPuYLsOt7DlbGA
         9CRprB58Ji5yWpct1RbCMv1r6HTuK7SvEaM9XRbNprQADxDT9W6c+Nc3BP/92e5/CFDb
         iODw==
X-Gm-Message-State: AOAM530Uxt+XTHpthmiB35Fpxu7Dw6yMVfxb+bi4F3/4PvKPFTIcfc/6
        LqCZ/P1WTS4EJRQvi2V42tZi0g==
X-Google-Smtp-Source: ABdhPJzvhvBb63cFKpGYA1g3UNc9aZPmEibZEVeHZ1Quj26JsNItVJjEgrqQJPDwM+Q4GgdbshBhhg==
X-Received: by 2002:a63:4d5b:: with SMTP id n27mr14337711pgl.360.1600174954601;
        Tue, 15 Sep 2020 06:02:34 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.02.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:02:34 -0700 (PDT)
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
Subject: [RFC PATCH 15/24] mm/hugetlb: Use PG_slab to indicate split pmd
Date:   Tue, 15 Sep 2020 20:59:38 +0800
Message-Id: <20200915125947.26204-16-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
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
index 5cc796dc3a0a..c42c27a12df2 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1629,6 +1629,25 @@ static void split_vmemmap_huge_page(struct page *head, pmd_t *pmd)
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
@@ -1645,6 +1664,7 @@ static void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 	if (vmemmap_pmd_huge(pmd)) {
 		VM_BUG_ON(!nr_pgtable(h));
 		split_vmemmap_huge_page(head, pmd);
+		set_pmd_split(pmd);
 	}
 
 	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages,
@@ -1718,11 +1738,12 @@ static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 	spin_lock(ptl);
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
2.20.1

