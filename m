Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B111C2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D968D22281
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="PoYZwLxm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782203AbgJZOxm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:53:42 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41674 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782199AbgJZOxm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:53:42 -0400
Received: by mail-pg1-f195.google.com with SMTP id g12so5402037pgm.8
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KfeEXuNnvlERaIlJyKUi/sIz8pfmKf7YjRp+KoglCMM=;
        b=PoYZwLxm0eGrh750Xf3UFJKkqRg/tw0tTLFmyzPDyATTZaqBPwiDbOtC3aBwWX38A7
         MJ40cUfE9bIYgoWlSnOBrG35JYysPqwha5nBQqTVVrYoW5Huq1t1wfPcD9PpFL+GU72Q
         AO3dMefE1BLvsWt71kpjm1sVwN265V3m5EIZF56G4hM/JB3G8jvpN3evC1isb8dJ5ewS
         IqarUWD5uNBApstxsdPSwEGH3Bhe38ZEreIomEV/jvUlYxCCCskndNbhOpF0rZim2toK
         BrDILlDJmG+/RI01mk6oupzqRV1zeKYWpk/mmx9O0liEjpikY/U+K36B8G6wAzzxI4pU
         LHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KfeEXuNnvlERaIlJyKUi/sIz8pfmKf7YjRp+KoglCMM=;
        b=s5rXptThsS/MpYat+LZAo6pii8UYV4GD15JxzOz2zg+3HxfUo7lbF6imVRoWQsz6tI
         CO91MfzjBr7BBe2WT9OwVdjLMLYv5rJ4KfXYFF3EaHcAxLxNnBeUYcQptqgyZCu17bkY
         mF8M//COEZojp99pa6GH0d+9CYcz0nv6GycsZt25u/dsyDck9xi7Vhu8DNBsGMFX2J/t
         I2VbEL5yPGiIoxwcmTX+IIUNt1q/bxw6LL4nPe8hIYWWmN4T7b39tmmFCuTOY1m7n8Bc
         oRuTf9Gh6BgdYDDfudWrMEiuvQGikSc1AIC+sdTa3DQpKsxdPvP9Ix+xSoVQj/Szxdve
         dG6A==
X-Gm-Message-State: AOAM532Qu0iqKw5eoz+k8Mgw3sIhXECbOmdzXgmyDBoYp44uH3KrD9Nj
        KVWT7CJzp4V7UykoBC2ehe2r1A==
X-Google-Smtp-Source: ABdhPJwe3g7LIncHQS+u6E35m8bv3L935tezAMVtRdtCGhLL9PGPFLFu3zLVDt62DdNOARtmrevWvw==
X-Received: by 2002:a63:2406:: with SMTP id k6mr13748236pgk.366.1603724021253;
        Mon, 26 Oct 2020 07:53:41 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.53.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:53:40 -0700 (PDT)
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
Subject: [PATCH v2 03/19] mm/hugetlb: Introduce a new config HUGETLB_PAGE_FREE_VMEMMAP
Date:   Mon, 26 Oct 2020 22:50:58 +0800
Message-Id: <20201026145114.59424-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The purpose of introducing HUGETLB_PAGE_FREE_VMEMMAP is to configure
whether to enable the feature of freeing unused vmemmap associated
with HugeTLB pages. Now only support x86.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c |  2 +-
 fs/Kconfig            | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

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
diff --git a/fs/Kconfig b/fs/Kconfig
index 976e8b9033c4..5a4265ff2a86 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -245,6 +245,22 @@ config HUGETLBFS
 config HUGETLB_PAGE
 	def_bool HUGETLBFS
 
+config HUGETLB_PAGE_FREE_VMEMMAP
+	bool "Free unused vmemmap associated with HugeTLB pages"
+	default n
+	depends on X86
+	depends on HUGETLB_PAGE
+	depends on SPARSEMEM_VMEMMAP
+	depends on HAVE_BOOTMEM_INFO_NODE
+	help
+	  There are many struct page structures associated with each HugeTLB
+	  page. But we only use a few struct page structures. In this case,
+	  it wastes some memory. It is better to free the unused struct page
+	  structures to buddy system which can save some memory. For
+	  architectures that support it, say Y here.
+
+	  If unsure, say N.
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
-- 
2.20.1

