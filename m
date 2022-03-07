Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592ECC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233532AbiCGImY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbiCGImX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:42:23 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C6EE63504
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:41:28 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v4so12711707pjh.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2A6LORkIfOcb0KdP0lZJ+uhIn52NtIRD2XR6yHjh0e8=;
        b=ezQQVcLaVwAEpSS/DMPhpTSsVxdvgAGJzBmTxqsoY+PNa+KHgwSm8l8XThl+s3Wqhs
         tC7lfuaLSBcDiy6pwWoCrLxLZxXD55urr0BcP4OG+uXnXxoXKqapz3kkwhcDyU76R3Y4
         8beisSw7tMrENC2RqpFTvEcwWGrXOBYwHsBEnghFeStRfZSfEUWk1l0IVCmOeVCZtt4G
         duh4iiIsKBRA3iGm08V01Jno33ajwQVQzb2h3/F3w0ACCERK9l01Gwl7Bfa0LG1WapDZ
         eTTeIxDH1rYxqDmbfKowNtuSOPgVivM7rkGt3YlIt61oavMcPwldQd2+YDPGQ1PObY31
         L3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2A6LORkIfOcb0KdP0lZJ+uhIn52NtIRD2XR6yHjh0e8=;
        b=wbi0iz4UYMDIUsVoSS0v4SuQT4zDKm6eAmbG4dpKheMlk6XEysDvQGbyTnlvC3MXzH
         jOOam16O7FMm6Yrm3F/bXX1kpjTNuQlFrWe/Fvx0SpSNLcsZGGc9SMlaWCviSuCCa+8D
         5oE1K42UW5QnO/8w/FI+wyDBRpXQQWrNdUkTLPz9yrzaC2uJoymAS+HuYKaKrc5ViCNP
         VkIEVSEttRmLWybgsgp9Uj5AFZdhVEvp1iuJ+n/GZFdKgLXwlnGCum5RemNTgD3xOxUd
         /mLjXXQI2eB5zqv1zPNCAwEnHGJhpojxpTG56MEPPbDZ0DZtOXtuvzED+jw3EP/kyb7O
         9rqg==
X-Gm-Message-State: AOAM5337SVTdmPJm3TOWB0GucRcxdhFncFdrUPRCTWniUm3/2UoXPUD2
        hCwqHzq+g4TiJYYIpXmOz9Q=
X-Google-Smtp-Source: ABdhPJwsGXSbnjjatwsirA1JPTmdIannJQyZXIWra8qEieyTbywgO5SInRdOg5VgdfkeWHcDnQn+2g==
X-Received: by 2002:a17:90b:1b04:b0:1bf:4ad2:8b2a with SMTP id nu4-20020a17090b1b0400b001bf4ad28b2amr8070465pjb.184.1646642487745;
        Mon, 07 Mar 2022 00:41:27 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id bd10-20020a056a00278a00b004f6fe0f4cbasm2929431pfb.101.2022.03.07.00.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:41:27 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/3] docs/zh_CN: add devicetree of_unittest translation
Date:   Mon,  7 Mar 2022 16:42:22 +0800
Message-Id: <da75225df2ac7bee8de653d95b2a872510b34f7d.1646642188.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646642188.git.siyanteng@loongson.cn>
References: <cover.1646642188.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate .../Devicetree/of_unittest.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/devicetree/index.rst   |   3 +-
 .../zh_CN/devicetree/of_unittest.rst          | 189 ++++++++++++++++++
 2 files changed, 190 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/of_unittest.rst

diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Documentation/translations/zh_CN/devicetree/index.rst
index 6d9ac4254a1c..23d0b6fccd58 100644
--- a/Documentation/translations/zh_CN/devicetree/index.rst
+++ b/Documentation/translations/zh_CN/devicetree/index.rst
@@ -23,11 +23,10 @@ Open Firmware 和 Devicetree
    :maxdepth: 1
 
    usage-model
