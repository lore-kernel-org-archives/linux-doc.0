Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1075DC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 11:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA70C23109
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 11:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729957AbhALLxZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 06:53:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:55372 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727181AbhALLxZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 12 Jan 2021 06:53:25 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx77+Fjf1fzSMDAA--.5647S5;
        Tue, 12 Jan 2021 19:52:41 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v6 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
Date:   Tue, 12 Jan 2021 19:52:59 +0800
Message-Id: <20210112115259.217944-4-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112115259.217944-1-siyanteng@loongson.cn>
References: <20210112115259.217944-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx77+Fjf1fzSMDAA--.5647S5
X-Coremail-Antispam: 1UD129KBjvJXoWxCw1rtryrWr1xJFWDJF4kCrg_yoWrAr13pF
        n7uFyfKa1xAFyayrWUGF18WF1rGr4xW3W293y8J3sIqr1Ut3WUtwn8Jr9xXFyxWr1rAFWx
        XF1I9F40k34UAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUd8n5UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/mips/ingenic-tcu.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../translations/zh_CN/mips/ingenic-tcu.rst   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/mips/ingenic-tcu.rst

diff --git a/Documentation/translations/zh_CN/mips/ingenic-tcu.rst b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
new file mode 100644
index 000000000000..72b5d409ed89
--- /dev/null
+++ b/Documentation/translations/zh_CN/mips/ingenic-tcu.rst
@@ -0,0 +1,69 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/mips/ingenic-tcu.rst <ingenic-tcu>`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_ingenic-tcu:
+
+===============================================
+君正 JZ47xx SoC定时器/计数器硬件单元
+===============================================
+
+君正 JZ47xx SoC中的定时器/计数器单元(TCU)是一个多功能硬件块。它有多达
+8个通道，可以用作计数器，计时器，或脉冲宽度调制器。
+
+- JZ4725B, JZ4750, JZ4755 只有６个TCU通道。其它SoC都有８个通道。
+
+- JZ4725B引入了一个独立的通道，称为操作系统计时器(OST)。这是一个32位可
+  编程定时器。在JZ4760B及以上型号上，它是64位的。
+
+- 每个TCU通道都有自己的时钟源，可以通过 TCSR 寄存器设置通道的父级时钟
+  源（pclk、ext、rtc）、开关以及分频。
+
+    - 看门狗和OST硬件模块在它们的寄存器空间中也有相同形式的TCSR寄存器。
+    - 用于关闭/开启的 TCU 寄存器也可以关闭/开启看门狗和 OST 时钟。
+
+- 每个TCU通道在两种模式的其中一种模式下运行：
+
+    - 模式 TCU1：通道无法在睡眠模式下运行，但更易于操作。
+    - 模式 TCU2：通道可以在睡眠模式下运行，但操作比 TCU1 通道复杂一些。
+
+- 每个 TCU 通道的模式取决于使用的SoC：
+
+    - 在最老的SoC（高于JZ4740），八个通道都运行在TCU1模式。
+    - 在 JZ4725B，通道5运行在TCU2,其它通道则运行在TCU1。
+    - 在最新的SoC（JZ4750及之后），通道1-2运行在TCU2，其它通道则运行
+      在TCU1。
+
+- 每个通道都可以生成中断。有些通道共享一条中断线，而有些没有，其在SoC型
+  号之间的变更：
+
+    - 在很老的SoC（JZ4740及更低），通道0和通道1有它们自己的中断线；通
+      道2-7共享最后一条中断线。
+    - 在 JZ4725B，通道0有它自己的中断线；通道1-5共享一条中断线；OST
+      使用最后一条中断线。
+    - 在比较新的SoC（JZ4750及以后），通道5有它自己的中断线；通
+      道0-4和（如果是8通道）6-7全部共享一条中断线；OST使用最后一条中
+      断线。
+
+实现
+====
+
+TCU硬件的功能分布在多个驱动程序：
+
+===========         =====
+时钟                drivers/clk/ingenic/tcu.c
+中断                drivers/irqchip/irq-ingenic-tcu.c
+定时器              drivers/clocksource/ingenic-timer.c
+OST                 drivers/clocksource/ingenic-ost.c
+脉冲宽度调制器      drivers/pwm/pwm-jz4740.c
+看门狗              drivers/watchdog/jz4740_wdt.c
+===========         =====
+
+因为可以从相同的寄存器控制属于不同驱动程序和框架的TCU的各种功能，所以
+所有这些驱动程序都通过相同的控制总线通用接口访问它们的寄存器。
+
+有关TCU驱动程序的设备树绑定的更多信息，请参阅:
+Documentation/devicetree/bindings/timer/ingenic,tcu.yaml.
-- 
2.27.0

