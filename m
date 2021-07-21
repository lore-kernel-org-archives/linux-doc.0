Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4932AC636CA
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 13:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E8F161245
	for <linux-doc@archiver.kernel.org>; Wed, 21 Jul 2021 13:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237551AbhGUMlc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Jul 2021 08:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237531AbhGUMlb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Jul 2021 08:41:31 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EFFC061766
        for <linux-doc@vger.kernel.org>; Wed, 21 Jul 2021 06:22:08 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id a16so3229208ybt.8
        for <linux-doc@vger.kernel.org>; Wed, 21 Jul 2021 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZwJIZ2K8rI+pgGDI4cRSYEmo/51p2RfSvQRRFc/6G4=;
        b=0gXQ/a23lNAjY5FnFoHI7VxYXSSMWX/t4jL07nsAlNKb6JVO23YYoQw8SWcOtoIaAr
         hN2QjeLOUHkU+hwXt7lLocn7hvj1h20uruk98GGvQzUQaaAw70vph/s3/2yjP4XrmZ81
         qbrkWDqyHMgPlanL4TC2pDIqUjLLYokXvUjlCvfumMke4TBaCVNcHtcom90ZoD77AWw5
         5BpwcsHBx1lRY1BbXn+raMT1dRXenqN6U7SWu1TXDKJSJYVcqLmxrDf4qbwD/jOZHRlS
         MgI0JTrw/d85WSOCt+OVCxkd/9Q9TuzsQIzJVqzoRGEYG+H0AU/CNtxCGu76CoV6tLgU
         TnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZwJIZ2K8rI+pgGDI4cRSYEmo/51p2RfSvQRRFc/6G4=;
        b=bI+++9GJZx2SPcgUw6UUtcuFtqkDHYaDZx6W4Uzk77WAqDT/nBoqNM/j8Jmi+CPR5Z
         wpaTsc5gSqSBFmXzojPCoSAjkCpX4gzICp28uH+DjrLPNDcD7AJICBM0qh2qjAmfRONf
         nqLdfzuQ9EjnoaEh53UxfytpMPp+XFIXdoKvYH8tKtpARLTPNjLoNOpzDGNjr6J11oMe
         XWadssaquArQLB4bf5UYmGrVez5KWQWzziNvbpQ+BMSfX5csi5yNy325OdXrfBAQ6lJ5
         aYwr0ucGCx1P+4axGjibWrCPog4A2R30uny2c5oeCq7LsEKUTqmIaQ5geMKbmKlNbDLw
         Ifag==
X-Gm-Message-State: AOAM532YV9CVwb5MvNo/X6UO0ZvQaV7OxTV8DDUR3dYgF0UX0OVqbVL5
        B3RHYR+v0jmMoiqIYbAUXGSxwiUbD2oWkvpT2ATnxw==
X-Google-Smtp-Source: ABdhPJw8tfeSdvqXHu/1qe0V/wMQMlfodPC+f/Nl6xWtn/+jWFe1PPf/A/jN0HUkWv08N5OaobskQXxJjgLKnY4J2rc=
X-Received: by 2002:a25:ca54:: with SMTP id a81mr26099538ybg.157.1626873727771;
 Wed, 21 Jul 2021 06:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210708152054.361704-1-hannu@hrtk.in>
In-Reply-To: <20210708152054.361704-1-hannu@hrtk.in>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 21 Jul 2021 15:21:57 +0200
Message-ID: <CAMpxmJWT-aG_KL66-0vDc7KAV_yGU7gWFrhk5BNenPix8v+RsA@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: explain GPIOD_OUT_* values and toggling
 active low
To:     Hannu Hartikainen <hannu@hrtk.in>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 8, 2021 at 5:21 PM Hannu Hartikainen <hannu@hrtk.in> wrote:
>
> I was confused about the gpiod_flags values and thought that
> GPIOD_OUT_LOW and GPIOD_OUT_HIGH set the line to be active low / active
> high. This is not true, but I got the misconception because the flags
> GPIOD_OUT_*_OPEN_DRAIN do change line configuration and there's a
> subchapter about *active low* and *open drain* semantics.
>
> Add an explicit mention that the initial value is a logical value (and
> not the line configuration or physical line level). Also add a mention
> of the function gpiod_toggle_active_low which was previously missing
> from this document.
>
> Signed-off-by: Hannu Hartikainen <hannu@hrtk.in>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
> index 3366a991b4aa..47869ca8ccf0 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -72,6 +72,10 @@ for the GPIO. Values can be:
>  * GPIOD_OUT_HIGH_OPEN_DRAIN same as GPIOD_OUT_HIGH but also enforce the line
>    to be electrically used with open drain.
>
> +Note that the initial value is *logical* and the physical line level depends on
> +whether the line is configured active high or active low (see
> +:ref:`active_low_semantics`).
> +
>  The two last flags are used for use cases where open drain is mandatory, such
>  as I2C: if the line is not already configured as open drain in the mappings
>  (see board.txt), then open drain will be enforced anyway and a warning will be
> @@ -252,6 +256,8 @@ that can't be accessed from hardIRQ handlers, these calls act the same as the
>  spinlock-safe calls.
>
>
> +.. _active_low_semantics:
> +
>  The active low and open drain semantics
>  ---------------------------------------
>  As a consumer should not have to care about the physical line level, all of the
> @@ -309,9 +315,11 @@ work on the raw line value::
>         void gpiod_set_raw_value_cansleep(struct gpio_desc *desc, int value)
>         int gpiod_direction_output_raw(struct gpio_desc *desc, int value)
>
> -The active low state of a GPIO can also be queried using the following call::
> +The active low state of a GPIO can also be queried and toggled using the
> +following calls::
>
>         int gpiod_is_active_low(const struct gpio_desc *desc)
> +       void gpiod_toggle_active_low(struct gpio_desc *desc)
>
>  Note that these functions should only be used with great moderation; a driver
>  should not have to care about the physical line level or open drain semantics.
> --
> 2.32.0
>

Makes sense, applied!

Bartosz
