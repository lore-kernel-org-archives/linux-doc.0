Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EA1C12002
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 13:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 365276120A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 13:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbhGUMhu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jul 2021 08:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbhGUMht (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jul 2021 08:37:49 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CDD1C061574
        for <linux-doc@vger.kernel.org>; Wed, 21 Jul 2021 06:18:25 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id r132so3239928yba.5
        for <linux-doc@vger.kernel.org>; Wed, 21 Jul 2021 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1rRa3phHTJWmbuCa9Ba7yDi4LWrl8+YODk9pdiOglY=;
        b=Gyv0aaXDH/IFhULwdSv6HQFnFAX7svUaaxi00pmF2amALPQgQwO9WU013kLXFcuo2I
         5aTlq9gfRsCp6WVrjQ4GA63N1E++ar7bG6zH0tLeVS2ke2DDJrMLzXMnGmKrzyjnK9kt
         /cwTndRguTHL3dwJGuFJhPi4yFmxhH3Tp2N8IRx8TUtOsaMtdztuejeNL0ZtCarhsfyG
         HEKzGM4CXveSYgwwmV9NB6qXYqHJuOm49bhR9Yuhpewkc0C/ibBpoRsH4baSssyPWByr
         kqkj5DCLmTZyMCiblmCi9JSbvjt56yBgQF8FDQNSMagccXnjj67E6uOb6xrpiwHJ9URU
         iE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1rRa3phHTJWmbuCa9Ba7yDi4LWrl8+YODk9pdiOglY=;
        b=WtY8vjMxKlSZ7fD77D8UcWG8tS4XE0AxBkylFPUPAhv3r3G8/QFojaF381fgO477R7
         H3rUArbN95lULmZnepvaT2+dfXRgdvJQaZybMddSBYXfdeomVmqEQ3GeBtJ3d/TQrDlF
         PD46mlKTUgKp+O4xzF+dR0F+5g8NhLxQyv8DrvM+BKOyiyj0SnSAFL/D8sXcX9uG44Ca
         gz/9k7jsBwCeGEQVM6poLHrQL5+Km4ZzL6eYQGxg+LIf9qoPKoZBqJ5JAzQ6oqPJuZ+x
         7n30gXmmfpIBvkpUSX65s6dqkMLcn87mHeTkj9plPI5AO/YlV8N+UG/mRKdKz+vmHyIJ
         iVdw==
X-Gm-Message-State: AOAM533sUEzPMu4+ihHkpD2azPdvLc0flh2V5zSjvB+dGZnds4HyByRk
        vcha5tV24zZYvTVu80F7TTUTXeGg3TMJ8PcW/np0hA==
X-Google-Smtp-Source: ABdhPJy1PounyikHq+KqbdeJm1FzIvQPgLEgmuaTn6HxAFMpGA8GZziNxOCNjkSgQAKm72hRdIAmqPpEZ7k606KEI6I=
X-Received: by 2002:a25:ca54:: with SMTP id a81mr26076620ybg.157.1626873504672;
 Wed, 21 Jul 2021 06:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <5d1823c503629694de74ccd2d823188507c54706.1625445811.git.plr.vincent@gmail.com>
In-Reply-To: <5d1823c503629694de74ccd2d823188507c54706.1625445811.git.plr.vincent@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 21 Jul 2021 15:18:14 +0200
Message-ID: <CAMpxmJVSSsRM1W957E-urQqbY1PB+wQ6sRCRnCaHVKg6ge13ZA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: driver.rst: Remove
 gpiochip_irqchip_add mention
To:     Vincent Pelletier <plr.vincent@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 5, 2021 at 2:44 AM Vincent Pelletier <plr.vincent@gmail.com> wrote:
>
> This function was removed in commit f1f37abbe6fc ("gpio: Retire the
> explicit gpio irqchip code") but this mention was left behind.
> Also, mention that .set_type() only has to set a line handler if the chip
> is cascaded, as opposed to hierarchical.
>
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
> ---
>  Documentation/driver-api/gpio/driver.rst | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
> index d6b0d779859b..bbc53920d4dd 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -547,13 +547,10 @@ To use the helpers please keep the following in mind:
>    the irqchip can initialize. E.g. .dev and .can_sleep shall be set up
>    properly.
>
> -- Nominally set all handlers to handle_bad_irq() in the setup call and pass
> -  handle_bad_irq() as flow handler parameter in gpiochip_irqchip_add() if it is
> -  expected for GPIO driver that irqchip .set_type() callback will be called
> -  before using/enabling each GPIO IRQ. Then set the handler to
> -  handle_level_irq() and/or handle_edge_irq() in the irqchip .set_type()
> -  callback depending on what your controller supports and what is requested
> -  by the consumer.
> +- Nominally set gpio_irq_chip.handler to handle_bad_irq. Then, if your irqchip
> +  is cascaded, set the handler to handle_level_irq() and/or handle_edge_irq()
> +  in the irqchip .set_type() callback depending on what your controller
> +  supports and what is requested by the consumer.
>
>
>  Locking IRQ usage
> --
> 2.32.0
>

Patch applied, thanks!

Bartosz
