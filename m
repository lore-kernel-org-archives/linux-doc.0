Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA8877D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Oct 2018 16:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbeJ0BIA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Oct 2018 21:08:00 -0400
Received: from mail.bootlin.com ([62.4.15.54]:50583 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727562AbeJ0BIA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Oct 2018 21:08:00 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 9887F2097B; Fri, 26 Oct 2018 18:30:15 +0200 (CEST)
Received: from bbrezillon (unknown [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id CCDA320954;
        Fri, 26 Oct 2018 18:30:04 +0200 (CEST)
Date:   Fri, 26 Oct 2018 18:30:04 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     vitor <vitor.soares@synopsys.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, <linux-i2c@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        "Cyprian Wronka" <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        "Rafal Ciepiela" <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        "Kumar Gala" <galak@codeaurora.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        <linux-gpio@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Przemyslaw Gaj <pgaj@cadence.com>,
        Peter Rosin <peda@axentia.se>,
        Mike Shettel <mshettel@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v10 0/9] Add the I3C subsystem
Message-ID: <20181026183004.4857ce73@bbrezillon>
In-Reply-To: <87738b8d-8033-9ef1-b0fb-059b64b0dc96@synopsys.com>
References: <20181026144333.12276-1-boris.brezillon@bootlin.com>
        <ad79f586-860e-bf57-9970-f58dc16d33b8@synopsys.com>
        <20181026181548.53228a4b@bbrezillon>
        <87738b8d-8033-9ef1-b0fb-059b64b0dc96@synopsys.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 26 Oct 2018 17:20:42 +0100
vitor <vitor.soares@synopsys.com> wrote:

> On 26/10/18 17:15, Boris Brezillon wrote:
> > On Fri, 26 Oct 2018 16:22:06 +0100
> > vitor <vitor.soares@synopsys.com> wrote:
> >  
> >> Can you update the i3c/next tree?  
> > Done.  
> 
> Thanks.
> 
> I will apply the driver and them I give you feedback.

Great! Note that the bug in the ->send_ccc_cmd() path should be fixed,
but you might have issues with i2c transfers as msg->buf is not
guaranteed to be aligned on 32-bit.

Don't know if you've followed the discussion with Arnd, but it seems
some (most?) archs are making sure writesl()/readsl() work for
unaligned bufs. Maybe we should fix that for ARC. The other solution is
to use i2c_get_dma_safe_msg_buf() to get something aligned on a
cache-line and by extension aligned on 32bits.
