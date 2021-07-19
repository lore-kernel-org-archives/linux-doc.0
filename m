Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2D9C12002
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29DFD61166
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 09:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235217AbhGSJCD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 05:02:03 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39444 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235214AbhGSJCD (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Jul 2021 05:02:03 -0400
Received: from localhost.localdomain (unknown [112.20.113.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz0LvSPVghpEhAA--.19840S6;
        Mon, 19 Jul 2021 17:42:30 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 4/8] docs/zh_CN: add virt ne_overview translation
Date:   Mon, 19 Jul 2021 17:42:51 +0800
Message-Id: <916e57df9715066da2551a00e22dc0d23b04067c.1626687013.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1626687013.git.siyanteng@loongson.cn>
References: <cover.1626687013.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz0LvSPVghpEhAA--.19840S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww18Cr43Zr17tryUCw4UJwb_yoWxCr1xpF
        yDCF97Kw1xCF92qrZak3WUXF1fAFn7XFW7Ga1kZw13Zry7J3y0vw4UKFy5tr9rZryrCF9r
        XF42gFZ2k34Fyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
        3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUjXAw3UUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/core-api/ne_overview.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/virt/index.rst         |  2 +-
 .../translations/zh_CN/virt/ne_overview.rst   | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/virt/ne_overview.rst

diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
index 1c602b8638f5..a71e9a4355cc 100644
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
index 000000000000..6d3ad33de889
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
+
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
+这些加密测量包括在由Nitro管理平台成的签名证明文件中，并进一步用来证明enclave
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

