Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A18C56201
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 06:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFBFD206B6
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 06:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="H2aA2xao"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgKTGti (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 01:49:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbgKTGth (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 01:49:37 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE029C0617A7
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 22:49:37 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id t8so6923394pfg.8
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 22:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SdvvqKnmPQDzzEKZQavt4aA9vX77aS/RCbk9rPPVeB4=;
        b=H2aA2xaoiWnwW6nf39Kv1EUsqrKNerzQbrslq/NI7IVdIRJqgVKSNb1QLSqFeexpQM
         s2W0bOQA2Z64MXFCeBPxIhsqOPs/fle/YtmNMi/7ymQt8cIMHdL2FqrPekNTKBVqwmXJ
         XFDSPuJ1TaON1L0Hee6XRFlcq2QRhwzojGlwxWgbZiM4xfDN1mM0UzgJia6txEDmnfl6
         ZUBSo75B0Qdjne4F2h4rdu0tuC79BS6n+m8abxUxiRMbbYPpGvcpqJKU6sE5stAVk5wM
         wt29LVkQUPffCEZn/FBagi1xtxYlpnhHFdv4TlqFdBDgiAJFAmz4i2qEBSI/2RAq/K6V
         ezpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SdvvqKnmPQDzzEKZQavt4aA9vX77aS/RCbk9rPPVeB4=;
        b=FPWdEB3hOrh6yDEMNfDfZNfqimdRg6mEuPspmCHO2wXp36ZUon03qi0gkH6YlQz6tc
         rANfTF9Lc67cnG9FHAXBCnNS6HxA/O73Wbhj/wuga/Rf1ehuBbEtupF+2JUuk2KKSu0z
         mFEQ6e5wWgIFHr5LWjTOdXRaO8Y8uDjIPpMjayamUgq2ZFbymGIV0UEI+7ev4+NtuvEH
         fXJytPjgtLjGY9+x4Uxub3F09jqN/0M0i2bSu9zlYXyMpzGO6OOLklTcUQ7ouRs0WjtP
         o9PEigYCzFoB88mjRefhomR2TRkW3VyyDXmpQfSqb7exsg8xp5rDaaC6hEbrraQ50QPl
         3n7Q==
X-Gm-Message-State: AOAM531MiS+gk6qR+h4+ww1OGW5IPyANFruZ1DA0aZJx5TKPRM0adTAx
        byInS1WPpPpaLDZSLCE0k/KahA==
X-Google-Smtp-Source: ABdhPJzHqJGyY5pbu9G4vQoTS2YSYmL0vWhnJb+/ViUAprblRJ1z84SdXKgyNJ2fDva3na3APIqFKg==
X-Received: by 2002:a63:1445:: with SMTP id 5mr15580297pgu.357.1605854977294;
        Thu, 19 Nov 2020 22:49:37 -0800 (PST)
Received: from localhost.localdomain ([103.136.221.72])
        by smtp.gmail.com with ESMTPSA id 23sm2220278pfx.210.2020.11.19.22.49.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 22:49:36 -0800 (PST)
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
Subject: [PATCH v5 21/21] mm/hugetlb: Disable freeing vmemmap if struct page size is not power of two
Date:   Fri, 20 Nov 2020 14:43:25 +0800
Message-Id: <20201120064325.34492-22-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201120064325.34492-1-songmuchun@bytedance.com>
References: <20201120064325.34492-1-songmuchun@bytedance.com>
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
index c3b3fc041903..7bb749a3eea2 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -671,7 +671,8 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	unsigned int order = huge_page_order(h);
 	unsigned int vmemmap_pages;
 
-	if (hugetlb_free_vmemmap_disabled) {
+	if (hugetlb_free_vmemmap_disabled ||
+	    !is_power_of_2(sizeof(struct page))) {
 		pr_info("disable free vmemmap pages for %s\n", h->name);
 		return;
 	}
-- 
2.11.0

