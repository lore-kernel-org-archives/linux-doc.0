Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AE2C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 07:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhLGHtu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 02:49:50 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:28281 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhLGHtt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 02:49:49 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J7XRL1plNzbjP4;
        Tue,  7 Dec 2021 15:46:06 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 15:46:12 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 7 Dec 2021 15:46:11 +0800
Subject: Re: [PATCH 1/1] docs/zh_CN: Add sched-capacity translation
To:     Alex Shi <seakeel@gmail.com>
CC:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <zhengbin13@huawei.com>,
        <tangyeechou@gmail.com>
References: <20211206090911.26487-1-tangyizhou@huawei.com>
 <20211206090911.26487-2-tangyizhou@huawei.com>
 <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <f01d3083-c1d6-54c1-fb5a-2d00b2357762@huawei.com>
Date:   Tue, 7 Dec 2021 15:46:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
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

On 2021/12/7 13:37, Alex Shi wrote:
> On Mon, Dec 6, 2021 at 4:41 PM Tang Yizhou <tangyizhou@huawei.com> wrote:
>>
>> Translate scheduler/sched-capacity.rst into Chinese.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
>> ---
>>  .../translations/zh_CN/sched-capacity.rst     | 383 ++++++++++++++++++
>>  1 file changed, 383 insertions(+)
>>  create mode 100644 Documentation/translations/zh_CN/sched-capacity.rst
>>
>> diff --git a/Documentation/translations/zh_CN/sched-capacity.rst b/Documentation/translations/zh_CN/sched-capacity.rst
>> new file mode 100644
>> index 000000000000..30c258144881
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/sched-capacity.rst
>> @@ -0,0 +1,383 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/scheduler/sched-capacity.rst
>> +
>> +:翻译:
>> +
>> +       唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>> +
>> +================
>> +capacity感知调度
>> +================
>> +
>> +1. CPU Capacity
>> +===============
>> +
>> +1.1 简介
>> +--------
>> +
>> +一般来说，同构的SMP平台由完全相同的CPU构成。异构的平台则由性能特征不同的CPU构成，
>> +在这样的平台中，CPU不能被认为是相同的。
>> +
>> +我们引入CPU capacity的概念来测量每个CPU能达到的性能，它的值相对系统中性能最强的CPU做过归一化处理。
>> +异构系统也被称为非对称CPU capacity系统，因为它们由不同capacity的CPU组成。
>> +
>> +最大可达性能（换言之，最大CPU capacity）的差异有两个主要来源:
>> +
>> +- 不是所有CPU的微架构都相同。
>> +- 在动态电压频率升降（Dynamic Voltage and Frequency Scaling ，DVFS）框架中，
>> +  不是所有的CPU都能达到一样高的可操作性能点（Operating Performance Points，OPP。译注，也就是“频率-电压”对）。
>> +
>> +Arm big.LITTLE系统是同时具有两种差异的一个例子。相较LITTLE CPUs，big CPUs面向性能
>> +（拥有更多的pipeline stages，更大的cache，更智能的predictors等），通常可以达到更高的OPP。
>> +
>> +一般来说，同构的SMP平台由完全相同的CPU构成。异构的平台则由性能特征不同的CPU构成，在这样的平台中，CPU不能被认为是相同的。
> 
> Good job!
> Just the line is too long. Enghlish word should leass than 80 chars,
> for Chinese should less than 40 chars.

After reading some English documents, I find the length of a single line
usually is 80 columns. But sometimes this rule is not followed.

As Linus mentioned earlier this year, perhaps we can apply a longer
length limit. I suggest 60 chars for Chinese (120 chars for English).

This document is written without exceeding 60 columns at most times.
I will fix the lines which are too long.

> 
> with the change
> 
> Reviewed-by: Alex Shi <alexs@kernel.org>
> 
>> +（比如终端设备的ARM CPU可能包含大、中、小三个性能不同的cluster，每个cluster中的CPU性能相同）::
> 
> I see 'sluster' was translated as 集 or 簇， could we change to them? or
> keep the English, it's up to you.

This tranlation is added by me. There isn't a corresponding sentence in
the English version. I'll delete it in the next patch.
 
