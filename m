Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FF9C64E7A
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 06:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6EC4C223AC
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 06:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="M6IhaA17"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgKTGr3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 01:47:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbgKTGr3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 01:47:29 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08903C061A04
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 22:47:28 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id 5so4371468plj.8
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2020 22:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GD9EigNNKRkrYvbwZ0SeMCORAMhN9mHUi42wBVrQ1sc=;
        b=M6IhaA17NTPYeoH5WAYNp/+O2LM6jFTQPmYOzJTbEw9D2jVsZvJ5a/I5mYV8i81jNI
         qb9mbcwMf/JxbvZwRp7xElyiRzktBY4kKk+QQEksn2nZRl318paFEMfF6YrhcNlvXVWH
         +O1EIb0vY07XgagefcqaCPL5s0MKcQxpTp8Z5Vll5k9ntdQBNdCl3CE1r5Bkybk7yKLP
         9UWKn4hpDxJYm99a51hvyqCu9VBlvQs1bI+08VPiqkMFOm1duJurnOIzOFx2DvQ0L08K
         3Z2uzz6Nii9C0pawN8UISX6hAZLa29BPoHzdayJTN6g9TjLZKp2TAwq8IA0D66j5umdu
         KGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GD9EigNNKRkrYvbwZ0SeMCORAMhN9mHUi42wBVrQ1sc=;
        b=VTMhS2SGP3NhmrTiaj8bSCzhBOYlExfTFf/xX9o+hYx7/1GDgjrhInBO30xqD7r3l8
         YBw2f+nJY2BvlNX6MY3LoQpeH7ppXqx8eecVfJHmsRHL4uZYPOZGs2+HAw3iZJI/oBkL
         xqLjbJhjkD0HO3GF0RzDzl0bclmWSKpkb0uHdTTsInuugFngnBQGBffLdoyT4ArZwch6
         1QmNGLlL/EN9mYFMOBlmXEnSoll46YmTlNIePieBbzVfiIPa5uEBIkAIfohPyeMT5IVs
         nPNCERNYG6linI4/pMlLhP8lcdbRZZOAFL6p4aypIbxLY6OauPSvXBXC63ZLAKL8eAd0
         rvaQ==
X-Gm-Message-State: AOAM533ZvtTujL8Hg6iOaWtOkONwT99DLN4r8nNV8OJ6dJPGMPOlDSUI
        RgiwrEKw4XZUo1h2b0Wn9Xyx3g==
X-Google-Smtp-Source: ABdhPJyefP+Gp0PGH1d3/XSCN8gM3MTiZzdY/wm6TKrtmOrDyrITyhpoOVQgIKb9R9DZmvQ6/vrZCg==
X-Received: by 2002:a17:902:7d89:b029:d7:de0d:1a7f with SMTP id a9-20020a1709027d89b02900d7de0d1a7fmr12146683plm.69.1605854847604;
        Thu, 19 Nov 2020 22:47:27 -0800 (PST)
Received: from localhost.localdomain ([103.136.221.72])
        by smtp.gmail.com with ESMTPSA id 23sm2220278pfx.210.2020.11.19.22.47.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 22:47:26 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v5 08/21] mm/hugetlb: Initialize page table lock for vmemmap
Date:   Fri, 20 Nov 2020 14:43:12 +0800
Message-Id: <20201120064325.34492-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201120064325.34492-1-songmuchun@bytedance.com>
References: <20201120064325.34492-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the later patch, we will use the vmemmap page table lock to
guard the splitting of the vmemmap PMD. So initialize the vmemmap
page table lock.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ec70980000d8..bc8546df4a51 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -99,6 +99,8 @@
  */
 #define pr_fmt(fmt)	"HugeTLB Vmemmap: " fmt
 
+#include <linux/pagewalk.h>
+#include <linux/mmzone.h>
 #include <linux/list.h>
 #include <asm/pgalloc.h>
 #include "hugetlb_vmemmap.h"
@@ -208,3 +210,70 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	pr_debug("can free %d vmemmap pages for %s\n", h->nr_free_vmemmap_pages,
 		 h->name);
 }
+
+static int __init vmemmap_pud_entry(pud_t *pud, unsigned long addr,
+				    unsigned long next, struct mm_walk *walk)
+{
+	struct page *page = pud_page(*pud);
+
+	/*
+	 * The page->private shares storage with page->ptl. So make sure
+	 * that the PG_private is not set and initialize page->private to
+	 * zero.
+	 */
+	VM_BUG_ON_PAGE(PagePrivate(page), page);
+	set_page_private(page, 0);
+
+	BUG_ON(!pmd_ptlock_init(page));
+
+	return 0;
+}
+
+static void __init vmemmap_ptlock_init_section(unsigned long start_pfn)
+{
+	unsigned long section_nr;
+	struct mem_section *ms;
+	struct page *memmap, *memmap_end;
+	struct mm_struct *mm = &init_mm;
+
+	const struct mm_walk_ops ops = {
+		.pud_entry	= vmemmap_pud_entry,
+	};
+
+	section_nr = pfn_to_section_nr(start_pfn);
+	ms = __nr_to_section(section_nr);
+	memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
+	memmap_end = memmap + PAGES_PER_SECTION;
+
+	mmap_read_lock(mm);
+	BUG_ON(walk_page_range_novma(mm, (unsigned long)memmap,
+				     (unsigned long)memmap_end,
+				     &ops, NULL, NULL));
+	mmap_read_unlock(mm);
+}
+
+static void __init vmemmap_ptlock_init_node(int nid)
+{
+	unsigned long pfn, end_pfn;
+	struct pglist_data *pgdat = NODE_DATA(nid);
+
+	pfn = pgdat->node_start_pfn;
+	end_pfn = pgdat_end_pfn(pgdat);
+
+	for (; pfn < end_pfn; pfn += PAGES_PER_SECTION)
+		vmemmap_ptlock_init_section(pfn);
+}
+
+static int __init vmemmap_ptlock_init(void)
+{
+	int nid;
+
+	if (!hugepages_supported())
+		return 0;
+
+	for_each_online_node(nid)
+		vmemmap_ptlock_init_node(nid);
+
+	return 0;
+}
+core_initcall(vmemmap_ptlock_init);
-- 
2.11.0

