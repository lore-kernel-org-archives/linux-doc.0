Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C0E337DE76
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 17:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752634AbeC1R2O (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 13:28:14 -0400
Received: from mail.bootlin.com ([62.4.15.54]:41265 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751166AbeC1R2L (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Mar 2018 13:28:11 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id CCEE020720; Wed, 28 Mar 2018 19:28:07 +0200 (CEST)
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id 1FAB920146;
        Wed, 28 Mar 2018 19:28:07 +0200 (CEST)
Date:   Wed, 28 Mar 2018 19:28:07 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Rob Herring <robh@kernel.org>
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
        Nishanth Menon <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org,
        Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: i3c: Document core bindings
Message-ID: <20180328192807.174b794d@bbrezillon>
In-Reply-To: <CAL_JsqKKf_Ob6AUvO5xgEFzSWakYDuPPzVKe4taoN1kzw3b1fQ@mail.gmail.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
        <20180323110020.19080-6-boris.brezillon@bootlin.com>
        <20180326071946.dtrhhxx3iwwymk73@rob-hp-laptop>
        <20180328101922.22a7039d@bbrezillon>
        <CAL_JsqKKf_Ob6AUvO5xgEFzSWakYDuPPzVKe4taoN1kzw3b1fQ@mail.gmail.com>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 28 Mar 2018 11:42:07 -0500
Rob Herring <robh@kernel.org> wrote:


> >>  
> >> > +where device-type is describing the type of device connected on the bus
> >> > +(gpio-controller, sensor, ...).
> >> > +
> >> > +Required properties
> >> > +-------------------
> >> > +- reg: contains 3 cells
> >> > +  + first cell : encodes the I2C address. Should be 0 if the device does not
> >> > +            have one (0 is not a valid I3C address).  
> >>
> >> Change here to "encodes the static I2C address".
> >>
> >> 0 is not a valid I2C address?  
> >
> > According to [1] it is reserved, and it's reserved in the I3C spec
> > anyway (see "Table 9 I3C Slave Address Restrictions" in the I3C spec).  
> 
> Sorry, what I meant was s/I3C/I2C/. The first cell is I2C address and
> 0 is not valid.

Okay, got it now :-).
> 
> >> > +
> >> > +  + second and third cells: should encode the ProvisionalID. The second cell
> >> > +                       contains the manufacturer ID left-shifted by 1.
> >> > +                       The third cell contains ORing of the part ID
> >> > +                       left-shifted by 16, the instance ID left-shifted
> >> > +                       by 12 and the extra information. This encoding is
> >> > +                       following the PID definition provided by the I3C
> >> > +                       specification.  
> >
> > One extra question for you: should I refer to the I3C_DEV(),
> > I3C_DEV_WITH_STATIC_ADDR() and I2C_DEV() macros in the bindings doc?
> > And if I do, should I use them my example?  
> 
> Well, I don't want to see "device@I3C_DEV(...)" for unit-addresses.

That wouldn't work anyway.

> You can use them for reg property, but it's somewhat pointless to use
> it in one place and not the other.

Not sure I follow you. These macros have been added to ease definitions
of reg, but you'll still have to manually define the unit-address
manually. Are you saying I should not use them in dts files or just that
I should not mention it in the doc. If this is the former, then patch 6
should be dropped.

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
