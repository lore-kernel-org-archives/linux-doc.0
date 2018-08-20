Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33F1D7D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 Aug 2018 18:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbeHTWHn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 Aug 2018 18:07:43 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:33433 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbeHTWHn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Aug 2018 18:07:43 -0400
Received: by mail-it0-f65.google.com with SMTP id d16-v6so8860159itj.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Aug 2018 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=oktQpuXWWOVoDy45nne0KjBNbevvRsWiZ569GlGAKuM=;
        b=pYOmK5aAyao2T9OWueGvkX07NytXfjqn32z9Hr3HXqp3Oj9ho5DrZzYSnYuBR6nPfI
         5XmxgrzRIAms9sDj42oI0BpVOVLrqyEJ2XCE+DeLg1KCB0mDkXub++YW+/dM8VfrTkml
         yma6vsnhqJlceA8lHs+zKyIjawW6DrTslMp8z4Me2MCiJIB1DYcOC/Zy4gbgkEPh+MKS
         hHg28dgVw5bKbaU2OG5OSZvISELuKhUSOxRNwW44lGxNic7MN7ijN3zf9lilILpjTk2z
         UMsR8dVuypuTPHpjOLmmnbxRc3mqye1pxzU/306CYwYiTPqQbsytxLFpFistRRyJJNAv
         7v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=oktQpuXWWOVoDy45nne0KjBNbevvRsWiZ569GlGAKuM=;
        b=kvuhe9Ok6fiH8jqMr26N9FI3lsHr0gjwEfwv/BwrL/3JY9TLv4cVcaXKa01th16UqQ
         T4tnk3F9ZrOJoRh6RM1asuJ0j8hZuo+7s6X7wyYfQuqMdjosNmQTWEhu5Ss0dUFrWkWF
         MDa2B0+XK1wu+LvSfk03+mnR1FGq2WXWc5ZGFdTQ6HprltGAS5wgOrE+enJ8Pbh3EWGb
         ZUdCdZ9NwJWnPX5K5Roh/M2YTeL/lCAMlhZNp0CCyRydocMn1UQmtqsCPECqeXwQWYi2
         vfe54H0Ppwm3GbkMooOxk4F3/4t3q0gs73N8/YEDL+lVFNQyOQzSeCnIUESat/XvJ4v7
         1qKw==
X-Gm-Message-State: AOUpUlFEfz2NCDQmr8WqJSnfCRYdkw3bso1PnVxUhPoywyfvwyUjPCNe
        FifXdCfz4+NQhvZN04CHx5I52Yorcu+P2gEA1bLQwQ==
X-Google-Smtp-Source: AA+uWPwD0YOo0sYXCWeniEMi6Diz14OdkwbpbIaD6haoOg63WGpfgKB9r5fBY3XOSCzvxsE9xgZV9jKVAp/XtzPAkBo=
X-Received: by 2002:a02:8d23:: with SMTP id h32-v6mr4222393jak.43.1534791055914;
 Mon, 20 Aug 2018 11:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5e:9403:0:0:0:0:0 with HTTP; Mon, 20 Aug 2018 11:50:55
 -0700 (PDT)
In-Reply-To: <20180820202038.5d3dc195@bbrezillon>
References: <20180810080526.27207-1-brgl@bgdev.pl> <20180810080526.27207-7-brgl@bgdev.pl>
 <20180817182720.6a6e5e8e@bbrezillon> <20180819133106.0420df5f@tock>
 <20180819184609.6dcdbb9a@bbrezillon> <5b8c30b8-41e1-d59e-542b-fef6c6469ff0@linaro.org>
 <20180820202038.5d3dc195@bbrezillon>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Aug 2018 20:50:55 +0200
Message-ID: <CAMRc=McwEjofZKP93DxPa8vJLE6NceLLGfcbcK9-Pfk-dav_Zg@mail.gmail.com>
Subject: Re: [PATCH v2 06/29] mtd: Add support for reading MTD devices via the
 nvmem API
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Alban <albeu@free.fr>, Jonathan Corbet <corbet@lwn.net>,
        Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-08-20 20:20 GMT+02:00 Boris Brezillon <boris.brezillon@bootlin.com>:
> On Mon, 20 Aug 2018 11:43:34 +0100
> Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:
>
>>
>> Overall am still not able to clear visualize on how MTD bindings with
>> nvmem cells would look in both partition and un-partition usecases?
>> An example DT would be nice here!!
>
> Something along those lines:
>
>         mtdnode {
>                 nvmem-cells {
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>
>                         cell@0 {
>                                 reg = <0x0 0x14>;
>                         };
>                 };
>
>                 partitions {
>                         compatible = "fixed-partitions";
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>
>                         partition@0 {
>                                 reg = <0x0 0x20000>;
>
>                                 nvmem-cells {
>                                         #address-cells = <1>;
>                                         #size-cells = <1>;
>
>                                         cell@0 {
>                                                 reg = <0x0 0x10>;
>                                         };
>                                 };
>                         };
>                 };
>         };

If there'll be an agreement on the bindings: will you be willing to
merge Alban's patch even without support in the code for the above
(with the assumption that it will be added later)? My use-case is on
non-DT systems and creating nvmem devices corresponding to MTD
partitions if fine by me. I also don't have the means to test the
support for these bindings if I were to actually write them myself.

Best regards,
Bartosz Golaszewski
