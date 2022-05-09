Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E8AC4707A
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 06:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbiEIGlw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 02:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234625AbiEIGdX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 02:33:23 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B7F51882DE
        for <linux-doc@vger.kernel.org>; Sun,  8 May 2022 23:29:25 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id k1so12948465pll.4
        for <linux-doc@vger.kernel.org>; Sun, 08 May 2022 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ODWBdYqZzg8lChYiYiJ2sSIUo4NFfWVrgG6YTxSVP1A=;
        b=5VaRvE+1b0+qecOZ4GJucoJxjsjPux4wEKZiPchnZSOlzntRm47r+/fNfyNO94gM33
         b2lF5essaJ0F0u7Yc3+XcwJ3ydFrKhYUKiGKsRV8SfCbsL08+ZifjY0kGM1Bwg6pxtTr
         iW5uTN2ddKymbe65caoHqSSKFdZBSnCQXHSFzM4CASc2YO1ihZmxvh8RKvlNktIgYEXn
         1tp6D4xItTZeORAmkea3Cm2vzwvGkoZZ2RvAMyr4bAENdGLj8/KCQD0sxRGO152aPijt
         X49U+u+mQOasEcUMV/c5XBsqLXy1AzmQaatvdPpF2zUyAS4aQG9SjLl+lu2F2jAjSjet
         qgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ODWBdYqZzg8lChYiYiJ2sSIUo4NFfWVrgG6YTxSVP1A=;
        b=jzUBggs2Ks0c8gvKAKZEGOhoAdaHS0TxZJ+FDQIRuoaC/xoQxDGCiouAEUTZePZ93p
         aK6WFVXAyLfsl+T8IL0YPVoV3y2ImrWaKyZQg7BFtrEISsVpBYw7CNUKB5Ii53LUe2zb
         08KvPCALLT1GJ4KVTgAASN5rvs0n/S2dcGBAHzvFFM+6EgJhph9JqkfHb0ovTuy4rl5v
         sp6baZO6+KI7buumexvTUZ93q4UVu0Z4v3BvHflqTBTK2Qs4bpnHf+xewciBQYNPqs1z
         4iZmBrbZIqkTAieKL1J7KDih6xNS5kunBxqy1/OhYQ81DPgzjsNj0SghOs8hVlnTRWm1
         Y3bA==
X-Gm-Message-State: AOAM533/NmyxW6pNRiKL+3XPMD29D/Xx6hyQAP/7sebDoG0D9gxYWiiN
        NnyCXo/3bFvK8Bt/TvruEoyKLw==
X-Google-Smtp-Source: ABdhPJwNiK5mpR/izG+cjL30Z+YU1i7fHNaGnW9U69VmZcwf6IsqUGfxeQRhRibbPJ5pQZmZ1kOS/A==
X-Received: by 2002:a17:903:2341:b0:15e:c7c4:2bb9 with SMTP id c1-20020a170903234100b0015ec7c42bb9mr14922190plh.108.1652077762701;
        Sun, 08 May 2022 23:29:22 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id k17-20020a170902ba9100b0015e8d4eb2c2sm6162001pls.268.2022.05.08.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:29:22 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v10 1/4] mm: hugetlb_vmemmap: disable hugetlb_optimize_vmemmap when struct page crosses page boundaries
Date:   Mon,  9 May 2022 14:27:00 +0800
Message-Id: <20220509062703.64249-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220509062703.64249-1-songmuchun@bytedance.com>
References: <20220509062703.64249-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of "struct page" is not the power of two but with the feature
of minimizing overhead of struct page associated with each HugeTLB is
enabled, then the vmemmap pages of HugeTLB will be corrupted after
remapping (panic is about to happen in theory).  But this only exists when
!CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
configuration nowadays.  So it is not a real word issue, just the result
of a code review.

But we cannot prevent anyone from configuring that combined configure.
This hugetlb_optimize_vmemmap should be disable in this case to fix this
issue.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 mm/hugetlb_vmemmap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 29554c6ef2ae..6254bb2d4ae5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -28,12 +28,6 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
 static int __init hugetlb_vmemmap_early_param(char *buf)
 {
-	/* We cannot optimize if a "struct page" crosses page boundaries. */
-	if (!is_power_of_2(sizeof(struct page))) {
-		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
-		return 0;
-	}
-
 	if (!buf)
 		return -EINVAL;
 
@@ -119,6 +113,12 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	if (!hugetlb_optimize_vmemmap_enabled())
 		return;
 
+	if (!is_power_of_2(sizeof(struct page))) {
+		pr_warn_once("cannot optimize vmemmap pages because \"struct page\" crosses page boundaries\n");
+		static_branch_disable(&hugetlb_optimize_vmemmap_key);
+		return;
+	}
+
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page is not to be freed to buddy allocator, the other tail
-- 
2.11.0

