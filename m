Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 44BC47DD31
	for <lwn-linux-doc@archive.lwn.net>; Sun, 25 Mar 2018 10:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752914AbeCYKVP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Mar 2018 06:21:15 -0400
Received: from mail.bootlin.com ([62.4.15.54]:51346 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752825AbeCYKVO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Mar 2018 06:21:14 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 508B720722; Sun, 25 Mar 2018 12:21:11 +0200 (CEST)
Received: from bbrezillon (unknown [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id 90BC9203B8;
        Sun, 25 Mar 2018 12:21:10 +0200 (CEST)
Date:   Sun, 25 Mar 2018 12:21:09 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 01/11] i2c: Export of_i2c_get_board_info()
Message-ID: <20180325122109.31c8e904@bbrezillon>
In-Reply-To: <20180324223832.7wvhghw77ech4orn@ninjato>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
        <20180323110020.19080-2-boris.brezillon@bootlin.com>
        <20180324223518.g5jsi5zvoxa75psy@ninjato>
        <20180324223832.7wvhghw77ech4orn@ninjato>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 24 Mar 2018 23:38:32 +0100
Wolfram Sang <wsa@the-dreams.de> wrote:

> > > -	info.archdata = &dev_ad;  
> > 
> > Why did you drop this?  
> 
> If the removal is safe, it should be a seperate patch, I mean.
> 

Sure, I'll move that in a separate patch. Actually, I had a closer look
and it seems the only user of info->archdata is i2c-core-of.c, so we
can even remove the info->archdata field.

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
