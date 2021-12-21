Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F10C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 21 Dec 2021 14:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238364AbhLUONn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Dec 2021 09:13:43 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:16846 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232757AbhLUONn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Dec 2021 09:13:43 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JJJM74966z91mc;
        Tue, 21 Dec 2021 22:12:51 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 22:13:41 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 22:13:40 +0800
Subject: Re: [PATCH] docs/zh_CN: Add sched-domains translation
To:     yanteng si <siyanteng01@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>,
        Yeechou Tang <tangyeechou@gmail.com>
References: <20211221023158.31845-1-tangyizhou@huawei.com>
 <CAEensMz_EytaeBB1qhwTGuBd8SQnhQhjO05XcC8=LSrp7+BAZA@mail.gmail.com>
 <6169f755-a17e-cdf6-8a08-e5da3c358daf@huawei.com>
 <CAEensMzeEXeH5Y05J8uRuq=6R+oxtdzFzKi-WJe=f0VvrzsFYQ@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <318184bb-3df5-d194-e929-0c95a0c2cb2f@huawei.com>
Date:   Tue, 21 Dec 2021 22:13:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAEensMzeEXeH5Y05J8uRuq=6R+oxtdzFzKi-WJe=f0VvrzsFYQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/21 20:04, yanteng si wrote:
> Tang Yizhou <tangyizhou@huawei.com> 于2021年12月21日周二 15:25写道：
>>
>> On 2021/12/21 14:54, yanteng si wrote:
>>> Tang Yizhou <tangyizhou@huawei.com> 于2021年12月21日周二 10:04写道：
>>>>
>>>> Translate scheduler/sched-domains.rst into Chinese.
>>>>
>>>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>>>> ---
>>>>  .../translations/zh_CN/scheduler/index.rst    |  2 +-
>>>>  .../zh_CN/scheduler/sched-domains.rst         | 67 +++++++++++++++++++
>>>>  2 files changed, 68 insertions(+), 1 deletion(-)
>>>>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-domains.rst
>>>>
>>>> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
>>>> index 5327c61cb0ab..f8f8f35d53c7 100644
>>>> --- a/Documentation/translations/zh_CN/scheduler/index.rst
>>>> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
>>>> @@ -21,6 +21,7 @@ Linux调度器
>>>>      sched-arch
>>>>      sched-bwc
>>>>      sched-design-CFS
>>>> +    sched-domains
>>>>      sched-capacity
>>>>
>>>>
>>>> @@ -28,7 +29,6 @@ TODOList:
>>>>
>>>>      sched-bwc
>>>>      sched-deadline
>>>> -    sched-domains
>>>>      sched-energy
>>>>      sched-nice-design
>>>>      sched-rt-group
>>>> diff --git a/Documentation/translations/zh_CN/scheduler/sched-domains.rst b/Documentation/translations/zh_CN/scheduler/sched-domains.rst
>>>> new file mode 100644
>>>> index 000000000000..7aec24c03357
>>>> --- /dev/null
>>>> +++ b/Documentation/translations/zh_CN/scheduler/sched-domains.rst
>>>> @@ -0,0 +1,67 @@
>>>> +.. SPDX-License-Identifier: GPL-2.0
>>>> +.. include:: ../disclaimer-zh_CN.rst
>>>> +
>>>> +:Original: Documentation/scheduler/sched-domains.rst
>>>> +
>>>> +:翻译:
>>>> +
>>>> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>>>> +
>>>> +======
>>>> +调度域
>>>> +======
>>>> +
>>>> +每个CPU有一个“基”调度域（struct sched_domain）。调度域层次结构从基调度域构建而来，可
>>>> +通过->parent指针自下而上遍历。->parent必须以NULL结尾，调度域数据结构必须是per-CPU的，
>>
>>> 数据结构 -> 结构体
>> OK
>>
>>>> +因为它们无锁更新。
>>>> +
>>>> +每个调度域管辖数个CPU（存储在->span字段中）。一个调度域的span必须是它的子调度域span的
>>
>>> what stored in the -> field? This needs to be translated clearly.
>> 这里是英文原文的直接翻译。span字段就是调度域管辖的那些CPU。我全文把动词的span翻译成“管辖”了。

> cpu掩码/数量存储在……？

你得结合源码的结构体定义看。并不是掩码或者数量，是可变长数组表示的CPU列表。