+   of_unittest
 
 Todolist:
 
-
-*   of_unittest
 *   kernel-api
 
 Devicetree Overlays
diff --git a/Documentation/translations/zh_CN/devicetree/of_unittest.rst b/Documentation/translations/zh_CN/devicetree/of_unittest.rst
new file mode 100644
index 000000000000..abd94e771ef8
--- /dev/null
+++ b/Documentation/translations/zh_CN/devicetree/of_unittest.rst
@@ -0,0 +1,189 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/Devicetree/of_unittest.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+=================================
+Open Firmware Devicetree 单元测试
+=================================
+
+作者: Gaurav Minocha <gaurav.minocha.os@gmail.com>
+
+1. 概述
+=======
+
+本文档解释了执行 OF 单元测试所需的测试数据是如何动态地附加到实时树上的，与机器的架构无关。
+
+建议在继续读下去之前，先阅读以下文件。
+
+(1) Documentation/devicetree/usage-model.rst
+(2) http://www.devicetree.org/Device_Tree_Usage
+
+OF Selftest被设计用来测试提供给设备驱动开发者的接口（include/linux/of.h），以从未扁平
+化的设备树数据结构中获取设备信息等。这个接口被大多数设备驱动在各种使用情况下使用。
+
+
+2. 测试数据
+===========
+
+设备树源文件（drivers/of/unittest-data/testcases.dts）包含执行drivers/of/unittest.c
+中自动化单元测试所需的测试数据。目前，以下设备树源包含文件（.dtsi）被包含在testcases.dt中::
+
+    drivers/of/unittest-data/tests-interrupts.dtsi
+    drivers/of/unittest-data/tests-platform.dtsi
+    drivers/of/unittest-data/tests-phandle.dtsi
+    drivers/of/unittest-data/tests-match.dtsi
+
+当内核在启用OF_SELFTEST的情况下被构建时，那么下面的make规则::
+
+    $(obj)/%.dtb: $(src)/%.dts FORCE
+	    $(call if_changed_dep, dtc)
+
+用于将DT源文件（testcases.dts）编译成二进制blob（testcases.dtb），也被称为扁平化的DT。
+
+之后，使用以下规则将上述二进制blob包装成一个汇编文件（testcases.dtb.S）::
+
+    $(obj)/%.dtb.S: $(obj)/%.dtb
+	    $(call cmd, dt_S_dtb)
+
+汇编文件被编译成一个对象文件（testcases.dtb.o），并被链接到内核镜像中。
+
+
+2.1. 添加测试数据
+-----------------
+
+未扁平化的设备树结构体:
+
+未扁平化的设备树由连接的设备节点组成，其树状结构形式如下所述::
+
+    // following struct members are used to construct the tree
+    struct device_node {
+	...
+	struct  device_node *parent;
+	struct  device_node *child;
+	struct  device_node *sibling;
+	...
+    };
+
+图1描述了一个机器的未扁平化设备树的通用结构，只考虑了子节点和同级指针。存在另一个指针，
+``*parent`` ，用于反向遍历该树。因此，在一个特定的层次上，子节点和所有的兄弟姐妹节点将
+有一个指向共同节点的父指针（例如，child1、sibling2、sibling3、sibling4的父指针指向
+根节点）::
+
+    root ('/')
+    |
+    child1 -> sibling2 -> sibling3 -> sibling4 -> null
+    |         |           |           |
+    |         |           |          null
+    |         |           |
+    |         |        child31 -> sibling32 -> null
+    |         |           |          |
+    |         |          null       null
+    |         |
+    |      child21 -> sibling22 -> sibling23 -> null
+    |         |          |            |
+    |        null       null         null
+    |
+    child11 -> sibling12 -> sibling13 -> sibling14 -> null
+    |           |           |            |
+    |           |           |           null
+    |           |           |
+    null        null       child131 -> null
+			    |
+			    null
+
+Figure 1: 未扁平化的设备树的通用结构
+
+
+在执行OF单元测试之前，需要将测试数据附加到机器的设备树上（如果存在）。因此，当调用
+selftest_data_add()时，首先会读取通过以下内核符号链接到内核镜像中的扁平化设备树
+数据::
+
+    __dtb_testcases_begin - address marking the start of test data blob
+    __dtb_testcases_end   - address marking the end of test data blob
+
+其次，它调用of_fdt_unflatten_tree()来解除扁平化的blob。最后，如果机器的设备树
+（即实时树）是存在的，那么它将未扁平化的测试数据树附加到实时树上，否则它将自己作为
+实时设备树附加。
+
+attach_node_and_children()使用of_attach_node()将节点附加到实时树上，如下所
+述。为了解释这一点，图2中描述的测试数据树被附加到图1中描述的实时树上::
+
+    root ('/')
+	|
+    testcase-data
+	|
+    test-child0 -> test-sibling1 -> test-sibling2 -> test-sibling3 -> null
+	|               |                |                |
+    test-child01      null             null             null
+
+
+Figure 2: 将测试数据树附在实时树上的例子。
+
+根据上面的方案，实时树已经存在，所以不需要附加根('/')节点。所有其他节点都是通过在
+每个节点上调用of_attach_node()来附加的。
+
+在函数of_attach_node()中，新的节点被附在实时树中给定的父节点的子节点上。但是，如
+果父节点已经有了一个孩子，那么新节点就会取代当前的孩子，并将其变成其兄弟姐妹。因此，
+当测试案例的数据节点被连接到上面的实时树（图1）时，最终的结构如图3所示::
+
+    root ('/')
+    |
+    testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
+    |               |          |           |           |
+    (...)             |          |           |          null
+		    |          |         child31 -> sibling32 -> null
+		    |          |           |           |
+		    |          |          null        null
+		    |          |
+		    |        child21 -> sibling22 -> sibling23 -> null
+		    |          |           |            |
+		    |         null        null         null
+		    |
+		    child11 -> sibling12 -> sibling13 -> sibling14 -> null
+		    |          |            |            |
+		    null       null          |           null
+					    |
+					    child131 -> null
+					    |
+					    null
+    -----------------------------------------------------------------------
+
+    root ('/')
+    |
+    testcase-data -> child1 -> sibling2 -> sibling3 -> sibling4 -> null
+    |               |          |           |           |
+    |             (...)      (...)       (...)        null
+    |
+    test-sibling3 -> test-sibling2 -> test-sibling1 -> test-child0 -> null
+    |                |                   |                |
+    null             null                null         test-child01
+
+
+Figure 3: 附加测试案例数据后的实时设备树结构。
+
+
+聪明的读者会注意到，与先前的结构相比，test-child0节点成为最后一个兄弟姐妹（图2）。
+在连接了第一个test-child0节点之后，又连接了test-sibling1节点，该节点推动子节点
+（即test-child0）成为兄弟姐妹，并使自己成为子节点，如上所述。
+
+如果发现一个重复的节点（即如果一个具有相同full_name属性的节点已经存在于实时树中），
+那么该节点不会被附加，而是通过调用函数update_node_properties()将其属性更新到活
+树的节点中。
+
+
+2.2. 删除测试数据
+-----------------
+
+一旦测试用例执行完，selftest_data_remove被调用，以移除最初连接的设备节点（首先是
+叶子节点被分离，然后向上移动父节点被移除，最后是整个树）。selftest_data_remove()
+调用detach_node_and_children()，使用of_detach_node()将节点从实时设备树上分离。
+
+为了分离一个节点，of_detach_node()要么将给定节点的父节点的子节点指针更新为其同级节
+点，要么根据情况将前一个同级节点附在给定节点的同级节点上。就这样吧。 :)
-- 
2.27.0

