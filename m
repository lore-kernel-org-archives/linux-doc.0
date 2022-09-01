Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D76ECAAD1
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 11:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbiIALQY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbiIALQY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 07:16:24 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0F8761243EA
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 04:16:21 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32t4lBBjyrkOAA--.58656S7;
        Thu, 01 Sep 2022 19:16:16 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v1 5/5] docs/zh_CN: add dt kernel-api translation
Date:   Thu,  1 Sep 2022 19:15:46 +0800
Message-Id: <0f2bfe28c1bdbc84b0085ba184675ea04f5e60b1.1662022757.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662022757.git.siyanteng@loongson.cn>
References: <cover.1662022757.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32t4lBBjyrkOAA--.58656S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyxGr1kuFy8JFWkuF17Jrb_yoW8uF47pF
        9akryxGF1fu347u3yxWF48GFy3J3Wfuw45KFyxtwnagr1YyFyrtr4jqFykKF9rGry0kFWU
        WFWUKrWjk3Wqyr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4U
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjivttUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translte .../devicetree/kernel-api.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

