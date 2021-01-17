Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C2DC433E0
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jan 2021 15:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38BD32255F
	for <linux-doc@archiver.kernel.org>; Sun, 17 Jan 2021 15:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbhAQPUd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 17 Jan 2021 10:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729494AbhAQPPV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 17 Jan 2021 10:15:21 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B4CC0613D3
        for <linux-doc@vger.kernel.org>; Sun, 17 Jan 2021 07:14:41 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id q4so7222285plr.7
        for <linux-doc@vger.kernel.org>; Sun, 17 Jan 2021 07:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAzAJAw7JBXGA5wVumCYbe7IIg4huGuKzHI34tpedh0=;
        b=KTUr9bgvGRfZY7zXyuwqqHtpRf08YVqRbt+LDLJU7qpqnjsV8fzOF/1SuTd2UmsSpW
         mGlYwlOtzOcINqgu4C5bZ1e93d+XOozvOTgYxbuejQG+mvigc4Z7OXdbWEjfXbhW45pr
         grL/MeFRczzi5E2HbJ3K9zLMQ5nKra2Ed6nKyQX1Zr3nWiHUBSaF8W3GnWun90ZMqdmG
         TMSIxi2AQWQ9Ni3I2zfoUC0zvJqa99AyQvzd+bUHhdEANd1Ky8yDKSwzXKSRRkeGTYSs
         N5J5MtL78j0A4Pa+APQ/OvmwiQmzGXnIcPi9FQ5wVzLLcuRUU5DHBiBSOlUT9EyWNCX1
         Nuqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAzAJAw7JBXGA5wVumCYbe7IIg4huGuKzHI34tpedh0=;
        b=IU2Ig84GB+M+dTNca8bLzm1JvGDaiDZvxvqVpVkuy9IBYRfC0kR2SDMTnlWxd+WANt
         pRrtIFkQousUXj0Eo7u5hYEkLhxsdreEiPnbtmf8qkI0FDnXYIp7KHxDtCof8Qnfvb+9
         VwtJKSqlw7DJgZHg6CIZsymb0radkuZNl/qQkG353lHqVDWkN2VerTJH+qn+s7kyTLBG
         0R25ST93GPx6t9UDEHVLboELzgmwpdSm087+f+N942njcc4eiIaAqvnhH2pKoMb/m2W7
         Wu1qsIiWr00sepwkiUq9VLS5IAC/hwPsXnvPd5segCJHbt0mEK7l5NFBjTnf5slD0iCY
         4VBw==
X-Gm-Message-State: AOAM531wOyDdVXbGgemuGeXBb4WsaLFvmYTnctjRe/8IYgomTaEx37p0
        sxIH9LjpkZ9BYKtV1cjCawPXrQ==
X-Google-Smtp-Source: ABdhPJyZnm1OiBW8g2a5JU4rQ20aHbQusIDFhvpTdfXrG3sJdzrVFR5b4ifkqeOM6cYqFgDldVrTeA==
X-Received: by 2002:a17:90a:e006:: with SMTP id u6mr20691095pjy.201.1610896481318;
        Sun, 17 Jan 2021 07:14:41 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id i22sm9247915pjv.35.2021.01.17.07.14.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Jan 2021 07:14:40 -0800 (PST)
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
Subject: [PATCH v13 06/12] mm: hugetlb: set the PageHWPoison to the raw error page
Date:   Sun, 17 Jan 2021 23:10:47 +0800
Message-Id: <20210117151053.24600-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210117151053.24600-1-songmuchun@bytedance.com>
References: <20210117151053.24600-1-songmuchun@bytedance.com>
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
 mm/hugetlb.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index d11c32fcdb38..6caaa7e5dd2a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1358,6 +1358,63 @@ static inline void __update_and_free_page(struct hstate *h, struct page *page)
 		schedule_work(&hpage_update_work);
 }
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
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
+#else
+static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
+{
+}
+
+static inline void hwpoison_subpage_set(struct hstate *h, struct page *head,
+					struct page *page)
+{
+	if (PageHWPoison(head) && page != head) {
+		/*
+		 * Move PageHWPoison flag from head page to the raw error page,
+		 * which makes any subpages rather than the error page reusable.
+		 */
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+#endif
+
 static void update_and_free_page(struct hstate *h, struct page *page)
 {
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
@@ -1373,6 +1430,8 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 {
 	int i;
 
+	hwpoison_subpage_deliver(h, page);
+
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
 				1 << PG_referenced | 1 << PG_dirty |
@@ -1845,14 +1904,8 @@ int dissolve_free_huge_page(struct page *page)
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

