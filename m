Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384C3ECAAA1
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 22:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIFWLc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 18:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiIFWLb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 18:11:31 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEBB9E6A9
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 15:11:28 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id nc14so26321765ejc.4
        for <linux-doc@vger.kernel.org>; Tue, 06 Sep 2022 15:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=KBxZTl3QLBPzQvK7Avwrhh94NGQfx9l6fJMpQ6cilkA=;
        b=BkGdOuXQ1cLS+b0NYKo/64meSchT279vzK9adoSJ6jORvCkmT2tG50Zgpod7ru3pnz
         BgZHQ1+ZQE1VagOuTagUckuZOlIeQv1bWly/8d/MBrPpFZB8OukOFS1ilcqVr13a6T3h
         9RmWXfO5zfGDqT2ll9Z9chRz1o/hwNG8SPmbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KBxZTl3QLBPzQvK7Avwrhh94NGQfx9l6fJMpQ6cilkA=;
        b=ZcSu3/78J/pt/ja8yq1HBiGBkk5ksupwayzUneU40SOVi19joi9zEmG7IH50WPBabL
         YMXuEFFsqVhtowUs25zqjr0RKfAZBUS+HC/FYg+EFmCTNaoSd23jM0ZQtfFojqRpYVLp
         qoRDbf9lKiUnykrUBbJKmuSkWsPo7FzrUyDW4XPkYl60TJOSaljnOmRIyL4V19FZWV93
         xfJ6PbpG49Fdmfen+s05O1JHzAifPbUc3wOXjqGBG89471bjuBsMndfQtLLUjUGZGyxY
         lVIVgGnccBXyceI5Vo5hZWHUfsdSFSPcrF/mg6MtAdD177AgNUY57Hw907Htjc1wZzlY
         FyRA==
X-Gm-Message-State: ACgBeo2Ojwc4YNx9M04NlE1Vx3iszOtTe/XAG3Osk9J3vzN6BXx2adee
        rGN9uhHZ2vIRaJ2TtMvyDhi1HQ==
X-Google-Smtp-Source: AA6agR4sr7CY6ohDCUgo1cuFeiMGJDrY8VIlBJdET91T+NWk5F0EUKnaU4lX2OEjAoB2NiRsPDczdg==
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id wu7-20020a170906eec700b00733189fb07amr385666ejb.230.1662502287053;
        Tue, 06 Sep 2022 15:11:27 -0700 (PDT)
Received: from [192.168.1.149] ([80.208.71.65])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906318c00b0073923a68974sm7083488ejy.206.2022.09.06.15.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 15:11:26 -0700 (PDT)
Message-ID: <db3b8d51-3350-7823-a462-6f81c4cdc5f1@rasmusvillemoes.dk>
Date:   Wed, 7 Sep 2022 00:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Content-Language: en-US
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
 <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <E1oVYUS-005CmS-IA@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/09/2022 15.19, Russell King (Oracle) wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 

>  Documentation/core-api/printk-formats.rst | 32 +++++++++++++++++++++
>  lib/vsprintf.c                            | 35 +++++++++++++++++++----
>  2 files changed, 61 insertions(+), 6 deletions(-)

Please also update lib/test_printf.c with a few test cases when
modifying/extending vsnprintf().

> diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
> index 5e89497ba314..22c33398ec02 100644
> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -625,6 +625,38 @@ Passed by reference.
>  	%p4cc	Y10  little-endian (0x20303159)
>  	%p4cc	NV12 big-endian (0xb231564e)
>  
> +Generic FourCC code
> +-------------------
> +
> +::
> +	%p4c[hnbl]	gP00 (0x67503030)
> +

Typo, I think. hrbl ?

Rasmus