>>
>>>> +超集（如有需求出现，这个限制可以放宽）。CPU i的基调度域必须至少管辖CPU i。每个CPU的
>>>> +顶层调度域通常将会管辖系统中的全部CPU，尽管严格来说这不是必须的，假如是这样，会导致某些
>>>> +CPU出现永远不会被指定任务运行的情况，直到允许的CPU掩码被显式设定。调度域的span字段意味
>>>> +着“在这些CPU中做进程负载均衡”。
>>>> +
>>>> +每个调度域必须具有一个或多个CPU调度组（struct sched_group），它们以单向循环链表的形式
>>>> +组织，存储在->groups指针中。这些组的CPU掩码的并集必须和调度域span字段一致。->groups
>>>> +指针指向的这些组包含的CPU，必须被调度域管辖。组包含的是只读数据，被创建之后，可能被多个
>>>> +CPU共享。任意两个组的CPU掩码的交集不一定为空，如果是这种情况，对应调度域的SD_OVERLAP
>>>> +标志位被设置，它管辖的调度组可能不能在多个CPU中共享。
>>>> +
>>>> +调度域中的负载均衡发生在调度组中。也就是说，每个组被视为一个实体。组的负载被定义为它
>>>> +管辖的每个CPU的负载之和。仅当组的负载不均衡后，任务在组之间发生迁移。
>>
>>> 才在组之间发生迁移。
>> OK
>>
>>>> +
>>>> +在kernel/sched/core.c中，trigger_load_balance()在每个CPU上通过scheduler_tick()
>>>> +周期执行。在当前运行队列下一个定期调度再平衡事件到达后，它引发一个软中断。负载均衡真正
>>>> +的工作由run_rebalance_domains()->rebalance_domains()完成，在软中断上下文中执行
>>>> +（SCHED_SOFTIRQ）。
>>>> +
>>>> +后一个函数有两个入参：当前CPU的运行队列、它在scheduler_tick()调用时是否空闲。函数会从
>>>> +当前CPU所在的基调度域开始迭代执行，并沿着parent指针链向上进入更高层级的调度域。在迭代
>>>> +过程中，函数会检查当前调度域是否已经耗尽了再平衡的时间间隔，如果是，它在该调度域运行
>>>> +load_balance()。接下来它检查父调度域（如果存在），再后来父调度域的父调度域，以此类推。
>>>> +
>>>> +起初，load_balance()查找当前调度域中最繁忙的调度组。如果成功，在该调度组管辖的全部CPU
>>>> +的运行队列中找出最繁忙的。如能找到，对当前的CPU运行队列和新找到的最繁忙运行队列均加锁，
>>
>>> 找出最繁忙的 **什么**？
>> 我觉得英文原文不够精炼，这里还是保持原样吧：
>> 在该调度组管辖的全部CPU的运行队列中找出最繁忙的运行队列。
> OK!
>>
>>>> +并把任务从最繁忙队列中迁移到当前CPU上。被迁移的任务数量等于在先前迭代执行中计算出的该
>>>> +调度域的调度组的不均衡值。
>>>> +
>>>> +实现调度域
>>>> +==========
>>>> +
>>>> +基调度域会管辖CPU层次结构中的第一层。对于超线程（SMT）而言，基调度域将会管辖同一个物理
>>>> +CPU的全部虚拟CPU，每个虚拟CPU对应一个调度组。
>>>> +
>>>> +在SMP中，基调度域的父调度域将会管辖同一个结点中的全部物理CPU。接下来，如果是NUMA系统，
>>>> +SMP调度域的父调度域将管辖整个机器，一个结点的CPU掩码对应一个调度组。或者，你可以使用
>>>> +多层次NUMA；或举例来说Opteron处理器，可能仅仅只有一个调度域来覆盖它的一个NUMA层级。
>>
>>> 或者，你可以做多级NUMA或Opteron，例如，可能只有一个域覆盖其一个NUMA级别。
>> 这里的英文原文让我困惑，可以讨论一下。Opteron前的or，作者想表达什么？
> 表示并列，你可以这么做，你也可以这么做。
> 
> Based on my hours of research, the translation of this paragraph is a
> bit off and you missed a sentence. [Each group being a single physical
> CPU]

Right. I'll add that.

> I have a rough idea of what the original passage is talking about, but
> I can't describe it. I need some time. :)

Sorry, I'm not familiar with this AMD processor.

> 
> Let's discuss these concepts first：
> 
> 1）基调度域（它的父调度域是谁？）：

调度域的层次结构参见struct sched_domain_topology_level数组，通常来说是SMT-MC-DIE
三层。但是根据系统实际情况，也是可以不一样的，原文下文简单提到了。

内核文档太简单了，实际上调度域、调度组的细节蛮复杂的。忠于原文的翻译，基本是个
辅助作用吧。

> 2）NUMA:

from wikipedia: 非均匀内存访问 / 非统一内存访问 。此外还可以见到 非一致内存访问。

> 3）Opteron:

Name of an AMD processor, I'm not going to translate it.

> 
> 
> Thanks,
> Yanteng
>>
>> Thanks,
>> Tang
>>
>>>
>>> Thank you for the translation！
>>> The scheduling domain is quite interesting and I decided to take the
>>> time to study it.
>>>
>>> Thanks,
>>>
>>> Yanteng
>>>> +
>>>> +实现者需要阅读include/linux/sched/sd_flags.h的注释：读SD_*来了解具体情况以及调度域的
>>>> +SD标志位调节了哪些东西。
>>>> +
>>>> +体系结构可以把指定的拓扑层级的通用调度域构建器和默认的SD标志位覆盖掉，方法是创建一个
>>>> +sched_domain_topology_level数组，并以该数组作为入参调用set_sched_topology()。
>>>> +
>>>> +调度域调试基础设施可以通过CONFIG_SCHED_DEBUG开启，并在开机启动命令行中增加
>>>> +“sched_verbose”。如果你忘记调整开机启动命令行了，也可以打开
>>>> +/sys/kernel/debug/sched/verbose开关。这将开启调度域错误检查的解析，它应该能捕获
>>>> +绝大多数错误，同时以可视化格式打印调度域的结构。
>>>> --
>>>> 2.17.1
>>>>
