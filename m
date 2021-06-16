Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCD4C48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 09:52:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7756610CA
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 09:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhFPJyn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 05:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbhFPJyn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 05:54:43 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6357C06175F
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 02:52:36 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id t13so1504021pgu.11
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cStPclh9XG3RxOFyVxsu9zTH21TiQql+7187dLUWbK8=;
        b=sYSNoTU43Ix6OsZTUORxb3rzT9NRRaz/6B8uMNVYNKewRmZY4telOmLIZdah47riHS
         yJFl3hoXYNc+zEC6lOIiqW2vZHa8BpPJE5qOZ5feQC9BG0wk/Xwuh7wNmb/hb/Bn8r60
         yx8xA+AXdOMesVqkl7E36Gm8pR/crs3X34YHNf6lRIt7+HRPJikEtXVR4yZRz9T6KgTT
         Q4XXbhkOKzYxQr8eKzkigqTxzChomgUAdakUWNxMt8y1Oh8+9+ljdJ+iZ3RDy9MXaWWq
         v8PglxPX9txjmUQ5woJm7ZPdOgU6m3/kJ8CfJBF4y/W1tLgxPjKDgmOQfXKy5rBEKVao
         pHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cStPclh9XG3RxOFyVxsu9zTH21TiQql+7187dLUWbK8=;
        b=T1ePSFQEw1NL04ECv8mQxTFeKI1LKdLXyBABeg48k23vo/E+MZ1GwIOa8AbdoTw+1v
         3IBtj2ZmE4FiJcwbjXXZ5BeSc6JOhkBpHKZ3uzRfvGo6fbk8Djx4JsUjPyNVvWOIAxAf
         lBSD4V/8/HWCZhK+dMaNnbc6s8oWL3OZkSSIPZwpQmRSdYMf6MhiMXIzfxnOX0oa6guw
         2gcNJOmEKSsmyDQ6NmL2hdTzzmdXdCFamOTEloOtDd6Xo44448ZeTAEWY8/5/4ny4rS1
         wAx8Jc8741Pfw3WYWC8QbEbBJxhmqOZgx/ozO11RxlYvqETl5RxrW1NspinT3LH2yhNf
         zH7w==
X-Gm-Message-State: AOAM5320oWcem7AhZ41Rv61QN3wDztpCVgf9Dozj7dTJqKlmRd/iUh/B
        oIs2KB0c0okeBWw9gFJwo/WDaw==
X-Google-Smtp-Source: ABdhPJzGmh1DPcZnjuy13NT9spKbX8eIhbJOKLSzvyG8u3OumKYilIfOiIwI+2Bl5SHqqQiGtiHlSw==
X-Received: by 2002:a62:9290:0:b029:2f7:64c4:b5f4 with SMTP id o138-20020a6292900000b02902f764c4b5f4mr8714444pfd.47.1623837156316;
        Wed, 16 Jun 2021 02:52:36 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id a20sm1744222pfk.145.2021.06.16.02.52.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Jun 2021 02:52:36 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 3/3] mm: hugetlb: introduce CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON
Date:   Wed, 16 Jun 2021 17:49:15 +0800
Message-Id: <20210616094915.34432-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210616094915.34432-1-songmuchun@bytedance.com>
References: <20210616094915.34432-1-songmuchun@bytedance.com>
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

