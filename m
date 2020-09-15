Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22376C2D0F6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D989F206E6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:45:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="h7SeOiCc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgIPApd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgIONAm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:00:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DF1C061352
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:00:30 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id c196so1924069pfc.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MqToO/0MznVsff9Iws7ZuL7k7n69o4QL0M1jSkqccgc=;
        b=h7SeOiCcxT7x6e5Ak5+5ZANQAYRDcyvaANfBeZRwr1+FO8L5jlYFMa8sUmVXp5+aCp
         RnHhcDVSVW4e9ks9Oa7IUpTQ2u1wST5GU+GF9jeqhvvasT16Voswm3aEG7sknbeie6n1
         m7OlXgfV/KHgQKOuzOTW8GtK4YLDmz8gP0uNe527k6FCqlGBMXqSjoZ8L+27lM2dXc4I
         kodegbrx6CE6xtLghrsggW8pKaxJZJW+uVRxAHBjC28//F2Sr9k2DQcLNJenUQbbKreP
         RpBfTMotO0jMSTMIhaQ3n9xbrFmdRGXYzgN3GUSzE7jNvFaSjRshzoSZ6IzzsfMym3UV
         +Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MqToO/0MznVsff9Iws7ZuL7k7n69o4QL0M1jSkqccgc=;
        b=W1uHxo7E4vdJ1GBr4jOmfzLjZ8HYEkk9VB/q9rWFLplSoSApWDyVJmaoe/Fs3QEF7+
         JpW2IZGCNVEpfVGOmryJ4QPoFLkmKAdWYuF5yYV0Z6CKQqHUc1Jup2m+eZ8cTH5RC328
         SToh8Irhk659/2JjIgQDbfGlsgHnqdFvlwrlFqs4+1PhyAcgLEfegD2du2vZc1wckCQo
         Ljv9ocWygW68zdHCTCtguLAeuvmvkaE/LtLHb24KUbSfIsNZCMcUEiGPh5XFLyF23u1L
         /Cs/gu0DLLKWNh2/vqmYTrEGSjR5YOguCAzHdP4fyeKv5G5WBI+D5vm1QwphE+G6L8sS
         TJbA==
X-Gm-Message-State: AOAM530OY4gC+WJ95uacjK0Ab3YLQXtaIlaswb3MmKfMRaB4Qc1PgWmA
        NBz3ph1joeAKVW2d8FcLbM4TXg==
X-Google-Smtp-Source: ABdhPJz6zZnmYTckla1P4iMrpY5Pf5cnK1hLW2NVusEiSVfD3o2ljhZnwiLLa6GayVaDhBPdb8Gw6g==
X-Received: by 2002:aa7:989a:0:b029:142:2501:34da with SMTP id r26-20020aa7989a0000b0290142250134damr1824793pfl.51.1600174829641;
        Tue, 15 Sep 2020 06:00:29 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.00.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:00:29 -0700 (PDT)
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
Subject: [RFC PATCH 02/24] mm/memory_hotplug: Move {get,put}_page_bootmem() to bootmem_info.c
Date:   Tue, 15 Sep 2020 20:59:25 +0800
Message-Id: <20200915125947.26204-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the later patch, we will use {get,put}_page_bootmem() to initialize
the page for vmemmap or free vmemmap page to buddy. So move them out of
CONFIG_MEMORY_HOTPLUG_SPARSE.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/mm/init_64.c          |  2 +-
 include/linux/bootmem_info.h   | 13 +++++++++++++
 include/linux/memory_hotplug.h |  4 ----
 mm/bootmem_info.c              | 26 ++++++++++++++++++++++++++
 mm/memory_hotplug.c            | 27 ---------------------------
 mm/sparse.c                    |  1 +
 6 files changed, 41 insertions(+), 32 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index c7f7ad55b625..0a45f062826e 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1572,7 +1572,7 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	return err;
 }
 
