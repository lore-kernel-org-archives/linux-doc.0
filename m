Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB82C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 10:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C96C060230
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 10:56:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhBSK42 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 05:56:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230140AbhBSKyX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Feb 2021 05:54:23 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5FBAC06121F
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 02:53:31 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id cl8so3486845pjb.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Feb 2021 02:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WoILW1I7TmuO8mgtAfPjyUzfd1+97TTdp+nIAVAKYIw=;
        b=Tkcf6JunsDxKIS2UIF3fyIfPqD8bQNbZOa0RLszV+gSGeeF9rMMsc9r+dl1OWqbX9H
         4PUX4Z31KfisNhK43Sq6qM6R04BorG+LtuD4H/+AoKs+b0b8Q/V6xxQigijanyEAsUwr
         OLlxNog8PHiTy1CDIfffY8hisy60kUS12qOQr9kjGn2r/7M1YTgmmKqxg0GADs/5+Pah
         fHLxGaI+HteYLk09lAyMxfAeBnVTmv72RWG9VDNJfM0wypSyxFW2Ez8e7mL7lDRRyfBG
         7u/EI9r6QG6kMBp9y37re5T6Sav1eh9BMvppd1FXSuFgR8frViDG7pnDlMqHp6tLVa26
         DmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WoILW1I7TmuO8mgtAfPjyUzfd1+97TTdp+nIAVAKYIw=;
        b=OPtSB46udUlnW4Jg1B9OVx/bzqGwF23rBrzUYnF70MZZuKb585xlwG1owX9gQPM3cO
         Es4BCTAzjA1J8Cjn8g8JkhOdjO/E4LndfWy/igPp3XiGAPXXBo86V19wYg3Kj4L7/DQ3
         syaf4K4cVEGGc61u8yJKc+wo5BdU1gc4xODSj3aU9BjsHZng2gOa0NhqinHuLMHhNuXp
         xa4ek/e5lur9YMi/C/wGPSYs0Eb32S/Vc4vBNjcSER+3AbLfXHe1LH9WnL5u+Y3d8Qda
         PFz8BoF1mTw/8VgRJNOmwQs2NliTJbDjutdGQc7j8YPDN6e0/491rw9p4ahBSL2lPAxQ
         PFWA==
X-Gm-Message-State: AOAM531KpawI/FdUgzW/M7i6SGpNuNUH04XhzqM00yeXiQo5t2yujrdw
        rcS40zvse2cflREqNnegePz4HQ==
X-Google-Smtp-Source: ABdhPJy3m/dSMv43DfYNjIhgR53BvdW4gEpoIUN1+JTV3agOk10kkPcCd52bbiwO+m36XMvUv4Z3Qw==
X-Received: by 2002:a17:902:700a:b029:e3:1564:d376 with SMTP id y10-20020a170902700ab02900e31564d376mr8328808plk.48.1613732008245;
        Fri, 19 Feb 2021 02:53:28 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id x1sm9662193pgj.37.2021.02.19.02.53.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2021 02:53:27 -0800 (PST)
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
        david@redhat.com, naoya.horiguchi@nec.com,
        joao.m.martins@oracle.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>,
        Miaohe Lin <linmiaohe@huawei.com>
Subject: [PATCH v16 8/9] mm: hugetlb: gather discrete indexes of tail page
Date:   Fri, 19 Feb 2021 18:49:53 +0800
Message-Id: <20210219104954.67390-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210219104954.67390-1-songmuchun@bytedance.com>
References: <20210219104954.67390-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For HugeTLB page, there are more metadata to save in the struct page.
But the head struct page cannot meet our needs, so we have to abuse
other tail struct page to store the metadata. In order to avoid
conflicts caused by subsequent use of more tail struct pages, we can
gather these discrete indexes of tail struct page. In this case, it
will be easier to add a new tail page index later.

There are only (RESERVE_VMEMMAP_SIZE / sizeof(struct page)) struct
page structs that can be used when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP,
so add a BUILD_BUG_ON to catch invalid usage of the tail struct page.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
---
 include/linux/hugetlb.h        | 24 ++++++++++++++++++++++--
 include/linux/hugetlb_cgroup.h | 19 +++++++++++--------
 mm/hugetlb.c                   |  6 +++---
 mm/hugetlb_vmemmap.c           |  8 ++++++++
 4 files changed, 44 insertions(+), 13 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 775aea53669a..caeef778526a 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -28,6 +28,26 @@ typedef struct { unsigned long pd; } hugepd_t;
 #include <linux/shm.h>
 #include <asm/tlbflush.h>
 
