Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A399BC56202
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 563102465B
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="IRRFd2yt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782107AbgJZOyM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:54:12 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38574 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782259AbgJZOyJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:54:09 -0400
Received: by mail-pl1-f196.google.com with SMTP id f21so504555plr.5
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xbcz6YL/V2+vBJkP0RuPn1EYocXGKAfrd+QWEMaxAUM=;
        b=IRRFd2yt30K7UWwAWf/Q82GX3WBnc6X+qTIICwjWofKf6vFUm6pwfwIvfi1s9bw++q
         e1P5IvW7nKfIMrhuP8P0OSFyhSvYc3xN/fomg1uJ2U0Shh6i7Yl+Im3vi2dF0PX2/7y5
         yd2hvYq8tS41R2ZnqebZtXWxfwevXqTvU9fZEzsy8sTCwNZqXm2I6IM4bYGCmgFPIzi7
         IZEKxn+mio5nqWRa1xEktiumpYz8ZDyXHYZcYJcBYStHBBUPEBdVuSZBdoF79ck4Xfxx
         3W9JNjMe2pSlbBxy5RZuUBTYigKpFpQn0PKCDfH7JLexkvHB4Dj83cQOzhBxSYP2LBZo
         mDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xbcz6YL/V2+vBJkP0RuPn1EYocXGKAfrd+QWEMaxAUM=;
        b=cMfnc7029awJk0Rp+j0750x87vWEwma/5fgkQ/PgVBQnGf+9BaUCQ2DUq/12KWjGg/
         zZ/jc1ZQNYxl2Gu9IndAWrkXdudvRvs52eqEPf7GV4ePCgqD71TVW7UcQIlLpEe+fKCk
         dUBNDmatCvoej7Id+fs80XOqkEDAOYxe1FEKh0QRjcBN7hFZXeRFY0uNW4V+9MxMgxp4
         e7EwUSEnB8Rk6wWU7dhmSiN0TZ8eqHiVjvfpKj/2PZYZ9aPx6mfVSMiuUL8/SGfD3dhm
         +smJ7QBv9RhvbPPXrb2x3gRx3ZxIZr4jt7avvVFL5bmvyE6mu9aVRuVTWXQ8ITw0w8FJ
         hoVA==
X-Gm-Message-State: AOAM532izWuq6HdEktuIPKb+piYghu1WZIsXDiBVKglIQiDtibmp6ad1
        YrNpuhBmI/X/djhX6uNg13iHaQ==
X-Google-Smtp-Source: ABdhPJwQ+NzECLBLitEBGku4AyEjgQ+G6AOMSJGIK+DdtJQb2yJulJzS0YNUQZMRraaOqw3eOC8UWg==
X-Received: by 2002:a17:90a:1b6e:: with SMTP id q101mr17226690pjq.79.1603724048581;
        Mon, 26 Oct 2020 07:54:08 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.53.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:54:08 -0700 (PDT)
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
Subject: [PATCH v2 06/19] mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
Date:   Mon, 26 Oct 2020 22:51:01 +0800
Message-Id: <20201026145114.59424-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the later patch, we can use the free_vmemmap_page() to free the
unused vmemmap pages and initialize a page for vmemmap page using
via prepare_vmemmap_page().

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/bootmem_info.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index 4ed6dee1adc9..ce9d8c97369d 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -3,6 +3,7 @@
 #define __LINUX_BOOTMEM_INFO_H
 
 #include <linux/mmzone.h>
+#include <linux/mm.h>
 
 /*
  * Types for free bootmem stored in page->lru.next. These have to be in
@@ -22,6 +23,30 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
 void get_page_bootmem(unsigned long info, struct page *page,
 		      unsigned long type);
 void put_page_bootmem(struct page *page);
+
+static inline void free_vmemmap_page(struct page *page)
+{
+	VM_WARN_ON(!PageReserved(page) || page_ref_count(page) != 2);
+
+	/* bootmem page has reserved flag in the reserve_bootmem_region */
+	if (PageReserved(page)) {
+		unsigned long magic = (unsigned long)page->freelist;
+
+		if (magic == SECTION_INFO || magic == MIX_SECTION_INFO)
+			put_page_bootmem(page);
+		else
+			WARN_ON(1);
+	}
+}
+
+static inline void prepare_vmemmap_page(struct page *page)
+{
+	unsigned long section_nr = pfn_to_section_nr(page_to_pfn(page));
+
+	get_page_bootmem(section_nr, page, SECTION_INFO);
+	__SetPageReserved(page);
+	adjust_managed_page_count(page, -1);
+}
 #else
 static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
-- 
2.20.1

