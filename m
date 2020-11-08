Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8868FC388F9
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:15:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F37820760
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="dtAkgmRZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728661AbgKHOPS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:15:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgKHOPQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:15:16 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9868FC0613D2
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:15:16 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id s35so942180pjd.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OnGydSB89Ks+7A/rv+/g9HtnO+i1rkH3g7IQtAkMLnc=;
        b=dtAkgmRZvJyerFmLgvB020I8l7g2zfjdCP5+XPHwtRIVlzmSxGCms9ehfCCLZVR0al
         K3JEfW3a2cb5lBH7KjGzZyZrkL7hgeK/f2RD4IsS1Kj345ewDSKl0gN8nT7fWfEfkcJI
         u3b8lh2Q+kTTgqwf898OshwauP1wqeUPYm+BywQDdmDrksbRVO1bTpuqODZQMUA+Tbup
         U2492FOYkIMh79TDUAZeLqRQT+FdC0R774chbr3yXZ1IsUjGj+FrqjVTaTMu14zfZLdg
         F7nJH66mGkbImWLK0uFhhdIxQVUgjXdhbDJSAeXpHhZ5XHlHKi8MJEGRs4dxh8HBN5S5
         Qoog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OnGydSB89Ks+7A/rv+/g9HtnO+i1rkH3g7IQtAkMLnc=;
        b=QYmDn5AR0m5nJgJIy1hBH6DNHQIi1/HIhGn3ysJNHoSLe5FcYuomJXRObMq/uQj7dY
         o5UIECkQ1c9ErYMDksuXC0ETTaXIHt+KksKuNhNwBadbMLtfC2mVmGhCRA4ta5BaQgBp
         pSl23VqfPr1+sJykThkwkDetr+17NmpeQnl0sQp3QRT8oOqsUC5u8pRvhAjIwJM1DR8f
         TOHBYSLEWVJK140K5xbjXiCIarP99dsJmNlbRPgP2gUvWVqoU/KPCu0ciwkiYQYoKhEc
         sUy4XLOqXu683cbNI2xsGB0CFrVQsA1hJWoaYqok1nvLm3CO9HW7SToPZzwos1jj1LHr
         GDzg==
X-Gm-Message-State: AOAM533qf8fwkDJF/AOldNhsFzxuBpAVgmzTxhisXBYgKCmVsfNP1Ola
        m/Vbc7ieEHeQ6eRtDzrbNPAA1A==
X-Google-Smtp-Source: ABdhPJw5tONPh/PhIVeqbhhlTnTuEnWt6avZ/HRA/KkSY5X/hL2YRz93iJrM7qp1GWj08vA2LU067Q==
X-Received: by 2002:a17:90a:430b:: with SMTP id q11mr8471967pjg.129.1604844916262;
        Sun, 08 Nov 2020 06:15:16 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.15.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:15:15 -0800 (PST)
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
Subject: [PATCH v3 21/21] mm/hugetlb: Add BUILD_BUG_ON to catch invalid usage of tail struct page
Date:   Sun,  8 Nov 2020 22:11:13 +0800
Message-Id: <20201108141113.65450-22-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are only `RESERVE_VMEMMAP_SIZE / sizeof(struct page)` struct pages
can be used when CONFIG_HUGETLB_PAGE_FREE_VMEMMAP, so add a BUILD_BUG_ON
to catch this invalid usage of tail struct page.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1dd1a9cec008..66b96705597a 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3946,6 +3946,8 @@ static int __init hugetlb_init(void)
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 	BUILD_BUG_ON_NOT_POWER_OF_2(sizeof(struct page));
+	BUILD_BUG_ON(NR_USED_SUBPAGE >=
+		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 #endif
 
 	if (!hugepages_supported()) {
-- 
2.11.0

