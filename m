Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAB0C433E6
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 08:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43FA264DE8
	for <linux-doc@archiver.kernel.org>; Mon,  1 Mar 2021 08:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhCAIip (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Mar 2021 03:38:45 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:44921 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233335AbhCAIii (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Mar 2021 03:38:38 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPxZHnC_1614587862;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPxZHnC_1614587862)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 01 Mar 2021 16:37:42 +0800
Subject: Re: [PATCH v2 1/9] docs/zh_CN: Improve zh_CN/process/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     harryxiyou@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
References: <cover.1614488009.git.bobwxc@email.cn>
 <bf7d8e474ea3332a8595f46619b427b1ebbcb791.1614488009.git.bobwxc@email.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <4cbfdc6e-1fca-fa12-e169-14f9b74c7039@linux.alibaba.com>
Date:   Mon, 1 Mar 2021 16:37:41 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <bf7d8e474ea3332a8595f46619b427b1ebbcb791.1614488009.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/2/28 下午1:37, Wu XiangCheng 写道:
> Improve language and grammar of zh_CN/process/index.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  Documentation/translations/zh_CN/process/index.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
> index 8051a7b322c5..39e9c88fbaa6 100644
> --- a/Documentation/translations/zh_CN/process/index.rst
> +++ b/Documentation/translations/zh_CN/process/index.rst
> @@ -13,11 +13,11 @@
>  与Linux 内核社区一起工作
>  ========================
>  
> -那么你想成为Linux内核开发人员？ 欢迎！ 不但从技术意义上讲有很多关于内核的知识
> -需要学，而且了解我们社区的工作方式也很重要。 阅读这些文章可以让您以更轻松地,
> -麻烦最少的方式将更改合并到内核。
> +你想成为Linux内核开发人员吗？欢迎之至！在学习许多关于内核的技术知识的同时，
> +了解我们社区的工作方式也很重要。阅读这些文档可以让您以更轻松的、麻烦更少的
> +方式将更改合并到内核。
>  
> -以下是每位开发人员应阅读的基本指南。
> +以下是每位开发人员都应阅读的基本指南：
>  
>  .. toctree::
>     :maxdepth: 1
> @@ -47,7 +47,7 @@
>     management-style
>     embargoed-hardware-issues
>  
> -这些是一些总体技术指南，由于缺乏更好的地方，现在已经放在这里
> +这些是一些总体性技术指南，由于不大好分类而放在这里：
>  
>  .. toctree::
>     :maxdepth: 1
> 