+/*
+ * For HugeTLB page, there are more metadata to save in the struct page. But
+ * the head struct page cannot meet our needs, so we have to abuse other tail
+ * struct page to store the metadata. In order to avoid conflicts caused by
+ * subsequent use of more tail struct pages, we gather these discrete indexes
+ * of tail struct page here.
+ */
+enum {
+	SUBPAGE_INDEX_SUBPOOL = 1,	/* reuse page->private */
+#ifdef CONFIG_CGROUP_HUGETLB
+	SUBPAGE_INDEX_CGROUP,		/* reuse page->private */
+	SUBPAGE_INDEX_CGROUP_RSVD,	/* reuse page->private */
+	__MAX_CGROUP_SUBPAGE_INDEX = SUBPAGE_INDEX_CGROUP_RSVD,
+#endif
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	SUBPAGE_INDEX_HWPOISON,		/* reuse page->private */
+#endif
+	__NR_USED_SUBPAGE,
+};
+
 struct hugepage_subpool {
 	spinlock_t lock;
 	long count;
@@ -607,13 +627,13 @@ extern unsigned int default_hstate_idx;
  */
 static inline struct hugepage_subpool *hugetlb_page_subpool(struct page *hpage)
 {
-	return (struct hugepage_subpool *)(hpage+1)->private;
+	return (void *)page_private(hpage + SUBPAGE_INDEX_SUBPOOL);
 }
 
 static inline void hugetlb_set_page_subpool(struct page *hpage,
 					struct hugepage_subpool *subpool)
 {
-	set_page_private(hpage+1, (unsigned long)subpool);
+	set_page_private(hpage + SUBPAGE_INDEX_SUBPOOL, (unsigned long)subpool);
 }
 
 static inline struct hstate *hstate_file(struct file *f)
diff --git a/include/linux/hugetlb_cgroup.h b/include/linux/hugetlb_cgroup.h
index 2ad6e92f124a..54ec689e3c9c 100644
--- a/include/linux/hugetlb_cgroup.h
+++ b/include/linux/hugetlb_cgroup.h
@@ -21,15 +21,16 @@ struct hugetlb_cgroup;
 struct resv_map;
 struct file_region;
 
+#ifdef CONFIG_CGROUP_HUGETLB
 /*
  * Minimum page order trackable by hugetlb cgroup.
  * At least 4 pages are necessary for all the tracking information.
- * The second tail page (hpage[2]) is the fault usage cgroup.
- * The third tail page (hpage[3]) is the reservation usage cgroup.
+ * The second tail page (hpage[SUBPAGE_INDEX_CGROUP]) is the fault
+ * usage cgroup. The third tail page (hpage[SUBPAGE_INDEX_CGROUP_RSVD])
+ * is the reservation usage cgroup.
  */
-#define HUGETLB_CGROUP_MIN_ORDER	2
+#define HUGETLB_CGROUP_MIN_ORDER order_base_2(__MAX_CGROUP_SUBPAGE_INDEX + 1)
 
-#ifdef CONFIG_CGROUP_HUGETLB
 enum hugetlb_memory_event {
 	HUGETLB_MAX,
 	HUGETLB_NR_MEMORY_EVENTS,
@@ -66,9 +67,9 @@ __hugetlb_cgroup_from_page(struct page *page, bool rsvd)
 	if (compound_order(page) < HUGETLB_CGROUP_MIN_ORDER)
 		return NULL;
 	if (rsvd)
-		return (struct hugetlb_cgroup *)page[3].private;
+		return (void *)page_private(page + SUBPAGE_INDEX_CGROUP_RSVD);
 	else
-		return (struct hugetlb_cgroup *)page[2].private;
+		return (void *)page_private(page + SUBPAGE_INDEX_CGROUP);
 }
 
 static inline struct hugetlb_cgroup *hugetlb_cgroup_from_page(struct page *page)
@@ -90,9 +91,11 @@ static inline int __set_hugetlb_cgroup(struct page *page,
 	if (compound_order(page) < HUGETLB_CGROUP_MIN_ORDER)
 		return -1;
 	if (rsvd)
-		page[3].private = (unsigned long)h_cg;
+		set_page_private(page + SUBPAGE_INDEX_CGROUP_RSVD,
+				 (unsigned long)h_cg);
 	else
-		page[2].private = (unsigned long)h_cg;
+		set_page_private(page + SUBPAGE_INDEX_CGROUP,
+				 (unsigned long)h_cg);
 	return 0;
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index f58331853db9..5d5349fdc9cd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1313,7 +1313,7 @@ static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
 	if (!PageHWPoison(head) || !free_vmemmap_pages_per_hpage(h))
 		return;
 
-	page = head + page_private(head + 4);
+	page = head + page_private(head + SUBPAGE_INDEX_HWPOISON);
 
 	/*
 	 * Move PageHWPoison flag from head page to the raw error page,
@@ -1332,7 +1332,7 @@ static inline void hwpoison_subpage_set(struct hstate *h, struct page *head,
 		return;
 
 	if (free_vmemmap_pages_per_hpage(h)) {
-		set_page_private(head + 4, page - head);
+		set_page_private(head + SUBPAGE_INDEX_HWPOISON, page - head);
 	} else if (page != head) {
 		/*
 		 * Move PageHWPoison flag from head page to the raw error page,
@@ -1348,7 +1348,7 @@ static inline void hwpoison_subpage_clear(struct hstate *h, struct page *head)
 	if (!PageHWPoison(head) || !free_vmemmap_pages_per_hpage(h))
 		return;
 
-	set_page_private(head + 4, 0);
+	set_page_private(head + SUBPAGE_INDEX_HWPOISON, 0);
 }
 #else
 static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b65f0d5189bd..33e42678abe3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -257,6 +257,14 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	unsigned int nr_pages = pages_per_huge_page(h);
 	unsigned int vmemmap_pages;
 
+	/*
+	 * There are only (RESERVE_VMEMMAP_SIZE / sizeof(struct page)) struct
+	 * page structs that can be used when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP,
+	 * so add a BUILD_BUG_ON to catch invalid usage of the tail struct page.
+	 */
+	BUILD_BUG_ON(__NR_USED_SUBPAGE >=
+		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
+
 	if (!hugetlb_free_vmemmap_enabled)
 		return;
 
-- 
2.11.0

