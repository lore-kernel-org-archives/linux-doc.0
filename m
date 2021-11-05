Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1200C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:27:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3D6D61037
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbhKEC3z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbhKEC3v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:29:51 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C46C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:27:12 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id o83so12403307oif.4
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKq8+ANOLbKIvZ8aZw6kLgEeNkrfyPf5qP/T172zBOw=;
        b=Q+61lr/qBzMXd57MYaMScPPpeJD0X49njZhfoxh7FJjqtnUG/Qx5Dm5783KPuDlbQm
         yizvtyCpHwHZ3hA0naVFw2dq4yj3TMgAqwxxTbJUEWZxeFT64newyBY+pgk1hgnVmI/S
         XZEOe6PE+JIVFXT95Ov6PhcaE+yd0c8bYILqJMeaIkDx+SEeY3/986CCmpbDuCvyzdAg
         evWrhXZOaerRm1G+NiIUOmbJK+Qk61rrq+mG6LKbecXMtKWm0LdM08fXyzOSUSgAm1O6
         TkgN756oDpvrrVlobnEyCnDlDqVkSh+WDrIRzCGmaNBtb3ZeVQSPYegyyU14lfhKb75P
         igPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKq8+ANOLbKIvZ8aZw6kLgEeNkrfyPf5qP/T172zBOw=;
        b=3CkOvb5bFG7okudJWFkWK6N0cnKQSZw/PCldr1kTZysZJzLJ+V5kW9RvVhVqQsIqT4
         iQa7svU5RVb+Cx/y+BXJl/X28csUDKOUIVpmLPdIzjWW6JHSBEwSuFJiEgMBzdOaUc4M
         dOxtvSgBu050XQ/LPHiXW79HVXlW1rd+AL1jB4FMjYAliIa65pjg+28YzGw0IBrGmQug
         qzlk+gt0oanH9/tCn716BbjYDPjCuhVxzBN6GRxSYiY2uv3chenY5dMCeY5hC4Vy8O/S
         GkJWNvyH5Q4F6kZfazeO+j+jnObBV36WvmoJbz9r/39Re8DPC6RZQycstEIWVsbpb1AE
         E7nQ==
X-Gm-Message-State: AOAM530h+H6VsjOQK8FWWD/dryzVdOH9WRI9wuG18o/UVL12VrghMJO7
        cGXikEFra2gEFfntYojmBuk=
X-Google-Smtp-Source: ABdhPJwE4tf2QsdoIDjtfON/Wn1vHsPLj0dILqPwhM81TcIdBo6PVI2NcceBu1BSSvQwAQ/MlC8lbA==
X-Received: by 2002:aca:b50a:: with SMTP id e10mr19488074oif.143.1636079231467;
        Thu, 04 Nov 2021 19:27:11 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id j4sm1725231otk.38.2021.11.04.19.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 19:27:11 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        bobwxc@email.cn
Subject: [PATCH 2/2] docs/zh_CN: add pci-iov-howto translation
Date:   Fri,  5 Nov 2021 10:26:22 +0800
Message-Id: <a4f4ad857d63468b6a5fb1aba273bc6dd5a379ae.1636027203.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1636027203.git.siyanteng@loongson.cn>
References: <cover.1636027203.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../PCI/pci-iov-howto.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/PCI/index.rst          |   3 +-
 .../translations/zh_CN/PCI/pci-iov-howto.rst  | 170 ++++++++++++++++++
 2 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/pci-iov-howto.rst

diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentation/translations/zh_CN/PCI/index.rst
index d3bb2af77370..67860b7e5ac7 100644
--- a/Documentation/translations/zh_CN/PCI/index.rst
+++ b/Documentation/translations/zh_CN/PCI/index.rst
@@ -23,10 +23,11 @@ Linux PCI总线子系统
 
    pci
    pciebus-howto
+   pci-iov-howto
 
 Todolist:
 
-   pci-iov-howto
+
    msi-howto
    sysfs-pci
    acpi-info
