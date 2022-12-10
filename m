Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE480C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 02:56:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiLJC41 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 21:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLJC4Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 21:56:25 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A9146B996
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 18:56:23 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxZPBW9ZNjgJcEAA--.10359S3;
        Sat, 10 Dec 2022 10:56:22 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFldV9ZNjbe0pAA--.18635S3;
        Sat, 10 Dec 2022 10:56:22 +0800 (CST)
Message-ID: <77e9a783-1e5b-6a60-5d0a-55914ae456e2@loongson.cn>
Date:   Sat, 10 Dec 2022 10:56:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 07/13] docs/zh_CN: Update the translation of
 testing-overview to 6.1-rc8
Content-Language: en-US
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <8a99b6f6ac2bbc834aad551b464a3d4a27d82630.1670502763.git.siyanteng@loongson.cn>
 <Y5LeLgzv4O6cn83+@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y5LeLgzv4O6cn83+@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxFldV9ZNjbe0pAA--.18635S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXFyDtr1rGF1kWF48XF4fZrb_yoW5WrW7pr
        yfGasxJF42vry7C3sakFyjqrySya97GF4UKFsrK3s7Xay2y3ykKrW7GF95trZxZrZ5JF90
        vF40gryxur12yFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8l38UUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 12/9/22 15:05, Wu XiangCheng 写道:
>> Update to commit a32d5c0fc12b ("Documentation: dev-tools:
>> Enhance static analysis section with discussion")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>> index d6f2c65ed511..d53a326de93a 100644
>> --- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>> +++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>> @@ -132,3 +132,30 @@ Documentation/dev-tools/kcov.rst 是能够构建在内核之中，用于在每
>>   
>>    不过要注意的是，静态分析工具存在**假阳性**的问题。在试图修复错误和警
>>    告之前，需要仔细评估它们。
>> +
>> +何时使用Sparse和Smatch
>> +----------------------
>> +
>> +Sparse做类型检查，例如验证注释的变量不会导致无符号的错误，检测
>> +``__user`` 指针使用不当的地方，以及分析符号初始化器的兼容性。
>> +
>> +Smatch进行流程分析，如果允许建立函数数据库，它还会进行跨函数分析。
>> +Smatch试图回答一些问题，比如这个缓冲区是在哪里分配的？它有多大？这
>> +个索引可以由用户控制吗？这个变量比那个变量大吗？
>> +
>> +一般来说，在Smatch中写检查比在Sparse中写检查要容易。尽管如此，
>> +Sparse和Smatch的检查还是有一些重叠的地方。
>> +
>> +Smatch和Coccinelle的强项
>> +------------------------
>> +
>> +Coccinelle可能是最容易写检查的。它在预处理器之前工作，所以用Coccinelle
>> +检查宏中的错误更容易。Coccinelle还能为你创建补丁，这是其他工具无法做到的。
>> +
>> +例如，用Coccinelle你可以从kmalloc(x * size, GFP_KERNEL)到
> ``kmalloc(x * size, GFP_KERNEL)``

OK!


Thanks,

Yanteng

>
>> +``kmalloc_array(x, size, GFP_KERNEL)`` 进行大规模转换，这真的很有用。
>> +如果你只是创建一个Smatch警告，并试图把转换的工作推给维护者，他们会很恼火。
>> +你将不得不为每个警告争论是否真的可以溢出。
>> +
>> +Coccinelle不对变量值进行分析，而这正是Smatch的强项。另一方面，Coccinelle
>> +允许你用简单的方法做简单的事情。
>> -- 
>> 2.31.1
>>

