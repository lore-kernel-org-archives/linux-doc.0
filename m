Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1EDC71156
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:20:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5B8E207FF
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:20:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="ZjgH0vr+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727908AbgK3PUr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:20:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgK3PUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:20:47 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB737C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:12 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id x24so10600105pfn.6
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VN22FTK/cp8gibu50+JlwycxClP9nhjODvnGGV4tug=;
        b=ZjgH0vr+7SnQsHcGa2K/AiAuo7pJtkSwgWtJ++8mJ2N5dpvx4/q685PNvhcPi2L4RH
         zFqwO9fa0PZR53uIZxgbwWomp0bb+gwW+M0LnTiAdcqN2Q4Tt2XVUs+9Dk0QZFvzzoiF
         9g4nQSo6Jyu0zrA7kF1DrDaVrzm3y6zUMZ7QVrtPujRAD+1WRi9xBGRW1rC+CFtvp2WJ
         sWszVSoUAnOMDq/t6yIZ/EewSR2lsiYjvv/3iPi30y9MJU19LbuhfIcXTphhMiKAqrg2
         D9DlSAWK4DROV+/PKZvKzx1pF3xpR1IgUoEmV05vYOLbTqAhByvCExHRdsEN2B9Jygsh
         7Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VN22FTK/cp8gibu50+JlwycxClP9nhjODvnGGV4tug=;
        b=Md2w6zKzyJG63LsniLWl9nvSg3bFJuH/PvPXyf6z7lBYbUq2fwdHiSCCa9QMIzpndJ
         5tNQVb7JHcyCDFSlRFKKmolJr14RTUtzDfhQbMLrUDRzAHqQ90Q0T+RT2G1Orwo1fUkf
         m0E4VmrwOa30BhFyIaQ+Kts3LxpZLNjGtcHFbOHM1Ir63LBG6tRTAawD5vfk5fsAKg57
         qmjaaloI9kpsvpLjgAOUkt5piF706NXUUhrc0LhVT1zOgFyifCKL7gPV7jgurNUrWag4
         xqABY/21CluKBuIn8RtFOtRNdQLpqHlIEYneCUwGnWOoRSvfgDuopfzvkWb+yH9I+X+G
         7uCg==
X-Gm-Message-State: AOAM531GACMHVQXFW+i44T3vFuUH/TWJuLUvf+2irDmJTbVqusS4WtJ9
        7+M/VVqqicZzsI/IRWmPDCG6q6IWSY9PJHbh
X-Google-Smtp-Source: ABdhPJyhD8o0jzVpPs+toSeNAsFByTmDI0pdIsUlVpAmaWm//ETZis2DFWTt1ieO0wvLlKMNFBzcgA==
X-Received: by 2002:a05:6a00:13a4:b029:18b:cfc9:1ea1 with SMTP id t36-20020a056a0013a4b029018bcfc91ea1mr19086071pfg.25.1606749612267;
        Mon, 30 Nov 2020 07:20:12 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.20.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:20:11 -0800 (PST)
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
Subject: [PATCH v7 05/15] mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
Date:   Mon, 30 Nov 2020 23:18:28 +0800
Message-Id: <20201130151838.11208-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
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
 include/linux/bootmem_info.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/bootmem_info.h b/include/linux/bootmem_info.h
index 4ed6dee1adc9..239e3cc8f86c 100644
--- a/include/linux/bootmem_info.h
+++ b/include/linux/bootmem_info.h
@@ -3,6 +3,7 @@
 #define __LINUX_BOOTMEM_INFO_H
 
 #include <linux/mmzone.h>
+#include <linux/mm.h>
 
 /*
  * Types for free bootmem stored in page->lru.next. These have to be in
@@ -22,6 +23,29 @@ void __init register_page_bootmem_info_node(struct pglist_data *pgdat);
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
+	mark_page_reserved(page);
+}
 #else
 static inline void register_page_bootmem_info_node(struct pglist_data *pgdat)
 {
-- 
2.11.0

