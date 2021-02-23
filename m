Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1,WEIRD_QUOTING autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20398C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 10:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1FA964E32
	for <linux-doc@archiver.kernel.org>; Tue, 23 Feb 2021 10:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhBWKPp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 05:15:45 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:57027 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230268AbhBWKPj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 05:15:39 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPMHG0g_1614075293;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPMHG0g_1614075293)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Feb 2021 18:14:53 +0800
Subject: Re: [PATCH 0/5] docs/zh_CN: Improve language in zh_CN/process/
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1613643617.git.bobwxc@email.cn>
 <80e38d8a-b141-386d-56b5-5644be41a799@linux.alibaba.com>
 <20210219090947.GA15328@mipc>
 <dd566130-eb54-6324-c0e3-3fc367e2d14d@linux.alibaba.com>
 <20210220093007.GA17987@mipc>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <7db8435b-c17c-4a89-c6cc-aea4a09b4223@linux.alibaba.com>
Date:   Tue, 23 Feb 2021 18:14:52 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210220093007.GA17987@mipc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/2/20 下午5:30, Wu X.C. 写道:
> On Sat, Feb 20, 2021 at 03:21:04PM +0800, Alex Shi wrote:
>>
>>
>> 在 2021/2/19 下午5:09, Wu X.C. 写道:
<snip>

>>> It's up to you to point out what you don't think is appropriate, we can 
>>> change that. Like 'work' also can be translated as '工作起来', '起作用' etc.
>>>
>>
>> Nope, work never have meaning of fluency. There is a standard in Chinese-English
>> translation industry： 信，达，雅， it is fidelity, fluency, elegance in English.
>> Let's not change the original meaning. At last we should hang on the fidelity
>> and then try fluency and elegance.
> Yeah. But fidelity could not solve all problems, sometimes, word by word 
> translation make the sentences and names incomprehensible and very strange.
> For Chinese, one need to eat the texts, chew them up, and then spit them out.
> If the mean is incomprehensible, then the translation is meaningless.
> Especially (26.) 

May you have some misunderstanding on 'fidelity', it means faithful on the original
meaning, not the word by word translation. 
And still didn't see 'work' has this meaning of 'fluency' here.


>>
>>>
>>> 5. 
>>> Developers are cautioned against assuming that the job is done...
>>> -开发人员要注意不要假定任务已经完成。
>>> +开发人员要注意不要认为任务已经完成。
>                        ^
>>
>> Nope, don't see the reason.
> 更改一下习惯用词。

May we don't bother to change, if new words aren't clearly better than old one, 
otherwise we may get busy on changes without much benefits.

>>> 	Hard to understand
>>>
>>> 9.
>>> (such as code which derives from reverse-engineering efforts lacking
>>> proper safeguards) 
>>> -相关问题的代码（例如，由缺乏适当保护的反向工程工作派生的代码）不能被接受。
>>> +内核造成版权相关问题的代码（例如，由缺乏适当保护的逆向工程工作派生的代码）
>>
>> Nope, 反向工程 is used a lot.
> See，
> 《计算机科学技术名词 (第三版)》
> 规范用词：逆向工程
> 英语名：  reverse engineering
> 台湾名：  反向工程
> 定义：    通过分析软件系统后期制品，获取更高抽象度的前期模型的过程。
>           是软件开发周期的反向过程。
> 学科： 	  计算机科学技术_软件工程
> 公布年度：2018
>   ——全国科学技术名词审定委员会

search google online, I got "About 7,820,000 results (0.31 seconds)"
for 逆向工程， and "About 64,900,000 results (0.33 seconds)" for 反向工程.
Clearly the latter used more common.
Let's pay more attention on interesting thing first. :) 

>>> 11.
>>> in order to be an effective part of it.
>>> -进来，内核因此必须发展许多流程来保持开发的顺利进行。要成为流程的有效组成
>>> +内核因此必须发展出许多既定流程来保证开发的顺利进行。要参与到流程中来，
>>
>> could you give more context here, can't judge for pieces of words.
> （某人）要成为流程的有效组成部分
> （某人）要参与到流程中来
> Clear?

ok.

>>
>>>
>>
>> don't see reasons except the MMOTM change.
> 译文中满地都是直译“沮丧的体验”，太难受了，换个词表述

ok.

>>
>>> 	paraphrase
>>>
>>> 16.
>>> The TODO file lists the pending work that the driver needs for 
>>> acceptance into the kernel proper
>>> -目录中还应该有一个TODO文件。todo文件列出了驱动程序需要接受的挂起的工作，
>>> +目录中还应该有一个TODO文件。TODO文件列出了驱动程序即将进行的工作，
>>
>> nope for fidelity.
> What is "挂起的工作" ? Need a better word to change that.

暂停的工作？

>>>
>>> 18.
>>> the amount of noise is high
>>> -每天的信息量可以达到500条，噪音很高，谈话技术性很强，参与者并不总是表现出
>>> +每天的信息量可以达到500条，非常热闹，谈话技术性很强，且参与者并不总是表现出
>>> 	"noise" actually is "热闹"、"干扰"
>>
>> Nope, fidelity issue. and noise has much more meaning than it's in
>> dictionary.
> Please explain the extra meaning, otherwise double quotes are required.

