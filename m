Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DD23FE5D
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559583; cv=none; b=E7RV0o6lmAgxBsO1M/NoieJJ13Vb7czzWW/XXHc2pixoKIIEmbx6UmlXAJ8Di0ZW2C9yM72zI82+HcysWYfgQrcL724b9xhG3q05awFD0nZqC9DZePpsgs9nVEPgB4EICGD1CSrnDiCd+Np0/T6/l9qOCD3OYCJxRCpo7aYB03o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559583; c=relaxed/simple;
	bh=DSO4nKZfYc4IR1qnz1wjDII1n4yFyBJMYdZUfFC8Mh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=brpksqhNCmG9SGCjYVb/OtBnkGkS2Dmhilo0P181DZN8dLWFo0pK22/1rZmSCuvCE5HFc/jqRZRExcqGRqicl7cQ/M0FTy5fmPDSvjOexKQHp8bHhn7w/8hTEVsr/96HrU9v9g4TvZvjwjMQv0JA8oLz/NujbW5K8jDvLbb/FEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1rh8X9-0000Pk-8L; Mon, 04 Mar 2024 14:39:11 +0100
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1rh8X6-004MgH-Vs; Mon, 04 Mar 2024 14:39:08 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1rh8X6-001uJD-2q;
	Mon, 04 Mar 2024 14:39:08 +0100
Date: Mon, 4 Mar 2024 14:39:08 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	Dent Project <dentproject@linuxfoundation.org>
Subject: Re: [PATCH net-next v5 13/17] net: pse-pd: Use regulator framework
 within PSE framework
Message-ID: <ZeXO_NhXZQajGZPr@pengutronix.de>
References: <20240227-feature_poe-v5-0-28f0aa48246d@bootlin.com>
 <20240227-feature_poe-v5-13-28f0aa48246d@bootlin.com>
 <ZeObuKHkPN3tiWz_@pengutronix.de>
 <20240304102708.5bb5d95c@kmaincent-XPS-13-7390>
 <84b300c7-8295-424b-9117-c604fb4cd73e@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <84b300c7-8295-424b-9117-c604fb4cd73e@lunn.ch>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Mon, Mar 04, 2024 at 02:32:50PM +0100, Andrew Lunn wrote:
> > > > +	psec = dev_find_pse_control(&phy->mdio.dev);
> > > > +	if (IS_ERR(psec)) {
> > > > +		rc = PTR_ERR(psec);
> > > > +		goto unregister_phy;
> > > > +	}
> > > > +  
> > > 
> > > I do not think it is a good idea to make PSE controller depend on
> > > phy->mdio.dev. The only reason why we have fwnode_find_pse_control()
> > > here was the missing port abstraction.
> > 
> > I totally agree that having port abstraction would be more convenient.
> > Maxime Chevallier is currently working on this and will post it after his
> > multi-phy series get merged.
> > Meanwhile, we still need a device pointer for getting the regulator. The
> > phy->mdio.dev is the only one I can think of as a regulator consumer.
> > Another idea?
> 
> Sorry, i've not been keeping up...
> 
> Doesn't the device tree binding determine this? Where is the consumer
> in the tree?

The real consumer is outside of the system. Withing the system, it would
be the RJ45 port, but we have no abstraction for ports so far.

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
