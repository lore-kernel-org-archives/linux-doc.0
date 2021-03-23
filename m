Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589EBC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 05:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D269361934
	for <linux-doc@archiver.kernel.org>; Tue, 23 Mar 2021 05:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbhCWFNW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Mar 2021 01:13:22 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:39316 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229437AbhCWFNW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Mar 2021 01:13:22 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0UT25RT2_1616476396;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UT25RT2_1616476396)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 23 Mar 2021 13:13:17 +0800
Subject: Re: [PATCH] docs/zh_CN: Add translations in zh_CN/kernel-hacking/
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20210322143743.GA7820@mipc>
 <3301bb31-f8de-1e3c-aaa0-b3d4411eb17c@linux.alibaba.com>
 <20210323050221.GA11893@mipc>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <b7fd15be-c1de-3ea2-6bf7-012efa1a3062@linux.alibaba.com>
Date:   Tue, 23 Mar 2021 13:13:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210323050221.GA11893@mipc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/23 下午1:02, Wu X.C. 写道:
>> hacking often translates as 骇客 in computer industry.
>>
> Yeah, generally
> 
>       黑客 -- Hacker
>       骇客 -- Cracker
> 
> But you know 骇/黑 always give a bad meaning, not suitable for here.
> "Hacking" is also different with "Programming".

Uh, in my mind, and usually their meaning depends on context, most
of time they are neutral, not negative. 

alos a brand new word just increases the confusing.


>>> +
>>> +用户上下文是指当您从系统调用或其他trap进入时：就像用户空间一样，您可以被更
>> trap often translates as 陷阱。
>>
> Is 陷阱 suitable for computer science?

Yes, I didn't see any other translation for the word. :)

Thanks
Alex

> I don't know how to translate this word.

