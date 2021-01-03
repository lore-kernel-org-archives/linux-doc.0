Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5034CC433E6
	for <linux-doc@archiver.kernel.org>; Sun,  3 Jan 2021 15:29:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 174AB20795
	for <linux-doc@archiver.kernel.org>; Sun,  3 Jan 2021 15:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbhACP30 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Jan 2021 10:29:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726148AbhACP3Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Jan 2021 10:29:25 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AC4C0613CF
        for <linux-doc@vger.kernel.org>; Sun,  3 Jan 2021 07:28:45 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id g24so24624193edw.9
        for <linux-doc@vger.kernel.org>; Sun, 03 Jan 2021 07:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CKbkg9XEl5Cdq3/4L/h6uPiBAUaQfHC57itqiZ9bJr0=;
        b=u+iMP0CXalv9utqd5ZD2+mn8twLDr3xzPi8vmIWcFXVI+sfdbcLrGk3gUc1C89iS7T
         2Zwu/jxux3tiVrKXUQ/RAG860Rho3AuyWkGp/gJTdUvHngpeKSqAjSIkMfhUrEpLDSxJ
         wQw2xMREbkj/lMvBZiUCkwM9LfOfggI+umT7uAOXPhEfcRdKVNS8Mp9g4r1hNM+0+eFH
         FOcfRvVkWnL5yY923moEFO7K7rw4QSFYpwNuN2OgCmh49C3Rqpry01X38sRNo18M2Nqw
         rx1XHAuH0i6V/CO3ke+WTFtt/5KBDgSgT40wFTmbqo/bwLPB0KljSGSSX5IqhXCL5cH/
         naJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CKbkg9XEl5Cdq3/4L/h6uPiBAUaQfHC57itqiZ9bJr0=;
        b=crlT0PdWbHmwAGd85HxNwUnNpdJWSkbdJLEXZfBdxACVbHHKQknSj4sOGySCZ3AiNq
         g2qXBFjZP2t1z3y2degH7I3HX+3xgce9vyDMxljPg6Ir5Ae+N5SUYOW1tF9d9yQBtSJa
         DzsyFQVAaFJ0Xlg84PgFUHd9MozwjvZrgwuDOiaAKsBj3dZJxuqiiN7tbFbUQOzlLVEd
         uCHeo8+EnbNhZFdOOr3FKnVZK7B5M5MmZdUEQMS25NdL8NnA/nIrEjHOlPF4cwW5to3M
         oH8yhmlQkncRuIu65Hdx5watom7LkfyOOrqMll/lJkD0kKn6klNDq6tIfG4A4cl0zb4g
         or1w==
X-Gm-Message-State: AOAM533mGjaDR8skdxjQgSgtDYhjZK43ut/3c4Wc0oTJG5CcCVCzYTUx
        LqgMSm+fNIv1GTg9EgRhi2QZmlm6Xmcv4/+obCYOIQ==
X-Google-Smtp-Source: ABdhPJyfawFbl1Zu0fBq4KyAq33ha2UbUR3DbWgPLPfHN88VLCs6KDLSFdTvEgCk/q/IU27938Bt0kW/3uZS9hbuZNE=
X-Received: by 2002:a50:bac4:: with SMTP id x62mr66180717ede.59.1609687723765;
 Sun, 03 Jan 2021 07:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20210101204325.998256-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210101204325.998256-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Sun, 3 Jan 2021 16:28:32 +0100
Message-ID: <CAMpxmJUVm+N=1WArb9hnV1BtsTfL5kH+_NkF3+iLmR17SiZjzA@mail.gmail.com>
Subject: Re: [PATCH] docs: gpio: intro: Improve HTML formatting
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 1, 2021 at 9:43 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Currently the HTML output for Documentation/driver-api/gpio/intro.rst
> doesn't look right. The lines that start with LOW or HIGH are formatted
> in bold, while the next line after each is not bold.
>
> With this patch, the HTML looks better.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/gpio/intro.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/intro.rst b/Documentation/driv=
er-api/gpio/intro.rst
> index 74591489d0b55..94dd7185e76eb 100644
> --- a/Documentation/driver-api/gpio/intro.rst
> +++ b/Documentation/driver-api/gpio/intro.rst
> @@ -106,11 +106,11 @@ don't. When you need open drain signaling but your =
hardware doesn't directly
>  support it, there's a common idiom you can use to emulate it with any GP=
IO pin
>  that can be used as either an input or an output:
>
> - LOW:  gpiod_direction_output(gpio, 0) ... this drives the signal and ov=
errides
> -       the pullup.
> + **LOW**: ``gpiod_direction_output(gpio, 0)`` ... this drives the signal=
 and
> + overrides the pullup.
>
> - HIGH: gpiod_direction_input(gpio) ... this turns off the output, so the=
 pullup
> -       (or some other device) controls the signal.
> + **HIGH**: ``gpiod_direction_input(gpio)`` ... this turns off the output=
, so
> + the pullup (or some other device) controls the signal.
>
>  The same logic can be applied to emulate open source signaling, by drivi=
ng the
>  high signal and configuring the GPIO as input for low. This open drain/o=
pen
> --
> 2.29.2
>

Applied, thanks!

Bartosz
