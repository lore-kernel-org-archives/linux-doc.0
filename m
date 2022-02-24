Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB9FC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 02:54:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiBXCzK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 21:55:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbiBXCzK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 21:55:10 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30FD23BF02
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:54:41 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o23so546176pgk.13
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 18:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8zg4BwnrrLr/puj2/HxUI35cyoPxSJTnwMIUgJ4MGF0=;
        b=Hn5VT/qpW8hqiEivcZFMo6jAdoVj700owl9zrMuI23aJPu7sfSA+O580yIxbsi/KPB
         dfyyaSRrKiYijlbFMYnkiMkOAqGXqCSocz/V2dx+yuFLSYO8svMKXWCcAZ+HadSs5KBW
         j2PT98thQweYaWnIr/gsYIU4zGY0IFOvqJYc4rn5uRE5QvwSV8mVPq5z8c8d1u//xNgi
         7PtcTYBwaaRzEDFkBn8KMinOK2qrG4zg6oOPW4N2mYMDu63usSjsVhr+h7Onz9afU/KY
         1SF4Vl2sNFQqmvovrEB6A5GHgwKl8zZbPxyKAhc1TCOyJ/71v1Y5RBcTHaQteXkDxNo+
         X3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8zg4BwnrrLr/puj2/HxUI35cyoPxSJTnwMIUgJ4MGF0=;
        b=1E4/67sYlnaTGussDGzsrquj+10E0Ruxj12pBGbzvd03z9E/zNuVuIDpcCKB5jy7bN
         z/yNzjUfLuNLMC31VAsBMAwoqvj6MTV+r1T1LO5MytNrwZuUbYbIX/dy1Be3B5AHgpTO
         bkFoVeT7I71M+IieVm4Y4I6HeqF5aFwvuKyqPC80tTI1+2TvFM4nwFCLPw2LtsJN9+bK
         22vm54QL5wvt+I1gHcqiFGbl4InIu6r0l80/YiN7CzvRnHaDybM2tkf/ngBPwWA3KMHK
         UkjWZLrR9OMtQ7GfTPaYMM/W8jHR2+wEGnL+4HVnqjd6Cihe9wp8bw3CKmGDAAsTrnm5
         3dlQ==
X-Gm-Message-State: AOAM530QTgdmbTgBPsU7Z7Hmsa7BFolwEL1jxx7+m2WWlczjycmS+W6m
        BdPCltUVQu3fpU8stjzXeQM=
X-Google-Smtp-Source: ABdhPJxjwSb46s/+z1vedkkCxIrZvWKgQtiMf9+Fot8M2lwcXr9OrJ15gn6ItsFfLO/m4kzPkFAEXw==
X-Received: by 2002:a05:6a00:1f08:b0:4c6:eb85:be8c with SMTP id be8-20020a056a001f0800b004c6eb85be8cmr786398pfb.62.1645671281147;
        Wed, 23 Feb 2022 18:54:41 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id 132sm996595pfw.21.2022.02.23.18.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 18:54:40 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     xu xin <xu.xin16@zte.com.cn>, alexs@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        seakeel@gmail.com, Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Thu, 24 Feb 2022 10:51:14 +0800
Message-Id: <a19ca1efa53bb0d92ee45b6525e73c43c8dee125.1645669457.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645669457.git.siyanteng@loongson.cn>
References: <cover.1645669457.git.siyanteng@loongson.cn>
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

