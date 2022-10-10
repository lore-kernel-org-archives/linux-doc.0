Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568E1C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 19:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiJJTBW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 15:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJJTBV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 15:01:21 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555006C97A
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 12:01:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 064BD2D5;
        Mon, 10 Oct 2022 19:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 064BD2D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665428480; bh=iOag5gvbYariUa/tHPEFSTYmR1vNM9eJfZf2SpWLuKc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ASdvnV3vXAMmjE9uO6EGhTtyANerf4E/ca8W1FUSg4nf1hoTXa48QNEoSoAjjbM/8
         44EExYLKNAAvCfKtCPW3spbekzHqjCUYXwDfbcT3GTq3qHNHljLprthMdrJnvM3tPR
         15Ak/3IQ6o2YiLBY4ZM1uCPOFbttL2plpSzOBvEPZUgNP/Z5GmOINZ9d5ggeyvIUJx
         wWbDvSfnmmPAvCHiF7e3bThkAFJ18uOCdGGcYRarL/Vh9TadzIfm0i2I+pGxbKKwov
         a8EL3c1F7QnFvqnF7naFt+vhGyDvsBY6RUfrkUIFRlgUAcSB4WhPwMqt7gGUGrGcnY
         ETJgZWHfZbOgQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Joel Stanley <joel@jms.id.au>, Richard Weinberger <richard@nod.at>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: ubifs: Fix compression idiom
In-Reply-To: <20221005030904.65604-1-joel@jms.id.au>
References: <20221005030904.65604-1-joel@jms.id.au>
Date:   Mon, 10 Oct 2022 13:01:19 -0600
Message-ID: <87zge3pkow.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Joel Stanley <joel@jms.id.au> writes:

> Clearly the author meant 'on the fly'.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/filesystems/ubifs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/filesystems/ubifs.rst b/Documentation/filesystems/ubifs.rst
> index e6ee99762534..ced2f7679ddb 100644
> --- a/Documentation/filesystems/ubifs.rst
> +++ b/Documentation/filesystems/ubifs.rst
> @@ -59,7 +59,7 @@ differences.
>  * JFFS2 is a write-through file-system, while UBIFS supports write-back,
>    which makes UBIFS much faster on writes.
>  
> -Similarly to JFFS2, UBIFS supports on-the-flight compression which makes
> +Similarly to JFFS2, UBIFS supports on-the-fly compression which makes
>  it possible to fit quite a lot of data to the flash.

Applied, thanks.

jon
