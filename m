Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F03C433E6
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 07:27:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F5A64F4D
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 07:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229469AbhCQH0x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 03:26:53 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:51474 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229712AbhCQH0u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 03:26:50 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R311e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=3;SR=0;TI=SMTPD_---0USEIZjw_1615966006;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0USEIZjw_1615966006)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 17 Mar 2021 15:26:47 +0800
Subject: Re: [PATCH v1 0/4] Add translations in zh_CN/admin-guide/
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <cover.1615950640.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <6bac3797-5773-a714-2514-465428465827@linux.alibaba.com>
Date:   Wed, 17 Mar 2021 15:26:46 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <cover.1615950640.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Good work, xiangcheng,

Just why your patchset dispersed in different series?
Could you put them together by 'git send-email' or
by other email clients? That could help a lot for
patchset pickup.

Thanks
Alex

在 2021/3/17 下午12:32, Wu XiangCheng 写道:
> Hi all,
> 
> This set of patches aims to add some translations in zh_CN/admin-guide/ .
> 
> - V1
>   - Re-manage the patch thread 
>   - Add zh_CN/admin-guide/security-bugs.rst
>   - Modify one word in [Patch 3/4] under Alex Shi's suggestion
>   - Pick Alex Shi's Reviewed-by tag for [Patch 1~2/4]
> 
> - V0
>   - Add zh_CN/admin-guide/reporting-issues.rst
>     <https://lore.kernel.org/linux-doc/20210315110119.GA9524@mipc/>
>   - Add zh_CN/admin-guide/bug-bisect.rst
>     <https://lore.kernel.org/linux-doc/b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn/>
>   - Add zh_CN/admin-guide/bug-hunting.rst
>     <https://lore.kernel.org/linux-doc/20210315110119.GA9524@mipc/>
> 
> Thanks!
> 
> Wu XiangCheng (4):
>   docs/zh_CN: Add zh_CN/admin-guide/reporting-issues
>   docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
>   docs/zh_CN: Add zh_CN/admin-guide/bug-hunting.rst
>   docs/zh_CN: Add zh_CN/admin-guide/security-bugs.rst
> 
>  .../zh_CN/admin-guide/bug-bisect.rst          |   81 ++
>  .../zh_CN/admin-guide/bug-hunting.rst         |  340 +++++
>  .../translations/zh_CN/admin-guide/index.rst  |   11 +-
>  .../zh_CN/admin-guide/reporting-issues.rst    | 1269 +++++++++++++++++
>  .../zh_CN/admin-guide/security-bugs.rst       |   74 +
>  5 files changed, 1772 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-bisect.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/bug-hunting.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/reporting-issues.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/security-bugs.rst
> 
