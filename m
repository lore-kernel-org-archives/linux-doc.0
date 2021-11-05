Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267BFC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:23:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BB3A610A8
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:23:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbhKEC0V (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231833AbhKEC0U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:26:20 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC1A2C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:23:41 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u191so12338501oie.13
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZO+BK8uh0D80ldUswIl3tJEl8VEw9GtWDk1WcHBj3fM=;
        b=abm8lyoCMchn5xFAXi2vUZ1mOOrh3BNWq0pJjm32SIpSD/Lft0gHcAPk/NSuKU9Nno
         7FJXt5LW/2BK9uqUvdYTSulDdT0ew5APbSxFFWw9XWDzDkOijfRqUM84ANfFchcPvM9F
         zAAwpkDPKf+SuOwPaWL1dDZOxkh3mEBcu7LKjgppknFqQYa0NrqMD5DlqgfRTKZugT5E
         GBtfpaaD5nmgi0RMWXF+YXdioNqyL1LFT8G1eKEEAzVErfwN3x9+IqYis9Fm3RYPhJs0
         FtzWX1l7w72cyg86Jg3rS338P3tu3dhoeFbyf2wwQW27EAxBZV0fa2BMjx+VuXY7kAUO
         vz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZO+BK8uh0D80ldUswIl3tJEl8VEw9GtWDk1WcHBj3fM=;
        b=G8X6mhkCdbi/Yjjs/R/kttIiQk15MYPbmdG86XsgQ3SXa0ETUDNGLSHuL4agcZNkbm
         nY3ObH7tWUu+QOrZ2Lc/o2+wWhBFxnvGTz03+21MVyWDGkOxoD4NfACFfrKv4ZYQMHOm
         6hzUweL5hRLB8dEQpSpxZSg7mj4deA10q4Vc6sPzlxoEA+GYevUU2vK79eDz6L6ErsiA
         qpUdtdDm6IpE0bm16WG7jcd5rSG0CgGcgt3pXTK21a0FTF+wIqheIiEsu3saxM9kAQmB
         Xu8cuPchSo3fB4oyWYVa1gjc3daMtIJhSRMD72FhGW0BFMIGWQGs4Y8dd5IAyx8v/VhK
         irQg==
X-Gm-Message-State: AOAM531CPhHWvxkWVJpDbtxY9YTQDJi4MjuY0+nuyPq2/e2R1hzbzvdu
        aDDuF4RsC+4uBKqEpYD11bM=
X-Google-Smtp-Source: ABdhPJx9LotabT8iDh2OlHbqer2YQqpeD9LnRLUf7IGaLU5NAGfuvswSyARQXAZ71I8ZbMnRCQV8Fg==
X-Received: by 2002:a05:6808:199f:: with SMTP id bj31mr19698068oib.98.1636079021182;
        Thu, 04 Nov 2021 19:23:41 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id m23sm1801160oom.34.2021.11.04.19.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 19:23:40 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, src.res@email.cn, wanjiabing@vivo.com,
        bernard@vivo.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/2] docs/zh_CN: update sparse translation
Date:   Fri,  5 Nov 2021 10:22:50 +0800
Message-Id: <fe9e41a93b5ca2232e2ffe9f15de10e63122ae3b.1636078637.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1636078637.git.siyanteng@loongson.cn>
References: <cover.1636078637.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Sparse documents are too outdated,let's update sparse.rst to the latest version.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/dev-tools/sparse.rst   | 67 ++++++++++++-------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/sparse.rst b/Documentation/translations/zh_CN/dev-tools/sparse.rst
index 0f444b83d639..556282437aad 100644
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
+"__bitwise" 是一种类型属性，所以你应该这样使用它::
 
         typedef int __bitwise pm_request_t;
 
@@ -48,7 +48,7 @@ Copyright 2006 Bob Copeland <me@bobcopeland.com>
 坦白来说，你并不需要使用枚举类型。上面那些实际都可以浓缩成一个特殊的"int
 __bitwise"类型。
 
-所以更简单的办法只要这样做：
+所以更简单的办法只要这样做::
 
 	typedef int __bitwise pm_request_t;
 
@@ -60,25 +60,42 @@ __bitwise"类型。
 一个小提醒：常数整数"0"是特殊的。你可以直接把常数零当作位方式整数使用而
 不用担心 sparse 会抱怨。这是因为"bitwise"（恰如其名）是用来确保不同位方
 式类型不会被弄混（小尾模式，大尾模式，cpu尾模式，或者其他），对他们来说
-常数"0"确实是特殊的。
+常数"0"确实 **是** 特殊的。
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

