Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1972EC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 22 Dec 2021 13:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231953AbhLVNnz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Dec 2021 08:43:55 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:15966 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhLVNnz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Dec 2021 08:43:55 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JJvbc2XwZzZdjB;
        Wed, 22 Dec 2021 21:40:44 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 22 Dec 2021 21:43:53 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 22 Dec
 2021 21:43:52 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2] docs/zh_CN: Add sched-domains translation
Date:   Wed, 22 Dec 2021 22:11:31 +0800
Message-ID: <20211222141131.10134-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/sched-domains.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
v2:
1. Add Yangteng as proofreader.
2. Take Yangteng's advice.

 .../translations/zh_CN/scheduler/index.rst    |  2 +-
 .../zh_CN/scheduler/sched-domains.rst         | 72 +++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-domains.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index 5327c61cb0ab..f8f8f35d53c7 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -21,6 +21,7 @@ Linux调度器
     sched-arch
     sched-bwc
     sched-design-CFS
+    sched-domains
     sched-capacity
 
 
@@ -28,7 +29,6 @@ TODOList:
 
     sched-bwc
     sched-deadline
-    sched-domains
     sched-energy
     sched-nice-design
     sched-rt-group
diff --git a/Documentation/translations/zh_CN/scheduler/sched-domains.rst b/Documentation/translations/zh_CN/scheduler/sched-domains.rst
new file mode 100644
index 000000000000..e814d4c01141
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-domains.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/sched-domains.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+:校译:
+
+  司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+======
+调度域
+======
+
+每个CPU有一个“基”调度域（struct sched_domain）。调度域层次结构从基调度域构建而来，可
+通过->parent指针自下而上遍历。->parent必须以NULL结尾，调度域结构体必须是per-CPU的，
+因为它们无锁更新。
+
+每个调度域管辖数个CPU（存储在->span字段中）。一个调度域的span必须是它的子调度域span的
+超集（如有需求出现，这个限制可以放宽）。CPU i的基调度域必须至少管辖CPU i。每个CPU的
+顶层调度域通常将会管辖系统中的全部CPU，尽管严格来说这不是必须的，假如是这样，会导致某些
+CPU出现永远不会被指定任务运行的情况，直到允许的CPU掩码被显式设定。调度域的span字段意味
+着“在这些CPU中做进程负载均衡”。
+
+每个调度域必须具有一个或多个CPU调度组（struct sched_group），它们以单向循环链表的形式
+组织，存储在->groups指针中。这些组的CPU掩码的并集必须和调度域span字段一致。->groups
+指针指向的这些组包含的CPU，必须被调度域管辖。组包含的是只读数据，被创建之后，可能被多个
+CPU共享。任意两个组的CPU掩码的交集不一定为空，如果是这种情况，对应调度域的SD_OVERLAP
+标志位被设置，它管辖的调度组可能不能在多个CPU中共享。
+
+调度域中的负载均衡发生在调度组中。也就是说，每个组被视为一个实体。组的负载被定义为它
+管辖的每个CPU的负载之和。仅当组的负载不均衡后，任务才在组之间发生迁移。
+
+在kernel/sched/core.c中，trigger_load_balance()在每个CPU上通过scheduler_tick()
+周期执行。在当前运行队列下一个定期调度再平衡事件到达后，它引发一个软中断。负载均衡真正
+的工作由run_rebalance_domains()->rebalance_domains()完成，在软中断上下文中执行
+（SCHED_SOFTIRQ）。
+
+后一个函数有两个入参：当前CPU的运行队列、它在scheduler_tick()调用时是否空闲。函数会从
+当前CPU所在的基调度域开始迭代执行，并沿着parent指针链向上进入更高层级的调度域。在迭代
+过程中，函数会检查当前调度域是否已经耗尽了再平衡的时间间隔，如果是，它在该调度域运行
+load_balance()。接下来它检查父调度域（如果存在），再后来父调度域的父调度域，以此类推。
+
+起初，load_balance()查找当前调度域中最繁忙的调度组。如果成功，在该调度组管辖的全部CPU
+的运行队列中找出最繁忙的运行队列。如能找到，对当前的CPU运行队列和新找到的最繁忙运行
+队列均加锁，并把任务从最繁忙队列中迁移到当前CPU上。被迁移的任务数量等于在先前迭代执行
+中计算出的该调度域的调度组的不均衡值。
+
+实现调度域
+==========
+
+基调度域会管辖CPU层次结构中的第一层。对于超线程（SMT）而言，基调度域将会管辖同一个物理
+CPU的全部虚拟CPU，每个虚拟CPU对应一个调度组。
+
+在SMP中，基调度域的父调度域将会管辖同一个结点中的全部物理CPU，每个调度组对应一个物理CPU。
+接下来，如果是非统一内存访问（NUMA）系统，SMP调度域的父调度域将管辖整个机器，一个结点的
+CPU掩码对应一个调度组。亦或，你可以使用多级NUMA；举例来说Opteron处理器，可能仅用一个
+调度域来覆盖它的一个NUMA层级。
+
+实现者需要阅读include/linux/sched/sd_flags.h的注释：读SD_*来了解具体情况以及调度域的
+SD标志位调节了哪些东西。
+
+体系结构可以把指定的拓扑层级的通用调度域构建器和默认的SD标志位覆盖掉，方法是创建一个
+sched_domain_topology_level数组，并以该数组作为入参调用set_sched_topology()。
+
+调度域调试基础设施可以通过CONFIG_SCHED_DEBUG开启，并在开机启动命令行中增加
+“sched_verbose”。如果你忘记调整开机启动命令行了，也可以打开
+/sys/kernel/debug/sched/verbose开关。这将开启调度域错误检查的解析，它应该能捕获（上文
+描述过的）绝大多数错误，同时以可视化格式打印调度域的结构。
-- 
2.17.1

