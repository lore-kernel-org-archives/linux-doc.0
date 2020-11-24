Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFE1C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 612A42076B
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 09:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="tIraSHcG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731644AbgKXJ5r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 04:57:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731643AbgKXJ5q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 04:57:46 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC931C0617A6
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:57:46 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id x24so5715074pfn.6
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wHH3/jV+QgVymFROaAhyfWbEGBmLguB5hGi6rHX+6Xk=;
        b=tIraSHcGfsyLsDtWBE3f6AbmDLC7hMtycXi3qi3o3exCsJUurK5k90ln0isM5Drjro
         DB3XS0aPqP3k6MAuAEVkri+xicJsmaoBVJ6XcZdWf8bJSsOSZ+4lKenrLm+w/1Hl8vqf
         tOk3a9jGCBOgRSLz+QSj9jE2Cn6cwR3NOsMBDXeJjikoBRbZqjJTCH/zd9viZZRoNDeN
         KbNVk81Mtl72BMRuaz22/mNFA91Rf2fvN2O6zk32JPUzAltYH9HoWnvWrsY96Hb5ULYA
         mHCgOqrC+bIuwKv1R0RntDu8DmcEb0G2EVW6bSQp02sUOQyIxIFHjEe++uDDOc5ZkbBd
         YtRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wHH3/jV+QgVymFROaAhyfWbEGBmLguB5hGi6rHX+6Xk=;
        b=I73tCuVxiew7pp4bpWOj7aBUFMiJsANSBrRpf8mu0u09h347AMK6ppMxL2wRpK41Yh
         qq1gIv6JQNc4g9NpkPNXnSlHyKNSeCx+7gvwqO1CsyHCtkrRrf8FaHoPT+I+n6WQTO8Z
         0awgmaMeCQvT+TF17HM8e+tU/Fs8lUo0WtDQSryCSOACsWWbRZCDAqxmeShxtegrHiV4
         e20QCUaVmqlzx0Bjc5gRGNPJNwaF16ADh7mPF4DSeCI4dCAZDUMgEckS5zBOqrPj0rcC
         PaGHgH7UD03FxUOC5plz0ZBTDJJe20Vfhd4+uPstQedZkTvua4bh5w68anpeBXfoeANn
         4/Tw==
X-Gm-Message-State: AOAM531AqXNkHeNUXB+BeJXCcR7VD+9BIfJ/htvlCX0AjvNeJyiEQvOm
        nW6YX+to+RwKybiPNJX9bY9wAQ==
X-Google-Smtp-Source: ABdhPJysdofJSVH3w1/BPgZk3TLFnf6hemKsSPCvyi4+CmocLeKlIa0h4pckqN8WwHQ4tU+2hvxHEQ==
X-Received: by 2002:a62:2a81:0:b029:18c:310f:74fe with SMTP id q123-20020a622a810000b029018c310f74femr3356086pfq.50.1606211866326;
        Tue, 24 Nov 2020 01:57:46 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.120])
        by smtp.gmail.com with ESMTPSA id t20sm2424562pjg.25.2020.11.24.01.57.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 01:57:45 -0800 (PST)
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
Subject: [PATCH v6 06/16] mm/hugetlb: Disable freeing vmemmap if struct page size is not power of two
Date:   Tue, 24 Nov 2020 17:52:49 +0800
Message-Id: <20201124095259.58755-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201124095259.58755-1-songmuchun@bytedance.com>
References: <20201124095259.58755-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We only can free the tail vmemmap pages of HugeTLB to the buddy allocator
when the size of struct page is a power of two.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index fad760483e01..fd60cfdf3d40 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -111,6 +111,11 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	unsigned int order = huge_page_order(h);
 	unsigned int vmemmap_pages;
 
+	if (!is_power_of_2(sizeof(struct page))) {
+		pr_info("disable freeing vmemmap pages for %s\n", h->name);
+		return;
+	}
+
 	vmemmap_pages = ((1 << order) * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page and the first tail page are not to be freed to buddy
-- 
2.11.0

