Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A50C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D03066142C
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhEMPlO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 11:41:14 -0400
Received: from ms.lwn.net ([45.79.88.28]:43344 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234902AbhEMPlN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 11:41:13 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2CA1D2E7;
        Thu, 13 May 2021 15:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2CA1D2E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620920403; bh=ay2VxPVMf3s+nXZJnBIP/BRL42blKPZvY+Qu2aGNXYc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CkF7D62TrjTORz8OeM7bvmUu9YfMtUMOFgdqMcw2AkVRRoitb4Qlv5tHkCzHPGaQB
         5RVXruOcH//+llQQjQoavyVEfUpqzEgBqZSVHXzY22zMSTWkVhVugI2CwUE5fck8rk
         py/aZjysSzcfhA+QQbmx18V9TahUCDpUBGRDXH4O/psycf3olO+Q/3HvXqpPyrcjsm
         6wULh5HnGMOZlIjkjRQAx+caJtWWkRQszghAOMGb+qUAOHjufEj/WQbks6xRS+2vk9
         41Q8ZyDLJcb9csPBBsAiHbfDu8aC/2DNlbo/fV8A51GPnx02oushazoMLARI2fjbcJ
         0jxP9+rsBQS3Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Subject: Re: [PATCH v2 0/6] docs/zh_CN: Add translation zh_CN/maintainer
In-Reply-To: <cover.1619278582.git.bobwxc@email.cn>
References: <cover.1619278582.git.bobwxc@email.cn>
Date:   Thu, 13 May 2021 09:40:02 -0600
Message-ID: <87sg2q63sd.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Hi all,
>
> This set of patches aims to add translations zh_CN/maintainer.
>
> v2:
> * Modified some words in [Patch 3-4/6] under Yanteng Si's advices.
>   Thanks for his review!
> * Pick Yanteng Si's reviewed-by tag for [Patch 1-6/6]
>
> v1:
> <https://lore.kernel.org/linux-doc/cover.1619093668.git.bobwxc@email.cn/T/#t>
>
> Please note that since each patch need to modify their own entry
> in zh_CN/maintainer/index.rst, patches should be applied in order.
>
> Thanks!
>
> Base on jc/docs-next

So my apologies but ... can I get you to resend this against current
docs-next?  There have been enough changes to the index.rst files that
I'm not confident in trying to merge things.

Sorry for the delays - the merge window tends to do that.

Thanks,

jon
