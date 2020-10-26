Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300EFC4363A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFB03239D2
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Jr0t7A8l"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782187AbgJZOxd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:53:33 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35014 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782184AbgJZOxc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:53:32 -0400
Received: by mail-pf1-f195.google.com with SMTP id b3so2983603pfo.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JXPo7X/QMMOeEjFM7lPEqkez5RoUr0SKJa3iBqD+vrs=;
        b=Jr0t7A8lAgYu1Jc7lIWedr1OlQ7+cr6dBWVk//Uh9RlRw5iG+7iB0lb6OMtp8F3heU
         c8k+k4nJb7BZaehqgFVFlKbkV/zZfZ5p0reI4fdqOjggjClrZQ8eFB1bchB6NOYrUcyb
         s4FRRWHQ1Nl1CjmdY49e5pZuL1upNI4te3O5kOt743ag9JzRt6qTY0srjAEx9ocg62El
         mPX2yx17dRmZGOs6asHD9QhVErHmrbFCm4/tjhgnC7EFgDrhoYfyTl0FHOxotl9djMjR
         ZO8GCdWW0M2zeAUg/2PPPM54FKEphAoZCpie2tmWULLnbs4PECqXj8p0qdrEMx7+nLZh
         P7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JXPo7X/QMMOeEjFM7lPEqkez5RoUr0SKJa3iBqD+vrs=;
        b=mLcRolO5M2S5yjK/OK5dA+G3J2qRellQegPDtexo57bKZab7VSGqiNgd0Mh7E7G8Fc
         zl2ALJJJscGzyCpDt/TYK/68uCC7AiTxBTbsIE5DKfjf9b2F7VHHfmko6kkvKrkQekeD
         BqFLlGRXIvC6qZLMGUfa36WwEX+EAbByqYMTRv6/c3HBePOcDmWlDd9OS0vbMgxxrvcK
         SfSTKJbGaWCPoD5qG7+HZGKp+2wo+DWtKqOl6yRR6Tq5ZgksO39SsGtNNn7QqSdA7xmf
         BteBy6wxS0QS/RwocR8HRa2P5u48i8TElL56I4+/veTy2lKf2h7QLbGnZsZVNYcPpJ3P
         grzA==
X-Gm-Message-State: AOAM533maUh5xWkbK0hyuAtE2p6CmfZFcXAeOE5wMRwfIs19R4vUdjbA
        y+JCSmZ0CJeC8xaok9akd6Y2hA==
X-Google-Smtp-Source: ABdhPJz2hCzoUdXSrTuDt0fD65I7VV0v79npjXTxq/YJ6lkUdZs77itY10vqmxVxcDN4UHiAzEu7/A==
X-Received: by 2002:a63:e94b:: with SMTP id q11mr13017724pgj.302.1603724011744;
        Mon, 26 Oct 2020 07:53:31 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.53.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:53:31 -0700 (PDT)
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
Subject: [PATCH v2 02/19] mm/memory_hotplug: Move {get,put}_page_bootmem() to bootmem_info.c
Date:   Mon, 26 Oct 2020 22:50:57 +0800
Message-Id: <20201026145114.59424-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the later patch, we will use {get,put}_page_bootmem() to initialize
the page for vmemmap or free vmemmap page to buddy. So move them out of
CONFIG_MEMORY_HOTPLUG_SPARSE. This is just code movement without any
functional change.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
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

