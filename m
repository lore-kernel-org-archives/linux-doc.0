Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D55C43461
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:44:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FB5A2076B
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:44:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="OUdkxbex"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgIPAnz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726557AbgIONB1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:01:27 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23767C06178C
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:01:27 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id j34so1944585pgi.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xbcz6YL/V2+vBJkP0RuPn1EYocXGKAfrd+QWEMaxAUM=;
        b=OUdkxbexs/MVUGZt2ahUW/InQH4DpqpR5JJ1oBb+J1X5eZKkizEqnmv60+K7HFZrLr
         OVKqtQHYFVYnqX0kj1o45dnJG6jPv26zLnwRxJNA16fWPRitcW3BHga2oxsq2rGVELhn
         kUHn3tN214hB5Z2AeqD1vODmkiownOfNFsbYicarsbxcKNvEG6wzTJPQ+l3d47+LMXQe
         8pkzMxqwgTNfDyZGx2S3lCJND+F8hegnCnJXesFON/ZNiUGuVFHYXQ9K9zFfvp90WKi2
         HOkUQ5hJ81UyQqS1JBwNLnp46AhnNdB6TWKDGFkYdQUpabRyhyZ5eqkZBbRrgZ9JuHl5
         +ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xbcz6YL/V2+vBJkP0RuPn1EYocXGKAfrd+QWEMaxAUM=;
        b=UGyktTRhIABoH3UWx0UmD9Gj8LeWsq2DZE+emxv7/4NaMg2wrt6nRQmQQyV80VfVpi
         /eEsGw3+kj5XVvveVVYG5GzenepTptYJ6HHcZvEOsWkCYRCKb0PSRJxE8vWLJDJJpLSC
         z4mLpM/WxF7py6uIqJ+7L3r4ne89NY9Mz9el8CqlcNpXM4Wwq/9vrX90yK5TXpgJf1ak
         tvDgE8fJw4B7+Ku0x1s2AbTbMqYYJRvHq+BdMvkK/l/bHJShZVW46Q4qmu8bHYIwa4W9
         LTjCWS6StmG9Hw9QGKhhx5mqHXy0JFZ07GZKtXgJecLMp77jM2IiZDlerN8DIB48l1YA
         vTDw==
X-Gm-Message-State: AOAM5329IEoS9JEGlpW36zcMJOvDtqRbUWiEWC/dxPnzhBjFCcCJdRoD
        +GOzcWGNvl6+qzMHh2mMHG9yMQ==
X-Google-Smtp-Source: ABdhPJzenFF0hJojbFeX+YMQrctmN2BJy+iieQr74UR3tyIddb8Jks43HUjUyWDUpivgKWRty3UcRg==
X-Received: by 2002:a62:cfc5:0:b029:13e:d13d:a083 with SMTP id b188-20020a62cfc50000b029013ed13da083mr18107687pfg.26.1600174886630;
        Tue, 15 Sep 2020 06:01:26 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.01.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:01:25 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [RFC PATCH 08/24] mm/bootmem_info: Introduce {free,prepare}_vmemmap_page()
Date:   Tue, 15 Sep 2020 20:59:31 +0800
Message-Id: <20200915125947.26204-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
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