-#if defined(CONFIG_MEMORY_HOTPLUG_SPARSE) && defined(CONFIG_HAVE_BOOTMEM_INFO_NODE)
+#ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
 void register_page_bootmem_memmap(unsigned long section_nr,
 				  struct page *start_page, unsigned long nr_pages)
 {
diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index 65bb9b23140f..4ed6dee1adc9 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -18,10 +18,23 @@ enum {
 
 #ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
 void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
+
+void get_page_bootmem(unsigned long info, struct page *page,
+		      unsigned long type);
+void put_page_bootmem(struct page *page);
 #else
 static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
 }
+
+static inline void put_page_bootmem(struct page *page)
+{
+}
+
+static inline void get_page_bootmem(unsigned long info, struct page *page,
+				    unsigned long type)
+{
+}
 #endif
 
 #endif /* __LINUX_BOOTMEM_INFO_H */
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 19e5d067294c..c9f3361fe84b 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -197,10 +197,6 @@ static inline void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
 #endif /* CONFIG_NUMA */
 #endif /* CONFIG_HAVE_ARCH_NODEDATA_EXTENSION */
 
-extern void put_page_bootmem(struct page *page);
-extern void get_page_bootmem(unsigned long ingo, struct page *page,
-			     unsigned long type);
-
 void get_online_mems(void);
 void put_online_mems(void);
 
diff --git a/mm/bootmem_info.c b/mm/bootmem_info.c
index 39fa8fc120bc..d276e96e487f 100644
--- a/mm/bootmem_info.c
+++ b/mm/bootmem_info.c
@@ -10,6 +10,32 @@
 #include <linux/bootmem_info.h>
 #include <linux/memory_hotplug.h>
 
+void get_page_bootmem(unsigned long info,  struct page *page,
+		      unsigned long type)
+{
+	page->freelist = (void *)type;
+	SetPagePrivate(page);
+	set_page_private(page, info);
+	page_ref_inc(page);
+}
+
+void put_page_bootmem(struct page *page)
+{
+	unsigned long type;
+
+	type = (unsigned long) page->freelist;
+	BUG_ON(type < MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE ||
+	       type > MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE);
+
+	if (page_ref_dec_return(page) == 1) {
+		page->freelist = NULL;
+		ClearPagePrivate(page);
+		set_page_private(page, 0);
+		INIT_LIST_HEAD(&page->lru);
+		free_reserved_page(page);
+	}
+}
+
 #ifndef CONFIG_SPARSEMEM_VMEMMAP
 static void register_page_bootmem_info_section(unsigned long start_pfn)
 {
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 2da4ad071456..ae57eedc341f 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -21,7 +21,6 @@
 #include <linux/memory.h>
 #include <linux/memremap.h>
 #include <linux/memory_hotplug.h>
-#include <linux/bootmem_info.h>
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
 #include <linux/ioport.h>
@@ -142,32 +141,6 @@ static void release_memory_resource(struct resource *res)
 }
 
 #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
-void get_page_bootmem(unsigned long info,  struct page *page,
-		      unsigned long type)
-{
-	page->freelist = (void *)type;
-	SetPagePrivate(page);
-	set_page_private(page, info);
-	page_ref_inc(page);
-}
-
-void put_page_bootmem(struct page *page)
-{
-	unsigned long type;
-
-	type = (unsigned long) page->freelist;
-	BUG_ON(type < MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE ||
-	       type > MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE);
-
-	if (page_ref_dec_return(page) == 1) {
-		page->freelist = NULL;
-		ClearPagePrivate(page);
-		set_page_private(page, 0);
-		INIT_LIST_HEAD(&page->lru);
-		free_reserved_page(page);
-	}
-}
-
 static int check_pfn_span(unsigned long pfn, unsigned long nr_pages,
 		const char *reason)
 {
diff --git a/mm/sparse.c b/mm/sparse.c
index b25ad8e64839..a4138410d890 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -13,6 +13,7 @@
 #include <linux/vmalloc.h>
 #include <linux/swap.h>
 #include <linux/swapops.h>
+#include <linux/bootmem_info.h>
 
 #include "internal.h"
 #include <asm/dma.h>
-- 
2.20.1

