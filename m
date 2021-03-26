Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2F4C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 07:45:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C95B661A38
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 07:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhCZHpA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 03:45:00 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:51830 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229580AbhCZHou (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Mar 2021 03:44:50 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R841e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0UTLw2kr_1616744687;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UTLw2kr_1616744687)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 26 Mar 2021 15:44:47 +0800
Subject: Re: [PATCH 0/8] docs/zh_CN: add cpu-freq translation
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     Huacai Chen <chenhuacai@gmail.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, yanteng si <siyanteng01@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, alexs@kernel.org,
        =?UTF-8?B?6buE5rGf5oWn?= <huangjianghui@uniontech.com>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <e3a1546e-070b-c9d4-0dc9-e8bc6d67b1ab@linux.alibaba.com>
 <87pmznyskc.fsf@meer.lwn.net>
 <1a648811-9809-49cd-92c1-9b72a136075d@www.fastmail.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <bbc36f12-2321-d445-c8c1-88ca1c71cc40@linux.alibaba.com>
Date:   Fri, 26 Mar 2021 15:44:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1a648811-9809-49cd-92c1-9b72a136075d@www.fastmail.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


ÔÚ 2021/3/26 ÉÏÎç11:31, Jiaxun Yang Ð´µÀ:
> 
> 
> On Fri, Mar 26, 2021, at 2:52 AM, Jonathan Corbet wrote:
>> Alex Shi <alex.shi@linux.alibaba.com> writes:
>>
>>> Cc Wu Xiangcheng,
>>>
>>> Hi Yanteng,
>>>
>>> Thanks for your work! believe we active translators could review
>>> for each other. :)
>>
>> I'd very much like to second that.  Alex has been doing a great job of
>> reviewing these patches, but I think he deserves some help.

Thanks for encourage, My great pleasure. :)

> 
> Hi all,
> 
> I'm going too help with revewing as well.

Very glad to more Chinese translators working together :)

> 
> However when reviewing these translations I found there are some inconsistencies
> in word choices.

Uh, generally, I am not warry about the slightly different words if they are all
common used in computer industry or have no clearly misleading. And we still has
chances to change inconsistency in review or by a patch.

> 
> Probably for Chinese translations we need a general golssary to help translators?
> We can pick up a general computer dictionary as baseline and make some linux
> addtion entries. 

I don't know if there some common acked computer dictionaries. Im afraid that the
dictionary selection may cause much discussion and long time. :D

May let's trust translators and provide better options in each of review?


BTW,
I am leaving alibaba, this email account will be invalid soon. Please cc me at
alexs@kernel.org or seakeel@gmail.com

Thanks
Alex

> 
> Thanks. 
> 
> - Jiaxun
> 
>>
>> Thanks,
>>
>> jon
>>
> 
