Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE810C433E6
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BCF964F1D
	for <linux-doc@archiver.kernel.org>; Tue,  2 Mar 2021 18:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580334AbhCBSBY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Mar 2021 13:01:24 -0500
Received: from out30-45.freemail.mail.aliyun.com ([115.124.30.45]:53688 "EHLO
        out30-45.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1837161AbhCBHfU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Mar 2021 02:35:20 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UQ4AYPc_1614670474;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UQ4AYPc_1614670474)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 02 Mar 2021 15:34:34 +0800
Subject: Re: [PATCH] PATCH Documentation translations:translate
 sound/hd-audio/controls to chinese
To:     huangjianghui@uniontech.com, Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210301122019.80234-1-huangjianghui@uniontech.com>
 <8735xe4lsb.fsf@meer.lwn.net> <20210302032220.GA938@akg>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <e9937016-3b09-fb43-8fbf-a6c9b21597ac@linux.alibaba.com>
Date:   Tue, 2 Mar 2021 15:34:33 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210302032220.GA938@akg>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



ÔÚ 2021/3/2 ÉÏÎç11:22, huangjianghui Ð´µÀ:
>>
> In the next patch ,I deleted the index of the untranstated files,and i
> used checkpatch.pl to detect doc errors and tried to built the htmldocs
> on my pc.
> 
> Thanks,
> 
> Huang Jianghui

Hi Jianghui,

we usually include patch into email instead of attach it as attachment.
You can try use 'git send-email' to post your patches.

Thanks
Alex
