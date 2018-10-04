Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B6F9B7D082
	for <lwn-linux-doc@archive.lwn.net>; Thu,  4 Oct 2018 11:06:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727278AbeJDR7S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 4 Oct 2018 13:59:18 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46081 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727245AbeJDR7S (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Oct 2018 13:59:18 -0400
Received: by mail-io1-f68.google.com with SMTP id t7-v6so7503549ioj.13
        for <linux-doc@vger.kernel.org>; Thu, 04 Oct 2018 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xxkYyzpPCHAW6LP3RbijxSP25jc+Vjy5656kVu0QYHs=;
        b=tNjcBfAoU/JT6YPyPNuSjG+4gXq+R7NyMLJUSt28NmpLc2HXbBfKDUf45tVAhppRmU
         6VcU47ZxeYpEo9Q1ezIZAgPrUwJuOm5kJIpwE00g3wXfaP7yAHcnhgGd4AXT2tPBLAu4
         NPi8pvRrrAgmo8e2ph1w5pEdGPcm/IacjcIley8wf4TFaOYZ1uykM65C/y1SGcIAyk0t
         BTR6MglL/PrFfBnwA65LWncKNbJl/7KNAjGT8I6Km9/X5khcJ8T9UyiNjcldGhOnAvdZ
         t3yuxhUYXRxgqnP3MfNNy5x8QehoHzHadsBBLc+nZQnkYZa409mfgdNNeKKBUXNs5MuX
         SpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xxkYyzpPCHAW6LP3RbijxSP25jc+Vjy5656kVu0QYHs=;
        b=BImT8UmwZS5xqE8AwN1Y9ZeaNt84hXqh1F5m7ZjQEF1NDFZ9xPFWvO5oHZ8pzDCcGd
         /2g7fIM6todKbMgb5vtRawTwUJ0yMGi9q7dfduUqLFk9Jy0CRYpXDSBaiQrBNocjia3s
         4zEYymljgfbWwJlRCK8WR6Ae6GPA0dtsODaQQbILyRC68EWjW2rPmr3yBltRto/ttq6S
         AAPLHcux5swjTpWlCLuiZRhB1+tk5ivg1SVuv7mB+UH/8jyBy+8MssS2oczlOByGVuYT
         obpn5bYSHmFxsIyPrAXE57v+mGqrUlvzSIQWIkxfwF2Wqtzgl3vW/afaYKu/y6sRNzp1
         PzTQ==
X-Gm-Message-State: ABuFfogIycxwhkrO5rg591d76m3TmUU1EzSTfVveN4Kwk++qkgz2Yc/F
        HwlUIMitbAyO+xpEF/af+qt4+xkBIHYGrkXo6N+JdQ==
X-Google-Smtp-Source: ACcGV62CFErv9ybpjPgbVwk3xOrzQsOfkG+nVtRyCKKodX42qWjw1f1yezioK1rg3171SXRlJI0J7aEobTVIuHPWxtM=
X-Received: by 2002:a5e:8d11:: with SMTP id m17-v6mr3938664ioj.258.1538651191800;
 Thu, 04 Oct 2018 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180810080526.27207-1-brgl@bgdev.pl> <20180831194643.GA62862@ban.mtv.corp.google.com>
 <CAMRc=MejZLV1EQ7uAddsxLY0MTUF8WyiBn=F0ZhkWQJpET0EDQ@mail.gmail.com> <a4c2e6cf-749a-83a1-0bda-43ddb7e744cd@gmail.com>
In-Reply-To: <a4c2e6cf-749a-83a1-0bda-43ddb7e744cd@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 4 Oct 2018 13:06:20 +0200
Message-ID: <CAMRc=MfwM7vODsnuV9eKS4Uf7M5ac59u7ao7KvyaxKzPv5FRvw@mail.gmail.com>
Subject: Re: [PATCH v2 00/29] at24: remove at24_platform_data
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Brian Norris <computersforpeace@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=C5=9Br., 3 pa=C5=BA 2018 o 23:04 Florian Fainelli <f.fainelli@gmail.com> n=
apisa=C5=82(a):
>
>
>
> On 10/3/2018 1:15 PM, Bartosz Golaszewski wrote:
> > pt., 31 sie 2018 o 21:46 Brian Norris <computersforpeace@gmail.com> nap=
isa=C5=82(a):
> >>
> >> Hi,
> >>
> >> On Fri, Aug 10, 2018 at 10:04:57AM +0200, Bartosz Golaszewski wrote:
> >>> Most boards use the EEPROM to store the MAC address. This series adds
> >>> support for cell lookups to the nvmem framework, registers relevant
> >>> cells for all users, adds nvmem support to eth_platform_get_mac_addre=
ss(),
> >>> converts davinci_emac driver to using it and replaces at24_platform_d=
ata
> >>> with device properties.
> >>
> >> We already have:
> >>
> >> of_get_nvmem_mac_address() (which does exactly what you're adding,
> >> except it's DT specific)
> >> of_get_mac_address()
> >> fwnode_get_mac_address()
> >> device_get_mac_address()
> >>
> >> and now you've taught me that this exists too:
> >>
> >> eth_platform_get_mac_address()
> >>
> >> These mostly don't share code, and with your series, they'll start to
> >> diverge even more as to what they support. Can you please help rectify
> >> that, instead of widening the gap?
> >>
> >> For instance, you can delete most of eth_platform_get_mac_address() an=
d
> >> replace it with device_get_mac_address() [1]. And you could add your n=
ew
> >> stuff to fwnode_get_mac_address().
> >>
> >> And important part to note here is that you code isn't just useful for
> >> ethernet -- it could be useful for Wifi devices too. So IMO, sticking =
it
> >> only in an "eth" function is the wrong move.
> >>
> >> Brian
> >>
> >> [1] arch_get_platform_mac_address() is the only part I wouldn't want t=
o
> >> replicate into a truly generic helper. The following should be a no-op
> >> refactor, AIUI:
> >>
> >
> > The only user of arch_get_platform_mac_address() is sparc. It returns
> > an address that seems to be read from some kind of EEPROM. I'm not
> > familiar with this arch though. I'm wondering if we could somehow
> > seamlessly remove this call and then convert all users of
> > eth_platform_get_mac_address() to using device_get_mac_address()?
> >
> > David: I couldn't find a place in sparc code where any ethernet device
> > would be registered, so is there a chance that nobody is using it?
>
> SPARC uses a true Open Firmware implementation, so it would register
> drivers through the CONFIG_OF infrastructure.
> --

I'm seeing that there are only six callers of
eth_platform_get_mac_address() (the only function which calls
arch_get_platform_mac_address()).

Of these six callers four are intel ethernet drivers and two are usb
ethernet adapter drivers.

Is it even possible that sparc wants to get the mac address for a usb
adapter from some memory chip? Maybe we *can* safely remove that
function completely? That would allow us to simplify a lot of code.

Bart
