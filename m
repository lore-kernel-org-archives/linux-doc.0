Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A3EC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 09:52:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241541AbhLFJzo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 04:55:44 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:15703 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241535AbhLFJzn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 04:55:43 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J6zD44QKszZdWQ;
        Mon,  6 Dec 2021 17:49:24 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 17:52:12 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 17:52:11 +0800
Subject: Re: [PATCH v3 1/3] docs/zh_CN: add scheduler sched-arch translation
To:     yanteng si <siyanteng01@gmail.com>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Wu XiangCheng <bobwxc@email.cn>,
        "Huacai Chen" <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, <kolyshkin@gmail.com>,
        <changhuaixin@linux.alibaba.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        "Yeechou Tang" <tangyeechou@gmail.com>, <zhengbin13@huawei.com>
References: <cover.1638517064.git.siyanteng@loongson.cn>
 <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
 <CAEensMwbdxmjXKa2Tqqh4f2Bw--_8owW=W4ngFs2tU0fJrBe=w@mail.gmail.com>
 <35a537d9-0457-746d-7a52-897e45bd2932@huawei.com>
 <CAEensMx7qmK9zvK0kgoawhMdwPWNkBrEFXNr3oHmNJEznF+YbQ@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <f6a10951-8201-8035-e108-01a73399e1cf@huawei.com>
