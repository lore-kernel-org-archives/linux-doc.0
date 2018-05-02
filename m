Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DA5EA7E69D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 11:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751342AbeEBLLA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 07:11:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750932AbeEBLK6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 May 2018 07:10:58 -0400
Received: from localhost (unknown [209.136.236.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2A9F20834;
        Wed,  2 May 2018 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1525259457;
        bh=6COlSKNe2cEsht59N4z4S8RbgoZaUn3qPrGHFPA0pf8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZbSIE/8UZc5CTGkubEG6tTaxFm5dKpux0tmrLSvmS67N4c1gKUgc2v8e0+LPY1yIm
         61qJqZ3KxRKlvxzEAJ3wPxvAFxkycaMwsKZMgmwH3Wem20haMPgTz7r8xzu2LvKIT/
         //NreL/Wl2nfR3orGOKzOl9xaNpYUlrRYE964BRs=
Date:   Wed, 2 May 2018 04:10:46 -0700
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 03/10] i3c: Add sysfs ABI spec
Message-ID: <20180502111046.GA22091@kroah.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-4-boris.brezillon@bootlin.com>
 <20180429133700.GD28913@kroah.com>
 <CAMuHMdUe=zauTS7BQXyTvMbmc-AsEVdWN0gG_3Ejg3E4T-xFXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUe=zauTS7BQXyTvMbmc-AsEVdWN0gG_3Ejg3E4T-xFXQ@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 02, 2018 at 11:47:49AM +0200, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Sun, Apr 29, 2018 at 3:37 PM, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Fri, Mar 30, 2018 at 09:47:44AM +0200, Boris Brezillon wrote:
> >> Document sysfs files/directories/symlinks exposed by the I3C subsystem.
> >>
> >> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> >> ---
> >> Changes in v2:
> >> - new patch
> >> ---
> >>  Documentation/ABI/testing/sysfs-bus-i3c | 95 +++++++++++++++++++++++++++++++++
> >>  1 file changed, 95 insertions(+)
> >>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i3c
> >>
> >> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
> >> new file mode 100644
> >> index 000000000000..5e88cc093e0e
> >> --- /dev/null
> >> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
> >> @@ -0,0 +1,95 @@
> >> +What:                /sys/bus/i3c/devices/i3c-<bus-id>
> >> +KernelVersion:  4.16
> >
> > Wrong kernel versions :)
> 
> Do you update these when backporting to stable? ;-)

I'm not adding new features/subsystems to stable :)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
