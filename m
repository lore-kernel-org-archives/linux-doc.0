Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 546297E3B8
	for <lwn-linux-doc@archive.lwn.net>; Tue,  7 Aug 2018 16:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389073AbeHGTOA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 7 Aug 2018 15:14:00 -0400
Received: from mail.bootlin.com ([62.4.15.54]:36068 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388943AbeHGTOA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 7 Aug 2018 15:14:00 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 269B420799; Tue,  7 Aug 2018 18:58:44 +0200 (CEST)
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id 9B8E0209C3;
        Tue,  7 Aug 2018 18:57:37 +0200 (CEST)
Date:   Tue, 7 Aug 2018 18:57:38 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/12] mtd: rawnand: ams-delta: Assign
 mtd->dev.parent, not mtd->owner
Message-ID: <20180807185738.695960dc@bbrezillon>
In-Reply-To: <20180806222918.12644-2-jmkrzyszt@gmail.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
        <20180806222918.12644-1-jmkrzyszt@gmail.com>
        <20180806222918.12644-2-jmkrzyszt@gmail.com>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue,  7 Aug 2018 00:29:07 +0200
Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Fix missing mtd->dev.parent assignment and drop useless mtd->owner.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

> ---
>  drivers/mtd/nand/raw/ams-delta.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
> index 2a8872ebd14a..af313c620264 100644
> --- a/drivers/mtd/nand/raw/ams-delta.c
> +++ b/drivers/mtd/nand/raw/ams-delta.c
> @@ -162,7 +162,7 @@ static int ams_delta_init(struct platform_device *pdev)
>  	}
>  
>  	ams_delta_mtd = nand_to_mtd(this);
> -	ams_delta_mtd->owner = THIS_MODULE;
> +	ams_delta_mtd->dev.parent = &pdev->dev;
>  
>  	/*
>  	 * Don't try to request the memory region from here,

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
