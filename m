Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26113C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Feb 2022 12:31:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235693AbiBGM2N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Feb 2022 07:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391104AbiBGL6T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Feb 2022 06:58:19 -0500
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7171DC03FEC1
        for <linux-doc@vger.kernel.org>; Mon,  7 Feb 2022 03:57:47 -0800 (PST)
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Jsl1Q5b8FzdZRV;
        Mon,  7 Feb 2022 19:54:34 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Feb 2022 19:57:44 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Feb 2022 19:57:44 +0800
Subject: Re: [PATCH] docs/zh_CN: Add sched-energy Chinese translation
To:     yanteng si <siyanteng01@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>,
        Yeechou Tang <tangyeechou@gmail.com>
References: <20220207022521.27487-1-tangyizhou@huawei.com>
 <CAEensMyP7yLWGuLUNXjj=ceMJBhj3KeG7t=9SuKaMjX9NOoGag@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <0224799c-8135-b363-63b6-bbe1f4ebdea1@huawei.com>
Date:   Mon, 7 Feb 2022 19:57:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAEensMyP7yLWGuLUNXjj=ceMJBhj3KeG7t=9SuKaMjX9NOoGag@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2022/2/7 15:11, yanteng si wrote:
> Tang Yizhou <tangyizhou@huawei.com> 于2022年2月7日周一 09:52写道：
>>
>> Translate scheduler/sched-energy.rst into Chinese.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>>  .../translations/zh_CN/scheduler/index.rst    |   4 +-
>>  .../zh_CN/scheduler/sched-energy.rst          | 351 ++++++++++++++++++
>>  2 files changed, 353 insertions(+), 2 deletions(-)
>>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-energy.rst
>>
>> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
>> index f8f8f35d53c7..ab7925980266 100644
>> --- a/Documentation/translations/zh_CN/scheduler/index.rst
>> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
>> @@ -5,6 +5,7 @@
>>  :翻译:
>>
>>   司延腾 Yanteng Si <siyanteng@loongson.cn>
>> + 唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>>
>>  :校译:
>>
>> @@ -23,13 +24,12 @@ Linux调度器
>>      sched-design-CFS
>>      sched-domains
>>      sched-capacity
>> +    sched-energy
>>
>>
>>  TODOList:
>>
>> -    sched-bwc
>>      sched-deadline
>> -    sched-energy
>>      sched-nice-design
>>      sched-rt-group
>>      sched-stats
>> diff --git a/Documentation/translations/zh_CN/scheduler/sched-energy.rst b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
>> new file mode 100644
>> index 000000000000..5ea3980b0ebd
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/scheduler/sched-energy.rst
>> @@ -0,0 +1,351 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/scheduler/sched-energy.rst
>> +
>> +:翻译:
>> +
>> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>> +
>> +============
>> +能量感知调度
>> +============
>> +
>> +1. 简介
>> +-------
>> +
>> +能量感知调度（EAS）使调度器有能力预测其决策对CPU所消耗的能量的影响。EAS依靠

> How about CPU 所消耗的电能/能源？

1. 电能肯定是不妥的，energy不必然是电能。
2. 我考虑过翻译成能源，注意到第2章的术语说明还提到功率，功率乘以时间为能量，同样是
energy这个词，故而统一翻译成能量了。

>> +一个能量模型（EM）来为每个任务选择一个节能的CPU，同时最小化对吞吐率的影响。

> How about 节能的CPU核心？

原文是CPU而不是CPU core，可以遵照原文，同样在中文语境下也有混用。

>> +本文档致力于介绍介绍EAS是如何工作的，它背后的主要设计决策是什么，以及使其运行
>> +所需的条件细节。
>> +
>> +在进一步阅读之前，请注意，在撰写本文时::
>> +
>> +   /!\ EAS不支持对称CPU拓扑的平台 /!\
>> +
>> +EAS只在异构CPU拓扑结构（如Arm大小核，big.LITTLE）上运行。因为在这种情况下，
>> +通过调度来节约能量的潜力是最大的。
>> +
>> +EAS实际使用的EM不是由调度器维护的，而是一个专门的框架。关于这个框架的细节和
>> +它提供的内容，请参考其文档（见Documentation/power/energy-model.rst）。
>> +
>> +
>> +2. 背景和术语
>> +-------------
>> +
>> +从一开始就说清楚定义:
>> + - 能量 = [焦耳] （比如供电设备上的电池提供的资源）
>> + - 功率 = 能量/时间 = [焦耳/秒] = [瓦特]
>> +
>> + EAS的目标是最小化能量，同时仍能将工作完成。也就是说，我们要最大化::

> 最小化能源/电能消耗？

虽然原文仅为energy，考虑到中文的可读性，下一版将翻译为能量消耗。