Date:   Mon, 6 Dec 2021 17:52:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAEensMx7qmK9zvK0kgoawhMdwPWNkBrEFXNr3oHmNJEznF+YbQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/6 17:03, yanteng si wrote:
> Tang Yizhou <tangyizhou@huawei.com> 于2021年12月6日周一 16:24写道：
>>
>> On 2021/12/6 16:01, yanteng si wrote:
>>> Yanteng Si <siyanteng01@gmail.com> 于2021年12月3日周五 16:04写道：
>>>>
>>>> From: Yanteng Si <siyanteng01@gmail.com>
>>>>
>>>> Translate .../scheduler/sched-arch.rst into Chinese.
>>>>
>>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>>> ---
>>>>  .../translations/zh_CN/scheduler/index.rst    |  2 +-
>>>>  .../zh_CN/scheduler/sched-arch.rst            | 76 +++++++++++++++++++
>>>>  2 files changed, 77 insertions(+), 1 deletion(-)
>>>>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst
>>>>
>>>> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
>>>> index 5ec71e6043ae..797df3a9c66f 100644
>>>> --- a/Documentation/translations/zh_CN/scheduler/index.rst
>>>> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
>>>> @@ -20,11 +20,11 @@ Linux调度器
>>>>      :maxdepth: 1
>>>>
>>>>      completion
>>>> +    sched-arch
>>>>
>>>>
>>>>  TODOList:
>>>>
>>>> -    sched-arch
>>>>      sched-bwc
>>>>      sched-deadline
>>>>      sched-design-CFS
>>>> diff --git a/Documentation/translations/zh_CN/scheduler/sched-arch.rst b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
>>>> new file mode 100644
>>>> index 000000000000..754a15c6b60f
>>>> --- /dev/null
>>>> +++ b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
>>>> @@ -0,0 +1,76 @@
>>>> +.. include:: ../disclaimer-zh_CN.rst
>>>> +
>>>> +:Original: Documentation/scheduler/sched-arch.rst
>>>> +
>>>> +:翻译:
>>>> +
>>>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>>>> +
>>>> +:校译:
>>>> +
>>>> +
>>>> +
>>>> +===============================
>>>> +架构特定代码的CPU调度器实现提示
>>>> +===============================
>>>> +
>>>> +       Nick Piggin, 2005
>>>> +
>>>> +上下文切换
>>>> +==========
>>>> +1. 运行队列锁
>>>> +默认情况下，switch_to arch函数在调用时锁定了运行队列。这通常不是一个问题，除非
>>>> +switch_to可能需要获取运行队列锁。这通常是由于上下文切换中的唤醒操作造成的。见
>>>> +arch/ia64/include/asm/switch_to.h的例子。
>>>> +
>>>> +为了要求调度器在运行队列解锁的情况下调用switch_to，你必须在头文件
>>>> +中`#define __ARCH_WANT_UNLOCKED_CTXSW`(通常是定义switch_to的那个文件）。
>>>> +
>>>> +在CONFIG_SMP的情况下，解锁的上下文切换对核心调度器的实现只带来了非常小的性能损
>>>> +失。
>>>> +
>>>> +CPU空转
>>
>> 这里别翻译比较好，CPU idle是一个特性。空转肯定不对。
> If you can explain what cpu idle is, I'll use idle. :)

Alex, I want to discuss how to translate the terms (especially nouns) of computer science
and engineering into Chinese.

IMHO, terms of computer science and engineering are much different from terms in other
science and engineering disciplines as they usually come from our daily life. Maybe it is
much better not to translate them and just keep the English terms there. For example,
there isn't a conventional Chinese translate of 'CPU idle'. We don't need to be the first
to give it a Chinese translation. Should we translate them into Chinese, I feel awkward
because the rest of the text is serious and rigorous. 

On the other hand, an experienced Chinese kernel developer may be confused when read the
Chinese translations of kernel feature names, e.g. 'CPU idle' here.  People who can read
the kernel documentation are not babies, and they at least have some English fundamentals.

Futhermore, I think it will be clarified more clearly if we both provide English and
Chinese at the same time in the case when there isn't a conventional Chinese translate but
we do want to provide one.

The above principles are applied in my recent translation of sched-capacity.rst. You can
also comment there.

Thanks,
Tang. 

>>
>>>> +=======
>>>> +你的cpu_idle程序需要遵守以下规则：
>>>> +
>>>> +1. 现在抢占应该在空闲的例程上禁用。应该只在调用schedule()时启用，然后再禁>> +
>>>> +2. need_resched/TIF_NEED_RESCHED 只会被设置，并且在运行任务调用 schedule()
>>>> +   之前永远不会被清除。空闲线程只需要查询need_resched，并且永远不会设置或清除它。
>>
>> 空闲 -> idle
>>
>>>> +
>>>> +3. 当cpu_idle发现（need_resched() == 'true'），它应该调用schedule()。否则
>>>> +   它不应该调用schedule()。
>>>> +
>>>> +4. 在检查need_resched时，唯一需要禁用中断的情况是，我们要让处理器休眠到下一个中
>>>> +   断（这并不对need_resched提供任何保护，它可以防止丢失一个中断）:
>>>> +
>>>> +       4a. 这种睡眠类型的常见问题似乎是::
>>>> +
>>>> +               local_irq_disable();
>>>> +               if (!need_resched()) {
>>>> +                       local_irq_enable();
>>>> +                       *** resched interrupt arrives here ***
>>>> +                       __asm__("sleep until next interrupt");
>>>> +               }
>>>> +
>>>> +5. 当need_resched变为高电平时，TIF_POLLING_NRFLAG可以由不需要中断来唤醒它们
>>
>> 高电平：我觉得可以加个“（译注：为真）”
> Agree!
>>
>>>> +   的空闲程序设置。换句话说，它们必须定期轮询need_resched，尽管做一些后台工作或
>>
>> 可以由不需要中断来唤醒它们的空闲程序设置 -> 可以由不需要中断唤醒的idle例程设置
>>
>>>> +   进入低CPU优先级可能是合理的。
>>>> +
>>>> +      - 5a. 如果TIF_POLLING_NRFLAG被设置，而我们确实决定进入一个中断睡眠，那
>>>> +            么需要清除它，然后发出一个内存屏障（接着测试need_resched，禁用中断，如3中解释）。
>>
>> 接着测试need_resched，禁用中断 -> 接着在禁用中断的条件下测试need_resched
> OK, thanks!
>>
>>>> +
>>>> +arch/x86/kernel/process.c有轮询和睡眠空闲函数的例子。
>>
>> 空闲 可以不翻译
> OK, thanks!
>>
>>>> +
>>>> +
>>>> +可能出现的arch/问题
>>>> +===================
>>>> +
>>>> +我发现的可能的arch问题（并试图解决或没有解决）。:
>>>> +
>>>> +ia64 - safe_halt的调用与中断相比，是否很荒谬？ (它睡眠了吗) (参考 #4a)
>>
>> safe_halt的调用与中断相比，是否很荒谬 -> safe_halt的调用是否与中断发生了竞争
> OK, thanks!
>>
>>>> +
>>>> +sh64 - 睡眠与中断相比，是否很荒谬？ (参考 #4a)
>>
>> 睡眠与中断相比，是否很荒谬 -> 睡眠和中断发生竞争了吗
> OK, thanks!
>>
>>>> +
>>>> +sparc - 在这一点上，IRQ是开着的（？），把local_irq_save改为_disable。
>>>> +      - 待办事项: 需要第二个CPU来禁用抢占 (参考 #1)
>>>> --
>>>> 2.27.0
>>>>
>>>
>>> CC    Yizhou tangyizhou@huawei.com
>>>
>>> Thanks,
>>> Yanteng
>>>
>>
>> 总的来看，这篇文章太老了，我觉得可以邀请原作者更新一下...
> In fact, I appreciate you doing it even more. :-)
> 
> BTW:
> 
> The mailing list has many friends who are not good at Chinese, so
> let's communicate in English.
> 
> Thanks,
> Yanteng
> 
