Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508C0C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbiCGIRa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:17:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbiCGIR3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:17:29 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076C960A89
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:16:36 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id s11so13031535pfu.13
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=BtqN1JJOIxyoanzewkrXfcfa8ZQpPjwg528QATLHrGOV2wt7Cv9VxaTwkst4Ba+Xpa
         z1+d1qgJlo4yt+TH0z0ZifBeWGo1j1SfvVo7rVEFI3bRbqzIhwH5iXVzqjpc0gDR/D3e
         FSjHcw5sNmfbGtLf3NCSI/lb1o08vMfZ46Wo/KEYAJMhwQGLtKgJ2LjraGPGhHnQOA8B
         P1FtHPUMaIG2LgNbvOCo9BzGGgM/A4lPaH5gRKiOqlcsoNV+lsJTVeC3lELO6awGcd3N
         j9sQS7jcgbKElV+YuhJuLlGiqXB2IV+lp8BnYhHXCkRUIxAaBy4q+DR4JzTT1p9SmwR+
         n/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=aJFRERj8Ng+XDzV5UwSk0XgN4qzru+1efmm1p6f7K2PoXAmBNGCm1d1r0iK+WGRLls
         BsS1ncnFgQVL6q2jA1xebAU0pZdT8AY2Y45+VkiGT7vQYSq7e0i8O46dnj5Titc8996z
         vt5T124r9YowT3J2ss1EoJUpQI0tc96p/PQsyJ3veNaPgHqzpu1SP7381QIXY0tTQVT3
         6DPXDa/i+9F5QKNOBqR28nFEuAkJ7f0w+kz4ZwZ5kMiKW6aTLAWS5mereyWLXcWgi52w
         SRONgQLHqvQH9ZW8VAAKWosc7dfWiENYAhtbuOaMJD9/G/i2cUmPvPDs8052mErNpXCJ
         AuFA==
X-Gm-Message-State: AOAM531qMflrXSgA2kzu1XawsugxbreW8taNv8Mz443mKDXJxINEKrMk
        TM4QJ7RS7emYgAJJYWSmVqM=
X-Google-Smtp-Source: ABdhPJzXebqS/ttJllhxuK+tl35Pnt9j4CEiNlEWyFrFuHpNSVo3ahx+qefH91h2eYVZO7V0kII8iw==
X-Received: by 2002:a62:1608:0:b0:4f6:f496:c678 with SMTP id 8-20020a621608000000b004f6f496c678mr5046376pfw.49.1646640995490;
        Mon, 07 Mar 2022 00:16:35 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id p34-20020a056a000a2200b004cd49fc15e5sm14940280pfh.59.2022.03.07.00.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:16:35 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     xu xin <xu.xin16@zte.com.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 5/5] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Mon,  7 Mar 2022 16:17:19 +0800
Message-Id: <166e00d325fc1355e455fb26686abce8f9fa90c0.1646640696.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646640696.git.siyanteng@loongson.cn>
References: <cover.1646640696.git.siyanteng@loongson.cn>
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

