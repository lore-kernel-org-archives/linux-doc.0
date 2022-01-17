Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984C9C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 04:39:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237074AbiAQEjA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Jan 2022 23:39:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiAQEi7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Jan 2022 23:38:59 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5D9BC061574
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 20:38:58 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 128so9152061pfe.12
        for <linux-doc@vger.kernel.org>; Sun, 16 Jan 2022 20:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cVspTmQiD7N10E/j9zVFtc5PSwWpl19B4kuRGHViMFg=;
        b=Hry57dgM88WbvUO4ztPiJ5ygUHdglCTxnisupCThcSPBvtAjcjLEjzwNMlYTp2j7o+
         jiAZw7ABHerwAmqgGnmWSwzZ35/5s57RE1J3iTY6bvl3W2yJgx9BmeOPWPHLYanedd2Z
         XWdOc+VSSym1/ozWPGvFgs2+8KSgfobIdnv6DS2Fn6SWWroJzgkUxX9apmavG/YQpznA
         YUxTNlnBlpMspun+G6Ubeq8cC/Ah1GOjwn8Dx6Aq+/rHrOYmtY9FioVNde4Aef9HmkIg
         XeokY94jVRvbmRd4b5JF8uDzkvJsSiTTaUlQpaAQCxQU7UXutd7x5K+sNw8kxtuZbEJf
         dyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cVspTmQiD7N10E/j9zVFtc5PSwWpl19B4kuRGHViMFg=;
        b=0TzFrWSAAkz02QVglIl21yaJHLYWgR/nnbgT3nxd3CTRfcaGt/lW0v76W12eGutZO0
         dcveF5pOhMJjVH7u2ETbLPoRngInrBt7p3ELIHxTNidQ6i/cKhmPHOrnM4TQIML+QIoQ
         Lhx8wApn/UjDwtKGmp9uwlVfTwyM0T6v7Zj5FNSrL7FWGGJhFjmWAGEQptZWBu5G6k/x
         ND58xFxwhsqt0l1/dBWnZWKXEyPz9B6L/pZsnpfe95tYlCOINQ19hZGNGA/q634faocs
         pKUS3MdsleylTXk3zIZV6BWN72zD3HSOqYFbtg4kXvQ6z8bfVx3m5ozGqnSpKjkz8l47
         55Ug==
X-Gm-Message-State: AOAM531AISJc7cQgDvy7+OK8vGIao+XN48tr6E9PjAU57JpOlSmke4PU
        jgx6grm6Dmsb84aIt3OIxY0=
X-Google-Smtp-Source: ABdhPJyjyG/aZqq8M4K+muAuKdyWLi7V9gBf3PvgrLEgo0oeSa0LY4MtaTRrCjt66V1LWwjyqYOMLg==
X-Received: by 2002:a63:8748:: with SMTP id i69mr10221868pge.253.1642394338432;
        Sun, 16 Jan 2022 20:38:58 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id p4sm12612376pfo.21.2022.01.16.20.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 20:38:58 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To:     sterlingteng@gmail.com, seakeel@gmail.com, corbet@lwn.net
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org,
        xu.xin16@zte.com.cn, cgel.zte@gmail.com,
        Yang Yang <yang.yang29@zte.com.cn>
Subject: [PATCH v2 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Mon, 17 Jan 2022 04:38:54 +0000
Message-Id: <20220117043854.861773-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220117043455.861550-1-xu.xin16@zte.com.cn>
References: <20220117043455.861550-1-xu.xin16@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: xu xin <xu.xin16@zte.com.cn>

Translate Documentation/admin-guide/mm/index.rst into Chinese.
Update Documentation/admin-guide/index.rst.

Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
Signed-off-by: xu xin <xu.xin16@zte.com.cn>
---
 .../translations/zh_CN/admin-guide/index.rst       |  2 +-
 .../translations/zh_CN/admin-guide/mm/index.rst    | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 548e57f..763055f 100644
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
index 0000000..b2c1140
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
@@ -0,0 +1,49 @@
+.. include:: ../disclaimer-zh_CN.rst
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
2.15.2

