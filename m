Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F96C433ED
	for <linux-doc@archiver.kernel.org>; Mon,  3 May 2021 22:51:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A037611C0
	for <linux-doc@archiver.kernel.org>; Mon,  3 May 2021 22:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhECWws (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 May 2021 18:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhECWws (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 May 2021 18:52:48 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F447C061574
        for <linux-doc@vger.kernel.org>; Mon,  3 May 2021 15:51:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d:444a:d152:279d:1dbb])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4E2B82ED;
        Mon,  3 May 2021 22:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4E2B82ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620082314; bh=xEfPyLbb2a89w2CLAixGsxlbfdpKRUu/1QGSXFLPTfg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JXV14MSdQDszGDHJogIHkCtanjuGFf0qqPSWvZ+SqnqDIvAEhTuPQSzqJouHV0JsO
         UY5jwx1M84BTu17mveGpJdkFIAo4F3I667w7TquXSmMZdtJgrf18S+dhP+lU7xj8fr
         uwOzTIzzFQ98skkbLEwM5BSEP33jUr/b6DuPRkpuq1ESAmbNZUnUVA1sa8P0uQEXYk
         d7BuIjiFm7kjKZSXyixL3MKd43hKpyFnROuz8cDJRjODYGiDvnnii7MPeEXiIB/LZ4
         zyiT6d8w6uQge8CPFs3I+Pg5ofLOBimMmDQacXbPdYqsi7oNLYdkhUzjkl3UyrPtZJ
         /P+RisO8wJVpQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huang JiangHui <huangjianghui@uniontech.com>,
        Bailu Lin <bailu.lin@vivo.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] docs/zh_CN: Adjust order and content of zh_CN/index.rst
In-Reply-To: <20210430122234.GA655@bobwxc.top>
References: <20210416074652.GA6138@bobwxc.top>
 <20210430122234.GA655@bobwxc.top>
Date:   Mon, 03 May 2021 16:51:53 -0600
Message-ID: <87im3zh1me.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Adjust order and content of zh_CN/index.rst to make it clear,
> complete introductions and TODOLists.
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> base on jc/docs-next
>
> v2:
> rebase to newest docs-next
>
> v1:
> <https://lore.kernel.org/linux-doc/20210416074652.GA6138@bobwxc.top/>
>
>  Documentation/translations/zh_CN/index.rst | 168 +++++++++++++++++++--
>  1 file changed, 158 insertions(+), 10 deletions(-)

Applied, thanks.

jon
