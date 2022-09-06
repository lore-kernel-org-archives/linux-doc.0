Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D420C38145
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 08:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiIFI1b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233058AbiIFI1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 04:27:30 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 067205E329
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 01:27:27 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OFpBBdjpJMSAA--.10497S5;
        Tue, 06 Sep 2022 16:27:24 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 3/5] docs/zh_CN: add dt dynamic-resolution-notes translation
Date:   Tue,  6 Sep 2022 16:26:49 +0800
Message-Id: <d8b7c06fe8fdb58cb2ec6989e09f9999aca2d8d1.1662449105.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662449105.git.siyanteng@loongson.cn>
References: <cover.1662449105.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OFpBBdjpJMSAA--.10497S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1kur1xZw1xAr1xKrW7Jwb_yoW5Xry7pF
        93uFySgF1rZ342grWIgF1UX3W3Ja4xuw47GFW8X3WFqr95Jryrtr12yFyDta43W34xCFyU
        Xa97KrWrCryjyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43MxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
        x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrw
        CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
        42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
        80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjtxhPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../devicetree/dynamic-resolution-notes.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../devicetree/dynamic-resolution-notes.rst   | 31 +++++++++++++++++++
 .../translations/zh_CN/devicetree/index.rst   |  2 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst

diff --git a/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst b/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
new file mode 100644
index 000000000000..115190341305
--- /dev/null
+++ b/Documentation/translations/zh_CN/devicetree/dynamic-resolution-notes.rst
@@ -0,0 +1,31 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/Devicetree/dynamic-resolution-notes.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========================
+Devicetree动态解析器说明
+========================
+
+本文描述了内核内DeviceTree解析器的实现，它位于drivers/of/resolver.c中。
+
+解析器如何工作？
+----------------
+
+解析器被赋予一个任意的树作为输入，该树用适当的dtc选项编译，并有一个/plugin/标签。这就产
+生了适当的__fixups__和__local_fixups__节点。
+
+解析器依次通过以下步骤工作:
+
+1. 从实时树中获取最大的设备树phandle值 + 1.
+2. 调整树的所有本地 phandles，以解决这个量。
+3. 使用 __local__fixups__ 节点信息以相同的量调整所有本地引用。
+4. 对于__fixups__节点中的每个属性，找到它在实时树中引用的节点。这是用来标记该节点的标签。
+5. 检索fixup的目标的phandle。
+6. 对于属性中的每个fixup，找到节点:属性:偏移的位置，并用phandle值替换它。
diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
index e9aff2ccc579..be5b974c6e68 100644
--- a/Documentation/translations/zh_CN/devicetree/index.rst
+++ b/Documentation/translations/zh_CN/devicetree/index.rst
@@ -35,10 +35,10 @@ Devicetree Overlays
    :maxdepth: 1
 
    changesets
+   dynamic-resolution-notes
 
 Todolist:
 
-*   dynamic-resolution-notes
 *   overlay-notes
 
 Devicetree Bindings
-- 
2.31.1

