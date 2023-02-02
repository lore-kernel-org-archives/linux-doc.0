Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05442C05027
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 18:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232868AbjBBSef (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 13:34:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbjBBSeS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 13:34:18 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7863D915;
        Thu,  2 Feb 2023 10:33:38 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6E7C6739;
        Thu,  2 Feb 2023 18:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6E7C6739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1675362712; bh=hdydmmkBqh0Na2y8VTc6XM8uE86BFrI4xn8wgbkIkA8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=U+nq+gnJTyKCCDAnWQh4j4g5XXxRmaXWjXAyBaIixrGKBhye/Sb0pnk+Vbwr2DQZt
         cSAxyAXIGnIwM1biTqvOkSnJ/Swj6wwNc3TGtIYvbom+qgvwKdnNOWyI0OEfUlv80V
         2I1Rb5GdYR+eGiAR3kq3qZIQimXswc6NDgCEcbeGbr0JU2KXAjmSkr0LcRntHnE6pA
         HKP8JP/aRv37vZ4HPp4rDRBcE7aCNJgfGYr5Jm8+a0kTpN2zxED9BqJG8i2xf/7deL
         bN4M2Em0gcNOKXl++EPx87Xo3GfOc4d2CunZZUF2amMo2cW8pQJIooEsyvrvFxryhG
         I3DYY413T6H8w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2] printk: Document that CONFIG_BOOT_PRINTK_DELAY
 required for boot_delay=
In-Reply-To: <20230126225420.1320276-1-helgaas@kernel.org>
References: <20230126225420.1320276-1-helgaas@kernel.org>
Date:   Thu, 02 Feb 2023 11:31:51 -0700
Message-ID: <87wn4zvrzc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bjorn Helgaas <helgaas@kernel.org> writes:

> From: Bjorn Helgaas <bhelgaas@google.com>
>
> Document the fact that CONFIG_BOOT_PRINTK_DELAY must be enabled for the
> "boot_delay" kernel parameter to work.  Also mention that "lpj=" may be
> necessary.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
> Changes from v1 (https://lore.kernel.org/all/20230123180440.901793-1-helgaas@kernel.org/):
> - Clarify use of "lpj=".  Reword consequences of delay larger than 10000.
>
>  Documentation/admin-guide/kernel-parameters.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6cfa6e3996cf..814e58487239 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -480,8 +480,10 @@
>  			See Documentation/block/cmdline-partition.rst
>  
>  	boot_delay=	Milliseconds to delay each printk during boot.
> -			Values larger than 10 seconds (10000) are changed to
> -			no delay (0).
> +			Only works if CONFIG_BOOT_PRINTK_DELAY is enabled,
> +			and you may also have to specify "lpj=".  Boot_delay
> +			values larger than 10 seconds (10000) are assumed
> +			erroneous and ignored.
>  			Format: integer

Applied, thanks.

jon
