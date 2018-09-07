Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E13D7D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 09:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728243AbeIGNxi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 09:53:38 -0400
Received: from mail.bootlin.com ([62.4.15.54]:60264 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbeIGNxi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Sep 2018 09:53:38 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 4B7F1208AE; Fri,  7 Sep 2018 11:13:36 +0200 (CEST)
Received: from bbrezillon (AAubervilliers-681-1-30-219.w90-88.abo.wanadoo.fr [90.88.15.219])
        by mail.bootlin.com (Postfix) with ESMTPSA id 8C0CB207B4;
        Fri,  7 Sep 2018 11:13:25 +0200 (CEST)
Date:   Fri, 7 Sep 2018 11:13:24 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     Richard Weinberger <richard@nod.at>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Ryan Mallon <rmallon@gmail.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Alexander Clouter <alex@digriz.org.uk>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH 19/19] mtd: rawnand: Move JEDEC code to nand_jedec.c
Message-ID: <20180907111324.691ba379@bbrezillon>
In-Reply-To: <20180907084044.GA6361@lenoch>
References: <20180906223851.6964-1-boris.brezillon@bootlin.com>
        <20180906223851.6964-20-boris.brezillon@bootlin.com>
        <20180907084044.GA6361@lenoch>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 7 Sep 2018 10:40:44 +0200
Ladislav Michl <ladis@linux-mips.org> wrote:

> Hi Boris,
> 
> this patchseries is really amazing clean up. Thank you!

I'm glad I'm not the only one to find it useful :-).

> 
> On Fri, Sep 07, 2018 at 12:38:51AM +0200, Boris Brezillon wrote:
> > This moves ONFI related code to nand_onfi.c and ONFI related
> > struct/macros to include/linux/mtd/onfi.h.  
> 
> Seems above commit log comes from previous patch.

Oops, will fix that.

Thanks,

Boris
