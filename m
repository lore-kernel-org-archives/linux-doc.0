Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A740DC2D0F6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6612D2087D
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 00:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="LPFGIiaO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgIPAks (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 20:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgIONDq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 09:03:46 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1668C0611C0
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:03:45 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f1so1307028plo.13
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 06:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sz6P1Q0kau3GSnlYNyXI0z5mzhU/+ZiSkY10ScUrzyk=;
        b=LPFGIiaOonFtAsxKer4O1k4VDV/21wx6IGQBP/yW9jfBQCdIAz+nqS5J+q/bUqf1If
         PxixgYwuqbNpW7u/oclZ3AwhyIwiahOwnzbqvso+VW0dseDH++h8Sm68KIxO6fybwu1y
         2W2atiKWeVJ78swW8ou9DyBrzIUeFQVHFU50PO7At9ZNrwfMyZuXvXIpIKk+/K4nC3WL
         nsVRCcm1tI11TDeDMHaQf4ISI9bDV+JtqFxIFIFkFsUWbbe+DJ60tSjxcU1GcEFLVMRh
         k5Uah3dz5Cee6AHxCCYK6C3aSYmyjOsx2nAhQmWIXlDXlEQ7NgVVy7GObE49ohiQ+vmo
         h8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sz6P1Q0kau3GSnlYNyXI0z5mzhU/+ZiSkY10ScUrzyk=;
        b=AZwC8EvE6WutIIbgAeMuxY/2QpbLlHSwFc5T5phsToIo4v7HvDE6E4pIPe7KeInEiO
         qzjc9ESZs97q/rXZpTcEE27K04JEkJmr4JrirK4PkV997R6dOVBWcOpFrpa8THUaKilY
         IoSsgKqNNRX8hZ+5fUoLOSQi6f+ODftquXw1wcMC6ur2T7J+JllSi/8KfI8cu5pkKYLu
         Wfq5tzfc6m7Bo/QZpWKMkj8rxJcpglrsFzOlbnlNWCeMmXDorbsHdEjDj/cuu9t7d4FO
         jtQXHhvPb7XOxRe1ZLgT7D+bNaqw3k4Xer7hoz6xB850mvYUuRBFM9tsh1lk6xbZsUCy
         ITSw==
X-Gm-Message-State: AOAM5336Pbx8iuVHRayb8CkJRpmMBeLV0oRmONswpI1tfUagcU1fTK7Q
        IldwLuU8qFAo+9nObUhU2pHIbw==
X-Google-Smtp-Source: ABdhPJyoZylboM7Gk4ZA72/1F4sZ9fvO9eKvsVO0QDYpNOSzflVchD8LbsJYKSeiSua9Y3Pi+z1jXQ==
X-Received: by 2002:a17:90a:1f43:: with SMTP id y3mr3977140pjy.28.1600175025206;
        Tue, 15 Sep 2020 06:03:45 -0700 (PDT)
Received: from localhost.bytedance.net ([103.136.220.66])
        by smtp.gmail.com with ESMTPSA id w185sm14269855pfc.36.2020.09.15.06.03.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Sep 2020 06:03:44 -0700 (PDT)
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
Subject: [RFC PATCH 22/24] mm/hugetlb: Implement vmemmap_pmd_mkhuge macro
Date:   Tue, 15 Sep 2020 20:59:45 +0800
Message-Id: <20200915125947.26204-23-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20200915125947.26204-1-songmuchun@bytedance.com>
References: <20200915125947.26204-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In vmemmap_populate_hugepages(), we use PAGE_KERNEL_LARGE for
huge page mapping. So we can inplement vmemmap_pmd_mkhuge macro
to do that.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/include/asm/hugetlb.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/include/asm/hugetlb.h b/arch/x86/include/asm/hugetlb.h
index 7c3eb60c2198..9f9e19dd0578 100644
--- a/arch/x86/include/asm/hugetlb.h
+++ b/arch/x86/include/asm/hugetlb.h
@@ -15,6 +15,14 @@ static inline bool vmemmap_pmd_huge(pmd_t *pmd)
 {
 	return pmd_large(*pmd);
 }
+
+#define vmemmap_pmd_mkhuge vmemmap_pmd_mkhuge
+static inline pmd_t vmemmap_pmd_mkhuge(struct page *page)
+{
+	pte_t entry = pfn_pte(page_to_pfn(page), PAGE_KERNEL_LARGE);
+
+	return __pmd(pte_val(entry));
+}
 #endif
 
 #define hugepages_supported() boot_cpu_has(X86_FEATURE_PSE)
-- 
2.20.1

