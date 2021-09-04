Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7255C433F5
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:02:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC39360F91
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 10:02:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235973AbhIDKDM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 06:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350907AbhIDKDL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 06:03:11 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06228C061575
        for <linux-doc@vger.kernel.org>; Sat,  4 Sep 2021 03:02:09 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e7so994197plh.8
        for <linux-doc@vger.kernel.org>; Sat, 04 Sep 2021 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NPfcnPcN3A3/vZ31g4e/8HYUhbUqKy3mocrjaR0G+BE=;
        b=S1xVyZsl3SjsMLpVevsuIBftispr9wi7AhJN92vCpzJqsBdcEL12yAdfb3q60OCbpf
         vjSnR0QEEU/PkCmD9M/gMHL/IAgQGKKFgHtke0jbnkwwAF0Rnx4BD/h+E3fRPpXdj2PJ
         +GuUbpunpPp6fqlf9WNfp6LpHSPEzQR1bhl9KNd+ExnLnlYJ7kwARRaLHI6fyMofYFVi
         BpP0d9R3O8/4ZonAW6JvPZMvCambTrjJhbGFU/y1T9PY7Vgn+zCUhWW6oknDydtHcfZi
         XzxcfUqMfX/UMXnunftl+3ha2PtuM2/nRRt0xMOa8zQBIGBJMDlO4BV09qDMwwSyrppI
         7J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NPfcnPcN3A3/vZ31g4e/8HYUhbUqKy3mocrjaR0G+BE=;
        b=P02+ITbcy+XRBkDMCytVkZnQkP/1SiF61Wp4qpyO/HP75pNYdm3fmd8eBGBYzHR3mP
         z9cgLd6jG/VQjAGbcYIw0hsBEQPTgM7qCormgxFzBg/r+cfiH/a5pCKgkKXids05FPmr
         H66eINWWBmNly0wUYeTNeFOSLVdqDNfI1vdEEHLHQ1rcspz1bSCEZPZwALKdfuMNjEnU
         lwf/Fcsj9WT7SLCxamPxuWZQKnMHxJGbY4KA5Wi6ZEDY71Y/8FJ8AzBPTOBHJoecvU4P
         Kt7eQ4q/lVoEwTtd4jdQJoaZdbHyKPGkCInfP86lyVyw0jkTksk+gSktEzr/4CIQX409
         N5eA==
X-Gm-Message-State: AOAM5325XBG51gEqjL4IuJ5TADxodviysvHp4ZzwkCapviKvDtWXe8Hu
        bywamIPaY6ZUgF8ANiIPL4I=
X-Google-Smtp-Source: ABdhPJzLg7weyhfd9gxT9SomZvRqZCPJgAvyRxuHkSR0RE4XKtAFT4ywp3EwBeekeZVRHgVStzb+8g==
X-Received: by 2002:a17:90b:a4b:: with SMTP id gw11mr3484604pjb.227.1630749728570;
        Sat, 04 Sep 2021 03:02:08 -0700 (PDT)
Received: from localhost.localdomain ([107.172.82.230])
        by smtp.gmail.com with ESMTPSA id e16sm1955458pfj.90.2021.09.04.03.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 03:02:08 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v5 5/6] docs/zh_CN: add core-api boot-time-mm translation
Date:   Sat,  4 Sep 2021 18:01:03 +0800
Message-Id: <c1d26141ddbe2f3c40b0dc45f95c9013e5343cce.1630747462.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1630747462.git.siyanteng@loongson.cn>
References: <cover.1630747462.git.siyanteng@loongson.cn>
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
index 88f11c3945a0..3f8a86716ac1 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -106,6 +106,7 @@ Todolist:
    unaligned-memory-access
    mm-api
    genalloc
+   boot-time-mm
 
 Todolist:
 
@@ -114,7 +115,6 @@ Todolist:
    dma-attributes
    dma-isa-lpc
    pin_user_pages
-   boot-time-mm
    gfp_mask-from-fs-io
 
 内核调试的接口
-- 
2.27.0

