Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C43C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 12:18:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358986AbiD2MWA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 08:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358985AbiD2MV5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 08:21:57 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37082B7C67
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 05:18:39 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g3so6401036pgg.3
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sb7cKusP7HmwEMFLljkRCnuPfmcRLCQDQWff8XX78N4=;
        b=ujf++oGTRkcmvgbJDzD35LqcmXlDmxx9MV7JBsCDJlobs2RrJt7Oin3Tp6YJWZSb4v
         9pD3a81OGs+Rvr9bhGzIguAqbwWgBnZtv6XULJJozikDR56kziPLN1jhnHZTf/HusSzV
         w63qNhi0UKdgf6Q9Fq+cz+V4qw1+H3gfd1FB5CgYLwAD7FKIg+U2A3PKdV62na10dGaP
         uHFViPBg8CIa2xG7vAItmaI0KXTl/Td/1o3ipN73lzlFryjc/F+CyUtsT9v0X6W/1RuW
         a9MOjWqpYGACasXXh7MNQMe9KERCZSJqchBd9Dvm3EvJmQbv8dV4Tg9o5hNkY+lx9T2W
         j4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sb7cKusP7HmwEMFLljkRCnuPfmcRLCQDQWff8XX78N4=;
        b=w5iVtQwUBiOTTgr5yajT51tFkWTd5L7Xn50eoTrM5IiyuhJTAmpMnE7Xm9jzgTKLbt
         kZxEgGD+mN/+Fu7Rg+t6azMkIpPkVb4VSmYCUa69lKb+57MyB1qJKiNDsXnHmRBIgPSn
         sUivFrklBsVfD8e67G8V5aqJ0IO5bvj1D6z7L4XcXb5RfzxEDROqKKO9L3k7WIcYxcLr
         0uUvMsKnSkFHvj3D0yQt5U0sHd2NP7oWhScP/JBZTqH7hsf/yZUPaV6YjT8kB0+0BHIG
         0ODOeLrYAlEB5s2XI0B82pkCuLbO2PZEvEqZl2O1hJlw9wVjPWSClCqMf+Jn7wv30Uwe
         DlHg==
X-Gm-Message-State: AOAM530KZcSNE+K1IGBxBeywxiHaxHoDtHlhmGpffjP9ZQJbBCiXeabL
        75276S9Oh/lN6yh8+eqHPVGu3A==
X-Google-Smtp-Source: ABdhPJyV4XCJ1uaJg+Pde1nxM1j4YKLXpIc83hyQsnEeiM1URERFxVgDV1/VvFaifwpneZ3ujEuceg==
X-Received: by 2002:a63:d145:0:b0:3c1:4ba0:d890 with SMTP id c5-20020a63d145000000b003c14ba0d890mr10020401pgj.607.1651234718613;
        Fri, 29 Apr 2022 05:18:38 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id k11-20020a056a00168b00b004f7e1555538sm3101421pfc.190.2022.04.29.05.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 05:18:38 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v9 1/4] mm: hugetlb_vmemmap: disable hugetlb_optimize_vmemmap when struct page crosses page boundaries
Date:   Fri, 29 Apr 2022 20:18:13 +0800
Message-Id: <20220429121816.37541-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220429121816.37541-1-songmuchun@bytedance.com>
References: <20220429121816.37541-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of "struct page" is not the power of two but with the feature
of minimizing overhead of struct page associated with each HugeTLB is
enabled, then the vmemmap pages of HugeTLB will be corrupted after
remapping (panic is about to happen in theory).  But this only exists when
!CONFIG_MEMCG && !CONFIG_SLUB on x86_64.  However, it is not a conventional
configuration nowadays.  So it is not a real word issue, just the result
of a code review.

But we cannot prevent anyone from configuring that combined configure.
This hugetlb_optimize_vmemmap should be disable in this case to fix this
issue.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 29554c6ef2ae..6254bb2d4ae5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -28,12 +28,6 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
 static int __init hugetlb_vmemmap_early_param(char *buf)
 {
-	/* We cannot optimize if a "struct page" crosses page boundaries. */
-	if (!is_power_of_2(sizeof(struct page))) {
-		pr_warn("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
-		return 0;
-	}
-
 	if (!buf)
 		return -EINVAL;
 
@@ -119,6 +113,12 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	if (!hugetlb_optimize_vmemmap_enabled())
 		return;
 
+	if (!is_power_of_2(sizeof(struct page))) {
+		pr_warn_once("cannot optimize vmemmap pages because \"struct page\" crosses page boundaries\n");
+		static_branch_disable(&hugetlb_optimize_vmemmap_key);
+		return;
+	}
+
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page is not to be freed to buddy allocator, the other tail
-- 
2.11.0

