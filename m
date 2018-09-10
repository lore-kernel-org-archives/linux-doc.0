Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 52E4E7D57F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 10 Sep 2018 09:45:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727646AbeIJOjB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 10 Sep 2018 10:39:01 -0400
Received: from mail-it0-f51.google.com ([209.85.214.51]:36429 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbeIJOjB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Sep 2018 10:39:01 -0400
Received: by mail-it0-f51.google.com with SMTP id u13-v6so27830417iti.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Sep 2018 02:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=+e8JVKyHPLDrOOjWLnvgHpmlIf0JnEkcc8Bo/Zq94UE=;
        b=v7dKi3jmigfjK+74nTajI9CPHKsEbUPgvf50EMle05GFiau9iXMwh5qeVohutBr50c
         MyhmRmzk7Y17CxcASFok3scsKpu7TGrjcHVsFDrr7NStE2uWbMFbeHN5fUhgO7CQkY6j
         2KSEq5B9aU45mWF+JS6oKA1e42nyRG+bEwP56zIP8SNmMk4+IjAzy+uVkDXHoZbyvBtR
         pRcGU5ztXfAgpbj3GXrDFB3+EW4JuK5FBpRYMgeCeYBwmI61C/sh9BksUwmfV3kgBgTR
         ExJtcLmjqrmHCsrFPlNW8nUtglvjW5ou57niv4T4yD1FsjS030kDMRHhEbH/ksha/jqP
         5k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=+e8JVKyHPLDrOOjWLnvgHpmlIf0JnEkcc8Bo/Zq94UE=;
        b=gqsZGjEYwsJOvvOFpix7r2d+SEENgMQErq/GpJL18/zYoaR7iYEY/gY2Korw87YiTW
         VBYM7Bay5coc195525lYWGUTz7+IGZzdEruKCpdJBj7ZEtP/lozRdwKpuv2iFrYPAX5c
         vsL04r5AWzyV+LKYVK4nuc5Bg1dsqGDkjAVwN9Sx+cyCsdDUj3CGVHvbuaVrVDO1zKpK
         zkbt3NWDjFdkWJTwx4iDKaU/0Xl2IRrB3wQuG3yrFECqwGCLKezZQUGAWFvC8eO5teWE
         YJg5/8hllbN0GKy70AEL9G7k3TU4Cc9LlfEP15ZF+YTbRsA0F4EQH233LywKa0/VlhZ4
         LSwg==
X-Gm-Message-State: APzg51D4JcsDT8+yU61wcDYDRr03oy5ldKmCcL52G3NXztxZx1MNQ4jS
        XxqERI+Xrw7w6yC7LPkmRlEOEbLzf2NE39bvhe5RIg==
X-Google-Smtp-Source: ANB0VdZImPLt4oFBt0eb/NigtpivHgZeYhGySne90JjNCYDV7j2PYdYZ1L0WU+95/YKiQjVGylecs4qh92M1X0ZA8iw=
X-Received: by 2002:a24:6e96:: with SMTP id w144-v6mr17664090itc.111.1536572749443;
 Mon, 10 Sep 2018 02:45:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:1905:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 02:45:48
 -0700 (PDT)
In-Reply-To: <c72866dd-1fb0-c765-5815-ba63d051a09b@linaro.org>
References: <20180907100750.14564-1-brgl@bgdev.pl> <20180907100750.14564-14-brgl@bgdev.pl>
 <484b6ec5-cd8e-e5c5-0c5c-2f11c504ea1c@linaro.org> <CAMRc=MdnSHY1ah4X3Bu55HvZcOQHxPHaFudidDA4mEOW9ZzeEg@mail.gmail.com>
 <20180910102324.52ecd8f7@bbrezillon> <c72866dd-1fb0-c765-5815-ba63d051a09b@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 10 Sep 2018 11:45:48 +0200
Message-ID: <CAMRc=Me0bYjdmaqqxKqFkRRSNdoOgDf1A==dASz0dJAtx9BDqg@mail.gmail.com>
Subject: Re: [PATCH v2 13/16] nvmem: add support for cell lookups from machine code
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Boris Brezillon <boris.brezillon@bootlin.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2018-09-10 10:55 GMT+02:00 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>:
>
>
> On 10/09/18 09:23, Boris Brezillon wrote:
>>
>> Well, if we get rid of nvmem-machine.h, the cell-lookup stuff
>> should go in nvmem-consumer.h not nvmem-provider.h. On the other hand,
>> everything that is related to cell creation should be placed in
>> nvmem-provider.h.
>
> Yes, this is how it should be!
>

Any actual reason for not putting these definitions into a separate
'machine' header? This approach is currently used by gpio, pinctrl,
iio and regulator framework because most systems use either DT or ACPI
and don't need to pull in any stuff aimed at board files.

Bart
