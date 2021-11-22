Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044DDC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 22 Nov 2021 07:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbhKVHoL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Nov 2021 02:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbhKVHoK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Nov 2021 02:44:10 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931C5C061574
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:04 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id b11so13306155pld.12
        for <linux-doc@vger.kernel.org>; Sun, 21 Nov 2021 23:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qRHKexnO8YLKOY4awmgEPDGFCvNot7AKsxzFNhoZc8Q=;
        b=NBowu4bw3g7d17s7HtPXM4HRekt2ACgXMj+bVE2LZ+53snf9NrirQaD3yxChxG/hoB
         etDGhUX70hMAt1ZWRs/7n3nnlLr0nWmvoSrblEDnZRgxNWHIJUi4PzF7AvABee1n8G07
         gCxWZ+QdcbWt/zigazp+z3dUP4sj2qOVK5XIfptpa6z0TFEDqjlqgyW50pQvxWLDd+Tj
         HVQexbyK3dW2N5oXuASo92uyU+Q7kc+whDK4TL+cbjIaPWOMEGuIPdRy4IfstFvcDONF
         uPTlDvCg7iad9U+cy56JizLVXeZxUTGSs6tJuoycRXqcsYUrj3uItYPxMwWR9wSV6R5s
         WvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRHKexnO8YLKOY4awmgEPDGFCvNot7AKsxzFNhoZc8Q=;
        b=qJMUFkgMJWZIEvcXOT1kmwwN1p4psL9qPIzxMqkRpw4I27KIjPoQnCkZtKovo2FQmw
         NjBBKFaa/A6ud2TMl52yYEsWJKBaH0I2YLqV5PWgDXCcw+95KQfl23A7KnsQsB1LwrOo
         GqW35PBO7ESfsoYOZrDXiWA8K8AN2DznLZOGiZZDOMAjGvskj7VLuPSaLPtAv7Ic1AVD
         kxm74ehhwUS6MgscQRyqs5M/AgnwZPy5yNTFPfRQv161postG0qKDcbWu5QtpDcFmwGd
         sWGy0aDy2io20Q2TvqSexwGGipJX0FxpXz7q0XanVEQWz9pB2ZE7QzosKuetpg5KKnfu
         Nmwg==
X-Gm-Message-State: AOAM530zOjwVS4EyRHGGFVN/0/4LG8nUJHeMEKRxMsnxogxqnjXxTXsu
        6HD0vx7ijDpqVk0Ifbil9cU=
X-Google-Smtp-Source: ABdhPJxgSyFVTpnJDG5x1YcLyLGnKGfwyZdWsEpIJjOeQ+GG3i9SUBnsbr1rfEioIQhmbSZZYJrUIA==
X-Received: by 2002:a17:90b:1a87:: with SMTP id ng7mr28842103pjb.86.1637566863947;
        Sun, 21 Nov 2021 23:41:03 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id b6sm7900314pfm.170.2021.11.21.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 23:41:03 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 2/2] docs/zh_CN: add sysfs-pci trnaslation
Date:   Mon, 22 Nov 2021 15:39:50 +0800
Message-Id: <698f01f597e2980c5adae9798cee2a42c6e2e015.1637565137.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1637565137.git.siyanteng@loongson.cn>
References: <cover.1637565137.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../PCI/sysfs-pci.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/PCI/index.rst          |   2 +-
 .../translations/zh_CN/PCI/sysfs-pci.rst      | 128 ++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/sysfs-pci.rst

diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentation/translations/zh_CN/PCI/index.rst
index 7e2c830b0148..16acb2bd9b58 100644
--- a/Documentation/translations/zh_CN/PCI/index.rst
+++ b/Documentation/translations/zh_CN/PCI/index.rst
@@ -25,11 +25,11 @@ Linux PCI总线子系统
    pciebus-howto
    pci-iov-howto
    msi-howto
+   sysfs-pci
 
 
 Todolist:
 
-   sysfs-pci
    acpi-info
    pci-error-recovery
    pcieaer-howto
