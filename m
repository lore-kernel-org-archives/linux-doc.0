Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6C4C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 21 Apr 2022 11:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354442AbiDUMB3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Apr 2022 08:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240811AbiDUMB2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Apr 2022 08:01:28 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C72A62ED53
        for <linux-doc@vger.kernel.org>; Thu, 21 Apr 2022 04:58:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.112.130])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx3xDnRmFiCT0rAA--.26786S4;
        Thu, 21 Apr 2022 19:58:35 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 2/2] docs/zh_CN: add vm numa translation
Date:   Thu, 21 Apr 2022 19:59:24 +0800
Message-Id: <c7e9fc1a99bbcc4f30c90f564983ee71ac566c4e.1650542165.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1650542165.git.siyanteng@loongson.cn>
References: <cover.1650542165.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx3xDnRmFiCT0rAA--.26786S4
X-Coremail-Antispam: 1UD129KBjvJXoW3Kw4fXF1rtry8WFyUAF1UWrg_yoWDtFWDpa
        y29ryfKw47Xrn8ZrykC348X3W0kFWxCa13K3Wkta48Xr9xJrWjk3yUta42qw1xXry8AFWk
        JrZ5CrW0kF1Iv3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l42xK82
        IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
        0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMI
        IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF
        0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
        Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUjNtxDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/numa.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 Documentation/translations/zh_CN/vm/numa.rst  | 101 ++++++++++++++++++
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/numa.rst

diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index 0839b2231548..a1c6d529b6ff 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -33,6 +33,7 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
    hugetlbfs_reserv
    memory-model
    mmu_notifier
+   numa
    overcommit-accounting
    page_frags
    page_owner
@@ -46,7 +47,6 @@ TODOLIST:
 * arch_pgtable_helpers
 * free_page_reporting
 * hugetlbfs_reserv
-* numa
 * page_migration
 * slub
 * transhuge
