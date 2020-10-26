Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E4FC56201
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B761024640
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="woQEvtdr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782282AbgJZO4O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:56:14 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39656 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782239AbgJZO4N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:56:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id e15so6327492pfh.6
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y9ZdVN328O2uwwSHT+BoNnojVOi64nld5Tda2i3ROBA=;
        b=woQEvtdrgcTt5KtaGjhWCUPSi5xXh9iNMRclvDRN/w23XTX07a197EfeoZ6etseu0z
         HXL0T0o7N85P/lN88MJhzuImQQEUAV19uolyMnF24miX1HhhOwQN4x1OSwzwcABZippj
         sx5kYtTF7ynotAqfdIaeuIul+5NLTLcNH+hJZ5Zl0QrxrDp9QpufqvYhP/XCDhvx+qKW
         ldXpXuvCHSoxZ3uCWj2AU9BS2PV3x4vWCWEVTSbazHORQVQBMXia8+x+c6Ixdb4bsFrp
         4qa3zzyXPfaUUWH9vKMn/vx/Isj4VcNou4jTwTkZy6REvM7nlsw0BxOwKxHDX80gUb6M
         AqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y9ZdVN328O2uwwSHT+BoNnojVOi64nld5Tda2i3ROBA=;
        b=Ac+rZ3IsiHMd4coTgQyPHoD/NWf+mfg93QnVvbv2zanqDFM68PFq8HqZOhFK+7KGDl
         9KHf/oknChGk2a7bWu1FubdiCn7LSvJOosAPrKmAxDc6AzuRfk8848Td0XjU3zugCMfI
         e1Enf+hsUgaC1q7gYWiGFD8s+jYn4jf4bywnxNtTsLixcRD3SGYznUQJhcycqqWBFooV
         jGVSw6voJj1HDn+cPoCK1hNRD3sEzXkqbyfBBT/c5KIFZpTU/oUXG1O7fiZrCYebPLZd
         WoOkEBxK/6YTnrKv/OUd/BJPis3gabONfv3HLaQZ284i8Pa6S+QdgXAMEFTCrgeYF0Rk
         Rt5A==
X-Gm-Message-State: AOAM530uyF0LYSA6JMUylzl+5UrByDiufjKIlhuklHY6H2jb5jKnGdjo
        qtiyx0+bMqfCJAbVyQao6tYBjQ==
X-Google-Smtp-Source: ABdhPJybtxEw8eg2MrMPnbUEKzS1LAsNT2c0RtK4JcGJiJczRjV0Xm8NBFRBQb7sIRhVCjvqm2TQ+w==
X-Received: by 2002:a65:67d0:: with SMTP id b16mr17133830pgs.335.1603724172489;
        Mon, 26 Oct 2020 07:56:12 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.56.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:56:11 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 19/19] mm/hugetlb: Add BUILD_BUG_ON to catch invalid usage of tail struct page
Date:   Mon, 26 Oct 2020 22:51:14 +0800
Message-Id: <20201026145114.59424-20-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
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
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 029b00ed52ed..b196373a2a39 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3955,6 +3955,8 @@ static int __init hugetlb_init(void)
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 	BUILD_BUG_ON_NOT_POWER_OF_2(sizeof(struct page));
+	BUILD_BUG_ON(NR_USED_SUBPAGE >=
+		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 #endif
 
 	if (!hugepages_supported()) {
-- 
2.20.1

