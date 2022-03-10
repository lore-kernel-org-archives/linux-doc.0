Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C8BC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 10 Mar 2022 15:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbiCJPOU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 10:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345153AbiCJPMw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 10:12:52 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD4512E75A
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:09:08 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id o23so4933180pgk.13
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 07:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=RKZrcVAgQ22a0BbQ+MP/EjUBb7ONN0nnNt++Pjkh/Lwz2oHTqf26ZWxL81wpM46wm8
         zaLXu9CvGhqNbrqTxbs3mZ53Q3OKPhMd9mK20jweUPsZGKiM29IlHc+v2UKmV2AMeI0Y
         MwZ+dMOLwV4OTGMlI7OADSdEWcKeRGiH5n6ChPh9jI7mMFKfC3ss/GusJmjdMI8R3arY
         H0UrXbPFafxHKmvXcGYm56fX0Id93upesV0+vFXf1QntMN3PwMryn53MO4KnJWCLH2I2
         KJSIFhwaguoIWCBpBdgjH/tSoFQPuMMzJP/xDsuZFFzMaLpzqWZEBoOs1Eem+hgAXO2T
         5Dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SrV93xWfLu0UNUPk3Bumh1VEX1ogNKFvGYKJgh7I9Ds=;
        b=b0RntPFwh3+ckzN0sGFh2hMCyTEvOP82GgonF2mEV4K4evfh7E8JTkLCDsSfqolvmE
         KwUaCKYpThX2iV1JkBUubfCtgtwK33EVvyLUSprxA00J/Vm/2rFN0v52bGnenz6dgaKO
         y9YWtfQZaQ/6JCPZKHePPhdo7a0lt7iE7VEwV6xigRUwx9EsoavIpIxI5AsVse5X3831
         qwnwiQ41DLpnHUhefbQoL1VKj548rxRB2J3BQf8m4191ZelmmV2fHlJdIOOm3s0CUlAx
         nRaNrjdSfPkligD+4DFuT61KwcO1G3Lq+zoIuo73D+bvKaq9dkuF2g+GG3e4dt/e82G7
         v+DQ==
X-Gm-Message-State: AOAM532xVvc6kNIWsHNdU2f6Swatn2s5SAvfwqXVpVGgH5YFtM+PLyjo
        5taZRgQRBn+W8U5Ipol1qu8=
X-Google-Smtp-Source: ABdhPJzmEHEh8nDS+muc2ZtGVYl6O67yxk6rwXTCWnx36DmDUKYLsSBxI4QRdFi0FDrzKch9ZiWRkw==
X-Received: by 2002:a63:1d59:0:b0:380:6a04:89da with SMTP id d25-20020a631d59000000b003806a0489damr4373566pgm.9.1646924948322;
        Thu, 10 Mar 2022 07:09:08 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id p16-20020a056a000b5000b004f756b6c315sm7149869pfo.66.2022.03.10.07.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 07:09:08 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     xu xin <xu.xin16@zte.com.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v7 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Thu, 10 Mar 2022 23:10:13 +0800
Message-Id: <2d695dac05efc012b99fbc7525be65a421c7de03.1646899056.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646899056.git.siyanteng@loongson.cn>
References: <cover.1646899056.git.siyanteng@loongson.cn>
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

