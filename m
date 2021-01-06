Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC76C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 14:23:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89E0F2311C
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 14:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727203AbhAFOWw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 09:22:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbhAFOWv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jan 2021 09:22:51 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8852CC061361
        for <linux-doc@vger.kernel.org>; Wed,  6 Jan 2021 06:22:05 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id 4so1616535plk.5
        for <linux-doc@vger.kernel.org>; Wed, 06 Jan 2021 06:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hxK3vZa53yZECwtQk1Adv7wPniSEQYOdf+3yOUQ+iTA=;
        b=NF+XlKFu+tOkWjyOCZS8cKsq8G+3zN1bjOtTKP8MFni7ofanv26HBm8dS6y3zst3dT
         9BI8x+77zo2QOG7oLLkG2lDzjxNMa8fH+YWZmuqklvtZIAHRYhX7/Y0BUNTOnzCWrEkB
         ngma7HDv2UQMI44W/OzQY/z5vit913sWjS0ZW28Mfe2cPzgECdqHEshbvvRZQR74uSPG
         49ug+Oy/c2xlZrym8dVvksqssDxYT6+aDiacW5+e/bA4DGbl5dis7p3Yrbi1wBXi9Qox
         XBDSfwD+yHHWIAE8hIzV5Xa2+q1S8TbnnHNElbjDo6bP/wHu9jJRcLvUi6GchXCDVCej
         pAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hxK3vZa53yZECwtQk1Adv7wPniSEQYOdf+3yOUQ+iTA=;
        b=Wlx+43p+rKDDHihXhmfv/bfRGhWFRojX2As21lk2kI/RbLEg33pxoSBlalLLXBJ0UI
         yB877rMDMpDlGBEkOPZXFfjsaURtXF2lYRKuKcuic138rdJ0Q9JbCOml/kWC2gseeOGk
         v8E5HUrfzdu6gbEcEDYGrcRZkWug8t4Wd509s7cogHaq0aWskBVSctW1FJcNWwKDZ5YD
         AMWDSKpKZPxpQLlHy/hrebuAOr1kQSVdrOl/5Vkpw24cIimZfYz1gHfNY0BpxRimRTiF
         U6Q3To3xoV04ruRo0ZCGc5qpjvzYlzHdyoybMWgJeM7mXSSAHmOlT5Bz8kBcA/rOJ7QC
         QQ1g==
X-Gm-Message-State: AOAM531ypnQFJdL4Ea6yLSGldw8ABqoe6/HlUE73lY49B/hnMWiiU6ZI
        K4mgYwd7N9x3jdiCGroajl57yg==
X-Google-Smtp-Source: ABdhPJzYn/TgJB8CdWJstEZ5AIRufvLGNvNpT7tS/n9OgiMhPMw+qr4C0v+GoAslUf1AfycZ3AkGYQ==
X-Received: by 2002:a17:90b:1a86:: with SMTP id ng6mr4567473pjb.12.1609942925089;
        Wed, 06 Jan 2021 06:22:05 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id a29sm2831730pfr.73.2021.01.06.06.21.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 06:22:04 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v12 11/13] mm/hugetlb: Introduce nr_free_vmemmap_pages in the struct hstate
Date:   Wed,  6 Jan 2021 22:19:29 +0800
Message-Id: <20210106141931.73931-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210106141931.73931-1-songmuchun@bytedance.com>
References: <20210106141931.73931-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

All the infrastructure is ready, so we introduce nr_free_vmemmap_pages
field in the hstate to indicate how many vmemmap pages associated with
a HugeTLB page that can be freed to buddy allocator. And initialize it
in the hugetlb_vmemmap_init(). This patch is actual enablement of the
feature.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 include/linux/hugetlb.h |  3 +++
 mm/hugetlb.c            |  1 +
 mm/hugetlb_vmemmap.c    | 25 +++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h    | 10 ++++++----
 4 files changed, 35 insertions(+), 4 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 7f47f0eeca3b..66d82ae7b712 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -492,6 +492,9 @@ struct hstate {
 	unsigned int nr_huge_pages_node[MAX_NUMNODES];
 	unsigned int free_huge_pages_node[MAX_NUMNODES];
 	unsigned int surplus_huge_pages_node[MAX_NUMNODES];
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	unsigned int nr_free_vmemmap_pages;
+#endif
 #ifdef CONFIG_CGROUP_HUGETLB
 	/* cgroup control files */
 	struct cftype cgroup_files_dfl[7];
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 14549204ddcb..0e14fad63823 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3385,6 +3385,7 @@ void __init hugetlb_add_hstate(unsigned int order)
 	h->next_nid_to_free = first_memory_node;
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/1024);
+	hugetlb_vmemmap_init(h);
 
 	parsed_hstate = h;
 }
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 8206978d1679..7dcb4aa1e512 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -236,3 +236,28 @@ void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 
 	vmemmap_remap_free(vmemmap_addr, vmemmap_end, vmemmap_reuse);
 }
+
+void __init hugetlb_vmemmap_init(struct hstate *h)
+{
+	unsigned int nr_pages = pages_per_huge_page(h);
+	unsigned int vmemmap_pages;
+
+	if (!hugetlb_free_vmemmap_enabled)
+		return;
+
+	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
+	/*
+	 * The head page and the first tail page are not to be freed to buddy
+	 * allocator, the other pages will map to the first tail page, so they
+	 * can be freed.
+	 *
+	 * Could RESERVE_VMEMMAP_NR be greater than @vmemmap_pages? It is true
+	 * on some architectures (e.g. aarch64). See Documentation/arm64/
+	 * hugetlbpage.rst for more details.
+	 */
+	if (likely(vmemmap_pages > RESERVE_VMEMMAP_NR))
+		h->nr_free_vmemmap_pages = vmemmap_pages - RESERVE_VMEMMAP_NR;
+
+	pr_info("can free %d vmemmap pages for %s\n", h->nr_free_vmemmap_pages,
+		h->name);
+}
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index b2c8d2f11d48..8fd9ae113dbd 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -13,17 +13,15 @@
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 void alloc_huge_page_vmemmap(struct hstate *h, struct page *head);
 void free_huge_page_vmemmap(struct hstate *h, struct page *head);
+void hugetlb_vmemmap_init(struct hstate *h);
 
 /*
  * How many vmemmap pages associated with a HugeTLB page that can be freed
  * to the buddy allocator.
- *
- * Todo: Returns zero for now, which means the feature is disabled. We will
- * enable it once all the infrastructure is there.
  */
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
-	return 0;
+	return h->nr_free_vmemmap_pages;
 }
 #else
 static inline void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
@@ -38,5 +36,9 @@ static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
 	return 0;
 }
+
+static inline void hugetlb_vmemmap_init(struct hstate *h)
+{
+}
 #endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 #endif /* _LINUX_HUGETLB_VMEMMAP_H */
-- 
2.11.0

