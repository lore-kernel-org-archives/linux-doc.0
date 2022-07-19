Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA1ECCA47F
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jul 2022 13:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237135AbiGSNwh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jul 2022 09:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237499AbiGSNwY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jul 2022 09:52:24 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4760D9CE10
        for <linux-doc@vger.kernel.org>; Tue, 19 Jul 2022 06:04:30 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Axn+LYq9ZiM4QoAA--.11347S5;
        Tue, 19 Jul 2022 21:04:29 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 3/4] docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
Date:   Tue, 19 Jul 2022 21:04:17 +0800
Message-Id: <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1658196777.git.zhoubinbin@loongson.cn>
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Axn+LYq9ZiM4QoAA--.11347S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uw47uF17Jr48GFy5uw1ftFb_yoW8Cw1UpF
        nagryxG3WxAry7Crs3Wr1DWryUJayxWa15Ka97tw1FqFn5Ja40yr4qgrZxt34fGrW0vayF
        qrsxKryDC34jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBa14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW5GwCF04k20x
        vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
        3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIx
        AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
        cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
        IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-ID7UUUUU=
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
index 000000000000..eacd1d2ebddc
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
+该API在以下内核代码中:
+
+include/linux/generic-radix-tree.h
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 854b923f3b30..60f76c83a9d8 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -46,12 +46,12 @@
    rbtree
    idr
    circular-buffers
+   generic-radix-tree
 
 Todolist:
 
 
 
-   generic-radix-tree
    packing
    bus-virt-phys-mapping
    this_cpu_ops
-- 
2.20.1

