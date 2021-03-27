Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE1BC433E0
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 10:32:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B270461A0D
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 10:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhC0Kc0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Mar 2021 06:32:26 -0400
Received: from [43.250.32.171] ([43.250.32.171]:32810 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229883AbhC0KcZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 27 Mar 2021 06:32:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=To:From:Date; bh=RRV/jLWqBCGTaY/VGKbSC6lNpTZSLuYcM6F9W
        QsSrQk=; b=dtwpxvFdysb85p0qaNTOVWCoQ5GriGL3CHQ8Rbb7yTuTr08PR4x4+
        4Pru6qsxfedAUAhoEjqx12Pu1WHGJvgfuDDMDKgrcANUBxC7rvOoqZ0/z3sOtsqo
        AQ29BVyJCKX7a4MQt8RSUATpYMMNsIq2FFaOHpOYHI+PHr1mGc6mi8=
Received: from [192.168.3.26] (unknown [120.242.71.194])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAnm9GnCV9gtsA8AA--.39600S3;
        Sat, 27 Mar 2021 18:32:08 +0800 (CST)
Subject: Re: [PATCH 2/8] docs/zh_CN: add cpu-freq cpu-drivers.rst translation
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <20210324150731.4512-3-siyanteng@loongson.cn>
 <1257fc72-1a1e-0437-b749-3c9be9965a52@email.cn>
 <CAMU9jJoDazKmhs8jj9PHrSDkRGF1_7q26XX4UUZRG32qKz-TtQ@mail.gmail.com>
From:   "Wu X.C." <bobwxc@email.cn>
Message-ID: <252b7c6c-de7a-83c3-d680-68ec4cc75678@email.cn>
Date:   Sat, 27 Mar 2021 18:32:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAMU9jJoDazKmhs8jj9PHrSDkRGF1_7q26XX4UUZRG32qKz-TtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LCKnCgAnm9GnCV9gtsA8AA--.39600S3
X-Coremail-Antispam: 1UD129KBjvAXoW3Aw13tr48Xr48Gw1DJFyUGFg_yoW8Wr1fWo
        WxurWfCF18Jry5tw1DAr4DJFW7X3Wjkr4DAayUGr4UuF1qya1ayryDJwnxCr43uF45tF15
        J3Wjqr1YyF1xXF13n29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY77k0a2IF6F4UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262
        IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx2
        6F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2
        kIc2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxG
        rwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
        8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
        ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
        0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
        Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRR
        Xdb5UUUUU==
X-Originating-IP: [120.242.71.194]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

在 2021/3/27 11:03, teng sterling 写道:
> Wu X.C. <bobwxc@email.cn> 于2021年3月26日周五 下午1:23写道：
>>
>>
>> 在 2021/3/24 23:07, Yanteng Si 写道:
>>> This patch translates Documention/cpu-freq/cpu-drivers.rst into Chinese.
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>    .../zh_CN/cpu-freq/cpu-drivers.rst            | 259 ++++++++++++++++++
>>>    1 file changed, 259 insertions(+)
>>>    create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
>>> new file mode 100644
>>> index 000000000000..27a70f3a9938
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
>>> @@ -0,0 +1,259 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: :doc:`../../../cpu-freq/cpu-drivers`
>>> +:Translator: Yanteng Si <siyanteng@loongson.cn>
>>> +
>>> +.. _cn_cpu-drivers.rst:
>>> +
>>> +
>>> +=======================================
>>> +如何实现一个新的CPUFreq处理器驱动程序？
>>> +=======================================
>>> +
>>> +作者:
>>> +
>>> +
>>> +     - Dominik Brodowski  <linux@brodo.de>
>>> +     - Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> +     - Viresh Kumar <viresh.kumar@linaro.org>
>>> +
>>> +.. Contents
>>> +
>>> +   1.   怎么做？
>>> +   1.1  初始化
>>> +   1.2  Per-CPU 初始化
>>> +   1.3  验证
>>> +   1.4  target 或 target_index 或 setpolicy?
>> target/target_index 或 setpolicy?
> OK!
>>> +   1.5  target/target_index
>>> +   1.6  setpolicy
>>> +   1.7  get_intermediate 与 target_intermediate
>>> +   2.   频率表助手
>>> +
>>> +
>>> +
>>> +1. 怎么做？
>>> +===========
>>> +
>>> +如此，你刚刚得到了一个全新的CPU/芯片组与数据表，并希望为这个CPU/芯片组添加cpufreq
>> 及其数据手册（datasheet），
> OK!
>>> +支持？很好，这里有一些至关重要的提示：
>>> +
>>> +
>>> +1.1 初始化
>>> +----------
>>> +
>>> +首先，在__initcall_level_7 (module_init())或更靠后的函数中检查这个内核是否
>>> +运行在正确的CPU和正确的芯片组上。如果是，则使用cpufreq_register_driver()向
>>> +CPUfreq核心层注册一个cpufreq_driver结构体。
>>> +
>>> +结构体cpufreq_driver应该包含什么成员?
>>> +
>>> + .name - 驱动的名字。
>>> +
>>> + .init - 一个指向per-policy初始化函数的指针。
>>> +
>>> + .verify - 一个指向"verification"函数的指针。
>>> +
>>> + .setpolicy 或 .fast_switch 或 .target 或 .target_index - 差异见
>>> + 下文。
>>> +
>>> +并且可选择
>>> +
>>> + .flags - cpufreq核的提示。
>>> +
>>> + .driver_data - cpufreq驱动程序的特定数据。
>>> +
>>> + .resolve_freq - 返回最适合目标频率的频率。不过并不能改变频率。
>>> +
>>> + .get_intermediate and target_intermediate - 用于在改变CPU频率时切换到稳定
>> 和
> ?
I mean the "and" seems need translate.
>>> + 的频率。
>>> +
>>> + .get - 返回CPU的当前频率。
>>> +
>>> + .bios_limit - 返回HW/BIOS对CPU的最大频率限制值。
>>> +
>>> + .exit - 一个指向per-policy清理函数的指针，该函数在cpu热插拔过程的CPU_POST_DEAD
>>> + 阶段被调用。
>>> +
>>> + .stop_cpu - 一个指向per-policy停止函数的指针，该函数在cpu热插拔过程的CPU_DOWN_PREPARE
>>> + 阶段被调用。
>>> +
>>> + .suspend - 一个指向per-policy暂停函数的指针，该函数在关中断且在该策略的调节器停止
>>> + 后被调用。
>>> +
>>> + .resume - 一个指向per-policy恢复函数的指针，该函数在关中断且在调节器再一次开始前被
>>> + 调用。
>>> +
>>> + .ready - 一个指向per-policy准备函数的指针，该函数在策略完全初始化之后被调用。
>>> +
>>> + .attr - 一个指向NULL结尾的"struct freq_attr"列表的指针，该函数允许导出值到
>>> + sysfs。
>>> +
>>> + .boost_enabled - 如果设置，则启用提升频率。
>> 括注 boost
> ?
则启用提升（boost）频率
>>> +
>>> + .set_boost - 一个指向per-policy函数的指针，该函数用来开启/关闭提升频率功能。
>>> +
>>> +
>>> +1.2 Per-CPU 初始化
>>> +------------------
>>> +
>>> +每当一个新的CPU被注册到设备模型中，或者在cpufreq驱动注册自己之后，如果CPU不存在cpufreq
>> 如果此CPU的cpufreq策略不存在
>>> +策略，则会调用每个策略的初始化函数cpufreq_driver.init。请注意， .init() 和 .exit()例程
>> per-policy
>>
>> routines  程序
> OK!
>>> +只对策略调用一次，而不是对策略管理的每个CPU调用一次。它需要一个 ``struct cpufreq_policy
>>> +*policy`` 作为参数。现在该怎么做呢？
>>> +
>>> +如果有必要，请在你的CPU上激活CPUfreq功能支持。
>>> +
>>> +然后，驱动程序必须填写以下数值:
>>> +
>>> ++-----------------------------------+--------------------------------------+
>>> +|policy->cpuinfo.min_freq _and_          |                                      |
>> 和
>>> +|policy->cpuinfo.max_freq        | 该CPU支持的最低和最高频率（kHz）。   |
>> remove “。”
> OK!
>>> +|                                |                                      |
>>> +|                                |                                      |
>>> ++-----------------------------------+--------------------------------------+
>>> +|policy->cpuinfo.transition_latency |                                      |
>>> +|                                | CPU在两个频率之间切换所需的时间，以  |
>>> +|                                | 纳秒为单位（如果适用，否则指定       |
>> 如适用，
> OK!
>>> +|                                | CPUFREQ_ETERNAL）                    |
>>> ++-----------------------------------+--------------------------------------+
>>> +|policy->cur                     | 该CPU当前的工作频率(如适用)          |
>>> +|                                |                                      |
>>> ++-----------------------------------+--------------------------------------+
>>> +|policy->min,                            |                                      |
>>> +|policy->max,                            |                                      |
>>> +|policy->policy and, if necessary,  |                                           |
>>> +|policy->governor                | 必须包含该cpu的 “默认策略”，片刻后。 |
>> 。稍后会用这些值调用
> OK!
>>> +|                                | 用这些值调用                         |
>>> +|                                | cpufreq_driver.verify and either     |
>>> +|                                | cpufreq_driver.setpolicy or          |
>>> +|                                | cpufreq_driver.target/target_index   |
>>> +|                                |                                      |
>>> ++-----------------------------------+--------------------------------------+
>>> +|policy->cpus                            | 用与这个CPU一起做DVFS的(在线+离线)   |
>>> +|                                | CPU(即与它共享时钟/电压轨)的掩码更新 |
>>> +|                                | 这个                                 |
>>> +|                                |                                      |
>>> ++-----------------------------------+--------------------------------------+
>>> +
>>> +对于设置其中的一些值(cpuinfo.min[max]_freq, policy->min[max])，频率表助手可能会有帮
>>> +助。关于它们的更多信息，请参见第2节。
>>> +
>>> +
>>> +1.3 验证
>>> +--------
>>> +
>>> +当用户决定设置一个新的策略(由 "policy,governor,min,max "组成)时，必须对这个策略进行验证，
>> 引号内多余空格，或请用全角引号
> OK!
>>> +以便纠正不兼容的值。为了验证这些值，cpufreq_verify_within_limits(``struct cpufreq_policy
>>> +*policy``, ``unsigned int min_freq``, ``unsigned int max_freq``)函数可能会有帮助。
>>> +关于频率表助手的详细内容请参见第2节。
>>> +
>>> +您需要确保至少有一个有效频率（或工作范围）在 policy->min 和 policy->max 范围内。如果有必
>>> +要，先增加policy->max，只有在没有办法的情况下，才减少policy->min。
>>> +
>>> +
>>> +1.4 target 或 target_index 或 setpolicy 或 fast_switch?
>>> +-------------------------------------------------------
>>> +
>>> +大多数cpufreq驱动甚至大多数cpu频率升降算法只允许将CPU频率设置为预定义的固定值。对于这些，你
>>> +可以使用->target()，->target_index()或->fast_switch()回调。
>>> +
>>> +有些cpufreq功能的处理器可以自己在某些限制之间切换频率。这些应使用->setpolicy()回调。
>>> +
>>> +
>>> +1.5. target/target_index
>>> +------------------------
>>> +
>>> +target_index调用有两个参数。``struct cpufreq_policy * policy``,和``unsigned int``
>> s/。/：/
>> 删除 ,
> OK!
>>> +索引(进入陈述的频率表)。
>> into the exposed frequency table
>> 陈述？
> 列出？
（于列出的的频率表）

How about this? A little hard to translate :/
>>> +
>>> +当调用这里时，CPUfreq驱动必须设置新的频率。实际频率必须由freq_table[index].frequency决定。
>>> +
>>> +它应该总是在错误的情况下恢复到早期的频率(即policy->restore_freq)，即使我们之前切换到中间频率。
>> 早期  之前的
> OK！
>>> +
>>> +Deprecated
>> 已弃用
> OK!
>>> +----------
>>> +目标调用有三个参数。``struct cpufreq_policy * policy``, unsigned int target_frequency,
>>> +unsigned int relation.
>>> +
>>> +CPUfreq驱动在调用这里时必须设置新的频率。实际的频率必须使用以下规则来确定。
>>> +
>>> +- 紧跟 "目标频率"。
>>> +- policy->min <= new_freq <= policy->max (这必须是有效的!!!)
>>> +- 如果 relation==CPUFREQ_REL_L，尝试选择一个高于或等于 target_freq 的 new_freq。("L代表
>>> +  最低，但不能低于")
>>> +- 如果 relation==CPUFREQ_REL_H，尝试选择一个低于或等于 target_freq 的 new_freq。("H代表
>>> +  最高，但不能高于")
>>> +
>>> +这里，频率表助手可能会帮助你--详见第2节。
>>> +
>>> +1.6. fast_switch
>>> +----------------
>>> +
>>> +这个函数用于从调度器的上下文进行频率切换。并非所有的驱动都要实现它，因为不允许在这个回调中睡眠。这
>>> +个回调必须经过高度优化，以尽可能快地进行切换。
>>> +
>>> +这个函数有两个参数： ``struct cpufreq_policy *policy`` 和 ``unsigned int target_frequency``.
>> 句号
> OK！
>>> +
>>> +
>>> +1.7 setpolicy
>>> +-------------
>>> +
>>> +setpolicy调用只需要一个``struct cpufreq_policy * policy``作为参数。需要将处理器内或芯片组内动态频
>>> +率切换的下限设置为policy->min，上限设置为policy->max，如果支持的话，当policy->policy为
>>> +CPUFREQ_POLICY_PERFORMANCE时选择面向性能的设置，当CPUFREQ_POLICY_POWERSAVE时选择面向省电的设置。
>>> +也可以查看drivers/cpufreq/longrun.c中的参考实现。
>>> +
>>> +1.8 get_intermediate and target_intermediate
>> 和
> OK！
>>> +--------------------------------------------
>>> +
>>> +仅适用于 target_index() 和 CPUFREQ_ASYNC_NOTIFICATION 未设置的驱动。
>>> +
>>> +get_intermediate应该返回一个平台想要切换到的稳定的中间频率，target_intermediate()应该将CPU设置为
>>> +该频率，然后再跳转到'index'对应的频率。核心会负责发送通知，驱动不必在target_intermediate()或
>>> +target_index()中处理。
>>> +
>>> +在驱动程序不想因为某个目标频率切换到中间频率的情况下，它们可以从get_intermediate()中返回'0'。在这种情况
>>> +下，核心将直接调用->target_index()。
>>> +
>>> +注意：->target_index()应该在失败的情况下恢复到policy->restore_freq，因为core会为此发送通知。
>>> +
>>> +
>>> +2. 频率表助手
>>> +=============
>>> +
>>> +由于大多数cpufreq处理器只允许被设置为几个特定的频率，因此，一个带有一些函数的 "频率表 "可能会辅助处理器驱动
>> 如果都是中文，请用全角引号
>>> +程序的一些工作。这样的 "频率表" 由一个cpufreq_frequency_table条目构成的数组组成，"driver_data" 中包
>>> +含了驱动程序的具体数值，"frequency" 中包含了相应的频率，并设置了标志。在表的最后，需要添加一个
>>> +cpufreq_frequency_table条目，频率设置为CPUFREQ_TABLE_END。而如果想跳过表中的一个条目，则将频率设置为
>>> +CPUFREQ_ENTRY_INVALID。这些条目不需要按照任何特定的顺序排序，但如果它们是cpufreq core会对它们进行快速的DVFS，
>> core是否翻译请统一
> core -> 核心
> OK！
>>> +因为搜索最佳匹配会更快。
>>> +
>>> +如果策略在其policy->freq_table字段中包含一个有效的指针，cpufreq表就会被核心自动验证。
>>> +
>>> +cpufreq_frequency_table_verify()保证至少有一个有效的频率在policy->min和policy->max范围内，并且所有其他
>>> +标准都被满足。这对->验证调用很有帮助。
>> the ->verify call
> 验证 -> verify
> OK!
>>> +
>>> +cpufreq_frequency_table_target()是对应于->target阶段的频率表助手。只要把数值传递给这个函数，这个函数就会返
>>> +回包含CPU要设置的频率的频率表条目。
>>> +
>>> +以下宏可以作为cpufreq_frequency_table的迭代器。
>>> +
>>> +cpufreq_for_each_entry(pos, table) - 遍历频率表的所有条目。
>>> +
>>> +cpufreq_for_each_valid_entry(pos, table) - 遍历所有条目，不包括CPUFREQ_ENTRY_INVALID频率。
>>> +使用参数 "pos"--一个``cpufreq_frequency_table * `` 作为循环游标，使用参数 "table"--你想迭代
>> 单连字符
>>
> OK!
>> 这句话读不太通
> code:
> #define cpufreq_for_each_entry(pos, table)      \
>           for (pos = table; pos->frequency != CPUFREQ_TABLE_END; pos++)
>
>   "pos"--``cpufreq_frequency_table * ``用途是作为循环游标（循环计数，just like "i++")
>   "table"--你想迭代的``cpufreq_frequency_table * `` 。
> I surrender, do you have a more appropriate expression?:)
懂了，这样是不是好点？或者你给出的也可以

参数"pos"为一个``cpufreq_frequency_table * `` 
，用作循环游标；参数"table"为你想迭代的``cpufreq_frequency_table * `` 。

Thanks!

Wu X.C.
>>> +的``cpufreq_frequency_table * `` 。
>>> +
>>> +例如::
>>> +
>>> +     struct cpufreq_frequency_table *pos, *driver_freq_table;
>>> +
>>> +     cpufreq_for_each_entry(pos, driver_freq_table) {
>>> +             /* Do something with pos */
>>> +             pos->frequency = ...
>>> +     }
>>> +
>>> +  如果你需要在driver_freq_table中处理pos的位置，不要减去指针，因为它的代价相当高。相反，使用宏
>> 开头空格多余
> OK！
>>> +  cpufreq_for_each_entry_idx() 和 cpufreq_for_each_valid_entry_idx() 。
>> Thanks！
>>
> Sorry! I forgot to CC alexs@kernel.org when I replied to the email
> [PATCH 1/8] T_T
>
> Thanks!
>
> Yan teng