diff --git a/Documentation/translations/zh_CN/vm/numa.rst b/Documentation/translations/zh_CN/vm/numa.rst
new file mode 100644
index 000000000000..0469fa973922
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/numa.rst
@@ -0,0 +1,101 @@
+:Original: Documentation/vm/numa.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+始于1999年11月，作者： <kanoj@sgi.com>
+
+==========
+何为NUMA？
+==========
+
+这个问题可以从几个视角来回答：硬件观点和Linux软件视角。
+
+从硬件角度看，NUMA系统是一个由多个组件或装配组成的计算机平台，每个组件可能包含0个或更多的CPU、
+本地内存和/或IO总线。为了简洁起见，并将这些物理组件/装配的硬件视角与软件抽象区分开来，我们在
+本文中称这些组件/装配为“单元”。
+
+每个“单元”都可以看作是系统的一个SMP[对称多处理器]子集——尽管独立的SMP系统所需的一些组件可能
+不会在任何给定的单元上填充。NUMA系统的单元通过某种系统互连连接在一起——例如，交叉开关或点对点
+链接是NUMA系统互连的常见类型。这两种类型的互连都可以聚合起来，以创建NUMA平台，其中的单元与其
+他单元有多个距离。
+
+对于Linux，感兴趣的NUMA平台主要是所谓的缓存相干NUMA或ccNUMA系统。在ccNUMA系统中，所有的
+内存都是可见的，并且可以从连接到任何单元的任何CPU中访问，缓存一致性是由处理器缓存和/或系统互
+连在硬件中处理。
+
+内存访问时间和有效的内存带宽取决于包含CPU的单元或进行内存访问的IO总线距离包含目标内存的单元
+有多远。例如，连接到同一单元的CPU对内存的访问将比访问其他远程单元的内存经历更快的访问时间和
+更高的带宽。NUMA平台可以在与任何给定单元的多个远程距离上设置单元。
+
+平台供应商建立NUMA系统并不只是为了让软件开发人员的生活变得有趣。相反，这种架构是提供可扩展
+内存带宽的一种手段。然而，为了实现可扩展的内存带宽，系统和应用软件必须安排大部分的内存引用
+[cache misses]到“本地”内存——同一单元的内存，如果有的话——或者到最近的有内存的单元。
+
+这就自然而然有了Linux软件对NUMA系统的视角:
+
+Linux将系统的硬件资源划分为多个软件抽象，称为“节点”。Linux将节点映射到硬件平台的物理单元
+上，对一些架构的细节进行了抽象。与物理单元一样，软件节点可能包含0或更多的CPU、内存和/或IO
+总线。同样，对“较近”节点的内存访问——映射到较近单元的节点——通常会比对较远单元的访问经历更快
+的访问时间和更高的有效带宽。
+
+对于一些架构，如x86，Linux将“隐藏”任何代表没有内存连接的物理单元的节点，并将连接到该单元
+的任何CPU重新分配到代表有内存的单元的节点上。因此，在这些架构上，我们不能假设Linux将所有
+的CPU与一个给定的节点相关联，会看到相同的本地内存访问时间和带宽。
+
+此外，对于某些架构，同样以x86为例，Linux支持对额外节点的仿真。对于NUMA仿真，Linux会将现
+有的节点或者非NUMA平台的系统内存分割成多个节点。每个模拟的节点将管理底层单元物理内存的一部
+分。NUMA仿真对于在非NUMA平台上测试NUMA内核和应用功能是非常有用的，当与cpusets一起使用时，
+可以作为一种内存资源管理机制。[见 Documentation/admin-guide/cgroup-v1/cpusets.rst]
+
+对于每个有内存的节点，Linux构建了一个独立的内存管理子系统，有自己的空闲页列表、使用中页列表、
+使用统计和锁来调解访问。此外，Linux为每个内存区[DMA、DMA32、NORMAL、HIGH_MEMORY、MOVABLE
+中的一个或多个]构建了一个有序的“区列表”。zonelist指定了当一个选定的区/节点不能满足分配请求
+时要访问的区/节点。当一个区没有可用的内存来满足请求时，这种情况被称为“overflow 溢出”或
+“fallback 回退”。
+
+由于一些节点包含多个包含不同类型内存的区，Linux必须决定是否对区列表进行排序，使分配回退到不同
+节点上的相同区类型，或同一节点上的不同区类型。这是一个重要的考虑因素，因为有些区，如DMA或DMA32，
+代表了相对稀缺的资源。Linux选择了一个默认的Node ordered zonelist。这意味着在使用按NUMA距
+离排序的远程节点之前，它会尝试回退到同一节点的其他分区。
+
+默认情况下，Linux会尝试从执行请求的CPU被分配到的节点中满足内存分配请求。具体来说，Linux将试
+图从请求来源的节点的适当分区列表中的第一个节点进行分配。这被称为“本地分配”。如果“本地”节点不能
+满足请求，内核将检查所选分区列表中其他节点的区域，寻找列表中第一个能满足请求的区域。
+
+本地分配将倾向于保持对分配的内存的后续访问 “本地”的底层物理资源和系统互连——只要内核代表其分配
+一些内存的任务后来不从该内存迁移。Linux调度器知道平台的NUMA拓扑结构——体现在“调度域”数据结构
+中[见 Documentation/scheduler/sched-domains.rst]——并且调度器试图尽量减少任务迁移到遥
+远的调度域中。然而，调度器并没有直接考虑到任务的NUMA足迹。因此，在充分不平衡的情况下，任务可
+以在节点之间迁移，远离其初始节点和内核数据结构。
+
+系统管理员和应用程序设计者可以使用各种CPU亲和命令行接口，如taskset(1)和numactl(1)，以及程
+序接口，如sched_setaffinity(2)，来限制任务的迁移，以改善NUMA定位。此外，人们可以使用
+Linux NUMA内存策略修改内核的默认本地分配行为。 [见
+:ref:`Documentation/admin-guide/mm/numa_memory_policy.rst <numa_memory_policy>`].
+
+系统管理员可以使用控制组和CPUsets限制非特权用户在调度或NUMA命令和功能中可以指定的CPU和节点
+的内存。 [见 Documentation/admin-guide/cgroup-v1/cpusets.rst]
+
+在不隐藏无内存节点的架构上，Linux会在分区列表中只包括有内存的区域[节点]。这意味着对于一个无
+内存的节点，“本地内存节点”——CPU节点的分区列表中的第一个区域的节点——将不是节点本身。相反，它
+将是内核在建立分区列表时选择的离它最近的有内存的节点。所以，默认情况下，本地分配将由内核提供
+最近的可用内存来完成。这是同一机制的结果，该机制允许这种分配在一个包含内存的节点溢出时回退到
+其他附近的节点。
+
+一些内核分配不希望或不能容忍这种分配回退行为。相反，他们想确保他们从指定的节点获得内存，或者
+得到通知说该节点没有空闲内存。例如，当一个子系统分配每个CPU的内存资源时，通常是这种情况。
+
+一个典型的分配模式是使用内核的numa_node_id()或CPU_to_node()函数获得“当前CPU”所在节点的
+节点ID，然后只从返回的节点ID请求内存。当这样的分配失败时，请求的子系统可以恢复到它自己的回退
+路径。板块内核内存分配器就是这样的一个例子。或者，子系统可以选择在分配失败时禁用或不启用自己。
+内核分析子系统就是这样的一个例子。
+
+如果架构支持——不隐藏无内存节点，那么连接到无内存节点的CPU将总是产生回退路径的开销，或者一些
+子系统如果试图完全从无内存的节点分配内存，将无法初始化。为了透明地支持这种架构，内核子系统可
+以使用numa_mem_id()或cpu_to_mem()函数来定位调用或指定CPU的“本地内存节点”。同样，这是同
+一个节点，默认的本地页分配将从这个节点开始尝试。
-- 
2.27.0

