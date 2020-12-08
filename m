Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBFBC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 02:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B74423433
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 02:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgLHChN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 21:37:13 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:41803 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727075AbgLHChN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 21:37:13 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UHwb6FU_1607394989;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UHwb6FU_1607394989)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 08 Dec 2020 10:36:30 +0800
Subject: Re: [PATCH] docs/zh_CN: Improve Cinese transolation quality.
To:     Ran Wang <gxndwr@outlook.com>, Harry Wei <harryxiyou@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <AT5PR8401MB09648490A868481BB51D7326CCF00@AT5PR8401MB0964.NAMPRD84.PROD.OUTLOOK.COM>
 <718033fa-eb9f-63b7-5285-18fac2310721@linux.alibaba.com>
 <AT5PR8401MB0964184C8C077AD7AAC741EBCCCE0@AT5PR8401MB0964.NAMPRD84.PROD.OUTLOOK.COM>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <a3ff9f37-672e-e7ca-bea3-f3a41c162151@linux.alibaba.com>
Date:   Tue, 8 Dec 2020 10:36:29 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AT5PR8401MB0964184C8C077AD7AAC741EBCCCE0@AT5PR8401MB0964.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2020/12/7 下午9:05, Ran Wang 写道:
>>> +:ref:`cn_development_followthrough` 介绍了提交补丁之后发生的事情；至此工作实际
>> is it bybond 80 chars?
> On my part this line is aligned with context (on vim), and pass checkpatch.pl check,

En, right, maybe a line alignment? but it depends on different editors. it's fine.
> 
>>> +上还远未完成。与审阅者一起合作是开发过程中的重要部分；本节提供了一些关于如何在
>>> +这个重要阶段避免出现问题的提示。此外，即使当补丁已经被合并到主线中，开发者也不
>>> +能认为任务就此完成。
>>>   
>>>   :ref:`cn_development_advancedtopics` 介绍了两个“高级”主题：
>>> -使用Git管理补丁和查看其他人发布的补丁。
>>> +使用Git管理补丁和查看其他人提交的补丁。
>> Any different of above lines?
> 发布 => 提交  :)

ops, overlooked, 提交 is better.

Thanks!
