Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FFBC4742C
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12040207DE
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:15:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="hgVW5dqk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgKMLOi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgKMLGH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:06:07 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50597C09424C
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:04:34 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id a18so7345885pfl.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q+VtCLDnL2Xa2mKU9/pdAYc0VFam3D1bbZtkQW1vxCY=;
        b=hgVW5dqkMQlyxy+pm08vW0Vd4PTnyXbalrCOkkce5dt2d7VoBxu3eV1+af7yino6+6
         cGORVLq1cSX0r2YA/O/gfxdClSiPYIYUmP+R2rEBhSknBmWIxKIZ3QrN1xE/O3Bl8BAD
         dne9R+uc5fjS1f+S/hTh2/DMUQaxpq6G1hj5sWcyOTa2aaW4weditA2SU1YHChizvM5O
         QsA3ug8vIl0Mhx6DwWu2jjJU5ozuPlMxamPpzHj8yVFvS7TflofJtxQbUcoFAyKq0rwr
         6FtSlJW7HhROiINTFTjqs1TiqwwHpu91rRIWgVglPqRJ7o3j8fcW9b/0TVj05DGoe76S
         zuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q+VtCLDnL2Xa2mKU9/pdAYc0VFam3D1bbZtkQW1vxCY=;
        b=Xeqc+KzqxNU+puNxGFvmE2Rn2qAQ3WUECLnZMrOlaWdAqhyW/8mcQ4BbY0RKE7zj4o
         f1tcKdkeLBosimi2XpLph7e5mVTUIN9067PgZm2YYLudJj7lS5bhGBivk9z2rKWHxpaS
         Vc6MMQh5xnCDsUh29iqD6QISatUO3csg3rUqSXjB9cib3oB++i5+UTH37SxfRH/vBqxy
         l9x2Rv73JPm5tIt/vx6VEQrK07td/+DMHNw00xxN0KMAYISXcOUgeuTeM2p5V93P4xL6
         T6GJ1IApewPbAwcB/6DR8TgFPdF/8J2v+4EHXEj2tnZ7JiytnQR/qScBU937/Fnl+ifo
         pLeg==
X-Gm-Message-State: AOAM531WFEhoiE2QlwhmKD61IMWBraTcwMafxvs6SzyADwP5I7wNLNWM
        c89hxe23KV80hQAkmnRG5R8fkA==
X-Google-Smtp-Source: ABdhPJwfPxpTm7KDY6rcrwOeaIhwRPV0v2rdEjxMNJn3NT0L5sknMy457PQCHIEbzp6HKN47tm1isA==
X-Received: by 2002:a17:90b:1058:: with SMTP id gq24mr2370569pjb.29.1605265473882;
        Fri, 13 Nov 2020 03:04:33 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.04.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:04:33 -0800 (PST)
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
Subject: [PATCH v4 19/21] mm/hugetlb: Gather discrete indexes of tail page
Date:   Fri, 13 Nov 2020 18:59:50 +0800
Message-Id: <20201113105952.11638-20-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For hugetlb page, there are more metadata to save in the struct
page. But the head struct page cannot meet our needs, so we have
to abuse other tail struct page to store the metadata. In order
to avoid conflicts caused by subsequent use of more tail struct
pages, we can gather these discrete indexes of tail struct page
In this case, it will be easier to add a new tail page index later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/hugetlb.h        | 13 +++++++++++++
 include/linux/hugetlb_cgroup.h | 15 +++++++++------
 mm/hugetlb.c                   | 12 ++++++------
 mm/hugetlb_vmemmap.h           |  4 ++--
 4 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index da18fc9ed152..fa9d38a3ac6f 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -28,6 +28,19 @@ typedef struct { unsigned long pd; } hugepd_t;
 #include <linux/shm.h>
 #include <asm/tlbflush.h>
 