diff --git a/Documentation/translations/zh_CN/PCI/sysfs-pci.rst b/Documentation/translations/zh_CN/PCI/sysfs-pci.rst
new file mode 100644
index 000000000000..6fe6e8871219
--- /dev/null
+++ b/Documentation/translations/zh_CN/PCI/sysfs-pci.rst
@@ -0,0 +1,128 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/PCI/sysfs-pci.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_PCI_sysfs-pci.rst:
+
+========================
+通过sysfs访问PCI设备资源
+========================
+
+sysfs，通常挂载在/sys，在支持它的平台上提供对PCI资源的访问。例如，一个特定的总线可能看起
+来像这样::
+
+     /sys/devices/pci0000:17
+     |-- 0000:17:00.0
+     |   |-- class
+     |   |-- config
+     |   |-- device
+     |   |-- enable
+     |   |-- irq
+     |   |-- local_cpus
+     |   |-- remove
+     |   |-- resource
+     |   |-- resource0
+     |   |-- resource1
+     |   |-- resource2
+     |   |-- revision
+     |   |-- rom
+     |   |-- subsystem_device
+     |   |-- subsystem_vendor
+     |   `-- vendor
+     `-- ...
+
+最上面的元素描述了PCI域和总线号码。在这种情况下，域号是0000，总线号是17（两个值都是十六进制）。
+这个总线在0号插槽中包含一个单一功能的设备。为了方便起见，我们复制了域和总线的编号。在设备目录
+下有几个文件，每个文件都有自己的功能。
+
+       =================== =====================================================
+       文件		           功能
+       =================== =====================================================
+       class		       PCI级别 (ascii, ro)
+       config		       PCI配置空间 (binary, rw)
+       device		       PCI设备 (ascii, ro)
+       enable	           设备是否被启用 (ascii, rw)
+       irq		           IRQ编号 (ascii, ro)
+       local_cpus	       临近CPU掩码(cpumask, ro)
+       remove		       从内核的列表中删除设备 (ascii, wo)
+       resource		       PCI资源主机地址 (ascii, ro)
+       resource0..N	       PCI资源N，如果存在的话 (binary, mmap, rw\ [1]_)
+       resource0_wc..N_wc  PCI WC映射资源N，如果可预取的话 (binary, mmap)
+       revision		       PCI修订版 (ascii, ro)
+       rom		           PCI ROM资源，如果存在的话 (binary, ro)
+       subsystem_device	   PCI子系统设备 (ascii, ro)
+       subsystem_vendor	   PCI子系统供应商 (ascii, ro)
+       vendor		       PCI供应商 (ascii, ro)
+       =================== =====================================================
+
+::
+
+  ro - 只读文件
+  rw - 文件是可读和可写的
+  wo - 只写文件
+  mmap - 文件是可移动的
+  ascii - 文件包含ascii文本
+  binary - 文件包含二进制数据
+  cpumask - 文件包含一个cpumask类型的
+
+.. [1] rw 仅适用于 IORESOURCE_IO（I/O 端口）区域
+
+只读文件是信息性的，对它们的写入将被忽略，但 "rom "文件除外。可写文件可以用来在设备上执
+行操作（例如，改变配置空间，分离设备）。 mmapable文件可以通过偏移量为0的文件的mmap获得，
+可以用来从用户空间进行实际的设备编程。注意，有些平台不支持某些资源的mmapping，所以一定要
+检查任何尝试的mmap的返回值。其中最值得注意的是I/O端口资源，它也提供读/写访问。
+
+enable "文件提供了一个计数器，表明设备已经被启用了多少次。如果'enable'文件目前返回'4'，
+而一个'1'被呼入它，它将返回'5'。向它呼入一个'0'会减少计数。不过，即使它返回到0，一些初始
+化可能也不会被逆转。
+
+rom "文件很特别，因为它提供了对设备ROM文件的只读访问，如果有的话。然而，它在默认情况下是
+禁用的，所以应用程序应该在尝试读取调用之前将字符串 "1 "写入该文件以启用它，并在访问之后将
+"0 "写入该文件以禁用它。请注意，设备必须被启用，才能成功返回数据。如果驱动没有被绑定到设备
+上，可以使用上面提到的 "enable "文件将其启用。
+
+remove "文件是用来移除PCI设备的，通过向该文件写入一个非零的整数。这并不涉及任何形式的热插
+拔功能，例如关闭设备的电源。该设备被从内核的PCI设备列表中移除，它的sysfs目录被移除，并且该
+设备将被从任何连接到它的驱动程序中移除。移除PCI根总线是不允许的。
+
+通过sysfs访问原有资源
+---------------------
+
+如果底层平台支持的话，传统的I/O端口和ISA内存资源也会在sysfs中提供。它们位于PCI类的层次结构
+中，例如::
+
+	/sys/class/pci_bus/0000:17/
+	|-- bridge -> ../../../devices/pci0000:17
+	|-- cpuaffinity
+	|-- legacy_io
+	`-- legacy_mem
+
+legacy_io文件是一个读/写文件，可以被应用程序用来做传统的端口I/O。应用程序应该打开该文件，寻
+找所需的端口（例如0x3e8），并进行1、2或4字节的读或写。legacy_mem文件应该被mmapped，其偏移
+量与所需的内存偏移量相对应，例如0xa0000用于VGA帧缓冲器。然后，应用程序可以简单地解除引用返回
+的指针（当然是在检查了错误之后）来访问遗留内存空间。
+
+支持新平台上的PCI访问
+---------------------
+
+为了支持上述的PCI资源映射，Linux平台代码最好定义ARCH_GENERIC_PCI_MMAP_RESOURCE并使用该
+功能的通用实现。为了支持通过/proc/bus/pci中的文件实现mmap()的历史接口，平台也可以设置
+HAVE_PCI_MMAP。
+
+另外，设置了 HAVE_PCI_MMAP 的平台可以提供他们自己的 pci_mmap_page_range() 实现，而不是定
+义 ARCH_GENERIC_PCI_MMAP_RESOURCE。
+
+支持PCI资源的写组合映射的平台必须定义arch_can_pci_mmap_wc()，当写组合被允许时，在运行时应
+评估为非零。支持I/O资源映射的平台同样定义arch_can_pci_mmap_io()。
+
+遗留资源由HAVE_PCI_LEGACY定义保护。希望支持遗留功能的平台应该定义它并提供 pci_legacy_read,
+pci_legacy_write 和 pci_mmap_legacy_page_range 函数。
-- 
2.27.0

