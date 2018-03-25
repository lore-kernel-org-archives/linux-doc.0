Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0539E7DD31
	for <lwn-linux-doc@archive.lwn.net>; Sun, 25 Mar 2018 10:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752914AbeCYKTk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Mar 2018 06:19:40 -0400
Received: from mail.bootlin.com ([62.4.15.54]:51309 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752478AbeCYKTi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Mar 2018 06:19:38 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 056EB2082C; Sun, 25 Mar 2018 12:19:35 +0200 (CEST)
Received: from bbrezillon (unknown [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id 3538B20722;
        Sun, 25 Mar 2018 12:19:34 +0200 (CEST)
Date:   Sun, 25 Mar 2018 12:19:32 +0200
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
Message-ID: <20180325121932.6b0e5e5f@bbrezillon>
In-Reply-To: <20180324223518.g5jsi5zvoxa75psy@ninjato>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
        <20180323110020.19080-2-boris.brezillon@bootlin.com>
        <20180324223518.g5jsi5zvoxa75psy@ninjato>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Wolfram,

On Sat, 24 Mar 2018 23:35:18 +0100
Wolfram Sang <wsa@the-dreams.de> wrote:

> Hi Boris,
> 
> > - rebase on v4.15-rc1  
> 
> This code has changed a little meanwhile. Please check my for-next
> branch. Some changes are identical, some similar.

Actually it was rebased on top of v4.16-rc1, but I'll check if this
patch applies correctly on top of your for-next branch.

> 
> > -	info.archdata = &dev_ad;  
> 
> Why did you drop this?

Well, this line could have been moved in of_i2c_register_device(), but
I realized dev_ad was zero initialized without any further
modification, and leaving info->archdata to NULL has the exact same
effect (see [1]).

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v4.16-rc6/source/drivers/i2c/i2c-core-base.c#L711

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
