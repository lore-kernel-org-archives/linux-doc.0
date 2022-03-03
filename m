Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A0EC433FE
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 08:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbiCCIKm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbiCCIKl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 03:10:41 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 368EE170D7E
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 00:09:56 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id c16-20020a17090aa61000b001befad2bfaaso3688551pjq.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 00:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BlHftytjBuyoRKIXnSA9u4UHiVRKtBie/ZZSVHzn4HE=;
        b=L2UNx+WqtGzUPMfGtVgcgF51DX9vz7Sw4DogZVN2phE/aKEyzlwm9UfWoPEASAaT/v
         Fh9/NqolS5gXOJV5UOJPFxfoY88TtSmaP5x6LUHBvdhQZDqEjjIlN3uRGq9JRxaoAE+n
         9Dn4pF7UovFMYxwOaW3RAVLrf0EAjRHl1P+cVfMvAmAQzWcGewzDIG9mTbTEtZN2qqXJ
         Mj5HaKQsDdPDm6YKp2dImq0HaYhI7d4tJZLbA/ky+FG++xSDHdvB/P9js6MOKAbMvreT
         Sw/31hnKkpcRa0puWe0aD9cs/m2Q//ZUMBOhBe0KlD1NH9B1H8y/k50WxPPo6UIUWohh
         qUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BlHftytjBuyoRKIXnSA9u4UHiVRKtBie/ZZSVHzn4HE=;
        b=4BbObnz/78iY0uuTFiv2dMxfrGff4qOchQK9Zo2dT6uGarP32ExKz6pxSKDRk7qNdf
         UZWpXoI3kr/7Ju7cPxXCEH8VyXDkkHF6+8WGdOOcnFJmUCMBxrO0vxBEvDIyZvJf9ncy
         d4Ev8hS1IRMHcSMeQDO+I1VwFwov7HVHtgayr4ug4Pcoq6w4yAtyf5xMF6QDh9iofAb9
         pjLqhnP9k1/fXS+rWoU1777xsLmcx1mrwkr8ZYQcOTdVLXKmw1ZxynOB1FThxMr9hFxt
         qUUAY4JITRAsY170iGJ8vMm/evOvmms4vBTjYw6xvdtl8nRcQl8biTVe68mCxCJg16Vi
         akQA==
X-Gm-Message-State: AOAM531ojJUldRaxOYS4WzB1GYTeNyyLdmawcF58Fz9Ru0J7Ua+3/1it
        BjS4MzP5HHhiQg2/df2nJuGEKeUb8KT16N03
X-Google-Smtp-Source: ABdhPJzzsMAwm4LBgYt3v6EcHuqdrldA7D+hWR+NzhYiYgDPa6we4kppLmw1MN9iEzFguC7XiVNQnA==
X-Received: by 2002:a17:90a:8581:b0:1b2:7541:af6c with SMTP id m1-20020a17090a858100b001b27541af6cmr4076980pjn.48.1646294995626;
        Thu, 03 Mar 2022 00:09:55 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id 6-20020a630006000000b0036d11540db8sm1371229pga.76.2022.03.03.00.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:09:55 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 3/3] docs/zh_CN: add devicetree of_unittest translation
Date:   Thu,  3 Mar 2022 16:06:29 +0800
Message-Id: <1769ee238ef217f0d55bf6d9b200a37bb8eb386d.1646294349.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646294349.git.siyanteng@loongson.cn>
References: <cover.1646294349.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../Devicetree/of_unittest.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng01@gmail.com>
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
index 000000000000..fc7f3934b345
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
+2. Test-data
+============
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

