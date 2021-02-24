Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EEDC4332B
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 558D764DFF
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhBXDMo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 22:12:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47022 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232473AbhBXDMm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Feb 2021 22:12:42 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.111.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr_L3wzVgo00OAA--.18095S5;
        Wed, 24 Feb 2021 11:11:54 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/5] docs/zh_CN: add riscv patch-acceptance.rst translation
Date:   Wed, 24 Feb 2021 11:11:47 +0800
Message-Id: <20210224031149.15179-4-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224031149.15179-1-siyanteng@loongson.cn>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr_L3wzVgo00OAA--.18095S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ur43try3ZrW7uw4kKF43Awb_yoW5JFWUpr
        ZagrySgF18A342k3WfKr18JrW8AF4rWaya9w1kA3s3tr1kArWqqFWDJ343CFyag3s5uFyj
        v34kuFy5CryUA3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-189UUUUU=
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

