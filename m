Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD105C388F7
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:15:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75AD5207DE
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:15:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="aGk77ho7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgKMLPw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:15:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbgKMLEC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:04:02 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA003C08E9AA
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:03:23 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w14so7331481pfd.7
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SX/i7Qyg4EeyUbzxMmXSVQWEWDSzbgT6hhsWUt63V1U=;
        b=aGk77ho777Ou5HKsMp4MLx10GBvaNnVTXQ5XKeHBPmU6a/rGunCtgJxW+iegljbe9B
         HYThHErweWzFAlZxpir6SbXMVsfFc4pWbJs8RbotA9e3eLIcVZK5UDrKGvl+QYTfqkNg
         hBdez0L+yQAUvxLt/CGMqRjzch0M4uQIJnO78Yv79HH5Yl3Q4yCr83lmQnNo0tFliJ+F
         IhHM5zhlKNOGHNuWZAJxPO/+7uTfK7qIubaKw+nrwIk0cYDXMHpR1bqu3JhE0Z+ga03j
         OCKTW13nMPchxVUWO2w0C3bW6p7eli74kPQcVj3NfNso1yWOZSbiOSqPczO8QjTHhkJp
         dByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SX/i7Qyg4EeyUbzxMmXSVQWEWDSzbgT6hhsWUt63V1U=;
        b=fbmXm0Ggj0o4UwM6Bu+u0O9GRwddO1YLKfPEJm1bbTDW9vpnuldKLcFU6Xq6djxrEI
         kB9tfb4CBIAOkInO3Nm7FCiwgmg+WYyxM7li36gBlVVsnHsNBExHBHO2cc3i4zV3kchn
         GJ1gjKYi/3rpp9or17lUq/xGJXl+CiSbmbFdau4uVWlMucpqT+X2ItqKQYw+vaQhxCIE
         wE+RGblStIQ4JfX6Bas0wHjR8spPPXFqEzdYu9sCY7/J8lRY++V4Swgaiqx+7DjKSriU
         pIkpsyNquSLrc1QwDsTMUEqCMg8ioMnaItrTho91/4SnPysUV7H1fd3Si4ejc/8i78ga
         HK5A==
X-Gm-Message-State: AOAM532kQ/wSxvcW7FoW7Xr4yb+K2MvXcOCz0JQnxQH8TSf3gS+/Af0S
        1XW1hKXV0cLhnYlZWfN/UKB6NQ==
X-Google-Smtp-Source: ABdhPJwQeGgpDvfFR9ELb9n7ojrevOtBi4ecXD9eqeAxem6yL+RhNnapjzGSGHmQx41LzOsy0em5AQ==
X-Received: by 2002:a17:90b:3884:: with SMTP id mu4mr2431364pjb.157.1605265403481;
        Fri, 13 Nov 2020 03:03:23 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.03.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:03:22 -0800 (PST)
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
Subject: [PATCH v4 13/21] mm/hugetlb: Use PG_slab to indicate split pmd
Date:   Fri, 13 Nov 2020 18:59:44 +0800
Message-Id: <20201113105952.11638-14-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we allocate hugetlb page from buddy, we may need split huge pmd
to pte. When we free the hugetlb page, we can merge pte to pmd. So
we need to distinguish whether the previous pmd has been split. The
page table is not allocated from slab. So we can reuse the PG_slab
to indicate that the pmd has been split.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ae9dbfb682ab..58bff13a2301 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -262,6 +262,25 @@ static void remap_huge_page_pmd_vmemmap(struct hstate *h, pmd_t *pmd,
 	flush_tlb_kernel_range(start, end);
 }
 
+static inline bool pmd_split(pmd_t *pmd)
+{
+	return PageSlab(pmd_page(*pmd));
+}
+
+static inline void set_pmd_split(pmd_t *pmd)
+{
+	/*
+	 * We should not use slab for page table allocation. So we can set
+	 * PG_slab to indicate that the pmd has been split.
+	 */
+	__SetPageSlab(pmd_page(*pmd));
+}
+
+static inline void clear_pmd_split(pmd_t *pmd)
+{
+	__ClearPageSlab(pmd_page(*pmd));
+}
+
 static void __remap_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
 					  unsigned long start,
 					  unsigned long end,
@@ -326,11 +345,12 @@ void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
 	ptl = vmemmap_pmd_lock(pmd);
 	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &remap_pages,
 				    __remap_huge_page_pte_vmemmap);
-	if (!freed_vmemmap_hpage_dec(pmd_page(*pmd))) {
+	if (!freed_vmemmap_hpage_dec(pmd_page(*pmd)) && pmd_split(pmd)) {
 		/*
 		 * Todo:
 		 * Merge pte to huge pmd if it has ever been split.
 		 */
+		clear_pmd_split(pmd);
 	}
 	spin_unlock(ptl);
 }
@@ -412,8 +432,10 @@ void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 	BUG_ON(!pmd);
 
 	ptl = vmemmap_pmd_lock(pmd);
-	if (vmemmap_pmd_huge(pmd))
+	if (vmemmap_pmd_huge(pmd)) {
 		split_vmemmap_huge_page(head, pmd);
+		set_pmd_split(pmd);
+	}
 
 	remap_huge_page_pmd_vmemmap(h, pmd, (unsigned long)head, &free_pages,
 				    __free_huge_page_pte_vmemmap);
-- 
2.11.0

