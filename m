Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09C907E3DF
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 16:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbeHHSmZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 14:42:25 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:58683 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727062AbeHHSmZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 8 Aug 2018 14:42:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch; s=20171124;
        h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=X5ENKrDqkl5j2afjWRMo7S68YhZdIMlBKp/TBvcxr5I=;
        b=3wHt662gGBLuWMA3O+1QdIjMsDCuniALuVYPHOXplXjmK8dXqH18E9ATzG5310vJM7dwdlD5pZxgzEk7caFR4Plp+mM5kARarFV+3HOOPOFTd2ZFKnkBNBI0h/Nej/i8kLvYMlycaTw7/uN03CBQVwFFK+vbMT42pvufsvBGynk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.84_2)
        (envelope-from <andrew@lunn.ch>)
        id 1fnRCU-0007Dd-74; Wed, 08 Aug 2018 18:20:42 +0200
Date:   Wed, 8 Aug 2018 18:20:42 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
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
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 06/28] mtd: Add support for reading MTD devices via the
 nvmem API
Message-ID: <20180808162042.GG7275@lunn.ch>
References: <20180808153150.23444-1-brgl@bgdev.pl>
 <20180808153150.23444-7-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180808153150.23444-7-brgl@bgdev.pl>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 08, 2018 at 05:31:28PM +0200, Bartosz Golaszewski wrote:
> From: Alban Bedel <albeu@free.fr>
> 
> Allow drivers that use the nvmem API to read data stored on MTD devices.
> For this the mtd devices are registered as read-only NVMEM providers.
> On OF systems only devices that have the 'nvmem-provider' property
> are registered, on non-OF system all MTD devices are registered.
> @@ -570,6 +613,11 @@ int add_mtd_device(struct mtd_info *mtd)
>  	if (error)
>  		goto fail_added;
>  
> +	/* Add the nvmem provider */
> +	error = mtd_nvmem_add(mtd);
> +	if (error)
> +		goto fail_nvmem_add;
> +

Hi Bartosz

Maybe it is hiding somewhere, but i don't see any code looking into
device tree looking for the 'nvmem-provider' property.

       Andrew
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
