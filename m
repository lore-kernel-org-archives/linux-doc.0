Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE02C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  8 Jan 2022 11:15:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231545AbiAHLPt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 8 Jan 2022 06:15:49 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:31148 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbiAHLPs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 8 Jan 2022 06:15:48 -0500
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JWHWS40ksz8wC3;
        Sat,  8 Jan 2022 19:13:08 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 8 Jan 2022 19:15:46 +0800
Received: from [10.174.177.232] (10.174.177.232) by
 dggpeml500006.china.huawei.com (7.185.36.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 8 Jan 2022 19:15:46 +0800
Subject: Re: [PATCH 3/3] docs/zh_CN: add balance translation
To:     yanteng si <siyanteng01@gmail.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>
References: <cover.1641522956.git.siyanteng@loongson.cn>
 <db7c8ce73e551ef5b855505f4eb2ebd233693174.1641522956.git.siyanteng@loongson.cn>
 <0f451c3e-0b5c-ffad-75a8-f1c4bec73a9e@huawei.com>
 <CAEensMzMD6y3KTNYZp1YejD=bDvzBf6CMOftDuHzZPS5NX113A@mail.gmail.com>
From:   Tang Yizhou <tangyizhou@huawei.com>
Message-ID: <703165b6-700a-df5d-74f1-3bb416c64341@huawei.com>
Date:   Sat, 8 Jan 2022 19:15:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <CAEensMzMD6y3KTNYZp1YejD=bDvzBf6CMOftDuHzZPS5NX113A@mail.gmail.com>
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

On 2022/1/8 17:57, yanteng si wrote:
> Tang Yizhou <tangyizhou@huawei.com> 于2022年1月7日周五 20:26写道：
>>
>> On 2022/1/7 10:40, Yanteng Si wrote:
>>> Translate .../vm/balance.rst into Chinese.
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> ---
>>>  .../translations/zh_CN/vm/balance.rst         | 81 +++++++++++++++++++
>>>  Documentation/translations/zh_CN/vm/index.rst |  2 +-
>>>  2 files changed, 82 insertions(+), 1 deletion(-)
>>>  create mode 100644 Documentation/translations/zh_CN/vm/balance.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/vm/balance.rst b/Documentation/translations/zh_CN/vm/balance.rst
>>> new file mode 100644
>>> index 000000000000..1cc7555650de
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/vm/balance.rst
>>> @@ -0,0 +1,81 @@
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: Documentation/vm/balance.rst
>>> +
>>> +:翻译:
>>> +
>>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>>> +
>>> +:校译:
>>> +
>>> +
>>> +========
>>> +内存平衡
>>> +========
>>> +
>>> +2000年1月开始，作者：Kanoj Sarcar <kanoj@sgi.com>
>>> +
>>> +对于 !__GFP_HIGH 和 !__GFP_KSWAPD_RECLAIM 以及非 __GFP_IO 的分配，需要进行
>>> +内存平衡。
>>> +
>>> +调用者避免回收的第一个原因是调用者由于持有自旋锁或处于中断环境中而无法睡眠。第二个
>>> +原因可能是，调用者愿意在不产生页面回收开销的情况下失败分配。这可能发生在有0阶回退
>>
>> 失败分配 -> 分配失败
> OK, Thanks!
>>
>>> +选项的机会主义高阶分配请求中。在这种情况下，调用者可能也希望避免唤醒kswapd。
>>> +
>>> +__GFP_IO分配请求是为了防止文件系统死锁。
>>> +
>>> +在没有非睡眠分配请求的情况下，做平衡似乎是有害的。页面回收可以被懒散地启动，也就是
>>
>> 启动：这里可能可以翻译成“踢出”。大意就是不用的时候不启动。
> "kicked off" is a football term, In Chinese, it means 开球.
> 日常使用中都是用做：启动、执行
> eg: Apart from Nasa, missions from the UAE and China to Mars also
> kicked off last year.
> China kicked off the protection program in 2012.

OK. That's my fault!

Thanks,
Tang

> 
> 
>>> +说，只有在需要的时候（也就是空闲内存为0的区域），而不是让它成为一个主动的过程。
>>
>> 空闲内存为0的区域 -> 区域的空闲内存为0
> OK, Thanks!
>>
>>> +
>>> +也就是说，内核应该尝试从直接映射池中满足对直接映射页的请求，而不是回落到dma池中，
>>
>> 回落 -> 回退，这个应该是比较通行的翻译
> great!
>>
>>> +这样就可以保持dma池为dma请求（不管是不是原子的）所填充。类似的说法也适用于高内存
>>
>> 说法 -> 争论
> OK, Thanks!
>>
>>> +和直接映射的页面。相反，如果有很多空闲的dma页，最好是通过从dma池中分配一个来满足
>>> +常规的内存请求，而不是产生常规区域平衡的开销。
>>> +
>>> +在2.2中，只有当空闲页总数低于总内存的1/64时，才会启动内存平衡/页面回收。如果dma
>>
>> 这里翻译没问题。对照上文的kick off，可知就是踢出或者不运行的意思。
>>
>>> +和普通内存的比例合适，即使dma区完全空了，也很可能不会进行平衡。2.2已经在不同内存
>>
>> 普通内存：注意你在上文翻译了“常规区域”。普通和常规，两个词统一一下吧。
> OK, Thanks!
>>
>>> +大小的生产机器上运行，即使有这个问题存在，似乎也做得不错。在2.3中，由于HIGHMEM的
>>> +存在，这个问题变得更加严重。
>>> +
>>> +在2.3中，区域平衡可以用两种方式之一来完成：根据区域的大小（可能还有低级区域的大小），
>>
>> 可能还有 -> 可能是
> OK, Thanks!
>>
>>> +我们可以在初始化阶段决定在平衡任何区域时应该争取多少空闲页。好的方面是，在平衡的时
>>> +候，我们不需要看低级区的大小，坏的方面是，我们可能会因为忽略低级区可能较低的使用率
>>> +而做过于频繁的平衡。另外，只要对分配程序稍作修改，就有可能将memclass()宏简化为一
>>> +个简单的等式。
>>> +
>>> +另一个可能的解决方案是，我们只在一个区 **和** 其所有低级区的空闲内存低于该区及其
>>> +低级区总内存的1/64时进行平衡。这就解决了2.2的平衡问题，并尽可能地保持了与2.2行为
>>> +的接近。另外，平衡算法在各种架构上的工作方式也是一样的，这些架构有不同数量和类型的
>>> +内存区。如果我们想变得更花哨一点，我们可以在未来为不同区域的自由页面分配不同的权重。
>>> +
>>> +请注意，如果普通区的大小与dma区相比是巨大的，那么在决定是否平衡普通区的时候，考虑
>>> +空闲的dma页就变得不那么重要了。那么第一个解决方案就变得更有吸引力。
>>> +
>>> +所附的补丁实现了第二个解决方案。它还 “修复”了两个问题：首先，在低内存条件下，kswapd
>>> +被唤醒，就像2.2中的非睡眠分配。第二，HIGHMEM区也被平衡了，以便给replace_with_highmem()
>>> +一个争取获得HIGHMEM页的机会，同时确保HIGHMEM分配不会落回普通区。这也确保了HIGHMEM
>>> +页不会被泄露（例如，在一个HIGHMEM页在交换缓存中但没有被任何人使用的情况下）。
>>> +
>>> +kswapd还需要知道它应该平衡哪些区。kswapd主要是在无法进行平衡的情况下需要的，可能
>>> +是因为所有的分配请求都来自intr context，而所有的进程上下文都在睡眠。对于2.3，
>>
>> intr context -> 中断上下文
> OK, Thanks!
>>
>>> +kswapd并不真正需要平衡高内存区，因为intr context并不请求高内存页。kswapd看zone
>>> +结构体中的zone_wake_kswapd字段来决定一个区是否需要平衡。
>>> +
>>> +如果从进程内存和shm中偷取页面可以减轻该页面节点中任何区的内存压力，而该区的内存压力
>>> +已经低于其水位，则会进行偷取。
>>> +
>>> +watemark[WMARK_MIN/WMARK_LOW/WMARK_HIGH]/low_on_memory/zone_wake_kswapd：
>>> +这些是每个区的字段，用于确定一个区何时需要平衡。当页面数低于水位[WMARK_MIN]时，
>>> +hysteric 的字段low_on_memory被设置。这个字段会一直被设置，直到空闲页数变成水位
>>> +[WMARK_HIGH]。当low_on_memory被设置时，页面分配请求将尝试释放该区域的一些页面（如果
>>> +请求中设置了GFP_WAIT）。与此正交的是，决定戳开kswapd以释放一些区的页。这个决定不是基于
>>
>> 正交 -> 相反。戳开 -> 唤醒。
> OK, Thanks!
>>
>>> +hysteresis 的，而是当空闲页的数量低于watermark[WMARK_LOW]时就会进行；在这种情况下，
>>> +zone_wake_kswapd也被设置。
>>> +
>>> +
>>> +我所听到的（超棒的）想法：
>>> +
>>> +1. 动态实践应该影响平衡：可以跟踪一个区的失败请求的数量，并反馈到平衡方案中（jalvo@mbay.net）。
>>
>> 实践 -> 经历
> OK, Thanks!
> 
> Thank you very much!
> 
> Thanks,
> Yanteng
>>
>>> +
>>> +2. 实现一个类似于replace_with_highmem()的replace_with_regular()，以保留dma页面。
>>> +   (lkd@tantalophile.demon.co.uk)
>>> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
>>> index 5fcdb75d8682..fc39f0d60318 100644
>>> --- a/Documentation/translations/zh_CN/vm/index.rst
>>> +++ b/Documentation/translations/zh_CN/vm/index.rst
>>> @@ -22,10 +22,10 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
>>>     :maxdepth: 1
>>>
>>>     active_mm
>>> +   balance
>>>
>>>  TODOLIST:
>>>  * arch_pgtable_helpers
>>> -* balance
>>>  * damon/index
>>>  * free_page_reporting
>>>  * frontswap
>>>
