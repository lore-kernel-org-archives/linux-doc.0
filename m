Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB35CC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 03:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 647F864ED5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 03:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhBSDXo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 22:23:44 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:32777 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229480AbhBSDXo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Feb 2021 22:23:44 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UOwOpnz_1613704981;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UOwOpnz_1613704981)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 19 Feb 2021 11:23:02 +0800
Subject: Re: [PATCH 0/5] docs/zh_CN: Improve language in zh_CN/process/
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1613643617.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <80e38d8a-b141-386d-56b5-5644be41a799@linux.alibaba.com>
Date:   Fri, 19 Feb 2021 11:23:02 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1613643617.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Xiangcheng,

Thanks for polishing patchset, but i can find your patches in my email box.
and even in lkml. Except https://lkml.org/lkml/2021/2/14/33 the first patch.
Do I missed others?


在 2021/2/18 下午6:24, Wu XiangCheng 写道:
> There are some errors in some files in zh_CN/process/, such as grammatical 
> errors, translation errors and improper use of words etc., which make it 

Could you like to point out each of specific incorrect words with reasons?
Like the following incorrect I found in your patch:

A, And end users, too, will often wish to change Linux to make it
   better suit their needs.
  
   +最终用户也常常希望修改Linux，使之年能更好地满足他们的需求。
   I couldn't find a word means '年'/year in original context, do you?

B, Contribution of code is the fundamental action which makes the whole
   process work.

+- 代码的贡献是使整个流程顺畅的根本

the point of the process is 工作/workable, your transltion change it to
process 顺畅/fluency, why?


Thanks! 

> difficult for native speakers to understand. Many errors are caused by 
> machine translation without manual correction.
> 
> This set of patchs aims to fix the above problems and synchronize them with
> original files. Some structure modifications need to rewrite the whole 
> sentences, so here are a lot of changes.
> 
> Wu XiangCheng (5):
>   docs/zh_CN: Improve zh_CN/process/index.rst
>   docs/zh_CN: Improve zh_CN/process/1.Intro.rst
>   docs/zh_CN: Improve zh_CN/process/2.Process.rst
>   docs/zh_CN: Improve zh_CN/process/3.Early-stage.rst
>   docs/zh_CN: Improve zh_CN/process/4.Coding.rst
> 
>  .../translations/zh_CN/process/1.Intro.rst    | 146 ++++-----
>  .../translations/zh_CN/process/2.Process.rst  | 296 +++++++++---------
>  .../zh_CN/process/3.Early-stage.rst           | 120 +++----
>  .../translations/zh_CN/process/4.Coding.rst   | 251 ++++++++-------
>  .../translations/zh_CN/process/index.rst      |  10 +-
>  5 files changed, 412 insertions(+), 411 deletions(-)
> 
