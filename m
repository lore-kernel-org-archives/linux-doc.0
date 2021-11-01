Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE7AC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 07:51:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F3E860F56
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 07:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbhKAHxz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Nov 2021 03:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231309AbhKAHxw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 03:53:52 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21D7C061746
        for <linux-doc@vger.kernel.org>; Mon,  1 Nov 2021 00:51:18 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o83so23822871oif.4
        for <linux-doc@vger.kernel.org>; Mon, 01 Nov 2021 00:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o76Qnp4G3t4xeOkoyiI1FESxGZ5gcMtKMcLEfNpty10=;
        b=OgZEjWANfUhYeIK1pXv5AHHKzkS7V95yWRn2YKtWgY4rVJhiQB0c+j0M77GzM+JcyR
         cX7Vi6vAlcVFgx7Cg23STH0tdTSGKW+mNLReK/Q7dxsCiFTAnw9N+hYiZmU8vuTmcE+a
         SFTiB8zO5x/ze3m6kyREMJyZtvbXnuJgMhWQ9eAzrFozNZY7yCTJr6lLeOw+ZfqwMkF4
         M8kIEdC2o56GXP2Z/tFp6B9vax/XQC4xOSXNy00rmP5Zro2+V/wq7KdVjv992QtJ2VrA
         BOdEsRVNrUu8oY779MPZCx6VeqP9XB+zebeROtCVadiK8NMva8F4efLbL23C1UnZYVDI
         vonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o76Qnp4G3t4xeOkoyiI1FESxGZ5gcMtKMcLEfNpty10=;
        b=ideWYekAqpx5su1jRLCybVJukx6byHN+aqBlCEJMyzibhg+NThlSXPlLLToBP3nw8P
         8RMEQgbig5x76jmu9lD9Wptk8n1qrzxupbdTW2Q/8sVKvMMatJqej3tyd+QVJ0gDrWnu
         dvz+3PqMNSL6u4cOWYxjDq0ua6b87mjRfJiYlH+S4MVk3wbClBm1VXi3Zj67PEYgICqR
         3TJt8ruC/TXYsEPToSG1PXooIkhV/ZlJk7rcO6NkZW5N5JK4NAwpRTRaTAvTJvgixGTb
         mTQPhgNt4dbWLAQgoaDX9dyRLvqyr8kNQjIQG49Bi7F752aFGeG5i/k9RubNmOXjNZ5E
         LxCA==
X-Gm-Message-State: AOAM531myC/zwEJXvCN3Y1/04pyFl5vsyNtqrUR1icNe+K8aHXFtOvjB
        DlBRc3nLjtisLefQG67gf0g=
X-Google-Smtp-Source: ABdhPJz8KUveBjT4udZ7KMmm+HCVMvceZYFYcgWj6id2oxShSTo11RGHyF6FamSU56JTvXDRo8BisQ==
X-Received: by 2002:a05:6808:20a6:: with SMTP id s38mr25008969oiw.132.1635753077908;
        Mon, 01 Nov 2021 00:51:17 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id f18sm3921431otl.28.2021.11.01.00.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 00:51:15 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: [PATCH 2/2] docs/zh_CN: update sparse translation
Date:   Mon,  1 Nov 2021 15:50:22 +0800
Message-Id: <d975a715c010c7ddb26bad8377de5f18a617bd78.1635752631.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635752631.git.siyanteng@loongson.cn>
References: <cover.1635752631.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sparse documents are too outdated,let's update sparse.rst to the latest version.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/dev-tools/sparse.rst   | 103 ++++++++++--------
 1 file changed, 60 insertions(+), 43 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/sparse.rst b/Documentation/translations/zh_CN/dev-tools/sparse.rst
index 0f444b83d639..405653d156d9 100644
--- a/Documentation/translations/zh_CN/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_CN/dev-tools/sparse.rst
@@ -1,34 +1,34 @@
-﻿Chinese translated version of Documentation/dev-tools/sparse.rst
+﻿Copyright 2004 Linus Torvalds
+Copyright 2004 Pavel Machek <pavel@ucw.cz>
+Copyright 2006 Bob Copeland <me@bobcopeland.com>
 
-If you have any comment or update to the content, please contact the
-original document maintainer directly.  However, if you have a problem
-communicating in English you can also ask the Chinese maintainer for
-help.  Contact the Chinese maintainer if this translation is outdated
-or if there is a problem with the translation.
+.. include:: ../disclaimer-zh_CN.rst
 
-Chinese maintainer: Li Yang <leoyang.li@nxp.com>
----------------------------------------------------------------------
-Documentation/dev-tools/sparse.rst 的中文翻译
+:Original: Documentation/dev-tools/sparse.rst
 
-如果想评论或更新本文的内容，请直接联系原文档的维护者。如果你使用英文
-交流有困难的话，也可以向中文版维护者求助。如果本翻译更新不及时或者翻
-译存在问题，请联系中文版维护者。
+:翻译:
 
-中文版维护者： 李阳  Li Yang <leoyang.li@nxp.com>
-中文版翻译者： 李阳  Li Yang <leoyang.li@nxp.com>
+ Li Yang <leoyang.li@nxp.com>
 
+:校译:
 
-以下为正文
----------------------------------------------------------------------
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
 
