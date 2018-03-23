Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1B87F7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 13:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752785AbeCWN7a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 09:59:30 -0400
Received: from mail.bootlin.com ([62.4.15.54]:51150 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752447AbeCWN73 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Mar 2018 09:59:29 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id A0CD8206FB; Fri, 23 Mar 2018 14:59:26 +0100 (CET)
Received: from bbrezillon (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id D52B32046F;
        Fri, 23 Mar 2018 14:59:25 +0100 (CET)
Date:   Fri, 23 Mar 2018 14:59:26 +0100
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
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
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 09/11] dt-bindings: i3c: Document Cadence I3C master
 bindings
Message-ID: <20180323145926.29fa0ff8@bbrezillon>
In-Reply-To: <20180323121035.7dc27356@windsurf>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
        <20180323110020.19080-10-boris.brezillon@bootlin.com>
        <20180323121035.7dc27356@windsurf>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Mar 2018 12:10:35 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> On Fri, 23 Mar 2018 12:00:18 +0100, Boris Brezillon wrote:
> 
> > +Optional properties defined by the generic binding (see
> > +Documentation/devicetree/bindings/i3c/i3c.txt for more details):
> > +
> > +- i2c-scl-frequency
> > +- i3c-scl-frequency  
> 
> These properties are now named *-scl-hz.
> 
> > +Example:
> > +
> > +	i3c-master@0d040000 {
> > +		compatible = "cdns,i3c-master";
> > +		clocks = <&coreclock>, <&i3csysclock>;
> > +		clock-names = "pclk", "sysclk";
> > +		interrupts = <3 0>;
> > +		reg = <0x0d040000 0x1000>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		i2c-scl-frequency = <100000>;  
> 
> Ditto.

I'll fix that in v4.

Thanks for the review.

Boris

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
