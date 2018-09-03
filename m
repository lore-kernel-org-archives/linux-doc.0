Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 37C2B7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Mon,  3 Sep 2018 04:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbeICIuR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 3 Sep 2018 04:50:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51150 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbeICIuR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Sep 2018 04:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ogoiR0/3aNqNVfLK4e66ESmPUII43RF0TuXmuQ4BhXQ=; b=m4H3d0+7HizxVv/kXOXq/0HGz
        vxp9VLMeA+aCuLPFdJSsy9oXxHL6l0b3cEQHmxTWCJPp4LFvymq8W9IZoG5H8iz/ZBwsnrv5NNipL
        vJ9/TeEC2hARx34r13WWhWws5BmMCmLst3cnysk7J/UEoaTrWcJmLz1WywGlhe7eM+MlyGPweATDs
        QMknxPgLSKCxiVN+EAzo1H3BJfaDKAkgzqbjqgyMEwyWtubULU/I2Vd4SQw3tufSYqNLm+Hws8vE9
        uolEGaEP7dw0Hihz+1JeeYHFjinAmNSaGgiv+M3aImG351ST1rKMgZ1uSFrcCeoe0viAHMYZPSnwa
        Y2a6ckOXA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fwgWP-0007F5-K5; Mon, 03 Sep 2018 04:31:29 +0000
Date:   Sun, 2 Sep 2018 21:31:29 -0700
From:   Matthew Wilcox <willy@infradead.org>
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
        Lukas Wunner <lukas@wunner.de>,
        Rojhalat Ibrahim <imr@rtschenk.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Tony Lindgren <tony@atomide.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 1/4] gpiolib: Pass bitmaps, not integer arrays, to
 get/set array
Message-ID: <20180903043129.GA17856@bombadil.infradead.org>
References: <20180831225616.29221-1-jmkrzyszt@gmail.com>
 <20180902120144.6855-1-jmkrzyszt@gmail.com>
 <20180902120144.6855-2-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180902120144.6855-2-jmkrzyszt@gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +++ b/drivers/auxdisplay/hd44780.c
> @@ -62,17 +62,12 @@ static void hd44780_strobe_gpio(struct hd44780 *hd)
>  /* write to an LCD panel register in 8 bit GPIO mode */
>  static void hd44780_write_gpio8(struct hd44780 *hd, u8 val, unsigned int rs)
>  {
> -	int values[10];	/* for DATA[0-7], RS, RW */
> -	unsigned int i, n;
> -
> -	for (i = 0; i < 8; i++)
> -		values[PIN_DATA0 + i] = !!(val & BIT(i));
> -	values[PIN_CTRL_RS] = rs;
> -	n = 9;
> -	if (hd->pins[PIN_CTRL_RW]) {
> -		values[PIN_CTRL_RW] = 0;
> -		n++;
> -	}
> +	DECLARE_BITMAP(values, 10); /* for DATA[0-7], RS, RW */
> +	unsigned int n;
> +
> +	*values = val;
> +	__assign_bit(8, values, rs);
> +	n = hd->pins[PIN_CTRL_RW] ? 10 : 9;

Doesn't this assume little endian bitmaps?  Has anyone tested this on
big-endian machines?
