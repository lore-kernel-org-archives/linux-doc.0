Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B35FC2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:55:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A32220773
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="wHxCia5N"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782633AbgJZOy5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:54:57 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:50957 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782626AbgJZOy5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:54:57 -0400
Received: by mail-pj1-f66.google.com with SMTP id p21so3378445pju.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9KzGJW7+3gJH1QbMETcNFJ5S+jm03xO8soaD+n5t7bs=;
        b=wHxCia5NROho+R2WxNTOTYMXm7HB4+q/L8kpv/2zF0uom6mMQb/JnSQ3A2X1ln3ktA
         xVQhSWUcsBaUKAGC3K2QjY8+r5RkQZ3KAik14xVwXpDfHeUy6myMUbEvXopYOF7lxoCh
         HgyxJamFeCA2OSW7wtC9Dnek5iyFF61WptjLnNfUZjc+wfTpq+9aQaGs8smf8OIGNogt
         RJq+6xUfkCV/lqMtubBnmhWWu0ivZ5TXV8TxC7hMhCvNl4EdwyOB2n2bYGSnonutHQ5K
         5/vOMylWZVIsiSma26xpFjtykZXV+KK8Lfpw7Vp77ug/TUgHf2C5ZG0Bv/2Gp5DvKJpn
         Aq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9KzGJW7+3gJH1QbMETcNFJ5S+jm03xO8soaD+n5t7bs=;
        b=POo1/P1Byg7rOXTFnczKuUWuBsYQK5KzgbxFAt3LL3nX070cKa3Ee5bsgpGNF/jgx+
         ZbhbA42UJBZjKmj6Z12jcObfZczTNMuoWMbgdRphCAowo4lbe17ti1czDopZTE2p1ef8
         tqFrISTlKIGeexsvcDzjHecBs3vxXsaTU92iniWrUoelHlV5T3sbvLJLoqYTeJDqCdPk
         C+HyWCUaND65E3mhkqwLIVqGQRgkmsRnk6gO6AanuOS0XniUOsWe/RAfYZCyfAvkHlhD
         Dyqi8r6Ptub5+EXJp1jnM0H0UH9+OeneX7UmQIdZy/NYbqn6U01aiInJ98bi7+bzCgP9
         3FuQ==
X-Gm-Message-State: AOAM532cAOi/UaKX4vn6LIBV6kQ4Ezp+/4dXnbV0GNTgPf2MytyPEVwz
        TXKfx6eqLu64aqAvW3zGdlQVKA==
X-Google-Smtp-Source: ABdhPJx65sojl1+93c7ngV5cWzTPUiQrP6xuE+Jh3erKuVbh2qQqYY/M8O+c06KujOkvN6WJMDlfVw==
X-Received: by 2002:a17:90b:300a:: with SMTP id hg10mr21002506pjb.72.1603724096151;
        Mon, 26 Oct 2020 07:54:56 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.54.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:54:55 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 11/19] mm/hugetlb: Use PG_slab to indicate split pmd
Date:   Mon, 26 Oct 2020 22:51:06 +0800
Message-Id: <20201026145114.59424-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
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
index bd0c4e7fd994..f75b93fb4c07 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1588,6 +1588,25 @@ static void split_vmemmap_huge_page(struct page *head, pmd_t *pmd)
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
@@ -1604,6 +1623,7 @@ static void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 	if (vmemmap_pmd_huge(pmd)) {
 		VM_BUG_ON(!nr_pgtable(h));
 		split_vmemmap_huge_page(head, pmd);
+		set_pmd_split(pmd);
 	}
 
 	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages,
@@ -1677,11 +1697,12 @@ static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
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

