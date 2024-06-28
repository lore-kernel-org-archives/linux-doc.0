Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C902A15747D
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 09:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719565608; cv=none; b=hki1tfhG/gSSZ1GjrVFfB+/iOlw8CZ17PZNrZVQwJ6+iXgcIWVY0BgILOcIs5sMNLO0vHI6TRPTkN7NphG83ou87mpH32Cox4429gXCBrOMRSmRwszoCiLN9om4fEL/YhMD9lqFIT1gvgngVYTnahYJw6vERLXIgB+zYvjUGVY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719565608; c=relaxed/simple;
	bh=x2ZqB4B9q5gkwgBjNmpKXr1taQ80Dqf0dI+xalcZrIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZOO9RkKZOXcPr47w0CR8kIaHUsRIl/z1McCkWz0hTfzVGldS0qRf2o57GVbvQpbT2m57CxMPkz0hn9h/xvKrQQ3mAYnhhjxpGVOEtseRZyrDO7l47XfNS6pgnVXzPBCVoiEKgx2HpARcj5Py6IuXTw35fjiLxSW7zYDSRm+ZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sN7Yu-00059T-UW; Fri, 28 Jun 2024 11:06:32 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sN7Yu-005ZR1-Aj; Fri, 28 Jun 2024 11:06:32 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sN7Yu-002PLU-0l;
	Fri, 28 Jun 2024 11:06:32 +0200
Date: Fri, 28 Jun 2024 11:06:32 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Dent Project <dentproject@linuxfoundation.org>,
	kernel@pengutronix.de, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 7/7] net: pse-pd: pd692x0: Enhance with new
 current limit and voltage read callbacks
Message-ID: <Zn59GOf9Avc49qGP@pengutronix.de>
References: <20240628-feature_poe_power_cap-v5-0-5e1375d3817a@bootlin.com>
 <20240628-feature_poe_power_cap-v5-7-5e1375d3817a@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240628-feature_poe_power_cap-v5-7-5e1375d3817a@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org

On Fri, Jun 28, 2024 at 10:32:00AM +0200, Kory Maincent wrote:
> From: Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
> 
> This patch expands PSE callbacks with newly introduced
> pi_get/set_current_limit() and pi_get_voltage() callback.
> It also add the power limit ranges description in the status returned.
> The only way to set ps692x0 port power limit is by configure the power
> class plus a small power supplement which maximum depends on each class.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
 
Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
