Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B31AC4320A
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 13:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6457D610D1
	for <linux-doc@archiver.kernel.org>; Sun,  1 Aug 2021 13:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbhHANcg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 1 Aug 2021 09:32:36 -0400
Received: from mail.loongson.cn ([114.242.206.163]:32858 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231985AbhHANce (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Aug 2021 09:32:34 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX0NYogZhYe8nAA--.27721S6;
        Sun, 01 Aug 2021 21:32:13 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 4/8] docs/zh_CN: add virt ne_overview translation
Date:   Sun,  1 Aug 2021 21:32:28 +0800
Message-Id: <c91dfdbdaa44e743cc3ce6becdf882060e95524b.1627823347.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1627823347.git.siyanteng@loongson.cn>
References: <cover.1627823347.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxX0NYogZhYe8nAA--.27721S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww1rCw4UAF4kZF15Kr1DGFg_yoWxCFWxpF
        yDCF97Kw1xAF92qrZak3WUZF1fJFn7XFW7Ga1kZw13Zry7J3y0vw4UKFyrtr9rZryrCF9r
        XF429FZ2k34Fyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
        1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j
        6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7V
        C0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j
        6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
        8vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
        F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
        ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
        xVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        W8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7V
        UbmZX7UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/virt/ne_overview.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/virt/index.rst         |  2 +-
 .../translations/zh_CN/virt/ne_overview.rst   | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/ne_overview.rst

diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
index b94f6a3c2257..8e7713163962 100644
--- a/Documentation/translations/zh_CN/virt/index.rst
+++ b/Documentation/translations/zh_CN/virt/index.rst
@@ -22,12 +22,12 @@ Linux虚拟化支持
 
    paravirt_ops
    guest-halt-polling
+   ne_overview
 
 TODOLIST:
 
    kvm/index
    uml/user_mode_linux_howto_v2
-   ne_overview
    acrn/index
 
 .. only:: html and subproject
diff --git a/Documentation/translations/zh_CN/virt/ne_overview.rst b/Documentation/translations/zh_CN/virt/ne_overview.rst
new file mode 100644
index 000000000000..2455b371abea
--- /dev/null
+++ b/Documentation/translations/zh_CN/virt/ne_overview.rst
@@ -0,0 +1,88 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/virt/ne_overview.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_virt_ne_overview:
+
+==============
+Nitro Enclaves
+==============
+
+概述
+====
+
+Nitro Enclaves（NE）是亚马逊弹性计算云（EC2）的一项新功能，允许客户在EC2实
+例中划分出孤立的计算环境[1]。
+
+例如，一个处理敏感数据并在虚拟机中运行的应用程序，可以与在同一虚拟机中运行的
+其他应用程序分开。然后，这个应用程序在一个独立于主虚拟机的虚拟机中运行，即
+enclave。
+
+一个enclave与催生它的虚拟机一起运行。这种设置符合低延迟应用的需要。为enclave
+分配的资源，如内存和CPU，是从主虚拟机中分割出来的。每个enclave都被映射到一
+个运行在主虚拟机中的进程，该进程通过一个ioctl接口与NE驱动进行通信。
+
+在这个意义上，有两个组成部分。
+
+1. 一个enclave抽象进程——一个运行在主虚拟机客体中的用户空间进程，它使用NE驱动
+提供的ioctl接口来生成一个enclave虚拟机（这就是下面的2）。
+
+有一个NE模拟的PCI设备暴露给主虚拟机。这个新的PCI设备的驱动被包含在NE驱动中。
+
+ioctl逻辑被映射到PCI设备命令，例如，NE_START_ENCLAVE ioctl映射到一个enclave
+启动PCI命令。然后，PCI设备命令被翻译成在管理程序方面采取的行动；也就是在运
+行主虚拟机的主机上运行的Nitro管理程序。Nitro管理程序是基于KVM核心技术的。
+
+2. enclave本身——一个运行在与催生它的主虚拟机相同的主机上的虚拟机。内存和CPU
+从主虚拟机中分割出来，专门用于enclave虚拟机。enclave没有连接持久性存储。
+
+从主虚拟机中分割出来并给enclave的内存区域需要对齐2 MiB/1 GiB物理连续的内存
+区域（或这个大小的倍数，如8 MiB）。该内存可以通过使用hugetlbfs从用户空间分
+配[2][3]。一个enclave的内存大小需要至少64 MiB。enclave内存和CPU需要来自同
+一个NUMA节点。
+
+一个enclave在专用的核心上运行。CPU 0及其同级别的CPU需要保持对主虚拟机的可用
+性。CPU池必须由具有管理能力的用户为NE目的进行设置。关于CPU池的格式，请看内核
+文档[4]中的cpu list部分。
+
+enclave通过本地通信通道与主虚拟机进行通信，使用virtio-vsock[5]。主虚拟机有
+virtio-pci vsock模拟设备，而飞地虚拟机有virtio-mmio vsock模拟设备。vsock
+设备使用eventfd作为信令。enclave虚拟机看到通常的接口——本地APIC和IOAPIC——从
+virtio-vsock设备获得中断。virtio-mmio设备被放置在典型的4 GiB以下的内存中。
+
+在enclave中运行的应用程序需要和将在enclave虚拟机中运行的操作系统（如内核、
+ramdisk、init）一起被打包到enclave镜像中。enclave虚拟机有自己的内核并遵循标
+准的Linux启动协议[6]。
+
+内核bzImage、内核命令行、ramdisk（s）是enclave镜像格式（EIF）的一部分；另外
+还有一个EIF头，包括元数据，如magic number、eif版本、镜像大小和CRC。
+
+哈希值是为整个enclave镜像（EIF）、内核和ramdisk（s）计算的。例如，这被用来检
+查在enclave虚拟机中加载的enclave镜像是否是打算运行的那个。
+
+这些加密测量包括在由Nitro超级管理器成的签名证明文件中，并进一步用来证明enclave
+的身份；KMS是NE集成的服务的一个例子，它检查证明文件。
+
+enclave镜像（EIF）被加载到enclave内存中，偏移量为8 MiB。enclave中的初始进程
+连接到主虚拟机的vsock CID和一个预定义的端口--9000，以发送一个心跳值--0xb7。这
+个机制用于在主虚拟机中检查enclave是否已经启动。主虚拟机的CID是3。
+
+如果enclave虚拟机崩溃或优雅地退出，NE驱动会收到一个中断事件。这个事件会通过轮询
+通知机制进一步发送到运行在主虚拟机中的用户空间enclave进程。然后，用户空间enclave
+进程就可以退出了。
+
+[1] https://aws.amazon.com/ec2/nitro/nitro-enclaves/
+[2] https://www.kernel.org/doc/html/latest/admin-guide/mm/hugetlbpage.html
+[3] https://lwn.net/Articles/807108/
+[4] https://www.kernel.org/doc/html/latest/admin-guide/kernel-parameters.html
+[5] https://man7.org/linux/man-pages/man7/vsock.7.html
+[6] https://www.kernel.org/doc/html/latest/x86/boot.html
-- 
2.27.0

