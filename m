Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCD3C433E9
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86DED64E57
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbhBVGAZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 01:00:25 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44724 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229863AbhBVGAY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 01:00:24 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.113.231])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD_NESDNgDTANAA--.17646S7;
        Mon, 22 Feb 2021 13:59:40 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 5/5] docs/zh_CN: add riscv index.rst translation
Date:   Mon, 22 Feb 2021 13:59:30 +0800
Message-Id: <20210222055930.10454-6-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222055930.10454-1-siyanteng@loongson.cn>
References: <20210222055930.10454-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD_NESDNgDTANAA--.17646S7
X-Coremail-Antispam: 1UD129KBjvdXoW7JryrZr43tF1UWryDXry5urg_yoWDZFb_Cw
        n5XFWkCrW2qFn2qFZ7Ar1UJryxCFW09F18GF45t398Gw1DG34DJw1qg3s7ZF1rurWfur1F
        krs7Wryxtr9FgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbhkFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
        IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
        F7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr
        1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8WwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUvNtsUUUUU=
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