>> +
>> +       性能 [指令数/秒]
>> +       ----------------
>> +          功率 [瓦特]
>> +
>> +它等效于最小化::
>> +
>> +       能量 [焦耳]
>> +       -----------
>> +          指令数
>> +
>> +同时仍然获得“良好”的性能。当前调度器只考虑性能目标，因此该式子本质上是一个
>> +可选的优化目标，它同时考虑了两个目标：能量效率和性能。
>> +
>> +引入EM的想法是为了让调度器评估其决策的影响，而不是盲目地应用可能仅在部分
>> +平台有正面效果的节能技术。同时，EM必须尽可能的简单，以最小化调度器的时延
>> +影响。
>> +
>> +简而言之，EAS改变了CFS任务分配给CPU的方式。当调度器决定一个任务应该在哪里
>> +运行时（在唤醒期间），EM被用来在不损害系统吞吐率的情况下，从几个较好的候选
>> +CPU中挑选一个经预测能量消耗最优的CPU。EAS的预测依赖于对平台拓扑结构特定元素
>> +的了解，包括CPU的“算力”，以及它们各自的能量成本。
>> +
>> +
>> +3. 拓扑信息
>> +-----------
>> +
>> +EAS（以及调度器的剩余部分）使用“算力”的概念来区分不同计算吞吐率的CPU。一个
>> +CPU的“算力”代表了它在最高频率下运行时能完成的工作量，且这个值是相对系统中
>> +算力最大的CPU而言的。算力值被归一化为1024以内，并且可与由实体负载跟踪
>> +（PELT）机制算出的利用率信号做对比。由于有算力值和利用率值，EAS能够估计一个
>> +任务/CPU有多大/有多忙，并在评估性能与能量时将其考虑在内。CPU算力由特定体系
>> +结构实现的arch_scale_cpu_capacity()回调函数提供。
>> +
>> +EAS使用的其余平台信息是直接从能量模型（EM）框架中读取的。一个平台的EM是一张
>> +表，表中每项代表系统中一个“性能域”的功率成本。（若要了解更多关于性能域的细节，
>> +见文档/power/energy-model.rst）

> Hi YiZhou, What is 文档/power/energy-model.rst?  :)

That's my fault. Thanks.

>> +
>> +当调度域被建立或重新建立时，调度器管理对拓扑代码中EM对象的引用。对于每个根域
>> +（rd），调度器维护一个与当前rd->span相交的所有性能域的单向链表。链表中的每个
>> +节点都包含一个指向EM框架所提供的结构体em_perf_domain的指针。
>> +
>> +链表被附加在根域上，以应对独占的cpuset的配置。由于独占的cpuset的边界不一定与
>> +性能域的边界一致，不同根域的链表可能包含重复的元素。
>> +
>> +示例1
>> +    让我们考虑一个有12个CPU的平台，分成3个性能域，（pd0，pd4和pd8），按以下
>> +    方式组织::
>> +
>> +                 CPUs:   0 1 2 3 4 5 6 7 8 9 10 11
>> +                 PDs:   |--pd0--|--pd4--|---pd8---|
>> +                 RDs:   |----rd1----|-----rd2-----|
>> +
>> +    现在，考虑用户空间决定将系统分成两个独占的cpusets，因此创建了两个独立的根域，
>> +    每个根域包含6个CPU。这两个根域在上图中被表示为rd1和rd2。由于pd4与rd1和rd2
>> +    都有交集，它将同时出现于附加在这两个根域的“->pd”链表中:
>> +
>> +       * rd1->pd: pd0 -> pd4
>> +       * rd2->pd: pd4 -> pd8
>> +
>> +    请注意，调度器将为pd4创建两个重复的链表节点（每个链表中各一个）。然而这
>> +    两个节点持有指向同一个EM框架的共享数据结构的指针。
>> +
>> +由于对这些链表的访问可能与热插拔及其它事件并发发生，因此它们受RCU锁保护，就像
>> +被调度器操控的拓扑结构中剩下字段一样。

> 结构体

OK

>> +
>> +EAS同样维护了一个静态键（sched_energy_present），当至少有一个根域满足EAS
>> +启动的所有条件时，这个键就会被启动。在第6节中总结了这些条件。
>> +
>> +
>> +4. 能量感知任务放置
>> +-------------------
>> +
>> +EAS覆盖了CFS的任务唤醒平衡代码。在唤醒平衡时，它使用平台的EM和PELT信号来选择节能
>> +的目标CPU。当EAS被启用时，select_task_rq_fair()调用find_energy_efficient_cpu()
>> +来做任务放置决定。这个函数寻找在每个性能域中寻找具有最高剩余算力（CPU算力 - CPU
>> +利用率）的CPU，因为它能让我们保持最低的频率。然后，该函数检查将任务放在新CPU相较
>> +依然放在之前活动的prev_cpu是否可以节省能量。
>> +
>> +find_energy_efficient_cpu()使用compute_energy()来估算如果唤醒的任务被迁移，

> 如果唤醒的任务被迁移，find_energy_efficient_cpu()使用compute_energy()来估算

OK

>> +系统将消耗多少能量。compute_energy()检查各CPU当前的利用率情况，并尝试调整来
>> +“模拟”任务迁移。EM框架提供了API em_pd_energy()计算每个性能域在给定的利用率条件
>> +下的预期能量消耗。
>> +


Thanks,
Tang
