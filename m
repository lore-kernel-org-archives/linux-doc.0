Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6075C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8D5D610C7
	for <linux-doc@archiver.kernel.org>; Fri, 17 Sep 2021 06:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbhIQGfv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Sep 2021 02:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234356AbhIQGfr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Sep 2021 02:35:47 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1C2C061574
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:25 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id v1so5501686plo.10
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 23:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=txejapVXtJX9myqkR90wEev+XhL72FNcVqaQ4LPLJ0M=;
        b=kTzlOWXG5yvEz6OOjek4dByOUEBjSLNj73zo3nzDA83YIMScWjkH6FBRgUSyoXPZ0B
         sn/ueSphKb84qqoA6CTv00fBCxWlVctTySoDcvGrBJuKqfHpX5gP286A4G3JnyvScGgM
         vRYLVvseJK+IdJ/KD+CrSwEPnkdSR/B5pnXy9ZzrgfbMaaXKL2mh45Mt5s1Gu2bFWvXb
         ZuJAN4zcBNyQrCQWkca3eYsRmb4dUiSljiaMCI+XPtj7FLclTRtBv5BtBIjY3YzjBjCB
         p6A9HF+pBOCQFzy/Q6o9bRavuhNM8egctjE0iCVzoHfAyZDONomz50kfR3+vMGH8eYpk
         JB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=txejapVXtJX9myqkR90wEev+XhL72FNcVqaQ4LPLJ0M=;
        b=HyXLNwRbEqydQ4pOl9TGEgKkX2IVzhlh0OxqMUimsa7Ji6Vww1eKIVxTC/UUyHKyFm
         /4HyC7yY5Cwr3aUyCwg18j7q1uxQ5Beu2kcolcloBFrI/tsYAYtqFMUoCVCP1S+8B+f9
         3T0Ym5YXXvoIRaUk/HcteqrK1QSvgdaMZMmoJDmuInSyz8W6u/fb7I0Sc+i2VsvNBdYa
         GpX19mvR4VeW5xEi2Vjf2SYZsdFfeAedbYPuDgMc6jF9wJKVPoJqTG5kZ5xqgPl3Hf0n
         WnLP8mc0DFm444mxJ+1Zx/dIiB+26kXgmN1lmGLM0kNIrYxiOCU23TqsbYo+gWlEDeBp
         Jo3g==
X-Gm-Message-State: AOAM530xevtu0TZpAC+2Qpa0nC1/ZGy/VuFej/2VfpOAjsRmdtdwzW0c
        jmZxRmaFx/rVMSvqZGoQoss=
X-Google-Smtp-Source: ABdhPJy2r92CYW8AIh6ULf2E5lATFuKZismst8OmdcBl8w4R54lCDdrQE56OxjkS9EK6vV3wIfQZSw==
X-Received: by 2002:a17:90b:4d8d:: with SMTP id oj13mr19229551pjb.226.1631860465502;
        Thu, 16 Sep 2021 23:34:25 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.169])
        by smtp.gmail.com with ESMTPSA id d4sm4723775pfv.21.2021.09.16.23.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 23:34:25 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v6 5/6] docs/zh_CN: add core-api boot-time-mm translation
Date:   Fri, 17 Sep 2021 14:33:06 +0800
Message-Id: <d802b8d0163db57ad326f512eaa48ea3c9e44814.1631846923.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631846923.git.siyanteng@loongson.cn>
References: <cover.1631846923.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/boot-time-mm.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst

diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
new file mode 100644
index 000000000000..9e81dbec71f8
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
@@ -0,0 +1,49 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/boot-time-mm.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮 <alexs@kernel.org>
+
+.. _cn_core-api_boot-time-mm:
+
+================
+启动时的内存管理
+================
+
+系统初始化早期“正常”的内存管理由于没有设置完毕无法使用。但是内核仍然需要
+为各种数据结构分配内存，例如物理页分配器。
+
+一个叫做 ``memblock`` 的专用分配器执行启动时的内存管理。特定架构的初始化
+必须在setup_arch()中设置它，并在mem_init()函数中移除它。
+
+一旦早期的内存管理可用，它就为内存分配提供了各种函数和宏。分配请求可以指向
+第一个（也可能是唯一的）节点或NUMA系统中的某个特定节点。有一些API变体在分
+配失败时panic，也有一些不会panic的。
+
+Memblock还提供了各种控制其自身行为的API。
+
+Memblock概述
+============
+
+该API在以下内核代码中:
+
+mm/memblock.c
+
+
+函数和结构体
+============
+
+下面是关于memblock数据结构、函数和宏的描述。其中一些实际上是内部的，但由于
+它们被记录下来，漏掉它们是很愚蠢的。此外，阅读内部函数的注释可以帮助理解引
+擎盖下真正发生的事情。
+
+该API在以下内核代码中:
+
+include/linux/memblock.h
+mm/memblock.c
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 03d1fa23ca24..fe624abf1817 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -108,6 +108,7 @@ Todolist:
    unaligned-memory-access
    mm-api
    genalloc
+   boot-time-mm
 
 Todolist:
 
@@ -116,7 +117,6 @@ Todolist:
    dma-attributes
    dma-isa-lpc
    pin_user_pages
-   boot-time-mm
    gfp_mask-from-fs-io
 
 内核调试的接口
-- 
2.27.0

