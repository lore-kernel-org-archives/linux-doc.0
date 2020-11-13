Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D960C388F7
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:15:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3FAF2137B
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="acPhX2RT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgKMLPL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726437AbgKMLF4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:05:56 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19617C09424E
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:04:46 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id f38so6833686pgm.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9fcYda0AgPV/WnXKlnMuFEs34xJLysA9FVwvOk3sXIs=;
        b=acPhX2RT/KAG0d/biBqn+RStXr042kHnAgVWmRzsh8fygXJWhjB4LGnM3ArK78IYHy
         05M1F8hixARWaE1jYAwk1yTcqe4rYbkfaAHkyKyIi4+8+9KuXuglgShz7W6hkk/X9HE1
         N2n5uQS2/wDQuZFTzGZ2NDZiK2mDbfUba6OJJMr87S9/fgyc80MoT7cLUTQ0vFQyAdgF
         du7NuXu0ZzcYLYPUkUpImZuusIrbVD8hT0F5R4Tcs5ycO3EjK1rKcs04htAn854HEBTd
         hZoDX34VvtIBK69tAyNUPPlre/Wvo5RGsq3oAxvzDW7F326FTW5eb4uxR5bfOdkM8Pbw
         Eazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9fcYda0AgPV/WnXKlnMuFEs34xJLysA9FVwvOk3sXIs=;
        b=gKM2ja2aKZiuWyllXEmHM0AqoxCWG1sVS7DjBz058pFLCJ0hgXpESp2pPCxn97gz0E
         offznzaHr74grDjZpw33cxM7gTuusI+NWQ+GKsfl+ygb02evR7uVnsJG7/1aLxW13v2u
         yOcSNcUTVLwMfhGkHTgcA/3WKNIE+PnYv2FFeAYangJgJpoh/uysYNV0zDPFeb3nxJnN
         ZmfAR/AQdUANdZIq+yF1VegUrEOP1WvqABtOhno1YkYsUr59Cz7sqVAk7KDSzZCcGXkt
         R1OTGuJhQbaWVIiHrsIFf1JNa+mrbSFbTF3E3gdpz6B3ojjH8YnuDSUAnggWvuEMyPEd
         uQBg==
X-Gm-Message-State: AOAM5316DPQEiBtJsefWnjl/94uJjZ2Vv7Dvbh0wiVjORvTFlnG7KELh
        L3tQADPrwdcwDcDfPvDLn4Uhfg==
X-Google-Smtp-Source: ABdhPJy3y4l2jKKhlBarikLuHDHXd6EaPh5lhfhf6nys027+oDsqWvIQDzCElVYorC4v+mz0uMOCFA==
X-Received: by 2002:a17:90a:d184:: with SMTP id fu4mr1106379pjb.173.1605265485688;
        Fri, 13 Nov 2020 03:04:45 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.04.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:04:45 -0800 (PST)
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
Subject: [PATCH v4 20/21] mm/hugetlb: Add BUILD_BUG_ON to catch invalid usage of tail struct page
Date:   Fri, 13 Nov 2020 18:59:51 +0800
Message-Id: <20201113105952.11638-21-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are only `RESERVE_VMEMMAP_SIZE / sizeof(struct page)` struct pages
can be used when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, so add a BUILD_BUG_ON
to catch this invalid usage of tail struct page.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 5c00826a98b3..f67aec6e3bb1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -717,6 +717,9 @@ static int __init vmemmap_ptlock_init(void)
 {
 	int nid;
 
+	BUILD_BUG_ON(NR_USED_SUBPAGE >=
+		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
+
 	if (!hugepages_supported())
 		return 0;
 
-- 
2.11.0

