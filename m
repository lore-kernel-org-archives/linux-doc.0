Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D9EC433EF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Feb 2022 08:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbiBLIE5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Feb 2022 03:04:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiBLIE5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Feb 2022 03:04:57 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B5D26AEA
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 00:04:51 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id s1so11004728qtw.9
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 00:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JgXhUJ0+FfY+vmg5OI7T6ZNI6JfFqIlhOnilt3/2dbg=;
        b=BkaYxBLiOtLnCTEnSPjc/2+NL4dx/mEhjgemNN7NbaRkNs6mJQ6BWf96re1uLXeHVG
         Jp2otGAhFM7CdkDKpwP7v6enYLOcS6ytlok0fG7NunIWgBAHM96hzdqNb4UACK39+mX/
         VZxAQngJtfeJ26fKGjwawhDB7jNhVftlxFchZSgT2Jj8lTit+CJx85a82o9UAS4YcK7F
         snDS14FmfQkXricH8X8D0NjUrJiVbUyYVwIvyFjYrwl+myQyqTfFtao37bgccNts1VuS
         Mq6q67i8A1Z5Er4dHlOkMJZIoA9Tzl5TuIs2wQ2rTvfREGG1c8qXYksEFrHCxCjdqb44
         sMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JgXhUJ0+FfY+vmg5OI7T6ZNI6JfFqIlhOnilt3/2dbg=;
        b=ZvzTpmvKFV3DCOCmRg/3PW+m8zqbjgBwHfEL20CWk+rneyt3KGsmekkRq2ITkR2703
         OiKBQ0ULtKS+FBZhePR8/ftb0kzCMH1Hbu1GGKww0m445YKjzQG6ZZLWxQ7iOxWTV6eH
         tttWHwTv4pt4CbxtWn/slcEfMz+XtzGsmBwmN+/vJa5QNsPRwaP06oMzBpVT+bQGHQEd
         1yUJAPl2tKGW1UKRFrSAljHy3T9FEkYVXmERyn6wQeKg5tjF2+m2Is4uqhoY5HMw8tCD
         QnydB9+ovU69MiYjwwNwXo8Fmc6CvFDcVOeMU/+XsNIbvpn1NRUsCqtT2tAyfhAs9Ksz
         3l9g==
X-Gm-Message-State: AOAM533Fo5cdC8yA0pAe0gOWDC6tL36+LXlp5SYv3FRr1jwUS9xPqkTn
        3d2NvEYU7hgm/vkmJMcMG81uFdbzC2k=
X-Google-Smtp-Source: ABdhPJzf4GU7gH7k2ZqXP1/bk4UrKHvWcFG3pQNu9Ay4vmhSEQFZmR5kc3Z2+FhQuQipervI5Xj09g==
X-Received: by 2002:a05:622a:248:: with SMTP id c8mr3656640qtx.602.1644653090282;
        Sat, 12 Feb 2022 00:04:50 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id f2sm13912248qti.61.2022.02.12.00.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 00:04:49 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: xu.xin16@zte.com.cn
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        seakeel@gmail.com, xu xin <xu.xin16@zte.com.cn>,
        Yang Yang <yang.yang29@zte.com.cn>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 3/3] zh_CN: Add translation for admin-guide/mm/index.rst
Date:   Sat, 12 Feb 2022 08:04:43 +0000
Message-Id: <20220212080443.1684868-1-xu.xin16@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220212080024.1684590-1-xu.xin16@zte.com.cn>
References: <20220212080024.1684590-1-xu.xin16@zte.com.cn>
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

