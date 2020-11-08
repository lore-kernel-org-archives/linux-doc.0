Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12A7C4741F
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AAECA20B1F
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="RV5JZEtY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbgKHOMy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:12:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728408AbgKHOMw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:12:52 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63773C0613CF
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:12:52 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id b23so1895438pju.5
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ViDdOmBRgb5hnUIFaB4WtjDnZp7Cey4qhqZPozCdPTE=;
        b=RV5JZEtYb/jv7Riusz889INkfBW9YWjsSGPo5y797XUr7ibDqmjMDwMXeDRp2VnhQ6
         YLSNJOUGgifIwE+IZbgRibhBefG6pazChnJcsKjt6fU89esN88rrrUHsl8Q6L0d48X5i
         lx8hUtrG4ClboxdDiF2fbNVzESbgG/RpdzsS53VubU+J/mA9YAg1vqLEk0wPqgYg0cT2
         18Jvw2isDRL7Lp1hEFqM3ZtCHvKloUU9cc+nW1XhHPs4kPZ/q0NqHbrHLpZJgUQpphB+
         eUsDYuQPE2wl/32SgDiGQeHZJMPMtG4Ml9WF1BuAiiEBr9SdZj+TTc2cWt0Mkjo585mV
         dqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ViDdOmBRgb5hnUIFaB4WtjDnZp7Cey4qhqZPozCdPTE=;
        b=dEshiGbi1SxI3oZdhUrsANrmy4xsoRvteDHXs1gHo7/ImabkLpGTM8ln2PmInUheWZ
         daqCMakWJy4zxvobFPWlECvOtc1JUubv/2tQWQQRwi7sNG338zT5rcyA1C3rCMrIsxjz
         lYnbU1guTximZNhfhr1s/ybjZuBPb1hdjkGnRJs+lo7MH0FrZZNh/oxwJFU7mApIP7Rn
         xJAFUMtime2Ugtv/YgDL6rqEDsR7OjRGt6NH414x8FVsxdWvJ36RONaaYF19QcloTtFA
         pg0qPmlexpUCdaa7UCAGAtnaw22HEHccY/xSIA4AWvWG0sUR1ua4EM7ANjAzOnSbjBnx
         AGbQ==
X-Gm-Message-State: AOAM5330eQjGgrYOknKl6/ucCQAhFaeipbVlGuCQ9McLBGesuxUvVJSW
        910WrMlDZcpfulWTGj2l8+l8pA==
X-Google-Smtp-Source: ABdhPJzaq6xPhI1MKttFTsTVH2ADrn75dQVLbF8ukP71lvwo8Zled9eFiBNGlvOEJ0zaNUDRfMGnZg==
X-Received: by 2002:a17:90a:648:: with SMTP id q8mr8674681pje.176.1604844771991;
        Sun, 08 Nov 2020 06:12:51 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.12.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:12:51 -0800 (PST)
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
Subject: [PATCH v3 07/21] mm/bootmem_info: Combine bootmem info and type into page->freelist
Date:   Sun,  8 Nov 2020 22:10:59 +0800
Message-Id: <20201108141113.65450-8-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The page->private shares storage with page->ptl. In the later patch,
we will use the page->ptl. So here we combine bootmem info and type
into page->freelist so that we can do not use page->private.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/bootmem_info.h | 18 ++++++++++++++++--
 mm/bootmem_info.c            | 12 ++++++------
 mm/sparse.c                  |  4 ++--
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index ce9d8c97369d..b5786a8b412e 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -6,7 +6,7 @@
 #include <linux/mm.h>
 
 /*
- * Types for free bootmem stored in page->lru.next. These have to be in
+ * Types for free bootmem stored in page->freelist. These have to be in
  * some random range in unsigned long space for debugging purposes.
  */
 enum {
@@ -17,6 +17,20 @@ enum {
 	MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE = NODE_INFO,
 };
 
+#define BOOTMEM_TYPE_BITS	4
+#define BOOTMEM_TYPE_MAX	((1UL << BOOTMEM_TYPE_BITS) - 1)
+#define BOOTMEM_INFO_MAX	(ULONG_MAX >> BOOTMEM_TYPE_BITS)
+
+static inline unsigned long page_bootmem_type(struct page *page)
+{
+	return (unsigned long)page->freelist & BOOTMEM_TYPE_MAX;
+}
+
+static inline unsigned long page_bootmem_info(struct page *page)
+{
+	return (unsigned long)page->freelist >> BOOTMEM_TYPE_BITS;
+}
+
 #ifdef CONFIG_HAVE_BOOTMEM_INFO_NODE
 void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
 
@@ -30,7 +44,7 @@ static inline void free_vmemmap_page(struct page *page)
 
 	/* bootmem page has reserved flag in the reserve_bootmem_region */
 	if (PageReserved(page)) {
-		unsigned long magic = (unsigned long)page->freelist;
+		unsigned long magic = page_bootmem_type(page);
 
 		if (magic == SECTION_INFO || magic == MIX_SECTION_INFO)
 			put_page_bootmem(page);
diff --git a/mm/bootmem_info.c b/mm/bootmem_info.c
index fcab5a3f8cc0..9baf163965fd 100644
--- a/mm/bootmem_info.c
+++ b/mm/bootmem_info.c
@@ -12,9 +12,9 @@
 
 void get_page_bootmem(unsigned long info, struct page *page, unsigned long type)
 {
-	page->freelist = (void *)type;
-	SetPagePrivate(page);
-	set_page_private(page, info);
+	BUG_ON(info > BOOTMEM_INFO_MAX);
+	BUG_ON(type > BOOTMEM_TYPE_MAX);
+	page->freelist = (void *)((info << BOOTMEM_TYPE_BITS) | type);
 	page_ref_inc(page);
 }
 
@@ -22,14 +22,12 @@ void put_page_bootmem(struct page *page)
 {
 	unsigned long type;
 
-	type = (unsigned long) page->freelist;
+	type = page_bootmem_type(page);
 	BUG_ON(type < MEMORY_HOTPLUG_MIN_BOOTMEM_TYPE ||
 	       type > MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE);
 
 	if (page_ref_dec_return(page) == 1) {
 		page->freelist = NULL;
-		ClearPagePrivate(page);
-		set_page_private(page, 0);
 		INIT_LIST_HEAD(&page->lru);
 		free_reserved_page(page);
 	}
@@ -101,6 +99,8 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat)
 	int node = pgdat->node_id;
 	struct page *page;
 
+	BUILD_BUG_ON(MEMORY_HOTPLUG_MAX_BOOTMEM_TYPE > BOOTMEM_TYPE_MAX);
+
 	nr_pages = PAGE_ALIGN(sizeof(struct pglist_data)) >> PAGE_SHIFT;
 	page = virt_to_page(pgdat);
 
diff --git a/mm/sparse.c b/mm/sparse.c
index a4138410d890..fca5fa38c2bc 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -740,12 +740,12 @@ static void free_map_bootmem(struct page *memmap)
 		>> PAGE_SHIFT;
 
 	for (i = 0; i < nr_pages; i++, page++) {
-		magic = (unsigned long) page->freelist;
+		magic = page_bootmem_type(page);
 
 		BUG_ON(magic == NODE_INFO);
 
 		maps_section_nr = pfn_to_section_nr(page_to_pfn(page));
-		removing_section_nr = page_private(page);
+		removing_section_nr = page_bootmem_info(page);
 
 		/*
 		 * When this function is called, the removing section is
-- 
2.11.0

