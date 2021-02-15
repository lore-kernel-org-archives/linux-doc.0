Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EA7CC433E6
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 132B764DEE
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231932AbhBOQVH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 11:21:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbhBOQRR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:17:17 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BEDDC0611C3
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:05 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id x14so6838839qkm.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=38wDBdME2LupaBaoyY01V6Pw/ZXOdtQ/YB6thxCvT6c=;
        b=a5+vYsvd2IfA6SFLlrkem8EeYtmqX6ARwpEfK9m5AqHki60j7f5AS5qbJKtGXG777k
         rS3Ex4AZdJamhlAKxZx4eE/il8uQMphmyQ00jFYxOTZnfVcLZffR5ZFc/h2CzMee5JXG
         LOqIhFGOtJPazR6r6k+FLMdrShIx0VFTnvL68OGnvrNLy4yVoa1ILrB2CgjULLXlh/tr
         a2zE/rFz58GK6fdRdZ8n4zBb0dl7rlliQwq9x/Jbx4xW8f+C+DjKAhF5GS9RgiDXTZLt
         JQUOvvYLCsmyScZkQk+x0WBR9kVOQn1KrJVM22LVSULFNY4ZU3uY8HBcYdXvuepmWwx9
         Znxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=38wDBdME2LupaBaoyY01V6Pw/ZXOdtQ/YB6thxCvT6c=;
        b=L+MkAyr2U5FBgNgfZ9zh+w7++Zr0xn/qsuuAs9xnwRAP0we1xCqBF+CB80qzLn6ZSv
         Q29TGujvyJX9uvC1RwpcpjGtqr3S9h4X+lWGBaCI6FQGcRau9kTwiwIKwbpdpQrlwFLa
         MRTdkiMWfhbNhD9V/WHF9kS5Z5/tB9whEuSTvf7xXYt/jaYCBlN+yAm/rhsepDjazZhh
         rshh0KsbM3UIg1P+uqwBZIh3JKTmiuDR1YUQIql/tNE3IKLLH73VLqjEtlJrq0pdx9hA
         1BjvF48/44gOp1Ybklu3jFv6VzBXcjTDY4EY9uvhrzuz3atIT1FT9ZWEjdHNu8GSYOE3
         ewSA==
X-Gm-Message-State: AOAM5329gpOP5GkBaMw3aT+eBB4YRdPiFAI/jew88EiSVjZFsvKLf3/K
        BClUiZMcYu3Fu0Yqoiq6X0oH0Q==
X-Google-Smtp-Source: ABdhPJxWdJ09keZeKYoYN0ga+vu74hTzd8SZNUWhh++aQD00fFcf8dANY1Nyi/4IUDyARNVskiqOfw==
X-Received: by 2002:a05:620a:1643:: with SMTP id c3mr15703452qko.369.1613405644373;
        Mon, 15 Feb 2021 08:14:04 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id u7sm10909213qta.75.2021.02.15.08.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:14:03 -0800 (PST)
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
Subject: [PATCH v11 08/14] mm/gup: do not migrate zero page
Date:   Mon, 15 Feb 2021 11:13:43 -0500
Message-Id: <20210215161349.246722-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210215161349.246722-1-pasha.tatashin@soleen.com>
References: <20210215161349.246722-1-pasha.tatashin@soleen.com>
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
 include/linux/mm.h      |  3 ++-
 include/linux/mmzone.h  |  4 ++++
 include/linux/pgtable.h | 12 ++++++++++++
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7f56d8d62148..3c75df55ed00 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1496,7 +1496,8 @@ static inline unsigned long page_to_section(const struct page *page)
 #ifdef CONFIG_MIGRATION
 static inline bool is_pinnable_page(struct page *page)
 {
-	return !is_zone_movable_page(page) && !is_migrate_cma_page(page);
+	return !(is_zone_movable_page(page) || is_migrate_cma_page(page)) ||
+		is_zero_pfn(page_to_pfn(page));
 }
 #else
 static inline bool is_pinnable_page(struct page *page)
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index b593316bff3d..c56f508be031 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -407,6 +407,10 @@ enum zone_type {
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
index 8fcdfa52eb4b..7c6cba3d80f0 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1115,6 +1115,7 @@ extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
 extern void untrack_pfn_moved(struct vm_area_struct *vma);
 #endif
 
+#ifdef CONFIG_MMU
 #ifdef __HAVE_COLOR_ZERO_PAGE
 static inline int is_zero_pfn(unsigned long pfn)
 {
@@ -1138,6 +1139,17 @@ static inline unsigned long my_zero_pfn(unsigned long addr)
 	return zero_pfn;
 }
 #endif
+#else
+static inline int is_zero_pfn(unsigned long pfn)
+{
+	return 0;
+}
+
+static inline unsigned long my_zero_pfn(unsigned long addr)
+{
+	return 0;
+}
+#endif /* CONFIG_MMU */
 
 #ifdef CONFIG_MMU
 
-- 
2.25.1

