Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F04EC4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 03:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiLJDEL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 22:04:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLJDEJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 22:04:09 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CA163720C
        for <linux-doc@vger.kernel.org>; Fri,  9 Dec 2022 19:04:08 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxpfAn95NjqJcEAA--.10284S3;
        Sat, 10 Dec 2022 11:04:07 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxtuMm95Nj8O4pAA--.37156S3;
        Sat, 10 Dec 2022 11:04:06 +0800 (CST)
Message-ID: <d7e64b9b-119c-7cd1-f65f-0bf21a522bf5@loongson.cn>
Date:   Sat, 10 Dec 2022 11:04:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 11/13] docs/zh_CN: Update the translation of ksm to
 6.1-rc8
Content-Language: en-US
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <ebb3d10b22f0b11305a819ad03e6a0a531ec6678.1670502763.git.siyanteng@loongson.cn>
 <Y5LfP5oGiSCpYYP8@bobwxc.mipc>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <Y5LfP5oGiSCpYYP8@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxtuMm95Nj8O4pAA--.37156S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWF1rCry7Xr48XrWDCw1kAFb_yoWrWF48pF
        yq9FWIgF47AF9ruFy7Kr1UuFsxtrs7Gr47Kw17tas7X3sYya92qr40kFyrGF1xZrykA3yY
        yFWqqFn3CF9Yy3DanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 12/9/22 15:09, Wu XiangCheng 写道:
>> Update to commit 21b7bdb504ae ("ksm: add profit monitoring
>> documentation")
>>
>> commit 94bfe85bde18 ("mm/vmstat: add events for ksm cow")
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>>   .../translations/zh_CN/admin-guide/mm/ksm.rst | 50 +++++++++++++++++++
>>   1 file changed, 50 insertions(+)
>>
>> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
>> index 4829156ef1ae..e27806aa90dc 100644
>> --- a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
>> +++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
>> @@ -146,3 +146,53 @@ stable_node_dups
>>   
>>   比值 ``pages_sharing/pages_shared`` 的最大值受限制于 ``max_page_sharing``
>>   的设定。要想增加该比值，则相应地要增加 ``max_page_sharing`` 的值。
>> +
>> +监测KSM的好处
> 好处 => 收益
OK!
>> +=============
>> +
>> +KSM可以通过合并相同的页面来节省内存，但也会消耗额外的内存，因为它需要生成一些rmap_items
>> +来保存每个扫描页面的简要rmap信息。其中有些页面可能会被合并，但有些页面在被检查几次
>> +后可能无法被合并，这些都是无益的内存消耗。
>> +
>> +1) 如何确定KSM在全系统范围内是节省内存还是消耗内存？这里有一个简单的近似计算方法供参考::
>> +
>> +       general_profit =~ pages_sharing * sizeof(page) - (all_rmap_items) *
>> +                         sizeof(rmap_item);
>> +
>> +   其中all_rmap_items可以通过对 ``pages_sharing`` 、 ``pages_shared`` 、 ``pages_unshared``
>> +   和 ``pages_volatile`` 的求和而轻松获得。
>> +
>> +2) KSM的好处在一个单一的进程中也可以通过以下近似的计算得到::
> 单一进程中KSM的收益
ok!
>
>> +
>> +       process_profit =~ ksm_merging_pages * sizeof(page) -
>> +                         ksm_rmap_items * sizeof(rmap_item).
>> +
>> +   其中ksm_merging_pages显示在 ``/proc/<pid>/`` 目录下，而ksm_rmap_items
>> +   显示在 ``/proc/<pid>/ksm_stat`` 。
>> +
>> +从应用的角度来看， ``ksm_rmap_items`` 和 ``ksm_merging_pages`` 的高比例意
>> +味着不好的madvise-applied策略，所以开发者或管理员必须重新考虑如何改变madvis策
>> +略。举个例子供参考，一个页面的大小通常是4K，而rmap_item的大小在32位CPU架构上分
>> +别是32B，在64位CPU架构上是64B。所以如果 ``ksm_rmap_items/ksm_merging_pages``
>> +的比例在64位CPU上超过64，或者在32位CPU上超过128，那么应用程序的madvise策略应
>> +该被放弃，因为ksm好处大约为零或负值。
> 好处 => 收益
OK！
>> +
>> +监控KSM事件
>> +===========
>> +
>> +在/proc/vmstat中有一些计数器，可以用来监控KSM事件。KSM可能有助于节省内存，这是
>> +一种权衡，因为它可能会在KSM COW或复制中的交换上遭受延迟。这些事件可以帮助用户评估
>> +是否或如何使用KSM。例如，如果cow_ksm增加得太快，用户可以减少madvise(, , MADV_MERGEABLE)
>> +的范围。
>> +
>> +cow_ksm
>> +        在每次KSM页面触发写时拷贝（COW）时都会被递增，当用户试图写到KSM页面时，
> 写到 => 写入

OK！


Thanks,

Yanteng

>
>> +        我们必须做一个拷贝。
>> +
>> +ksm_swpin_copy
>> +        在换入时，每次KSM页被复制时都会被递增。请注意，KSM页在换入时可能会被复
>> +        制，因为do_swap_page()不能做所有的锁，而需要重组一个跨anon_vma的KSM页。
>> +
>> +--
>> +Izik Eidus,
>> +Hugh Dickins, 2009年11月17日。
>> -- 
>> 2.31.1
>>

