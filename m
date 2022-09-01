Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E415BC54EE9
	for <linux-doc@archiver.kernel.org>; Thu,  1 Sep 2022 11:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbiIALQ0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Sep 2022 07:16:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234032AbiIALQ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Sep 2022 07:16:26 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 20A3B1275DF
        for <linux-doc@vger.kernel.org>; Thu,  1 Sep 2022 04:16:22 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx32t4lBBjyrkOAA--.58656S6;
        Thu, 01 Sep 2022 19:16:16 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v1 4/5] docs/zh_CN: add dt overlay-notes translation
Date:   Thu,  1 Sep 2022 19:15:45 +0800
Message-Id: <34d7438419975866785d4a4f4a2e348073e95673.1662022757.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662022757.git.siyanteng@loongson.cn>
References: <cover.1662022757.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx32t4lBBjyrkOAA--.58656S6
X-Coremail-Antispam: 1UD129KBjvJXoW3WryxWFWDZr18WF48GFWDXFb_yoWxtryDpr
        y3urZ3WF13Cry7XryDKF4UXr1UJr1UAayUK3WjqF18Xry8AryrAw1UtF95tr9rWry8AFyU
        tFWUtFy8Cr18ArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUeNVyDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../devicetree/overlay-notes.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/devicetree/index.rst   |   5 +-
 .../zh_CN/devicetree/overlay-notes.rst        | 140 ++++++++++++++++++
 2 files changed, 141 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/overlay-notes.rst

diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
index be5b974c6e68..9d95d2629b38 100644
--- a/Documentation/translations/zh_CN/devicetree/index.rst
+++ b/Documentation/translations/zh_CN/devicetree/index.rst
@@ -36,10 +36,7 @@ Devicetree Overlays
 
    changesets
    dynamic-resolution-notes
-
-Todolist:
-
-*   overlay-notes
+   overlay-notes
 
 Devicetree Bindings
 ===================
diff --git a/Documentation/translations/zh_CN/devicetree/overlay-notes.rst b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
new file mode 100644
index 000000000000..572ddaf729a8
--- /dev/null
+++ b/Documentation/translations/zh_CN/devicetree/overlay-notes.rst
@@ -0,0 +1,140 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/Devicetree/overlay-notes.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+==============
+设备树覆盖说明
+==============
+
+本文档描述了drivers/of/overlay.c中的内核内设备树覆盖功能的实现，是
+Documentation/devicetree/dynamic-resolution-notes.rst[1]的配套文档。
+
+覆盖如何工作
+------------
+
+设备树的覆盖目的是修改内核的实时树，并让修改影响内核的状态，以反映变化的方式。
+由于内核主要处理的是设备，任何新的设备节点如果导致一个活动的设备，就应该创建它，
+而如果设备节点被禁用或被全部删除，受影响的设备应该被取消注册。
+
+让我们举个例子，我们有一个foo板，它的基本树形图如下::
+
+    ---- foo.dts ---------------------------------------------------------------
+	/* FOO平台 */
+	/dts-v1/;
+	/ {
+		compatible = "corp,foo";
+
+		/* 共享的资源 */
+		res: res {
+		};
+
+		/* 芯片上的外围设备 */
+		ocp: ocp {
+			/* 总是被实例化的外围设备 */
+			peripheral1 { ... };
+		};
+	};
+    ---- foo.dts ---------------------------------------------------------------
+
+覆盖bar.dts,
+::
+
+    ---- bar.dts - 按标签覆盖目标位置 ----------------------------
+	/dts-v1/;
+	/插件/;
+	&ocp {
+		/* bar外围 */
+		bar {
+			compatible = "corp,bar";
+			... /* 各种属性和子节点 */
+		};
+	};
+    ---- bar.dts ---------------------------------------------------------------
+
+当加载（并按照[1]中描述的方式解决）时，应该产生foo+bar.dts::
+
+    ---- foo+bar.dts -----------------------------------------------------------
+	/* FOO平台 + bar外围 */
+	/ {
+		compatible = "corp,foo";
+
+		/* 共享资源 */
+		res: res {
+		};
+
+		/* 芯片上的外围设备 */
+		ocp: ocp {
+			/* 总是被实例化的外围设备 */
+			peripheral1 { ... };
+
+			/* bar外围 */
+			bar {
+				compatible = "corp,bar";
+				... /* 各种属性和子节点 */
+			};
+		};
+	};
+    ---- foo+bar.dts -----------------------------------------------------------
+
+作为覆盖的结果，已经创建了一个新的设备节点（bar），因此将注册一个bar平台设备，
+如果加载了匹配的设备驱动程序，将按预期创建设备。
+
+如果基础DT不是用-@选项编译的，那么“&ocp”标签将不能用于将覆盖节点解析到基础
+DT中的适当位置。在这种情况下，可以提供目标路径。通过标签的目标位置的语法是比
+较好的，因为不管标签在DT中出现在哪里，覆盖都可以被应用到任何包含标签的基础DT上。
+
+上面的bar.dts例子被修改为使用目标路径语法，即为::
+
+    ---- bar.dts - 通过明确的路径覆盖目标位置 --------------------
+	/dts-v1/;
+	/插件/;
+	&{/ocp} {
+		/* bar外围 */
+		bar {
+			compatible = "corp,bar";
+			... /* 各种外围设备和子节点 */
+		}
+	};
+    ---- bar.dts ---------------------------------------------------------------
+
+
+内核中关于覆盖的API
+-------------------
+
+该API相当容易使用。
+
+1) 调用of_overlay_fdt_apply()来创建和应用一个覆盖的变更集。返回值是一个
+   错误或一个识别这个覆盖的cookie。
+
+2) 调用of_overlay_remove()来删除和清理先前通过调用of_overlay_fdt_apply()
+   而创建的覆盖变更集。不允许删除一个被另一个覆盖的覆盖变化集。
+
+最后，如果你需要一次性删除所有的覆盖，只需调用of_overlay_remove_all()，
+它将以正确的顺序删除每一个覆盖。
+
+你可以选择注册在覆盖操作中被调用的通知器。详见
+of_overlay_notifier_register/unregister和enum of_overlay_notify_action。
+
+OF_OVERLAY_PRE_APPLY、OF_OVERLAY_POST_APPLY或OF_OVERLAY_PRE_REMOVE
+的通知器回调可以存储指向覆盖层中的设备树节点或其内容的指针，但这些指针不能持
+续到OF_OVERLAY_POST_REMOVE的通知器回调。在OF_OVERLAY_POST_REMOVE通
+知器被调用后，包含覆盖层的内存将被kfree()ed。请注意，即使OF_OVERLAY_POST_REMOVE
+的通知器返回错误，内存也会被kfree()ed。
+
+drivers/of/dynamic.c中的变更集通知器是第二种类型的通知器，可以通过应用或移除
+覆盖层来触发。这些通知器不允许在覆盖层或其内容中存储指向设备树节点的指针。当包含
+覆盖层的内存因移除覆盖层而被释放时，覆盖层代码并不能防止这类指针仍然有效。
+
+任何其他保留指向覆盖层节点或数据的指针的代码都被认为是一个错误，因为在移除覆盖层
+后，该指针将指向已释放的内存。
+
+覆盖层的用户必须特别注意系统上发生的整体操作，以确保其他内核代码不保留任何指向覆
+盖层节点或数据的指针。任何无意中使用这种指针的例子是，如果一个驱动或子系统模块在
+应用了覆盖后被加载，并且该驱动或子系统扫描了整个设备树或其大部分，包括覆盖节点。
-- 
2.31.1

