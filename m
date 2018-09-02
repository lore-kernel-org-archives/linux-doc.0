Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 022A97DE59
	for <lwn-linux-doc@archive.lwn.net>; Sun,  2 Sep 2018 13:22:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729641AbeIBRhs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 2 Sep 2018 13:37:48 -0400
Received: from bmailout2.hostsharing.net ([83.223.90.240]:50073 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729179AbeIBRhr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 2 Sep 2018 13:37:47 -0400
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id 4D5C62800B3C5;
        Sun,  2 Sep 2018 15:21:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id E630C248B; Sun,  2 Sep 2018 15:21:54 +0200 (CEST)
Date:   Sun, 2 Sep 2018 15:21:54 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Jiri Slaby <jslaby@suse.com>, Willy Tarreau <w@1wt.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-iio@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>,
        Rojhalat Ibrahim <imr@rtschenk.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v7 1/4] gpiolib: Pass bitmaps, not integer arrays, to
 get/set array
Message-ID: <20180902132154.aishrx5shpvjrm2x@wunner.de>
References: <20180831225616.29221-1-jmkrzyszt@gmail.com>
 <20180902120144.6855-1-jmkrzyszt@gmail.com>
 <20180902120144.6855-2-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180902120144.6855-2-jmkrzyszt@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 02, 2018 at 02:01:41PM +0200, Janusz Krzysztofik wrote:
> @@ -461,7 +461,7 @@ static long linehandle_ioctl(struct file *filep, unsigned int cmd,
>  
>  		/* Clamp all values to [0,1] */
>  		for (i = 0; i < lh->numdescs; i++)
> -			vals[i] = !!ghd.values[i];
> +			__assign_bit(i, vals, !!ghd.values[i]);

The "!!" becomes unnecessary and can be removed, same for the code
comment above.


>  /**
>   * gpiod_get_array_value() - read values from an array of GPIOs
> - * @array_size: number of elements in the descriptor / value arrays
> + * @array_size: number of elements in the descriptor array / value bitmap
>   * @desc_array: array of GPIO descriptors whose values will be read
> - * @value_array: array to store the read values
> + * @value_bitnap: bitmap to store the read values

Typo, s/bitnap/bitmap/

Otherwise LGTM.
