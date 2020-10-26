Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95752C2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486CD22263
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="ofh1BOhy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782216AbgJZOxw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:53:52 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40777 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782215AbgJZOxv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:53:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id x13so6201316pgp.7
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwhoZYWAAJ4spxaYU005zizG4WXJst9HQa0pZQSSI5A=;
        b=ofh1BOhygl+Z4Ve3iyKHhCVRLjYR73IhevmV5pUJPTbOlI9V+UlgHoCY/fnYxlYIBS
         bi1vVrQObFpYy+toe0NkkdToVhZEgjiajB99aafIinCd+oNUTTfoZydyQzs/DQMa6jTp
         EhhP+JgFF0E+Jsw1lewEwwvTcjvyCcPro/Wj4RsbD9r4YxRn0yqvgw743s5SfPkO3Edz
         b3mqXxu8vFsg5PlYg6XXfMYJUyfpkSVGasVFysYIiasSGe1R9unkzTNZR9AGeAQRXt4Z
         00dVHXQnuymG93iT5HapQ66CAMNvJZV7As7ToW4bipnwqJRSdXWY9bZ2blcIgZkfttc6
         eH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwhoZYWAAJ4spxaYU005zizG4WXJst9HQa0pZQSSI5A=;
        b=W2nb/+2wyi5XTSxmlsil8l+mvrwH0UoWxfNdsEIIo5b2r8yey+w4aCHASx5KAjZqGR
         MPlwW3LQs2Up3xKAIgmjLmLnbSO3OssHrAtkL934PTf8xdaXrTUriZHH2eKDqyx430cY
         VswKBygM/jSTSauc+h6gF8BQcl19oDcxYixveyhPrDwW209GNGP7OWZGsfv14wqSJySy
         DVqtPo5psnDyUVryutGsBTeIlbZv2A8ULeJ20QVrtIZmv1S3feMZSyADbySyjRXCIiXM
         EXa0Y12VOmT+msb32TuEnB636BgoRBPIuYLX+XiUEAiFznFthztq5oxkTDCj8Moml0Q0
         SfSA==
X-Gm-Message-State: AOAM533nbwAZKpsE8kxK8XvXkRsHllEWORzcGtVkgmi2LQvtnK7zP2xN
        g7QDUHAR6FmvOGgdLlHAsh2Llg==
X-Google-Smtp-Source: ABdhPJzVBaOtI8wZ67M0F/n/oeOrM0XQSDD8qgPgCcDxJxEI1BmEr6EJaVeRlqEpSvVra05uHaefCg==
X-Received: by 2002:a63:7e4f:: with SMTP id o15mr13919567pgn.428.1603724030714;
        Mon, 26 Oct 2020 07:53:50 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.53.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:53:50 -0700 (PDT)
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
Subject: [PATCH v2 04/19] mm/hugetlb: Introduce nr_free_vmemmap_pages in the struct hstate
Date:   Mon, 26 Oct 2020 22:50:59 +0800
Message-Id: <20201026145114.59424-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of hugetlb page is 2MB, we need 512 struct page structures
(8 pages) to be associated with it. As far as I know, we only use the
first 4 struct page structures.

For tail pages, the value of compound_dtor is the same. So we can reuse
first page of tail page structs. We map the virtual addresses of the
remaining 6 pages of tail page structs to the first tail page struct,
and then free these 6 pages. Therefore, we need to reserve at least 2
pages as vmemmap areas.

So we introduce a new nr_free_vmemmap_pages field in the hstate to
indicate how many vmemmap pages associated with a hugetlb page that we
can free to buddy system.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/hugetlb.h |  3 +++
 mm/hugetlb.c            | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

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
index 81a41aa080a5..f1b2b733b49b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1292,6 +1292,39 @@ static inline void destroy_compound_gigantic_page(struct page *page,
 						unsigned int order) { }
 #endif
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+#define RESERVE_VMEMMAP_NR	2U
+
+static inline unsigned int nr_free_vmemmap(struct hstate *h)
+{
+	return h->nr_free_vmemmap_pages;
+}
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
+	if (vmemmap_pages > RESERVE_VMEMMAP_NR)
+		h->nr_free_vmemmap_pages = vmemmap_pages - RESERVE_VMEMMAP_NR;
+	else
+		h->nr_free_vmemmap_pages = 0;
+
+	pr_info("HugeTLB: can free %d vmemmap pages for %s\n",
+		h->nr_free_vmemmap_pages, h->name);
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
@@ -3285,6 +3318,8 @@ void __init hugetlb_add_hstate(unsigned int order)
 	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
 					huge_page_size(h)/1024);
 
+	hugetlb_vmemmap_init(h);
+
 	parsed_hstate = h;
 }
 
-- 
2.20.1

