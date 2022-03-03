Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB99C433FE
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 22:11:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236714AbiCCWLs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 17:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236130AbiCCWLr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 17:11:47 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3361FD19
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 14:11:00 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id qt6so13588433ejb.11
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 14:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O15QTD4cJWZUCrV53Q7o/AL5EB1oKwJTXEHaA5LT8Z8=;
        b=LArKsEtR2mGirSRnS4QPB7n7g9uLcdhGS2kHqFIb8XMf4LzumrX1fTUWS3uLd0WvY7
         WLmzhRTfJFRSwidr8ido80GjMNVcP71/BhUV6EopxiDenC4YhqBj6Dwh6h95iQIK1orX
         IVEDLOvBMjjsnhO237DselDbca8Q8omBwAy+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O15QTD4cJWZUCrV53Q7o/AL5EB1oKwJTXEHaA5LT8Z8=;
        b=TWaqY3VeD+MyRwEDvnDKKtAL4XlwZpzn1GTY1lvsLoPsf8fctBNxHB8hR6NQxM2JuL
         b5OtHqeeWL7QItCBaU8WgnXfEST1nJgTSR5LxlfaRp8CqDTdB/fXgWHMsbrbu4o9woOM
         R3ic9IaT92Qpl4bylSsSr6m/yyc5aazV6nZo69Xh5f5YcK1HC+FBjs0pYbIZGBZGH0n6
         zt8cXZntEcU42YzimHI8MjkgEFopEIBSmSZpk8bWFNlUXIdyOza1U0i8fCkOeK2SuzOF
         aq0u7j2ErGzULmgJvXqzdzsVW1pOzWc8AnTUkYFC2Q5bUF3R7M5pwmIbTG56dFeBRmTj
         s+qg==
X-Gm-Message-State: AOAM533/1gzkXSbjSZl9liD2EClxecjiVF8r+yVNj8I9oVppQ+AIJWXE
        hvuXQOdjtG34JjgPw0aR9Hr74A77XiJjEw==
X-Google-Smtp-Source: ABdhPJws8ud8GpauJcmmtxkSGmGm/AQoZ1lEKwZFuEsbAwYBHtqgCOl9ZoP+118rToeyf1kA5NQQjQ==
X-Received: by 2002:a17:907:8a25:b0:6d7:d59:6912 with SMTP id sc37-20020a1709078a2500b006d70d596912mr11056676ejc.259.1646345459098;
        Thu, 03 Mar 2022 14:10:59 -0800 (PST)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id n9-20020a05640205c900b00415fbbdabbbsm14480edx.9.2022.03.03.14.10.57
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 14:10:57 -0800 (PST)
Received: by mail-wm1-f45.google.com with SMTP id k29-20020a05600c1c9d00b003817fdc0f00so4056446wms.4
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 14:10:57 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr5367480wmh.73.1646345456912; Thu, 03 Mar
 2022 14:10:56 -0800 (PST)
MIME-Version: 1.0
References: <20220303214300.59468-1-bjorn.andersson@linaro.org> <20220303214300.59468-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220303214300.59468-2-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Mar 2022 14:10:44 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WkgcJA6-niUh0L5_jLNSS=Hv0xrR5QZghPmNriekH7XA@mail.gmail.com>
Message-ID: <CAD=FV=WkgcJA6-niUh0L5_jLNSS=Hv0xrR5QZghPmNriekH7XA@mail.gmail.com>
Subject: Re: [PATCH v14 2/2] leds: Add driver for Qualcomm LPG
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Thu, Mar 3, 2022 at 1:41 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> PMICs from Qualcomm. These PMICs typically comes with 1-8 LPG instances,
> with their output being routed to various other components, such as
> current sinks or GPIOs.
>
> Each LPG instance can operate on fixed parameters or based on a shared
> lookup-table, altering the duty cycle over time. This provides the means
> for hardware assisted transitions of LED brightness.
>
> A typical use case for the fixed parameter mode is to drive a PWM
> backlight control signal, the driver therefor allows each LPG instance
> to be exposed to the kernel either through the LED framework or the PWM
> framework.
>
> A typical use case for the LED configuration is to drive RGB LEDs in
> smartphones etc, for which the driver supports multiple channels to be
> ganged up to a MULTICOLOR LED. In this configuration the pattern
> generators will be synchronized, to allow for multi-color patterns.
>
> The idea of modelling this as a LED driver ontop of a PWM driver was
> considered, but setting the properties related to patterns does not fit
> in the PWM API. Similarly the idea of just duplicating the lower bits in
> a PWM and LED driver separately was considered, but this would not allow
> the PWM channels and LEDs to be configured on a per-board basis. The
> driver implements the more complex LED interface, and provides a PWM
> interface on the side of that, in the same driver.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v13:
> - Fixed mixed space/tab indentation in documentation
> - Added 0 as to lpg_clk_rates[] to match the hardware state, to avoid + 1 in
>   lpg_apply_freq() and - 1 in lpg_pwm_get_state()
> - Don't divide with 0 if current clock is 0 in lpg_pwm_get_state(), just return
>   period = duty = 0 in this case
> - Renamed "clk" in struct lpg_channel to clk_sel
> - Renamed "pre_div" in struct lpg_channel to pre_div_sel
>
> Changes since v12:
> - Initialize ret in lpg_pwm_apply()
>
> Changes since v11:
> - Extended commit message to cover decision to put pwm_chip in the LED driver
> - Added Documentation, in particular for the hw_pattern format
> - Added a lock to synchronize requests from LED and PWM frameworks
> - Turned out that the 9bit selector differs per channel in some PMICs, so
>   replaced bitmask in lpg_data with lookup based on QPNP SUBTYPE
> - Fixed kerneldoc for the struct device pointer in struct lpg
> - Rewrote conditional in lut_free() to make it easier to read
> - Corrected and deduplicated max_period expression in lpg_calc_freq()
> - Extended nom/dom to numerator/denominator in lpg_calc_freq()
> - Replaced 1 << 9 with LPG_RESOLUTION in one more place in lpg_calc_freq()
> - Use FIELD_PREP() in lpg_apply_freq() as masks was introduced for reading the
>   same in get_state()
> - Cleaned up the pattern format, to allow specifying both low and high pause
>   with and without pingpong mode.
> - Only update frequency and pwm_value if PWM channel is enabled in lpg_pwm_apply
> - Make lpg_pwm_get_state() read the hardware state, in order to pick up e.g.
>   bootloader backlight configuration
> - Use devm_bitmap_zalloc() to allocate the lut_bitmap
> - Use dev_err_probe() in lpg_probe()
> - Extended Kconfig help text to mention module name and satisfy checkpatch
>
>  Documentation/leds/leds-qcom-lpg.rst |   76 ++
>  drivers/leds/Kconfig                 |    3 +
>  drivers/leds/Makefile                |    3 +
>  drivers/leds/rgb/Kconfig             |   18 +
>  drivers/leds/rgb/Makefile            |    3 +
>  drivers/leds/rgb/leds-qcom-lpg.c     | 1405 ++++++++++++++++++++++++++
>  6 files changed, 1508 insertions(+)

Gets rid of the KASAN error and PWM still works for me, so happy to add back:

Tested-by: Douglas Anderson <dianders@chromium.org>

I haven't done a full review of the driver but I did a once-over of
the changes between v12 and v13 and they look good to me.

-Doug
