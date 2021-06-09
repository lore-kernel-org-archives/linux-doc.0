Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F90C48BCD
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:16:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1540610A5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhFIMSp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235102AbhFIMSo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 08:18:44 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31492C061574
        for <linux-doc@vger.kernel.org>; Wed,  9 Jun 2021 05:16:35 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q25so18251193pfh.7
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTl4UccQsOsZ7x/J6uEesGioaOGAN8DIKPZAiWCgVB8=;
        b=pUrg+IUIYAa870AP/uTMqgxs/hNNa64H0IDqPvy2JmAIvWBKiuXjtOLMdyse81wG8D
         WRbbR4uZgvPBXCGyhgzP/wqY9aYRqL+ZoV+55cQjs+c9cm60asG69y8qJ1wlODMfUnn2
         34cg+mlhNukSqKfoHVyTp5z8MEwHPU9o8jOMNGCVGf8c/Df94k3QiCzFxJc1ognSj0pP
         Mx0wzc+B1XWe4+wcrKEqEZ4LNxVCLVcerdQUHKwN+3ZNI7kFNrLlt1e7DzIMzfu3l9q5
         v4/W69wvh74zLdx14G8oBO5H3e/RKBvMCJN23kDW77DCFhOgIubiri/Qdiq2aEIxu2yc
         ADpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTl4UccQsOsZ7x/J6uEesGioaOGAN8DIKPZAiWCgVB8=;
        b=LYayTY97tNoEegggVfJQQSQKAq7rtzNQNyA8oElL80N+mB7tymnp4yHUCIoqZyLOGA
         ura8bJWg09HhwkE2JGHZN5lhjRU2d9gpDuCg6FhGLHS3PI3f4tbYYgXDQGzrE9PnZ9sr
         HFZTLUVkbdOW7sOUECZUXlHXd2I+r4V2mPPGTQ0FJmFNi05Z2O+M60XrqBud2dw5+5vB
         PeGw9W3zZ7WMnLcwsx8AzI6TdA7WsmzzdP0LDx9hto9pnLJLdzCV5q6dVl1HIJUqQrNK
         6DQNVrXUGqwZNNx6F+FKWqxV25BUWZ6L+j7R+a3t8r75nrw30lS/hxarLzHXxI53xlxD
         8nuA==
X-Gm-Message-State: AOAM533L1jiJOVo7DTLvt9hLN8J7dKv3XiuI7dB/0y8piL145Y9zSGgy
        +DSJ5I3WHi0lhZDOKhwU1a8W0w==
X-Google-Smtp-Source: ABdhPJy/g1DbQ4/wfWWkn6IXh4LI8nxts1Sh2nq2bT5Zi7Saxf7F7hs8/+84CR2ArxeYPuxbatrEpw==
X-Received: by 2002:aa7:8588:0:b029:28e:dfa1:e31a with SMTP id w8-20020aa785880000b029028edfa1e31amr4821652pfn.77.1623240994717;
        Wed, 09 Jun 2021 05:16:34 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id h16sm13689224pfk.119.2021.06.09.05.16.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:16:34 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 5/5] mm: hugetlb: introduce CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON
Date:   Wed,  9 Jun 2021 20:13:10 +0800
Message-Id: <20210609121310.62229-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210609121310.62229-1-songmuchun@bytedance.com>
References: <20210609121310.62229-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When using HUGETLB_PAGE_FREE_VMEMMAP, the freeing unused vmemmap pages
associated with each HugeTLB page is default off. Now the vmemmap is PMD
mapped. So there is no side effect when this feature is enabled with no
HugeTLB pages in the system. Someone may want to enable this feature in
the compiler time instead of using boot command line. So add a config to
make it default on when someone do not want to enable it via command line.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 fs/Kconfig                                      | 10 ++++++++++
 mm/hugetlb_vmemmap.c                            |  6 ++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a01aadafee38..8eee439d943c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1604,6 +1604,9 @@
 			on:  enable the feature
 			off: disable the feature
 
+			Built with CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON=y,
+			the default is on.
+
 			This is not compatible with memory_hotplug.memmap_on_memory.
 			If both parameters are enabled, hugetlb_free_vmemmap takes
 			precedence over memory_hotplug.memmap_on_memory.
diff --git a/fs/Kconfig b/fs/Kconfig
index f40b5b98f7ba..e78bc5daf7b0 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -245,6 +245,16 @@ config HUGETLB_PAGE_FREE_VMEMMAP
 	depends on X86_64
 	depends on SPARSEMEM_VMEMMAP
 
+config HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON
+	bool "Default freeing vmemmap pages of HugeTLB to on"
+	default n
+	depends on HUGETLB_PAGE_FREE_VMEMMAP
+	help
+	  When using HUGETLB_PAGE_FREE_VMEMMAP, the freeing unused vmemmap
+	  pages associated with each HugeTLB page is default off. Say Y here
+	  to enable freeing vmemmap pages of HugeTLB by default. It can then
+	  be disabled on the command line via hugetlb_free_vmemmap=off.
+
 config MEMFD_CREATE
 	def_bool TMPFS || HUGETLBFS
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 01f3652fa359..b5f4f29e042a 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -186,7 +186,7 @@
 #define RESERVE_VMEMMAP_NR		2U
 #define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
 
-bool hugetlb_free_vmemmap_enabled;
+bool hugetlb_free_vmemmap_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON);
 
 static int __init early_hugetlb_free_vmemmap_param(char *buf)
 {
@@ -201,7 +201,9 @@ static int __init early_hugetlb_free_vmemmap_param(char *buf)
 
 	if (!strcmp(buf, "on"))
 		hugetlb_free_vmemmap_enabled = true;
-	else if (strcmp(buf, "off"))
+	else if (!strcmp(buf, "off"))
+		hugetlb_free_vmemmap_enabled = false;
+	else
 		return -EINVAL;
 
 	return 0;
-- 
2.11.0

