Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E61624E9
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 03:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898270; cv=none; b=Mawtpn8pnk9A1VN9GtK1OvOKZyRXeyYfKDPz4KEFQRUW9vEGGpiPHjthIyPvxreZ1jMVNsopoCpTa40EeTyg/SbbirUz5hRWPpQot5Kn4gL/SsN0670z6LDBTmMkCLN1uGS/HPJiyOg2H0dWe0hKGOaeFiGagE//vLe+sv0LyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898270; c=relaxed/simple;
	bh=uvivVCMiOcxUCIpgv+1nEhxOGPfz3p2u4mzomXHP6kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I5MfSGLqd6wN5t8TOKd2B/uP25rh/W23toOJyllDk1MTe6TUBadQgnhzSlZrrrYlIv5KvKNrFKTY7oU7K7PQf/WP9eScXIaVoZusURRR1H5d8PWKYuqtwtl9r650vSRJ0k5wChpzHwtYbxm1veH2s4ekoXsTPqrMAk155cKhV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htv6afQ+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htv6afQ+"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54298ec925bso1952523e87.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 19:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738898266; x=1739503066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=;
        b=htv6afQ+VCXeagoXWB34SIiHR9O/0vWp54CANcvCWPC0izYRRmoXMkKaaBBk6qN4eZ
         oKZUaZF3+bI4XTF7gL9gIpBG5WJiZxarpPQ+uF2wkXRtjVW0FUbITCFwvKFO0uxTEt43
         sICFr+gR+FgshgmPlkxdyf6PnESn7CnVcn2d0RIuH5YTcHjTdoovcG3UKV8ZXs4KeGfN
         a+uKbEkF5xSV7Pa4Gdt+/IkVxaPQdxBT+aK8VUH7tJe2yPZYC/UVI9w1HZBMX/lqlRhm
         Ye4L+v3dxU3yal14rZtH+U1yho8byk4qvJ/m5lBeObwLyYRibMsWatjToKcooOqZ410c
         3VzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738898266; x=1739503066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17pakd/Znr7AQ717iCmCdIgifIQxR3pgh2Z0bF8TxTs=;
        b=EElEswY7LAi50BxGeZJH1BKW8IbI/YV0JIVswhqiB1JFwp47Je6PNFpb67mVai4XL/
         sJDdG6VyLuo+C1H39nwHHbTQmV0woOCMD5WdgiH4NSYGqHbEoJmlVNNtCFg550v0AxWo
         9BYspDvvouiW+ne6dXE6EgwuEUyqBOlwpeFXAJc6lF92sBleGUC++hm2+WqO6LnYg2/b
         89qdHVfnRbxH78RfMNNylqtlp4XUpIp5fFmZNgi+D07EEytcGPeJW4Mu/HI1tZy+6aQS
         NaHhCNaKSaBaptiEx3sB76tySM8DSHzptLvMLj832b47GteMOc40K2WlD/siDysShZkJ
         dR1w==
X-Forwarded-Encrypted: i=1; AJvYcCX00VDavxuEHH0QNXl+N+gFtVnn1mRN7WNdBwn8IvQPC3jh0BFD5KdYcFXu+DfrPArA0NP/albAB/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZ72Al1hyVMwKD5ovU5IPS+kAuOgulo3ol/kcbP80BeFQUq2b
	4D3A4aFLXLvxqE0fBzY8HBeO/D/8NReOEXtefuK08yVNAw5UKGL1OxvyLqHVkYs=
X-Gm-Gg: ASbGncuvOopRaJNBCxyPQoCmoxT+4aQS1qsxyL02scOIpJyiwcePl5jV58jF1ZbSsX+
	o/9lrIWa9DUSCES+iCazwZ2YE0uXVP1CNZlZ52kBlPE2kLlh07gf+3QeSs8/2+SFHZQwYTiH4zK
	IWiU5OnovtDLgeB7PzUrtc5IqB7lHmTHQ8SeIp0wzgVNbwzyaDmCLAnnbSFGxiX9/PXrToqNuNL
	F8Mc+TBrl6ayiktDpER+1pIbiBbzF1J0qA9xWyzdm4UybvdYAIDVvXCRI8ZQn8RGPx+UHTxzGw0
	COyl3yKNXX7rT0lVj/+cpl6gsSG8hKMjclBuSjIYWcut+mQWmzbGl7RIC9YSrSHj2epBcmM=
