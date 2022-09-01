Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BC5C0502C
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 11:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233901AbiIALQX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:16:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234002AbiIALQV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 07:16:21 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 346E41275FC
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 04:16:20 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32t4lBBjyrkOAA--.58656S5;
        Thu, 01 Sep 2022 19:16:15 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v1 3/5] docs/zh_CN: add dt dynamic-resolution-notes translation
Date:   Thu,  1 Sep 2022 19:15:44 +0800
Message-Id: <be219cfda1db15eedd57b77cfdfd52acbd1a8aee.1662022757.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662022757.git.siyanteng@loongson.cn>
References: <cover.1662022757.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32t4lBBjyrkOAA--.58656S5
X-Coremail-Antispam: 1UD129KBjvJXoWxGF1kur1xZw1xAr1xKrW7Jwb_yoW5Gw1fpF
        93uFySgF1rZ342grWxKF1UX3W3Aa4xuw4UGF48X3WFqr95Jryrtr12yFyDta43W34xCFyU
        Xa97KrWrCryjyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
        x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU54E_DUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../devicetree/dynamic-resolution-notes.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

