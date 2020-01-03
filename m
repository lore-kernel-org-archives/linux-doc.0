Return-Path: <SRS0=LeVL=2Y=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467F9C2D0C2
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jan 2020 16:47:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 130272072C
	for <linux-doc@archiver.kernel.org>; Fri,  3 Jan 2020 16:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="c/P6DUyJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgACQrz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Jan 2020 11:47:55 -0500
Received: from vps0.lunn.ch ([185.16.172.187]:46676 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727912AbgACQrz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 3 Jan 2020 11:47:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=3aXMrkKOicDj+Xuhu+/Su5Nn/ZXQ5Fj+Ba8BuVhIHPM=; b=c/P6DUyJpiXqEFuUsQDWvUAvNq
        wDWDRHf3kxb7xSqfWA0JA651XgVAxlOtKPsYrsCX41CTqh6H+nZeZap7kBMdkcoW/awOhLFVPbHag
        AjIJa2TcLIh4X8ln1JWj5vbbY2fD+CmtgCMD/lYRZjbu6ZvkYQQOK4Xec0i/s/8YeTwA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1inQ6z-0000BO-Cj; Fri, 03 Jan 2020 17:47:45 +0100
Date:   Fri, 3 Jan 2020 17:47:45 +0100
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
Message-ID: <20200103164745.GL1397@lunn.ch>
References: <20200103115125.GC25745@shell.armlinux.org.uk>
 <DB8PR04MB698593C7DB07A82577562348EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
 <20200103141743.GC22988@lunn.ch>
 <DB8PR04MB698518D97251CB15938279C3EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB8PR04MB698518D97251CB15938279C3EC230@DB8PR04MB6985.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> And here is a LS1046A SoC document that describes XFI and 10GBASE_KR:
> 
> https://www.mouser.com/pdfdocs/LS1046A.pdf

I don't see any register descriptions here. So you failed to answer my
question. What do you actually need to configure? What needs to go
into DT? 

You keep avoiding the questions Russell and I pose, which is not
helping your argument. We need details, not hand waiving.

	Andrew
