Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B943C43461
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 13:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 288F7613CF
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 13:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243521AbhDFNBg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 09:01:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49352 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243468AbhDFNBf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 09:01:35 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax_cifW2xg9tQEAA--.6047S3;
        Tue, 06 Apr 2021 21:01:21 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 01/11] docs/zh_CN: add core-api irq concepts.rst translation
Date:   Tue,  6 Apr 2021 21:02:00 +0800
Message-Id: <20210406130210.2725075-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210406130210.2725075-1-siyanteng@loongson.cn>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Ax_cifW2xg9tQEAA--.6047S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyrur1rurWfArW3Gr48WFg_yoW8Cw1DpF
        Z2yF93J3WfZF9xCF92kry7tryUAay8WanFkws7XF1ftr1ktr4Dtr4qkF98Z3yfWryvyFy0
        9FsakrWUur1Yyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
        Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
        0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIx
        AIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU2_M3UUUUU
        =
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/core-api/irq/concepts.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/core-api/irq/concepts.rst           | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/core-api/irq/concepts.rst

diff --git a/Documentation/translations/zh_CN/core-api/irq/concepts.rst b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
new file mode 100644
index 000000000000..b8b98a196a5d
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/irq/concepts.rst
@@ -0,0 +1,24 @@
+.. include:: ../../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../../core-api/irq/concepts`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_concepts.rst:
+
+
+===============
+什么是IRQ？
+===============
+
+一个来自设备的中断请求就是一个IRQ。
+目前，它们可以通过一个引脚或通过一个数据包进入。
+多个设备可以连接到同一个引脚，从而共享一个IRQ。
+
+IRQ编号是用来描述硬件中断源的内核标识符。通常它是一个到全局irq_desc数组的索引，
+但是除了在linux/interrupt.h中实现的之外，其它细节是体系结构特征相关的。
+
+IRQ编号是对机器上可能的中断源的枚举。通常枚举的是系统中所有中断控制器的输入引脚
+编号。在ISA（工业标准体系结构）的情况下所枚举的是两个i8259中断控制器的16个输入引脚。
+
+体系结构可以给IRQ号赋予额外的含义，在涉及到硬件手动配置的情况下，我们鼓励这样做。
+ISA IRQ是赋予这种额外含义的一个典型例子。
-- 
2.27.0

