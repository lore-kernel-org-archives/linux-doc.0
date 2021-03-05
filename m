Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC829C433E6
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 10:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3FB965017
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 10:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCEKgZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 05:36:25 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:50193 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhCEKgJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 05:36:09 -0500
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI7n5-0007ZA-6z
        for linux-doc@vger.kernel.org; Fri, 05 Mar 2021 10:34:39 +0000
Received: by mail-wm1-f69.google.com with SMTP id a63so247095wmd.8
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 02:34:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RWwbwcqn7+V68bGLU4ZDn1q+MKGqnLhOEC9uAVuE8zc=;
        b=C6HRdA6v3dth6LGrAcbvgZqpd3vDUU85YStVPjb3JrfLllVTMuXaMmnT2UMeRatlqf
         9Azv6KKJuRYpeegeMkYlx4aifTyOZ45VVrUiSXrycP03rIHU/DO3tf3vF3zkWhe6qiq9
         BVJlXAQZyGKy5SyDtS2h95JCDFLkSZKgl7bnrB8HlrzfcpkeRrQzcFK85Ka84HBuqvHD
         no78dUT70i/lwv15wa6HxrjmuK0X9H/01Tn20g9bXCRPLgLU4giv/WIuf2jxoOpBosmg
         kq0672UljfIDRBfr7YT0wO4E1cCHvWiRK79jTxVyvJZt38cB2fIckDvzknKfvDvkl383
         2/HA==
X-Gm-Message-State: AOAM532wHaDBcJk+DjFYN3mZw/RwfRD5e1ySkIzetNlWTlO0E4ctIJ/j
        cLocOlrvbqb/d/D5vT3Ybbw2xZsoPNUqbsFLn+wk85qIEuTK+IPv57p80pr3ybF0ouBbFom2lPc
        bV7CnNIHAENVEAttdflesB6CkbfXiJlLv8Be3vg==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr8647744wrr.341.1614940478802;
        Fri, 05 Mar 2021 02:34:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL/xW+AO3OBrJBdGRjyMx7XXgn/DcEVAjw6nrX4rZjq/i98eqo/Tr07xkBjjsbwJ/68iC9lg==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr8647714wrr.341.1614940478678;
        Fri, 05 Mar 2021 02:34:38 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id p6sm3759537wru.2.2021.03.05.02.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:34:38 -0800 (PST)
Subject: Re: [RFT PATCH v3 19/27] tty: serial: samsung_tty: Add ucon_mask
 parameter
To:     Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210304213902.83903-1-marcan@marcan.st>
 <20210304213902.83903-20-marcan@marcan.st>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <1e665346-15eb-3a9f-6dc3-7494a8050972@canonical.com>
Date:   Fri, 5 Mar 2021 11:34:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304213902.83903-20-marcan@marcan.st>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/03/2021 22:38, Hector Martin wrote:
> This simplifies the code by removing the only distinction between the
> S3C2410 and S3C2440 codepaths.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/tty/serial/samsung_tty.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 78dc6e9240fb..33b421dbeb83 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -70,6 +70,7 @@ struct s3c24xx_uart_info {
>  	unsigned long		num_clks;
>  	unsigned long		clksel_mask;
>  	unsigned long		clksel_shift;
> +	unsigned long		ucon_mask;
>  
>  	/* uart port features */
>  
> @@ -1736,14 +1737,9 @@ static void s3c24xx_serial_resetport(struct uart_port *port,
>  {
>  	struct s3c24xx_uart_info *info = s3c24xx_port_to_info(port);
>  	unsigned long ucon = rd_regl(port, S3C2410_UCON);
> -	unsigned int ucon_mask;
>  
> -	ucon_mask = info->clksel_mask;
> -	if (info->type == PORT_S3C2440)
> -		ucon_mask |= S3C2440_UCON0_DIVMASK;
> -
> -	ucon &= ucon_mask;
> -	wr_regl(port, S3C2410_UCON,  ucon | cfg->ucon);
> +	ucon &= (info->clksel_mask | info->ucon_mask);
> +	wr_regl(port, S3C2410_UCON, ucon | cfg->ucon);

This line (wr_regl()) is not related, please split it to separate
white-space cleanups.

With the change:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
