Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC36C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 08:23:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8AB9164F09
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 08:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhCDIWx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 03:22:53 -0500
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36]:31927 "EHLO
        out4436.biz.mail.alibaba.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236587AbhCDIWZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 03:22:25 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0UQNNh5d_1614846093;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UQNNh5d_1614846093)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 04 Mar 2021 16:21:34 +0800
Subject: Re: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/README.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20210304080131.GA16539@mipc>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <0958853c-604f-8b5a-2cb7-a1753eee9b84@linux.alibaba.com>
Date:   Thu, 4 Mar 2021 16:21:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210304080131.GA16539@mipc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/3/4 下午4:01, Wu XiangCheng 写道:
> Add translation zh_CN/admin-guide/README.rst, and link it to
> zh_CN/admin-guide/index.rst while clean its todo entry.
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>


Better send out a patchset into one series.

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
