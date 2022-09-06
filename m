Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5946AC38145
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 08:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbiIFI1d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 04:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbiIFI1a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 04:27:30 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5843B6E8A4
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 01:27:28 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx5OFpBBdjpJMSAA--.10497S6;
        Tue, 06 Sep 2022 16:27:25 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 4/5] docs/zh_CN: add dt overlay-notes translation
Date:   Tue,  6 Sep 2022 16:26:50 +0800
Message-Id: <b957580e448e2d0ab7917644c8f8f1614060b20a.1662449105.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1662449105.git.siyanteng@loongson.cn>
References: <cover.1662449105.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bx5OFpBBdjpJMSAA--.10497S6
X-Coremail-Antispam: 1UD129KBjvJXoW3WryxWFWDZr18Zw13ury5CFg_yoWxtryxpr
        y3urZ3W3W3Cry7XryDKF4UXr17JF1UAayUK3Wjq3W8Xry8AryrAw1UtF95tryDWry8AFyU
        tFWUtFy8Cr18ArUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBl14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r43Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjGNt3UUUUU==
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
index 000000000000..1bd482cb0a1b
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
+设备树覆盖的目的是修改内核的实时树，并使修改以反映变化的方式影响内核的状态。
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

