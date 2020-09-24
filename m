Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E22C4346E
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 05:24:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A93D235FD
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 05:24:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgIXFY5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 01:24:57 -0400
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:44412 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726683AbgIXFY5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 01:24:57 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0U9wWVtx_1600925094;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0U9wWVtx_1600925094)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 24 Sep 2020 13:24:55 +0800
Subject: Re: [PATCH] doc: zh_CN: add translatation for btrfs
To:     Wang Qing <wangqing@vivo.com>, Harry Wei <harryxiyou@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1600776267-20146-1-git-send-email-wangqing@vivo.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <e6b64451-35d9-6db2-78f5-306d9376ab56@linux.alibaba.com>
Date:   Thu, 24 Sep 2020 13:22:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1600776267-20146-1-git-send-email-wangqing@vivo.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Qing,

It looks like all vivo guys patch has 'charset=y' problem and
mess code which fails on a success 'git am'. I have to repeat
the same reminder again and again...

Could you guys double your patches before send out? and make 
sure docs looks good on webpage, like 
https://www.kernel.org/doc/html/v5.9-rc3/translations/zh_CN/filesystems/debugfs.html

Thanks
Alex

ÔÚ 2020/9/22 ÏÂÎç8:03, Wang Qing Ð´µÀ:
> Translate Documentation/filesystems/btrfs.rst into Chinese.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
