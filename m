Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3ACC48BCF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 09:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1009961249
	for <linux-doc@archiver.kernel.org>; Sat, 12 Jun 2021 09:46:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhFLJsh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Jun 2021 05:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhFLJsh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Jun 2021 05:48:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A93EFC061574
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 02:46:24 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id 11so4041128plk.12
        for <linux-doc@vger.kernel.org>; Sat, 12 Jun 2021 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cStPclh9XG3RxOFyVxsu9zTH21TiQql+7187dLUWbK8=;
        b=eUO6qTRKBADJwUvuErZZeJR8S4O44jHtqy+r5h1kUNyB7U5lcux3/vJZGSz4EC02lO
         7caZ1sMLwKh29iHmshLFiGfBTWgBDKKEjZjL3O5ByeTACbVC8GH2GUgoeg67eDlDasSR
         N0FiROzzDYmjEZB+5zshhVw9hSa+qmCcD233m++NOqgB+idXbQVGZwjP6bMNUaEkpb2W
         XRg1Nby+1RCfoKMTpIigJGUcKHGMaWhMd1hYUjUJaFdxBNuznmYHQ3/+Cqav/8LnsyOj
         DILszkKbXV/29+eg5CZ27W9r79KzqlhDBmcwEgL3FhTrZPAeNxW7QzuxWimHV8kAOXCe
         cRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cStPclh9XG3RxOFyVxsu9zTH21TiQql+7187dLUWbK8=;
        b=AQ3nOY8cRIXgC25++Nu8UIbUgokuqu5FKJeIqbTeOojw6BEBbPgFP4eCM+SFx5v6q3
         PmRpqRLlLCYvEbdFGg9276cnwhjP0s29e3Vhfps17SZecFG9qDlHf15tpbKjPz3GUROy
         8DJCr6oclEz40Y71+yADfvh6mL8QC5L838bXVk6mGZxH+bmbLwoKMiR4vgmfm6tYMkqZ
         sLNM0GgArfrWRS0yhrhMzaGFbXXRqXlApEYSG2fio6vpdFswRefrS6V2qI9AtHiOz7Oo
         dAaGI53n0dBi7GTWOcWCUJnKUzK4WpzU+qVY6T2k3awlwkB9ko0CgQBC5QkaGvMGFNx2
         nx0A==
X-Gm-Message-State: AOAM530QF3Xfw1elz62YI28cXc3SXtwCpEKGYH81EYztpTXdxa+d12sN
        D0+9GUNInfic2AbW4w9cM5l8Fw==
X-Google-Smtp-Source: ABdhPJxri4vZdp0HhrlywijdZcCZtQiBBCNKpg4WIBbifMFNu/V4m/2DPd2uuq3Hp+FCgOe5CZEYOw==
X-Received: by 2002:a17:903:3112:b029:103:6340:3195 with SMTP id w18-20020a1709033112b029010363403195mr7899387plc.29.1623491184271;
        Sat, 12 Jun 2021 02:46:24 -0700 (PDT)
Received: from localhost.tiktokd.org ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id t39sm6929557pfg.147.2021.06.12.02.46.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Jun 2021 02:46:23 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/3] mm: hugetlb: introduce CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON
Date:   Sat, 12 Jun 2021 17:45:55 +0800
Message-Id: <20210612094555.71344-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210612094555.71344-1-songmuchun@bytedance.com>
References: <20210612094555.71344-1-songmuchun@bytedance.com>
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
index 06802056f296..c540c21e26f5 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -182,7 +182,7 @@
 #define RESERVE_VMEMMAP_NR		2U
 #define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
 
-bool hugetlb_free_vmemmap_enabled;
+bool hugetlb_free_vmemmap_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON);
 
 static int __init early_hugetlb_free_vmemmap_param(char *buf)
 {
@@ -197,7 +197,9 @@ static int __init early_hugetlb_free_vmemmap_param(char *buf)
 
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

