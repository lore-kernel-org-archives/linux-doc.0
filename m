Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C17C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 02:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D0A261051
	for <linux-doc@archiver.kernel.org>; Wed,  3 Nov 2021 02:47:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhKCCuG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Nov 2021 22:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhKCCuF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Nov 2021 22:50:05 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010A2C061714
        for <linux-doc@vger.kernel.org>; Tue,  2 Nov 2021 19:47:30 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id w29-20020a056830411d00b0055abaca9349so1551392ott.13
        for <linux-doc@vger.kernel.org>; Tue, 02 Nov 2021 19:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ed+Lg70MZV9Lb3YRxxvwZTHAMWTFrWLO39E/NDJo2/U=;
        b=g7GN3M5NomZprtc/Xz3ZK0Zkozo0MVvxuA/pQCSyEpfSnel+nA98udBHGn6LmBTkzC
         //d2QsUtEvdaDZ5XRpoMbX+Fv6zY5JZ9xDr8YN5Ob2LIkF6sFSqN1Q40/6pZJiqghr/N
         R3WpkSAbhFizTzH5J93dwe4/JhGIQ9cF+j8ucWyxNVaPrtCjIdO8u9R8UZGdJXXwtmrK
         nEe/R1Yk3NIQ1sdX4KOlKjsIlbmycftiqt2hI8hBDWGRReuQJwCGTO+y570R8FVOzxtf
         fzKanIDy/N/JneOqutJsVkTfWCiewdjgcUuiJfcrgHX+QvVRWJ21Oqb8pfl7Vqjfvh5g
         6yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ed+Lg70MZV9Lb3YRxxvwZTHAMWTFrWLO39E/NDJo2/U=;
        b=1t9osPwA0XGaIf7XQpQSC4l8S4IYpkBhCVqZ+3KyA1WiwlX7l6yTZIg9JgntU6i027
         zyZeQd4ZIdbTCL2xzs0bxdgV6eX24flqIOaH6qWietw+qz9N4DxPCq4uBy12fOWIURc+
         DwjLs5G6KoCpQs5H+SfOIpgtQfWeGyIJ4VP8fkU3n9n/eog2LFtrYkA0zCiHpUo5Pg2r
         Eh9IVdDSduzgg2zpbEC90CeHw4Ir8mvZA/zd/yY0cD2wxCv1/I3LLQjfDbT8vjKsltyd
         Hw88vGH7R3Qx/sralOTUi7pIfboswgARjzTsGJEWLOk02514vaEsfbBTCR/xi0m6M5h6
         lqOw==
X-Gm-Message-State: AOAM533y53aEwq2e/t9idtN5fj3ieS8pkBMLytQaIun0vrzrl+rHCmNy
        5MhRkPmQLcSJ5lueKZCf2c0=
X-Google-Smtp-Source: ABdhPJxq3vEnEbSSCQ5lTdArINmK1uF7KgksO+XnHKLaRWZBSot7T4J0HuJrQouVGM5muo/E+5mwdw==
X-Received: by 2002:a9d:4c11:: with SMTP id l17mr3829093otf.289.1635907649356;
        Tue, 02 Nov 2021 19:47:29 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id y4sm220303ots.73.2021.11.02.19.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 19:47:28 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: [PATCH v2 2/2] docs/zh_CN: update sparse translation
Date:   Wed,  3 Nov 2021 10:46:32 +0800
Message-Id: <90fa72d4031dbc024c1582fc3e0d35febd7923a4.1635907089.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635907089.git.siyanteng@loongson.cn>
References: <cover.1635907089.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sparse documents are too outdated,let's update sparse.rst to the latest version.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/dev-tools/sparse.rst   | 63 ++++++++++++-------
 1 file changed, 40 insertions(+), 23 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/sparse.rst b/Documentation/translations/zh_CN/dev-tools/sparse.rst
index 0f444b83d639..e2df999f2967 100644
--- a/Documentation/translations/zh_CN/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_CN/dev-tools/sparse.rst
@@ -1,29 +1,29 @@
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
@@ -60,25 +60,42 @@ __bitwise"类型。
 一个小提醒：常数整数"0"是特殊的。你可以直接把常数零当作位方式整数使用而
 不用担心 sparse 会抱怨。这是因为"bitwise"（恰如其名）是用来确保不同位方
 式类型不会被弄混（小尾模式，大尾模式，cpu尾模式，或者其他），对他们来说
-常数"0"确实是特殊的。
+常数"0"确实 *是* 特殊的。
+
+使用sparse进行锁检查
+--------------------
+
+下面的宏对于 gcc 来说是未定义的，在 sparse 运行时定义，以使用sparse的“上下文”
+跟踪功能，应用于锁定。 这些注释告诉 sparse 什么时候有锁，以及注释的函数的进入和
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
 
 你可以从 Sparse 的主页获取最新的发布版本：
 
-	http://www.kernel.org/pub/linux/kernel/people/josh/sparse/
+	https://www.kernel.org/pub/software/devel/sparse/dist/
 
 或者，你也可以使用 git 克隆最新的 sparse 开发版本：
 
-	git://git.kernel.org/pub/scm/linux/kernel/git/josh/sparse.git
+	git://git.kernel.org/pub/scm/devel/sparse/sparse.git
 
 一旦你下载了源码，只要以普通用户身份运行：
 
 	make
 	make install
 
-它将会被自动安装到你的 ~/bin 目录下。
+如果是标准的用户，它将会被自动安装到你的~/bin目录下。
 
 使用 sparse 工具
 ~~~~~~~~~~~~~~~~
-- 
2.27.0

