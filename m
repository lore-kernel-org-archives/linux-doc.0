Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A996C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 03:33:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0615964F1F
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 03:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbhCSDc5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 23:32:57 -0400
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:49721 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231599AbhCSDcc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Mar 2021 23:32:32 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=alimailimapcm10staff010182156082;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0USVkIPd_1616124750;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0USVkIPd_1616124750)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 19 Mar 2021 11:32:30 +0800
Subject: Re: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
To:     Jonathan Corbet <corbet@lwn.net>, "Wu X.C." <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org
References: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
 <3311b919-2f86-af05-97fc-ce1d4db277f9@linux.alibaba.com>
 <20210317024944.GA20193@mipc>
 <8beea937-5df0-27a8-1b38-50c8f9cea3dd@linux.alibaba.com>
 <871rcdykn3.fsf@meer.lwn.net>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <21204dcf-3360-ad90-26f0-ec12a82c41ed@linux.alibaba.com>
Date:   Fri, 19 Mar 2021 11:32:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <871rcdykn3.fsf@meer.lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/17 下午9:28, Jonathan Corbet 写道:
> Alex Shi <alex.shi@linux.alibaba.com> writes:
> 
>> 在 2021/3/17 上午10:49, Wu X.C. 写道:
>>> On Wed, Mar 17, 2021 at 10:29:21AM +0800, Alex Shi wrote:
>>>> LGTM.
>>>>
>>> Thanks!
>>> Is this could be regarded as a review-by?
>>
>> Yes, you could say so for me.
> 
> Please be explicit when offering tags - we don't want people (including
> me) making them up...
> 

Got it. Thanks a lot for reminder!

> Thanks,
> 
> jon
> 
