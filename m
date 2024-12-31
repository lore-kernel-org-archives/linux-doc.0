Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E842D052
	for <linux-doc@vger.kernel.org>; Tue, 31 Dec 2024 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735657108; cv=none; b=aF3u7qeScg43gzNoNQ8udXhcZV7Fy+2ZgMfRYMrSpQ/Lv7Dp+OowGpNgx7bq//U+7noNUhL/JF6LyugU6phbctz7MBUpe8ebanJsPkIiHcUzSrDYmz7kV+qgaWM6dn0Z3q7RIL9E/hci6udyOYDvLFtzNmiQaKcm6Rc3CZceYNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735657108; c=relaxed/simple;
	bh=FUJucZqs+OYzrj97jXUSlmNly95SgLMdAITiNIsVk8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deBLzlVYguCkMiV2mpJPJ9QuF4t0OuXUTrBBGQxx0S5czXil7g7OfWBzUurNEvZ2iU8RTuOhUIg5tg3Fh1NTMAc3h3Zr4bMNeYy1kQP4pZ/on779VEvxweq+pX4szrXVynze/5uKIW/1kKvK8tAkkw0lZ+4G5hInlSvttFRFZrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p9M5dst7; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9M5dst7"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffa49f623cso129782341fa.1
        for <linux-doc@vger.kernel.org>; Tue, 31 Dec 2024 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735657105; x=1736261905; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wSbYedxgsZDo1h/bnCTgqN5CKNk8NG3PCiX/15LxWXU=;
        b=p9M5dst7/EI8WTRc1TGylxjqFbVRI0m9C9UdHE6rBSUS+fkXHMdct79+eulNEqlyau
         u0cUBSik/q+TxT3RXi9viWf3+lzS601jC3CApxeSm6FRPyr1e2mxWtoOiwAk5IzOzzSj
         f6EqBL2jlJon57vZk8aeujvOd9HGm/DKRGf8gGQfeADCeP5BjWh11t19CINkWso22IhK
         VNeVcH4SKulkzEDjn3WzGqdmlz6RibNPoXnFym7vqlQ3hhvhb+aaN7nvgWMkrm4FvZ2i
         yrN4Z2o6vKNfVWqYYPSCCH8wqKqc95LTEO6HsLmBsGxysaffiHTbHcy3JQKcFw/7rhey
         zKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657105; x=1736261905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSbYedxgsZDo1h/bnCTgqN5CKNk8NG3PCiX/15LxWXU=;
        b=FuXJvjImhx2Hft3U1Snmxg5ab2kGLAL08kZrnuSUFCE1q8oGxq8NSVJQ2sLS+wSZuL
         1DeXBIxQI+1r6N0eLRUV6tdEMSUDO4mxsAK8aIMSTiGYRvOPj0xLuMq1+sgHOTFxHwiN
         QZlYwrgXEvFbpWHWQhbzhRa7K4+fSrSnv8SoGy6kj1OukzXIiBTbfJEfJUsXKSXSobGC
         LAiYkt3537qImgza+OTfm23ro6HxXJgsGI4BiksGUXEMkM7FuCXXGDicH2B7fukX3nA9
         vmEIe6pgTjiJGABP+Vr9v0YPPx0l0FkO95SMNfBDxOy9M59Sz2R25lCAdFBQ+3FsO05o
         y4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUU1+GaPp6lF1I3qRXYWxFpKwNKm5eW9FQttMigt9GG+oKTNGZIz7SKW3Wz9N/MEjEsKVrOaoLge00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/OAOEwpjdmI9jXyWY9n5rQ+v86PKjoexcQrBgUDxBfu3beAk/
	gDXwvtO22Qmf7gpfA94MqVumvH+j2PrD6XA8UYpnvB8TnH39xZDM9LyqIWkVdY4=
X-Gm-Gg: ASbGncveURfLL73TcAdhi3MJylb6nF7g4XTyGVbzUclqTvErCOOaMabUWHbmL892Ab3
	4Rr7MUXP6yTS4a2bEgpdhbbjJhHWl9mh34dXaJOZS/FjGZh0/Z3QsTJ2WnXCcaC9B2FUxRdv8Bo
	Cub6N9sAoVZZDpAcCRp/lq6uBF1+tlBbWJtK3AqE9SYd8AfyrDMsxu8fpamzWSeCnNzD35/CaUX
	wGI76Ij+Ipg3133b+u4j6Xbw0/U75Q/QAFXBxoMV90q77xOAUsu5xcoZUiJFfAMcQRztvWEhLq8
	fUrZ4v+1P4biAJV0VjiWcVzNHXLorI5r1hkt
X-Google-Smtp-Source: AGHT+IH0ONmDCEhLlEHy2uzXj//HEUZ4rdSJ/dCjW71fZ1AXASnnybyibGKtvWTX2k1vh0XHCssuRw==
X-Received: by 2002:a2e:be06:0:b0:302:16da:a052 with SMTP id 38308e7fff4ca-3046860d39dmr113148231fa.27.1735657104745;
        Tue, 31 Dec 2024 06:58:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b083ebbsm37802501fa.115.2024.12.31.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 06:58:23 -0800 (PST)
Date: Tue, 31 Dec 2024 16:58:21 +0200
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
Subject: Re: [PATCH v5 09/10] drm/bridge: samsung-dsim: refcount the
 out_bridge
Message-ID: <anuafemrtp2wsksuhw4snigkmlki2qdehqj3s56pgyc4lfd2cw@pgs4aiwkbguk>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-9-173065a1ece1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231-hotplug-drm-bridge-v5-9-173065a1ece1@bootlin.com>

On Tue, Dec 31, 2024 at 11:40:03AM +0100, Luca Ceresoli wrote:
> Refcount the out_bridge to avoid a use-after-free in case it is
> hot-unplugged.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v5.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index c4d1563fd32019efde523dfc0863be044c05a826..4d32c453265931b5aecdc125623368fecacf4be3 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1756,6 +1756,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  		return ret;
>  	}
>  
> +	drm_bridge_get(out_bridge);

Well... out_bridge might already be gone now. You got the pointer, but
it is not protected in any way. Gone.

>  	dsi->out_bridge = out_bridge;
>  
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
> @@ -1774,13 +1775,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
>  		ret = samsung_dsim_register_te_irq(dsi, &device->dev);
>  		if (ret)
> -			return ret;
> +			goto err_put_bridge;
>  	}
>  
>  	if (pdata->host_ops && pdata->host_ops->attach) {
>  		ret = pdata->host_ops->attach(dsi, device);
>  		if (ret)
> -			return ret;
> +			goto err_put_bridge;
>  	}
>  
>  	dsi->lanes = device->lanes;
> @@ -1788,6 +1789,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	dsi->mode_flags = device->mode_flags;
>  
>  	return 0;
> +
> +err_put_bridge:
> +	drm_bridge_put_and_clear(dsi->out_bridge);
> +	return ret;
>  }
>  
>  static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
> @@ -1804,7 +1809,7 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
>  	struct samsung_dsim *dsi = host_to_dsi(host);
>  	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
>  
> -	dsi->out_bridge = NULL;
> +	drm_bridge_put_and_clear(dsi->out_bridge);
>  
>  	if (pdata->host_ops && pdata->host_ops->detach)
>  		pdata->host_ops->detach(dsi, device);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
