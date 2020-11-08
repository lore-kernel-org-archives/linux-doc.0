Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 355FBC4741F
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1BA320B1F
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="tot+BcAr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728511AbgKHOM2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:12:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728471AbgKHOMW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:12:22 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEC9C0613D2
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:12:21 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 13so5516528pfy.4
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5TzMLMYXz/tt2Duq9f+ytVwz3M0d3tJpioRexK8gCnY=;
        b=tot+BcArmsCT+Ujl2UrzCeAIugUfEiKhiHWRy395c/4yXQteyeyWe97yiLCpAccecK
         TXztPy/aljEbw+NZyD5a95ZhoRolPuBuHQyoCpR2bVqNmGNJGXOdAUb40MIrCg2PBiAA
         6WoW9LJDfCfRS3xcGx7fdWVbQvKE1LxfnGb3Ret1ynvISN8iAMNXO1Vu8BPJE1HUmyd0
         q+4E8kQ9WJsy1s1AZkdvogEUarTd/xDtVHAu5lk6HzZClsQqDqiJ035r2caXlcA2OSS4
         wXu80VKjCTmIwYbjkWOo3kIK2fPSLXZ8rGkAvgP7933OvGQ/KskCDzP0Ini5ZtHtgtKB
         TO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5TzMLMYXz/tt2Duq9f+ytVwz3M0d3tJpioRexK8gCnY=;
        b=W0tj+ZfwQuZ1Pvk6Cg+Y+djAVmk+/r5SrbToMYPfbxH/0GVYq13i5TgG3qrP7Gas6W
         C0WZxyXenj6N6QY6NFj4LxroRmy4pCfG+d9zpXloWY0l6idSFRZOhHnmK5wRrfwHSWmN
         WSqsebJxbma9iPLELHqRYAPhf5mcVBNWfPSZUqDl0i4dNVZ4Q+p60XS7OsrQRZCtsvNe
         uwMUA08kYKAPVSqZLijcPPxJeIqjdVC9wEnKXRS3/zZc7dzjP8JNFr22GjxTTcadZiH0
         xQQK10HP+gBpV+7fpi6MMQZ+hT20fx6Z+0Js6PGhu81ABv4VyMPuVtiGLFuvtl6r6dnP
         bHgQ==
X-Gm-Message-State: AOAM533zCWdAbKkWtvzb4AOIfhEHRWmyVbwFEsURydHRr3koX7UybyPT
        ZUHgFunLYMLo3WGGe4oKa3ausQ==
X-Google-Smtp-Source: ABdhPJwlFJQvzR9hK35z2RWma7Iesgmp9PzPHb9J6pbPZFxIZR8tlFKidvzMRT4M6nvoWJhgVyoekA==
X-Received: by 2002:aa7:83c2:0:b029:156:5ece:98b6 with SMTP id j2-20020aa783c20000b02901565ece98b6mr10070588pfn.4.1604844741468;
        Sun, 08 Nov 2020 06:12:21 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.12.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:12:20 -0800 (PST)
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
Subject: [PATCH v3 04/21] mm/hugetlb: Introduce nr_free_vmemmap_pages in the struct hstate
Date:   Sun,  8 Nov 2020 22:10:56 +0800
Message-Id: <20201108141113.65450-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of hugetlb page is 2MB, we need 512 struct page structures
(8 pages) to be associated with it. As far as I know, we only use the
first 4 struct page structures. Use of first 4 struct page structures
comes from HUGETLB_CGROUP_MIN_ORDER.

For tail pages, the value of compound_head is the same. So we can reuse
first page of tail page structs. We map the virtual addresses of the
remaining 6 pages of tail page structs to the first tail page struct,
and then free these 6 pages. Therefore, we need to reserve at least 2
pages as vmemmap areas.

So we introduce a new nr_free_vmemmap_pages field in the hstate to
indicate how many vmemmap pages associated with a hugetlb page that we
can free to buddy system.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 include/linux/hugetlb.h |  3 +++
 mm/hugetlb.c            | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index d5cc5f802dd4..eed3dd3bd626 100644
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
index 81a41aa080a5..a0007902fafb 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1292,6 +1292,42 @@ static inline void destroy_compound_gigantic_page(struct page *page,
 						unsigned int order) { }
 #endif
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+/*
+ * There are 512 struct page structs(8 pages) associated with each 2MB
+ * hugetlb page. For tail pages, the value of compound_dtor is the same.
+ * So we can reuse first page of tail page structs. We map the virtual
+ * addresses of the remaining 6 pages of tail page structs to the first
+ * tail page struct, and then free these 6 pages. Therefore, we need to
+ * reserve at least 2 pages as vmemmap areas.
+ */
+#define RESERVE_VMEMMAP_NR	2U
+
+static void __init hugetlb_vmemmap_init(struct hstate *h)
+{
+	unsigned int order = huge_page_order(h);
+	unsigned int vmemmap_pages;
+
+	vmemmap_pages = ((1 << order) * sizeof(struct page)) >> PAGE_SHIFT;
+	/*
+	 * The head page and the first tail page not free to buddy system,
+	 * the others page will map to the first tail page. So there are
+	 * (@vmemmap_pages - RESERVE_VMEMMAP_NR) pages can be freed.
+	 */
+	if (likely(vmemmap_pages > RESERVE_VMEMMAP_NR))
+		h->nr_free_vmemmap_pages = vmemmap_pages - RESERVE_VMEMMAP_NR;
+	else
+		h->nr_free_vmemmap_pages = 0;
+
+	pr_debug("HugeTLB: can free %d vmemmap pages for %s\n",
+		 h->nr_free_vmemmap_pages, h->name);
+}
+#else
+static inline void hugetlb_vmemmap_init(struct hstate *h)
+{
+}
+#endif
+
 static void update_and_free_page(struct hstate *h, struct page *page)
 {
 	int i;
@@ -3285,6 +3321,8 @@ void __init hugetlb_add_hstate(unsigned int order)
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/1024);
 
+	hugetlb_vmemmap_init(h);
+
 	parsed_hstate = h;
 }
 
-- 
2.11.0

