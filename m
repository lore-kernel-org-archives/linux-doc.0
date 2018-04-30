Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D55B7DE79
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Apr 2018 09:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751679AbeD3Jhy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Apr 2018 05:37:54 -0400
Received: from mail.bootlin.com ([62.4.15.54]:44811 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750882AbeD3Jhx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Apr 2018 05:37:53 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 64ADF207A5; Mon, 30 Apr 2018 11:37:50 +0200 (CEST)
Received: from bbrezillon (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id BB84F2036F;
        Mon, 30 Apr 2018 11:37:49 +0200 (CEST)
Date:   Mon, 30 Apr 2018 11:37:50 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wolfram Sang <wsa@the-dreams.de>, Arnd Bergmann <arnd@arndb.de>
Cc:     linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Przemyslaw Sroka <psroka@cadence.com>,
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
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 00/10] Add the I3C subsystem
Message-ID: <20180430113750.002d384f@bbrezillon>
In-Reply-To: <20180429133642.GC28913@kroah.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
        <20180423193814.5c8ca75a@bbrezillon>
        <20180423175646.GA23210@kroah.com>
        <20180429133642.GC28913@kroah.com>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,

On Sun, 29 Apr 2018 15:36:42 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Mon, Apr 23, 2018 at 07:56:46PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Apr 23, 2018 at 07:38:14PM +0200, Boris Brezillon wrote:  
> > > Hi,
> > > 
> > > On Fri, 30 Mar 2018 09:47:41 +0200
> > > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > >   
> > > > This patch series is a proposal for a new I3C subsystem.  
> > > 
> > > This v4 has been sent almost a month ago and I didn't get any feedback
> > > so far apart from Rob's R-b. Greg, is there any chance we can get these
> > > patches merged in 4.18? If not, could you tell me what should be
> > > addressed/improved/reworked?  
> > 
> > I'll look over it later this week, thanks.  
> 
> At first glance, it would be great to have at least one other
> reviewed-by or signed-off-by on the main code here.  I don't want to be
> the only one to have to review it :)

I understand. Arnd, Wolfram, any chance you could spend some time
reviewing this patch series? I know Arnd is in vacation for the next few
weeks, so I don't expect him to be able to do that immediately. Also,
Wolfram stated that he didn't have time to review the series in details
when I submitted the v1, I don't know if things have changed since then.

Anyway, I'll keep searching for people to review the code.

Regards,

Boris
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
