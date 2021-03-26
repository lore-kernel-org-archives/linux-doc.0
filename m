Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9118C433C1
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 08:25:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5767D61A44
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 08:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCZIZV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 04:25:21 -0400
Received: from m32-153.88.com ([43.250.32.153]:18193 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229463AbhCZIZT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Mar 2021 04:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=To:From:Date; bh=ZXhRW2oIQACYC5c7HrzziEEfPAGtEyLWPYiqy
        AmnDP0=; b=kj7hhXl8ZADtz7/AjbSsmxEO9/PLC+NMCv8AfISuqLG9LBYDRst21
        785gxwP+ma1TzRrHBUItW3wCIcrbvnrAvFL0frevyDR0p+nXSZ6HZttutjU9h7W/
        IbejoK1Cfqmke2lCZrnkvCOXRGHArdBsIY49UgIZ6FdaugjOEdb6hA=
Received: from [192.168.3.26] (unknown [120.242.70.191])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDHpiFYml1gVehHAA--.49184S3;
        Fri, 26 Mar 2021 16:24:58 +0800 (CST)
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
To:     Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, yanteng si <siyanteng01@gmail.com>,
        alexs@kernel.org,
        =?UTF-8?B?6buE5rGf5oWn?= <huangjianghui@uniontech.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
 <87pmznyskc.fsf@meer.lwn.net>
 <1a648811-9809-49cd-92c1-9b72a136075d@www.fastmail.com>
 <bbc36f12-2321-d445-c8c1-88ca1c71cc40@linux.alibaba.com>
From:   "Wu X.C." <bobwxc@email.cn>
Message-ID: <5d284267-8a27-131c-211d-d1e7bcf09701@email.cn>
Date:   Fri, 26 Mar 2021 16:25:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <bbc36f12-2321-d445-c8c1-88ca1c71cc40@linux.alibaba.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: GiKnCgDHpiFYml1gVehHAA--.49184S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWrWw43Kw47Ar4fKFWruFg_yoW8ur1rpF
        4UA3Wjya1rJry09F4I93yIqFZYy34fKrW5Xr98Wrn3Zwn8KF1xtrZagrZI9a4xZr1xXF4F
        va1jqr97ZayDAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUk0b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
        Y20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RRbyZUUUUU
X-Originating-IP: [120.242.70.191]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

在 2021/3/26 15:44, Alex Shi 写道:
> 在 2021/3/26 上午11:31, Jiaxun Yang 写道:
>>
>> On Fri, Mar 26, 2021, at 2:52 AM, Jonathan Corbet wrote:
>>> Alex Shi <alex.shi@linux.alibaba.com> writes:
>>>
>>>> Cc Wu Xiangcheng,
>>>>
>>>> Hi Yanteng,
>>>>
>>>> Thanks for your work! believe we active translators could review
>>>> for each other. :)
>>> I'd very much like to second that.  Alex has been doing a great job of
>>> reviewing these patches, but I think he deserves some help.
> Thanks for encourage, My great pleasure. :)
>
>> Hi all,
>>
>> I'm going too help with revewing as well.
> Very glad to more Chinese translators working together :)
>
>> However when reviewing these translations I found there are some inconsistencies
>> in word choices.
> Uh, generally, I am not warry about the slightly different words if they are all
> common used in computer industry or have no clearly misleading. And we still has
> chances to change inconsistency in review or by a patch.
>
>> Probably for Chinese translations we need a general golssary to help translators?
>> We can pick up a general computer dictionary as baseline and make some linux
>> addtion entries.
> I don't know if there some common acked computer dictionaries. Im afraid that the
> dictionary selection may cause much discussion and long time. :D
>
> May let's trust translators and provide better options in each of review?
There is a website called termonline.cn by CNCTST which could be used as 
a reference.
But there are still a lot of words missing.
So I support Alex Shi's view.
>
>
> BTW,
> I am leaving alibaba, this email account will be invalid soon. Please cc me at
> alexs@kernel.org or seakeel@gmail.com
Don't forget to change the Maintainer file ；)

And does Harry Wei still maintain the zh_CN translation? According to 
git log, he/she
last appear at many years ago.
Also there is a maillist for Linux group of Xi'an University of Posts and
Telecommunication marked here, seems not suitable.

Thanks
Wu X.C.
>
> Thanks
> Alex
>
>> Thanks.
>>
>> - Jiaxun
>>
>>> Thanks,
>>>
>>> jon
>>>

