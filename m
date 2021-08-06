Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DCAC4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:58:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 181BB611C5
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbhHFC7N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:59:13 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44398 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230385AbhHFC7M (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Aug 2021 22:59:12 -0400
Received: from localhost.localdomain (unknown [223.106.24.69])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxwOJfpQxh198rAA--.1497S6;
        Fri, 06 Aug 2021 10:58:49 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, siyanteng01@gmail.com,
        chenweiguang82@126.com
Subject: [PATCH v4 4/8] docs/zh_CN: add infiniband opa_vnic translation
Date:   Fri,  6 Aug 2021 10:58:51 +0800
Message-Id: <828550a6fb7fded8172c123c37d4c643d2593e53.1628218477.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1628218477.git.siyanteng@loongson.cn>
References: <cover.1628218477.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxwOJfpQxh198rAA--.1497S6
X-Coremail-Antispam: 1UD129KBjvJXoW3Jr1ftF1UCryrAFW8tFWkZwb_yoW3Xr1rpr
        n3JryxW3WUJFy3ur18Wr4UJr1UJwn7Cw1UKFyktry8Xr1UAr1UJr1kGry8Ary7Gry8AryU
        JFy0yryDCr12gr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
        kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
        z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
        4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
        4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
        daVFxhVjvjDU0xZFpf9x0JUQFxUUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate Documentation/infiniband/opa_vnic.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Puyu Wang <realpuyuwang@gmail.com>
---
 .../translations/zh_CN/infiniband/index.rst   |   2 +-
 .../zh_CN/infiniband/opa_vnic.rst             | 156 ++++++++++++++++++
 2 files changed, 157 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/infiniband/opa_vnic.rst

diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index da5e2821f767..a933e3c6981d 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -24,10 +24,10 @@ infiniband
 
    core_locking
    ipoib
+   opa_vnic
 
 TODOLIST:
 
-   opa_vnic
    sysfs
    tag_matching
    user_mad
diff --git a/Documentation/translations/zh_CN/infiniband/opa_vnic.rst b/Documentation/translations/zh_CN/infiniband/opa_vnic.rst
new file mode 100644
index 000000000000..12b147fbf792
--- /dev/null
+++ b/Documentation/translations/zh_CN/infiniband/opa_vnic.rst
@@ -0,0 +1,156 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/infiniband/opa_vnic.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+ 王普宇 Puyu Wang <realpuyuwang@gmail.com>
+ 时奎亮 Alex Shi <alexs@kernel.org>
+
+.. _cn_infiniband_opa_vnic:
+
+=============================================
+英特尔全路径（OPA）虚拟网络接口控制器（VNIC）
+=============================================
+
+英特尔全路径（OPA）虚拟网络接口控制器（VNIC）功能通过封装HFI节点之间的以
+太网数据包，支持Omni-Path结构上的以太网功能。
+
+体系结构
+========
+
+Omni-Path封装的以太网数据包的交换模式涉及Omni-Path结构拓扑上覆盖的一个或
+多个虚拟以太网交换机。Omni-Path结构上的HFI节点的一个子集被允许在特定的虚
+拟以太网交换机上交换封装的以太网数据包。虚拟以太网交换机是通过配置结构上的
+HFI节点实现的逻辑抽象，用于生成和处理报头。在最简单的配置中，整个结构的所有
+HFI节点通过一个虚拟以太网交换机交换封装的以太网数据包。一个虚拟以太网交换机，
+实际上是一个独立的以太网网络。该配置由以太网管理器（EM）执行，它是可信的结
+构管理器（FM）应用程序的一部分。HFI节点可以有多个VNIC，每个连接到不同的虚
+拟以太网交换机。下图介绍了两个虚拟以太网交换机与两个HFI节点的情况::
+
+                               +-------------------+
+                               |      子网/        |
+                               |     以太网        |
+                               |      管理         |
+                               +-------------------+
+                                  /          /
+                                /           /
+                              /            /
+                            /             /
+  +-----------------------------+  +------------------------------+
+  |     虚拟以太网切换          |  |      虚拟以太网切换          |
+  |  +---------+    +---------+ |  | +---------+    +---------+   |
+  |  | VPORT   |    |  VPORT  | |  | |  VPORT  |    |  VPORT  |   |
+  +--+---------+----+---------+-+  +-+---------+----+---------+---+
+           |                 \        /                 |
+           |                   \    /                   |
+           |                     \/                     |
+           |                    /  \                    |
+           |                  /      \                  |
+       +-----------+------------+  +-----------+------------+
+       |   VNIC    |    VNIC    |  |    VNIC   |    VNIC    |
+       +-----------+------------+  +-----------+------------+
+       |          HFI           |  |          HFI           |
+       +------------------------+  +------------------------+
+
+
+Omni-Path封装的以太网数据包格式如下所述。
+
+==================== ================================
+位                   域
+==================== ================================
+Quad Word 0:
+0-19                 SLID (低20位)
+20-30                长度 (以四字为单位)
+31                   BECN 位
+32-51                DLID (低20位)
+52-56                SC (服务级别)
+57-59                RC (路由控制)
+60                   FECN 位
+61-62                L2 (=10, 16B 格式)
+63                   LT (=1, 链路传输头 Flit)
+
+Quad Word 1:
+0-7                  L4 type (=0x78 ETHERNET)
+8-11                 SLID[23:20]
+12-15                DLID[23:20]
+16-31                PKEY
+32-47                熵
+48-63                保留
+
+Quad Word 2:
+0-15                 保留
+16-31                L4 头
+32-63                以太网数据包
+
+Quad Words 3 to N-1:
+0-63                 以太网数据包 (pad拓展)
+
+Quad Word N (last):
+0-23                 以太网数据包 (pad拓展)
+24-55                ICRC
+56-61                尾
+62-63                LT (=01, 链路传输尾 Flit)
+==================== ================================
+
+以太网数据包在传输端被填充，以确保VNIC OPA数据包是四字对齐的。“尾”字段
+包含填充的字节数。在接收端，“尾”字段被读取，在将数据包向上传递到网络堆
+栈之前，填充物被移除（与ICRC、尾和OPA头一起）。
+
+L4头字段包含VNIC端口所属的虚拟以太网交换机ID。在接收端，该字段用于将收
+到的VNIC数据包去多路复用到不同的VNIC端口。
+
+驱动设计
+========
+
+英特尔OPA VNIC的软件设计如下图所示。OPA VNIC功能有一个依赖于硬件的部分
+和一个独立于硬件的部分。
+
+对IB设备分配和释放RDMA netdev设备的支持已经被加入。RDMA netdev支持与
+网络堆栈的对接，从而创建标准的网络接口。OPA_VNIC是一个RDMA netdev设备
+类型。
+
+依赖于HW的VNIC功能是HFI1驱动的一部分。它实现了分配和释放OPA_VNIC RDMA
+netdev的动作。它涉及VNIC功能的HW资源分配/管理。它与网络堆栈接口并实现所
+需的net_device_ops功能。它在传输路径中期待Omni-Path封装的以太网数据包，
+并提供对它们的HW访问。在将数据包向上传递到网络堆栈之前，它把Omni-Path头
+从接收的数据包中剥离。它还实现了RDMA netdev控制操作。
+
+OPA VNIC模块实现了独立于硬件的VNIC功能。它由两部分组成。VNIC以太网管理
+代理（VEMA）作为一个IB客户端向IB核心注册，并与IB MAD栈接口。它与以太网
+管理器（EM）和VNIC netdev交换管理信息。VNIC netdev部分分配和释放OPA_VNIC
+RDMA netdev设备。它在需要时覆盖由依赖HW的VNIC驱动设置的net_device_ops函数，
+以适应任何控制操作。它还处理以太网数据包的封装，在传输路径中使用Omni-Path头。
+对于每个VNIC接口，封装所需的信息是由EM通过VEMA MAD接口配置的。它还通过调用
+RDMA netdev控制操作将任何控制信息传递给依赖于HW的驱动程序::
+
+        +-------------------+ +----------------------+
+        |                   | |       Linux          |
+        |     IB MAD        | |       网络           |
+        |                   | |       栈             |
+        +-------------------+ +----------------------+
+                 |               |          |
+                 |               |          |
+        +----------------------------+      |
+        |                            |      |
+        |      OPA VNIC 模块         |      |
+        |  (OPA VNIC RDMA Netdev     |      |
+        |     & EMA 函数)            |      |
+        |                            |      |
+        +----------------------------+      |
+                    |                       |
+                    |                       |
+           +------------------+             |
+           |     IB 核心      |             |
+           +------------------+             |
+                    |                       |
+                    |                       |
+        +--------------------------------------------+
+        |                                            |
+        |      HFI1 驱动和 VNIC 支持                 |
+        |                                            |
+        +--------------------------------------------+
-- 
2.27.0