Someone 'make some noise' doesn't mean he/she's work is useless, it could
be a praise with a bit jealous. 'noise' here is a kind of modest, not 
meaning these emails are useless or annonying.

>>
>>>
>>>
>>> 20.
>>> and ongoing latency reduction work in the long term.
>                                   ^
>>> -机制进行实时调度访问，以及长期的减少延迟的工作。
>                                                ^
>>> +机制进行实时调度访问，以及长期的减少延迟的改进。
>

no much improvement, let's keep the old one.
>
>>>
>>> 21.
>>> has caused Reiser4 to stay out of the mainline kernel.
>>> -   导致Reiser4远离了主线内核。
>>> +   导致Reiser4无法进入主线内核。
>>
>> Reiser4 is in kernel now?
> I don't know, or change to 导致Reiser4置身主线内核之外。
>>
>>> 	paraphrase
>>>
>>> 22.
>>> When to post?
>>> -何时邮寄？
>>> +何时发布？
>>
>> Nope, 邮寄 is more common words for continue patches resending.
> ?
> This chapter aims to post your early plan to community, not only the patch.
> Even if it's a patch, usually email only says "发送", not "邮寄".

'post' may a trandtion usage here. If you use a English email client, you will
find a button name 'send' not 'post'. That's different word.

This word do bother me at first time. it used with a English prof's suggestion.

>>
>>> 	post, polysemes
>>>
>>> 23.
>>> (2) there is no shortage of people with grand plans and little code (or 
>>> even prospect of code) to back them up
>>> -反应。可悲的事实是：（1）内核开发人员往往很忙；（2）不缺少有宏伟计划和很少
>>> -代码（甚至代码前景）支持他们的人；（3）没有人有义务审查或评论别人发表的
>>> +反馈。令人伤心的事实是：（1）内核开发人员往往很忙；（2）不缺少有宏伟计划但
>>> +代码（甚至代码设想）很少的人去支持他们；（3）没有人有义务审查或评论别人发表

the 2nd item could be better. but seems no much improvement yet.

>>
>> more context?
> only need to read (2)
> 
> One discouraging thing which can happen at this stage is not a hostile
> reaction, but, instead, little or no reaction at all.  The sad truth of the
> matter is (1) kernel developers tend to be busy, (2) there is no shortage
> of people with grand plans and little code (or even prospect of code) to
> back them up, and (3) nobody is obligated to review or comment on ideas
> posted by others.  Beyond that, high-level designs often hide problems
> which are only revealed when somebody actually tries to implement those
> designs; for that reason, kernel developers would rather see the code.
>>
>>>
>>> [Patch 5/5]
>>> 24.
>>> Then the focus will shift toward doing things right and the tools which can 
>>> help in that quest.
>>> -到正确的事情和可以帮助这个任务的工具上。
>>> +到正确的做法和相关实用工具上。
>>
>> more context?
>>
>>> 	paraphrase
>>>
>>> 25.
>>> Coding style
>>> -编码风格
>>> +代码风格
>>> 	Idiomatic words, also 代码规范
>>
>> Nope, didn't see much idiomatic for word coding. and code is different from
>> coding.
> See linux/Documentation/translations/zh_CN/process/coding-style.rst,
> the title is "代码风格"

ok.

>>
>>>
>>> 26.
>>> ... two independent hazards for kernel developers.
>>> The first of these is to believe that the kernel coding standards do not
>>> matter and are not enforced. 
>>> -首先，要相信内核编码标准并不重要，也不强制执行。事实上，如果没有按照标准对代
>>> +首先是错误相信内核代码标准并不重要，也不强制执行。但事实上，如果没有按照标准
>>> 	The meaning is totally wrong
>>
>> Nope, fidelity.
> Please read the original document *carefully*. 
> The meaning of the translation here is completely wrong, even contrary.
> The fidelity is clearly not appropriate here.

Uh, I hit the Murphy's Law here. and believe the English word may has the same
issue.  :)
According the context, reader should understood this action is incorrect, as
you already knew. Adding a word '错误/falsely' could make meaning more clear. 
but since the original doc doesn't do this.... 
Maybe another way could make it clear too? 

首先，相信内核编码标准并不重要，也不强制执行。但是事实上，如果没有按照标准对。。。

> ==
> As a result, there is a substantial amount of code in the kernel
> which does not meet the coding style guidelines.  The presence of that code
> leads to two independent hazards for kernel developers.
> 
> The first of these is to believe that the kernel coding standards do not
> matter and are not enforced.  The truth of the matter is that adding new
> code to the kernel is very difficult if that code is not coded according to
> the standard; many developers will request that the code be reformatted
> before they will even review it.  A code base as large as the kernel
> requires some uniformity of code to make it possible for developers to
> quickly understand any part of it.  So there is no longer room for
> strangely-formatted code.
> 
>>
>>>
>>> 27.
>>> sorting ``#includes``, for aligning variables/macros, for reflowing text 
>                                                               ^
>>> and other similar tasks
>>> -可以方便地进行排序，包括对齐变量/宏、回流文本和其他类似任务。有关详细信息，请
>                                           ^
>>> +可以方便地排序 ``#includes`` 、对齐变量/宏、重排文本和其他类似任务。有关详细
>                                                  ^
>>> 	reflowing text
>>
>> more context?
> Only one word.

I see. fine.

Thanks
Alex
