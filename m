Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C501FC433E6
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 10:03:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F9AC2368A
	for <linux-doc@archiver.kernel.org>; Fri,  8 Jan 2021 10:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728301AbhAHKDC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Jan 2021 05:03:02 -0500
Received: from mail.loongson.cn ([114.242.206.163]:42802 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728146AbhAHKDC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 8 Jan 2021 05:03:02 -0500
Received: from localhost.localdomain (unknown [112.3.198.81])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax9bykLfhfYy4BAA--.62S2;
        Fri, 08 Jan 2021 18:02:14 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 1/4] doc/zh_CN: add mips booting.rst translation
Date:   Fri,  8 Jan 2021 18:02:18 +0800
Message-Id: <20210108100221.1370763-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax9bykLfhfYy4BAA--.62S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWfCr1fZFW3AFy3Kw1fCrg_yoW8CF43pF
        4Ikr4fKa1kAwnF9rWrKryUGw1fuF48Gay3JF42gw48Xrn7KF1ktr9xtryFyFy8XryFkFy7
        XFsIkrWj9w10y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
        rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
        xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
        67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/mips/booting.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/mips/booting.rst       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/mips/booting.rst

diff --git a/Documentation/translations/zh_CN/mips/booting.rst b/Documentation/translations/zh_CN/mips/booting.rst
new file mode 100644
index 000000000000..3099d0fff7a6
--- /dev/null
+++ b/Documentation/translations/zh_CN/mips/booting.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/mips/booting.rst <booting>`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_booting:
+
+BMIPS设备树引导
+------------------------
+
+  一些bootloaders只支持在内核镜像开始地址处的单一入口点。而其它
+  bootloaders将跳转到ELF的开始地址处。两种方案都支持的；因为
+  CONFIG_BOOT_RAW=y and CONFIG_NO_EXCEPT_FILL=y, 所以第一条指令
+  会立即跳转到kernel_entry()入口处执行。
+
+  与arch/arm情况(b)类似，dt感知的引导加载程序需要设置以下寄存器:
+
+         a0 : 0
+
+         a1 : 0xffffffff
+
+         a2 : RAM中指向设备树块的物理指针(在chapterII中定义)。
+              设备树可以位于前512MB物理地址空间(0x00000000 -
+              0x1fffffff)的任何位置，以64位边界对齐。
+
+  传统bootloaders不会使用这样的约定，并且它们不传入DT块。
+  在这种情况下，Linux将通过选中CONFIG_DT_*查找DTB。
+
+  以上约定只在32位系统中定义，因为目前没有任何64位的BMIPS实现。
-- 
2.27.0

