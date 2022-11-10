Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE6AC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Nov 2022 10:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiKJKKk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 05:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiKJKKj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 05:10:39 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2130C1DD
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 02:10:37 -0800 (PST)
Received: from loongson.cn (unknown [223.106.24.7])
        by gateway (Coremail) with SMTP id _____8CxPLYbzmxj9MkFAA--.6471S3;
        Thu, 10 Nov 2022 18:10:35 +0800 (CST)
Received: from [192.168.100.112] (unknown [223.106.24.7])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+AWzmxjmS4QAA--.44162S3;
        Thu, 10 Nov 2022 18:10:32 +0800 (CST)
Message-ID: <18b4fdc3-792e-298f-5fa4-e2e23828fc27@loongson.cn>
Date:   Thu, 10 Nov 2022 18:10:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH V3 0/3] docs/zh_CN: core-api: Add some translations for
 the "Data structures" section(Part 2)
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org
References: <cover.1666689138.git.zhoubinbin@loongson.cn>
 <87sfirkgtv.fsf@meer.lwn.net> <87fserkgf1.fsf@meer.lwn.net>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <87fserkgf1.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+AWzmxjmS4QAA--.44162S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCFW3Ww48Jw1UZr1Dtr48Crg_yoW5XFW3pr
        W3K3W3Kan8GF13AwsagrnrXF1YyayxJ3yDW3ZrJw1rWFn8tF1Fyr4vkryj9rWUXr97KF1a
        vr47tF9rua4jyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
        C2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2022/11/10 04:43, Jonathan Corbet 写道:
> Jonathan Corbet <corbet@lwn.net> writes:
> 
>> Binbin Zhou <zhoubinbin@loongson.cn> writes:
>>
>>> Hi all:
>>>
>>> Sorry, it may have been a while since the V2 patchset. Thanks to Alex
>>> for his comments.
>>>
>>> As a continuation of the previous patchset
>>> (https://lore.kernel.org/all/cover.1660881950.git.zhoubinbin@loongson.cn/),
>>> this patchset contains the Chinese translations of the remaining three files.
>>>
>>> As follows:
>>>
>>> this_cpu_ops.rst
>>> timekeeping.rst
>>> errseq.rst
>>>
>>> So far, the docs for section "Data structures and low-level utilities" of
>>> the core-api has been translated completely.
>>>
>>> Thanks.
>>>
>>> Changes since V2:
>>> - Take Alex's advices, thanks.
>>>
>>> Details:
>>> https://lore.kernel.org/all/CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com/
>>>
>>> Changes since V1:
>>> - Take Xiangcheng's advices, thanks.
>>>
>>> Details:
>>> https://lore.kernel.org/all/Y0wsWoI+BXXCuRbF@bobwxc.mipc/
>>> https://lore.kernel.org/all/Y02EcgD3E0%2FlML5H@bobwxc.mipc/
>>>
>>> Binbin Zhou (3):
>>>    docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
>>>    docs/zh_CN: core-api: Add timekeeping Chinese translation
>>>    docs/zh_CN: core-api: Add errseq Chinese translation
>>>
>>>   .../translations/zh_CN/core-api/errseq.rst    | 145 +++++++++
>>>   .../translations/zh_CN/core-api/index.rst     |   5 -
>>>   .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>>>   .../zh_CN/core-api/timekeeping.rst            | 177 +++++++++++
>>>   4 files changed, 607 insertions(+), 5 deletions(-)
>>>   create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
>>>   create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
>>>   create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst
>>
>> Applied, thanks.
> 
> Actually, I take that back.  I applied these at the end of October, why
> are you sending different versions now?
> 
> Thanks,
> 
> jon

Hi jon:

Sorry, this is my mistake.

I didn't pull the latest docs-next before I sent the v3 patchset.

I didn't notice your apply email for the v2 patchset before, and Alex 
had some different opinions about my v2 patchset, so I reorganized the 
v3 patchset.

Also, the v3 patchset has been delayed for some reason on my part.

In that case, please ignore the v3 patchset, the only differences 
between v2 and v3 are two translations:

https://lore.kernel.org/all/CAJy-Am=mtZxQv2AgH+PxVLsJ8FeW1NRQV2bkLD1RRLGQLxUPgQ@mail.gmail.com/

I will try another fix patch later.

Sorry again, I'll pay more attention next time.

Thanks.

Binbin

