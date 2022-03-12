Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF04C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 12 Mar 2022 06:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbiCLGzx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Mar 2022 01:55:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiCLGzw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Mar 2022 01:55:52 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B05CA246F50
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 22:54:46 -0800 (PST)
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4KFthc1jfFz1GC02;
        Sat, 12 Mar 2022 14:49:52 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Sat, 12 Mar 2022 14:54:44 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Sat, 12 Mar
 2022 14:54:44 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH] docs/zh_CN: Add sched-nice-design Chinese translation
Date:   Sat, 12 Mar 2022 15:26:42 +0800
Message-ID: <20220312072642.23118-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate scheduler/sched-nice-design.rst into Chinese.

Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 .../translations/zh_CN/scheduler/index.rst    |  2 +-
 .../zh_CN/scheduler/sched-nice-design.rst     | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/sched-nice-design.rst

diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index c020f8382785..12bf3bd02ccf 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -25,12 +25,12 @@ Linux调度器
     sched-domains
     sched-capacity
     sched-energy
+    sched-nice-design
     sched-stats
 
 TODOList:
 
     sched-deadline
-    sched-nice-design
     sched-rt-group
 
     text_files
diff --git a/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst b/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst
new file mode 100644
index 000000000000..9107f0c0b979
--- /dev/null
+++ b/Documentation/translations/zh_CN/scheduler/sched-nice-design.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scheduler/sched-nice-design.rst
+
+:翻译:
+
+  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
+
+=====================
+调度器nice值设计
+=====================
+
+本文档解释了新的Linux调度器中修改和精简后的nice级别的实现思路。
+
+Linux的nice级别总是非常脆弱，人们持续不断地缠着我们，让nice +19的任务占用
+更少的CPU时间。
+
+不幸的是，在旧的调度器中，这不是那么容易实现的（否则我们早就做到了），因为对
+nice级别的支持在历史上是与时间片长度耦合的，而时间片单位是由HZ滴答驱动的，
+所以最小的时间片是1/HZ。
+
+在O(1)调度器中（2003年），我们改变了负的nice级别，使它们比2.4内核更强
+（人们对这一变化很满意），而且我们还故意校正了线性时间片准则，使得nice +19
+的级别 _正好_ 是1 jiffy。为了让大家更好地理解它，时间片的图会是这样的（质量
+不佳的ASCII艺术提醒！）::
+
+
+                   A
+             \     | [timeslice length]
+              \    |
+               \   |
+                \  |
+                 \ |
+                  \|___100msecs
+                   |^ . _
+                   |      ^ . _
+                   |            ^ . _
+ -*----------------------------------*-----> [nice level]
+ -20               |                +19
+                   |
+                   |
+
+因此，如果有人真的想renice任务，相较线性规则，+19会给出更大的效果（改变
+ABI来扩展优先级的解决方案在早期就被放弃了）。
+
+这种方法在一定程度上奏效了一段时间，但后来HZ=1000时，它导致1 jiffy为
+1ms，这意味着0.1%的CPU使用率，我们认为这有点过度。过度 _不是_ 因为它表示
+的CPU使用率过小，而是因为它引发了过于频繁（每毫秒1次）的重新调度（因此会
+破坏缓存，等等。请记住，硬件更弱、cache更小是很久以前的事了，当时人们在
+nice +19级别运行数量颇多的应用程序）。
+
+因此，对于HZ=1000，我们将nice +19改为5毫秒，因为这感觉像是正确的最小
+粒度——这相当于5%的CPU利用率。但nice +19的根本的HZ敏感属性依然保持不变，
+我们没有收到过关于nice +19在CPU利用率方面太 _弱_ 的任何抱怨，我们只收到
+过它（依然）太 _强_ 的抱怨 :-)。
+
+总结一下：我们一直想让nice各级别一致性更强，但在HZ和jiffies的限制下，以及
+nice级别与时间片、调度粒度耦合是令人讨厌的设计，这一目标并不真正可行。
+
+第二个关于Linux nice级别支持的抱怨是（不那么频繁，但仍然定期发生），它
+在原点周围的不对称性（你可以在上面的图片中看到），或者更准确地说：事实上
+nice级别的行为取决于 _绝对的_ nice级别，而nice应用程序接口本身从根本上
+说是“相对”的：
+
+   int nice(int inc);
+
+   asmlinkage long sys_nice(int increment)
+
+（第一个是glibc的应用程序接口，第二个是syscall的应用程序接口）
+注意，“inc”是相对当前nice级别而言的，类似bash的“nice”命令等工具是这个
+相对性应用程序接口的镜像。
+
+在旧的调度器中，举例来说，如果你以nice +1启动一个任务，并以nice +2启动
+另一个任务，这两个任务的CPU分配将取决于父外壳程序的nice级别——如果它是
+nice -10，那么CPU的分配不同于+5或+10。
+
+第三个关于Linux nice级别支持的抱怨是，负数nice级别“不够有力”，以很多人
+不得不诉诸于实时调度优先级来运行音频（和其它多媒体）应用程序，比如
+SCHED_FIFO。但这也造成了其它问题：SCHED_FIFO未被证明是免于饥饿的，一个
+有问题的SCHED_FIFO应用程序也会锁住运行良好的系统。
+
+v2.6.23版内核的新调度器解决了这三种类型的抱怨：
+
+为了解决第一个抱怨（nice级别不够“有力”），调度器与“时间片”、HZ的概念
+解耦（调度粒度被处理成一个和nice级别独立的概念），因此有可能实现更好、
+更一致的nice +19支持：在新的调度器中，nice +19的任务得到一个HZ无关的
+1.5%CPU使用率，而不是旧版调度器中3%-5%-9%的可变范围。
+
+为了解决第二个抱怨（nice各级别不一致），新调度器令调用nice(1)对各任务的
+CPU利用率有相同的影响，无论其绝对nice级别如何。所以在新调度器上，运行一个
+nice +10和一个nice +11的任务会与运行一个nice -5和一个nice -4的任务的
+CPU利用率分割是相同的（一个会得到55%的CPU，另一个会得到45%）。这是为什么
+nice级别被改为“乘法”（或指数）——这样的话，不管你从哪个级别开始，“相对”
+结果将总是一样的。
+
+第三个抱怨（负数nice级别不够“有力”，并迫使音频应用程序在更危险的
+SCHED_FIFO调度策略下运行）几乎被新的调度器自动解决了：更强的负数级别
+具有重新校正nice级别动态范围的自动化副作用。
-- 
2.17.1

