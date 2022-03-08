Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCDDC433EF
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 08:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245088AbiCHIDP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:03:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344748AbiCHIDI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:03:08 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B643EA82
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:02:12 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id 9so16352441pll.6
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=H8h5SlWzks2jdRNhUmXuy7F9ZfuM0lyTMIkPFy70BIGWId9fECycZCqSjBwnY0dJf2
         NNfLrdvrbN9RQK7+7Eaq5+MtXk+5f3Y8XQ/IxM8gIRKOJDLt1vEdaavoBE4yFqgiWCjZ
         uRUuEClJPaVkCKHY98u483FXEbw16G37HNf3jG7N23vTN88gupdt7WY0nwkAwVBcgVWw
         R4aXKHQP3QwcJATGmycbZ3uIal4fzRqH6cZYeaGH+O06bMLRZ9gTl9m83rxyXQ7L9JLv
         LmFgtrONExgqJ62Yy00uOCcsdJKfoyX/HdkR228iwwACbdZ+mXUu9KMkCrx72f4YJgl3
         a5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=ftu3Au1DrUgXbHo0Nhvu4T83m7aTwXPP1CJEI39DKGLX8XH4qMnjBLhnAAeHvwflHf
         wAM4soJyVnu9HI/GroUqq5ETAdEB0z0YYldruDxn+jCqCxeBBvvnjkVO65oaFljW0e3s
         DD/a7NMPNWgIN9Eewzf3M5upgluoSjQUvpgkRxlE0Eaw+g9sisSI+xZBSq0BJAE5VaqJ
         MAinVU3eYCzdSw541wH49FCW8Eduee3afQlmw8Y+Fx0kRT2bXWTt42F7P2f/SqSUCjNy
         rJFRDl0yfsC4mtKwwzx69XqQcaY3uej4fdSRrcwd86myxPBxIhoAHf1EDcxnoR9fRe3m
         bTOA==
X-Gm-Message-State: AOAM532hgzmH15ojAcT1VkFx3g9kSx7DqHhkrv860RAIXg+UrOzdzBbD
        NP61B1EHOEDEns043jBWv1Y=
X-Google-Smtp-Source: ABdhPJxPMxYwJHXy3mpuMmQdBETwfPxRlxOmZZnQpycEN4zE4cvZM5/kusDNgdWCZ90CKxTfizO+RQ==
X-Received: by 2002:a17:903:183:b0:151:af32:890d with SMTP id z3-20020a170903018300b00151af32890dmr16425686plg.0.1646726532076;
        Tue, 08 Mar 2022 00:02:12 -0800 (PST)
Received: from localhost.localdomain (111-250-33-204.dynamic-ip.hinet.net. [111.250.33.204])
        by smtp.gmail.com with ESMTPSA id q8-20020a056a00088800b004bca31c8e56sm19282401pfj.115.2022.03.08.00.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:02:11 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     xu xin <xu.xin16@zte.com.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Tue,  8 Mar 2022 16:03:24 +0800
Message-Id: <65924642b36b4671d913dd4b7ef76ef472cf03b4.1646723502.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646723502.git.siyanteng@loongson.cn>
References: <cover.1646723502.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

Translate Documentation/admin-guide/mm/index.rst into Chinese.
Update Documentation/admin-guide/index.rst.

Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/admin-guide/index.rst  |  2 +-
 .../zh_CN/admin-guide/mm/index.rst            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 548e57f4b3f1..763055f161dd 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -69,6 +69,7 @@ Todolist:
    lockup-watchdogs
    unicode
    sysrq
+   mm/index
 
 Todolist:
 
@@ -105,7 +106,6 @@ Todolist:
    LSM/index
    md
    media/index
-   mm/index
    module-signing
    mono
    namespaces/index
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
new file mode 100644
index 000000000000..44f66a45859d
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
@@ -0,0 +1,49 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original:   Documentation/admin-guide/mm/index.rst
+
+:翻译:
+
+  徐鑫 xu xin <xu.xin16@zte.com.cn>
+
+
+========
+内存管理
+========
+
+Linux内存管理子系统，顾名思义，是负责系统中的内存管理。它包括了虚拟内存与请求
+分页的实现，内核内部结构和用户空间程序的内存分配、将文件映射到进程地址空间以
+及许多其他很酷的事情。
+
+Linux内存管理是一个具有许多可配置设置的复杂系统, 且这些设置中的大多数都可以通
+过 ``/proc`` 文件系统获得，并且可以使用 ``sysctl`` 进行查询和调整。这些API接
+口被描述在Documentation/admin-guide/sysctl/vm.rst文件和 `man 5 proc`_ 中。
+
+.. _man 5 proc: http://man7.org/linux/man-pages/man5/proc.5.html
+
+Linux内存管理有它自己的术语，如果你还不熟悉它，请考虑阅读下面参考：
+:ref:`Documentation/admin-guide/mm/concepts.rst <mm_concepts>`.
+
+在此目录下，我们详细描述了如何与Linux内存管理中的各种机制交互。
+
+.. toctree::
+   :maxdepth: 1
+
+   ksm
+
+Todolist:
+* concepts
+* cma_debugfs
+* damon/index
+* hugetlbpage
+* idle_page_tracking
+* memory-hotplug
+* nommu-mmap
+* numa_memory_policy
+* numaperf
+* pagemap
+* soft-dirty
+* swap_numa
+* transhuge
+* userfaultfd
+* zswap
-- 
2.27.0

