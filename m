Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092BFC433DB
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jan 2021 15:17:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF5E122460
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jan 2021 15:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729350AbhAQPQm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 17 Jan 2021 10:16:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbhAQPPy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Jan 2021 10:15:54 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EE1C06179A
        for <linux-doc@vger.kernel.org>; Sun, 17 Jan 2021 07:15:08 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id j12so1521498pfj.12
        for <linux-doc@vger.kernel.org>; Sun, 17 Jan 2021 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=leMCwiJUMOALRI5sultiZwFK5v4LdPgwOBvUXqzpH+M=;
        b=nU947GUBl5gNEwin/Dh5khj/oNK7YocifknATbfcT2PQvf7wzkSL2i6ac0RWNMcswJ
         Qx9QJkfu5r/pQ7szUy775TQPy5EYJmymzC4qqeBhixQbfrtgPUktVp0kRD17Ri4XG+4J
         rFJZmd9tnAuk3hx+ll4HmwdZo6uF07W1TaOuGWE4131eUzOEOT/wPOHoTn9/3BgFsoBD
         NCvpEwEJMtD/6JLkB8zj6uSHx5rbDo6arnxQMWYoygDiNYrii79NFNrRhjzxLaOJoiZB
         EmB3Sqvobb4k/AvAem+aG5Crop1DkzAosxPSsCTPLN8ffvz62UC2MmSITreWPt793E89
         z9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=leMCwiJUMOALRI5sultiZwFK5v4LdPgwOBvUXqzpH+M=;
        b=YdPSTCUT8U+G4p/anHZScBbAn/sTI7ekAgxn1cIcyXSQ8sZWDJXr+69vGxLCoVVdId
         AJlW+sHhawPnpyMazXXeE/XFER+/BmKEPnWecoQ1kM2No/XErgVuZwRAX4DgtK3EFV5r
         wbURDAz8yLa3htPdwSjt1/Ayh5luAiiUkIhXEzcQ5SSjjSf+VKFAhmDRw2wZhf/aQGTY
         wxQlQWNtE0gObAUPPTl6zgzyyPs3JQ44vu4gTQOPXNZGQcI4EBsg/s3IDTHSKjdE3Y9h
         mxMEDruAJuUX7K3K8AF+/3RHhHmXO34LLcoEUO2y2UkXa2Y0bwdV83hDJdWRPiEAA5Nc
         D/Ig==
X-Gm-Message-State: AOAM530RDtS0/N+ssLSxLWX/mKucZZ6HSzAk1dTAauISmup1IuYTwOXP
        EppYBEdC5vNj/dgOXWz5cTeeNQ==
X-Google-Smtp-Source: ABdhPJwKE9KZZq+vF8UdJn0d8va2uhh4pytapUNaWVa6FNjoKs5iqgjgPpbCtvxqTymHRujF1jknNg==
X-Received: by 2002:aa7:83cd:0:b029:1a5:fb23:ad7f with SMTP id j13-20020aa783cd0000b02901a5fb23ad7fmr22184733pfn.46.1610896508537;
        Sun, 17 Jan 2021 07:15:08 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id i22sm9247915pjv.35.2021.01.17.07.14.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 07:15:08 -0800 (PST)
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
Subject: [PATCH v13 08/12] mm: hugetlb: introduce PageHugeInflight
Date:   Sun, 17 Jan 2021 23:10:49 +0800
Message-Id: <20210117151053.24600-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210117151053.24600-1-songmuchun@bytedance.com>
References: <20210117151053.24600-1-songmuchun@bytedance.com>
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

