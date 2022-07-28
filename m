Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FD2C04A68
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jul 2022 01:17:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233438AbiG1BR0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jul 2022 21:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbiG1BR0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jul 2022 21:17:26 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2ABB9BE1F
        for <linux-doc@vger.kernel.org>; Wed, 27 Jul 2022 18:17:23 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxI9CZ4+Fiv8Q9AA--.23134S3;
        Thu, 28 Jul 2022 09:17:14 +0800 (CST)
Message-ID: <048a7b13-5461-120f-3c37-205112bcead7@loongson.cn>
Date:   Thu, 28 Jul 2022 09:17:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/8] Docs/zh_CN: Update the translation of kasan to
 5.19-rc8
To:     Alex Shi <seakeel@gmail.com>, alexs@kernel.org, bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <aa1288f1465e8a0997408c4f8cd75465f103c77e.1658740151.git.siyanteng@loongson.cn>
 <fd3c4e23-8738-2cc7-3aa0-f092bde6f780@gmail.com>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <fd3c4e23-8738-2cc7-3aa0-f092bde6f780@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxI9CZ4+Fiv8Q9AA--.23134S3
X-Coremail-Antispam: 1UD129KBjvAXoW3uF47Cw1DtrW8WF4ftF1fJFb_yoW8Gr1UGo
        W3t39xAFs5A3W7W345Jay7tFW7GF1UCFs8AanFyr4qkr4kGrs5C3WDAay7JrW8GFZ8Ar1a
        k3Zag3W3tFy2kryDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYG7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWx
        JVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
        Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwI
        xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
        Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
        IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
        6cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbLiSPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/27 10:15, Alex Shi 写道:
