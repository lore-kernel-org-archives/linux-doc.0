Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D66C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB71D64FA0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 21:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbhBDV64 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 16:58:56 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:49262 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230037AbhBDV64 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 4 Feb 2021 16:58:56 -0500
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
        (envelope-from <andrew@lunn.ch>)
        id 1l7mdT-004GdQ-MA; Thu, 04 Feb 2021 22:57:59 +0100
Date:   Thu, 4 Feb 2021 22:57:59 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Maen Suleiman <maen@marvell.com>,
        Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] docs: arm: marvell: drop some dead links
Message-ID: <YBxt57h+dOl7grza@lunn.ch>
References: <20210203235305.506528-1-lkundrak@v3.sk>
 <20210203235305.506528-2-lkundrak@v3.sk>
 <87pn1ffro8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pn1ffro8.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 04, 2021 at 02:29:11PM -0700, Jonathan Corbet wrote:
> Lubomir Rintel <lkundrak@v3.sk> writes:
> 
> > Just remove these; there's good chance there wasn't anything useful
> > there anyway.
> >
> > Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
> >
> > ---
> > Changes since v1:
> > - Adjust for removal of "[PATCH 1/5] docs: arm: marvell: turn the automatic
> >   links into labels"
> > - Split off the hunk that fixes 38x functional spec link
> >
> >  Documentation/arm/marvel.rst | 25 -------------------------
> >  1 file changed, 25 deletions(-)
> >
> > diff --git a/Documentation/arm/marvel.rst b/Documentation/arm/marvel.rst
> > index 16ab2eb085b86..502a1b89a2c85 100644
> > --- a/Documentation/arm/marvel.rst
> > +++ b/Documentation/arm/marvel.rst
> > @@ -63,8 +63,6 @@ Kirkwood family
> >                  - Product Brief  : http://www.marvell.com/embedded-processors/kirkwood/assets/88F6281-004_ver1.pdf
> >                  - Hardware Spec  : http://www.marvell.com/embedded-processors/kirkwood/assets/HW_88F6281_OpenSource.pdf
> >                  - Functional Spec: http://www.marvell.com/embedded-processors/kirkwood/assets/FS_88F6180_9x_6281_OpenSource.pdf
> > -  Homepage:
> > -	http://www.marvell.com/embedded-processors/kirkwood/
> >    Core:
> >  	Feroceon 88fr131 ARMv5 compatible
> >    Linux kernel mach directory:
> > @@ -126,7 +124,6 @@ EBU Armada family
> >  	- 88F6820 Armada 385
> >  	- 88F6828 Armada 388
> >  
> > -    - Product infos:   http://www.marvell.com/embedded-processors/armada-38x/
> 
> So these URLs do still exist in the Wayback machine; the above is
> https://web.archive.org/web/20180829171124/http://www.marvell.com/embedded-processors/armada-38x/
> for example.  If we delete the links, we make it harder for any
> interested person to ever find them.  Assuming that we want to keep
> information about these product families in the documentation at all,
> I'd think that we would want to have the online information as well.  So
> I'd replace these with wayback links, or else just leave them as they
> are so that sufficiently motivated people can look them up themselves...

The kirkwood processors are old, but they were used in NAS
devices. They tend to have a long life time, and people do put Debian
on them. Armada-38x is definitely still in use in NAS boxes.

If we can have working links, that would be great.

   Andrew
