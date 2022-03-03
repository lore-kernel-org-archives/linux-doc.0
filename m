Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF08C4332F
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 00:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbiCCAEX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Mar 2022 19:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbiCCAEV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Mar 2022 19:04:21 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1EEB847
        for <linux-doc@vger.kernel.org>; Wed,  2 Mar 2022 16:03:32 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id d10so7102187eje.10
        for <linux-doc@vger.kernel.org>; Wed, 02 Mar 2022 16:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=712s7UNzasxlj0dwsyjRXVd8K8/HcJjmlNagNGk3tak=;
        b=ED9WDqjaIvY/PNhXMFZcJHPNR7h/tTUuq7WLYZ1ylEvNffoEcxKxybLHrav42m9Cnn
         RVEvb/IBLv+PhIPTpr690rtY8c24fbS5byCNqvx9Uwev3vYjz8sAMB11j/c+q3crVNAP
         sIZB594RAxB9rrrDgiPoWjkncYFw0ihals3NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=712s7UNzasxlj0dwsyjRXVd8K8/HcJjmlNagNGk3tak=;
        b=nh0g892ShQBUfs+u9ro3NOBKiQUrb5Fp2/KLm4NtPgrUhGQFzzrAEANNh4vbPhPQIG
         1i8xm2QzDfW9srxKfctxbcBXhqP3zAUzaWqeKpz4smrVb2LG68GMT8wt42ZZI0jkSKCZ
         1SpcwCV9GdxqduLsslDZ5cuvToOnqynUrWGB4sKxFmg9w+Of0F01SucwGrq2+Td+DYNr
         HJ9C78aYKYsdI9+y3OrUgZ8HcxwgLiEDl2lybbw6ALI2u3LG/I93JuSr0Z49AoiMLKqT
         ES4siF4/lBikAI9wlUBaJhKLdWFiVJeF+rrXC+KgV2FVfiLN5njrMxfnZzocYZ8J40bG
         PCuQ==
X-Gm-Message-State: AOAM530ph3AAB9N7KKb9gDEz1xsMMdI53ZtMD1Lrr+1bMIDAsfjcAoFu
        1ECSnpFF0GcxyardfDCBaK5p3mPB2OzvN/vY
X-Google-Smtp-Source: ABdhPJx5szpiHJ0iaXrptzTdxjc1yzMxntmSDkoPxKwIehwduRvhp0/useugpHshFM1ST6O3bz/saw==
X-Received: by 2002:a17:907:9621:b0:6d7:355d:6da5 with SMTP id gb33-20020a170907962100b006d7355d6da5mr6319908ejc.195.1646265810327;
        Wed, 02 Mar 2022 16:03:30 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id fs6-20020a170907600600b006da8ec6e4a6sm104644ejc.26.2022.03.02.16.03.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Mar 2022 16:03:28 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so2251336wmp.5
        for <linux-doc@vger.kernel.org>; Wed, 02 Mar 2022 16:03:28 -0800 (PST)
X-Received: by 2002:a05:600c:190d:b0:381:6ea1:8cc with SMTP id
 j13-20020a05600c190d00b003816ea108ccmr1737073wmq.118.1646265807989; Wed, 02
 Mar 2022 16:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20220218183116.2261770-1-bjorn.andersson@linaro.org> <20220218183116.2261770-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220218183116.2261770-2-bjorn.andersson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Mar 2022 16:03:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
Message-ID: <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
Subject: Re: [PATCH v13 2/2] leds: Add driver for Qualcomm LPG
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-pwm <linux-pwm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Luca Weiss <luca@z3ntu.xyz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Feb 18, 2022 at 10:29 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> +static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +                             struct pwm_state *state)
> +{
> +       struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +       struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +       unsigned int pre_div;
> +       unsigned int refclk;
> +       unsigned int val;
> +       unsigned int m;
> +       u16 pwm_value;
> +       int ret;
> +
> +       ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
> +       if (ret)
> +               return;
> +
> +       refclk = lpg_clk_rates[(val & PWM_CLK_SELECT_MASK) - 1];

I don't know why I didn't notice it before (maybe I was accidentally
not building with KASAN?), but in my recent boots I'm getting a KASAN
error pointing at the line above.

Sure enough, the above looks a bit on the unsafe side. If (val & 0x3)
is 0 then the "-1" will not be so wonderful. I put some printouts and,
indeed, it's not so great.

[    7.201635] DOUG: val is 0x00000004

Amazingly my `refclk` ends up as 0 and I guess somehow this doesn't
cause a divide by 0.


-Doug
