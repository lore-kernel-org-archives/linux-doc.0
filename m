Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E175BC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5E5964E09
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 06:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229748AbhBVGAT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 01:00:19 -0500
Received: from mail.loongson.cn ([114.242.206.163]:44610 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229549AbhBVGAS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 01:00:18 -0500
Received: from LAPTOP-O8VTVVS6.localdomain (unknown [112.20.113.231])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxD_NESDNgDTANAA--.17646S2;
        Mon, 22 Feb 2021 13:59:33 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 0/5] docs/zh_CN:cover letter
Date:   Mon, 22 Feb 2021 13:59:25 +0800
Message-Id: <20210222055930.10454-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxD_NESDNgDTANAA--.17646S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4UCFW7CFWfAFW3GFyUJrb_yoW8GrWfpF
        1UKr1fJ3WfAr13Cw1fKr1UJF15JF4xCay5tr17Xwn3tr4DJr4Dtrn8t34DKrW7Jr18XFy5
        Xr4YkryUCr1Yyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GrWl
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUP5rcUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series of patches translates all documents in the Doc/riscv directory.

Yanteng Si(5):
docs/zh_CN:add riscv boot-image-header.rst translation
docs/zh_CN: add riscv features.rst translation
docs/zh_CN: add riscv patch-acceptance.rst translation
docs/zh_CN: add riscv pmu.rst translation
docs/zh_CN: add riscv index.rst translation

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
cumentation/translations/zh_CN/riscv/boot-image-header.rst |  67
++++++++++++++++++++++++++++++++++++++++
 Documentation/translations/zh_CN/riscv/features.rst          |  11
+++++++
 Documentation/translations/zh_CN/riscv/index.rst             |  29
++++++++++++++++++
 Documentation/translations/zh_CN/riscv/patch-acceptance.rst  |  32
++++++++++++++++++++
 Documentation/translations/zh_CN/riscv/pmu.rst               | 233
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 372 insertions(+)

diff --git a/Documentation/translations/zh_CN/riscv/boot-image-header.rst b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
new file mode 100644
index 000000000000..3e9a9abb5d6f
--- /dev/null
+++ b/Documentation/translations/zh_CN/riscv/boot-image-header.rst

