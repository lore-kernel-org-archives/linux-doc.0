Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB51C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 19:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75A2F64E27
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 19:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbhCOTDx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 15:03:53 -0400
Received: from ms.lwn.net ([45.79.88.28]:43076 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232917AbhCOTDq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Mar 2021 15:03:46 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 892742E5;
        Mon, 15 Mar 2021 19:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 892742E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615835025; bh=QypNFyeA1Y53RZBH32uQ1ZH1dtdi/T309FCBH6S4fH0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Wa25vhrYYTPme8v9i8z/h4H+WCw9Du519YF597ebySIFfUh6SJsVVzTxf2yyixL+B
         SsBN1xBVB7VCTQvowlwB1mMloRihUDmbX0OByHyHAkWBHzOQLPgILVHLvvlMNSRHkT
         mjGQ4cwNK04rRknRmNvMZeV5bHdTPtAJ+yjNH0h6JjhEOeyZxig6Cw8yIIfpK9I4MA
         EMvfb1uugVcskVKgEQcYvMsKrhfeqJg+O3HmagSX9TAuweeySVqGkX/GDyxeN1KDiI
         MbyxHuxQTi9BcUs/+0v8xmxITu54PKZmR0lGF1EtdzwidAfhlpR3t/cB/J+sq8Uj3H
         mhcweNPe30E1g==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, tj@kernel.org,
        lizefan@huawei.com, hannes@cmpxchg.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] docs: admin-guide: cgroup-v1: Fix typos in the file
 memory.rst
In-Reply-To: <20210313061029.28024-1-unixbhaskar@gmail.com>
References: <20210313061029.28024-1-unixbhaskar@gmail.com>
Date:   Mon, 15 Mar 2021 13:03:45 -0600
Message-ID: <87im5s2q9a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

> s/overcommited/overcommitted/
> s/Overcommiting/Overcommitting/
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  Documentation/admin-guide/cgroup-v1/memory.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/cgroup-v1/memory.rst b/Documentation/admin-guide/cgroup-v1/memory.rst
> index 52688ae34461..0d574fd3f8e3 100644
> --- a/Documentation/admin-guide/cgroup-v1/memory.rst
> +++ b/Documentation/admin-guide/cgroup-v1/memory.rst
> @@ -360,8 +360,8 @@ U != 0, K = unlimited:
>
>  U != 0, K < U:
>      Kernel memory is a subset of the user memory. This setup is useful in
> -    deployments where the total amount of memory per-cgroup is overcommited.
> -    Overcommiting kernel memory limits is definitely not recommended, since the
> +    deployments where the total amount of memory per-cgroup is overcommitted.
> +    Overcommitting kernel memory limits is definitely not recommended, since the
>      box can still run out of non-reclaimable memory.

Applied, thanks.

jon
