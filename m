Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E7BC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 05:38:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbiFHFiQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 01:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233846AbiFHFhj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 01:37:39 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F38092FE619
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 20:04:23 -0700 (PDT)
Received: from localhost.localdomain (unknown [223.64.16.213])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Cxf+awEaBiWKIoAA--.40690S4;
        Wed, 08 Jun 2022 11:04:18 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     alexs@kernel.org, siyanteng@loongson.cn
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 2/3] docs/zh_CN: riscv: Update the translation of pmu.rst to 5.19-rc1
Date:   Wed,  8 Jun 2022 11:04:14 +0800
Message-Id: <1789c7e38c5d2dfc35a0a0cedf71891a65bd776f.1654652729.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1654652729.git.zhoubinbin@loongson.cn>
References: <cover.1654652729.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Cxf+awEaBiWKIoAA--.40690S4
X-Coremail-Antispam: 1UD129KBjvJXoW3tFW5Aw15uFy5KFW8Ww45Jrb_yoWkAr15pa
        nI9FyfKa1UCryDZ3sxK347Zw1rJFyxCanIkF48ta4xXF1FvrWqyFWDt3WrAFy3Wa40yFyU
        Ar1Y9rWrZw1YywUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r48MxAIw2
        8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I
        3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
        WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8I
        cVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
        AFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZE
        Xa7VUUbdb5UUUUU==
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Synchronous translation from the following:

