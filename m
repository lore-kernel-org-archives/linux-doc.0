Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A338205503
	for <linux-doc@vger.kernel.org>; Mon, 16 Dec 2024 12:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734351638; cv=none; b=P1KEGzlSOTR3uy7/tDmqBlGhFA5vSITQC0wDnLQ1gMj09lWKb9pL/p2oeSVPJt00YcsEHpQCj3ybn/wd1Itt8rS0Njnya/yRPku4vsH1UF+nC/E6k3wxR4yWqi7FFcWEhNjdiFu0CFzD599XsJsELKZQxzWynCU9H6lnb4oRk6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734351638; c=relaxed/simple;
	bh=+1mE4Amh1vSqq4XSBGGaKD1SEheJUziTYiTujI51/T4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0Qe3GR7ZQY7uQmvz2qVqvil4IFa+8zUW2CDIHiQ24zUP/6Eoo2kChQ8287C1+/wuFYVc5c5hc6l8l/0ej2xNA5rZpkO70EJHC1ZCZDtOg9sQMRMXysYENcqAOg/KJ58uDO270B0xrGFrFCMSOYXimHWu4FUvhkdFEWHOcxckCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1tNA5H-0003o0-03; Mon, 16 Dec 2024 13:20:23 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tNA5F-003h3M-1D;
	Mon, 16 Dec 2024 13:20:22 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1tNA5G-002ars-07;
	Mon, 16 Dec 2024 13:20:22 +0100
Date: Mon, 16 Dec 2024 13:20:22 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, kernel@pengutronix.de,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v1 1/1] net: phy: Move callback comments from
 struct to kernel-doc section
Message-ID: <Z2AbBilPf2JRXNzH@pengutronix.de>
References: <20241206113952.406311-1-o.rempel@pengutronix.de>
 <e6a812ba-b7ea-4f8a-8bdd-1306921c318f@redhat.com>
 <Z1hJ4Wopr_4BJzan@shell.armlinux.org.uk>
 <20241210063704.09c0ac8a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241210063704.09c0ac8a@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

Hi Jakub,

On Tue, Dec 10, 2024 at 06:37:04AM -0800, Jakub Kicinski wrote:
> > I certainly can't help but write the "returns" statement in natural
> > English, rather than kernel-doc "Returns:" style as can be seen from
> > my recent patches that have been merged. "Returns" without a colon is
> > just way more natural when writing documentation.
> > 
> > IMHO, kernel-doc has made a wrong decision by requiring the colon.
> 
> For the patch under consideration, however, I think _some_ attempt 
> to make fully documenting callbacks inline possible needs to be made :(

Please rephrase, I do not understand.

Should I resend this patch with corrected "Return:" description, or
continue with inlined comments withing the struct and drop this patch?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
