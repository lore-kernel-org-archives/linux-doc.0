Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D07EFC433C1
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 10:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F40661969
	for <linux-doc@archiver.kernel.org>; Sat, 27 Mar 2021 10:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbhC0KiL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 27 Mar 2021 06:38:11 -0400
Received: from [43.250.32.171] ([43.250.32.171]:33332 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229875AbhC0KiK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 27 Mar 2021 06:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=To:From:Date; bh=RuoAnKloLXvk4DEc6TZsFdAR9JOyfiS0sQVsi
        5H6Uh8=; b=bACloTS6STGRNmY2TeEA6mFEldDRPWUBKlCAFmiSpCaoeB6MZBLIc
        uSlE3lwxIH3eGwTTrx7KF3OzRdCcWyjd+6NELgkHiEV5gBgXLETCPdYb6PPwESuB
        PBgHucdyN325vJWw9FLh7VTd+CZVmIvOeUdKcDzzp0GlR7ukfyfzo8=
Received: from [192.168.3.26] (unknown [120.242.71.194])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAnm9EJC19gjsI8AA--.39625S3;
        Sat, 27 Mar 2021 18:38:02 +0800 (CST)
Subject: Re: [PATCH 3/8] docs/zh_CN: add cpu-freq cpufreq-stats.rst
 translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <20210324150731.4512-4-siyanteng@loongson.cn>
 <7bba3243-95ff-adf9-151c-e08d06e95187@email.cn>
 <CAEensMw5v5eQPD4cDjw-zXPCCa7xELMw+vJ2G5CJXPL5mXb=Sg@mail.gmail.com>
From:   "Wu X.C." <bobwxc@email.cn>
Message-ID: <adf49909-2b87-9ccb-fa3e-95b722e8a3f0@email.cn>
Date:   Sat, 27 Mar 2021 18:38:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAEensMw5v5eQPD4cDjw-zXPCCa7xELMw+vJ2G5CJXPL5mXb=Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LCKnCgAnm9EJC19gjsI8AA--.39625S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XFy7JF4DJFy5tr1DXr4fZrb_yoWxXF45pr
        1kWFWxKr4xJryDt3W7Kr4UKr1qyFn3Aw17ury8JrnxtrsFywsrX3WYyryUWrW3WrWDCFyF
        vrn5Ar1Ikr4YyaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvjb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2
        IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48J
        MxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
        xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
        MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
        0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
        JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUUT
        mhUUUUU
X-Originating-IP: [120.242.71.194]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2021/3/27 11:13, yanteng si 写道:
> Wu X.C. <bobwxc@email.cn> 于2021年3月26日周五 下午12:16写道：
>>
>> 在 2021/3/24 23:07, Yanteng Si 写道:
>>> This patch translates Documention/cpu-freq/cpufreq-stats.rst into Chinese.
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>    .../zh_CN/cpu-freq/cpufreq-stats.rst          | 130 ++++++++++++++++++
>>>    1 file changed, 130 insertions(+)
>>>    create mode 100644 Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
>>> new file mode 100644
>>> index 000000000000..d21a317d9659
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/cpu-freq/cpufreq-stats.rst
>>> @@ -0,0 +1,130 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: :doc:`../../../cpu-freq/cpufreq-stats`
>>> +:Translator: Yanteng Si <siyanteng@loongson.cn>
>>> +
>>> +.. _cn_cpufreq-stats.rst:
>>> +
>>> +
>>> +==========================================
>>> +sysfs CPUFreq Stats的一般说明
>>> +==========================================
>>> +
>>> +用户信息
>>> +
>>> +
>>> +作者: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
>>> +
>>> +.. Contents
>>> +
>>> +   1. 简介
>>> +   2. 提供的统计数据(举例说明)
>>> +   3. 配置cpufreq-stats
>>> +
>>> +
>>> +1. 简介
>>> +===============
>>> +
>>> +cpufreq-stats是一个为每个CPU提供CPU频率统计的驱动。
>>> +这些统计数据在/sysfs中以一堆只读接口的形式提供。这个接口（配置好后）将出现在
>> 在配置好后
> OK!
>>> +/sysfs（<sysfs root>/devices/system/cpu/cpuX/cpufreq/stats/）中cpufreq下的一个单
>>> +独的目录中，提供给每个CPU。
>>> +各种统计数据将在此目录下形成只读文件。
>>> +
>>> +这个驱动的设计是独立于任何特定的cpufreq_driver的。可能在你的CPU上运行。因此，它将与所有
>> 此驱动是独立于任何可能运行在你所用CPU上的特定cpufreq_driver而设计的。
> OK!
>>> +cpufreq_driver一起工作。
>>> +
>>> +
>>> +2. 提供的统计数据(举例说明)
>>> +=====================================
>>> +
>>> +cpufreq stats提供了以下统计数据（在下面详细解释）。
>>> +
>>> +-  time_in_state
>>> +-  total_trans
>>> +-  trans_table
>>> +
>>> +所有的统计数据将从统计驱动被插入的时间（或统计被重置的时间）开始，到某一统计数据被读取的时间为止。
>> 插入 use 载入？or another better word?
> I like "载入"
> OK!
>>> +显然，统计驱动不会有任何关于统计驱动插入之前的频率转换信息。
>>> +
>>> +::
>>> +
>>> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # ls -l
>>> +    total 0
>>> +    drwxr-xr-x  2 root root    0 May 14 16:06 .
>>> +    drwxr-xr-x  3 root root    0 May 14 15:58 ..
>>> +    --w-------  1 root root 4096 May 14 16:06 reset
>>> +    -r--r--r--  1 root root 4096 May 14 16:06 time_in_state
>>> +    -r--r--r--  1 root root 4096 May 14 16:06 total_trans
>>> +    -r--r--r--  1 root root 4096 May 14 16:06 trans_table
>>> +
>>> +- **reset**
>>> +
>>> +只写属性，可用于重置统计计数器。这对于评估不同调节器下的系统行为非常有用，且无需重启。
>>> +
>>> +
>>> +- **time_in_state**
>>> +
>>> +这就给出了这个CPU所支持的每个频率所花费的时间。cat输出的每一行都会有"<frequency>
>> 此项给出了…
> OK!
>>> +<time>"对，表示这个CPU在<frequency>上花费了<time>个usertime单位的时间。这里的
>>> +usertime单位是10mS（类似于/proc中输出的其他时间）。
>>> +
>>> +::
>>> +
>>> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat time_in_state
>>> +    3600000 2089
>>> +    3400000 136
>>> +    3200000 34
>>> +    3000000 67
>>> +    2800000 172488
>>> +
>>> +
>>> +- **total_trans**
>>> +
>>> +给出了这个CPU上频率转换的总次数。cat的输出将有一个单一的计数，这就是频率转换的总数。
>>> +
>>> +::
>>> +
>>> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat total_trans
>>> +    20
>>> +
>>> +- **trans_table**
>>> +
>>> +这将提供所有CPU频率转换的细粒度信息。这里的cat输出是一个二维矩阵，其中一个条目<i, j>（第
>>> +i行，第j列）代表从Freq_i到Freq_j的转换次数。Freq_i行和Freq_j列遵循驱动最初提供给cpufreq
>>> +核的频率表的排序顺序，因此可以排序（升序或降序）或不排序。 这里的输出也包含了每行每列的实际
>> 排列顺序
> ?
Nothing, keep it.
Ignore this comment.  >_<
>>> +频率值，以便更好地阅读。
>>> +
>>> +如果转换表大于PAGE_SIZE，读取时将返回一个-EFBIG错误。
>>> +
>>> +::
>>> +
>>> +    <mysystem>:/sys/devices/system/cpu/cpu0/cpufreq/stats # cat trans_table
>>> +    From  :    To
>>> +         :   3600000   3400000   3200000   3000000   2800000
>>> +    3600000:         0         5         0         0         0
>>> +    3400000:         4         0         2         0         0
>>> +    3200000:         0         1         0         2         0
>>> +    3000000:         0         0         1         0         3
>>> +    2800000:         0         0         0         2         0
>>> +
>>> +3. 配置cpufreq-stats
>>> +============================
>>> +
>>> +要在你的内核中配置cpufreq-stats。::
>> remove the “。”
> OK!
>>> +
>>> +     Config Main Menu
>>> +             Power management options (ACPI, APM)  --->
>>> +                     CPU Frequency scaling  --->
>>> +                             [*] CPU Frequency scaling
>>> +                             [*]   CPU frequency translation statistics
>>> +
>>> +
>>> +"CPU Frequency scaling" (CONFIG_CPU_FREQ) 应该被启用以配置cpufreq-stats。
>>> +
>>> +"CPU frequency translation statistics" (CONFIG_CPU_FREQ_STAT)提供了包括
>>> +time_in_state、total_trans和trans_table的统计数据。
>>> +
>>> +一旦启用了这个选项，并且你的CPU支持cpufrequency，你就可以在/sysfs中看到CPU频率统计。
>> Thanks!
>>
> Thanks!
>
> Yanteng

