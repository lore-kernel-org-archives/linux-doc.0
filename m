Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687F3C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:36:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 326BD60238
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:36:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhBOQgh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 11:36:37 -0500
Received: from ms.lwn.net ([45.79.88.28]:46710 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230235AbhBOQed (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Feb 2021 11:34:33 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 56AFE536;
        Mon, 15 Feb 2021 16:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 56AFE536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613406825; bh=eAmvWFRdBgbvfXEsF2VPEJKDmUEyxTCLV979Goe/JlE=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=p4h95FVGM7oWOO93RD4HbD9BPrcULDt86rgzh40veYb2I/j92h+MG9WtmPgo+EM6U
         BoMK+5iaJPCu9eKStmeDvIjMk7zXk8gILu2R+rlSRN8RUfu9wnf83On+U5Sv5v825B
         S2e6eQfLGX82rbM4ch9s4K8w3kkYXboNyshHhT+uR8i4HZn82hL0HiMwxONvxOBeHb
         Q6yO5YMGw16tud1wDiAFQMxgRY96liD6kxEZvLMRNLH0HitDlKsW2/SsInv92raH4B
         UvzpxcqFIrOky/TDlSXDRyUbdNAMQ3oF4zhkVRU9wPYesRe2gajEDpN4AjxcakSkf7
         9qoOTuFFb22ww==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Fix unaesthetic indentation
In-Reply-To: <20210215161757.GD2858050@casper.infradead.org>
References: <20210215161757.GD2858050@casper.infradead.org>
Date:   Mon, 15 Feb 2021 09:33:44 -0700
Message-ID: <87k0r9mgt3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> The current documentation build looks like this:
>
> $ make htmldocs
>   SPHINX  htmldocs --> file:///home/willy/kernel/linux-next/Documentation/output
> make[2]: Nothing to be done for 'html'.
> WARNING: The kernel documentation build process
>         support for Sphinx v3.0 and above is brand new. Be prepared for
>         possible issues in the generated output.
>         $
>
> That extra indentation before my next prompt isn't pretty.  This patch
> fixes it, but I'm not a pythonista, and maybe there's a better way.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 5bd45d5fb0a0..8a9ed3f29cd5 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -50,7 +50,7 @@ if major >= 3:
>      sys.stderr.write('''WARNING: The kernel documentation build process
>          support for Sphinx v3.0 and above is brand new. Be prepared for
>          possible issues in the generated output.
> -        ''')
> +''')

The alternative would be:

          possible issues in the generated output.\n''')

jon
