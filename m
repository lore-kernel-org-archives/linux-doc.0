Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9103B7E3E1
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 16:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbeHHSvS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 14:51:18 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:46356 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727337AbeHHSvR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 14:51:17 -0400
Received: by mail-oi0-f68.google.com with SMTP id y207-v6so4724562oie.13
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 09:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hh0LsN1BucTaVxY6Jhcaq3BSVyOj2qSRqX2sYKeZLhE=;
        b=Kxx81N3ldnJ8QogcHmiwABcmZvo255w4w3waJgOk+CMKfEh0uWtpvGmbAz5s4GGlJF
         Qmn8W8zcxjD659qTKUIUH3ByYdabSpVVdcY6dbmRkGNYvkjqT4hO6KR81ieVOt1YUsvf
         tRck1XykNt6qcX+JHdJe7Sln2Mw4ugBF/HDkn+naRIq1hwc3rmkWc+FDEPgiERD/qKc0
         UTYgrHFss3PXr1+DKdXiX+ft5v3K26PdYgG6f2UdVKJ74PbpLtP0e7wummxIFEaJL/yy
         IczqrI4cTHDXuZnXzmoL+QO1MmE+lhkhKPIeG9+V9vteo9+Mm+5fYQ6dlsDwrkNkXFQV
         Vhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hh0LsN1BucTaVxY6Jhcaq3BSVyOj2qSRqX2sYKeZLhE=;
        b=it2nJLO39/gQoz+EFRj1hDUd6wTBxJtRtpsMyoQUyyLcHNvJ9EA05+MHMCf0YGZzkC
         C3SxeD/e0rASBl4ty5uZRTL7i6jwn80jDxXwfL95Lye/Bb7n2FnncSl8+PSTuslReRJ8
         7xCYFUJs5XuiS6U6PnKfTBtiTz9AEE4PotfQwd6SFckS4srrY5M0F9gezB76Eq+N53Jm
         cOopP52O8zeXUE12T7VvOHMcbEwxr4eWMXNrWAVHdxyqdl7eVMI/wtLn1aJg7Z6xDv4U
         Sr+HXEVqMOvDAxaBJQM94M2iOwSamVm9hXPKgD7rQOpjuEJV+tJ3YjCL4ewRx4Y1BRtv
         Qohw==
X-Gm-Message-State: AOUpUlGcH/+NPf7YQxFrkSN0AuReufAFAXCb+7YIUtF7HJ03NJg0MLKF
        U5O5ajnCz6LN3Y3LNqLRikaFGGeFaZO7616MNilTvg==
X-Google-Smtp-Source: AA+uWPytUSGpTMeUnMgrm7X2fjHNZJtNvBTFnxgr3feFVqBgGghIB0feIsatlFGQGcmNa7EcSWh1SX51eOW/wtFUd6s=
X-Received: by 2002:aca:45c3:: with SMTP id s186-v6mr3390752oia.289.1533745850144;
 Wed, 08 Aug 2018 09:30:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:2c03:0:0:0:0:0 with HTTP; Wed, 8 Aug 2018 09:30:49 -0700 (PDT)
In-Reply-To: <20180808161353.GF7275@lunn.ch>
References: <20180808153150.23444-1-brgl@bgdev.pl> <20180808153150.23444-4-brgl@bgdev.pl>
 <20180808161353.GF7275@lunn.ch>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 8 Aug 2018 18:30:49 +0200
Message-ID: <CAMpxmJXr60+7mRNf+AQrvSPAxW2hJXCP13rDbmtRfqouKzt3Bg@mail.gmail.com>
Subject: Re: [PATCH 03/28] nvmem: add a notifier chain
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        Linux-OMAP <linux-omap@vger.kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-08-08 18:13 GMT+02:00 Andrew Lunn <andrew@lunn.ch>:
> On Wed, Aug 08, 2018 at 05:31:25PM +0200, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Add a blocking notifier chain with two events (add and remove) so that
>> users can get notified about the addition of nvmem devices they're
>> waiting for.
>>
>> We'll use this instead of the at24 setup callback in the mityomapl138
>> board file.
>
> Hi Bartosz
>
> What context is this notifier chain called in?
>
> I did something similar using the i2c notifier to try to work around
> the impending disappearing of the setup callback. But i got lockdep
> splats, because the notifier was called while some locks were being
> held, so it was not possible to register other i2c devices.
>
> The at24 setup callback is done as part of probe, so no important
> locks are held. Are any locks held when this notifier chain is called?
>
> Thanks
>         Andrew

In the case of at24 it would be called from at24_probe() ->
nvmem_register() in process context. Would you mind testing it? Would
be great to see if it works on multiple setups.

Bart
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
