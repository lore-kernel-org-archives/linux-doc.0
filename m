Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091C7C433DB
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 15:16:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEA3A6521D
	for <linux-doc@archiver.kernel.org>; Mon,  8 Mar 2021 15:16:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCHPQQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Mar 2021 10:16:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhCHPQF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Mar 2021 10:16:05 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E78C061760
        for <linux-doc@vger.kernel.org>; Mon,  8 Mar 2021 07:16:05 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id d13so15296401edp.4
        for <linux-doc@vger.kernel.org>; Mon, 08 Mar 2021 07:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wME0xxypILqfkGLAgLbk6QlOoimfje6iWFu2oEHWfOs=;
        b=n0RdWFb3wQqQnw/sAXyDL81fOug2MleJFDzS9JHqJa0Xf/qxNoBmnvMYUgDZwTcYF+
         rYOXffjH/llx/sf/D5I0Gf9zZCatLig7eBUI+6yU1cupnL/YEbHvxJ1BrIrpFOmh9NKM
         6+R+6zxoYU8hwDNHKyhnCqwmPXpOioanlM5z9Jh/OEu88RIpHdu95lXQ+oyIloNX+zuE
         ERLhcYqYKlHLSOjifxsIe26Dtx9ZZdWZFQLgOf431yV5Prm0Ri9tmMXTuBRA9V+4rZGD
         kULkYNbckRRXsNuQBV7HQlKnoAqDcoGkZEWOP0KTZcRsndJXIvXw1mHiiSmYRpLVEgAC
         QjWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wME0xxypILqfkGLAgLbk6QlOoimfje6iWFu2oEHWfOs=;
        b=b/qt3GFTJH/nDRS0LIXiCd/B7Jt26ivdBOHFg8uQfS4ZmPKjv6BIE1dslFaCmSBE3I
         LkLp0fMfC47uKbXUkrid3JrYwY971NFmkAtL5kqhz0gQLxNswsqg8+kZwq3UBT18Th4j
         l9zZmZ65yIC3UEbhHuU5oa9aBz48tQUXN7CMrjv8SQZwuPnvfnvF7qXoYws4MhtbM5+y
         Lmcvak36RVbBFA5ck2UE2nM0sMnFH2aQQ7+w0UHajZWBGREVZxnbWabYhaBdd64ttOG0
         umwQY1bt26BvBjfj3ZOH4k+EduPUb6vVldaMM1pOGHigK6mI/7EDVa2FBO79ngydbkZz
         JB+A==
X-Gm-Message-State: AOAM530ZQh9XXpCA4H1qL3/HGln5AL9oWqGoXuEBOUoet/hURRIvp4Na
        IOGyCUO+L+CEtEhD8ephr2uEOuOvubxenMhw4WJ0Vw==
X-Google-Smtp-Source: ABdhPJxBFaI+hm/G4Y0wTEXCDtli4Oap8zfigY5PX7vLldku4lyAIN75HyumbkvqaFZfvVhuxHIhzsRYSYaQMIP0cKk=
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr22440599edb.113.1615216564092;
 Mon, 08 Mar 2021 07:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
In-Reply-To: <20210303203444.3140677-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 8 Mar 2021 16:15:53 +0100
Message-ID: <CAMpxmJXs+hVS4c7PBfE8U73q15utehRdfZKz70cP3b-4Rb0Nvw@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: gpio: consumer: Mark another line of
 code as such
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 3, 2021 at 9:43 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Make it so that this #include line is rendered in monospace, like other
> code blocks.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 22271c342d923..3366a991b4aa7 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -12,7 +12,7 @@ Guidelines for GPIOs consumers
>
>  Drivers that can't work without standard GPIO calls should have Kconfig =
entries
>  that depend on GPIOLIB or select GPIOLIB. The functions that allow a dri=
ver to
> -obtain and use GPIOs are available by including the following file:
> +obtain and use GPIOs are available by including the following file::
>
>         #include <linux/gpio/consumer.h>
>
> --
> 2.30.1
>

Patch applied, thanks!

Bartosz
