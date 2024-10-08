Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCCB1E1033
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728405100; cv=none; b=YBSqxL1inr+Y1GwKY87hgDCwzCaM9sMQN/HQKkeDDaf1z7cCn6qaDGTD7RboivDcC0ZebaKMIIp5PQ3dH2gOA5ggbeqpxUdZB04xs8usTaEy4YXTRaZz5YGjWvQTuMcWZt5JXj9kDRI39imfOcVIcG0SlyArf2FBjAa21YE8nIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728405100; c=relaxed/simple;
	bh=b2txuzEUnlcJXCPBIFD8K+iRpoANzNONr/LFqpeCRlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcWF4jvxjv3rMnR4amOMU6sqNAjCrnjEgOPsEt0IJXbgzW7Eo0QzFt7D50kAwqOKuBWSc/EvWnX1I2g2tqFch+bsoKGO+z9eS+HV6GwFlnmNSH0koN71O2JiEpFC8leWTGkBxxK/xxCwXZchV6n2N83uPEpq7GosdlklhmkDvF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1syD7O-0000W4-8r; Tue, 08 Oct 2024 18:31:26 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1syD7N-000POf-2V; Tue, 08 Oct 2024 18:31:25 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1syD7M-000S6J-38;
	Tue, 08 Oct 2024 18:31:24 +0200
Date: Tue, 8 Oct 2024 18:31:24 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de
Subject: Re: [PATCH net-next 06/12] net: ethtool: Add PSE new port priority
 support feature
Message-ID: <ZwVeXPqUuv-xatgR@pengutronix.de>
References: <20241002-feature_poe_port_prio-v1-0-787054f74ed5@bootlin.com>
 <20241002-feature_poe_port_prio-v1-6-787054f74ed5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002-feature_poe_port_prio-v1-6-787054f74ed5@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Wed, Oct 02, 2024 at 06:28:02PM +0200, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
...
>  PSE_SET
>  =======
>  
> @@ -1849,6 +1859,8 @@ Request contents:
>    ``ETHTOOL_A_C33_PSE_ADMIN_CONTROL``        u32  Control PSE Admin state
>    ``ETHTOOL_A_C33_PSE_AVAIL_PWR_LIMIT``      u32  Control PoE PSE available
>                                                    power limit
> +  ``ETHTOOL_A_C33_PSE_PRIO``                 u32  Control priority of the
> +                                                  PoE PSE
>    ======================================  ======  =============================
>  
>  When set, the optional ``ETHTOOL_A_PODL_PSE_ADMIN_CONTROL`` attribute is used
> @@ -1871,6 +1883,10 @@ various existing products that document power consumption in watts rather than
>  classes. If power limit configuration based on classes is needed, the
>  conversion can be done in user space, for example by ethtool.
>  
> +When set, the optional ``ETHTOOL_A_C33_PSE_PRIO`` attributes is used to
> +control the C33 PSE priority. Allowed priority value are between zero
> +and the value of ``ETHTOOL_A_C33_PSE_PRIO_MAX`` attribute.
 
Please extend the documentation with expected system behavior: the
meaning of lowest and highest values, power up and shutdown behaviors,
etc.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
