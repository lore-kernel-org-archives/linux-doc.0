Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623B1C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 22:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1946264DED
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 22:38:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbhA1Wiy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jan 2021 17:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbhA1Wix (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jan 2021 17:38:53 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F0FC06174A
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 14:38:10 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A10006178;
        Thu, 28 Jan 2021 22:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A10006178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611873489; bh=8v6hRXi0oZy4eF5+fRLAgbZUHZqGgRUbfS0g5YUtDp4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XTXvSrBMBUlC7WWQnVu8aNXXKOfq3b8zd9Kc5THWO++Uz++nYIFcJ8Hk91w+E1Rvp
         nweFCs8jB9hxb4eCLHuTaBULSlOWbMu4wkjOJVMUQ0cGaTlwyj9JjOkfF63vFKKKGb
         DEpE1qZUnkw41sYLNHPrVDAbz2VlHN9giZDwGSmRwj7dujG6BKyQtsiaGSFFJNMlUr
         Ddkmb+nS81Q1xHnruE5bO6rTb7BaB3JUcKK0CA/O4gk2ecSbnH9Z6lA8BJyHn5uTcT
         kOlOA+KiRTPMsHxT1XqLFC+08mQhChXXS62TZhft+Q02Qr7L/LeHRS+yKTAfINxXk8
         BKb8KqkQGn1VQ==
Date:   Thu, 28 Jan 2021 15:38:08 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: ARM: fix reference to DT format
 documentation
Message-ID: <20210128153808.7eaa0343@lwn.net>
In-Reply-To: <7f07e544d9fc584242d496c2f54f9303d8de0724.1611558630.git.baruch@tkos.co.il>
References: <7f07e544d9fc584242d496c2f54f9303d8de0724.1611558630.git.baruch@tkos.co.il>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Jan 2021 09:10:30 +0200
Baruch Siach <baruch@tkos.co.il> wrote:

> The booting-without-of.rst file is no longer there. Link to
> devicetree.org instead.
> 
> Fixes: 441848282c590 ("dt: Remove booting-without-of.rst")
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  Documentation/arm/booting.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/arm/booting.rst b/Documentation/arm/booting.rst
> index a2263451dc2c..5974e37b3d20 100644
> --- a/Documentation/arm/booting.rst
> +++ b/Documentation/arm/booting.rst
> @@ -128,7 +128,7 @@ it.  The recommended placement is in the first 16KiB of RAM.
>  
>  The boot loader must load a device tree image (dtb) into system ram
>  at a 64bit aligned address and initialize it with the boot data.  The
> -dtb format is documented in Documentation/devicetree/booting-without-of.rst.
> +dtb format is documented at https://www.devicetree.org/specifications/.

Applied, thanks.

jon
