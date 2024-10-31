Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A551474BF
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356469; cv=none; b=W+eekWT3zXl4/KGDUTyNbCO7UUX1wfK+q1F4A877zM1SoqlbpJlLu+eKJnVZpo2Au3oo7N67/mmPirjAN/V//qzPUaQ1+WyhydIi6q/95nNlN88eSkvAHueBy6BasMUiYaMG+dc7YZkVgdESTDryvIR8epsNg00vleMM22aXhMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356469; c=relaxed/simple;
	bh=4njA+Q5+6TPi7N+CKHvG07jR/tpZ3Gbh+CxPEC2W7mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AcCKbNrkRscSpBx5gnjCk2rdyU2UY0oZAeh1kXecCkAqsNHGwAnNibNmaRNzjHG2okHookl/ygBfxEcIlid2RbdD46uL+3sOA+xFAelqsek/rqqoM1pVIaNLm0NLhSPZ91rRFYd+s57ETtk4IXI6zmhWk3Vfw5I7ul73VuFJqrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1t6Ol2-0004MG-8Z; Thu, 31 Oct 2024 07:34:12 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1t6Ol1-001Jgr-0V;
	Thu, 31 Oct 2024 07:34:11 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1t6Ol1-0069ai-06;
	Thu, 31 Oct 2024 07:34:11 +0100
Date: Thu, 31 Oct 2024 07:34:11 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Rob Herring <robh@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH RFC net-next v2 08/18] net: pse-pd: Add support for
 reporting events
Message-ID: <ZyMk41yMuQqg286H@pengutronix.de>
References: <20241030-feature_poe_port_prio-v2-0-9559622ee47a@bootlin.com>
 <20241030-feature_poe_port_prio-v2-8-9559622ee47a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030-feature_poe_port_prio-v2-8-9559622ee47a@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Wed, Oct 30, 2024 at 05:53:10PM +0100, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> Add support for devm_pse_irq_helper() to register PSE interrupts. This aims
> to report events such as over-current or over-temperature conditions
> similarly to how the regulator API handles them but using a specific PSE
> ethtool netlink socket.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 

> +/**
> + * enum ethtool_c33_pse_events - event list of the C33 PSE controller.
> + * @ETHTOOL_C33_PSE_EVENT_OVER_CURRENT: PSE output current is too high.
> + * @ETHTOOL_C33_PSE_EVENT_OVER_TEMP: PSE in over temperature state.
> + */
> +
> +enum ethtool_c33_pse_events {
> +	ETHTOOL_C33_PSE_EVENT_OVER_CURRENT =	1 << 0,
> +	ETHTOOL_C33_PSE_EVENT_OVER_TEMP =	1 << 1,
> +};
> +

> +/* PSE NOTIFY */
> +enum {
> +	ETHTOOL_A_PSE_NTF_UNSPEC,
> +	ETHTOOL_A_PSE_NTF_HEADER,	/* nest - ETHTOOL_A_HEADER_* */
> +	ETHTOOL_A_C33_PSE_NTF_EVENTS,	/* u32 */
> +
> +	__ETHTOOL_A_PSE_NTF_CNT,
> +	ETHTOOL_A_PSE_NTF_MAX = (__ETHTOOL_A_PSE_NTF_CNT - 1)
 

This types are not part of IEEE 802.3 - 2022 specification. It will be
better to remove C33 prefix.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
