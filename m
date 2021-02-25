Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DCAC4332B
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 02:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8047E64EF5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 02:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhBZCmc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 21:42:32 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47076 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229566AbhBZCma (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Feb 2021 21:42:30 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.111.70])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj_PhXzhg07sPAA--.3070S6;
        Fri, 26 Feb 2021 10:41:46 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 4/4] docs/zh_CN: add riscv index.rst translation
Date:   Fri, 26 Feb 2021 02:41:36 +0800
Message-Id: <20210225184136.4526-5-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225184136.4526-1-siyanteng@loongson.cn>
References: <20210225184136.4526-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj_PhXzhg07sPAA--.3070S6
X-Coremail-Antispam: 1UD129KBjvdXoW7Jry5KryDJw1xXF4fJFWxXrb_yoWkJrg_Aw
        n5XFWkCrWjqFn7tFWkAr1UAry0kFWF9F18GF45t3s8Gw1DG34UJ34qq3s7ZF1rWrW3Zr1Y
        krs7WryxtrnFgjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbPkFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M280x2IEY4vE77IFxVWUZVW8XwA2048vs2IY020E87
        I2jVAFwI0_JF0E3s1l82xGYIkIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2
        F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjx
        v20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK
        6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4
        xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8
        JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20V
        AGYxC7MxkF7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCF
        x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
        v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
        67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI
        8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
        6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoD7aUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/riscv/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../translations/zh_CN/riscv/index.rst        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/riscv/index.rst

diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
new file mode 100644
index 000000000000..db13b1101490
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/index.rst
@@ -0,0 +1,28 @@
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
+
+.. only::  subproject and html
+
+   目录
+   ====
+
+   * :ref:`genindex`
-- 
2.25.1

