Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA01C433E6
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 02:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A41564EF5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 02:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhBZCmZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 21:42:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47036 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229460AbhBZCmY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Feb 2021 21:42:24 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.111.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj_PhXzhg07sPAA--.3070S4;
        Fri, 26 Feb 2021 10:41:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/4] docs/zh_CN: add riscv patch-acceptance.rst translation
Date:   Fri, 26 Feb 2021 02:41:34 +0800
Message-Id: <20210225184136.4526-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225184136.4526-1-siyanteng@loongson.cn>
References: <20210225184136.4526-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj_PhXzhg07sPAA--.3070S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWfGw1ftw1kCrWDXr17GFg_yoW5Gr4fpr
        Zag34SgF18A342kw1fKr1UJrW8AF4rWaya9w1kJ3s3tr1kJrWqqFWDJ343CFyag3s5uFyU
        Z34kCFy5CryUA3JanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_JFv_Gryl82xGYIkIc2x262
        80x7IE14v26r15M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0
        c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2
        IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2
        z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErc
        IFxwCY1x0262kKe7AKxVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I
        3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
        WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
        wI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
        k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j
        6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU0DGOUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/riscv/patch-acceptance.rst into Chineae.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../zh_CN/riscv/patch-acceptance.rst          | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/patch-acceptance.rst

diff --git a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
new file mode 100644
index 000000000000..75446871559f
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../riscv/patch-acceptance`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_riscv_patch-acceptance:
+
+
+arch/riscv 开发者维护指南
+=========================
+
+概述
+----
+RISC-V指令集体系结构是公开开发的：
+正在进行的草案可供所有人查看和测试实现。新模块或者扩展草案可能会在开发过程中发
+生更改---有时以不兼容的方式对以前的草案进行更改。这种灵活性可能会给RISC-V Linux
+维护者带来挑战。Linux开发过程更喜欢经过良好检查和测试的代码，而不是试验代码。我
+们希望推广同样的规则到即将被内核合并的RISC-V相关代码。
+
+提交补遗清单
+-------------------------
+如果RISC-V基金会将这些模块或扩展的规范列为“冻结”或“已批准”，则我们仅接受新模块
+或扩展的补丁。 （爱好者当然可以维护自己的Linux内核树，其中包含所需代码扩展草案
+的代码。）
+
+此外，RISC-V规范允许爱好者创建自己的自定义扩展。这些自定义拓展不需要通过RISC-V
+基金会的任何审核或批准。为了避免将爱好者一些特别的RISC-V拓展添加进内核代码带来
+的维护复杂性和对性能的潜在影响，我们将只接受RISC-V基金会正式冻结或批准的的扩展
+补丁。（爱好者当然可以维护自己的Linux内核树，其中包含他们想要的任何自定义扩展
+的代码。）
-- 
2.25.1

