Return-Path: <SRS0=jv2Y=5L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2026EC43331
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 21:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEEBD20714
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 21:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXxu/b/Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCZVSz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Mar 2020 17:18:55 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43313 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbgCZVSy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Mar 2020 17:18:54 -0400
Received: by mail-lj1-f195.google.com with SMTP id g27so7986562ljn.10
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 14:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BtDnHTuIZQJxreSGmLJQQ8ku1fLzEZvZgsl/IqNsN8A=;
        b=IXxu/b/ZFJBTcuTRbJKkO3+OaHo+Jz796SjBmFajhclIBm/BsLYWIAcx9DtKHieiLy
         tC1vll/WVvRZQ+7qJ8T1OabM2kIqVG9KEwn/gO1uzvwHIs/v6r5PUIM8K2kmGH3MMNXx
         nmCCfjAEtu37RGo2HNzvtF+VDyr/FKocXnWXD6OBMy57AI/ZJMu+S2hSLH5zbmyjmr7E
         sxTlRVJ5vW38t9Cg+zhSbse1W+BZkWRDzYx/Yu4yn+IZzHSViZT5elZgxloQRh/hC7i3
         +w1dTkhKoFmmSYtRXjpmPsSyzvY/Q7+9WKp1e8RMSShyoiYZ9ziRyI4HZbJENIUJqUqy
         2vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BtDnHTuIZQJxreSGmLJQQ8ku1fLzEZvZgsl/IqNsN8A=;
        b=RS2Zsq6+mbhr/owUO6MubHtpUJqi9K6tvcTK+SDnlqe3x54Fn8XOihjJyihgR7LTsh
         u62cWFUPSn4akEA5UTKGY2Qu2BWpyny71pzgh1/uTd4X2LeVgBvmJQEb200RAoY0LRaI
         FZ27ye2PzEKbyAU+U9QLmzOvHgx9s006s0QlYvxKY76bxP7x1xidnptz+ENAYdjTK08E
         ECWwetCvmeo0sRJCSC78yMEp3nbYvvZYTh26qodU6beSJ5sBOnVpRz4aAVd9u2HKLtNj
         UUnadW5krUZFygeDwhC9AuFroRXSFanMoCyxovCUR12o8g19pD4V8o8ebe+mSv/kS2Nn
         G9Mw==
X-Gm-Message-State: AGi0PuZvFB+dcH5GQsBISiZVGmCWokkmxe9l519dGc/xuB/xkwuMlrr9
        AZQWs4ryiI+VQbSFSD4uP1e0o5AhczJA/zNYmF9HSg==
X-Google-Smtp-Source: APiQypI3i354cA5ylzgV3u2ROOS/UyX7OA+VdV0fyyDcKpZ9OLsd6Iw0Xj96knvewn3/YsM9fw/zq6pJKSJXERmc8DI=
X-Received: by 2002:a2e:5048:: with SMTP id v8mr5946209ljd.99.1585257530291;
 Thu, 26 Mar 2020 14:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200324135328.5796-1-geert+renesas@glider.be>
 <20200324135653.6676-1-geert+renesas@glider.be> <20200324135653.6676-4-geert+renesas@glider.be>
In-Reply-To: <20200324135653.6676-4-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Mar 2020 22:18:39 +0100
Message-ID: <CACRpkdbN82n3B+Q-QVjB1jLpJAYS19fKukkDXQm3gZsuFFFM_w@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] gpiolib: Add support for GPIO lookup by line name
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 24, 2020 at 2:57 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Currently a GPIO lookup table can only refer to a specific GPIO by a
> tuple, consisting of a GPIO controller label and a GPIO offset inside
> the controller.
>
> However, a GPIO may also carry a line name, defined by DT or ACPI.
> If present, the line name is the most use-centric way to refer to a
> GPIO.  Hence add support for looking up GPIOs by line name.
>
> Implement this by reusing the existing gpiod_lookup infrastructure.
> Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
> that this field can have two meanings, and update the kerneldoc and
> GPIO_LOOKUP*() macros.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>

I kind of like this approach, however there are things here that
need to be considered: the line name is in no way globally unique,
and I think there are already quite a few GPIO chips that
have the same line names assigned for every instance of that
chip.

gpiochip_set_desc_names() only warns if there is a line with
the same name on the same gpio_chip.

I suppose we need to document that the line name look-up
will be on a first-come-first-served basis: whatever line
we find first with this name is what you will get a reference
to, no matter what chip it is on, and it is possible albeit
not recommended that some other chip has a line with the
same name.

Yours,
Linus Walleij
