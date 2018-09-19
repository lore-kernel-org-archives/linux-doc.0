Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD8287D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Sep 2018 18:09:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732789AbeISXsX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Sep 2018 19:48:23 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:36237 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732545AbeISXsX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Sep 2018 19:48:23 -0400
Received: by mail-it0-f65.google.com with SMTP id u13-v6so8960045iti.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Sep 2018 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ISZLf4DnHFIhsg+YbdjTklFmn4eDr4rDQyUoCeuA2q8=;
        b=LvJoFXQb+KOhNNQPhO3Bdv8qeK6IF2ynw5MqyQpUSr/sE3NyU3UUttJfIOx02nuxef
         /lO+PPDyUNPCbJRBgAnlwfutBVdvtE3F52n0kC2i5HKwDtolp8iW58o+pYeGvaat3MVh
         GgFYsR/L+uJxBL8bVh+CVofaqRFOOtZw4ek0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ISZLf4DnHFIhsg+YbdjTklFmn4eDr4rDQyUoCeuA2q8=;
        b=slOeHWyMz+64HVbZzbiMwIqsQZrhGVQ0aOBJaGfIyNC5puPVYfaOV2yCHemEZT2SPA
         7qSatyh9XAIusYU4XjaxPw1IV7Jh40YOsFmjmYFELArsebRjTq06pI31DDwhsEkcYx6b
         tJ2xcQ20khPQz5ouxfdGPNC21dnwr2zudwLNg2xHD1YsvAHbMXZZn9rUV5uYDwIZD4CY
         VXv2cGqjObaRz2sOB8J+ChJBZ508YnLgok33/tHNq0Td9DWFOOVHsQjbTd8g2KYbq5uX
         lmVwe//pGhYmQFbj535/jndX2/24uAMz5nXDaSPBZWUhNYaNHh7hgHCCUPpIt+HH9WpM
         qVQw==
X-Gm-Message-State: APzg51CKNRwhrneLmgaO0lUzzbYBzl8/nr8OKYwTRuS/6BM9dnmkkWA3
        WTEsVUjDRnmhLnsLadhXHyK4MD5Ga/rCVuIfo6UP2g==
X-Google-Smtp-Source: ANB0VdaaDDXi8yndRXDcrfK1Ne9ZDdK4AK/4KYBaHZr/o/egJTR+4il7b6Xp09l7zkztVT11xv6U1L0Uy3QkYlhzd8M=
X-Received: by 2002:a02:6c45:: with SMTP id w66-v6mr33431549jab.87.1537380557726;
 Wed, 19 Sep 2018 11:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180902120144.6855-1-jmkrzyszt@gmail.com> <20180905215008.1649-1-jmkrzyszt@gmail.com>
 <CACRpkdbAG1N0v-BrXruf5088L0x3XwSHbFTWOFxjHQWx0LKz5g@mail.gmail.com>
In-Reply-To: <CACRpkdbAG1N0v-BrXruf5088L0x3XwSHbFTWOFxjHQWx0LKz5g@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 19 Sep 2018 11:08:57 -0700
Message-ID: <CACRpkdbdYmsFD3XOVLWjoGsPSU4UnTKtkYm5VQxGmoeQZewWZA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] gpiolib: speed up GPIO array processing
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Greg KH <gregkh@linuxfoundation.org>, kishon@ti.com,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Jiri Slaby <jslaby@suse.com>, Willy Tarreau <w@1wt.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>,
        Lukas Wunner <lukas@wunner.de>,
        Rojhalat Ibrahim <imr@rtschenk.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        ext Tony Lindgren <tony@atomide.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-iio@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-serial@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 13, 2018 at 2:22 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Sep 5, 2018 at 11:49 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:
>
> > The goal is to boost performance of get/set array functions while
> > processing GPIO arrays which represent pins of a signle chip in
> > hardware order.  If resulting performance is close to PIO, GPIO API
> > can be used for data I/O without much loss of speed.
>
> I applied the v8 to an immutable branch and pushed to kernelorg
> so the build servers can churn it a bit, and if it works fine
> then we can merge this into the devel branch and also set up
> that as something other subsystems can pull in if they need it.
>
> I'm really excited to merge this!

The branch built with no problems, and now I merged this into
devel. If that also builds fine, I will let it hit linux-next so we can
stabilize it for v4.20.

Yours,
Linus Walleij
