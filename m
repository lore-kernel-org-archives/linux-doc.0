Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B78637D089
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Oct 2018 22:52:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726803AbeJYHWx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Oct 2018 03:22:53 -0400
Received: from mail.bootlin.com ([62.4.15.54]:57611 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726238AbeJYHWw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Oct 2018 03:22:52 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id B0003207F4; Thu, 25 Oct 2018 00:52:51 +0200 (CEST)
Received: from bbrezillon (unknown [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id D644720766;
        Thu, 25 Oct 2018 00:52:40 +0200 (CEST)
Date:   Thu, 25 Oct 2018 00:52:39 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
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
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        <linux-gpio@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Przemyslaw Gaj <pgaj@cadence.com>,
        Peter Rosin <peda@axentia.se>,
        Mike Shettel <mshettel@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v9 6/9] i3c: master: Add driver for Cadence IP
Message-ID: <20181025005239.15506a63@bbrezillon>
In-Reply-To: <380d73a8-2e54-3cee-2fdd-c6e891df93f7@ti.com>
References: <20181022133404.2061-1-boris.brezillon@bootlin.com>
        <20181022133404.2061-7-boris.brezillon@bootlin.com>
        <20181024202048.7e3534f7@bbrezillon>
        <99a506e3-d9d5-0d3e-26e1-031447c14857@ti.com>
        <20181024230432.66dd71df@bbrezillon>
        <380d73a8-2e54-3cee-2fdd-c6e891df93f7@ti.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 24 Oct 2018 17:43:00 -0500
Grygorii Strashko <grygorii.strashko@ti.com> wrote:

> On 10/24/18 4:04 PM, Boris Brezillon wrote:
> > On Wed, 24 Oct 2018 15:25:17 -0500
> > Grygorii Strashko <grygorii.strashko@ti.com> wrote:
> >   
> >> On 10/24/18 1:20 PM, Boris Brezillon wrote:  
> >>> Hi Arnd,
> >>>
> >>> On Mon, 22 Oct 2018 15:34:01 +0200
> >>> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> >>>
> >>>      
> >>>> +
> >>>> +static void cdns_i3c_master_rd_from_rx_fifo(struct cdns_i3c_master *master,
> >>>> +					    u8 *bytes, int nbytes)
> >>>> +{
> >>>> +	readsl(master->regs + RX_FIFO, bytes, nbytes / 4);  
> >>>
> >>> Vitor reported a problem with readsl(): this function expects the 2nd
> >>> argument to be aligned on 32-bit, which is not guaranteed here. Unless
> >>> you see a better solution, I'll switch back to a loop doing:
> >>>
> >>> 	for (i = 0; i < nbytes; i += 4) {
> >>> 		u32 tmp = __raw_readl(...);  
> >>
> >> Pls, do not use __raw io.  
> > 
> > Except this is exactly what I want here, unless you have a
> > replacement for "readl() without a mem-barrier and without endianness
> > conversion"
> >   
> 
> Not sure why endianness is the problem. readl_relaxed?

Because we want to read a stream of bytes, and, if we have a CPU that is
operating in big-endian (ARM kernels can configured in BE or LE), byte
ordering will be messed up (the controller is LE).

If I use readl_relaxed(), I'll then have to call cpu_to_le32(), and
finally copy the result to the buffer.

> Sry, I've missed that this is part of the driver not i3c core,
> so minor/ignore.
> 

