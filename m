Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B492FC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C65961249
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346609AbhDMVIK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 17:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344575AbhDMVIG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 17:08:06 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C72AC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 14:07:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C98C02CD;
        Tue, 13 Apr 2021 21:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C98C02CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618348065; bh=WONAx9xa6Ikh59DY6pHp1Fg8oq6gB6iwmdIZPYYr2KE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=UlOJvHOFtjj6ZXMun3RZ9axOXluR6AjkzW7xqTypIawq/mq0eQXBxyFLe3O+rD8aT
         J6qCLMB60g2pjd/ZqO83Fwrb7mAgbLC3qrdbNqksZZr/P4qYABfKHP3Hb5yGMBBXsV
         zA0cF8kv6SGLHFre+8OPzPOtMPcrD4vvtD9qySszxzb795DUTQ5+Nk8dfxkf9roFGP
         TeHRu8TwtNi1NCGMisKvrM+KvgE/2za3jEyly8R4XK1lJzdqoRyNLgk+/ArMDFLTkN
         4xCI5nvSBV7LVfnZkqh7SW8GuANDtaD7IFlctLMBGd3Itd0RxchEMqfIYFe5T0+Fhk
         5//FF3zUgQ5mA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.com>
Cc:     Alex Shi <seakeel@gmail.com>, YanTeng Si <sterlingteng@gmail.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: sync reporting-issues.rst
In-Reply-To: <20210413072934.GA2674@bobwxc.top>
References: <20210408135659.GA6747@bobwxc.top>
 <20210413072934.GA2674@bobwxc.top>
Date:   Tue, 13 Apr 2021 15:07:45 -0600
Message-ID: <87czuxsxjy.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Sync zh translation reporting-issues.rst to
> commit 58c539453b71 ("docs: reporting-issues: reduce quoting and assorted
> fixes")
>
> Drop reporting-bug.rst
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> remove EOF empty line
>
>  .../zh_CN/admin-guide/reporting-issues.rst    | 791 ++++++++++--------
>  1 file changed, 429 insertions(+), 362 deletions(-)

Applied, thanks.

jon
