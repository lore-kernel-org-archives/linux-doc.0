Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 584B37D57F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 13 Sep 2018 09:22:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728012AbeIMOa4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 13 Sep 2018 10:30:56 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:36853 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727757AbeIMOa4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Sep 2018 10:30:56 -0400
Received: by mail-it0-f68.google.com with SMTP id u13-v6so6901763iti.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Sep 2018 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHB8ORIjoIhutvy9NcRm9NF71dAzGyNycr99x/StYXs=;
        b=fzJpRGx4J216C4i4vGoBRLn4/7Sssdg/m2I+1Z8I0rC820/UR6sZc9n/aRqliX4SS1
         QUt4S+tymsE5pI7p5b0frS9g4LT06SjnI/CqQXgr2MIT99IBCaKxPo3JI0cD+fXIUvEF
         R27BSIkztMnxF2RCLl5Ay9y6VtG3OBQ3voKQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHB8ORIjoIhutvy9NcRm9NF71dAzGyNycr99x/StYXs=;
        b=aq49i0M7/GTz+59x2p0FnJVezOoOciLLH3PyT+3cVq6zcX5GZsIi1J+gMfcfqlhjL6
         UFmYeGYaq1vLbBMua7TKZ+csMoioBHnIwcmChzF3RbqAjKVnnJaMRqNuxSx09eZ8ePqO
         1/qhqpXTlXh6UZU7qVO1wd/hmMhZf7NCA+LQaT05V/orLWNLx0F0bGHHYIPAJ3uVK8Ig
         9dJyao7k5TyHHysmDRKxKVjdCA1HRI27vCEIfMfG0qXXL5tvF5P5aVuBuoGeYGudDb5g
         S8VRejESgXVl6Or8o1GTpaMQkeKNaEyhyjpLKbH1IoPmLhi1omasA27u4ud+f3iBrOrA
         6mkw==
X-Gm-Message-State: APzg51CRxsx/Y/mvXQ49FvM1N9UnDtDwM3iyEijh8JuM9AigHF5PnZz8
        4sU+pM/jrcWLOMFOC2Vg0iN4TyepujURXch28Xvdbg==
X-Google-Smtp-Source: ANB0VdbR8RYtlqbDOZYb1OgeV4HxNnebgKxzGrmW9Z6ev4nDKpj73Duk+kF6F/3rVU9HMZid6AxqyD5sPtjzcxFeFpw=
X-Received: by 2002:a24:9d84:: with SMTP id f126-v6mr5594349itd.130.1536830539719;
 Thu, 13 Sep 2018 02:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20180902120144.6855-1-jmkrzyszt@gmail.com> <20180905215008.1649-1-jmkrzyszt@gmail.com>
In-Reply-To: <20180905215008.1649-1-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 13 Sep 2018 11:22:06 +0200
Message-ID: <CACRpkdbAG1N0v-BrXruf5088L0x3XwSHbFTWOFxjHQWx0LKz5g@mail.gmail.com>
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

On Wed, Sep 5, 2018 at 11:49 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> The goal is to boost performance of get/set array functions while
> processing GPIO arrays which represent pins of a signle chip in
> hardware order.  If resulting performance is close to PIO, GPIO API
> can be used for data I/O without much loss of speed.

I applied the v8 to an immutable branch and pushed to kernelorg
so the build servers can churn it a bit, and if it works fine
then we can merge this into the devel branch and also set up
that as something other subsystems can pull in if they need it.

I'm really excited to merge this!

Yours,
Linus Walleij
