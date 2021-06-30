Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64635C11F68
	for <linux-doc@archiver.kernel.org>; Wed, 30 Jun 2021 10:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EA9961407
	for <linux-doc@archiver.kernel.org>; Wed, 30 Jun 2021 10:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234217AbhF3KZO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Jun 2021 06:25:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:40730 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234210AbhF3KZO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Jun 2021 06:25:14 -0400
Received: from localhost.localdomain (unknown [112.20.109.145])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxf0PoRdxgKsUaAA--.10417S7;
        Wed, 30 Jun 2021 18:22:40 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 5/6] docs/zh_CN: add core-api boot-time-mm translation
Date:   Wed, 30 Jun 2021 18:23:27 +0800
Message-Id: <cf5acd0694a2f9ed15630a9d3f719861c6939708.1625048200.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1625048200.git.siyanteng@loongson.cn>
References: <cover.1625048200.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxf0PoRdxgKsUaAA--.10417S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW7XrWruF18WF17XF4DCFg_yoW5AFWUpF
        9F9ryfGan7Jay3urWxWr1UWFn7JayxCa1DGayxXw1aqFn8Jr4Yyr47tFy5KF97Gr92yFyr
        JF4ftrZ5CrWYvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUbPC7UUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/boot-time-mm.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst

diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
new file mode 100644
index 000000000000..12a54ca503c3
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
+
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

