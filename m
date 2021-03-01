Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D355AC433E0
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 08:39:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A824064DEF
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 08:39:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233327AbhCAIjQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 03:39:16 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:38594 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233339AbhCAIiu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 03:38:50 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R411e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPwsoVo_1614587843;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPwsoVo_1614587843)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 01 Mar 2021 16:37:23 +0800
Subject: Re: [PATCH v2 0/9] docs/zh_CN: Improve language in zh_CN/process/
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Harry Wei <harryxiyou@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
References: <cover.1614488009.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <7df50b3b-9990-a816-0f45-e7324a490106@linux.alibaba.com>
Date:   Mon, 1 Mar 2021 16:37:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1614488009.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/2/28 下午1:37, Wu XiangCheng 写道:
> Hi all,
> 
> This set of patchs aims to polish context, improve on fluency, idiomatic
> and grammar in some files in zh_CN/process/, and synchronize them with 
> original files. Some structure modifications need to rewrite the whole 
> sentences, so here are a lot of changes.
> 
> * V0
> ** Add [Patch 1/9] ~ [Patch 5/9] 
> 
> * V1
> ** Add [Patch 6/9] ~ [Patch 9/9]
> ** Modified [Patch 1/9] ~ [Patch 5/9] under Alex Shi's suggestions.
>    Previous discussions see:
>      <https://lore.kernel.org/linux-doc/20210219090947.GA15328@mipc/>
> 
> * V2
> ** Modified [Patch 6/9] ~ [Patch 9/9] under Alex Shi's suggestions.
>    Previous discussions see:
>      <https://lore.kernel.org/linux-doc/cover.1614162064.git.bobwxc@email.cn/>
> ** No other new change.
> 
> Thanks!
> 
> Wu XiangCheng (9):
>   docs/zh_CN: Improve zh_CN/process/index.rst
>   docs/zh_CN: Improve zh_CN/process/1.Intro.rst
>   docs/zh_CN: Improve zh_CN/process/2.Process.rst
>   docs/zh_CN: Improve zh_CN/process/3.Early-stage.rst
>   docs/zh_CN: Improve zh_CN/process/4.Coding.rst
>   docs/zh_CN: Improve zh_CN/process/5.Posting.rst
>   docs/zh_CN: Improve zh_CN/process/6.Followthrough
>   docs/zh_CN: Improve zh_CN/process/7.AdvancedTopics
>   docs/zh_CN: Improve zh_CN/process/8.Conclusion.rst
> 
>  .../translations/zh_CN/process/1.Intro.rst    | 155 +++++----
>  .../translations/zh_CN/process/2.Process.rst  | 319 +++++++++---------
>  .../zh_CN/process/3.Early-stage.rst           | 131 +++----
>  .../translations/zh_CN/process/4.Coding.rst   | 262 +++++++-------
>  .../translations/zh_CN/process/5.Posting.rst  | 223 ++++++------
>  .../zh_CN/process/6.Followthrough.rst         | 141 ++++----
>  .../zh_CN/process/7.AdvancedTopics.rst        | 121 ++++---
>  .../zh_CN/process/8.Conclusion.rst            |  57 ++--
>  .../translations/zh_CN/process/index.rst      |  10 +-
>  9 files changed, 739 insertions(+), 680 deletions(-)
> 
