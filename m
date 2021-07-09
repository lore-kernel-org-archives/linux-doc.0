Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8ACAC07E9E
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0ED76145C
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jul 2021 02:57:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhGIDAQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jul 2021 23:00:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45094 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230347AbhGIDAP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 8 Jul 2021 23:00:15 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxUOIQu+dg_xgeAA--.15063S7;
        Fri, 09 Jul 2021 10:57:27 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 5/6] docs/zh_CN: add core-api boot-time-mm translation
Date:   Fri,  9 Jul 2021 10:57:46 +0800
Message-Id: <223f4142aff4eba5ba7e4442cce77dd87591cc3a.1625795862.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1625795862.git.siyanteng@loongson.cn>
References: <cover.1625795862.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxUOIQu+dg_xgeAA--.15063S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW7XrWruF45tF1ruF45KFg_yoW5CrW7pF
        9FgryfGan7Ja43urWxWr1UWFn7JayxuanrGayxXw1aqFy5JF4Yyr47tFy5KF97Gr92yFyr
        JF4ftrWkCrWFywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl
        6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
        IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
        xan2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
        IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
        Ja73UjIFyTuYvjfUOa9-UUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/boot-time-mm.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst

diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
new file mode 100644
index 000000000000..ba20dfed1017
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
+ 时奎亮<alexs@kernel.org>
+
+.. _cn_core-api_boot-time-mm:
+
+================
+启动时的内存管理
+================
+
+系统初始化早期不能使用“正常”的内存管理，只是因为它还没有被设置好。但是仍
+然需要为各种数据结构分配内存，例如为物理页分配器分配内存。
+
+一个叫做 ``memblock`` 的专用分配器执行启动时的内存管理。特定架构的初始化
+必须在setup_arch()中设置它，并在mem_init()函数中移除它。
+
+一旦早期的内存管理可用，它就为内存分配提供了各种函数和宏。分配请求可以指向
+第一个（也可能是唯一的）节点或NUMA系统中的某个特定节点。有一些API变体在分
+配失败时panic，也有一些不panic的。
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
+下面是关于memblock数据结构、函数和宏的描述。其中一些实际上是内部（内联函数注释）
+的，但由于它们被记录下来，漏掉它们是很愚蠢的。此外，阅读内部函数的注释可以帮助理
+解引擎盖下真正发生的事情。
+
+该API在以下内核代码中:
+
+include/linux/memblock.h
+mm/memblock.c
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 1e8c5963c499..1d6fecd69c3b 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -103,6 +103,7 @@ Todolist:
    unaligned-memory-access
    mm-api
    genalloc
+   boot-time-mm
 
 Todolist:
 
@@ -111,7 +112,6 @@ Todolist:
    dma-attributes
    dma-isa-lpc
    pin_user_pages
-   boot-time-mm
    gfp_mask-from-fs-io
 
 内核调试的接口
-- 
2.27.0

