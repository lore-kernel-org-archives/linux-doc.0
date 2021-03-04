Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8768AC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 07:05:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 524E264EF8
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 07:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235834AbhCDHE3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 02:04:29 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:48215 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235868AbhCDHEO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 02:04:14 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UQLbiM6_1614841410;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UQLbiM6_1614841410)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 04 Mar 2021 15:03:30 +0800
Subject: Re: [PATCH v2 4/9] docs/zh_CN: Improve
 zh_CN/process/3.Early-stage.rst
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1614488009.git.bobwxc@email.cn>
 <0e893a3171884f832366cf248e131e9a2972762f.1614488009.git.bobwxc@email.cn>
 <f11fd22b-705b-3258-9551-e202b6c3b03b@linux.alibaba.com>
 <20210303153429.GA30178@mipc>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <b54a7734-9668-cf64-fbcb-e0889b475349@linux.alibaba.com>
Date:   Thu, 4 Mar 2021 15:03:30 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210303153429.GA30178@mipc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/3 下午11:34, Wu X.C. 写道:


>>> -然而，音频社区看不到他们实施的特定解决方案的过去；他们不愿意接受替代方案。
>>> +然而，音频社区无法超越他们实施的特定解决方案来看问题；他们不愿意接受替代方案。
>>
>> the old doc has point on the 'history', but new doc miss this point.
> 
> ... could not see past the particlar solution they had ...
> The 'past' means 超过[prep.], not 'history', this is a translation mistake.

You are right on this point, according to context.

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
