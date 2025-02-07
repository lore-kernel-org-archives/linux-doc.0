Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1073610E9
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896568; cv=none; b=mtionV4f0hWss6IbUlEF3++3Vm2KYNEvVsfpDlt64UoB4fOsX52Rl4Pl68IoWAROLcS2TMJPVCsWoaINS6nGTERsXfjClbko+9LmlXY4GQrTgIAlEVwHIRGNRDZPIqlB1uUK1R8h9CvVSqqg719BW7Aph/Q73sdHBDMujff0rWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896568; c=relaxed/simple;
	bh=z+3SwErCQCLpR/cq6xUmSY+6RvMLMGu6uTKAf+5gJfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7snF6tNqVnr4mE3DIYF8Ofc6zCI0RsLQAuLO9V00Pg35pp/84+/Q9QlL12DLZ0IsBDO9dW3+/bgWcrfMMlt/bEPRJV3MUwBDzLaEIQQSWZTO6tYiMoPCjjV5FtBt1gkUoEuAf7jIYluJPr/WuFt9tRD0AZXpiMZftDAYa4YpdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X2EjD8BT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X2EjD8BT"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54025432becso1621933e87.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896565; x=1739501365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
        b=X2EjD8BT5DuHplKeAdGLI6jeC3j6Q3FLAGL/7rX9QrOFhds3q0p3eR1nu4yTHDPnrU
         seDVokBEa2LTnzm7s7O/xbh9D41vCYg/asXTMbZ/pG1cSDbpjPq4sg3B7joQnY+yABOQ
         nUQFv6k9yr26+P4WZHeDqSgjUR9MphLJPx5o7KYgDyx/Ztc/YgOR3k3ddw6yvAemAd6D
         W9ruXL7eDjRxvLDOR7KH+0dhW+w6ZqWpZiGA/oceVkbNMGODO8ii2ySlEh1Erfa2t7k+
         iWR+ePRJHqJroYnVx1oPsiAu5MAcrns3g1bC3eqJTtEfKoOa8hLE3Kv/pC5VnGukAVSb
         zKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896565; x=1739501365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1QxMKnddA91WCGvSvK0Kv8+Ui7raPxM47ZCxWA1T70=;
        b=SPXBahUV9eDdgsb/epm2qWD3YKLtonffGmn4i3UT5wBaNy3B+oVn4JVY202G/dKp7Q
         AMOks/Xgkc+pv/h/Plyc0txdnx0yxgCbkKo7OvZcuykN4DYmCxx1bxq6OMNMEvmWltN0
         mv4UQ9l4g1ZgDMk+1TVwMbSs+BkugOCnOoCKOfYUSp77y9a3VnVK2S82rVcF+vTCqyUV
         VQoHiNlEeYylVJbssJnQBebf+t9BBjluvPSik8Mg9rjC/+5/5ze5DfA9/vpt9QNPdOYQ
         sDp/L04v7a5qmZWwYppS4jVJcQTaqySUskZ3k85vitnjyZsuluvyW8x7jiehwTsosAX2
         CNgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE8DwYYYGkvKq77VWlGXzDKvHTB0Pu73FBzXkncGXFEikOau9lr0Kgg/4JIgVEuZdXH9Dkl2nuAwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLt0Q72j52u5BR2azLwcS8u4lP424a82HqjH3/40Kp+/Z/ov0j
	273rhsqLu7KCoaymGDgkFm/X+Y/LBoKb9lxFwwaPSp0oEV0jyauRvb20FypKnbo=
X-Gm-Gg: ASbGncvc5X84mbJujYaIL6Vuw6mzfR1T5fnP1oeFeHiNHWAcetDJ9l4fRPuA7SzqNYv
	nSROZ7mns6yofJaFfhwyQ9tindDmGn5ODRgysz7IsnUuOxQ2qNU5PioncpBShd18zkfI96t0yDk
	Pk3uNtkIUb5SZ6sqvjNzL7YugrElig6ySb3TWGp9a2HKyjvhTpSLXEXYCA2amchUXf6WY/PT9wi
	tX7oihZStO6uIyS896sYSkAIGsZXJHxjei5GRKJL9LWpHOpwF6e6BNpXIvFRg9KvDO4hru8aYvb
	H/oYo8rQrF33I7hSupK41whEfkw9JQp5OaRv5dO73GwUnPlOlwtqX8jFWd10UR0XiztViDE=
X-Google-Smtp-Source: AGHT+IFTPGY2nzRLHllSo8hDFl+TxXnd4EtAypxnHw3YEBN2TqXVdM1x8iFz55a0HF67J/9VnE7uOQ==
X-Received: by 2002:a05:6512:70e:b0:540:1e17:10d2 with SMTP id 2adb3069b0e04-54414ae5f0amr254436e87.49.1738896565019;
        Thu, 06 Feb 2025 18:49:25 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed63sm300364e87.41.2025.02.06.18.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:49:23 -0800 (PST)
Date: Fri, 7 Feb 2025 04:49:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	=?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <iucfx6tewwazxnonivajmdqqaexdfn6izwxwlv2l5t3256uwfy@sp4cm5eifdt3>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> Adding a panel does currently not add a panel_bridge wrapping it. Usually
> the panel_bridge creation happens when some other driver (e.g. the previous
> bridge or the encoder) calls *_of_get_bridge() and the following element in
> the pipeline is a panel.
> 
> This has some drawbacks:
> 
>  * the panel_bridge is not created in the context of the driver of the
>    underlying physical device (the panel driver), but of some other driver
>  * that "other driver" is not aware of whether the returned drm_bridge
>    pointer is a panel_bridge created on the fly, a pre-existing
>    panel_bridge or a non-panel bridge
>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>    but the "other driver" doesn't know whether this is needed because it
>    doesn't know whether it has created a panel_bridge or not
> 
> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some later point. However with the
> upcoming implementation of dynamic bridge lifetime this will get more
> complicated.
> 
> Correct removal of a panel_bridge might possibly be obtained by adding more
> devm/drmm technology to have it freed correctly at all times. However this
> would add more complexity and not help making lifetime more understandable.
> 
> Use a different approach instead: always create a panel_bridge with a
> drm_panel, thus matching the lifetime of the drm_panel and the panel_bridge
> wrapping it. This makes lifetime much more straightforward to understand
> and to further develop on.
> 
> With the panel_bridge always created, the functions to get a bridge
> [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> the bridge they are looking for exists already (if it can exist at all). In
> turn, this is implemented based on a variant of
> drm_of_find_panel_or_bridge() that only looks for panels:
> of_drm_find_bridge_by_endpoint(). In the future
> drm_of_find_panel_or_bridge() can be progressively removed because there
> will never be a panel not exposing a bridge.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---------
>  include/drm/drm_panel.h        |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
> 

LGTM, minor issue below.

> @@ -1018,6 +1067,11 @@ struct drm_bridge *devm_drm_panel_bridge_add_typed(struct device *dev,
>  {
>  	struct drm_bridge **ptr, *bridge;
>  
> +	if (panel->bridge) {
> +		DRM_DEBUG("panel %s: returning existing bridge=%p", dev_name(dev), panel->bridge);
> +		return panel->bridge;
> +	}

Shouldn't the rest of the function also be removed as you do in other
cases?

> +
>  	ptr = devres_alloc(devm_drm_panel_bridge_release, sizeof(*ptr),
>  			   GFP_KERNEL);
>  	if (!ptr)

-- 
With best wishes
Dmitry
