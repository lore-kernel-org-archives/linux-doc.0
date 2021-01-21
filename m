Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF474C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AEF8123ABA
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbhAUTsl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:48:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726205AbhAUSro (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 13:47:44 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA7FC0613ED
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 10:46:58 -0800 (PST)
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9B1C1615C;
        Thu, 21 Jan 2021 18:46:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B1C1615C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1611254818; bh=PViKmR17LWz+Sl/ns1BtHaIpYHK3G3dIAJK29571lpk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bHJv4pqvpwb5cg8GwKO+pNlVxyQQ1ZV/8XqJbvR2tkJiwmtk6Ai+YyJP4z7bFTK59
         iVQp/RMbECeRLXouL346ygl4IbXc/hdNqIawvjvW7FH3vOi7ZVlROpJfQN4BO42D4f
         IQixy/2PGybwx2hgb13LAO25Vu1YRLYyqNHeHW+3bMGX5bDUsdar8hHjGtaMbkciGj
         CySbQU9mg+xmuZFrHUaVgIm+hlshB8nMqMceLIqe8hGxArTiPGddDCrXao5XaF5jsh
         nfdN7zwWzTQ632wJohbO16hl8bhDfw3mXnh2vXi7jR1SVu10LVZEBnT/PSMbUTrH5E
         tAGcQRRkTv9cA==
Date:   Thu, 21 Jan 2021 11:46:56 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Lars Poeschel <poeschel@lemonage.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] docs: iio: Correct a typo
Message-ID: <20210121114656.55874140@lwn.net>
In-Reply-To: <20210119030320.2860870-1-siyanteng@loongson.cn>
References: <20210119030320.2860870-1-siyanteng@loongson.cn>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 19 Jan 2021 11:03:20 +0800
Yanteng Si <siyanteng@loongson.cn> wrote:

> There are two EP9312, one of them should be 9315
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/iio/ep93xx_adc.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/iio/ep93xx_adc.rst b/Documentation/iio/ep93xx_adc.rst
> index 4fd8dea3f6b8..0af0e9040457 100644
> --- a/Documentation/iio/ep93xx_adc.rst
> +++ b/Documentation/iio/ep93xx_adc.rst
> @@ -13,7 +13,7 @@ touchscreen/ADC module.
>  ====================
>  
>  Numbering scheme for channels 0..4 is defined in EP9301 and EP9302 datasheets.
> -EP9307, EP9312 and EP9312 have 3 channels more (total 8), but the numbering is
> +EP9307, EP9312 and EP9315 have 3 channels more (total 8), but the numbering is
>  not defined. So the last three are numbered randomly, let's say.

Applied, thanks.

jon