+enum {
+	SUBPAGE_INDEX_ACTIVE = 1,	/* reuse page flags of PG_private */
+	SUBPAGE_INDEX_TEMPORARY,	/* reuse page->mapping */
+#ifdef CONFIG_CGROUP_HUGETLB
+	SUBPAGE_INDEX_CGROUP = SUBPAGE_INDEX_TEMPORARY,/* reuse page->private */
+	SUBPAGE_INDEX_CGROUP_RSVD,	/* reuse page->private */
+#endif
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	SUBPAGE_INDEX_HWPOISON,		/* reuse page->private */
+#endif
+	NR_USED_SUBPAGE,
+};
+
 struct hugepage_subpool {
 	spinlock_t lock;
 	long count;
diff --git a/include/linux/hugetlb_cgroup.h b/include/linux/hugetlb_cgroup.h
index 2ad6e92f124a..3d3c1c49efe4 100644
--- a/include/linux/hugetlb_cgroup.h
+++ b/include/linux/hugetlb_cgroup.h
@@ -24,8 +24,9 @@ struct file_region;
 /*
  * Minimum page order trackable by hugetlb cgroup.
  * At least 4 pages are necessary for all the tracking information.
- * The second tail page (hpage[2]) is the fault usage cgroup.
- * The third tail page (hpage[3]) is the reservation usage cgroup.
+ * The second tail page (hpage[SUBPAGE_INDEX_CGROUP]) is the fault
+ * usage cgroup. The third tail page (hpage[SUBPAGE_INDEX_CGROUP_RSVD])
+ * is the reservation usage cgroup.
  */
 #define HUGETLB_CGROUP_MIN_ORDER	2
 
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
index 9aad0b63d369..dfa982f4b525 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1429,20 +1429,20 @@ struct hstate *size_to_hstate(unsigned long size)
 bool page_huge_active(struct page *page)
 {
 	VM_BUG_ON_PAGE(!PageHuge(page), page);
-	return PageHead(page) && PagePrivate(&page[1]);
+	return PageHead(page) && PagePrivate(&page[SUBPAGE_INDEX_ACTIVE]);
 }
 
 /* never called for tail page */
 static void set_page_huge_active(struct page *page)
 {
 	VM_BUG_ON_PAGE(!PageHeadHuge(page), page);
-	SetPagePrivate(&page[1]);
+	SetPagePrivate(&page[SUBPAGE_INDEX_ACTIVE]);
 }
 
 static void clear_page_huge_active(struct page *page)
 {
 	VM_BUG_ON_PAGE(!PageHeadHuge(page), page);
-	ClearPagePrivate(&page[1]);
+	ClearPagePrivate(&page[SUBPAGE_INDEX_ACTIVE]);
 }
 
 /*
@@ -1454,17 +1454,17 @@ static inline bool PageHugeTemporary(struct page *page)
 	if (!PageHuge(page))
 		return false;
 
-	return (unsigned long)page[2].mapping == -1U;
+	return (unsigned long)page[SUBPAGE_INDEX_TEMPORARY].mapping == -1U;
 }
 
 static inline void SetPageHugeTemporary(struct page *page)
 {
-	page[2].mapping = (void *)-1U;
+	page[SUBPAGE_INDEX_TEMPORARY].mapping = (void *)-1U;
 }
 
 static inline void ClearPageHugeTemporary(struct page *page)
 {
-	page[2].mapping = NULL;
+	page[SUBPAGE_INDEX_TEMPORARY].mapping = NULL;
 }
 
 static void __free_huge_page(struct page *page)
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index b09fd658ce20..86d80c7f1dc7 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -26,7 +26,7 @@ static inline void subpage_hwpoison_deliver(struct page *head)
 	struct page *page = head;
 
 	if (PageHWPoison(head))
-		page = head + page_private(head + 4);
+		page = head + page_private(head + SUBPAGE_INDEX_HWPOISON);
 
 	/*
 	 * Move PageHWPoison flag from head page to the raw error page,
@@ -41,7 +41,7 @@ static inline void subpage_hwpoison_deliver(struct page *head)
 static inline void set_subpage_hwpoison(struct page *head, struct page *page)
 {
 	if (PageHWPoison(head))
-		set_page_private(head + 4, page - head);
+		set_page_private(head + SUBPAGE_INDEX_HWPOISON, page - head);
 }
 
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
-- 
2.11.0

