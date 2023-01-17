Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95228C678D4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Jan 2023 09:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236327AbjAQJBm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Jan 2023 04:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235596AbjAQJAw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jan 2023 04:00:52 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 12FBF24102
        for <linux-doc@vger.kernel.org>; Tue, 17 Jan 2023 00:59:58 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.204])
        by gateway (Coremail) with SMTP id _____8AxHuuNY8ZjEg8CAA--.6213S3;
        Tue, 17 Jan 2023 16:59:57 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.108.204])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxPuSMY8ZjLqoaAA--.15584S3;
        Tue, 17 Jan 2023 16:59:57 +0800 (CST)
Message-ID: <7d84ef48-3069-5fca-bb94-0fe940a29e4a@loongson.cn>
Date:   Tue, 17 Jan 2023 16:59:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] docs/zh_CN: Add a glossary of Chinese translation
 terms
To:     Alex Shi <seakeel@gmail.com>
Cc:     alexs@kernel.org, corbet@lwn.net, bobwxc@email.cn,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        tangyeechou@gmail.com, me@lirui.org, siyanteng01@gmail.com
References: <20230112130355.696111-1-siyanteng@loongson.cn>
 <CAJy-AmnXwPcuRDFeckMHOkPeh_UzpuaSC0eoJV=QkY78V_QJDA@mail.gmail.com>
Content-Language: en-US
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CAJy-AmnXwPcuRDFeckMHOkPeh_UzpuaSC0eoJV=QkY78V_QJDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuSMY8ZjLqoaAA--.15584S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWw47tw43ur1xXFW3Wr1rWFg_yoW5Kw15pF
        ykGFWSkan7Ar17Cr1S9r1UZr1Ska4xGa1UKrnrKwn3trs0y395tFn8Kry5KFZ7JrykCFWq
        va1Y9Fy8uw1jyrDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
        JVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8hiSPUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 1/16/23 14:59, Alex Shi 写道:
> On Thu, Jan 12, 2023 at 9:03 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>> As more and more documents are translated and some English
>> words are translated into different Chinese, it seems that
>> we need a glossary of Chinese translation terms.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>> v2:
>>
>> * Add more word entries under Yizhou's advice.
>> * 实体负载跟踪机制 -> 实体负载跟踪.
>>
>>   Documentation/translations/zh_CN/glossary.rst | 36 +++++++++++++++++++
>>   Documentation/translations/zh_CN/index.rst    |  9 +++++
>>   2 files changed, 45 insertions(+)
>>   create mode 100644 Documentation/translations/zh_CN/glossary.rst
>>
>> diff --git a/Documentation/translations/zh_CN/glossary.rst b/Documentation/translations/zh_CN/glossary.rst
>> new file mode 100644
>> index 000000000000..b6d6676a1f83
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/glossary.rst
>> @@ -0,0 +1,36 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +术语表
>> +======
>> +
>> +这不是一个完善的术语表，我们只是将有争议的和陌生的翻译词汇记录于此，
>> +它的篇幅应该根据内核文档翻译的需求而增加。新词条最好随翻译补丁一起
>> +提交，且仅在以下情况下收录新词条：
>> +
>> +        - 在翻译过程中遇到陌生词汇，且尚无翻译先例的；
>> +        - 在审阅过程中，针对某词条出现了不同的翻译意见；
>> +        - 使用频率不高的词条和首字母缩写类型的词条；
>> +        - 已经存在且有歧义的词条翻译。
>> +
>> +
>> +* atomic: 原子的，一般指不可中断的极小的临界区操作。
>> +* DVFS: 动态电压频率升降。（Dynamic Voltage and Frequency Scaling）
>> +* EAS: 能耗感知调度。（Energy Aware Scheduling）
>> +* flush: 刷新，一般指对cache的冲洗操作。
>> +* fork: 创建。
> fork: 创建, 通常指父进程创建子进程。

OK, thanks!


>
> others are fine.
> Reviewed-by: Alex Shi <alexs@kernel.org>
>

Thanks,

Yanteng

>> +* futex: 快速用户互斥锁。（fast user mutex）
>> +* guest halt polling: 客户机停机轮询机制。
>> +* HugePage: 巨页。
>> +* hypervisor: 虚拟机超级管理器。
>> +* memory barriers: 内存屏障。
>> +* MIPS: 每秒百万指令。（Millions of Instructions Per Second）,注意与mips指令集区分开。
>> +* mutex: 互斥锁。
>> +* NUMA: 非统一内存访问。
>> +* OpenCAPI: 开放相干加速器处理器接口。（Open Coherent Accelerator Processor Interface）
>> +* OPP: 操作性能值。
>> +* overhead: 开销，一般指需要消耗的计算机资源。
>> +* PELT: 实体负载跟踪。（Per-Entity Load Tracking）
>> +* sched domain: 调度域。
>> +* semaphores: 信号量。
>> +* spinlock: 自旋锁。
>> +* watermark: 水位，一般指页表的消耗水平。
>> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
>> index 3660a3451c86..7c3216845b71 100644
>> --- a/Documentation/translations/zh_CN/index.rst
>> +++ b/Documentation/translations/zh_CN/index.rst
>> @@ -133,6 +133,15 @@ TODOList:
>>
>>      staging/index
>>
>> +术语表
>> +------
>> +
>> +.. toctree::
>> +   :maxdepth: 1
>> +
>> +   glossary
>> +
>> +
>>   索引和表格
>>   ----------
>>
>> --
>> 2.31.1
>>

