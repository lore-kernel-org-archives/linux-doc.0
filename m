Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D06C4742C
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99B7D22250
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="VXie40CJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgKMLDn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:03:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgKMLCp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:02:45 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0610C0613D1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:02:04 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id q10so7360586pfn.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VN22FTK/cp8gibu50+JlwycxClP9nhjODvnGGV4tug=;
        b=VXie40CJ/fHrNIqDxNTz1GZQ9IUwdONiHU7BNAkIY8B2uU8hpqGGZFFGMkRMjvUHxM
         bnwwM0lkwcuOxrSnvs0tEfBJS8l0MqOb+zmKW2JGLjAgfvn54whcocRtiQNLzGFVF+4D
         Hov8wnJwOFJa0AXkTfmtTsgXBJ1QGaQyNs1QqmydTXHXH/kY4VPmnLIM66LxcvsPPuRb
         auD5GVm6SIHHjS3IdC4oC/JNZznkRbWzWnUqDZfIWxBSYVSNZpsA2HQH7sCsuDtnprw6
         L+21F7cWT+Doj8Kxmr9kKjJ9dPaP6PE7rxydgtjMrWsz6e/cZglYP4WQKQm3JXnOOwbX
         6Jjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VN22FTK/cp8gibu50+JlwycxClP9nhjODvnGGV4tug=;
        b=cDBJQuHzEVdbUQ+caXqGVkFGAVgt0oAIUTKFyHYgKqvlxpDRY6QHEJodIm7t68omV7
         SrcwrLJD0luYMdW/zS5l5EMnD5YzxxLYtc2JDcVzDMrubdRKXeP4/MU/fg/4DM5aEo9v
         gpEPR5ZAo6dimqvb5otxfX/CsRE3N+UtifbyLdG+mfbB4xmf0Q7kmtBGWgZlNdlumjW7
         cugqA/Kiab0Lmb4kuxdv9QMH7jFmFxOLfqwoEZ8Ufjn5shXgxDNQPBOLJoL8ucXRS1jf
         4JZvcrIOa13UYsHmMBsZT+2CS4lJ3w+d0yTmXTQ8iF9ciWTxVkf/BmxIJ5CTFS+GqyI6
         WrCQ==
X-Gm-Message-State: AOAM532rJX9rDK4hhk6GYO1KXP8S1uSiv4NCCSK9bIPqcEMhj5uTuHDQ
        hL57/hv/YpGzrinUeAQt+y2ssw==
X-Google-Smtp-Source: ABdhPJxbg1v/KZquALQzR8zC1f8a2UHGf7V/31l5O4xTMJCYuYdRHE2ig6g4Zrdc9lqZDjdhP6lnLg==
X-Received: by 2002:aa7:970a:0:b029:18b:5773:13e6 with SMTP id a10-20020aa7970a0000b029018b577313e6mr1665133pfg.34.1605265324421;
        Fri, 13 Nov 2020 03:02:04 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.01.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:02:03 -0800 (PST)
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
Subject: [PATCH v4 06/21] mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
Date:   Fri, 13 Nov 2020 18:59:37 +0800
Message-Id: <20201113105952.11638-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
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

