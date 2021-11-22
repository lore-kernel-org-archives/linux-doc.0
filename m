Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6362C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238850AbhKVHot (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238838AbhKVHot (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:44:49 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09A90C061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:43 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so14560152pjb.1
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZO+BK8uh0D80ldUswIl3tJEl8VEw9GtWDk1WcHBj3fM=;
        b=HhbyBelP/foWDCP1YCkYl4PdAf62C3+eRIW9dLWX1YqQ1yCWMn1+k3S8l+HahtEfl7
         7Da0vbONQyQ7hbhI/EGkL3Q4iC+w9n6d7c8TuDrIrHIzuJXpcT1prcZ0IFL0hMTVXpAi
         sG7FKbR9xHO/HF5kbrZNbbdOQYIviHUktp69w5+0wXO2ZbaTd9oQCEZy4HK5iTZElaWJ
         nWrG1wzCmJw7XlqSVuDBFBHNQ6nrJWA46baIzLqINa6HMPc8A6wlsQUpENo2j0lalP1W
         1pzCjSyasXtVPS6D1fhL0EUD3tg/Q6h39U0BCPihxf/9jSebAnBPfpnZEv4Uo9DxIkjV
         QrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZO+BK8uh0D80ldUswIl3tJEl8VEw9GtWDk1WcHBj3fM=;
        b=xvnVSuz180VD0XinpYARChOTVq8ArwUKuhyOdPPF6nIcVFfAOMzeBurfH3cdL7qzJq
         dLftoAAJtIGb/egYG0wM/F6IOjjsE1eApFNk0NE1I51VMHtew5lS2gRKpVLlAlsnivj9
         WR3b16+oYgUeOhatUavYIvXeJahyILZyttKYJSevRLS46FrpJ6YJgNBnlb2yOTAPhiyF
         DKAW5F9Uv+v0t9W3RzlWizOGorvggsF/TXqyc4MrW/3DUW2zv5sSYO6LPC1l33nTJ5V4
         OYE431eEHdcwIDEwf9VymTMh8RIGXXTj53Y/qPt2CfBzCpgFPu+exvv0CtcsfpCkL0aV
         wT9Q==
X-Gm-Message-State: AOAM530xuJcWDGWEqX3y9hj1amBhoqKS+n9iYzhzoqoqne1RZ3gu1BTM
        ao6FukRLAMzJaMhc8csh+QgpXs0Tw5rm1w==
X-Google-Smtp-Source: ABdhPJzdvWQPUSpPDoCYNf1VHVdwluQS/SOKKf6NezClYZvylZthnNW01MRehPMGOHgB/wO7YrH9vA==
X-Received: by 2002:a17:90b:4d09:: with SMTP id mw9mr29039988pjb.238.1637566902503;
        Sun, 21 Nov 2021 23:41:42 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id x17sm7447712pfa.209.2021.11.21.23.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:41:42 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 2/2] docs/zh_CN: update sparse translation
Date:   Mon, 22 Nov 2021 15:40:29 +0800
Message-Id: <497c334954afc0190d5531716d273925baedfff2.1637565886.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637565886.git.siyanteng@loongson.cn>
References: <cover.1637565886.git.siyanteng@loongson.cn>
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

