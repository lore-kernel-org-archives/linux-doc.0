Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 888827D2EE
	for <lwn-linux-doc@archive.lwn.net>; Sat,  1 Sep 2018 13:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbeIARXJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 1 Sep 2018 13:23:09 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:36429 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbeIARXJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Sep 2018 13:23:09 -0400
Received: by mail-it0-f68.google.com with SMTP id u13-v6so10530357iti.1
        for <linux-doc@vger.kernel.org>; Sat, 01 Sep 2018 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6OBmkEzLXWZdBpezwe8RFhhwWFRCQX9SHKDEgZ+9NRI=;
        b=ulzWIWQuDhn/rtCywEf/jryrYuwjOnxXau5JUehFwvxSyihjLtSyM+U0WsoSnFfVrA
         3uR4ia9l27WZeynbRQcGL5eXDMarDGJtGs2FJzESq5JLAu4lpfyDieQsVVad9HnKf+1R
         3gezPG1t0Nzw6F8f3zQeL3jVWT31/875tRtu/GM/oBLmN+hrOs5OWlIT6i6gJgsjOlXF
         x5Gyujj9mMCMUPQsyT+jgwM+4oaluISyXaMdieO5kCFJ2ukClTRFsqffbKdux8Pv+8AN
         acJV0nplEIu/MMZDi3v3p+RPZ08nTylwAhqMGBkvDD3htg6byTUsXNXSKubE3qPTbCCq
         KL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=6OBmkEzLXWZdBpezwe8RFhhwWFRCQX9SHKDEgZ+9NRI=;
        b=dwikX1cRPgxlwzQ0XGYMTqV8JeItrNMaKNLTNl/csslOg440Zm1dgjQowyZtNI8lO8
         B8YPG92tR9JzC5aHDMAuWnLPvfwLHsR2eAkmeXA5SX00KESxPcItn+SqHqUKD/UXF38H
         ypon4wSTrwZsbaJVKGgldftN3S76L3wioRkkoIz9rj3sD2G6S9qdBnIOhD23dxI0JWF+
         sFa/UA9uncvHiaEvii6JJYDXhWuHsBaXTxjLwR0oH6RPWR9ZXoKvSXwmwrc2LbVeZ2Uz
         5cliD31qqqSTgqoSdAxAwV/hAEq+wOgEVspaaGg32/xFbZ+347CQlWXzv+mwsPYp7n5/
         jNEg==
X-Gm-Message-State: APzg51CtNptLjo8/p+GEEEi9reX2fDjWrziEkleBYwtHm4k0e0xpQqFq
        vI3w2x1LB/Yvu0wi+SxIcInNteXuSQSDVjJibiZErA==
X-Google-Smtp-Source: ANB0VdZDQt9gKLLdzNLoc42XLt1gzj0e8SKEt8vnTAxbNCggG5IFJHuhJzIFnnCWSSsQInKxxsdzgPGSgbuiWKQl2/g=
X-Received: by 2002:a02:943:: with SMTP id f64-v6mr15187000jad.31.1535807466228;
 Sat, 01 Sep 2018 06:11:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:a043:0:0:0:0:0 with HTTP; Sat, 1 Sep 2018 06:11:05 -0700 (PDT)
In-Reply-To: <20180831203028.GC62862@ban.mtv.corp.google.com>
References: <20180810080526.27207-1-brgl@bgdev.pl> <20180810080526.27207-3-brgl@bgdev.pl>
 <20180831203028.GC62862@ban.mtv.corp.google.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 1 Sep 2018 15:11:05 +0200
Message-ID: <CAMRc=MdergeeYO9HLiFX5_n=SJr22dOJBG2y3+DwkB29XeaFJA@mail.gmail.com>
Subject: Re: [PATCH v2 02/29] Documentation: nvmem: document lookup entries
To:     Brian Norris <computersforpeace@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
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
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        briannorris@chromium.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-08-31 22:30 GMT+02:00 Brian Norris <computersforpeace@gmail.com>:
> On Fri, Aug 10, 2018 at 10:04:59AM +0200, Bartosz Golaszewski wrote:
>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>>
>> Describe the usage of nvmem cell lookup tables.
>>
>> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>> ---
>>  Documentation/nvmem/nvmem.txt | 28 ++++++++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>
>> diff --git a/Documentation/nvmem/nvmem.txt b/Documentation/nvmem/nvmem.txt
>> index 8d8d8f58f96f..9d5e3ca2b4f3 100644
>> --- a/Documentation/nvmem/nvmem.txt
>> +++ b/Documentation/nvmem/nvmem.txt
>> @@ -58,6 +58,34 @@ static int qfprom_probe(struct platform_device *pdev)
>>  It is mandatory that the NVMEM provider has a regmap associated with its
>>  struct device. Failure to do would return error code from nvmem_register().
>>
>> +Additionally it is possible to create nvmem cell lookup entries and register
>> +them with the nvmem framework from machine code as shown in the example below:
>
> Maybe it's partially a lacking in the existing documentation, but what
> does the "name" and the "nvmem_name" mean here? AFAICT, "nvmem_name" is
> akin to a provider identifier; and "name" is a key to match with the
> consumer. It feels like this should be in either the header / kerneldoc
> or this file. Or maybe both.
>
> Does this mean there can only be a single "mac-address" cell in the
> system? I have systems where there are multiple MACs provided in flash
> storage, and we need to map them to ethernet0 and ethernet1. Is that
> supported here?
>

This is a shortcoming of the nvmem subsystem we discussed under
another patch in this series with Boris and Srinivas. I will try to
post a series addressing this next week. Basically there's a global
list of nvmem cells referenced only by name and unless you're using DT
you can only have a single cell with given name. I will address it by
introducing the standard dev_id/con_id resource association.

Bart

> Brian
>
>> +static struct nvmem_cell_lookup foobar_lookup = {
>> +     .info = {
>> +             .name = "mac-address",
>> +             .offset = 0xd000,
>> +             .bytes = ERH_ALEN,
>> +     },
>> +     .nvmem_name = "foobar",
>> +};
>> +
>> +static void foobar_register(void)
>> +{
>> +     ...
>> +     nvmem_add_lookup_table(&foobar_lookup, 1);
>> +     ...
>> +}
>> +
>> +A lookup entry table can be later removed if needed:
>> +
>> +static void foobar_fini(void)
>> +{
>> +     ...
>> +     nvmem_del_lookup_table(&foobar_lookup, 1);
>> +     ...
>> +}
>> +
>>  NVMEM Consumers
>>  +++++++++++++++
>>
>> --
>> 2.18.0
>>
