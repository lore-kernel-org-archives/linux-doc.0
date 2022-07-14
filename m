Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F652CCA482
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jul 2022 13:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239230AbiGNNGN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jul 2022 09:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239298AbiGNNGL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jul 2022 09:06:11 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2102725E1
        for <linux-doc@vger.kernel.org>; Thu, 14 Jul 2022 06:06:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9C8FNBizz8eAA--.21883S5;
        Thu, 14 Jul 2022 21:06:07 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        zhoubb.aaron@gmail.com, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 3/4] docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
Date:   Thu, 14 Jul 2022 21:06:02 +0800
Message-Id: <28c85f7c68971c650fcc9dd4ea2fbc6ba4f659a5.1657796499.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1657796498.git.zhoubinbin@loongson.cn>
References: <cover.1657796498.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxr9C8FNBizz8eAA--.21883S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uw47uF17Jr48GFy5uw1ftFb_yoW8CFWxpF
        n2gFyxG3WxAry7Crs3Wr1DWryUJayxWa15Ka97tw1FqFn5J3yFyr4qgrW3t34fGrW0vFWF
        qrsxKryDC34jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnrcfUUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/generic-radix-tree.rst into Chinese.

Last English version used:

commit ba20ba2e3743 ("generic radix trees").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../zh_CN/core-api/generic-radix-tree.rst     | 23 +++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst

diff --git a/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
new file mode 100644
index 000000000000..585c14b7634a
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/generic-radix-tree.rst
+
+:翻译:
+
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+===================
+通用基数树/稀疏数组
+===================
+
+通用基数树/稀疏数组的相关内容请见include/linux/generic-radix-tree.h文件中的
+“DOC: Generic radix trees/sparse arrays”。
+
+通用基数树函数
+--------------
+
+相关API请见以下内核文件：
+
+include/linux/generic-radix-tree.h
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 136bac5eb18c..aa376da1800e 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -45,12 +45,12 @@
    rbtree
    idr
    circular-buffers
+   generic-radix-tree
 
 Todolist:
 
 
 
-   generic-radix-tree
    packing
    this_cpu_ops
    timekeeping
-- 
2.20.1

