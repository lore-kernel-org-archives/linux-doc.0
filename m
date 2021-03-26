Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47879C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 08:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06F6661A48
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 08:35:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhCZIej (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 04:34:39 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:46752 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229969AbhCZIe0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Mar 2021 04:34:26 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R981e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UTMtDAq_1616747663;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UTMtDAq_1616747663)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 26 Mar 2021 16:34:23 +0800
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
To:     "Wu X.C." <bobwxc@email.cn>, Jonathan Corbet <corbet@lwn.net>
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
 <5d284267-8a27-131c-211d-d1e7bcf09701@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <5f4970e1-354d-49f2-fed5-6bea57ed25c0@linux.alibaba.com>
Date:   Fri, 26 Mar 2021 16:34:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5d284267-8a27-131c-211d-d1e7bcf09701@email.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/26 下午4:25, Wu X.C. 写道:
> 在 2021/3/26 15:44, Alex Shi 写道:
>> 在 2021/3/26 上午11:31, Jiaxun Yang 写道:
>>>
>>> On Fri, Mar 26, 2021, at 2:52 AM, Jonathan Corbet wrote:
>>>> Alex Shi <alex.shi@linux.alibaba.com> writes:
>>>>
>>>>> Cc Wu Xiangcheng,
>>>>>
>>>>> Hi Yanteng,
>>>>>
>>>>> Thanks for your work! believe we active translators could review
>>>>> for each other. :)
>>>> I'd very much like to second that.  Alex has been doing a great job of
>>>> reviewing these patches, but I think he deserves some help.
>> Thanks for encourage, My great pleasure. :)
>>
>>> Hi all,
>>>
>>> I'm going too help with revewing as well.
>> Very glad to more Chinese translators working together :)
>>
>>> However when reviewing these translations I found there are some inconsistencies
>>> in word choices.
>> Uh, generally, I am not warry about the slightly different words if they are all
>> common used in computer industry or have no clearly misleading. And we still has
>> chances to change inconsistency in review or by a patch.
>>
>>> Probably for Chinese translations we need a general golssary to help translators?
>>> We can pick up a general computer dictionary as baseline and make some linux
>>> addtion entries.
>> I don't know if there some common acked computer dictionaries. Im afraid that the
>> dictionary selection may cause much discussion and long time. :D
>>
>> May let's trust translators and provide better options in each of review?
> There is a website called termonline.cn by CNCTST which could be used as a reference.
> But there are still a lot of words missing.
> So I support Alex Shi's view.
>>
>>
>> BTW,
>> I am leaving alibaba, this email account will be invalid soon. Please cc me at
>> alexs@kernel.org or seakeel@gmail.com
> Don't forget to change the Maintainer file ；)

I will, thanks for reminder!

> 
> And does Harry Wei still maintain the zh_CN translation? According to git log, he/she
> last appear at many years ago.
> Also there is a maillist for Linux group of Xi'an University of Posts and
> Telecommunication marked here, seems not suitable.

You could send a mail to update MAINTAINER file, also please cc Harry Wei. :)

Thanks!
