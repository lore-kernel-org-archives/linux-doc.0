Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09792C4742C
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:08:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEFE120797
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:08:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="AS+sztqa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgKMLIH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgKMLGJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:06:09 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5033DC08E861
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:04:57 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id cp9so4400191plb.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l9UdRDVTVA9p+ZXsVGnKTJDsCrdBiTFetvlG+i4H0yc=;
        b=AS+sztqaorePlJ6XZc9emmP6jtL7Eyohp2JdsVut2PX0qLCIhzXU6ZdcJNpPT2gjOe
         +Upw+iEiBZHarM+fDYKJ24SteIFOnAxkt0PnoSN9xIN+zKMt6XsBfFJst8vLxfPbvaaZ
         3HckQ+Q1gdNF7ujCbFtJv3uZ663GT/F+DlFdAGfuCDSDhUdo39cI2ocg9Zbk7PC+8S6R
         SF+j5BdZAwEeaifFMgIKWevLMFqE5W82s4o+s3+i3M2wJ2su6gKMyxDi2HGeX2RgZMFQ
         JI3/Zs3B81JEDn9BoL/g6z8C02w7I8hiSmC6NUvWLgQjb2XHmALoyUA1IvWAVASMiGKR
         usWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l9UdRDVTVA9p+ZXsVGnKTJDsCrdBiTFetvlG+i4H0yc=;
        b=ctAREjG1/RWgCbAxgvqqs99fw3sptCa7nUp+F4zoWghF2qyrlTyw8MQqkqkDEYIuZk
         M/XQr5fXCZZVB93tUIm2nDvWOBnOsq9PHjIrhejEa8tHQdtcLbGA+UgEzPPcg5dUQddb
         ++Rg7QUUTKIzNj+Von+D+FEO4R7T7tka0sxlDwK2/R5P1fYyHZJ+jeoZ3xPx6VM0+BLM
         3Opy5pgtMkogc/hnVxDjxZU27DuDugkJtaM29fZRpN/q5BLzll4yHFMCNomhkJ9mGedF
         Kpdge3hZXurmxV1sXR3OTYFhlRLm3nBm8xbgutUv+xuiqXrWxpm0YfZPRO2MrZEQIZ/7
         KKVQ==
X-Gm-Message-State: AOAM532EQiN/zZgoCb6Tx04XYczJDK05HHqh6vFwqW7aw4RzrDqH2zKF
        tvl/1irYDdJMXAa5LVmzjdeb1A==
X-Google-Smtp-Source: ABdhPJxzUgobcNi9dq/vlyFNji/6h++fpZQcRbnQtl2TuCezjK46BhKasiCuxIhitc0mAP75n+y8iw==
X-Received: by 2002:a17:902:9a48:b029:d6:e0ba:f301 with SMTP id x8-20020a1709029a48b02900d6e0baf301mr1794976plv.30.1605265496908;
        Fri, 13 Nov 2020 03:04:56 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.04.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:04:56 -0800 (PST)
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
Subject: [PATCH v4 21/21] mm/hugetlb: Disable freeing vmemmap if struct page size is not power of two
Date:   Fri, 13 Nov 2020 18:59:52 +0800
Message-Id: <20201113105952.11638-22-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We only can free the unused vmemmap to the buddy system when the
size of struct page is a power of two.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index f67aec6e3bb1..a0a5df9dba6b 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -635,7 +635,8 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	unsigned int order = huge_page_order(h);
 	unsigned int vmemmap_pages;
 
-	if (hugetlb_free_vmemmap_disabled) {
+	if (hugetlb_free_vmemmap_disabled ||
+	    !is_power_of_2(sizeof(struct page))) {
 		h->nr_free_vmemmap_pages = 0;
 		pr_info("disable free vmemmap pages for %s\n", h->name);
 		return;
-- 
2.11.0

