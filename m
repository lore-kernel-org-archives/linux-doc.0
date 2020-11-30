Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9392CC8300F
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3776E20731
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="LwCkA5hr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgK3PWF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgK3PWE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:22:04 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0EFC0613D3
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:21:23 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id b12so1567085pjl.0
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYT5dZtYNzoNgBDfI70BMw/hObfhoANnOlo7wxpDnOM=;
        b=LwCkA5hrD1gS48cmMaDT4qNjkGb6QdEv5brr1re2aHgG+6vLIkxIOY0LXKteJIDKn5
         oZD7pJeys1ZiAV5Oco/N6zt5O24MHWQm1ONrkg/tWXj9Y+VFcP4eOmMmKaSvOnJ7g0k4
         74Z2xr9Sv/YIpgMg+hOKcpsvL3ZmX38JB6WrqJ53wfLVojj4Q/q8Ncs8kEdQmYaTf8st
         UszQjA7JU6se5KTtNhGZXFbuMjeGaiUBI+n9V/9+rn9Xs0tooZ3DqkiUh9AkHkjBh7XY
         bsYgwedmNvzFgI7KACSo4vfq9wbH8Iw5IMDXOGX/2Pb06fHj10wKqyGQmu2/wpe83kUF
         CcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYT5dZtYNzoNgBDfI70BMw/hObfhoANnOlo7wxpDnOM=;
        b=ZhVZ1uOpTN/2v1wT9PZ50YNOTltTPwlgPOz2a/LsaEenvj0mRjayJICSXF1rqwPpC9
         DJePTrKl0byvka7npeR+k9slk/frabDVdmPQUPiL4yUCeK5tKHJGGbvW1grBeSyWOgni
         owlTdWzJ+S8alUiWZ9/NUCaFug37/j6npoxCTS951inVqiR04NHCwvWTVJxwSdeQV/Xw
         EFLSAHm8oEKMoDc7H05UPOqRyYB0+mE1dFI5mO3n+Y6REfIs/Jtq+7J7UvlsOQi5pTRQ
         IAHGY6OfYC5BFY20c5xwLeB8HMb3bWGIrg4TRwuMohpSqZVeVHdeyOCRf2+qHMy4NsmQ
         ZFaw==
X-Gm-Message-State: AOAM532t1ZUglKXshlDfl155Hdqq66pr/DGmF7MA4KzIESBjIwu2i1aZ
        namBTl5I38WmrJ+qrkjpwHQwwA==
X-Google-Smtp-Source: ABdhPJzdJo9xFB6qdz9EJXty4ReNm/tlcxVwZxpF9t/uXenCEP4+6bpzwvCYL7obLU7Z+UpQ5teEuA==
X-Received: by 2002:a17:90b:3907:: with SMTP id ob7mr27218790pjb.70.1606749683381;
        Mon, 30 Nov 2020 07:21:23 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.21.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:21:22 -0800 (PST)
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
Subject: [PATCH v7 12/15] mm/hugetlb: Flush work when dissolving hugetlb page
Date:   Mon, 30 Nov 2020 23:18:35 +0800
Message-Id: <20201130151838.11208-13-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We should flush work when dissolving a hugetlb page to make sure that
the hugetlb page is freed to the buddy.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 12cb46b8e901..a114d6bfd1b9 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1327,6 +1327,12 @@ static void update_hpage_vmemmap_workfn(struct work_struct *work)
 }
 static DECLARE_WORK(hpage_update_work, update_hpage_vmemmap_workfn);
 
+static inline void flush_hpage_update_work(struct hstate *h)
+{
+	if (free_vmemmap_pages_per_hpage(h))
+		flush_work(&hpage_update_work);
+}
+
 static inline void __update_and_free_page(struct hstate *h, struct page *page)
 {
 	/* No need to allocate vmemmap pages */
@@ -1833,6 +1839,7 @@ static int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
 int dissolve_free_huge_page(struct page *page)
 {
 	int rc = -EBUSY;
+	struct hstate *h = NULL;
 
 	/* Not to disrupt normal path by vainly holding hugetlb_lock */
 	if (!PageHuge(page))
@@ -1846,8 +1853,9 @@ int dissolve_free_huge_page(struct page *page)
 
 	if (!page_count(page)) {
 		struct page *head = compound_head(page);
-		struct hstate *h = page_hstate(head);
 		int nid = page_to_nid(head);
+
+		h = page_hstate(head);
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
 
@@ -1861,6 +1869,14 @@ int dissolve_free_huge_page(struct page *page)
 	}
 out:
 	spin_unlock(&hugetlb_lock);
+
+	/*
+	 * We should flush work before return to make sure that
+	 * the HugeTLB page is freed to the buddy.
+	 */
+	if (!rc && h)
+		flush_hpage_update_work(h);
+
 	return rc;
 }
 
-- 
2.11.0

