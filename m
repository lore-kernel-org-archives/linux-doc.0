Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FC0C4332E
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D46164E77
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbhBXDMo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 22:12:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47084 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232412AbhBXDMm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Feb 2021 22:12:42 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.111.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr_L3wzVgo00OAA--.18095S7;
        Wed, 24 Feb 2021 11:11:58 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 5/5] docs/zh_CN: add riscv index.rst translation
Date:   Wed, 24 Feb 2021 11:11:49 +0800
Message-Id: <20210224031149.15179-6-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224031149.15179-1-siyanteng@loongson.cn>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr_L3wzVgo00OAA--.18095S7
X-Coremail-Antispam: 1UD129KBjvdXoW7JryrZr43tF1UWryDXry5urg_yoWDZFb_Cw
        n5XFWkCrW2qFn2qFZ7Ar1UJryxCFW09F18GF45t398Gw1DG34DJw1qg3s7ZF1rurWfur1F
        krs7Wryxtr9FgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb6xFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8
        Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
        vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3fHbUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/riscv/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/riscv/index.rst        | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/index.rst

diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
new file mode 100644
index 000000000000..ea360da28d38
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/index.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../riscv/index`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_riscv_index:
+
+
+===============
+RISC-V 体系结构
+===============
+
+.. toctree::
+    :maxdepth: 1
+
+    boot-image-header
+    pmu
+    patch-acceptance
+
+    features
+
+.. only::  subproject and html
+
+   目录
+   ====
+
+   * :ref:`genindex`
-- 
2.25.1

