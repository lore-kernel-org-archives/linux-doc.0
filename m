Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15DAC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 02:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343810AbiF1CsO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Jun 2022 22:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343808AbiF1Crj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Jun 2022 22:47:39 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0443013CD9
        for <linux-doc@vger.kernel.org>; Mon, 27 Jun 2022 19:43:49 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.112.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP9rdarpiEqxgAA--.9211S3;
        Tue, 28 Jun 2022 10:43:42 +0800 (CST)
Message-ID: <85b29345-c2a8-6a92-f03f-94cad0017f68@loongson.cn>
Date:   Tue, 28 Jun 2022 10:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] docs/zh_CN: Add mutex-design Chinese translation
To:     Alex Shi <seakeel@gmail.com>
Cc:     yizhou.tang@shopee.com, Alex Shi <alexs@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        robin.lubin@shopee.com, huangh@sea.com, "Wu X.C." <bobwxc@email.cn>
References: <20220626122210.56704-1-yizhou.tang@shopee.com>
 <20220626122210.56704-3-yizhou.tang@shopee.com>
 <f3ba720a-cc26-09f5-5f24-d0746eed1b64@loongson.cn>
 <CAJy-Amn1D0Q97xfCQwr9Og9e4PSSkCwNAdXejVNVWX_TrqwCaA@mail.gmail.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <CAJy-Amn1D0Q97xfCQwr9Og9e4PSSkCwNAdXejVNVWX_TrqwCaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP9rdarpiEqxgAA--.9211S3
X-Coremail-Antispam: 1UD129KBjvJXoW3JFWUKFyDGFyfJr1kJw15twb_yoW7Cr13p3
        Z2ga4fGFn7Zry7ur1fKw1UZryay3W8Ca129r97J3Z7Kr97tFnrtr17tryDGryIqry0yFWr
        AF4F9r1a9r45Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
        xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
        FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
        0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxv
        r21lc2xSY4AK67AK6r4UMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI
        8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AK
        xVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
        8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E
        87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0x
        ZFpf9x07j1D73UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/27 12:27, Alex Shi 写道:
> On Mon, Jun 27, 2022 at 11:10 AM YanTeng Si <siyanteng@loongson.cn> wrote:
>>
>> 在 2022/6/26 20:22, yizhou.tang@shopee.com 写道:
>>> From: Tang Yizhou <yizhou.tang@shopee.com>
>>>
>>> Translate locking/mutex-design.rst into Chinese.
>>>
>>> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
>>> ---
>>>    .../translations/zh_CN/locking/index.rst      |   2 +-
>>>    .../zh_CN/locking/mutex-design.rst            | 144 ++++++++++++++++++
>>>    2 files changed, 145 insertions(+), 1 deletion(-)
>>>    create mode 100644 Documentation/translations/zh_CN/locking/mutex-design.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
>>> index 76a8be9bf78b..f0b10707668d 100644
>>> --- a/Documentation/translations/zh_CN/locking/index.rst
>>> +++ b/Documentation/translations/zh_CN/locking/index.rst
>>> @@ -14,6 +14,7 @@
>>>    .. toctree::
>>>        :maxdepth: 1
>>>
>>> +    mutex-design
>>>        spinlocks
>>>
>>>    TODOList:
>>> @@ -22,7 +23,6 @@ TODOList:
>>>        * lockdep-design
>>>        * lockstat
>>>        * locktorture
>>> -    * mutex-design
>>>        * rt-mutex-design
>>>        * rt-mutex
>>>        * seqlock
>>> diff --git a/Documentation/translations/zh_CN/locking/mutex-design.rst b/Documentation/translations/zh_CN/locking/mutex-design.rst
>>> new file mode 100644
>>> index 000000000000..fd31017bf8ce
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/locking/mutex-design.rst
>>> @@ -0,0 +1,144 @@
>>> +.. SPDX-License-Identifier: GPL-2.0
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: Documentation/locking/mutex-design.rst
>>> +
>>> +:翻译:
>>> +
>>> +  唐艺舟 Tang Yizhou <tangyeechou@gmail.com>
>>> +
>>> +================
>>> +通用互斥锁子系统
>>> +================
>>> +
>>> +:初稿:
>>> +
>>> +  Ingo Molnar <mingo@redhat.com>
>>> +
>>> +:更新:
>>> +
>>> +  Davidlohr Bueso <davidlohr@hp.com>
>>> +
>>> +什么是互斥锁？
>>> +--------------
>>> +
>>> +在Linux内核中，互斥锁（mutex）指的是一个特殊的加锁原语，它在共享内存系统上
>>> +强制保证序列化，而不仅仅是指在学术界或类似的理论教科书中出现的通用术语“相互
>>> +排斥”。互斥锁是一种睡眠锁，它的行为类似于二进制信号量（semaphores），在
>>> +2006年被引入时[1]，作为后者的替代品。这种新的数据结构提供了许多优点，包括更
>>> +简单的接口，以及在当时更少的代码量（见劣势）。
>>> +
>>> +[1] https://lwn.net/Articles/164802/
>>> +
>>> +实现
>>> +----
>>> +
>>> +互斥锁由“struct mutex”表示，在include/linux/mutex.h中定义，并在
>>> +kernel/locking/mutex.c中实现。这些锁使用一个原子变量（->owner）来跟踪
>>> +它们生命周期内的锁状态。字段owner实际上包含的是指向当前锁所有者的
>>> +`struct task_struct *` 指针，因此如果无人持有锁，则它的值为空（NULL）。
>>> +由于task_struct的指针至少按L1_CACHE_BYTES对齐，低位（3）被用来存储额外
>>> +的状态（例如，等待者列表非空）。在其最基本的形式中，它还包括一个等待队列和
>>> +一个确保对其序列化访问的自旋锁。此外，CONFIG_MUTEX_SPIN_ON_OWNER=y的
>>> +系统使用一个自旋MCS锁（->osq，译注：MCS是两个人名的合并缩写），在下文的
>>> +（ii）中描述。
>>> +
>>> +准备获得一把自旋锁时，有三种可能经过的路径，取决于锁的状态：
>>> +
>>> +(i) 快速路径：试图通过调用cmpxchg()修改锁的所有者为当前任务，以此原子化地
>>> +    获取锁。这只在无竞争的情况下有效（cmpxchg()检查值是否为0，所以3个状态
>>> +    比特必须为0）。如果锁处在竞争状态，代码进入下一个可能的路径。
>>> +
>>> +(ii) 中速路径：也就是乐观自旋，当锁的所有者正在运行并且没有其它优先级更高的
>>> +     任务（need_resched，需要重新调度）准备运行时，当前任务试图自旋来获得
>>> +     锁。原理是，如果锁的所有者正在运行，它很可能不久就会释放锁。互斥锁自旋体
>>> +     使用MCS锁排队，这样只有一个自旋体可以竞争互斥锁。
>>> +
>>> +     MCS锁（由Mellor-Crummey和Scott提出）是一个简单的自旋锁，它具有一些
>>> +     理想的特性，比如公平，以及每个CPU在试图获得锁时在一个本地变量上自旋。
>>> +     它避免了常见的“检测-设置”自旋锁实现导致的昂贵的缓存线跳跃（cacheline
>> how about :
>>
>> 导致的缓存行跳跃（cacheline bouncing）这种昂贵的开销？
> Both look fine. and may we don't have a better way to reflect the fact
> cache bouncing between cpus?

how about cpu核间缓存行弹跳?


Thanks，

Yanteng

> Anyway,
>
> Reviewed-by: Alex Shi <alexs@kernel.org>

