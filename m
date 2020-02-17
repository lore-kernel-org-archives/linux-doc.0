Return-Path: <SRS0=VB12=4F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8F3C34021
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 17:33:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78A4E20718
	for <linux-doc@archiver.kernel.org>; Mon, 17 Feb 2020 17:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XBHpzWP0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgBQRdv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Feb 2020 12:33:51 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:50414 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbgBQRdv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 Feb 2020 12:33:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=Xnyt33xissQJ4/7LokH7UuqI7OQY8KnfoUx9wM+8IQk=; b=XBHpzWP0Z8ERgkea2mcC8Qp9NJ
        d7sF7rxklLyXtf4oNMxKt+xuUcM6RpCMG9p9s+pXJbLatajMsedRICtVbt+l5neh59bPG0WyLSFnP
        Ay0pu10bQE2Gg6QFnxccqLi1j7m7zb5QSs0HDwqR675/El1gaOx4ucCn9BBKN0BOWy/w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1j3kGq-00065z-CV; Mon, 17 Feb 2020 18:33:24 +0100
Date:   Mon, 17 Feb 2020 18:33:24 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "David S. Miller" <davem@davemloft.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Ioana Radulescu <ruxandra.radulescu@nxp.com>,
        Jakub Kicinski <kuba@kernel.org>,
        John Crispin <john@phrozen.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jose Abreu <joabreu@synopsys.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>, netdev@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [CFT 0/8] rework phylink interface for split MAC/PCS support
Message-ID: <20200217173324.GI31084@lunn.ch>
References: <20200217172242.GZ25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200217172242.GZ25745@shell.armlinux.org.uk>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 17, 2020 at 05:22:43PM +0000, Russell King - ARM Linux admin wrote:
> Hi,
> 
> The following series changes the phylink interface to allow us to
> better support split MAC / MAC PCS setups.  The fundamental change
> required for this turns out to be quite simple.

Hi Russell

Do you have a branch i can pull and test?

Thanks
	Andrew
