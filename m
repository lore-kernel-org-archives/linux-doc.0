Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019B1B6541
	for <linux-doc@vger.kernel.org>; Fri,  3 Jan 2025 06:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735884030; cv=none; b=gc4N6v+VTcRxV2n6qNCKw7KzgMH119+x1TcCjZy7SIlRRlXACayNwQLK2CiTnmyTMYf9VqjbwClOIw14iI1O7PqpxYopuVw1j4bNeKsZ08LrXmCe0CerSJ2IgRd0C46bklyWF67MAM/6rcawGOLul+Dc+3YPpR/t4qkZ2UB5iQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735884030; c=relaxed/simple;
	bh=SUli/KZdb7oxyfsFAomAiAGF5GY//oxCRvgUklHLl5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsw9PaOlioaouJcFvovCUmAgtuiCMicR+lVEqOqlphXrUTV0hfdlzNjrG5KQ56Qw5UTsuDrQXZ3xmXVwHPnWlzTn46FAHISrHgVQDgsgyIF+u243LkyNqvBW4Lu1Yk3bS25p2zA0UUCi8YPN29obylAnVI/t6rhzOmMQb39rvQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F2Pwl2II; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2Pwl2II"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3043e84c687so105336791fa.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Jan 2025 22:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735884024; x=1736488824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqK1XsqQcMf7JAQsvOfW8bTjaqo69FlQkujpR6CdauY=;
        b=F2Pwl2IIZ96qWT/82sn+LMR0jRDBDYyLjimu6xWgmy+pvu9+SBu0BppceqlWCTXWrO
         r6I5NtCEMMAUuJe9NtB2EHqrW85Lgdvh2L7/3fg6dv2rihEswdzzE9HHBZdtP6jbYFqe
         30WEqo/hpwxeX2NM6KptXFngHkExCoLsKolbDMhaAP68/7je7+QQ5QP87yF0dfRvD7Ep
         CS+sg9SVyu0ewUwWCQELmUD0s41YrTK+LHggxalS5F248qqwMRrJRshUV4tNRCdiS2Ru
         YklREDNf434c6jiSwFFr4Of6iY8hs4WIWoYmdKnddo8yOCxLo/N8JKBmi3bJA3a0+cce
         4eFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735884024; x=1736488824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqK1XsqQcMf7JAQsvOfW8bTjaqo69FlQkujpR6CdauY=;
        b=DD2NPNuzCG4C8VOUo//4aBWcarh1QUE0Jg/Ue+Oml8eW+M4PJDN7sa1Tnu6HEdULH6
         BSpx6z1WTcQtRb5/+B/oGj9eCwbkzPwzmJhNntsksHYm5N8nkiTKHgOlqvddjPoSPjVp
         4GRrWOaodGTyo2f3DANFO4ypeBr8AYT7+zMkXkGq/ze82Wg6MtSJrfq8kxfbpltkj2Wn
         dQxF1GMlOtmmOejCWgjawSPROnvQJXhGTyc28dm3WHmEXX+K4zrGAVWMF9nSM0TSuOb8
         5N+xFfWi0sajTYSGZkJ3k3w24CPr0BT4sm8tShqmShGS5e8dltTx+D/InEyz2xLnE8WI
         O3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWzn2LzvKmq0neWQsq4JB0aFp7uiRfKa2z4qpg1lq8h8o3Gcpp3jaZuk23nhYqgY6fXAxgBzrlOlsM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEDRaEw43TPnKeTm/TAsIAINCUGXvAEmE/s0k4/n/xmFBeaEfd
	yaRYH5D5J1AB8St7O1LHnkEXGBHQXWMn7ddsBpNSz6ScxIAr7OCw8u2TfZqVB/A=
X-Gm-Gg: ASbGncvbnNCHSiyuio9MvZRea/7mQLHKXorGZCBdcjAtnCOGKUwdNcFHOiPi7PeYPoI
	wO7JG+g5wZ/HyeUZSRuSU1Qmixpc52J/zyNBAl2oq5/6L/0es/WIY6ThbXQJbotPOJ2cV8ZCdYE
	9YHEp7/S5RClLZRz37kHOXzgqPGAP1b1lMBpiqW/BRyYNneB6L2liS1IckXauumfZXZXXQzrdnV
	YDPLamxSEH9OV0NhhQsoEVjijDfQzzeNo7VIk3UqHHx68P1XRwXkYLkzc5xce8WUJclhOmCR//z
	CtSlqDVVNDGT3tBxwFMzyDftJ32z+sgyQp5Q
X-Google-Smtp-Source: AGHT+IH3zYz7xZW+csvvf2W9sWK96IbaBnbltSVrtk8mtykDTw+7RfmJJMifDYxJfyLUrNG0Fzxe5Q==
X-Received: by 2002:a05:6512:239b:b0:540:19d8:148f with SMTP id 2adb3069b0e04-5422954340emr16038660e87.32.1735884024223;
        Thu, 02 Jan 2025 22:00:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223821665sm4038439e87.177.2025.01.02.22.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:00:22 -0800 (PST)
Date: Fri, 3 Jan 2025 08:00:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <bfi7nfq5cy3wwc7i4oqqcqmd23g3ukfsqcky24axfumby357on@i2xnhpihyss4>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102130149.5784c09b@booty>

On Thu, Jan 02, 2025 at 01:01:49PM +0100, Luca Ceresoli wrote:
> Hi Dmitry,
> 
> On Tue, 31 Dec 2024 16:57:38 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> 
> > On Tue, Dec 31, 2024 at 11:40:02AM +0100, Luca Ceresoli wrote:
> > > Instead of using dsi->out_bridge during the bridge search process, use a
> > > temporary variable and assign dsi->out_bridge only on successful
> > > completion.
> > > 
> > > The main goal is to be able to drm_bridge_get() the out_bridge before
> > > setting it in dsi->out_bridge, which is done in a later commit. Setting
> > > dsi->out_bridge as in current code would leave a use-after-free window in
> > > case the bridge is deallocated by some other thread between
> > > 'dsi->out_bridge = devm_drm_panel_bridge_add()' and drm_bridge_get().  
> > 
> > I don't think that's how refcounting should work. Any of the functions
> > that give you the bridge should also increase refcount, requiring manual
> > _put() call afterwards. We might need a separate API for that.
> 
> You're perfectly right.
> 
> > > This change additionally avoids leaving an ERR_PTR value in dsi->out_bridge
> > > on failure. This is not necessarily a problem but it is not clean.
> > > 
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > 
> > > ---
> > > 
> > > This patch was added in v5.
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
> > >  1 file changed, 9 insertions(+), 6 deletions(-)
> > > 

[...]

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
> 
> > Then your patch might add a function
> > close to devm_drm_of_get_bridge() or drmm_of_get_bridge().
> 
> ...which would return a bridge pointer, with refcount already
> incremented. Sure, except I think it should _not_ be a drmm, as
> the bridge might itself disappear while the card keeps existing.

Feel free to add new one.

> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
With best wishes
Dmitry
