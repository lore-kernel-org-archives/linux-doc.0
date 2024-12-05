Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1084C1DF99A
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397253; cv=none; b=e4p76htrtV3Vwn7Q4Af2zpecsEOeAayr+zFayqamt8IM9zDRddZqck9JK1BjDE67/Q017fDKkPS9nFnv4ZlE6BfVOCXolp5/J6myxuJ7zHN13UjzdN5FPVO1cQ5cAZX1ZsztwfKdi4glfO1oDMgaZfH7zVykjw2xX2ojev7OIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397253; c=relaxed/simple;
	bh=3+xpRgcjCsuz/2mGkng/3o13JlvFt9F6+oJkb+OFlVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNZo8j/9OBfUcYUrmrZGPecmfS+JaeYGoTAU17FSCj5aherxoxLvXRb/tG3u0pam5CKs/1AxngOzC3LK96O9xhNrQgotvmB6Ogqmm+CswKU5zysy3vzh83BV6n83ZbHT+Y+PPCIj3kmrWrEVXo1vf+avTC7WCazZ7P1d96DtMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tJ9nw-0006Ic-Qg; Thu, 05 Dec 2024 12:13:56 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tJ9nv-001oZL-1N;
	Thu, 05 Dec 2024 12:13:56 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tJ9nw-00GR6P-0H;
	Thu, 05 Dec 2024 12:13:56 +0100
Date: Thu, 5 Dec 2024 12:13:56 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: David Laight <David.Laight@aculab.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v1 3/7] phy: replace bitwise flag definitions
 with BIT() macro
Message-ID: <Z1GK9Aklzs-a2oPQ@pengutronix.de>
References: <20241203075622.2452169-1-o.rempel@pengutronix.de>
 <20241203075622.2452169-4-o.rempel@pengutronix.de>
 <5fbf293df6bf4bf79f9a8ffd728c6e2c@AcuMS.aculab.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5fbf293df6bf4bf79f9a8ffd728c6e2c@AcuMS.aculab.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Dec 05, 2024 at 02:50:32AM +0000, David Laight wrote:
> From: Oleksij Rempel
> > Sent: 03 December 2024 07:56
> > 
> > Convert the PHY flag definitions to use the BIT() macro instead of
> > hexadecimal values. This improves readability and maintainability.
> > 
> > No functional changes are introduced by this modification.
> 
> Are you absolutely sure.
> You are changing the type of the constants from 'signed int' to
> 'unsigned long' and that can easily have unexpected consequences.
> Especially since MDIO_DEVICE_IS_PHY was negative.

In current kernel code following flags are assigned to u32 variable: 

> > -#define PHY_IS_INTERNAL		0x00000001
> > -#define PHY_RST_AFTER_CLK_EN	0x00000002
> > -#define PHY_POLL_CABLE_TEST	0x00000004
> > -#define PHY_ALWAYS_CALL_SUSPEND	0x00000008

phydrv->flags (u32)

This one is assigned to an int:
> > -#define MDIO_DEVICE_IS_PHY	0x80000000

mdiodrv->flags (int)

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
