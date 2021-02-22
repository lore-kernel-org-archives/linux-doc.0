Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B39C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:00:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 912B364E13
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhBVGAY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 01:00:24 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44664 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229728AbhBVGAT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 01:00:19 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.113.231])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD_NESDNgDTANAA--.17646S5;
        Mon, 22 Feb 2021 13:59:36 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 3/5] docs/zh_CN: add riscv patch-acceptance.rst translation
Date:   Mon, 22 Feb 2021 13:59:28 +0800
Message-Id: <20210222055930.10454-4-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222055930.10454-1-siyanteng@loongson.cn>
References: <20210222055930.10454-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD_NESDNgDTANAA--.17646S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ur43try3ZrW7uw4kKF43Awb_yoW5JFWUpr
        ZagrySgF18A342k3WfKr18JrW8AF4rWaya9w1kA3s3tr1kArWqqFWDJ343CFyag3s5uFyj
        v34kuFy5CryUA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GrWl42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYtxhDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/riscv/patch-acceptance.rst into Chineae.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

