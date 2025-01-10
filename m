Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4C8204F78;
	Fri, 10 Jan 2025 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506713; cv=none; b=E4EtPymy1M5XsDxkmrC3N0Gk+ENQlOU0+kO4sIMctf37xmMdFT19OOQ6XDnaE58JIUWv0izlyi0CZJ/l1KehuCViEQYm+QzPz+YIbG3ByqgiJltC7oDhF7REztkGZm/pZFUBofgY/mPHj1AxT0SBLn72XOUhtKd6LvUiDCkt6xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506713; c=relaxed/simple;
	bh=7sgbvjoq+l8CcDrnbHruJJ/K/9vuaiQN2XqOaBbLuxs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hy+eSTtK5xLHWHpTt0u3mQn51Ikq/wEmcHO3QWYtaMsYcIQb8feSQCVqIYBA1vLRD5G5RLnO89YJq6EVe6hwYIUkTipYS1UsXZk+0aDz7TFpg8BJdsTJk0VB1kq+IrHnnH9ASTxNUmAKXoLpfO67+Pf4HyFn3E/H5caH6ZlQ9Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mfDiYJXu; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mfDiYJXu"
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCD341C0005;
	Fri, 10 Jan 2025 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736506707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iP0T2q4tU7B7N3TVY1oYdB+gv51bfdkKfL8uFYzMvBU=;
	b=mfDiYJXuc4O4Dw9f4EtCAg5t4sVt2sC6nStKLOKhTJtkwamhqfFEHeqLMuipKfNVdWRIVo
	R1FLIbP1pSbS9NBOnjbIyHubUclEyvA+RRKg9/RFvCiDmJ+t3biMVKdJyD0sw2VZRypJ7x
	NzBFfAMWWFlgQ6d7v9iPqagyb1C4i2XNU6IDdkxnTFG8VjXbbxDexXRvuAaSIS3blTS966
	Jnw4wK9ZjGKluQv0nUbeM3I0vG5Qb+JRoqqtGMB0Lc9rGOfPeZUJ9GSkHiwtUf8vPZVgoC
	J69IEJDPNwOLu5c1/q7o1s7cwol0oFTK5uwJynkj3YHMAVRGgyB/kUYltbsruQ==
Date: Fri, 10 Jan 2025 11:58:19 +0100
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
Message-ID: <20250110115819.55bc887b@booty>
In-Reply-To: <20250102130149.5784c09b@booty>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
	<20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
	<7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
	<20250102130149.5784c09b@booty>
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

On Thu, 2 Jan 2025 13:01:49 +0100
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > >  	struct device *dev = dsi->dev;
> > >  	struct device_node *np = dev->of_node;
> > >  	struct device_node *remote;
> > > +	struct drm_bridge *out_bridge;
> > >  	struct drm_panel *panel;
> > >  	int ret;
> > >  
> > > @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > >  
> > >  	panel = of_drm_find_panel(remote);
> > >  	if (!IS_ERR(panel)) {
> > > -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > > +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > >  	} else {
> > > -		dsi->out_bridge = of_drm_find_bridge(remote);
> > > -		if (!dsi->out_bridge)
> > > -			dsi->out_bridge = ERR_PTR(-EINVAL);
> > > +		out_bridge = of_drm_find_bridge(remote);
> > > +		if (!out_bridge)
> > > +			out_bridge = ERR_PTR(-EINVAL);
> > >  	}    
> > 
> > While looking at this patch, I think we should migrate the driver to
> > drm_of_find_panel_or_bridge().  
> 
> Indeed, the code here is duplicating drm_of_find_panel_or_bridge(). I'm
> going to convert it.

Or maybe not. A similar work has been attempted in the past [0] and
then reverted. There are many subtleties one would need to take care of
before getting this right, I don't think opening this other can of
worms in the middle of the bridge refcounting work makes sense.

[0] https://patchwork.freedesktop.org/patch/482751/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
