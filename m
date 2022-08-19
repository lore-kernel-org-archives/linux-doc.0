Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D22C32772
	for <linux-doc@archiver.kernel.org>; Fri, 19 Aug 2022 06:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344795AbiHSG2x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Aug 2022 02:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346215AbiHSG2v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Aug 2022 02:28:51 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D48B45754F
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 23:28:48 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxBOKaLf9iHXUEAA--.22726S5;
        Fri, 19 Aug 2022 14:28:45 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH V3 3/4] docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
Date:   Fri, 19 Aug 2022 14:28:39 +0800
Message-Id: <aad94e2a053ae021eb4d63240690b05c2f3e8dec.1660881950.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1660881950.git.zhoubinbin@loongson.cn>
References: <cover.1660881950.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOKaLf9iHXUEAA--.22726S5
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4DWr1xJrWUuryxtrW3trb_yoW8Zw45pF
        9agFyfG3WxJry7Crs3Wr17WryUJayxWa1UKa97tw1FqF1kJa40yr4qgrZIq34fGrW0vFWF
        qrsIkryDC34jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r47MxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjPku7UUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/generic-radix-tree.rst into Chinese.

Last English version used:

commit ba20ba2e3743 ("generic radix trees").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si<siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
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
index 4ae39a83aa61..c62658941aee 100644
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
    this_cpu_ops
    timekeeping
-- 
2.31.1

