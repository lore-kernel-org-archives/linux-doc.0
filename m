Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BA9CC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 08:24:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239166AbhLFI1x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:27:53 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:32878 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239064AbhLFI1x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 03:27:53 -0500
Received: from dggpeml500025.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J6xKm3DDlzcbkb;
        Mon,  6 Dec 2021 16:24:12 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500025.china.huawei.com (7.185.36.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 16:24:23 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 16:24:22 +0800
Subject: Re: [PATCH v3 1/3] docs/zh_CN: add scheduler sched-arch translation
To:     yanteng si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Alex Shi" <alexs@kernel.org>, Wu XiangCheng <bobwxc@email.cn>,
        Alex Shi <seakeel@gmail.com>
CC:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>, <kolyshkin@gmail.com>,
        <changhuaixin@linux.alibaba.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Yeechou Tang <tangyeechou@gmail.com>, <zhengbin13@huawei.com>
References: <cover.1638517064.git.siyanteng@loongson.cn>
 <f9e66ba8920bc1bb3f1d67044f64712fa30db7c9.1638517064.git.siyanteng@loongson.cn>
 <CAEensMwbdxmjXKa2Tqqh4f2Bw--_8owW=W4ngFs2tU0fJrBe=w@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <35a537d9-0457-746d-7a52-897e45bd2932@huawei.com>
Date:   Mon, 6 Dec 2021 16:24:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAEensMwbdxmjXKa2Tqqh4f2Bw--_8owW=W4ngFs2tU0fJrBe=w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.232]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/12/6 16:01, yanteng si wrote:
> Yanteng Si <siyanteng01@gmail.com> 于2021年12月3日周五 16:04写道：
>>
>> From: Yanteng Si <siyanteng01@gmail.com>
>>
>> Translate .../scheduler/sched-arch.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>  .../translations/zh_CN/scheduler/index.rst    |  2 +-
>>  .../zh_CN/scheduler/sched-arch.rst            | 76 +++++++++++++++++++
>>  2 files changed, 77 insertions(+), 1 deletion(-)
>>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-arch.rst
>>
>> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
>> index 5ec71e6043ae..797df3a9c66f 100644
>> --- a/Documentation/translations/zh_CN/scheduler/index.rst
>> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
>> @@ -20,11 +20,11 @@ Linux调度器
>>      :maxdepth: 1
>>
>>      completion
>> +    sched-arch
>>
>>
>>  TODOList:
>>
>> -    sched-arch
>>      sched-bwc
>>      sched-deadline
>>      sched-design-CFS
>> diff --git a/Documentation/translations/zh_CN/scheduler/sched-arch.rst b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
>> new file mode 100644
>> index 000000000000..754a15c6b60f
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/scheduler/sched-arch.rst
>> @@ -0,0 +1,76 @@
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: Documentation/scheduler/sched-arch.rst
>> +
>> +:翻译:
>> +
>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>> +
>> +:校译:
>> +
>> +
>> +
>> +===============================
>> +架构特定代码的CPU调度器实现提示
>> +===============================
>> +
>> +       Nick Piggin, 2005
>> +
>> +上下文切换
>> +==========
>> +1. 运行队列锁
>> +默认情况下，switch_to arch函数在调用时锁定了运行队列。这通常不是一个问题，除非
>> +switch_to可能需要获取运行队列锁。这通常是由于上下文切换中的唤醒操作造成的。见
>> +arch/ia64/include/asm/switch_to.h的例子。
>> +
>> +为了要求调度器在运行队列解锁的情况下调用switch_to，你必须在头文件
>> +中`#define __ARCH_WANT_UNLOCKED_CTXSW`(通常是定义switch_to的那个文件）。
>> +
>> +在CONFIG_SMP的情况下，解锁的上下文切换对核心调度器的实现只带来了非常小的性能损
>> +失。
>> +
>> +CPU空转

这里别翻译比较好，CPU idle是一个特性。空转肯定不对。

>> +=======
>> +你的cpu_idle程序需要遵守以下规则：
>> +
>> +1. 现在抢占应该在空闲的例程上禁用。应该只在调用schedule()时启用，然后再禁>> +
>> +2. need_resched/TIF_NEED_RESCHED 只会被设置，并且在运行任务调用 schedule()
>> +   之前永远不会被清除。空闲线程只需要查询need_resched，并且永远不会设置或清除它。

空闲 -> idle

>> +
>> +3. 当cpu_idle发现（need_resched() == 'true'），它应该调用schedule()。否则
>> +   它不应该调用schedule()。
>> +
>> +4. 在检查need_resched时，唯一需要禁用中断的情况是，我们要让处理器休眠到下一个中
>> +   断（这并不对need_resched提供任何保护，它可以防止丢失一个中断）:
>> +
>> +       4a. 这种睡眠类型的常见问题似乎是::
>> +
>> +               local_irq_disable();
>> +               if (!need_resched()) {
>> +                       local_irq_enable();
>> +                       *** resched interrupt arrives here ***
>> +                       __asm__("sleep until next interrupt");
>> +               }
>> +
>> +5. 当need_resched变为高电平时，TIF_POLLING_NRFLAG可以由不需要中断来唤醒它们

高电平：我觉得可以加个“（译注：为真）”

>> +   的空闲程序设置。换句话说，它们必须定期轮询need_resched，尽管做一些后台工作或

可以由不需要中断来唤醒它们的空闲程序设置 -> 可以由不需要中断唤醒的idle例程设置

>> +   进入低CPU优先级可能是合理的。
>> +
>> +      - 5a. 如果TIF_POLLING_NRFLAG被设置，而我们确实决定进入一个中断睡眠，那
>> +            么需要清除它，然后发出一个内存屏障（接着测试need_resched，禁用中断，如3中解释）。

接着测试need_resched，禁用中断 -> 接着在禁用中断的条件下测试need_resched

>> +
>> +arch/x86/kernel/process.c有轮询和睡眠空闲函数的例子。

空闲 可以不翻译

>> +
>> +
>> +可能出现的arch/问题
>> +===================
>> +
>> +我发现的可能的arch问题（并试图解决或没有解决）。:
>> +
>> +ia64 - safe_halt的调用与中断相比，是否很荒谬？ (它睡眠了吗) (参考 #4a)

safe_halt的调用与中断相比，是否很荒谬 -> safe_halt的调用是否与中断发生了竞争

>> +
>> +sh64 - 睡眠与中断相比，是否很荒谬？ (参考 #4a)

睡眠与中断相比，是否很荒谬 -> 睡眠和中断发生竞争了吗

>> +
>> +sparc - 在这一点上，IRQ是开着的（？），把local_irq_save改为_disable。
>> +      - 待办事项: 需要第二个CPU来禁用抢占 (参考 #1)
>> --
>> 2.27.0
>>
> 
> CC    Yizhou tangyizhou@huawei.com
> 
> Thanks,
> Yanteng
> 

总的来看，这篇文章太老了，我觉得可以邀请原作者更新一下...