diff --git a/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
new file mode 100644
index 000000000000..fbc83dfdcead
--- /dev/null
+++ b/Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/PCI/pci-iov-howto.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_pci-iov-howto:
+
+==========================
+PCI Express I/O 虚拟化指南
+==========================
+
+:版权: |copy| 2009 Intel Corporation
+:作者: - Yu Zhao <yu.zhao@intel.com>
+          - Donald Dutile <ddutile@redhat.com>
+
+概述
+====
+
+什么是SR-IOV
+------------
+
+单根I/O虚拟化（SR-IOV）是一种PCI Express扩展功能，它使一个物理设备显示为多个
+虚拟设备。物理设备被称为物理功能（PF），而虚拟设备被称为虚拟功能（VF）。VF的分
+配可以由PF通过封装在该功能中的寄存器动态控制。默认情况下，该功能未被启用，PF表
+现为传统的PCIe设备。一旦开启，每个VF的PCI配置空间都可以通过自己的总线、设备和
+功能编号（路由ID）来访问。而且每个VF也有PCI内存空间，用于映射其寄存器集。VF设
+备驱动程序对寄存器集进行操作，这样它就可以发挥功能，并作为一个真正的现有PCI设备
+出现。
+
+使用指南
+========
+
+我怎样才能启用SR-IOV功能
+------------------------
+
+有多种方法可用于SR-IOV的启用。在第一种方法中，设备驱动（PF驱动）将通过SR-IOV
+核心提供的API控制功能的启用和禁用。如果硬件具有SR-IOV能力，加载其PF驱动器将启
+用它和与PF相关的所有VF。一些PF驱动需要设置一个模块参数，以确定要启用的VF的数量。
+在第二种方法中，对sysfs文件sriov_numvfs的写入将启用和禁用与PCIe PF相关的VF。
+这种方法实现了每个PF的VF启用/禁用值，而第一种方法则适用于同一设备的所有PF。此外，
+PCI SRIOV核心支持确保启用/禁用操作是有效的，以减少同一检查在多个驱动程序中的重
+复，例如，如果启用VF，检查numvfs == 0，确保numvfs <= totalvfs。
+第二种方法是对新的/未来的VF设备的推荐方法。
+
+我怎样才能使用虚拟功能
+----------------------
+
+在内核中，VF被视为热插拔的PCI设备，所以它们应该能够以与真正的PCI设备相同的方式
+工作。VF需要的设备驱动与普通PCI设备的驱动相同。
+
+开发者指南
+==========
+
+SR-IOV API
+----------
+
+用来开启SR-IOV功能:
+
+(a) 对于第一种方法，在驱动程序中::
+
+	int pci_enable_sriov(struct pci_dev *dev, int nr_virtfn);
+
+nr_virtfn'是要启用的VF的编号。
+
+(b) 对于第二种方法，从sysfs::
+
+	echo 'nr_virtfn' > \
+        /sys/bus/pci/devices/<DOMAIN:BUS:DEVICE.FUNCTION>/sriov_numvfs
+
+用来关闭SR-IOV功能:
+
+(a) 对于第一种方法，在驱动程序中::
+
+	void pci_disable_sriov(struct pci_dev *dev);
+
+(b) 对于第二种方法，从sysfs::
+
+	echo  0 > \
+        /sys/bus/pci/devices/<DOMAIN:BUS:DEVICE.FUNCTION>/sriov_numvfs
+
+要想通过主机上的兼容驱动启用自动探测VF，在启用SR-IOV功能之前运行下面的命令。这
+是默认的行为。
+::
+
+	echo 1 > \
+        /sys/bus/pci/devices/<DOMAIN:BUS:DEVICE.FUNCTION>/sriov_drivers_autoprobe
+
+要禁止主机上的兼容驱动自动探测VF，请在启用SR-IOV功能之前运行以下命令。更新这个
+入口不会影响已经被探测的VF。
+::
+
+	echo  0 > \
+        /sys/bus/pci/devices/<DOMAIN:BUS:DEVICE.FUNCTION>/sriov_drivers_autoprobe
+
+用例
+----
+
+下面的代码演示了SR-IOV API的用法
+::
+
+	static int dev_probe(struct pci_dev *dev, const struct pci_device_id *id)
+	{
+		pci_enable_sriov(dev, NR_VIRTFN);
+
+		...
+
+		return 0;
+	}
+
+	static void dev_remove(struct pci_dev *dev)
+	{
+		pci_disable_sriov(dev);
+
+		...
+	}
+
+	static int dev_suspend(struct pci_dev *dev, pm_message_t state)
+	{
+		...
+
+		return 0;
+	}
+
+	static int dev_resume(struct pci_dev *dev)
+	{
+		...
+
+		return 0;
+	}
+
+	static void dev_shutdown(struct pci_dev *dev)
+	{
+		...
+	}
+
+	static int dev_sriov_configure(struct pci_dev *dev, int numvfs)
+	{
+		if (numvfs > 0) {
+			...
+			pci_enable_sriov(dev, numvfs);
+			...
+			return numvfs;
+		}
+		if (numvfs == 0) {
+			....
+			pci_disable_sriov(dev);
+			...
+			return 0;
+		}
+	}
+
+	static struct pci_driver dev_driver = {
+		.name =		"SR-IOV Physical Function driver",
+		.id_table =	dev_id_table,
+		.probe =	dev_probe,
+		.remove =	dev_remove,
+		.suspend =	dev_suspend,
+		.resume =	dev_resume,
+		.shutdown =	dev_shutdown,
+		.sriov_configure = dev_sriov_configure,
+	};
-- 
2.27.0

