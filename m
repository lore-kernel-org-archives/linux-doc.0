Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 72B0A7D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 24 Sep 2018 08:13:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbeIXOOJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 24 Sep 2018 10:14:09 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:39488 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727159AbeIXOOJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Sep 2018 10:14:09 -0400
Received: by mail-io1-f65.google.com with SMTP id l7-v6so16915437iok.6
        for <linux-doc@vger.kernel.org>; Mon, 24 Sep 2018 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuCpIlcdQTeV/K7rYvlgsPf7U0bVlHvEfKgiDfhDHvs=;
        b=VT32eHnsqo34eMWXwaJmjSagmgbjREwJEg3Oo655D0ogCmuCOq3AUW7CXZRJk4yHZW
         tyCdK19SnYanYL4kGt8YMw4cDC9bPfRxbCobVkISd9lPVRoNbBUZ3MDDVMbrC3Omjlh4
         Ypy6dKJLFUtLRhgABiSr8N3xSUzzR6cs+xDM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuCpIlcdQTeV/K7rYvlgsPf7U0bVlHvEfKgiDfhDHvs=;
        b=d7Yj3TgldZXlYmC34baogglHJuQvsBQZm2R1S0Whd8gdEQaP0jKgnOXa0moN8wjmxn
         rhD4MDNowIhGJ877HA6a0tWT++RKX/suw9n0JzWTb8+/ZxP2FIpNMfobmKHuzq7TVLWq
         VSWFQ8wjMwJ8a3XkiT0Fx56uw4WNujrNvavtb5zeTHDniGudKrSdNh9gccbR/Es9TMg5
         glFklE295PDxtNoQ6iVcMdu23gtbTefV9k0I3zsaMjOMLeElv6j+TmgyPuwkQeiUv6Iw
         IUl9q7Ya7pYXZEVyC+tbczAKztuUJOmuwpPPlFNHKbkPdTP4Ap3LSQnxNwHZULEHMugi
         nlOw==
X-Gm-Message-State: ABuFfojyDx5GdKvpb/RIzij8odqruGK3+lA59y1kN1KH0L0yoeeFPtWc
        WlsVUZKW94dSY7C7n48maH26jYbc3YMA5oujrRjZdA==
X-Google-Smtp-Source: ACcGV60jffR0gaxbH3Vbw/lU1LGhXZ36zx4v91f3ANt16Mo8JSUuDe3E9mRsPPUwcyg0oa6ijdsqsjzeDzVZ2kEPnaw=
X-Received: by 2002:a6b:630a:: with SMTP id p10-v6mr7161376iog.175.1537776795785;
 Mon, 24 Sep 2018 01:13:15 -0700 (PDT)
MIME-Version: 1.0
References: <2785169.v6aIfS3K2k@z50> <20180923235336.22148-1-jmkrzyszt@gmail.com>
 <20180923235336.22148-3-jmkrzyszt@gmail.com>
In-Reply-To: <20180923235336.22148-3-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 24 Sep 2018 10:13:02 +0200
Message-ID: <CACRpkdbF=Yda3Wqii6dkDjqPzuh43Vb4nvPVrxLet3MYo0qUrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpiolib: Fix array members of same chip processed separately
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Sep 24, 2018 at 1:52 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> New code introduced by commit bf9346f5d47b ("gpiolib: Identify arrays
> matching GPIO hardware") forcibly tries to find an array member which
> has its array index number equal to its hardware pin number and set
> up an array info for possible fast bitmap processing of all arrray
> pins belonging to that chip which also satisfy that numbering rule.
>
> Depending on array content, it may happen that consecutive array
> members which belong to the same chip but don't have array indexes
> equal to their pin hardware numbers will be split into groups, some of
> them processed together via the fast bitmap path, and rest of them
> separetely.  However, applications may expect all those pins being
> processed together with a single call to .set_multiple() chip callback,
> like that was done before the change.
>
> Limit applicability of fast bitmap processing path to cases where all
> pins of consecutive array members starting from 0 which belong to the
> same chip have their hardware numbers equal to their corresponding
> array indexes.  That should still speed up processing of applications
> using whole GPIO banks as I/O ports, while not breaking simultaneous
> manipulation of consecutive pins of the same chip which don't follow
> the equal numbering rule.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Patch applied!

Yours,
Linus Walleij
