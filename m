Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D057188938
	for <linux-doc@vger.kernel.org>; Sun, 24 Nov 2024 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732441582; cv=none; b=ROw4qXFqnmZVeX1nmBQsmI0LiRTrygY74NcJ2K5DSQVtTIUmovpum+lVx1d40zZ2vxPdqkw2Bb7hTN4FVsBq60dUo3RIQcHoLTl4Wuhk5vQiwbTELNgA+CY6KBtKp69nJYaaElD6ON1MZ5NdnTAwCBYSgJrEpc5IOJfDHaAW9Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732441582; c=relaxed/simple;
	bh=5GU7qhaMTvf8fRlEAEVLODsQuOdk3sPR6jj5PV23Mp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Su0mdzWxbgSFIDB3YUcYkFIWweQjB59NbMqLAxGHItcsmwtgEiW3EesTNGOIATEHLaXcH1MoDT2v660VNTq8s45qlOWx5euj9RprUrCP4Q4ehbn9b0V5cV2p0u0rJ+h6j4stiorygTP0GpB38IDVDWU1drzHRmqjsSUwT4zHMsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tF9Bt-0005s8-Rx; Sun, 24 Nov 2024 10:46:05 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tF9Bt-002NCv-1i;
	Sun, 24 Nov 2024 10:46:05 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tF9Bt-00CgTk-1J;
	Sun, 24 Nov 2024 10:46:05 +0100
Date: Sun, 24 Nov 2024 10:46:05 +0100
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
Subject: Re: [PATCH RFC net-next v3 16/27] regulator: Add support for power
 budget description
Message-ID: <Z0L13SpD-xGhPQ10@pengutronix.de>
References: <20241121-feature_poe_port_prio-v3-0-83299fa6967c@bootlin.com>
 <20241121-feature_poe_port_prio-v3-16-83299fa6967c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241121-feature_poe_port_prio-v3-16-83299fa6967c@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Nov 21, 2024 at 03:42:42PM +0100, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> In preparation for future support of PSE port priority and power
> management, we need the power budget value of the power supply.
> This addition allows the regulator to track the available power
> capacity, which will be essential for prioritizing ports when
> making power allocation decisions.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> --- a/include/linux/regulator/machine.h
> +++ b/include/linux/regulator/machine.h
> @@ -113,6 +113,7 @@ struct notification_limit {
>   * @min_uA: Smallest current consumers may set.
>   * @max_uA: Largest current consumers may set.
>   * @ilim_uA: Maximum input current.
> + * @pw_budget: Power budget for the regulator in mW.
>   * @system_load: Load that isn't captured by any consumer requests.
>   *
>   * @over_curr_limits:		Limits for acting on over current.
> @@ -185,6 +186,7 @@ struct regulation_constraints {
>  	int max_uA;
>  	int ilim_uA;
>  
> +	int pw_budget;

Unit name is missing. Should be: pw_budget_mW or something like this.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
