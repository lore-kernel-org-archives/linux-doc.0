Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6E4C43381
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 15:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20F8264EC1
	for <linux-doc@archiver.kernel.org>; Mon,  1 Feb 2021 15:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231803AbhBAPkq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Feb 2021 10:40:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbhBAPkg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Feb 2021 10:40:36 -0500
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD41EC06121E
        for <linux-doc@vger.kernel.org>; Mon,  1 Feb 2021 07:38:44 -0800 (PST)
Received: by mail-qk1-x72c.google.com with SMTP id v126so16568927qkd.11
        for <linux-doc@vger.kernel.org>; Mon, 01 Feb 2021 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Qju3lH41NogqzBdz4Ys86o8JOXLDC8FcvWasnejN040=;
        b=EMk6oqBeIporKVXptFBvwyl8xTDfx+fl/2jhb1TjJkIff6Vu9oWxrN6galvCgTsLH2
         KsrRKtGcxld0AlvZz1Is2kNI/Am2VEqHdgNPkRM+aMkuZ5bV97v/K1h6h2nAlBhfJyKi
         gKyGlvRMxyZ7BgAAb8JO1b9N+ryHBHixoPFfdhhbim+lO+mTRrAOW9YI7NYJk/imAwo9
         IuJZ/vNWGoJO3sr8pEX7gRzm1X6AwJonyS2gfWF6nHfBS4sX/oY+woKORDEUhG+ISikO
         x43kEwdJ5gSOr4sPcE4H9HiMatnMjWWxD8zfxufW0d8B8ZHb4vdJVAA4aO0ieAV5LUvH
         VI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qju3lH41NogqzBdz4Ys86o8JOXLDC8FcvWasnejN040=;
        b=pG/GW22mf5yd5mCjzvyjoTTAsQ5VB9trbOW0nQ0kXjHZp1vmeI15bwEbtyHOUGFC9C
         MijbvI8WETV2vaJ8da7hoMzzMfPaJeFKYOjVB80NX0qYOO4W9yM9Gy+VZDqsn8AjUlj7
         Y5/XP+Zloc/P9bUpZvYPkjcKvCzo1l6JsN7IuTBc4ubi2eEm/MQdc2hAXF6f6bwPvaFW
         6Ih/anicdg88itLsrvbqiY5Q0UnLYgwcYRKZbBVDWckV8uC9LHkweMkIX/n/w8Re5i/Q
         nC/KAu1heX4ohNC0sKvUo8y6mB01PK0PAsOr/mwGw/FFWliY8u+ezl5y3LmR6h2qGnpz
         VLCw==
X-Gm-Message-State: AOAM530kPOmWkXkMOskpSbe8nTodFWEXhAP/jbi6icgwOLItTrj5GNGt
        7yV4qz8Mo7YUTsCDrxetsyA25w==
X-Google-Smtp-Source: ABdhPJxYxTmEUPPRNgEfvKl+1N4Z3cVG7aMWWdgM95nPZ5soALAPcovsQU/GFxfDfiWr0ndVY8xSWg==
X-Received: by 2002:a05:620a:13e2:: with SMTP id h2mr17102254qkl.495.1612193923906;
        Mon, 01 Feb 2021 07:38:43 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id 22sm14853307qke.123.2021.02.01.07.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 07:38:43 -0800 (PST)
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
Subject: [PATCH v9 08/14] mm/gup: do not migrate zero page
Date:   Mon,  1 Feb 2021 10:38:21 -0500
Message-Id: <20210201153827.444374-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201153827.444374-1-pasha.tatashin@soleen.com>
References: <20210201153827.444374-1-pasha.tatashin@soleen.com>
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
index db228aa8d9f7..67716df9fe1f 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1130,7 +1130,8 @@ static inline bool is_zone_movable_page(const struct page *page)
 /* MIGRATE_CMA and ZONE_MOVABLE do not allow pin pages */
 static inline bool is_pinnable_page(struct page *page)
 {
-	return !is_zone_movable_page(page) && !is_migrate_cma_page(page);
+	return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
+		is_zero_pfn(page_to_pfn(page));
 }
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 87a7f9e2d1c2..aacbed98a1ed 100644
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
index 1d3087753426..bad0f417adb3 100644
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

