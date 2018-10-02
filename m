Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 747A47D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 09:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727285AbeJBQZ5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 12:25:57 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37821 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727240AbeJBQZ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 12:25:57 -0400
Received: by mail-it1-f195.google.com with SMTP id m9-v6so2755722ita.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VL33L2BXfLh1jyQS7r/gH4FO1nrLNgAqNmliOTRuAfE=;
        b=SVn1I+vz52XANu1ubyj/ZEQ5Nh2o158ywl1XkCT6oU0DOR+/ov1V5nx/3AdBWhQmYf
         I/Roi6Gznhl8xuXI97+KhAAYvRNt5RFTK9fHSalxLQWqpvpq2K1vCPmS4LwNaee56OjG
         pojDY1TGflAi4UQqpVmju/oh35mslbBDh5tCwvotpZRr9UCEqjjTDRx0h06Kgxb19WiE
         ij+MoM4H5Th10s/QZYx90nYQ3tD6znjASl5kNmVjH7VjPSXvw8XdxT4t59Jk0ayLNMPZ
         g+UIJyRxuAzlC2yXTUJeUM/RdRGXqBVSxGiL4IMbHMzfMkFC1Llag1uBhHPzEBWTH2kq
         V5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VL33L2BXfLh1jyQS7r/gH4FO1nrLNgAqNmliOTRuAfE=;
        b=qGHLTt9hMjjtnfrREDGr3RIougZ9BOTBZ3vLzQux97/QfiICVrRJjxquXGJVw0a6HM
         8UqJYspFxcI/jN8eBXPBG3NYwiaZ/AD9dZ/Xg6wpuiltTPbN/fzZKOp7kjIrwZHAZrJs
         6lO4uwRBJnHvLB5MgwrThYWRxRtC7LcZoi+TIVQ5HbJI8lb/+z3V2YEfbOa8aaxKLCsl
         Z3pF2xeFljUQlQL0rEy+2QYqpSXCgerYwiUHTuQ0waWUZOK1YfX87+tDUfTXPo+Brurl
         WElAPJmV6Zp3cIS60capTZvpdB+X2JOrEYV4C5hLNfopbbU0yAfR2ljKwNtwrAsptl6w
         6TsQ==
X-Gm-Message-State: ABuFfoi/D83y4ghELF/NWfzZjt/hLJ+z9E76qbfpkRF9nHRrLNl2h26I
        k9aNbs/4EqqgA8qB07u+k2x3SOcqr09gLpBGKwIsRQ==
X-Google-Smtp-Source: ACcGV60l1mMiLAFtyJwA9hdphUfg7WDQgNIGFQ4QRaOg5WEPEgdCj5hT80z/kEUqyaZ7z+vGCR/fw5G9rzILntmuFcM=
X-Received: by 2002:a24:f047:: with SMTP id p7-v6mr1284075iti.125.1538473414050;
 Tue, 02 Oct 2018 02:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20181002094238.17571-1-brgl@bgdev.pl>
In-Reply-To: <20181002094238.17571-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 2 Oct 2018 11:43:22 +0200
Message-ID: <CAMRc=Mdu1BZKA89OEjrB7Ti5nZujpO=_jk4EBaxjpESnFgZm1w@mail.gmail.com>
Subject: Re: [PATCH] nvmem: fix nvmem_cell_get_from_lookup()
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

wt., 2 pa=C5=BA 2018 o 11:42 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We check if the pointer returned by __nvmem_device_get() is not NULL
> while we should actually check if it is not IS_ERR(nvmem). Fix it.
>
> While we're at it: fix the next error path where we should assign an
> error value to cell before returning.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/nvmem/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index ad1227df1984..f49474e1ad49 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -952,9 +952,9 @@ nvmem_cell_get_from_lookup(struct device *dev, const =
char *con_id)
>                     (strcmp(lookup->con_id, con_id) =3D=3D 0)) {
>                         /* This is the right entry. */
>                         nvmem =3D __nvmem_device_get(NULL, lookup->nvmem_=
name);
> -                       if (!nvmem) {
> +                       if (IS_ERR(nvmem)) {
>                                 /* Provider may not be registered yet. */
> -                               cell =3D ERR_PTR(-EPROBE_DEFER);
> +                               cell =3D ERR_CAST(nvmem);
>                                 goto out;
>                         }
>
> @@ -962,6 +962,7 @@ nvmem_cell_get_from_lookup(struct device *dev, const =
char *con_id)
>                                                        lookup->cell_name)=
;
>                         if (!cell) {
>                                 __nvmem_device_put(nvmem);
> +                               cell =3D ERR_PTR(-ENOENT);
>                                 goto out;
>                         }
>                 }
> --
> 2.19.0
>

Ugh this was supposed to be v2. Sorry for spamming.

Bart
