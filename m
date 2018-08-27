Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6EBEC7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon, 27 Aug 2018 08:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbeH0MmX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 27 Aug 2018 08:42:23 -0400
Received: from mail-io0-f195.google.com ([209.85.223.195]:39275 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727078AbeH0MmP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Aug 2018 08:42:15 -0400
Received: by mail-io0-f195.google.com with SMTP id l7-v6so12198703iok.6
        for <linux-doc@vger.kernel.org>; Mon, 27 Aug 2018 01:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=h4PZMzainKCYUvAYL5kM5LaaqKl+5u8AZLn6hSJrix0=;
        b=0FtmzQCW1PGXrhMXm6Y7OdfrHTI0+Gc/ahaFiGa2H4XnqrgKjyQ5mxGfT40yx2RaaT
         smJgKBS8ue1EOq5h3CwnZ47UjCWj1i28rtNn8kaO2c8/bNDO0VKU/9Rl+h9F8lKXBAhk
         +tRYCEPfE6J8KTVXqF3SypX+8UMVRitchO9YDxGp4as/bkwhbyKtVAoC8srUoi0oce77
         ezHQNNi7IQqGSj7683HHKFT8YPZ+2YnjXCSbcRyrv0I3FQSHsTgQjTRTn+9VcPBxwuHr
         tXyze0RfpaHtqfAZwQppqgl6IhSuGHzWjoL0JpbKF0sgT8pN4mF7HSaEYf9gE5HkathW
         lLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=h4PZMzainKCYUvAYL5kM5LaaqKl+5u8AZLn6hSJrix0=;
        b=Zw2DpsRhU9M211fj39nJ027VliT/rB/vM4drOfOB9LQ8EKedneUUG1/U1X2mu3E470
         wzqzBKrf13wjH+2/UgqlfgpnXRLkNqXkxHQbLNk+bVbJ3hriFNQtbkfOkEywyrbgXdB/
         ivonSjNjh0odSUit7LqC3rWGuTOC6nMS+Kfn3PUj6ITiuBnAagb+dBayCcub3+bbte4A
         4ZYVFWlUE1B6WhWbdxSF5k2/4tp/3SLIdrwY4EjPpPv5cMTq0U2vdeOF8/jhimRI8eH2
         uCtlIciwXyDjYvsNBdY4dx7nF7KkOYsm0vvFBXjSgaub2rU7VDS2oufcmLaK3awPzvM1
         8WZQ==
X-Gm-Message-State: APzg51CRDP01rFKV0kQlirOLzFyEzTSZhpDZJRo6mASa9LqNihVBMFE2
        06V9Pfl61K0qJjm+yqZUcpWsTT0GyTH7Or9LygdOWQ==
X-Google-Smtp-Source: ANB0VdZU1O7YL3J3GW+L5yGErVWtcVknMMAbt3xIXjNATiQ5ffLroUoMphXiVYhg07HumLojqYn5ubFQjWIf10YpXtw=
X-Received: by 2002:a5e:8d07:: with SMTP id m7-v6mr9209179ioj.258.1535360190362;
 Mon, 27 Aug 2018 01:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:9402:0:0:0:0:0 with HTTP; Mon, 27 Aug 2018 01:56:29
 -0700 (PDT)
In-Reply-To: <20180825082722.567e8c9a@bbrezillon>
References: <20180810080526.27207-1-brgl@bgdev.pl> <20180810080526.27207-2-brgl@bgdev.pl>
 <20180824170848.29594318@bbrezillon> <20180824152740.GD27483@lunn.ch> <20180825082722.567e8c9a@bbrezillon>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 27 Aug 2018 10:56:29 +0200
Message-ID: <CAMRc=Men-MPk5DGshWcVEc0v=gH2WSpx1j-CawOeydwp59tejw@mail.gmail.com>
Subject: Re: [PATCH v2 01/29] nvmem: add support for cell lookups
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        linux-doc <linux-doc@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        Russell King <linux@armlinux.org.uk>,
        Marek Vasut <marek.vasut@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        David Lechner <david@lechnology.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Sven Van Asbroeck <svendev@arcx.com>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>, Naren <naren.kernel@gmail.com>,
        netdev <netdev@vger.kernel.org>, Alban Bedel <albeu@free.fr>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Norris <computersforpeace@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-08-25 8:27 GMT+02:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> On Fri, 24 Aug 2018 17:27:40 +0200
> Andrew Lunn <andrew@lunn.ch> wrote:
>
>> On Fri, Aug 24, 2018 at 05:08:48PM +0200, Boris Brezillon wrote:
>> > Hi Bartosz,
>> >
>> > On Fri, 10 Aug 2018 10:04:58 +0200
>> > Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> >
>> > > +struct nvmem_cell_lookup {
>> > > + struct nvmem_cell_info  info;
>> > > + struct list_head        list;
>> > > + const char              *nvmem_name;
>> > > +};
>> >
>> > Hm, maybe I don't get it right, but this looks suspicious. Usually the
>> > consumer lookup table is here to attach device specific names to
>> > external resources.
>> >
>> > So what I'd expect here is:
>> >
>> > struct nvmem_cell_lookup {
>> >     /* The nvmem device name. */
>> >     const char *nvmem_name;
>> >
>> >     /* The nvmem cell name */
>> >     const char *nvmem_cell_name;
>> >
>> >     /*
>> >      * The local resource name. Basically what you have in the
>> >      * nvmem-cell-names prop.
>> >      */
>> >     const char *conid;
>> > };
>> >
>> > struct nvmem_cell_lookup_table {
>> >     struct list_head list;
>> >
>> >     /* ID of the consumer device. */
>> >     const char *devid;
>> >
>> >     /* Array of cell lookup entries. */
>> >     unsigned int ncells;
>> >     const struct nvmem_cell_lookup *cells;
>> > };
>> >
>> > Looks like your nvmem_cell_lookup is more something used to attach cells
>> > to an nvmem device, which is NVMEM provider's responsibility not the
>> > consumer one.
>>
>> Hi Boris
>>
>> There are cases where there is not a clear providier/consumer split. I
>> have an x86 platform, with a few at24 EEPROMs on it. It uses an off
>> the shelf Komtron module, placed on a custom carrier board. One of the
>> EEPROMs contains the hardware variant information. Once i know the
>> variant, i need to instantiate other I2C, SPI, MDIO devices, all using
>> platform devices, since this is x86, no DT available.
>>
>> So the first thing my x86 platform device does is instantiate the
>> first i2c device for the AT24. Once the EEPROM pops into existence, i
>> need to add nvmem cells onto it. So at that point, the x86 platform
>> driver is playing the provider role. Once the cells are added, i can
>> then use nvmem consumer interfaces to get the contents of the cell,
>> run a checksum, and instantiate the other devices.
>>
>> I wish the embedded world was all DT, but the reality is that it is
>> not :-(
>
> Actually, I'm not questioning the need for this feature (being able to
> attach NVMEM cells to an NVMEM device on a platform that does not use
> DT). What I'm saying is that this functionality is provider related,
> not consumer related. Also, I wonder if defining such NVMEM cells
> shouldn't go through the provider driver instead of being passed
> directly to the NVMEM layer, because nvmem_config already have a fields
> to pass cells at registration time, plus, the name of the NVMEM cell
> device is sometimes created dynamically and can be hard to guess at
> platform_device registration time.
>

In my use case the provider is at24 EEPROM driver. This is where the
nvmem_config lives but I can't image a correct and clean way of
passing this cell config to the driver from board files without using
new ugly fields in platform_data which this very series is trying to
remove. This is why this cell config should live in machine code.

> I also think non-DT consumers will need a way to reference exiting
> NVMEM cells, but this consumer-oriented nvmem cell lookup table should
> look like the gpio or pwm lookup table (basically what I proposed in my
> previous email).

How about introducing two new interfaces to nvmem: one for defining
nvmem cells from machine code and the second for connecting these
cells with devices?

Best regards,
Bart
