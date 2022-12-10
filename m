Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E50EC4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiLJDLa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLJDL3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:11:29 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 534BC55CA9
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:11:28 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8Dx+Ojf+JNj35cEAA--.7235S3;
        Sat, 10 Dec 2022 11:11:27 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8AxiFfe+JNjafApAA--.19635S3;
        Sat, 10 Dec 2022 11:11:26 +0800 (CST)
Message-ID: <42dff1c7-dea1-cc59-300a-2212b2494032@loongson.cn>
Date:   Sat, 10 Dec 2022 11:11:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 06/13] docs/zh_CN: Update the translation of kasan to
 6.1-rc8
Content-Language: en-US
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <bbb8e1702cb9739f43bf872428c130e90cfaf3b4.1670502763.git.siyanteng@loongson.cn>
 <Y5LkvRULM6N7EILs@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y5LkvRULM6N7EILs@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxiFfe+JNjafApAA--.19635S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3JFWxKF1ktw15uF1DJFyUGFg_yoWxXw13pF
        9rWa48Cr4a9F1Yqry2yr4DZry5C3s7Ca4xAry5K3s3J3yDC39rtrZ29FyDWry8WryxJFyv
        ywnYyF1rZr42q37anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E
        87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8
        JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
        YxBIdaVFxhVjvjDU0xZFpf9x07jz2NtUUUUU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 12/9/22 15:33, Wu XiangCheng 写道:
>> Update to commit cd36d84d2571 ("kasan: allow sampling
>> page_alloc allocations for HW_TAGS")
>>
>> Commit 80b92bfe3bb7 ("kasan: dynamically allocate
>> stack ring entries")
>> Commit 7ebfce331251 ("kasan: support kasan.stacktrace
>> for SW_TAGS")
>> Commit ca89f2a2e66d ("kasan: move boot parameters
>> section in documentation")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/dev-tools/kasan.rst    | 77 +++++++++++--------
>>   1 file changed, 44 insertions(+), 33 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
>> index fe76cbe77ad6..c645b1b6cc53 100644
>> --- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
>> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
>> @@ -90,6 +90,50 @@ KASAN只支持SLUB。
>>   ``CONFIG_STACKTRACE`` 。要包括受影响物理页面的分配和释放堆栈跟踪的话，
>>   请启用 ``CONFIG_PAGE_OWNER`` 并使用 ``page_owner=on`` 进行引导。
>>   
>> +启动参数
>> +~~~~~~~~
>> +
>> +KASAN受到通用 ``panic_on_warn`` 命令行参数的影响。当它被启用时，KASAN
>> +在打印出错误报告后会使内核恐慌。
>> +
>> +默认情况下，KASAN只对第一个无效的内存访问打印错误报告。使用
>> +``kasan_multi_shot``，KASAN对每一个无效的访问都打印一份报告。这有效地
> 有效地 => 会
ok!
>
>> +禁用了KASAN报告的 ``panic_on_warn``。
>> +
>> +另外，独立于 ``panic_on_warn`` 、 ``kasan.fault=`` boot参数可以用
>> +来控制恐慌和报告行为。
>> +
>> +- ``kasan.fault=report`` 或 ``=panic`` 控制是否只打印KASAN报告或
>> +  同时使内核恐慌（默认： ``报告`` ）。即使 ``kasan_multi_shot`` 被
> 报告 => report
OK！
>
>> +  启用，恐慌也会发生。
>> +
>> +基于软件和硬件标签的KASAN模式（见下面关于各种模式的部分）支持改变堆栈跟
>> +踪收集行为：
>> +
>> +- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用分配和释放堆栈痕
>> +  迹的收集（默认： ``on`` ）。
>> +
>> +- ``kasan.stack_ring_size=<number of entries>`` 指定堆栈环的条
>> +  目数（默认： ``32768`` ）。
>> +
>> +基于硬件标签的KASAN模式是为了在生产中作为一种安全缓解措施使用。因此，它
>> +支持额外的启动参数，允许完全禁用KASAN或控制其功能。
>> +
>> +- ``kasan=off`` 或 ``=on`` 控制KASAN是否被启用（默认： ``on`` ）。
>> +
>> +- ``kasan.mode=sync``, ``=async`` or ``=asymm`` 控制KASAN是否
>> +  被配置为同步、异步或非对称的执行模式（默认： ``同步`` ）。
>> +  同步模式：当标签检查异常发生时，会立即检测到不良访问。
>> +  异步模式：不良访问的检测是延迟的。当标签检查异常发生时，信息被存储在硬
>> +  件中（对于arm64来说是在TFSR_EL1寄存器中）。内核周期性地检查硬件，并\
>> +  且只在这些检查中报告标签异常。
>> +  非对称模式：读取时同步检测不良访问，写入时异步检测。
>> +
>> +- ``kasan.vmalloc=off`` or ``=on`` 禁用或启用vmalloc分配的标记（默认： ``on`` ）。
>> +
>> +- ``kasan.page_alloc.sample=<sampling frequency>`` 使得KASAN
>> +  只对每N次page_alloc分配进行标记，其中N是参数的值（默认值： ``1`` ）。
> Remove previous paragraph.

OK!


Thanks,

Yanteng

>
>> +
>>   错误报告
>>   ~~~~~~~~
>>   
>> @@ -194,39 +238,6 @@ slab对象的描述以及关于访问的内存页的信息。
>>   通用KASAN还报告两个辅助调用堆栈跟踪。这些堆栈跟踪指向代码中与对象交互但不直接
>>   出现在错误访问堆栈跟踪中的位置。目前，这包括 call_rcu() 和排队的工作队列。
>>   
>> -启动参数
>> -~~~~~~~~
>> -
>> -KASAN受通用 ``panic_on_warn`` 命令行参数的影响。启用该功能后，KASAN在打印错误
>> -报告后会引起内核恐慌。
>> -
>> -默认情况下，KASAN只为第一次无效内存访问打印错误报告。使用 ``kasan_multi_shot`` ，
>> -KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告的 ``panic_on_warn`` 。
>> -
>> -另外，独立于 ``panic_on_warn`` , ``kasan.fault=`` 引导参数可以用来控制恐慌和报
>> -告行为:
>> -
>> -- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
>> -  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
>> -
>> -基于硬件标签的KASAN模式（请参阅下面有关各种模式的部分）旨在在生产中用作安全缓解
>> -措施。因此，它支持允许禁用KASAN或控制其功能的附加引导参数。
>> -
>> -- ``kasan=off`` 或 ``=on`` 控制KASAN是否启用 (默认: ``on`` )。
>> -
>> -- ``kasan.mode=sync`` 、 ``=async`` 或 ``=asymm`` 控制KASAN是否配置
>> -  为同步或异步执行模式(默认:``sync`` )。
>> -  同步模式：当标签检查错误发生时，立即检测到错误访问。
>> -  异步模式：延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
>> -  TFSR_EL1寄存器中）。内核会定期检查硬件，并且仅在这些检查期间报告标签错误。
>> -  非对称模式：读取时同步检测不良访问，写入时异步检测。
>> -
>> -- ``kasan.vmalloc=off`` 或 ``=on`` 禁用或启用vmalloc分配的标记（默认：``on`` ）。
>> -
>> -- ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用alloc和free堆栈跟踪收集
>> -  (默认: ``on`` )。
>> -
>> -
>>   实施细则
>>   --------
>>   
>> -- 
>> 2.31.1
>>

