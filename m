Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C30226170
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 13:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734615246; cv=none; b=VhXNV7HVTE9OSDHOIBOf4UyMoFqP8PZCmQnP0jB5SJmcsQJS7zBuUYc5lb1/Osk0iriVlePAtuNNEXAq+4EHfS82As/y3K6icCUM73JAWX1zVoXhSfytvD9DtIBA+whLkX+U/HEiiXtU579YvPrUgAGr/UAyqiDH3qFWst+So5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734615246; c=relaxed/simple;
	bh=sEPpnFbVj9nVo2DhV9//qRIgI7pslulkckxcHYMDhUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLlQ1iEolZILIueVm2nhKG6Rq6LnHL22FNMd7k3s21nqJsPC0e7cqOQIJknabrgkgiy4YdwlmkRPNGwH7Y4q+LCji8hMdw3ckOFJ7BDfZQYJbNqoM8El93HQCcsCr/NoqRGoZYGgKa1srB7jjXq/T9gG3IdVx3wyZZFCsiaOwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tOGf2-0003uW-Bp; Thu, 19 Dec 2024 14:33:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOGf1-004DEi-0Y;
	Thu, 19 Dec 2024 14:33:51 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tOGf1-008TTV-2h;
	Thu, 19 Dec 2024 14:33:51 +0100
Date: Thu, 19 Dec 2024 14:33:51 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v2 5/8] net: phy: introduce optional polling
 interface for PHY statistics
Message-ID: <Z2Qgv-AqKJONvJWu@pengutronix.de>
References: <20241219132534.725051-1-o.rempel@pengutronix.de>
 <20241219132534.725051-6-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219132534.725051-6-o.rempel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Thu, Dec 19, 2024 at 02:25:31PM +0100, Oleksij Rempel wrote:
> Add an optional polling interface for PHY statistics to simplify driver
> implementation. Drivers can request the PHYlib to handle the polling
> task by explicitly setting the `PHY_POLL_STATS` flag in their driver
> configuration.

The commit message is out of date. PHY_POLL_STATS should be removed.

> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v2:
> - drop PHY_POLL_STATS
> - add function comments
> ---
>  drivers/net/phy/phy.c | 20 ++++++++++++++++++++
>  include/linux/phy.h   | 21 +++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
> index 107a35f402b3..7f6d304105f5 100644
> --- a/drivers/net/phy/phy.c
> +++ b/drivers/net/phy/phy.c
> @@ -1442,6 +1442,23 @@ static int phy_enable_interrupts(struct phy_device *phydev)
>  	return phy_config_interrupt(phydev, PHY_INTERRUPT_ENABLED);
>  }
>  
> +/**
> + * phy_update_stats - Update PHY device statistics if supported.
> + * @phydev: Pointer to the PHY device structure.
> + *
> + * If the PHY driver provides an update_stats callback, this function
> + * invokes it to update the PHY statistics. If not, it returns 0.
> + *
> + * Return: 0 on success, or a negative error code if the callback fails.
> + */
> +static int phy_update_stats(struct phy_device *phydev)
> +{
> +	if (!phydev->drv->update_stats)
> +		return 0;
> +
> +	return phydev->drv->update_stats(phydev);
> +}
> +
>  /**
>   * phy_request_interrupt - request and enable interrupt for a PHY device
>   * @phydev: target phy_device struct
> @@ -1511,6 +1528,9 @@ static enum phy_state_work _phy_state_machine(struct phy_device *phydev)
>  	case PHY_RUNNING:
>  		err = phy_check_link_status(phydev);
>  		func = &phy_check_link_status;
> +
> +		if (!err)
> +			err = phy_update_stats(phydev);
>  		break;
>  	case PHY_CABLETEST:
>  		err = phydev->drv->cable_test_get_status(phydev, &finished);
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index e1554ac16ce2..b3e4a164bfb7 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -1180,6 +1180,24 @@ struct phy_driver {
>  	 */
>  	void (*get_link_stats)(struct phy_device *dev,
>  			       struct ethtool_link_ext_stats *link_stats);
> +
> +	/**
> +	 * update_stats - Trigger periodic statistics updates.
> +	 * @dev: The PHY device for which statistics updates are triggered.
> +	 *
> +	 * Periodically gathers statistics from the PHY device to update locally
> +	 * maintained 64-bit counters. This is necessary for PHYs that implement
> +	 * reduced-width counters (e.g., 16-bit or 32-bit) which can overflow
> +	 * more frequently compared to 64-bit counters. By invoking this
> +	 * callback, drivers can fetch the current counter values, handle
> +	 * overflow detection, and accumulate the results into local 64-bit
> +	 * counters for accurate reporting through the `get_phy_stats` and
> +	 * `get_link_stats` interfaces.
> +	 *
> +	 * Return: 0 on success or a negative error code on failure.
> +	 */
> +	int (*update_stats)(struct phy_device *dev);
> +
>  	/** @get_sset_count: Number of statistic counters */
>  	int (*get_sset_count)(struct phy_device *dev);
>  	/** @get_strings: Names of the statistic counters */
> @@ -1670,6 +1688,9 @@ static inline bool phy_polling_mode(struct phy_device *phydev)
>  		if (phydev->drv->flags & PHY_POLL_CABLE_TEST)
>  			return true;
>  
> +	if (phydev->drv->update_stats)
> +		return true;
> +
>  	return phydev->irq == PHY_POLL;
>  }
>  
> -- 
> 2.39.5
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
