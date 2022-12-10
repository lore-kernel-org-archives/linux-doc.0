Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E153C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 02:52:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiLJCwB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 21:52:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLJCv7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 21:51:59 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D9C781DAC
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 18:51:58 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8AxCelN9JNjU5cEAA--.7165S3;
        Sat, 10 Dec 2022 10:51:57 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxFldM9JNjnOwpAA--.18627S3;
        Sat, 10 Dec 2022 10:51:57 +0800 (CST)
Message-ID: <c6bf34fa-918c-87b1-bf90-01b6d4029008@loongson.cn>
Date:   Sat, 10 Dec 2022 10:51:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 01/13] docs/zh_CN: Update the translation of
 delay-accounting to 6.1-rc8
Content-Language: en-US
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <c8e34775309a85114a49b3f291e960d13332d9ce.1670502763.git.siyanteng@loongson.cn>
 <Y5Lb9JKt35KvjBhR@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y5Lb9JKt35KvjBhR@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxFldM9JNjnOwpAA--.18627S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7ur1fAry7tw1DJF4UXr4kCrg_yoW8ZFWfp3
        4DKa4xGF1rta4jkw10gw4UW3W0qanrCrs8KrWUJas2kr10qFZ3Wr1Utr9IkFnFqrsIkFWF
        93s2gF1Uur4jkrDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km
        07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r
        1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWU
        CVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r
        1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUv
        cSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 12/9/22 14:55, Wu XiangCheng 写道:
>> Update to commit f347c9d2697f ("filemap: make the accounting
>> of thrashing more consistent").
>>
>> Commit 662ce1dc9caf ("delayacct: track delays from write-protect copy").
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/accounting/delay-accounting.rst     | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/translations/zh_CN/accounting/delay-accounting.rst b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
>> index f1849411018e..71a3c1f2b07a 100644
>> --- a/Documentation/translations/zh_CN/accounting/delay-accounting.rst
>> +++ b/Documentation/translations/zh_CN/accounting/delay-accounting.rst
>> @@ -17,8 +17,9 @@ a) 等待一个CPU（任务为可运行）
>>   b) 完成由该任务发起的块I/O同步请求
>>   c) 页面交换
>>   d) 内存回收
>> -e) 页缓存抖动
>> +e) 抖动
>>   f) 直接规整
>> +g) 写保护复制
>>   
>>   并将这些统计信息通过taskstats接口提供给用户空间。
>>   
>> @@ -42,7 +43,7 @@ f) 直接规整
>>        include/uapi/linux/taskstats.h
>>   
>>   其描述了延时计数相关字段。系统通常以计数器形式返回 CPU、同步块 I/O、交换、内存
>> -回收、页缓存抖动、直接规整等的累积延时。
>> +回收、页缓存抖动、直接规整、写保护复制等的累积延时。
>>   
>>   取任务某计数器两个连续读数的差值，将得到任务在该时间间隔内等待对应资源的总延时。
>>   
>> @@ -100,6 +101,8 @@ getdelays命令的一般格式::
>>   	                    0              0              0ms
>>   	COMPACT         count    delay total  delay average
>>   	                    0              0              0ms
>> +    WPCOPY          count    delay total  delay average
> ^^^^^^
> a Tab

Removed.


Thanks,

Yanteng

>
>> +	                    0              0              0ms
>>   
>>   获取pid为1的IO计数，它只和-p一起使用::
>>   	# ./getdelays -i -p 1
>> -- 
>> 2.31.1
>>
>>
>>

