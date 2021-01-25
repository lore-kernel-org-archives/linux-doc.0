Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37606C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 20:49:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 091AA224DF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 20:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731565AbhAYUn4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 15:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732182AbhAYTuk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 14:50:40 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D86C06121D
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:07 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id es14so2964966qvb.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Jan 2021 11:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=W7ovzQ9DvHfyNSsR/jfLnSWR/h2NFzL1g+VyieOVil4=;
        b=UADMLlrIegNcGWIZww7E6o5AILPiEpQ+5GaHphe+4E8b2+SQFfZPbwUoVh2BV4aH3T
         H3zPy4Zk1mFIELuNlzORQ3hEUXyqOwWvQYdUUIsWVw+1q9nr4k1u4SnDWyLTLcaOoOM6
         bGCvr0fgKVMxlTHmmaN7i8nGHw2cSNs7BJsKD6BYubZ5XrUjpVcIE/Kvbaoyb/ckQZQI
         W68bT5W+mia8ZNUjTEcEN/sT6LmSe8tJ2xU8hRTaeoGpQGct9aUwuVxo9Md5obaSb8et
         GiACS9VOC//9aGFRx++DunIreXKx8XvzMAWhCtholjcW5qZiMYqI5ybHRYA4SVGJArMd
         1S+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W7ovzQ9DvHfyNSsR/jfLnSWR/h2NFzL1g+VyieOVil4=;
        b=MfSheO8ZYrxF+5tuD3nbHb3/gr2NiA7yMFTtrRyso++fjR232xg0yNC/mZZFL7mMC2
         G7zbK/a4wD2QPetIS90/Vf2pNhlMOdLOVObJ8EdcKp8T0CyTqafDtoNt7Tnosw/ZDWfe
         /xtxBqaeK4N/5D4MlR/pp0cySApb0jf0xy/t5oSjEwCIHtsuGOaLV1tOi8FFAFgeHBPg
         lrIkzZjhuQa0BlULUAGQOOoGNojTcNJ0fPKKBMJfcREnCfCq2+GC2EGGMSGLtahv70Kf
         fHhF3xRYk+0IRZZD1CwMHRXF5dzons2LGg3wyRSU22LPUJTfd9dv1XHXWSvHY67c6dDr
         pwwA==
X-Gm-Message-State: AOAM53328N8OPo9S1VdoKHBanfUAnGNcFDAsH1L6yGAyNR9ueudNQ/3o
        oI0dht6iQL1PUWMvmryBJK3qOA==
X-Google-Smtp-Source: ABdhPJzyqOavXJVtf9luNFZH6jMghueOYrdSnD4a7cqs/Vq/eAP0dRviO09WN0H4kKvXTXL5LyWi7A==
X-Received: by 2002:a0c:a8c7:: with SMTP id h7mr2337061qvc.23.1611604086739;
        Mon, 25 Jan 2021 11:48:06 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id c12sm12121569qtq.76.2021.01.25.11.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 11:48:06 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v8 08/14] mm/gup: do not migrate zero page
Date:   Mon, 25 Jan 2021 14:47:45 -0500
Message-Id: <20210125194751.1275316-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
References: <20210125194751.1275316-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On some platforms ZERO_PAGE(0) might end-up in a movable zone. Do not
migrate zero page in gup during longterm pinning as migration of zero page
is not allowed.

For example, in x86 QEMU with 16G of memory and kernelcore=5G parameter, I
see the following:

Boot#1: zero_pfn  0x48a8d zero_pfn zone: ZONE_DMA32
Boot#2: zero_pfn 0x20168d zero_pfn zone: ZONE_MOVABLE

On x86, empty_zero_page is declared in .bss and depending on the loader
may end up in different physical locations during boots.

Also, move is_zero_pfn() my_zero_pfn() functions under CONFIG_MMU, because
zero_pfn that they are using is declared in memory.c which is compiled
with CONFIG_MMU.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/mm.h      | 3 ++-
 include/linux/mmzone.h  | 4 ++++
 include/linux/pgtable.h | 3 +--
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0990a76d5e6f..0295e074cd5d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1125,7 +1125,8 @@ static inline bool is_zone_movable_page(const struct page *page)
 /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
 static inline bool is_pinnable_page(struct page *page)
 {
-	return !is_zone_movable_page(page) && !is_migrate_cma_page(page);
+	return !(is_zone_movable_page(page) || is_migrate_cma_page(page))
+		|| is_zero_pfn(page_to_pfn(page));
 }
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ae588b2f87ef..72b0b6eba854 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -427,6 +427,10 @@ enum zone_type {
 	 *    techniques might use alloc_contig_range() to hide previously
 	 *    exposed pages from the buddy again (e.g., to implement some sort
 	 *    of memory unplug in virtio-mem).
+	 * 6. ZERO_PAGE(0), kernelcore/movablecore setups might create
+	 *    situations where ZERO_PAGE(0) which is allocated differently
+	 *    on different platforms may end up in a movable zone. ZERO_PAGE(0)
+	 *    cannot be migrated.
 	 *
 	 * In general, no unmovable allocations that degrade memory offlining
 	 * should end up in ZONE_MOVABLE. Allocators (like alloc_contig_range())
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index ea5c4102c23e..54a740602618 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1118,6 +1118,7 @@ extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
 extern void untrack_pfn_moved(struct vm_area_struct *vma);
 #endif
 
+#ifdef CONFIG_MMU
 #ifdef __HAVE_COLOR_ZERO_PAGE
 static inline int is_zero_pfn(unsigned long pfn)
 {
@@ -1142,8 +1143,6 @@ static inline unsigned long my_zero_pfn(unsigned long addr)
 }
 #endif
 
-#ifdef CONFIG_MMU
-
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_trans_huge(pmd_t pmd)
 {
-- 
2.25.1

