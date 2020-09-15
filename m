Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CC2C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:45:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E3502076B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="KJWEmRh7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgIPApB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgIONAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:00:51 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF708C06174A
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:00:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b17so1684565pji.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ph9Npx9Sc9T0289Sa+bHIQdTtsrfAT1jO6vE3p2NbQA=;
        b=KJWEmRh74MpS+BiJEmcfSUmams10jgYpmHOWHONrwDWFrjooYDHDyiRYhnMnOh+VvH
         Ty93H0BLab/qOFPkqwZAtkalYiEKAswo3uakzsrS4kepjFgxSQ7RsNb+5LEwpn8pOIlN
         8WcE6SBqdZ+KTgt/ZnU7xAqtXD29FYuKipqzPasecDeZxF2J000H2LHOEUoixY8onUxu
         xyW8ouRBL6mMCL9OCt2RVqaWSXtWesOFCJr0BX/OD1P83WlHpuvpzIBMSm3WVbYbesrO
         2qFxvf8ijooHQImhd2dzz/2SA1y0avrE1ON/+PxTnAASjGYoGYzX2ETddAO+mnNasE+B
         /zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ph9Npx9Sc9T0289Sa+bHIQdTtsrfAT1jO6vE3p2NbQA=;
        b=m5pA3V1U5OKEhgyg+1yJwfOaX0VV4/9Q/3EIgszqkU0vN0caELIHsNP52M0YouqaTM
         JFByY249GhW9WeCQ9+fe6kxyLji3cMUyUKfSwy1+8P8s/o0kGZCa0MAt945sh4+c3veL
         q9y4nHLG5ENYbEexd4veU9ApuuQ7IyfKm2juZv9ZrYiGsEaVFY8VY859rQDlQQW2j5qs
         /V6qtrOvDW33yrOeZt1TDTsfWNbkILZmqQ8qhjfpcXlPjAvFd1C6dBUeiuVFq19rFatS
         +O+QstZU6urCUJkgJeOQmAqG1/GAx6TeP9+RhQtKjTjVjeEo3MWOPB8zONTGi6Wqstp4
         w4iw==
X-Gm-Message-State: AOAM532b4xPQ1WCoIAb+Jim0lHZwPLC7dY2mu3E2C2WiLEkOaOsiR/pA
        e5kB/zrsrcfLp3uimUPQbMhAIQ==
X-Google-Smtp-Source: ABdhPJwLaJ+aIVCorogq2CdD6Jk2kg3Rfgolvi723baFH8rkm/8wVxPlvYY+XFAEuzspsZb0g54KWg==
X-Received: by 2002:a17:90a:1548:: with SMTP id y8mr3968874pja.113.1600174848501;
        Tue, 15 Sep 2020 06:00:48 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.00.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:00:47 -0700 (PDT)
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
Subject: [RFC PATCH 04/24] mm/hugetlb: Register bootmem info when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
Date:   Tue, 15 Sep 2020 20:59:27 +0800
Message-Id: <20200915125947.26204-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We use put_page_bootmem() to free the unused vmemmap pages associated with
each hugetlb page, so we need register bootmem info in advance, even if
!CONFIG_NUMA.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 0a45f062826e..0435bee2e172 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
 
 static void __init register_page_bootmem_info(void)
 {
-#ifdef CONFIG_NUMA
+#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
 	int i;
 
 	for_each_online_node(i)
-- 
2.20.1