>
> On 7/25/22 17:20, Yanteng Si wrote:
>> update to commit 3ff16d30f593 ("kasan: test:
>> improve failure message in KUNIT_EXPECT_KASAN_FAIL()")
>>
>> c9d1af2b780a ("mm/kasan: move kasan.fault to mm/kasan/report.c")
>> 2d27e5851473 ("kasan: Extend KASAN mode kernel parameter")
>> 8479d7b5be2f ("kasan: documentation updates")
>> c2ec0c8f6877 ("kasan: update documentation")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/dev-tools/kasan.rst    | 117 ++++++++++++------
>>   1 file changed, 77 insertions(+), 40 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/dev-tools/kasan.rst b/Documentation/translations/zh_CN/dev-tools/kasan.rst
>> index 23db9d419047..20f22a5b4c27 100644
>> --- a/Documentation/translations/zh_CN/dev-tools/kasan.rst
>> +++ b/Documentation/translations/zh_CN/dev-tools/kasan.rst
>> @@ -11,34 +11,65 @@
>>   概述
>>   ----
>>   
>> -KernelAddressSANitizer(KASAN)是一种动态内存安全错误检测工具，主要功能是
>> -检查内存越界访问和使用已释放内存的问题。KASAN有三种模式:
>> +Kernel Address SANitizer(KASAN)是一种动态内存安全错误检测工具，主要功能是
>> +检查内存越界访问和使用已释放内存的问题。
>>   
>> -1. 通用KASAN（与用户空间的ASan类似）
>> -2. 基于软件标签的KASAN（与用户空间的HWASan类似）
>> -3. 基于硬件标签的KASAN（基于硬件内存标签）
>> +KASAN有三种模式:
>>   
>> -由于通用KASAN的内存开销较大，通用KASAN主要用于调试。基于软件标签的KASAN
>> -可用于dogfood测试，因为它具有较低的内存开销，并允许将其用于实际工作量。
>> -基于硬件标签的KASAN具有较低的内存和性能开销，因此可用于生产。同时可用于
>> -检测现场内存问题或作为安全缓解措施。
>> +1. 通用KASAN
>> +2. 基于软件标签的KASAN
>> +3. 基于硬件标签的KASAN
>>   
>> -软件KASAN模式（#1和#2）使用编译时工具在每次内存访问之前插入有效性检查，
>> -因此需要一个支持它的编译器版本。
>> +用CONFIG_KASAN_GENERIC启用的通用KASAN，是用于调试的模式，类似于用户空
>> +间的ASan。这种模式在许多CPU架构上都被支持，但它有明显的性能和内存开销。
>>   
>> -通用KASAN在GCC和Clang受支持。GCC需要8.3.0或更高版本。任何受支持的Clang
>> -版本都是兼容的，但从Clang 11才开始支持检测全局变量的越界访问。
>> +基于软件标签的KASAN或SW_TAGS KASAN，通过CONFIG_KASAN_SW_TAGS启用，
>> +可以用于调试和狗粮测试，类似于用户空间HWASan。这种模式只支持arm64，但其
> dogfood testing usually means self testing, so maybe 自我测试 is better?

Great！


Thanks,

Yanteng

>
> Reviewed-by: Alex Shi <alexs@kernel.org>
>
>> +适度的内存开销允许在内存受限的设备上用真实的工作负载进行测试。
>>   
>> -基于软件标签的KASAN模式仅在Clang中受支持。
>> +基于硬件标签的KASAN或HW_TAGS KASAN，用CONFIG_KASAN_HW_TAGS启用，被
>> +用作现场内存错误检测器或作为安全缓解的模式。这种模式只在支持MTE（内存标签
>> +扩展）的arm64 CPU上工作，但它的内存和性能开销很低，因此可以在生产中使用。
>>   
>> -硬件KASAN模式（#3）依赖硬件来执行检查，但仍需要支持内存标签指令的编译器
>> -版本。GCC 10+和Clang 11+支持此模式。
>> +关于每种KASAN模式的内存和性能影响的细节，请参见相应的Kconfig选项的描述。
>>   
>> -两种软件KASAN模式都适用于SLUB和SLAB内存分配器，而基于硬件标签的KASAN目前
>> -仅支持SLUB。
>> +通用模式和基于软件标签的模式通常被称为软件模式。基于软件标签的模式和基于
>> +硬件标签的模式被称为基于标签的模式。
>>   
>> -目前x86_64、arm、arm64、xtensa、s390、riscv架构支持通用KASAN模式，仅
>> -arm64架构支持基于标签的KASAN模式。
>> +支持
>> +----
>> +
>> +体系架构
>> +~~~~~~~~
>> +
>> +在x86_64、arm、arm64、powerpc、riscv、s390和xtensa上支持通用KASAN，
>> +而基于标签的KASAN模式只在arm64上支持。
>> +
>> +编译器
>> +~~~~~~
>> +
>> +软件KASAN模式使用编译时工具在每个内存访问之前插入有效性检查，因此需要一个
>> +提供支持的编译器版本。基于硬件标签的模式依靠硬件来执行这些检查，但仍然需要
>> +一个支持内存标签指令的编译器版本。
>> +
>> +通用KASAN需要GCC 8.3.0版本或更高版本，或者内核支持的任何Clang版本。
>> +
>> +基于软件标签的KASAN需要GCC 11+或者内核支持的任何Clang版本。
>> +
>> +基于硬件标签的KASAN需要GCC 10+或Clang 12+。
>> +
>> +内存类型
>> +~~~~~~~~
>> +
>> +通用KASAN支持在所有的slab、page_alloc、vmap、vmalloc、堆栈和全局内存
>> +中查找错误。
>> +
>> +基于软件标签的KASAN支持slab、page_alloc、vmalloc和堆栈内存。
>> +
>> +基于硬件标签的KASAN支持slab、page_alloc和不可执行的vmalloc内存。
>> +
>> +对于slab，两种软件KASAN模式都支持SLUB和SLAB分配器，而基于硬件标签的
>> +KASAN只支持SLUB。
>>   
>>   用法
>>   ----
>> @@ -53,7 +84,7 @@ arm64架构支持基于标签的KASAN模式。
>>   
>>   对于软件模式，还可以在 ``CONFIG_KASAN_OUTLINE`` 和 ``CONFIG_KASAN_INLINE``
>>   之间进行选择。outline和inline是编译器插桩类型。前者产生较小的二进制文件，
>> -而后者快1.1-2倍。
>> +而后者快2倍。
>>   
>>   要将受影响的slab对象的alloc和free堆栈跟踪包含到报告中，请启用
>>   ``CONFIG_STACKTRACE`` 。要包括受影响物理页面的分配和释放堆栈跟踪的话，
>> @@ -172,21 +203,29 @@ KASAN受通用 ``panic_on_warn`` 命令行参数的影响。启用该功能后
>>   默认情况下，KASAN只为第一次无效内存访问打印错误报告。使用 ``kasan_multi_shot`` ，
>>   KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告的 ``panic_on_warn`` 。
>>   
>> +另外，独立于 ``panic_on_warn`` , ``kasan.fault=`` 引导参数可以用来控制恐慌和报
>> +告行为:
>> +
>> +- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
>> +  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
>> +
>>   基于硬件标签的KASAN模式（请参阅下面有关各种模式的部分）旨在在生产中用作安全缓解
>> -措施。因此，它支持允许禁用KASAN或控制其功能的引导参数。
>> +措施。因此，它支持允许禁用KASAN或控制其功能的附加引导参数。
>>   
>>   - ``kasan=off`` 或 ``=on`` 控制KASAN是否启用 (默认: ``on`` )。
>>   
>> -- ``kasan.mode=sync`` 或 ``=async`` 控制KASAN是否配置为同步或异步执行模式(默认:
>> -  ``sync`` )。同步模式：当标签检查错误发生时，立即检测到错误访问。异步模式：
>> -  延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
>> +- ``kasan.mode=sync`` 、 ``=async`` 或 ``=asymm`` 控制KASAN是否配置
>> +  为同步或异步执行模式(默认:``sync`` )。
>> +  同步模式：当标签检查错误发生时，立即检测到错误访问。
>> +  异步模式：延迟错误访问检测。当标签检查错误发生时，信息存储在硬件中（在arm64的
>>     TFSR_EL1寄存器中）。内核会定期检查硬件，并且仅在这些检查期间报告标签错误。
>> +  非对称模式：读取时同步检测不良访问，写入时异步检测。
>> +
>> +- ``kasan.vmalloc=off`` 或 ``=on`` 禁用或启用vmalloc分配的标记（默认：``on`` ）。
>>   
>>   - ``kasan.stacktrace=off`` 或 ``=on`` 禁用或启用alloc和free堆栈跟踪收集
>>     (默认: ``on`` )。
>>   
>> -- ``kasan.fault=report`` 或 ``=panic`` 控制是只打印KASAN报告还是同时使内核恐慌
>> -  (默认: ``report`` )。即使启用了 ``kasan_multi_shot`` ，也会发生内核恐慌。
>>   
>>   实施细则
>>   --------
>> @@ -244,7 +283,6 @@ KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告
>>   基于软件标签的KASAN使用0xFF作为匹配所有指针标签（不检查通过带有0xFF指针标签
>>   的指针进行的访问）。值0xFE当前保留用于标记已释放的内存区域。
>>   
>> -基于软件标签的KASAN目前仅支持对Slab和page_alloc内存进行标记。
>>   
>>   基于硬件标签的KASAN模式
>>   ~~~~~~~~~~~~~~~~~~~~~~~
>> @@ -262,8 +300,6 @@ KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告
>>   基于硬件标签的KASAN使用0xFF作为匹配所有指针标签（不检查通过带有0xFF指针标签的
>>   指针进行的访问）。值0xFE当前保留用于标记已释放的内存区域。
>>   
>> -基于硬件标签的KASAN目前仅支持对Slab和page_alloc内存进行标记。
>> -
>>   如果硬件不支持MTE（ARMv8.5之前），则不会启用基于硬件标签的KASAN。在这种情况下，
>>   所有KASAN引导参数都将被忽略。
>>   
>> @@ -275,6 +311,8 @@ KASAN会针对每个无效访问打印报告。这有效地禁用了KASAN报告
>>   影子内存
>>   --------
>>   
>> +本节的内容只适用于软件KASAN模式。
>> +
>>   内核将内存映射到地址空间的几个不同部分。内核虚拟地址的范围很大：没有足够的真实
>>   内存来支持内核可以访问的每个地址的真实影子区域。因此，KASAN只为地址空间的某些
>>   部分映射真实的影子。
>> @@ -297,7 +335,7 @@ CONFIG_KASAN_VMALLOC
>>   ~~~~~~~~~~~~~~~~~~~~
>>   
>>   使用 ``CONFIG_KASAN_VMALLOC`` ，KASAN可以以更大的内存使用为代价覆盖vmalloc
>> -空间。目前，这在x86、riscv、s390和powerpc上受支持。
>> +空间。目前，这在arm64、x86、riscv、s390和powerpc上受支持。
>>   
>>   这通过连接到vmalloc和vmap并动态分配真实的影子内存来支持映射。
>>   
>> @@ -349,10 +387,10 @@ KASAN连接到vmap基础架构以懒清理未使用的影子内存。
>>   ``kasan_disable_current()``/``kasan_enable_current()`` 部分注释这部分代码。
>>   这也会禁用通过函数调用发生的间接访问的报告。
>>   
>> -对于基于标签的KASAN模式（包括硬件模式），要禁用访问检查，请使用
>> -``kasan_reset_tag()`` 或 ``page_kasan_tag_reset()`` 。请注意，通过
>> -``page_kasan_tag_reset()`` 临时禁用访问检查需要通过 ``page_kasan_tag``
>> -/ ``page_kasan_tag_set`` 保存和恢复每页KASAN标签。
>> +对于基于标签的KASAN模式，要禁用访问检查，请使用 ``kasan_reset_tag()`` 或
>> +``page_kasan_tag_reset()`` 。请注意，通过 ``page_kasan_tag_reset()``
>> +临时禁用访问检查需要通过 ``page_kasan_tag`` / ``page_kasan_tag_set`` 保
>> +存和恢复每页KASAN标签。
>>   
>>   测试
>>   ~~~~
>> @@ -381,11 +419,10 @@ KASAN连接到vmap基础架构以懒清理未使用的影子内存。
>>   
>>   当由于缺少KASAN报告而导致测试失败时::
>>   
>> -        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:629
>> -        Expected kasan_data->report_expected == kasan_data->report_found, but
>> -        kasan_data->report_expected == 1
>> -        kasan_data->report_found == 0
>> -        not ok 28 - kmalloc_double_kzfree
>> +        # kmalloc_double_kzfree: EXPECTATION FAILED at lib/test_kasan.c:974
>> +        KASAN failure expected in "kfree_sensitive(ptr)", but none occurred
>> +        not ok 44 - kmalloc_double_kzfree
>> +
>>   
>>   最后打印所有KASAN测试的累积状态。成功::
>>   

