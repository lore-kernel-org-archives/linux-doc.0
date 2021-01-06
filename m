Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BD8C433E9
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 14:22:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79C812311C
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 14:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbhAFOWZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 09:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbhAFOWX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jan 2021 09:22:23 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FFB5C061357
        for <linux-doc@vger.kernel.org>; Wed,  6 Jan 2021 06:21:43 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id c132so2332058pga.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Jan 2021 06:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=leMCwiJUMOALRI5sultiZwFK5v4LdPgwOBvUXqzpH+M=;
        b=fKAiFaUcBNxGGPgUTJj2FRif/SfXZMu2KuZLQ1tkC9hf115yidMi1n/53fvmREUala
         rEV5qBf4q9uqF/44G7mT0920lUzF3ZX4LRTOoQmTDDwdWXM9wOK78Fvwk13NnoGOJSGM
         B4aqOPGXxG3JUpEMKeS/52q4ZTqeOb0HgNfRWL6O5KrobfJgIE2hvENlgWg1E/8GaZzm
         k65GUHnL678L4cm495jhyXqszI4j9dKuDx7m7KM37WKRoHzxOfQMD/JFvcwdG8yuQqXM
         Born6DGk9Vr2WyPoEVF36LaYbYSjXapAwpH7gFnb0HW2SAGh4WlkWF8f+lhC2tP1q83c
         /MBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=leMCwiJUMOALRI5sultiZwFK5v4LdPgwOBvUXqzpH+M=;
        b=fMD2HDqEcySMlEPcBv2oCHD7hlHDfWfajZfhHVoHZ4FRWiBTmf4PrtYEBpltc7LV3n
         z3FOgdb8iIB4p39n9r/+M/styMJ6uLPrcSj48jvEh390HR6apcr8wi8ZP0drTkByymYF
         ledHFtIXhYnnzDtEwwimeX1SJz2V+rQxt2TqvowSSD1JAIvFZkPtk064slvOcT/sK0iN
         tx/DcOs27b02Ho8OkA3upcsixw7nmo/nTcpNQuIvdrbEBm+5zLlAKm91UgQgibWYqwrl
         rkVmQ0SB0kP+8KBfGD+ac8DWlrLkgLjxG5Zgapau4abMmQuvF4ZRAfkRSIgZAOWcOMs3
         89Tg==
X-Gm-Message-State: AOAM531STBBNcqSUGT4X66WSyAyuh4GiLGn7oV8uWt6eH44lZDXEbm6r
        v6HlKaadhkKHlGqOyj/2GZ9+8w==
X-Google-Smtp-Source: ABdhPJylqpTH8n8thsMjFkTxsLxbMjGuXzOSLFrlQ6MOpttJhlgIj8J5mZrax0MPQhVSXhI3hM/lyQ==
X-Received: by 2002:a63:1f54:: with SMTP id q20mr4756956pgm.135.1609942902922;
        Wed, 06 Jan 2021 06:21:42 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id a29sm2831730pfr.73.2021.01.06.06.21.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 06:21:42 -0800 (PST)
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
Subject: [PATCH v12 09/13] mm/hugetlb: Introduce PageHugeInflight
Date:   Wed,  6 Jan 2021 22:19:27 +0800
Message-Id: <20210106141931.73931-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210106141931.73931-1-songmuchun@bytedance.com>
References: <20210106141931.73931-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we free a HugeTLB page whose vmemmap pages can be optimized,
it is freed to the buddy allocator through a kworker. And the ref
count of page is zero, so if we dissolve it before it is freed to
the buddy allocator. It can be freed again. In order to avoid
this, we introduce PageHugeInflight to indicate that the HugeTLB
page is already freed from hugepage pool but not freed to buddy
allocator yet. When we hit the inflight page, we just need to flush
the work.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 3222bad8b112..14549204ddcb 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1343,6 +1343,36 @@ static inline void flush_hpage_update_work(struct hstate *h)
 		flush_work(&hpage_update_work);
 }
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+static inline bool PageHugeInflight(struct page *head)
+{
+	return page_private(head + 5) == -1UL;
+}
+
+static inline void SetPageHugeInflight(struct page *head)
+{
+	set_page_private(head + 5, -1UL);
+}
+
+static inline void ClearPageHugeInflight(struct page *head)
+{
+	set_page_private(head + 5, 0);
+}
+#else
+static inline bool PageHugeInflight(struct page *head)
+{
+	return false;
+}
+
+static inline void SetPageHugeInflight(struct page *head)
+{
+}
+
+static inline void ClearPageHugeInflight(struct page *head)
+{
+}
+#endif
+
 static inline void __update_and_free_page(struct hstate *h, struct page *page)
 {
 	/* No need to allocate vmemmap pages */
@@ -1351,6 +1381,8 @@ static inline void __update_and_free_page(struct hstate *h, struct page *page)
 		return;
 	}
 
+	SetPageHugeInflight(page);
+
 	/*
 	 * Defer freeing to avoid using GFP_ATOMIC to allocate vmemmap
 	 * pages.
@@ -1637,6 +1669,7 @@ static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
 {
 	free_huge_page_vmemmap(h, page);
 
+	ClearPageHugeInflight(page);
 	INIT_LIST_HEAD(&page->lru);
 	set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
 	set_hugetlb_cgroup(page, NULL);
@@ -1913,13 +1946,16 @@ int dissolve_free_huge_page(struct page *page)
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
 
+		rc = 0;
 		hwpoison_subpage_set(h, head, page);
+		if (PageHugeInflight(head))
+			goto out;
+
 		list_del(&head->lru);
 		h->free_huge_pages--;
 		h->free_huge_pages_node[nid]--;
 		h->max_huge_pages--;
 		update_and_free_page(h, head);
-		rc = 0;
 	}
 out:
 	spin_unlock(&hugetlb_lock);
-- 
2.11.0

