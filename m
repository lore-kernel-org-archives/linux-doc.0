Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BFEC433DB
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 02:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2B56230FE
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 02:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbhAGCY5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 21:24:57 -0500
Received: from mail.loongson.cn ([114.242.206.163]:59136 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726477AbhAGCY5 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 6 Jan 2021 21:24:57 -0500
Received: from localhost.localdomain (unknown [112.20.112.14])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx++SgcPZf45sAAA--.1691S3;
        Thu, 07 Jan 2021 10:24:03 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 2/2] docs/zh_CN: add Chinese booting file
Date:   Thu,  7 Jan 2021 10:23:37 +0800
Message-Id: <20210107022337.1791010-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210107022337.1791010-1-siyanteng@loongson.cn>
References: <20210107022337.1791010-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx++SgcPZf45sAAA--.1691S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1kur1kZry5tFyfWryxAFb_yoW8CrW8pF
        4S9r4fKa1kAwnF9rWrKryUGr1fuF48Cay5JFsFgw48Wrn2k3WkJr9xtryFkFyxXryIyFy2
        qFsIkrWj9w10y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAKI48JMx
        C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
        wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
        vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
        0xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
        W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbec_DUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the Chinese version of booting file

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/mips/booting.rst       | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/mips/booting.rst

diff --git a/Documentation/translations/zh_CN/mips/booting.rst b/Documentation/translations/zh_CN/mips/booting.rst
new file mode 100644
index 000000000000..3099d0fff7a6
--- /dev/null
+++ b/Documentation/translations/zh_CN/mips/booting.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :ref:`Documentation/mips/booting.rst <booting>`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_booting:
+
+BMIPS设备树引导
+------------------------
+
+  一些bootloaders只支持在内核镜像开始地址处的单一入口点。而其它
+  bootloaders将跳转到ELF的开始地址处。两种方案都支持的；因为
+  CONFIG_BOOT_RAW=y and CONFIG_NO_EXCEPT_FILL=y, 所以第一条指令
+  会立即跳转到kernel_entry()入口处执行。
+
+  与arch/arm情况(b)类似，dt感知的引导加载程序需要设置以下寄存器:
+
+         a0 : 0
+
+         a1 : 0xffffffff
+
+         a2 : RAM中指向设备树块的物理指针(在chapterII中定义)。
+              设备树可以位于前512MB物理地址空间(0x00000000 -
+              0x1fffffff)的任何位置，以64位边界对齐。
+
+  传统bootloaders不会使用这样的约定，并且它们不传入DT块。
+  在这种情况下，Linux将通过选中CONFIG_DT_*查找DTB。
+
+  以上约定只在32位系统中定义，因为目前没有任何64位的BMIPS实现。
-- 
2.27.0

