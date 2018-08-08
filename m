Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E40277E3E0
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 16:26:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbeHHSqy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 14:46:54 -0400
Received: from mail-oi0-f66.google.com ([209.85.218.66]:45658 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbeHHSqy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 14:46:54 -0400
Received: by mail-oi0-f66.google.com with SMTP id q11-v6so4696773oic.12
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=lP4mi9PPJIm1zUwCtC6JByBe2u0Q/YYzzEUq968p+Is=;
        b=dppKh2deWupMOrlpH7s2uvh1H2QCEOgG4CLxeEHNssWChTbkPe7LNOf3IdJhuaQ388
         b5oSrZtkRhxbgKt8I75g63VFNsXuG1TgYXtNFhN6tph4us1cdoxA2SD4awE7MZZs/8FH
         xbE0SjEMFg1wH5gKX+Ar0fWUFTuKSYFFh5/QamhFru7SYehvzUDp8ZXC1Xn2uF+4ChYH
         iV54U3sVJ7JHhVQnuRT3KDLJBNcAgemNV4uzJeMJmqvoZn/ztwnMY7cSk5HsGIDAR7ah
         6BYaYHH+ObSWPrWJTf+CXKuT86bhWdpiIprtYjlyX47Ct8gx14v5RLKd1AlINZalo2tJ
         kNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=lP4mi9PPJIm1zUwCtC6JByBe2u0Q/YYzzEUq968p+Is=;
        b=sEzgarIk7//b1ISuqNDPyr6RbAm7TXzyde1C9nogk+XTvNK9vlMj0ffapfAwuYtThe
         3p7lJGfadN1CfJSrNpQv8kN+HR8uuKf9b+vthVTS1AvKf9JHLiCU75rOVqbIsE9Y/7ps
         qeucpWZgq1RObn4ceR7/OeLnW58HZ49erdh/lm4tKNirVGVSmtvogMPghj3UwgnCt3Xd
         JLhFesdLq7YE8FUV4wiIgOqkFYSx4beKBOmnW69SpgCwqcnLnaMP2W5aCh6fX9yggo8z
         H/WVBAKNNxft85SI99Y+dOGpUTgDF/eHAtCFxtFEQ+PkOSfFH1y5DniWqAqF3FejRqpA
         OYyA==
X-Gm-Message-State: AOUpUlHq+dh8DG32msfuae5kyhi2yNZ0vd/BYBFhMlramAOJIqlHj/WA
        7z3z3AMsMx76pHUCV/pkzVDihBh6JdTJ/EbeJdQiDA==
X-Google-Smtp-Source: AA+uWPy/YzJXAjYM52NifsEdmm8P3gTej++7sQbGoLn1kkBIp91tGGbdhPKPOG1VK1PXOTil9b/wBrC257LGv7qN3DY=
X-Received: by 2002:aca:5e42:: with SMTP id s63-v6mr3418116oib.134.1533745588176;
 Wed, 08 Aug 2018 09:26:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:2c03:0:0:0:0:0 with HTTP; Wed, 8 Aug 2018 09:26:27 -0700 (PDT)
In-Reply-To: <20180808162042.GG7275@lunn.ch>
References: <20180808153150.23444-1-brgl@bgdev.pl> <20180808153150.23444-7-brgl@bgdev.pl>
 <20180808162042.GG7275@lunn.ch>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 8 Aug 2018 18:26:27 +0200
Message-ID: <CAMpxmJXpx69oOjVccTLiDLus+gCXtMegc329udX99s1rZ2VJFQ@mail.gmail.com>
Subject: Re: [PATCH 06/28] mtd: Add support for reading MTD devices via the
 nvmem API
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

2018-08-08 18:20 GMT+02:00 Andrew Lunn <andrew@lunn.ch>:
> On Wed, Aug 08, 2018 at 05:31:28PM +0200, Bartosz Golaszewski wrote:
>> From: Alban Bedel <albeu@free.fr>
>>
>> Allow drivers that use the nvmem API to read data stored on MTD devices.
>> For this the mtd devices are registered as read-only NVMEM providers.
>> On OF systems only devices that have the 'nvmem-provider' property
>> are registered, on non-OF system all MTD devices are registered.
>> @@ -570,6 +613,11 @@ int add_mtd_device(struct mtd_info *mtd)
>>       if (error)
>>               goto fail_added;
>>
>> +     /* Add the nvmem provider */
>> +     error = mtd_nvmem_add(mtd);
>> +     if (error)
>> +             goto fail_nvmem_add;
>> +
>
> Hi Bartosz
>
> Maybe it is hiding somewhere, but i don't see any code looking into
> device tree looking for the 'nvmem-provider' property.
>
>        Andrew

Ugh, I copied the commit message from Alban's patch. For the moment
there's no such thing, you're right. I'll fix it for v2.

Bart
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
