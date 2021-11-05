Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C77BC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:27:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01ADD6112E
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231902AbhKEC3r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhKEC3q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:29:46 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3B38C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:27:07 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id y11so12399214oih.7
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KYZnSgNDwnj255/LqxeHDHOF2SFeRPu0tWpv2TpGryg=;
        b=lP5+X4/Qme3+9OEx2LUzFyrcjFN/dn8s5DK2ZSSnZNxQXOgygCLS7ET4tA8grGThvw
         uKY9SefjdZPeL2PQBtj1KlrrCBH1Xq4vKWuSXoktSUfC+R75Cp1B5N4/MDaaCzkt++Yb
         oyTV6GVT/Q/A27k3Dpg3o3zAiDFjxSDFiY8mku9on2QWsIUQbgoSdiuOxhepTmlLY7pZ
         gIQQUOur/TFYSyp/rNzQS9lgwm13g78VYVfLsan7qkw280Pb6UyAHeiaaigy4XYaXOzU
         ETt1IfKa8MO/0pAi/pAZoID2pv/DNNPHseybfLAwWTJFn29kTR83nf5LTEapyOMOpqlJ
         29xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KYZnSgNDwnj255/LqxeHDHOF2SFeRPu0tWpv2TpGryg=;
        b=vmZbxJHOww1ST62u3M6O2IZcT5O5DQ+8MMKZipwX6PcvdDp1jmzPVefAu5Hjr/5hxj
         RaXNJcpM2aPqHJ+yXAlAV396uUE9IrryL8xgJe5mcOCgN3NaqMNv02onG7XHO7vkpM9h
         YogsUDpFPAGOvAVdXrqhkMB++8Rbl+Bm+XPSLjoNqGSPZ3Icea4VAxY1WW02iXy4oETl
         TnQBADCrotvCC4MxSL4IKCjz5lNiZ2EzF51PPRxrTbpijl1Gq9b40lxv/UKL1JLNzisi
         ieawqyrn1bG4tlZs4ijOj8V5WIjC/x8lAkShYcMJVv4xuKJXp3c/2qd5rEIEC5J29XtK
         8fxQ==
X-Gm-Message-State: AOAM531IvHhGCY3H1k6hASCKWIhmzqTxCD36Zr3+X//Mv5io0CqG1drT
        6SPm94V9WGsGreqm8CPLPj4=
X-Google-Smtp-Source: ABdhPJy7zPhwR/ojG3XwYXOtr7gQ+WH3QQ2WO/I57VDJIlF6VbF20c6NCwVf65EEl9bnmrNw98D/aQ==
X-Received: by 2002:a05:6808:2219:: with SMTP id bd25mr19979418oib.12.1636079227005;
        Thu, 04 Nov 2021 19:27:07 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id j4sm1725231otk.38.2021.11.04.19.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 19:27:06 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        bobwxc@email.cn
Subject: [PATCH 1/2] docs/zh_CN: add pciebus-howto translation
Date:   Fri,  5 Nov 2021 10:26:21 +0800
Message-Id: <a451d75fbcb06d9f1e28622523457f10d0bc3f85.1636027203.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1636027203.git.siyanteng@loongson.cn>
References: <cover.1636027203.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../PCI/pciebus-howto.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/PCI/index.rst          |   2 +-
 .../translations/zh_CN/PCI/pciebus-howto.rst  | 192 ++++++++++++++++++
 2 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/pciebus-howto.rst

diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentation/translations/zh_CN/PCI/index.rst
index 5c96017e9f41..d3bb2af77370 100644
--- a/Documentation/translations/zh_CN/PCI/index.rst
+++ b/Documentation/translations/zh_CN/PCI/index.rst
@@ -22,10 +22,10 @@ Linux PCI总线子系统
    :numbered:
 
    pci
+   pciebus-howto
 
 Todolist:
 
-   pciebus-howto
    pci-iov-howto
    msi-howto
    sysfs-pci
