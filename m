Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1A4C6FA83
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 08:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbiIFI1c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbiIFI1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 04:27:30 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D72A96F551
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 01:27:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OFpBBdjpJMSAA--.10497S7;
        Tue, 06 Sep 2022 16:27:25 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 5/5] docs/zh_CN: add dt kernel-api translation
Date:   Tue,  6 Sep 2022 16:26:51 +0800
Message-Id: <35fd1b5801d7191e078937908008115f8949aac3.1662449105.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662449105.git.siyanteng@loongson.cn>
References: <cover.1662449105.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OFpBBdjpJMSAA--.10497S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyxGr1kuFy8JFWkuF17Jrb_yoW8uw48pF
        9akryxGF1fury7u3yxWF48CFy3J3Wfuw45KFyxtwnagr1YyFyrtr1jqrykKasrGry0kFWU
        WFWUKrWjk3Wqyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8
        Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
        vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUfhLnUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translte .../devicetree/kernel-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/devicetree/index.rst   |  5 +-
 .../zh_CN/devicetree/kernel-api.rst           | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/kernel-api.rst

diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
index 9d95d2629b38..7451dbfdd3e5 100644
--- a/Documentation/translations/zh_CN/devicetree/index.rst
+++ b/Documentation/translations/zh_CN/devicetree/index.rst
@@ -24,10 +24,7 @@ Open Firmware 和 Devicetree
 
    usage-model
    of_unittest
-
-Todolist:
-
-*   kernel-api
+   kernel-api
 
 Devicetree Overlays
 ===================
diff --git a/Documentation/translations/zh_CN/devicetree/kernel-api.rst b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
new file mode 100644
index 000000000000..6aa3b685494e
--- /dev/null
+++ b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/Devicetree/kernel-api.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+=================
+内核中的设备树API
+=================
+
+核心函数
+--------
+
+该API在以下内核代码中:
+
+drivers/of/base.c
+
+include/linux/of.h
+
+drivers/of/property.c
+
+include/linux/of_graph.h
+
+drivers/of/address.c
+
+drivers/of/irq.c
+
+drivers/of/fdt.c
+
+驱动模型函数
+------------
+
+该API在以下内核代码中:
+
+include/linux/of_device.h
+
+drivers/of/device.c
+
+include/linux/of_platform.h
+
+drivers/of/platform.c
+
+覆盖和动态DT函数
+----------------
+
+该API在以下内核代码中:
+
+drivers/of/resolver.c
+
+drivers/of/dynamic.c
+
+drivers/of/overlay.c
-- 
2.31.1