X-Google-Smtp-Source: AGHT+IGFRWR3LZSENTzR1jrQjMzeY7hexf5uTv34xRfQ9DibP0IYIH3nm+4A52IVjL038EoBPPmYtg==
X-Received: by 2002:a05:6512:2105:b0:53e:ca48:776e with SMTP id 2adb3069b0e04-54414b043d3mr248350e87.36.1738898266070;
        Thu, 06 Feb 2025 19:17:46 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54410603876sm310371e87.211.2025.02.06.19.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 19:17:44 -0800 (PST)
Date: Fri, 7 Feb 2025 05:17:43 +0200
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
Subject: Re: [PATCH v6 15/26] drm/bridge: devm_drm_of_get_bridge and
 drmm_of_get_bridge: automatically put the bridge
Message-ID: <w3qufv73ldzdcfuz6n3prx4di2dhoq2wfqmmvxvxkea6uqxkge@pjwmugvicsbt>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-15-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:30PM +0100, Luca Ceresoli wrote:
> Add a devm/drmm action to these functions so the bridge reference is
> dropped automatically when the caller is removed.

I think the get() should go to the underlying of_drm_bridge_find() function.

Also it really feels like it's an overkill to keep the wrappers. After
getting bridge being handled by the panel code would it be possible to
drop all of them? Then this patch might introduce one new devm_
function? Or are drmm_ functions actually being used to store data in
the drmm-managed memory?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f694b32ca59cb91c32846bc00b43360df41cc1ad..497ec06dfcb05ab5dee8ea5e8f1eafb9c2807612 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -33,6 +33,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>  
> @@ -1459,6 +1460,13 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
>  	return ret;
>  }
>  
> +static void devm_drm_bridge_put_void(void *data)
> +{
> +	struct drm_bridge *bridge = (struct drm_bridge *)data;
> +
> +	drm_bridge_put(bridge);
> +}
> +
>  /**
>   * devm_drm_of_get_bridge - Return next bridge in the chain
>   * @dev: device to tie the bridge lifetime to
> @@ -1469,6 +1477,10 @@ static int of_drm_find_bridge_by_endpoint(const struct device_node *np,
>   * Given a DT node's port and endpoint number, finds the connected node
>   * and returns the associated bridge if any.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by devres when @dev is removed.
> + *
>   * Returns a pointer to the bridge if successful, or an error pointer
>   * otherwise.
>   */
> @@ -1483,6 +1495,10 @@ struct drm_bridge *devm_drm_of_get_bridge(struct device *dev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> @@ -1497,6 +1513,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge);
>   * graph link search is not enough, e.g. for drivers that need to support
>   * panels described only as subnodes.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by devres when @dev is removed.
> + *
>   * RETURNS:
>   * A pointer to the bridge if successful, or an error pointer otherwise.
>   */
> @@ -1513,10 +1533,21 @@ struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
>  	if (!bridge)
>  		return ERR_PTR(-ENODEV);
>  
> +	ret = devm_add_action_or_reset(dev, devm_drm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
>  
> +static void drmm_bridge_put_void(struct drm_device *drm, void *ptr)
> +{
> +	struct drm_bridge *bridge = ptr;
> +
> +	drm_bridge_put(bridge);
> +}
> +
>  /**
>   * drmm_of_get_bridge - Return next bridge in the chain
>   * @drm: device to tie the bridge lifetime to
> @@ -1527,6 +1558,10 @@ EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
>   * Given a DT node's port and endpoint number, finds the connected node
>   * and returns the associated bridge if any.
>   *
> + * The refcount of the returned bridge is incremented, but the caller does
> + * not have to call drm_bridge_put() when done with the bridge. It will be
> + * done by drmm when @dev is removed.
> + *
>   * Returns a drmm managed pointer to the bridge if successful, or an error
>   * pointer otherwise.
>   */
> @@ -1541,6 +1576,10 @@ struct drm_bridge *drmm_of_get_bridge(struct drm_device *drm,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	ret = drmm_add_action_or_reset(drm, drmm_bridge_put_void, bridge);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	return bridge;
>  }
>  EXPORT_SYMBOL(drmm_of_get_bridge);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