[1]: commit 23b1f18326ec("Documentation: riscv:
     Remove the old documentation")

[2]: commit 8933e7f2e375 ("Documentation: riscv: remove
     non-existent directory from table of contents")

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/riscv/index.rst        |   1 -
 .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
 2 files changed, 236 deletions(-)
 delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst

diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documentation/translations/zh_CN/riscv/index.rst
index 5bb35dfd58aa..24bc4991babc 100644
--- a/Documentation/translations/zh_CN/riscv/index.rst
+++ b/Documentation/translations/zh_CN/riscv/index.rst
@@ -19,7 +19,6 @@ RISC-V 体系结构
 
     boot-image-header
     vm-layout
-    pmu
     patch-acceptance
 
     features
diff --git a/Documentation/translations/zh_CN/riscv/pmu.rst b/Documentation/translations/zh_CN/riscv/pmu.rst
deleted file mode 100644
index 7ec801026c4d..000000000000
--- a/Documentation/translations/zh_CN/riscv/pmu.rst
+++ /dev/null
@@ -1,235 +0,0 @@
-.. include:: ../disclaimer-zh_CN.rst
-
-:Original: Documentation/riscv/pmu.rst
-
-:翻译:
-
- 司延腾 Yanteng Si <siyanteng@loongson.cn>
-
-.. _cn_riscv_pmu:
-
-========================
-RISC-V平台上对PMUs的支持
-========================
-
-Alan Kao <alankao@andestech.com>, Mar 2018
-
-简介
-------------
-
-截止本文撰写时，在The RISC-V ISA Privileged Version 1.10中提到的 perf_event
-相关特性如下:
-（详情请查阅手册）
-
-* [m|s]counteren
-* mcycle[h], cycle[h]
-* minstret[h], instret[h]
-* mhpeventx, mhpcounterx[h]
-
-仅有以上这些功能，移植perf需要做很多工作，究其原因是缺少以下通用架构的性能
-监测特性:
-
-* 启用/停用计数器
-  在我们这里，计数器一直在自由运行。
-* 计数器溢出引起的中断
-  规范中没有这种功能。
-* 中断指示器
-  不可能所有的计数器都有很多的中断端口，所以需要一个中断指示器让软件来判断
-  哪个计数器刚好溢出。
-* 写入计数器
-  由于内核不能修改计数器，所以会有一个SBI来支持这个功能[1]。 另外，一些厂商
-  考虑实现M-S-U型号机器的硬件扩展来直接写入计数器。
-
-这篇文档旨在为开发者提供一个在内核中支持PMU的简要指南。下面的章节简要解释了
-perf' 机制和待办事项。
-
-你可以在这里查看以前的讨论[1][2]。 另外，查看附录中的相关内核结构体可能会有
-帮助。
-
-
-1. 初始化
----------
-
-*riscv_pmu* 是一个类型为 *struct riscv_pmu* 的全局指针，它包含了根据perf内部
-约定的各种方法和PMU-specific参数。人们应该声明这样的实例来代表PMU。 默认情况
-下， *riscv_pmu* 指向一个常量结构体 *riscv_base_pmu* ，它对基准QEMU模型有非常
-基础的支持。
-
-
-然后他/她可以将实例的指针分配给 *riscv_pmu* ，这样就可以利用已经实现的最小逻
-辑，或者创建他/她自己的 *riscv_init_platform_pmu* 实现。
-
-换句话说，现有的 *riscv_base_pmu* 源只是提供了一个参考实现。 开发者可以灵活地
-决定多少部分可用，在最极端的情况下，他们可以根据自己的需要定制每一个函数。
-
-
-2. Event Initialization
------------------------
-
-当用户启动perf命令来监控一些事件时，首先会被用户空间的perf工具解释为多个
-*perf_event_open* 系统调用，然后进一步调用上一步分配的 *event_init* 成员函数
-的主体。 在 *riscv_base_pmu* 的情况下，就是 *riscv_event_init* 。
-
-该功能的主要目的是将用户提供的事件翻译成映射图，从而可以直接对HW-related的控
-制寄存器或计数器进行操作。该翻译基于 *riscv_pmu* 中提供的映射和方法。
-
-注意，有些功能也可以在这个阶段完成:
-
-(1) 中断设置，这个在下一节说；
-(2) 特限级设置(仅用户空间、仅内核空间、两者都有)；
-(3) 析构函数设置。 通常应用 *riscv_destroy_event* 即可；
-(4) 对非采样事件的调整，这将被函数应用，如 *perf_adjust_period* ，通常如下::
-
-      if (!is_sampling_event(event)) {
-              hwc->sample_period = x86_pmu.max_period;
-              hwc->last_period = hwc->sample_period;
-              local64_set(&hwc->period_left, hwc->sample_period);
-      }
-
-
-在 *riscv_base_pmu* 的情况下，目前只提供了（3）。
-
-
-3. 中断
--------
-
-3.1. 中断初始化
-
-这种情况经常出现在 *event_init* 方案的开头。通常情况下，这应该是一个代码段，如::
-
-  int x86_reserve_hardware(void)
-  {
-        int err = 0;
-
-        if (!atomic_inc_not_zero(&pmc_refcount)) {
-                mutex_lock(&pmc_reserve_mutex);
-                if (atomic_read(&pmc_refcount) == 0) {
-                        if (!reserve_pmc_hardware())
-                                err = -EBUSY;
-                        else
-                                reserve_ds_buffers();
-                }
-                if (!err)
-                        atomic_inc(&pmc_refcount);
-                mutex_unlock(&pmc_reserve_mutex);
-        }
-
-        return err;
-  }
-
-而神奇的是 *reserve_pmc_hardware* ，它通常做原子操作，使实现的IRQ可以从某个全局函
-数指针访问。 而 *release_pmc_hardware* 的作用正好相反，它用在上一节提到的事件分配
-器中。
-
- (注：从所有架构的实现来看，*reserve/release* 对总是IRQ设置，所以 *pmc_hardware*
- 似乎有些误导。 它并不处理事件和物理计数器之间的绑定，这一点将在下一节介绍。)
-
-3.2. IRQ结构体
-
-基本上，一个IRQ运行以下伪代码::
-
-  for each hardware counter that triggered this overflow
-
-      get the event of this counter
-
-      // following two steps are defined as *read()*,
-      // check the section Reading/Writing Counters for details.
-      count the delta value since previous interrupt
-      update the event->count (# event occurs) by adding delta, and
-                 event->hw.period_left by subtracting delta
-
-      if the event overflows
-          sample data
-          set the counter appropriately for the next overflow
-
-          if the event overflows again
-              too frequently, throttle this event
-          fi
-      fi
-
-  end for
-
- 然而截至目前，没有一个RISC-V的实现为perf设计了中断，所以具体的实现要在未来完成。
-
-4. Reading/Writing 计数
------------------------
-
-它们看似差不多，但perf对待它们的态度却截然不同。 对于读，在 *struct pmu* 中有一个
-*read* 接口，但它的作用不仅仅是读。 根据上下文，*read* 函数不仅要读取计数器的内容
-（event->count），还要更新左周期到下一个中断（event->hw.period_left）。
-
- 但 perf 的核心不需要直接写计数器。 写计数器隐藏在以下两点的抽象化之后，
- 1） *pmu->start* ，从字面上看就是开始计数，所以必须把计数器设置成一个合适的值，以
- 便下一次中断；
- 2）在IRQ里面，应该把计数器设置成同样的合理值。
-
-在RISC-V中，读操作不是问题，但写操作就需要费些力气了，因为S模式不允许写计数器。
-
-
-5. add()/del()/start()/stop()
------------------------------
-
-基本思想: add()/del() 向PMU添加/删除事件，start()/stop() 启动/停止PMU中某个事件
-的计数器。 所有这些函数都使用相同的参数: *struct perf_event *event* 和 *int flag* 。
-
-把 perf 看作一个状态机，那么你会发现这些函数作为这些状态之间的状态转换过程。
-定义了三种状态（event->hw.state）:
-
-* PERF_HES_STOPPED:	计数停止
-* PERF_HES_UPTODATE:	event->count是最新的
-* PERF_HES_ARCH:	依赖于体系结构的用法，。。。我们现在并不需要它。
-
-这些状态转换的正常流程如下:
-
-* 用户启动一个 perf 事件，导致调用 *event_init* 。
-* 当被上下文切换进来的时候，*add* 会被 perf core 调用，并带有一个标志 PERF_EF_START，
-  也就是说事件被添加后应该被启动。 在这个阶段，如果有的话，一般事件会被绑定到一个物
-  理计数器上。当状态变为PERF_HES_STOPPED和PERF_HES_UPTODATE，因为现在已经停止了,
-  （软件）事件计数不需要更新。
-
-  - 然后调用 *start* ，并启用计数器。
-    通过PERF_EF_RELOAD标志，它向计数器写入一个适当的值（详细情况请参考上一节）。
-    如果标志不包含PERF_EF_RELOAD，则不会写入任何内容。
-    现在状态被重置为none，因为它既没有停止也没有更新（计数已经开始）。
-
-*当被上下文切换出来时被调用。 然后，它检查出PMU中的所有事件，并调用 *stop* 来更新它们
- 的计数。
-
-  - *stop* 被 *del* 和perf核心调用，标志为PERF_EF_UPDATE，它经常以相同的逻辑和 *read*
-    共用同一个子程序。
-    状态又一次变为PERF_HES_STOPPED和PERF_HES_UPTODATE。
-
-  - 这两对程序的生命周期: *add* 和 *del* 在任务切换时被反复调用；*start* 和 *stop* 在
-    perf核心需要快速停止和启动时也会被调用，比如在调整中断周期时。
-
-目前的实现已经足够了，将来可以很容易地扩展到功能。
-
-A. 相关结构体
--------------
-
-* struct pmu: include/linux/perf_event.h
-* struct riscv_pmu: arch/riscv/include/asm/perf_event.h
-
-  两个结构体都被设计为只读。
-
-  *struct pmu* 定义了一些函数指针接口，它们大多以 *struct perf_event* 作为主参数，根据
-  perf的内部状态机处理perf事件（详情请查看kernel/events/core.c）。
-
-  *struct riscv_pmu* 定义了PMU的具体参数。 命名遵循所有其它架构的惯例。
-
-* struct perf_event: include/linux/perf_event.h
-* struct hw_perf_event
-
-  表示 perf 事件的通用结构体，以及硬件相关的细节。
-
-* struct riscv_hw_events: arch/riscv/include/asm/perf_event.h
-
-  保存事件状态的结构有两个固定成员。
-  事件的数量和事件的数组。
-
-参考文献
---------
-
-[1] https://github.com/riscv/riscv-linux/pull/124
-
-[2] https://groups.google.com/a/groups.riscv.org/forum/#!topic/sw-dev/f19TmCNP6yA
-- 
2.20.1

