Return-Path: <SRS0=LeVL=2Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8140AC2D0C2
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jan 2020 14:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 49D0F217F4
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jan 2020 14:17:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="w+U8h2Nm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgACORy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jan 2020 09:17:54 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:46546 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727523AbgACORx (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 Jan 2020 09:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=SPSoKaVWvvfOmi0iWxF8OTB5u3tMvNZWBpDZy5pArsw=; b=w+U8h2NmPqJUSto7bxoXcsRufT
        /1hIhKGWL/t/JVAD/9mVUNzRGe5KfY5ET5CZ9FwIOgZLUE4rUzB6WRb3qwJe5biCwWDZgGeuUaygK
        1FnauURFWaoTB9yOvUDEtHy4MDLsZfOj91aEbax511bFa3GvwLSxptfy33fHO2+YnfbI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1inNln-0006of-Np; Fri, 03 Jan 2020 15:17:43 +0100
Date:   Fri, 3 Jan 2020 15:17:43 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     "Madalin Bucur (OSS)" <madalin.bucur@oss.nxp.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next 0/2] Fix 10G PHY interface types
Message-ID: <20200103141743.GC22988@lunn.ch>
References: <20200103115125.GC25745@shell.armlinux.org.uk>
 <DB8PR04MB698593C7DB07A82577562348EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB698593C7DB07A82577562348EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Describing the actual interface at chip to chip level (RGMII, SGMII, XAUI,
> XFI, etc.). This may be incomplete for people trying to configure their HW
> that supports multiple modes (reminder - device trees describe HW, they do
> not configure SW). More details would be required and the list would be...
> eclectic.

Hi Madalin

Please forget the existing DT binding for the moment. Please describe
what values you need to program into your hardware to make it
work. Please don't use the existing DT naming when describing what you
need. Maybe use the terms from the reference manual?

Once we have a list, we can figure out what could be generic, what
could be vendor specific, and how to describe it in ACPI, DT, etc.

At LPC 2019, Claudiu and Vladimir talked about wanting to describe the
eye configuration for some hardware. It would be interesting if there
is any overlap. Aquantia also have some values used to configure the
SERDES of their PHYs. I think this is a board specific binary blob
which is loaded into the PHY as part of the firmware. That then limits
their firmware to a specific board, which is not so nice. But does
that also indicate that how the MAC is configured might also depend on
how the PHY configures its electrical properties?

    Andrew
