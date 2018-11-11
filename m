Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6D74D7D089
	for <lwn-linux-doc@archive.lwn.net>; Sun, 11 Nov 2018 21:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbeKLGrA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 01:47:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:34774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726838AbeKLGq7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Nov 2018 01:46:59 -0500
Received: from localhost (unknown [206.108.79.134])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AD3EF20881;
        Sun, 11 Nov 2018 20:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1541969840;
        bh=CsHMniWgVX/kubCsA2C4XNhv2NN65GbGvCIiNSBE5oM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DNqgiDqh3+r+tEtGX0w2sszS7s2KjhGizkAu0weT2wriowZLWvDrGNWlIzl6eBvUI
         AclmFMZZtS8BxV4Ltz7zCZ+TM8Is3A9keAscJlKzLaBwYaRjPgIo2IMzU1m58fYIXd
         AndNtt54vDPqe24gbbZWu0QZDzllm1ffBl2vDcyI=
Date:   Sun, 11 Nov 2018 12:57:18 -0800
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
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
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        linux-gpio@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>,
        Przemyslaw Gaj <pgaj@cadence.com>,
        Peter Rosin <peda@axentia.se>,
        Mike Shettel <mshettel@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v10 0/9] Add the I3C subsystem
Message-ID: <20181111205718.GA16288@kroah.com>
References: <20181026144333.12276-1-boris.brezillon@bootlin.com>
 <20181111173932.GA12254@kroah.com>
 <20181111191017.7b2efdf1@bbrezillon>
 <20181111191020.GA21003@kroah.com>
 <20181111210818.08af6731@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181111210818.08af6731@bbrezillon>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Nov 11, 2018 at 09:08:18PM +0100, Boris Brezillon wrote:
> On Sun, 11 Nov 2018 11:10:20 -0800
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Sun, Nov 11, 2018 at 07:10:17PM +0100, Boris Brezillon wrote:
> > > Hi Greg,
> > > 
> > > On Sun, 11 Nov 2018 09:39:32 -0800
> > > Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> > >   
> > > > On Fri, Oct 26, 2018 at 04:43:24PM +0200, Boris Brezillon wrote:  
> > > > > Hi Greg,
> > > > > 
> > > > > I think we've reached a point where we can eventually consider the I3C
> > > > > framework for inclusion in 4.20 (5.0?). A few more issues were reported
> > > > > on v9 and fixed in v10. I can't guarantee that the implementation is
> > > > > free of bugs but I still think it's worth merging it in v4.20: it's a
> > > > > new subsystem, so we don't risk regressions, and the only way we can
> > > > > detect other issues is by having other people experiment with this
> > > > > implementation.
> > > > > 
> > > > > The only remaining concern raised by Arnd is the fact that both hosts
> > > > > and slaves share the same bus type and are differentiated thanks to
> > > > > their device_type, which IMHO is fine since this is what other
> > > > > subsystems do (plus I don't see other solutions to have both I3C
> > > > > devices and I3C buses represented under /sys/bus/i3c/).    
> > > > 
> > > > Yeah, it's not the nicest, but it will work, we did it also for USB and
> > > > greybus and it solves the issue.
> > > > 
> > > > This all looks good to me, so I've queued it up.  Let's see if
> > > > linux-next has any problems with it.  
> > > 
> > > I recently asked Stephen to add the linux-i3c tree to linux-next, so
> > > I'm expecting conflicts :-/. Sorry, I didn't know you were planning to
> > > take these patches through your tree.
> > > 
> > > BTW, I also fixed a couple of things when rebasing on top of 4.20-rc1:
> > > 
> > > - KernelVersion in the sysfs ABI doc has been updated to 5.0  
> > 
> > There is no 5.0 yet :)
> 
> Actually I had a hard time choosing between 4.21 and 5.0, and then I
> saw Linus' email announcing 4.20-rc1 ;-). But I can change it back to
> 4.21 if you prefer.
> 
> > 
> > > - Fixed i3c_master_getmxds_locked() (bug reported/fixed by Colin here
> > >   https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1799850.html)
> > > - Removed a blank line at the end of master-driver-api.rst
> 
> One extra thing I didn't mention (and didn't fix yet) is the I3C
> mailing list. I asked Dave Miller if he'd be okay to create the
> linux-i3c ML on vger.kernel.org, and he suggested that we use the
> linux-i2c ML instead which I know Wolfram is not fond of. I might
> decide to just put linux-kernel@vger.kernel.org as the ML to Cc for
> I3C patches until we settle on something. 
> 
> > > 
> > > For the record, the i3c/next branch pulled by Stephen is available here
> > > [1].
> > >   
> > > > Thanks for sticking with it, nice work!  
> > > 
> > > Thanks for reviewing it! Greg, Stephen, let me know if you want me to
> > > reset i3c/next to v4.20-rc1 to avoid conflicts in linux-next.  
> > 
> > So do you want me to just drop these patches from my tree?  If so, I
> > can, but i have no problem sending these to Linus for the next -rc1
> > merge window through my tree if that is easier.
> > 
> > It's up to you.
> 
> I think that's easier for me and for you if I take them in the i3c tree
> and then send a PR to Linus myself. This way I won't bother you if
> fixes are needed or if I decide to apply patches adding support for
> other I3C controllers (I see you commented on the Synopsys driver
> already, and I might indeed decide to queue this patchset for this
> release).
> 
> Doing that also allows me to get everything in place since I'll anyway
> have to send PRs to Linus at some point.
> 
> Regards,
> 
> Boris
> 
> PS: If you're fine with me taking the I3C patches, I'll need your
> Acked-by.

Sure, feel free to do it all yourself, I do not object to that!  :)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
