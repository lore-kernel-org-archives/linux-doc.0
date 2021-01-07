Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA68FC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 02:24:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96173230FE
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 02:24:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbhAGCYX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 21:24:23 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58970 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726086AbhAGCYX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Jan 2021 21:24:23 -0500
Received: from localhost.localdomain (unknown [112.20.112.14])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx++SgcPZf45sAAA--.1691S2;
        Thu, 07 Jan 2021 10:23:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/2] docs/zh_CN: add Chinese index file
Date:   Thu,  7 Jan 2021 10:23:36 +0800
Message-Id: <20210107022337.1791010-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx++SgcPZf45sAAA--.1691S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr17CF48Jr15Zr1rCw48Zwb_yoWDZrb_Aw
        n5XFWkCr4jqF1xWFW8AF1UJryIkFW0kr12kan8tws8Gw1jyrZrJFyDX34kZF48WF43ur15
        CrWkWr1kJFnrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbzkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
        I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
        xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
        jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
        7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the Chinese version of index file

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/mips/index.rst         | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/mips/index.rst

diff --git a/Documentation/translations/zh_CN/mips/index.rst b/Documentation/translations/zh_CN/mips/index.rst
new file mode 100644
index 000000000000..2c7b836a3da5
--- /dev/null
+++ b/Documentation/translations/zh_CN/mips/index.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/mips/index.rst <index>`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_index:
+
+
+===========================
+MIPS特性文档
+===========================
+
+.. toctree::
+   :maxdepth: 2
+   :numbered:
+
+   booting
+   ingenic-tcu
+
+   features
+
+.. only::  subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.27.0