> 
> Thanks
> Alex
> 
>> +
>> +  capacity(cpu) = work_per_hz(cpu) * max_freq(cpu)
>> +
>> +1.2 调度器术语
>> +--------------
>> +
>> +调度器使用了两种不同的capacity值。CPU的 ``capacity_orig`` 是它的最大可达capacity，即最大可达性能等级。
>> +CPU的 ``capacity`` 是 ``capacity_orig`` 扣除了一些性能损失（比如处理中断的耗时）的值。
>> +
>> +注意CPU的 ``capacity`` 仅仅被设计用于CFS调度类，而 ``capacity_orig`` 是不感知调度类的。
>> +为简洁起见，本文档的剩余部分将不加区分的使用术语 ``capacity`` 和 ``capacity_orig`` 。
>> +
>> +1.3 平台示例
>> +------------
>> +
>> +1.3.1 OPP相同
>> +~~~~~~~~~~~~~
>> +
>> +考虑一个假想的双核非对称CPU capacity系统，其中
>> +
>> +- work_per_hz(CPU0) = W
>> +- work_per_hz(CPU1) = W/2
>> +- 所有CPU以相同的固定频率运行
>> +
>> +根据上文对capacity的定义:
>> +
>> +- capacity(CPU0) = C
>> +- capacity(CPU1) = C/2
>> +
>> +若这是Arm big.LITTLE系统，CPU0是big CPU，而CPU1是LITTLE CPU。
>> +
>> +考虑一种周期性产生固定工作量的工作负载，你将会得到类似下图的执行轨迹::
>> +
>> + CPU0 work ^
>> +           |     ____                ____                ____
>> +           |    |    |              |    |              |    |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> + CPU1 work ^
>> +           |     _________           _________           ____
>> +           |    |         |         |         |         |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> +CPU0在系统中具有最高capacity（C），它使用T个单位时间完成固定工作量W。
>> +另一方面，CPU1只有CPU0一半capacity，因此在T个单位时间内仅完成工作量W/2。
>> +
>> +1.3.2 最大OPP不同
>> +~~~~~~~~~~~~~~~~~
>> +
>> +具有不同capacity值的CPU，通常来说最大OPP也不同。考虑上一小节提到的CPU（也就是说，work_per_hz()相同）:
>> +
>> +- max_freq(CPU0) = F
>> +- max_freq(CPU1) = 2/3 * F
>> +
>> +这将推出：
>> +
>> +- capacity(CPU0) = C
>> +- capacity(CPU1) = C/3
>> +
>> +执行1.3.1节描述的工作负载，每个CPU按最大频率运行，结果为::
>> +
>> + CPU0 work ^
>> +           |     ____                ____                ____
>> +           |    |    |              |    |              |    |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> +                            workload on CPU1
>> + CPU1 work ^
>> +           |     ______________      ______________      ____
>> +           |    |              |    |              |    |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> +1.4 关于计算方式的注意事项
>> +--------------------------
>> +
>> +需要注意的是，使用单一值来表示CPU性能的差异是有些争议的。
>> +两个不同的微架构的相对性能差异应该描述为：X%整数运算差异，Y%浮点数运算差异，Z%分支跳转差异，等等。
>> +尽管如此，使用简单计算方式的结果目前还是令人满意的。
>> +
>> +2. 任务使用率 Task utilization
>> +==============================
>> +
>> +2.1 简介
>> +--------
>> +
>> +capacity感知调度要求描述任务需求，描述方式要和CPU capacity相关。
>> +每个调度类可以用不同的方式描述它。任务使用率是CFS独有的描述方式，不过在这里介绍它有助于引入更多一般性的概念。
>> +
>> +任务使用率是一种用百分比来描述任务吞吐率需求的方式。一个简单的近似是任务的占空比，也就是说::
>> +
>> +  task_util(p) = duty_cycle(p)
>> +
>> +在频率固定的SMP系统中，100%的利用率意味着任务是忙等待循环。反之，10%的利用率暗示这是一个小周期任务，
>> +它在睡眠上花费的时间比执行更多。
>> +
>> +2.2 频率不变性 Frequency invariance
>> +-----------------------------------
>> +
>> +一个需要考虑的议题是，工作负载的占空比受CPU正在运行的OPP直接影响。考虑以给定的频率F执行周期性工作负载::
>> +
>> +  CPU work ^
>> +           |     ____                ____                ____
>> +           |    |    |              |    |              |    |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> +可以算出 duty_cycle(p) == 25%。
>> +
>> +现在，考虑以给定频率F/2执行 *同一个* 工作负载::
>> +
>> +  CPU work ^
>> +           |     _________           _________           ____
>> +           |    |         |         |         |         |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> +可以算出 duty_cycle(p) == 50%，尽管两次执行中，任务的行为完全一致（也就是说，执行的工作量相同）。
>> +
>> +任务利用率信号可按下面公式处理成频率不变的（译注：这里的术语用到了信号与系统的概念）::
>> +
>> +  task_util_freq_inv(p) = duty_cycle(p) * (curr_frequency(cpu) / max_frequency(cpu))
>> +
>> +对上面两个例子运用该公式，可以算出频率不变的任务利用率均为25%。
>> +
>> +2.3 CPU不变性 CPU invariance
>> +----------------------------
>> +
>> +CPU capacity与任务利用率具有类型的效应，在capacity不同的CPU上执行完全相同的工作负载，
>> +将算出不同的占空比。
>> +
>> +考虑1.3.2节提到的系统，也就是说::
>> +
>> +- capacity(CPU0) = C
>> +- capacity(CPU1) = C/3
>> +
>> +每个CPU按最大频率执行指定周期性工作负载，结果为::
>> +
>> + CPU0 work ^
>> +           |     ____                ____                ____
>> +           |    |    |              |    |              |    |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> + CPU1 work ^
>> +           |     ______________      ______________      ____
>> +           |    |              |    |              |    |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +
>> +也就是说，
>> +
>> +- duty_cycle(p) == 25%，如果任务p在CPU0上按最大频率运行。
>> +- duty_cycle(p) == 75%，如果任务p在CPU1上按最大频率运行。
>> +
>> +任务利用率信号可按下面公式处理成CPU容量不变的::
>> +
>> +  task_util_cpu_inv(p) = duty_cycle(p) * (capacity(cpu) / max_capacity)
>> +
>> +其中 ``max_capacity`` 是系统中最高的CPU capacity。对上面的例子运用该公式，
>> +可以算出CPU capacity不变的任务利用率均为25%。
>> +
>> +2.4 任务利用率不变量 Invariant task utilization
>> +-----------------------------------------------
>> +
>> +频率和CPU capacity不变性都需要被应用到任务利用率的计算中，以便求出真正的不变信号。
>> +任务利用率的伪计算公式是同时具备CPU和频率不变性的，也就是说，对于指定任务p::
>> +
>> +                                     curr_frequency(cpu)   capacity(cpu)
>> +  task_util_inv(p) = duty_cycle(p) * ------------------- * -------------
>> +                                     max_frequency(cpu)    max_capacity
>> +
>> +也就是说，任务利用率不变量假定任务在系统中最高capacity CPU上以最高频率运行，以此描述任务的行为。
>> +
>> +在接下来的章节中提到的任何任务利用率，均是不变量的形式。
>> +
>> +2.5 利用率估算
>> +--------------
>> +
>> +由于预测未来的水晶球不存在，当任务第一次变成可运行时，任务的行为和任务利用率均不能被准确预测。
>> +CFS调度类基于实体负载跟踪机制（Per-Entity Load Tracking, PELT）维护了少量CPU和任务信号，
>> +其中之一可以算出平均利用率（与瞬时相反）。
>> +
>> +这意味着，尽管运用“真实的”任务利用率（凭借水晶球）写出capacity感知调度的准则，
>> +但是它的实现将只能用任务利用率的估算值。
>> +
>> +3. capacity感知调度的需求
>> +=========================
>> +
>> +3.1 CPU capacity
>> +----------------
>> +
>> +当前，Linux无法凭自身算出CPU capacity，因此必须要有把这个信息传递给Linux的方式。
>> +每个架构必须为此定义arch_scale_cpu_capacity()函数。
>> +
>> +arm和arm64架构直接把这个信息映射到arch_topology驱动的CPU scaling数据中
>> +（译注：参考arch_topology.h的percpu变量cpu_scale），
>> +它是从capacity-dmips-mhz CPU binding中衍生计算出来的。参见
>> +Documentation/devicetree/bindings/arm/cpu-capacity.txt。
>> +
>> +3.2 Frequency invariance
>> +------------------------
>> +
>> +如2.2节所述，capacity感知调度需要频率不变的任务利用率。
>> +每个架构必须为此定义arch_scale_freq_capacity(cpu)函数。
>> +
>> +实现该函数要求计算出每个CPU当前以什么频率在运行。实现它的一种方式是利用硬件计数器
>> +（x86的APERF/MPERF，arm64的AMU），它能按CPU当前频率动态可扩展地升降递增计数器的速率。
>> +另一种方式是在cpufreq频率变化时直接使用钩子函数，内核此时感知到将要被切换的频率（也被arm/arm64实现了）。
>> +
>> +4. 调度器拓扑结构
>> +=================
>> +
>> +在构建调度域时，调度器将会发现系统是否表现为非对称CPU capacity。如果是，那么：
>> +
>> +- sched_asym_cpucapacity static key将使能。
>> +- SD_ASYM_CPUCAPACITY_FULL标志位将在尽量最低调度域层级中被设置，同时要满足条件：
>> +  调度域恰好完整包含某个CPU capacity值的全部CPU。
>> +- SD_ASYM_CPUCAPACITY标志将在所有包含非对称CPU的调度域中被设置。
>> +
>> +sched_asym_cpucapacity static key的设计意图是，保护为非对称CPU capacity系统所准备的代码。
>> +不过要注意的是，这个key是系统范围可见的。想象下面使用了cpuset的步骤::
>> +
>> +  capacity    C/2          C
>> +            ________    ________
>> +           /        \  /        \
>> +  CPUs     0  1  2  3  4  5  6  7
>> +           \__/  \______________/
>> +  cpusets   cs0         cs1
>> +
>> +可以通过下面的方式创建：
>> +
>> +.. code-block:: sh
>> +
>> +  mkdir /sys/fs/cgroup/cpuset/cs0
>> +  echo 0-1 > /sys/fs/cgroup/cpuset/cs0/cpuset.cpus
>> +  echo 0 > /sys/fs/cgroup/cpuset/cs0/cpuset.mems
>> +
>> +  mkdir /sys/fs/cgroup/cpuset/cs1
>> +  echo 2-7 > /sys/fs/cgroup/cpuset/cs1/cpuset.cpus
>> +  echo 0 > /sys/fs/cgroup/cpuset/cs1/cpuset.mems
>> +
>> +  echo 0 > /sys/fs/cgroup/cpuset/cpuset.sched_load_balance
>> +
>> +由于“这是”非对称CPU capacity系统，sched_asym_cpucapacity static key将使能。
>> +然而，CPU 0--1对应的调度域层级，capacity值仅有一个，该层级中SD_ASYM_CPUCAPACITY未被设置，
>> +它描述的是一个SMP区域，也应该被以此处理。
>> +
>> +因此，“典型的”保护非对称CPU capacity代码路径的代码模式是：
>> +
>> +- 检查sched_asym_cpucapacity static key
>> +- 如果它被使能，接着检查调度域层级中SD_ASYM_CPUCAPACITY标志位是否出现
>> +
>> +5. capacity感知调度的实现
>> +=========================
>> +
>> +5.1 CFS
>> +-------
>> +
>> +5.1.1 capacity适应性（fitness）
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +CFS最主要的capacity调度准则是::
>> +
>> +  task_util(p) < capacity(task_cpu(p))
>> +
>> +它通常被称为capacity适应性准则。也就是说，CFS必须保证任务“适合”在某个CPU上运行。
>> +如果准则被违反，任务将要更长地消耗该CPU，任务是CPU受限的（CPU-bound）。
>> +
>> +此外，uclamp允许用户空间指定任务的最小和最大利用率，要么以sched_setattr()的方式，
>> +要么以cgroup接口的方式（参阅Documentation/admin-guide/cgroup-v2.rst）。
>> +如其名字所暗示，uclamp可以被用在前一条准则中限制task_util()。
>> +
>> +5.1.2 被唤醒任务的CPU选择
>> +~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +CFS任务唤醒的CPU选择，遵循上面描述的capacity适应性准则。在此之上，uclamp被用来限制任务利用率，
>> +这令用户空间对CFS任务的CPU选择有更多的控制。也就是说，CFS被唤醒任务的CPU选择，搜索满足以下条件的CPU::
>> +
>> +  clamp(task_util(p), task_uclamp_min(p), task_uclamp_max(p)) < capacity(cpu)
>> +
>> +通过使用uclamp，举例来说，用户空间可以允许忙等待循环（100%使用率）在任意CPU上运行，
>> +只要给它设置低的uclamp.max值。相反，uclamp能强制一个小的周期性任务（比如，10%利用率）
>> +在最高性能的CPU上运行，只要给它设置高的uclamp.min值。
>> +
>> +.. note::
>> +
>> +  CFS的被唤醒的任务的CPU选择，可被能耗感知调度（Energy Aware Scheduling，EAS）
>> +  覆盖，在Documentation/scheduler/sched-energy.rst中描述。
>> +
>> +5.1.3 负载均衡
>> +~~~~~~~~~~~~~~
>> +
>> +被唤醒任务的CPU选择的一个病理性的例子是，任务几乎不睡眠，那么也几乎不发生唤醒。考虑::
>> +
>> +  w == wakeup event
>> +
>> +  capacity(CPU0) = C
>> +  capacity(CPU1) = C / 3
>> +
>> +                           workload on CPU0
>> +  CPU work ^
>> +           |     _________           _________           ____
>> +           |    |         |         |         |         |
>> +           +----+----+----+----+----+----+----+----+----+----+-> time
>> +                w                   w                   w
>> +
>> +                           workload on CPU1
>> +  CPU work ^
>> +           |     ____________________________________________
>> +           |    |
>> +           +----+----+----+----+----+----+----+----+----+----+->
>> +                w
>> +
>> +该工作负载应该在CPU0上运行，不过如果任务满足以下条件之一：
>> +
>> +- 一开始发生不合适的调度（不准确的初始利用率估计）
>> +- 一开始调度正确，但突然需要更多的处理器功率
>> +
>> +则任务可能变为CPU受限的，也就是说 ``task_util(p) > capacity(task_cpu(p))``；
>> +CPU capacity调度准则被违反，将不会有任何唤醒事件来修复这个错误的CPU选择。
>> +
>> +这种场景下的任务被称为“不合适的”（misfit）任务，处理这个场景的机制同样也以此命名。
>> +Misfit任务迁移借助CFS负载均衡器，更明确的说，是主动负载均衡的部分（用来迁移正在运行的任务）。
>> +当发生负载均衡时，如果一个misfit任务可以被迁移到一个相较当前运行的CPU具有更高capacity的CPU上，
>> +那么misfit任务的主动负载均衡将被触发。
>> +
>> +5.2 RT
>> +------
>> +
>> +5.2.1 被唤醒任务的CPU选择
>> +~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +RT任务唤醒时的CPU选择，搜索满足以下条件的CPU::
>> +
>> +  task_uclamp_min(p) <= capacity(task_cpu(cpu))
>> +
>> +同时仍然允许接着使用常规的优先级限制。如果没有CPU能满足这个capacity准则，那么将使用基于严格优先级的调度，
>> +CPU capacity将被忽略。
>> +
>> +5.3 DL
>> +------
>> +
>> +5.3.1 被唤醒任务的CPU选择
>> +~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +DL任务唤醒时的CPU选择，搜索满足以下条件的CPU::
>> +
>> +  task_bandwidth(p) < capacity(task_cpu(p))
>> +
>> +同时仍然允许接着使用常规的带宽和截止期限限制。如果没有CPU能满足这个capacity准则，
>> +那么任务依然在当前CPU队列中。
>> --
>> 2.17.1
>>

Thanks,
Tang
