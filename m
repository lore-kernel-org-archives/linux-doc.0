Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C1C1C388F9
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1656F21D40
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="e4eqV9yh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728611AbgKHOMx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:12:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgKHOMn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:12:43 -0500
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5435C0613CF
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:12:42 -0800 (PST)
Received: by mail-pj1-x1041.google.com with SMTP id ei22so1045967pjb.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yu3H5eYwcDByY9yS9k1fn3ciqLRHmKRE4UBx/XbnYY0=;
        b=e4eqV9yhEUExSYRbWzCm21PsnGh1NEdrGDRdhhON+gDaZXLXHbsoNIT10oEewPnDC3
         KypcDjoL93yGqT97HyT/56XgfSJIO027PvlTaYhtIyFIz1jTWWuOJFKxhISAtIcJ0EJe
         ZzDYbEVVmzvoiCFzIHimXr5M8qJpM9KubOdqnRCmPAy6mb5xjAGNaYfkKexKH29qJvkl
         TXu2TvOMGTuz5MTO5p43xUqbBRf9y3qq880Bz3yhcY+KAnquSGpcfggfiefcg+xKNvJN
         oJWQNpqRsAnp6dvafg2SiyuWh1o8b1QyntftLS9TypI8e17lVR/xAncsFwrYzUvRqfn6
         WBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yu3H5eYwcDByY9yS9k1fn3ciqLRHmKRE4UBx/XbnYY0=;
        b=dlKRa8ykhsZbmIwoFgM9AH+dtWNXbqDiyIRGlHxYubVju1Ow2imbE+iVoouJ/QUu+X
         H+ehqTsyM7xQfT7J17BT+NixgRhz9HGFJYbK1xxgUMLTSTE17ZVpf8a5mz/WEsSVQXmJ
         VpuOufZeYj7JrwplUln9XB5/GeiS6vj7KsnHrfpe3do7SA7i9ujr10XNtH+5mzQmKCVx
         KrCT3lc1SkCVJ40OVSKdaPs4MF7TJUXVSoT8HWhM98vtxq8oS2iLFwsZYL7s6PMEGy18
         oMAeredQvx0BeV+cFDeROht4pw+7Sd/GEyo5ASmT054z4IkvWrDTDZqVouXCcr2MyI+J
         ShGQ==
X-Gm-Message-State: AOAM533fLYyVl22Kuh/aWWINCmHSgRWFp09m5XMtwgPgL/m47rZSa47g
        9YTxhuARpb089cgqNTAXvHMIQg==
X-Google-Smtp-Source: ABdhPJzxCPLnV3mJOn9u75dG9TeuUrTa2poVJDVNY2XGCBu5/a6Jfk4nU4IOFOx8xMTHQwQ0HIv1Ng==
X-Received: by 2002:a17:902:9347:b029:d3:b2c6:1500 with SMTP id g7-20020a1709029347b02900d3b2c61500mr9248406plp.5.1604844762246;
        Sun, 08 Nov 2020 06:12:42 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.12.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:12:41 -0800 (PST)
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
Subject: [PATCH v3 06/21] mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
Date:   Sun,  8 Nov 2020 22:10:58 +0800
Message-Id: <20201108141113.65450-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
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
2.11.0

