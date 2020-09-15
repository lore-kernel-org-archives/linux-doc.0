Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0982C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A5172080C
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="UCioyFq/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgIPAkG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgIONEs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:04:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6153C061355
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:04:03 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id md22so6637191pjb.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jiL3ii4AJU2Njj/y/vFrTYFZ6QNs3Srg45f1FwlIOSw=;
        b=UCioyFq/nMf2pfW7YzyCEcx4LL4/jL1jJUkht2xjt+BMHebuzK/UKImXusybczC6tr
         hTRa9/L+br3pbdNipbSH20dV6etCd7/zplLBClKqkOe4p99jl807aGZocuBegTAKWegT
         qW2M0vOxaqwVOFS01ltZ94MXkaAN3yu7UcDSaUKd6lyuAbXXcRx6JaBNLO4WCBHrONrQ
         mI/sHDT9Q2NI5W8AOCu7XWmJSS7/IKrSpKT5OJnmwubKGNTLD2TMr7GFNW3wXS1xr9xB
         kQBgwh1xu2xzg1c75B4nGCznnkOnVs7OKDaGcFSPjqv8srW2nRfVyrrMT3OMOu6XNeyH
         5Zqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jiL3ii4AJU2Njj/y/vFrTYFZ6QNs3Srg45f1FwlIOSw=;
        b=XETDThkehYkB6BWogWOCv/+vBvCh6I+jDkiG9AbJVPLs+xCM2x53WQZQSoSQxON5Uj
         9m917HaPkrQTqQgy/vI7xoG4j4plEf4bwWdHK5hBtaPs98DFazxJzgqa9LzWu4OFNduh
         QklIklHBy0RZTyRECFanJD3PCSFwKhr5229IQpG+tJO15vZNSJtrwwXkXpTtiy1hGqrm
         4LGdR32mHypbC7CTLONszOWzmdO9RNcEpPUZeD/n8lGQBhlmSgLtKWRm9eNKlhcY0tLH
         spFrBFZYqaikT5WaIYaTUreZzUyH3nP/old2fyLahRtNApyyzgS64moupsmx31gKXIj2
         TsEA==
X-Gm-Message-State: AOAM531cEk4G6H8pPL5HaGdSCxG4sQOKjLbSHUFcC9yw7xazXNklHO33
        +nu8oAkBVexigQUESYtiocHFIg==
X-Google-Smtp-Source: ABdhPJzDjZ5u/kFp3j7KzOYJwm3WjE591cWhOwkG8OQSFmLJnogu52u+8IhXbjfuzBZdoCwfGeOYwQ==
X-Received: by 2002:a17:902:9887:b029:d1:e626:788d with SMTP id s7-20020a1709029887b02900d1e626788dmr1206774plp.53.1600175043242;
        Tue, 15 Sep 2020 06:04:03 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.03.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:04:02 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [RFC PATCH 24/24] mm/hugetlb: Add BUILD_BUG_ON to catch invalid usage of tail struct page
Date:   Tue, 15 Sep 2020 20:59:47 +0800
Message-Id: <20200915125947.26204-25-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are only `RESERVE_VMEMMAP_SIZE / sizeof(struct page)` struct pages
can be used when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, so add a BUILD_BUG_ON
to catch this invalid usage of tail struct page.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index e66c3f10c583..63995ba74b6b 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3994,6 +3994,8 @@ static int __init hugetlb_init(void)
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 	BUILD_BUG_ON_NOT_POWER_OF_2(sizeof(struct page));
+	BUILD_BUG_ON(NR_USED_SUBPAGE >=
+		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 #endif
 
 	if (!hugepages_supported()) {
-- 
2.20.1

