Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9A1A9B42;
	Thu,  2 Jan 2025 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735819327; cv=none; b=Y/Kbz/AaQWPn2RLwKK1QA1rrO+mDY7RNnGJxkSlerf8g+x/q1xbh0drfZLmYVH334HBlhB8Twva9uA2XpELlr4IRtO/cQnupfU9CQNEIBQIBcsLSTeURgoFn/XF5KWSSonrpG6qqsU5cCylxjmPcp4qrAEItXhYGVXF5okMV4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735819327; c=relaxed/simple;
	bh=MijEs1bifQklOQEIUkLl8tX6HgDkhZGGiDoA9jvrXsI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XqvnnYNj6VHGY9blwJMe7XOWGwhHJM3IA6N2DN7PUQ5TCf5TWX4pWifSfWVi/BcIUKyW6GRNaPvFVSpJ5CB9Nt1gGOnbfOBSm7qWKzAm5/NeNKyPXUstLbHj11D9mSTqKdNj07RUnLYKccm+sVPZRXK58nzbDBpQ5ZvuM3p13gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VZMv9sFZ; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VZMv9sFZ"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74A80C0006;
	Thu,  2 Jan 2025 12:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735819313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l/nqKhWO7A6S4WQTD61j9G9fNNTD8xcK3+bormyiQts=;
	b=VZMv9sFZ7XK+7y287BWsSg+kOri8oPNuH7lyoqvT0+2UdJ1uv74qDR3YfD1IlPAkeCLWXs
	vCYPGFGFeBU94JNn5h0oINZ7IbHv8kWyJHCbvoRQylWjEnSLTBM+x77IKt9R/VAQhXgb33
	laibHnEl0eyr0nusoqkGFPO5QiSb0xMaKZKCVtHxJ0o7trmeJZLpYO76ImLNkJvTTvVvMg
	lRA9GUxs+/P0S6Op48MIKLnTB/gy7cJxt7U5M1GIQqIZCBi7ZEvo3IH6whNzVVZP+vSmIa
	Q11193T/YhDWPWY1gpMcDyLB7M8s5Y5rCHB/me0oNOPEQufrWGWpN1A4oEpAoA==
Date: Thu, 2 Jan 2025 13:01:49 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <20250102130149.5784c09b@booty>
In-Reply-To: <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
	<7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Dmitry,

On Tue, 31 Dec 2024 16:57:38 +0200
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> On Tue, Dec 31, 2024 at 11:40:02AM +0100, Luca Ceresoli wrote:
> > Instead of using dsi->out_bridge during the bridge search process, use a
> > temporary variable and assign dsi->out_bridge only on successful
> > completion.
> > 
> > The main goal is to be able to drm_bridge_get() the out_bridge before
> > setting it in dsi->out_bridge, which is done in a later commit. Setting
> > dsi->out_bridge as in current code would leave a use-after-free window in
> > case the bridge is deallocated by some other thread between
> > 'dsi->out_bridge = devm_drm_panel_bridge_add()' and drm_bridge_get().  
> 
> I don't think that's how refcounting should work. Any of the functions
> that give you the bridge should also increase refcount, requiring manual
> _put() call afterwards. We might need a separate API for that.

You're perfectly right.

> > This change additionally avoids leaving an ERR_PTR value in dsi->out_bridge
> > on failure. This is not necessarily a problem but it is not clean.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > This patch was added in v5.
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> >  	struct device *dev = dsi->dev;
> >  	struct device_node *np = dev->of_node;
> >  	struct device_node *remote;
> > +	struct drm_bridge *out_bridge;
> >  	struct drm_panel *panel;
> >  	int ret;
> >  
> > @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> >  
> >  	panel = of_drm_find_panel(remote);
> >  	if (!IS_ERR(panel)) {
> > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
> >  	} else {
> > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > -		if (!dsi->out_bridge)
> > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > +		out_bridge = of_drm_find_bridge(remote);
> > +		if (!out_bridge)
> > +			out_bridge = ERR_PTR(-EINVAL);
> >  	}  
> 
> While looking at this patch, I think we should migrate the driver to
> drm_of_find_panel_or_bridge().

Indeed, the code here is duplicating drm_of_find_panel_or_bridge(). I'm
going to convert it.

> Then your patch might add a function
> close to devm_drm_of_get_bridge() or drmm_of_get_bridge().

...which would return a bridge pointer, with refcount already
incremented. Sure, except I think it should _not_ be a drmm, as
the bridge might itself disappear while the card keeps existing.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
