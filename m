Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD4BC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  2 Mar 2022 23:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiCBXpy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Mar 2022 18:45:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbiCBXpx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Mar 2022 18:45:53 -0500
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB41483B0;
        Wed,  2 Mar 2022 15:43:48 -0800 (PST)
Received: by mail-oo1-xc29.google.com with SMTP id j7-20020a4ad6c7000000b0031c690e4123so3845592oot.11;
        Wed, 02 Mar 2022 15:43:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/c70eOOtZ8Slm0RoKC+PAhJNIVgAv9doZtxHf/Xm/kc=;
        b=D75DC4zuoJBqmhya9kPnt4KrKzDXMqZ75ebnx3hhjnbfIBCys7HuFEWftGWMjJ4p9j
         CKCm3AMypFD3XKtVX2VPFs3ECFXjgxwYTrSCkhFwMYHnoP1fJyrGSFM9jvOqHx16Phk/
         RAi2XZRM9JZsd9Wx5gbt9gagkLhGwDMCYFzkWdYm9VCHVHkwqt8IiwTx1Gb9QHERnYMJ
         5As4v7RqFn7ivCaNPlNV4LSIZNBqR+gQif5sLQBvINiLqgJJ1rSd6+V4RYG7/Ctdc1QA
         eteYk5L5EAaQzOiVpiRAyEQ9AvFuPx4P0avz2jCtdPxuQxWMCR4v+t0VWDrS0B5CPFs7
         nBjA==
X-Gm-Message-State: AOAM532NaU3rEKogtt/dZRINul3XjGJJ0+J2bcQsxMNmEN7cjNEyuEQp
        ZgOoJeCA+0s/UWyHX15I+ZatRE6XOw==
X-Google-Smtp-Source: ABdhPJwgPoO9G+g2UL7d6AnfejCdiifxATPEVty//3FdiAhYyj/XEHnLOtfsAaL+W8FuBOOev/+m4Q==
X-Received: by 2002:a05:6871:85:b0:d9:ac7a:7a5a with SMTP id u5-20020a056871008500b000d9ac7a7a5amr1932120oaa.9.1646264526194;
        Wed, 02 Mar 2022 15:42:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a11-20020a0568300b8b00b005acfd19434asm163073otv.75.2022.03.02.15.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 15:42:05 -0800 (PST)
Received: (nullmailer pid 276450 invoked by uid 1000);
        Wed, 02 Mar 2022 23:42:04 -0000
Date:   Wed, 2 Mar 2022 17:42:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Pawel Dembicki <paweldembicki@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] leds: add new functions for mobile routers
Message-ID: <YiAAzH4GDnC8ridY@robh.at.kernel.org>
References: <20220218085002.18110-1-paweldembicki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220218085002.18110-1-paweldembicki@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 18, 2022 at 09:50:02AM +0100, Pawel Dembicki wrote:
> 2G/2G/4G routers have some special leds functions:
>   - signal strength, which shows info about signal status.
>     Some devices have multicolor indication (e.g. D-Link DWR-960)
>     other use multiple leds for different levels (e.g. Cell-C RTL30VW)
>   - connection status, which shows if connection is active. Some devices
>     have multiple leds for different bands (e.g. D-Link DWR-960).
>   - sms indicator
> 
> This patch adds new LED_FUNCTION_* defines of them.
> 
> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> ---
>  Documentation/leds/well-known-leds.txt | 9 +++++++++
>  include/dt-bindings/leds/common.h      | 5 +++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/leds/well-known-leds.txt b/Documentation/leds/well-known-leds.txt
> index 2160382c86be..677cf7e57a76 100644
> --- a/Documentation/leds/well-known-leds.txt
> +++ b/Documentation/leds/well-known-leds.txt
> @@ -16,6 +16,15 @@ but then try the legacy ones, too.
>  
>  Notice there's a list of functions in include/dt-bindings/leds/common.h .
>  
> +* 4G/3G/2G routers
> +
> +Cellular routers use LEDs for signal strength identification and connection
> +status. Some models also have incoming SMS indicator.
> +
> +Good: "*:connection"
> +Good: "*:signal"
> +Good: "*:sms"
> +
>  * Gamepads and joysticks
>  
>  Game controllers may feature LEDs to indicate a player number. This is commonly
> diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> index 3be89a7c20a9..3adfa120353e 100644
> --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -60,6 +60,11 @@
>  #define LED_FUNCTION_MICMUTE "micmute"
>  #define LED_FUNCTION_MUTE "mute"
>  
> +/* Used for 4G/3G/2G routers. */
> +#define LED_FUNCTION_CONNECTION "connection"

wan?

> +#define LED_FUNCTION_SIGNAL "signal"
> +#define LED_FUNCTION_SMS "sms"

mail?

The whole idea with defining the names was to not create different names 
for roughly the same thing.

Rob
