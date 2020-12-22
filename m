Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4EEC433E6
	for <linux-doc@archiver.kernel.org>; Tue, 22 Dec 2020 14:31:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52C252312E
	for <linux-doc@archiver.kernel.org>; Tue, 22 Dec 2020 14:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgLVObS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Dec 2020 09:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbgLVObQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Dec 2020 09:31:16 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0556EC0619D8
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 06:30:38 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id g15so3550518pgu.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Dec 2020 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2oh7BiGimGKbgDDnn+uhtQoJ4SgvK0edAogQf1UAb2c=;
        b=NW1HUXse/ELoaMPuVDyXVFSEXun0IU5JAUCAUQqwl70HtUvXMJ15gRN46nFp02CL/H
         y123iBq8TgKa6MlDbL7fbshMPHrtU9trYby/dfN+k+iid4+hgB1SWFi9IAZLcOSU5+1j
         hlVkou1gyu4cv8Lj+YoFecsr3J34P9vh5YPawOjHUGBMe/dkmG3hv6gxBK7jaoNb4hHs
         C24Gk6/Oq53lnk6iyVLhBzNDwhT6H8OpxAv9KwjhbVuqkTCLpjopNJMS7P1h6gGUW5+A
         7ur1UjBRKLuzuNPQPEk+Zoh65ugww85l/kHrfi+YqdfkJhYD9gTxoaFDyvb5tHwnEQ+G
         XYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2oh7BiGimGKbgDDnn+uhtQoJ4SgvK0edAogQf1UAb2c=;
        b=ZA1hUXXToXGb3tJLhamwSWtee6sZkbPiEZVJBGODpk+UrjvZG5enP4Y8S8OSlPdkEU
         ok+GqUBCwffZx5GmfNaJWB5ZXfqzJYW4sBJw1OTJwmP+LhfLE56WuBVa3kwEW/SeIuAh
         4a50Bv78dQTQkeGCuV8l87LVQQUAYNAE8ATyNoXgFeDVqbq2qtaPGaDSjl/iCVLYOaRh
         EEwQ0sXw2C08dx9VVeU4GZgqax+ULS6rrNIFj9kMAIFW02cx3cVPOes6RUfpA5AIk3Vx
         AbRjYqDgvR/E207RLC6z+vd342qmRe93lQuoJ9F1e6Uev3ITFNquVxcKXPfsrwtsBSbJ
         TFqw==
X-Gm-Message-State: AOAM532xG2ZtW4+4n5484z+tAh7okCNx2MBXX+5fOq/bZzV1jbLeZY1C
        lvPp4qKteYlcFY/65UFxv+t3Rw==
X-Google-Smtp-Source: ABdhPJwC1b7+z3oU5UdGT0bIyumq1D1G/6x6HmVq4M+8WybN1mLv+noPxL93zTQbS40CfFx40mjThg==
X-Received: by 2002:a65:6542:: with SMTP id a2mr8854257pgw.148.1608647437583;
        Tue, 22 Dec 2020 06:30:37 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id a31sm21182088pgb.93.2020.12.22.06.30.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Dec 2020 06:30:36 -0800 (PST)
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
Subject: [PATCH v11 06/11] mm/hugetlb: Set the PageHWPoison to the raw error page
Date:   Tue, 22 Dec 2020 22:24:35 +0800
Message-Id: <20201222142440.28930-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201222142440.28930-1-songmuchun@bytedance.com>
References: <20201222142440.28930-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because we reuse the first tail vmemmap page frame and remap it
with read-only, we cannot set the PageHWPosion on a tail page.
So we can use the head[4].private to record the real error page
index and set the raw error page PageHWPoison later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ab6d2eabfea8..dbf4e8eeeff1 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1350,6 +1350,43 @@ static inline void __update_and_free_page(struct hstate *h, struct page *page)
 		schedule_work(&hpage_update_work);
 }
 
+static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
+{
+	struct page *page;
+
+	if (!PageHWPoison(head) || !free_vmemmap_pages_per_hpage(h))
+		return;
+
+	page = head + page_private(head + 4);
+
+	/*
+	 * Move PageHWPoison flag from head page to the raw error page,
+	 * which makes any subpages rather than the error page reusable.
+	 */
+	if (page != head) {
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
+static inline void hwpoison_subpage_set(struct hstate *h, struct page *head,
+					struct page *page)
+{
+	if (!PageHWPoison(head))
+		return;
+
+	if (free_vmemmap_pages_per_hpage(h)) {
+		set_page_private(head + 4, page - head);
+	} else if (page != head) {
+		/*
+		 * Move PageHWPoison flag from head page to the raw error page,
+		 * which makes any subpages rather than the error page reusable.
+		 */
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
 static void update_and_free_page(struct hstate *h, struct page *page)
 {
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
@@ -1366,6 +1403,7 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 	int i;
 
 	alloc_huge_page_vmemmap(h, page);
+	hwpoison_subpage_deliver(h, page);
 
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
@@ -1843,14 +1881,8 @@ int dissolve_free_huge_page(struct page *page)
 		int nid = page_to_nid(head);
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
-		/*
-		 * Move PageHWPoison flag from head page to the raw error page,
-		 * which makes any subpages rather than the error page reusable.
-		 */
-		if (PageHWPoison(head) && page != head) {
-			SetPageHWPoison(page);
-			ClearPageHWPoison(head);
-		}
+
+		hwpoison_subpage_set(h, head, page);
 		list_del(&head->lru);
 		h->free_huge_pages--;
 		h->free_huge_pages_node[nid]--;
-- 
2.11.0

