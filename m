Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93F9C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 03:11:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9137564DAF
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 03:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231947AbhCADLo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Feb 2021 22:11:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:52598 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231951AbhCADLm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 28 Feb 2021 22:11:42 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.111.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH_E9WzxgXRASAA--.6017S4;
        Mon, 01 Mar 2021 11:10:57 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 2/4] docs/zh_CN: add riscv patch-acceptance.rst translation
Date:   Mon,  1 Mar 2021 03:10:52 +0800
Message-Id: <20210228191054.6048-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228191054.6048-1-siyanteng@loongson.cn>
References: <20210228191054.6048-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH_E9WzxgXRASAA--.6017S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWxGw45CFWDtryDCr1rJFb_yoW5Jw4xpr
        ZagrySgF18A342kw1fKr17JrWUJF4rW3ya9ws7J3s3tr1kJr4vqFWDJ3yayFyag34ruFyU
        Z348uFyUCa47AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK6x804I0_JFv_Gryl82xGYIkIc2x262
        80x7IE14v26r15M28IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0
        c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2
        IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2
        z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I64
        8v4I1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7VUUPCztUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/riscv/patch-acceptance.rst into Chineae.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../zh_CN/riscv/patch-acceptance.rst          | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/patch-acceptance.rst

diff --git a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
new file mode 100644
index 000000000000..9fd1c8216763
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
@@ -0,0 +1,31 @@
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
+附加的提交检查单
+----------------
+我们仅接受相关标准已经被RISC-V基金会标准为“已批准”或“已冻结”的扩展或模块的补丁。
+（开发者当然可以维护自己的Linux内核树，其中包含所需代码扩展草案的代码。）
+
+此外，RISC-V规范允许爱好者创建自己的自定义扩展。这些自定义拓展不需要通过RISC-V
+基金会的任何审核或批准。为了避免将爱好者一些特别的RISC-V拓展添加进内核代码带来
+的维护复杂性和对性能的潜在影响，我们将只接受RISC-V基金会正式冻结或批准的的扩展
+补丁。（开发者当然可以维护自己的Linux内核树，其中包含他们想要的任何自定义扩展
+的代码。）
-- 
2.25.1