diff --git a/Documentation/translations/zh_CN/PCI/pciebus-howto.rst b/Documentation/translations/zh_CN/PCI/pciebus-howto.rst
new file mode 100644
index 000000000000..65c4301f12cd
--- /dev/null
+++ b/Documentation/translations/zh_CN/PCI/pciebus-howto.rst
@@ -0,0 +1,192 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/PCI/pciebus-howto.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_pciebus-howto:
+
+===========================
+PCI Express端口总线驱动指南
+===========================
+
+:作者: Tom L Nguyen tom.l.nguyen@intel.com 11/03/2004
+:版权: |copy| 2004 Intel Corporation
+
+关于本指南
+==========
+
+本指南介绍了PCI Express端口总线驱动程序的基本知识，并提供了如何使服务驱
+动程序在PCI Express端口总线驱动程序中注册/取消注册的介绍。
+
+
+什么是PCI Express端口总线驱动程序
+=================================
+
+一个PCI Express端口是一个逻辑的PCI-PCI桥结构。有两种类型的PCI Express端
+口：根端口和交换端口。根端口从PCI Express根综合体发起一个PCI Express链接，
+交换端口将PCI Express链接连接到内部逻辑PCI总线。交换机端口，其二级总线代表
+交换机的内部路由逻辑，被称为交换机的上行端口。交换机的下行端口是从交换机的内部
+路由总线桥接到代表来自PCI Express交换机的下游PCI Express链接的总线。
+
+一个PCI Express端口可以提供多达四个不同的功能，在本文中被称为服务，这取决于
+其端口类型。PCI Express端口的服务包括本地热拔插支持（HP）、电源管理事件支持（PME）、
+高级错误报告支持（AER）和虚拟通道支持（VC）。这些服务可以由一个复杂的驱动程序
+处理，也可以单独分布并由相应的服务驱动程序处理。
+
+为什么要使用PCI Express端口总线驱动程序？
+=========================================
+
+在现有的Linux内核中，Linux设备驱动模型允许一个物理设备只由一个驱动处理。
+PCI Express端口是一个具有多个不同服务的PCI-PCI桥设备。为了保持一个干净和简
+单的解决方案，每个服务都可以有自己的软件服务驱动。在这种情况下，几个服务驱动将
+竞争一个PCI-PCI桥设备。例如，如果PCI Express根端口的本机热拔插服务驱动程序
+首先被加载，它就会要求一个PCI-PCI桥根端口。因此，内核不会为该根端口加载其他服
+务驱动。换句话说，使用当前的驱动模型，不可能让多个服务驱动同时加载并运行在
+PCI-PCI桥设备上。
+
+为了使多个服务驱动程序同时运行，需要有一个PCI Express端口总线驱动程序，它管
+理所有填充的PCI Express端口，并根据需要将所有提供的服务请求分配给相应的服务
+驱动程序。下面列出了使用PCI Express端口总线驱动程序的一些关键优势:
+
+  - 允许在一个PCI-PCI桥接端口设备上同时运行多个服务驱动。
+
+  - 允许以独立的分阶段方式实施服务驱动程序。
+
+  - 允许一个服务驱动程序在多个PCI-PCI桥接端口设备上运行。
+
+  - 管理和分配PCI-PCI桥接端口设备的资源给要求的服务驱动程序。
+
+配置PCI Express端口总线驱动程序与服务驱动程序
+=============================================
+
+将PCI Express端口总线驱动支持纳入内核
+-------------------------------------
+
+包括PCI Express端口总线驱动程序取决于内核配置中是否包含PCI Express支持。当内核
+中的PCI Express支持被启用时，内核将自动包含PCI Express端口总线驱动程序作为内核
+驱动程序。
+
+启用服务驱动支持
+----------------
+
+PCI设备驱动是基于Linux设备驱动模型实现的。所有的服务驱动都是PCI设备驱动。如上所述，
+一旦内核加载了PCI Express端口总线驱动程序，就不可能再加载任何服务驱动程序。为了满
+足PCI Express端口总线驱动程序模型，需要对现有的服务驱动程序进行一些最小的改变，其
+对现有的服务驱动程序的功能没有影响。
+
+服务驱动程序需要使用下面所示的两个API，将其服务注册到PCI Express端口总线驱动程
+序中（见第5.2.1和5.2.2节）。在调用这些API之前，服务驱动程序必须初始化头文件
+/include/linux/pcieport_if.h中的pcie_port_service_driver数据结构。如果不这
+样做，将导致身份不匹配，从而使PCI Express端口总线驱动程序无法加载服务驱动程序。
+
+pcie_port_service_register
+~~~~~~~~~~~~~~~~~~~~~~~~~~
+::
+
+  int pcie_port_service_register(struct pcie_port_service_driver *new)
+
+这个API取代了Linux驱动模型的 pci_register_driver API。一个服务驱动应该总是在模
+块启动时调用 pcie_port_service_register。请注意，在服务驱动被加载后，诸如
+pci_enable_device(dev) 和 pci_set_master(dev) 的调用不再需要，因为这些调用由
+PCI端口总线驱动执行。
+
+pcie_port_service_unregister
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+::
+
+  void pcie_port_service_unregister(struct pcie_port_service_driver *new)
+
+pcie_port_service_unregister取代了Linux驱动模型的pci_unregister_driver。当一
+个模块退出时，它总是被服务驱动调用。
+
+示例代码
+~~~~~~~~
+
+下面是服务驱动代码示例，用于初始化端口服务的驱动程序数据结构。
+::
+
+  static struct pcie_port_service_id service_id[] = { {
+    .vendor = PCI_ANY_ID,
+    .device = PCI_ANY_ID,
+    .port_type = PCIE_RC_PORT,
+    .service_type = PCIE_PORT_SERVICE_AER,
+    }, { /* end: all zeroes */ }
+  };
+
+  static struct pcie_port_service_driver root_aerdrv = {
+    .name		= (char *)device_name,
+    .id_table	= &service_id[0],
+
+    .probe		= aerdrv_load,
+    .remove		= aerdrv_unload,
+
+    .suspend	= aerdrv_suspend,
+    .resume		= aerdrv_resume,
+  };
+
+下面是一个注册/取消注册服务驱动的示例代码。
+::
+
+  static int __init aerdrv_service_init(void)
+  {
+    int retval = 0;
+
+    retval = pcie_port_service_register(&root_aerdrv);
+    if (!retval) {
+      /*
+      * FIX ME
+      */
+    }
+    return retval;
+  }
+
+  static void __exit aerdrv_service_exit(void)
+  {
+    pcie_port_service_unregister(&root_aerdrv);
+  }
+
+  module_init(aerdrv_service_init);
+  module_exit(aerdrv_service_exit);
+
+可能的资源冲突
+==============
+
+由于PCI-PCI桥接端口设备的所有服务驱动被允许同时运行，下面列出了一些可能的资源冲突和
+建议的解决方案。
+
+MSI 和 MSI-X 向量资源
+---------------------
+
+一旦设备上的MSI或MSI-X中断被启用，它就会一直保持这种模式，直到它们再次被禁用。由于同
+一个PCI-PCI桥接端口的服务驱动程序共享同一个物理设备，如果一个单独的服务驱动程序启用或
+禁用MSI/MSI-X模式，可能会导致不可预知的行为。
+
+为了避免这种情况，所有的服务驱动程序都不允许在其设备上切换中断模式。PCI Express端口
+总线驱动程序负责确定中断模式，这对服务驱动程序来说应该是透明的。服务驱动程序只需要知道
+分配给结构体pcie_device的字段irq的向量IRQ，当PCI Express端口总线驱动程序探测每
+个服务驱动程序时，它被传入。服务驱动应该使用（struct pcie_device*）dev->irq来调用
+request_irq/free_irq。此外，中断模式被存储在struct pcie_device的interrupt_mode
+字段中。
+
+PCI内存/IO映射的区域
+--------------------
+
+PCI Express电源管理（PME）、高级错误报告（AER）、热插拔（HP）和虚拟通道（VC）的服务
+驱动程序访问PCI Express端口的PCI配置空间。在所有情况下，访问的寄存器是相互独立的。这
+个补丁假定所有的服务驱动程序都会表现良好，不会覆盖其他服务驱动程序的配置设置。
+
+PCI配置寄存器
+-------------
+
+每个服务驱动都在自己的功能结构体上运行PCI配置操作，除了PCI Express功能结构体，其中根控制
+寄存器和设备控制寄存器是在PME和AER之间共享。这个补丁假定所有的服务驱动都会表现良好，不会
+覆盖其他服务驱动的配置设置。
-- 
2.27.0

