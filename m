Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88900C4346E
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 03:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5616A2311C
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 03:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgI1DHW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Sep 2020 23:07:22 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:52005 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726396AbgI1DHV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Sep 2020 23:07:21 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0UAGCfyQ_1601262438;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UAGCfyQ_1601262438)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 28 Sep 2020 11:07:19 +0800
Subject: Re: [PATCH V4] doc: zh_CN: add translatation for btrfs
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <AD2ALwDyDSi*zP*WYtkMTqrL.3.1601259876260.Hmail.wangqing@vivo.com>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <6393b734-7715-32fb-3cc5-bf0bdc9e7a54@linux.alibaba.com>
Date:   Mon, 28 Sep 2020 11:04:53 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AD2ALwDyDSi*zP*WYtkMTqrL.3.1601259876260.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2020/9/28 上午10:24, 王擎 写道:
> 在 2020/9/25 下午3:22, Wang Qing 写道:
>> Translate Documentation/filesystems/btrfs.rst into Chinese.
>>
>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>> ---
>>  .../translations/zh_CN/filesystems/btrfs.rst       | 37 ++++++++++++++++++++++
>>  .../translations/zh_CN/filesystems/index.rst       |  1 +
>>  2 files changed, 38 insertions(+)
>>  create mode 100644 Documentation/translations/zh_CN/filesystems/btrfs.rst
>>
>> diff --git a/Documentation/translations/zh_CN/filesystems/btrfs.rst b/Documentation/translations/zh_CN/filesystems/btrfs.rst
>> new file mode 100644
>> index 0000000..8b8cca2
>> --- /dev/null
>> +++ b/Documentation/translations/zh_CN/filesystems/btrfs.rst
>> @@ -0,0 +1,37 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: ../disclaimer-zh_CN.rst
>> +
>> +:Original: :ref:`Documentation/filesystems/ext3.rst <ext3_index>`

Uh, the encoding is right. but is the btrfs.rst's original file ext3.rst?