-Copyright 2004 Linus Torvalds
-Copyright 2004 Pavel Machek <pavel@ucw.cz>
-Copyright 2006 Bob Copeland <me@bobcopeland.com>
+.. _cn_sparse:
+
+Sparse
+======
+
+Sparse是一个C程序的语义检查器；它可以用来发现内核代码的一些潜在问题。 关
+于sparse的概述，请参见https://lwn.net/Articles/689907/；本文档包含
+一些针对内核的sparse信息。
+关于sparse的更多信息，主要是关于它的内部结构，可以在它的官方网页上找到：
+https://sparse.docs.kernel.org。
 
 使用 sparse 工具做类型检查
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-"__bitwise" 是一种类型属性，所以你应该这样使用它：
+``__bitwis`` 是一种类型属性，所以你应该这样使用它::
 
         typedef int __bitwise pm_request_t;
 
@@ -37,16 +37,16 @@ Copyright 2006 Bob Copeland <me@bobcopeland.com>
                 PM_RESUME = (__force pm_request_t) 2
         };
 
-这样会使 PM_SUSPEND 和 PM_RESUME 成为位方式(bitwise)整数（使用"__force"
-是因为 sparse 会抱怨改变位方式的类型转换，但是这里我们确实需要强制进行转
-换）。而且因为所有枚举值都使用了相同的类型，这里的"enum pm_request"也将
-会使用那个类型做为底层实现。
+这样会使PM_SUSPEND和PM_RESUME成为位方式 ``bitwise`` 整数（使用
+``__force`` 是因为sparse会抱怨改变位方式的类型转换，但是这里我们确实
+需要强制进行转换）。而且因为所有枚举值都使用了相同的类型，这里的
+``enum pm_request`` 也将会使用那个类型做为底层实现。
 
-而且使用 gcc 编译的时候，所有的 __bitwise/__force 都会消失，最后在 gcc
-看来它们只不过是普通的整数。
+而且使用gcc编译的时候，所有的 ``__bitwise`` / ``__force`` 都会消失，
+最后在gcc看来它们只不过是普通的整数。
 
-坦白来说，你并不需要使用枚举类型。上面那些实际都可以浓缩成一个特殊的"int
-__bitwise"类型。
+坦白来说，你并不需要使用枚举类型。上面那些实际都可以浓缩成一个特殊的
+``int__bitwise`` 类型。
 
 所以更简单的办法只要这样做：
 
@@ -57,35 +57,52 @@ __bitwise"类型。
 
 现在你就有了严格的类型检查所需要的所有基础架构。
 
-一个小提醒：常数整数"0"是特殊的。你可以直接把常数零当作位方式整数使用而
-不用担心 sparse 会抱怨。这是因为"bitwise"（恰如其名）是用来确保不同位方
-式类型不会被弄混（小尾模式，大尾模式，cpu尾模式，或者其他），对他们来说
-常数"0"确实是特殊的。
+一个小提醒：常数整数 ``0`` 是特殊的。你可以直接把常数零当作位方式整数使用而
+不用担心sparse会抱怨。这是因为 ``bitwise`` （恰如其名）是用来确保不同位方
+式类型不会被弄混（小尾模式，大尾模式，cpu尾模式，或者其他），对他们来说常数
+``0`` 确实 *是* 特殊的。
+
+使用sparse进行锁检查
+--------------------
+
+下面的宏对于gcc来说是未定义的，在sparse运行时定义，以使用sparse的 ``上下文``
+跟踪功能，应用于锁定。 这些注释告诉sparse什么时候有锁，以及注释的函数的进入和
+退出。
+
+__must_hold - 指定的锁在函数进入和退出时被持有。
+
+__acquires  - 指定的锁在函数退出时被持有，但在进入时不被持有。
+
+__releases  - 指定的锁在函数进入时被持有，但在退出时不被持有。
+
+如果函数在不持有锁的情况下进入和退出，在函数内部以平衡的方式获取和释放锁，则不
+需要注释。
+上面的三个注释是针对sparse否则会报告上下文不平衡的情况。
 
 获取 sparse 工具
 ~~~~~~~~~~~~~~~~
 
-你可以从 Sparse 的主页获取最新的发布版本：
+你可以从Sparse的主页获取最新的发布版本：
 
-	http://www.kernel.org/pub/linux/kernel/people/josh/sparse/
+	https://www.kernel.org/pub/software/devel/sparse/dist/
 
-或者，你也可以使用 git 克隆最新的 sparse 开发版本：
+或者，你也可以使用git克隆最新的sparse开发版本：
 
-	git://git.kernel.org/pub/scm/linux/kernel/git/josh/sparse.git
+	git://git.kernel.org/pub/scm/devel/sparse/sparse.git
 
 一旦你下载了源码，只要以普通用户身份运行：
 
 	make
 	make install
 
-它将会被自动安装到你的 ~/bin 目录下。
+如果是标准的用户，它将会被自动安装到你的~/bin目录下。
 
-使用 sparse 工具
-~~~~~~~~~~~~~~~~
+使用sparse工具
+~~~~~~~~~~~~~~
 
-用"make C=1"命令来编译内核，会对所有重新编译的 C 文件使用 sparse 工具。
-或者使用"make C=2"命令，无论文件是否被重新编译都会对其使用 sparse 工具。
+用 ``make C=1`` 命令来编译内核，会对所有重新编译的C文件使用sparse工具。
+或者使用 ``make C=2`` 命令，无论文件是否被重新编译都会对其使用sparse工具。
 如果你已经编译了内核，用后一种方式可以很快地检查整个源码树。
 
-make 的可选变量 CHECKFLAGS 可以用来向 sparse 工具传递参数。编译系统会自
-动向 sparse 工具传递 -Wbitwise 参数。
+make的可选变量CHECKFLAGS可以用来向sparse工具传递参数。编译系统会自动向
+sparse工具传递-Wbitwise参数。
-- 
2.27.0

