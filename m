Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15503C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 04:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD48022D06
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 04:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729209AbhALEZA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Jan 2021 23:25:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39084 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726488AbhALEZA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Jan 2021 23:25:00 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxdbxrJP1fzfACAA--.2569S2;
        Tue, 12 Jan 2021 12:24:11 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 2/4] doc/zh_CN: add mips booting.rst translation
Date:   Tue, 12 Jan 2021 12:24:32 +0800
Message-Id: <20210112042434.17398-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxdbxrJP1fzfACAA--.2569S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWfCr1fZFW3AFy3Kw1fCrg_yoW8CF43pF
        4Ikr4fKa1kAwnF9rWrKryUGw1fuF48Gay3JF42gw48Xrn7KF1ktr9xtryFyFy8XryFkFy7
        XFsIkrWj9w10y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8
        JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYD73DU
        UUU
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

