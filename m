Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5006C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 03:37:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F8732388B
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 03:37:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbhAUDc5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 22:32:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392413AbhAUBYg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:24:36 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn7+V1whgk1cIAA--.13107S4;
        Thu, 21 Jan 2021 09:23:39 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 3/3] docs: zh_CN: add iio index.rst translation
Date:   Thu, 21 Jan 2021 09:23:52 +0800
Message-Id: <20210121012352.449558-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210121012352.449558-1-siyanteng@loongson.cn>
References: <20210121012352.449558-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn7+V1whgk1cIAA--.13107S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Wry5Xw18ur13Cr13JFW8JFb_yoWfKrb_Aw
        n5XFWkCr4jyF1xtFWxAr15Xry8CFZ29Fn2kFn0y398W3yqyrZrJw1DWwn7XF18WrWa9F45
        urZ7Wrn5XrnIgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb-AFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
        0Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
        ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUc6pPUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/iio/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../translations/zh_CN/iio/index.rst          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/iio/index.rst

diff --git a/Documentation/translations/zh_CN/iio/index.rst b/Documentation/translations/zh_CN/iio/index.rst
new file mode 100644
index 000000000000..88b6ba5f233b
--- /dev/null
+++ b/Documentation/translations/zh_CN/iio/index.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../iio/index`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_iio_index:
+
+
+========
+工业 I/O
+========
+
+.. toctree::
+   :maxdepth: 1
+
+   iio_configfs
+
+   ep93xx_adc
-- 
2.27.0

