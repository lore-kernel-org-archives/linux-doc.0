Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 919037D0F4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 11:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751138AbeCZLZl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 07:25:41 -0400
Received: from mail.bootlin.com ([62.4.15.54]:40928 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751042AbeCZLZj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Mar 2018 07:25:39 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id E17FC2072B; Mon, 26 Mar 2018 13:25:36 +0200 (CEST)
Received: from bbrezillon (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id 1960D200FB;
        Mon, 26 Mar 2018 13:25:26 +0200 (CEST)
Date:   Mon, 26 Mar 2018 13:25:26 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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
        Kumar Gala <galak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 11/11] dt-bindings: gpio: Add bindings for Cadence
 I3C gpio expander
Message-ID: <20180326132526.1634946e@bbrezillon>
In-Reply-To: <CAMuHMdX3TLmaN14gM4fTgzXwy1dgsMxCFBs_3wCFWM8rX=+8vA@mail.gmail.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
        <20180323110020.19080-12-boris.brezillon@bootlin.com>
        <CAMuHMdX3TLmaN14gM4fTgzXwy1dgsMxCFBs_3wCFWM8rX=+8vA@mail.gmail.com>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 26 Mar 2018 12:12:54 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Fri, Mar 23, 2018 at 12:00 PM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> > Document the Cadence I3C gpio expander bindings.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>  
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt  
> 
> > +- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
> > +  The second cell bits[3:0] is used to specify trigger type and level flags:
> > +      1 = low-to-high edge triggered.
> > +      2 = high-to-low edge triggered.
> > +      3 = triggered on both edges.
> > +      4 = active high level-sensitive.
> > +      8 = active low level-sensitive.  
> 
> These are identical to the values in <dt-bindings/interrupt-controller/irq.h>.
> Perhaps you can refer to those definitions?

Well, I'm not sure this is allowed since DT bindings docs are
supposed to be OS-agnostic and macros defined in
<dt-bindings/interrupt-controller/irq.h> are, AFAIK, only available to
Linux.

Note that I copied these definitions from another binding ;-).

Rob, any opinion?


-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
