Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED375C43216
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD5F96108B
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 08:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238561AbhHRIdO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 04:33:14 -0400
Received: from mail.loongson.cn ([114.242.206.163]:35762 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239012AbhHRIdN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Aug 2021 04:33:13 -0400
Received: from localhost.localdomain (unknown [112.20.110.91])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv0OYxRxhUK4xAA--.877S7;
        Wed, 18 Aug 2021 16:32:34 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 5/6] docs/zh_CN: add core-api boot-time-mm translation
Date:   Wed, 18 Aug 2021 16:32:20 +0800
Message-Id: <950ef53a971ff4b5b7d961eb7c97a31165a866ed.1629274856.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1629274856.git.siyanteng@loongson.cn>
References: <cover.1629274856.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv0OYxRxhUK4xAA--.877S7
X-Coremail-Antispam: 1UD129KBjvJXoWxCrW7XrWruF45tF1ruF45KFg_yoW5Aw1kpF
        9FgryxGan3Jay3CrWxWr1UWFn7Xayxua1DGayxJw1aqF98tF4Yyr42yry5tr97Gr92yFyr
        XF4ftrZ5CrWYvw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc2xSY4AK67AK6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x0JUfhLnUUUUU=
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
index 000000000000..db09efb83684
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

