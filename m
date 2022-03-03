Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E336C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 16:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbiCCQme (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 11:42:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbiCCQmd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 11:42:33 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2479F19D634
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 08:41:48 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id w3so7347666edu.8
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 08:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jxP+Xw6wPB8ZIhMnioV3Otj/1gb/UWZW6hrVr3vPJh4=;
        b=JJ4qQXPFXhyPdRQ0jQQAs/7g/HtEmcuxjknmziNouLk2APczDb9gNerpsCYvxKiJ5K
         aWtbVRqTo7FT+DLr5vQPqTPdNSTiNewBOYpdsd8k5Sc4NHxlaezItfTgp9QvsXaG6ncg
         QHuppgQ5OWsYYaz4dlXR+Tra8Yi3baP/LcF58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jxP+Xw6wPB8ZIhMnioV3Otj/1gb/UWZW6hrVr3vPJh4=;
        b=VI3zEokdijHm6tFjdCyq7sI4xYvcIObvAivNdKPy9+j5vnRyl3CKGrq2sk4fsfFlM/
         EeOC33N/bKGRVzJEqzbbqHR4iH1Iza6bVnIe0EEpGGKw7N7Aa2UHsnq6MFKDROWtLr0B
         fPjuhXJHtSJ9F5IX42R2+/naLTsjPmGnZiLBRlrwfHisbed5maCrRlkZEIl2ae+2XBoY
         QnNrtEcIOaEzjP7bqu9XZM18pdmetOPWQnr89zh5YQg3U7Aaqg08Sp3S/jWrJrDeBHPM
         HmDetNzs8XGrpSKWVU7ezXBgAV9tPz2lisaC91q++V01NO9IN9ly2vNHmP1aauWqlZNw
         4VEw==
X-Gm-Message-State: AOAM532tX0jPPMqfP7x32deoOvP8TqFoN3nHxSOenLrvLpkY/o6n7BMX
        yuymWLVbpj1uDrim2tLvFXeXtWKDFD+S7OmC
X-Google-Smtp-Source: ABdhPJyTTmTYT6xnOwfSgkUbioEnj0ffxGw0L3MR4X/V9LvDD4sHa1E9K2V7y06SmKrYxEtkKU3F1Q==
X-Received: by 2002:a05:6402:2365:b0:415:ed07:70de with SMTP id a5-20020a056402236500b00415ed0770demr1991579eda.150.1646325706448;
        Thu, 03 Mar 2022 08:41:46 -0800 (PST)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id i22-20020a170906251600b006d6d9081f46sm867506ejb.150.2022.03.03.08.41.45
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 08:41:45 -0800 (PST)
Received: by mail-wm1-f41.google.com with SMTP id 7-20020a05600c228700b00385fd860f49so2756016wmf.0
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 08:41:45 -0800 (PST)
X-Received: by 2002:a7b:c0c1:0:b0:385:be1b:e6a with SMTP id
 s1-20020a7bc0c1000000b00385be1b0e6amr4453828wmh.73.1646325705202; Thu, 03 Mar
 2022 08:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220218183116.2261770-1-bjorn.andersson@linaro.org>
 <20220218183116.2261770-2-bjorn.andersson@linaro.org> <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UOLcu5xycimDsYTO1spwf=CMRPUSU3o0qRRC+a+zuRTQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Mar 2022 08:41:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=We4Lv25h2XF6BsdYhMbYu4716LBuhAjH5N0s_HHt_Xcw@mail.gmail.com>
Message-ID: <CAD=FV=We4Lv25h2XF6BsdYhMbYu4716LBuhAjH5N0s_HHt_Xcw@mail.gmail.com>
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

On Wed, Mar 2, 2022 at 4:03 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Fri, Feb 18, 2022 at 10:29 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > +static void lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> > +                             struct pwm_state *state)
> > +{
> > +       struct lpg *lpg = container_of(chip, struct lpg, pwm);
> > +       struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> > +       unsigned int pre_div;
> > +       unsigned int refclk;
> > +       unsigned int val;
> > +       unsigned int m;
> > +       u16 pwm_value;
> > +       int ret;
> > +
> > +       ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
> > +       if (ret)
> > +               return;
> > +
> > +       refclk = lpg_clk_rates[(val & PWM_CLK_SELECT_MASK) - 1];
>
> I don't know why I didn't notice it before (maybe I was accidentally
> not building with KASAN?), but in my recent boots I'm getting a KASAN
> error pointing at the line above.
>
> Sure enough, the above looks a bit on the unsafe side. If (val & 0x3)
> is 0 then the "-1" will not be so wonderful. I put some printouts and,
> indeed, it's not so great.
>
> [    7.201635] DOUG: val is 0x00000004
>
> Amazingly my `refclk` ends up as 0 and I guess somehow this doesn't
> cause a divide by 0.

I dug a little more and found a document that talks about this
register. I guess the answer here is that at boot time on my device
the PWM is disabled and has never been enabled. That explains why, at
boot time, the "clk_select" is 0 AKA "no clock". So we do an invalid
memory access here and that's not so great, but it doesn't _truly_
cause any harm. All we need is something like this right before the
array dereference:

if ((val & PWM_CLK_SELECT_MASK) == 0)
  return;

I'm still pretty interested in seeing this patch series land and, if
it helps it land sooner, I wouldn't object to the above getting fixed
in a followup patch.

-Doug
