Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4DDB87DE59
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 16:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbeHJSsU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 14:48:20 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:34664 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728102AbeHJSsT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 14:48:19 -0400
Received: by mail-it0-f68.google.com with SMTP id d70-v6so5100544ith.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qpDChSEoVOJBPGx9YmxkwlUonMQ7vT7RN3awaNxdtiA=;
        b=jzZVqEAaMmIH2ybo1dK0Fx0LdoATYIo8pEwHs3ChBJMYx0VdKlF2Iu75Lm7yflPCC9
         RrVTUTphMA/O7ZnVzsvTOKco1FY+JwKhtevTgeU3z5poo56HVg5b08tx/fCezH7Si6E1
         koel88l99C3elXlb7VRWLdjApI2O1s+g1LWVZB3p+JQFe7NqmvovWt69KNrQ6LJMxf0I
         saCmBeGEQzSjIc0UAtHPTfurEsVKiDmL7ad8d3+JklSg+yeHesmiOCavnBzExzJHgNWt
         IczNUjCE7FsPIdOWwsG+8RqKl0/8GdqFyOR4UzwRf3DgACnFdmajmFZQ+BroXCcg6yHr
         FFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qpDChSEoVOJBPGx9YmxkwlUonMQ7vT7RN3awaNxdtiA=;
        b=UeQds6hgJdefU+qwuQfQycP1p/iwYsx8i0q91NcIV6DLAgWvXYmagQlBO3qUJKe2lX
         BpDAQ5Qbv0o80C+S+DPYsOLW+M+QinmGfuAewl3Cy3359grWB3fGSCF/SjGlcZxx8N8b
         XP326WPYW7I7vPZYl9Y3XgdtEgqJcy6pbxBZLoxMGlFzAPin/K4U3l8z3ftw3D7oRghe
         AdG8VlSyCwNcP74j1CxD4KrZOkpB0nDhlJFQc75yyUzzkTjzg0KmliGS0raTNKjQ5RMz
         d0aKAbcDHyBDeQNKQD4OC1v23gBCWXW5RcznosTaxKNUDS0+MaAOKARQKNW4AVAk7liY
         vFqg==
X-Gm-Message-State: AOUpUlGEFQZLiMeYRYQTD58TaJLg9WK7ORW8b1sZ3uqZeKZ6GGFeDqGR
        dBFMUIcmPXKhtqwKtXlx+LBF0hLZZXaSlKFbGjXxgQ==
X-Google-Smtp-Source: AA+uWPzpeb/2JVSgNeJasnJYXgD7ZXD42sYm44M8NAkM6aadB9hAPMQZexX4qqmVX3WBXtilV3YULLku+p5eZcjZyPs=
X-Received: by 2002:a24:1013:: with SMTP id 19-v6mr2722355ity.141.1533917868345;
 Fri, 10 Aug 2018 09:17:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:9403:0:0:0:0:0 with HTTP; Fri, 10 Aug 2018 09:17:47
 -0700 (PDT)
In-Reply-To: <CAHp75Ve28aNe+FCK3p4OLsDf7dNo-iJ1VR=pyx+Y9OUn3sjYBw@mail.gmail.com>
References: <20180810080526.27207-1-brgl@bgdev.pl> <20180810080526.27207-15-brgl@bgdev.pl>
 <CAHp75Ve28aNe+FCK3p4OLsDf7dNo-iJ1VR=pyx+Y9OUn3sjYBw@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 10 Aug 2018 18:17:47 +0200
Message-ID: <CAMRc=Mc536v+L_u0garWbeyQ78Q6tyEEzhR9pRGf5mBU+daE+w@mail.gmail.com>
Subject: Re: [PATCH v2 14/29] net: simplify eth_platform_get_mac_address()
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
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
        Andrew Lunn <andrew@lunn.ch>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-08-10 16:39 GMT+02:00 Andy Shevchenko <andy.shevchenko@gmail.com>:
> On Fri, Aug 10, 2018 at 11:05 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> We don't need to use pci_device_to_OF_node() - we can retrieve
>> dev->of_node directly even for pci devices.
>>
>
>>         struct device_node *dp;
>>
>> -       if (dev_is_pci(dev))
>> -               dp = pci_device_to_OF_node(to_pci_dev(dev));
>> -       else
>> -               dp = dev->of_node;
>> -
>> +       dp = dev->of_node;
>>         addr = NULL;
>>         if (dp)
>>                 addr = of_get_mac_address(dp);
>
> Looking more at this I could even propose to change all above by
>
> addr = device_get_mac_address(dev, mac_addr, ETH_ALEN);
>
> Thoughts?
>
> --
> With Best Regards,
> Andy Shevchenko

Indeed seems like it's even more generalized. Thanks for spotting that.

Bart
