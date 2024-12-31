Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1FA2F4A
	for <linux-doc@vger.kernel.org>; Tue, 31 Dec 2024 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735657066; cv=none; b=ApRFBeRqUKhFpvAmPZAFzIFcCWuRwS69zEltO4pk5kvHPNYPA3CpQpk8y5NpXJ3rY9NoCS/dM3+V6sH5GNqpJFoKnaPV/ElwqmNCmI66wHyX1G+HO+M2aRWYpB9sIALUT9Yw/8fZSuLSLF5EnQkdK7EUnG/1YDHpyB8+wnc4iyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735657066; c=relaxed/simple;
	bh=lG6G+OxPE1awUf8hfVzkeSQs5YQ+IpIFFlNtB/qz0ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohiZ9SLeadap9EzlBM1InIc80lypLjM5nz5DwVv66V/JTBm/gOCLIykRoqy7IJYplv8P94Ny10frn4ZOnExlZtK6cplVl+sr0S0bhc5kbIAfXQnXZ0PP8BW39T8enam9P3eFKtQiqcOTnCrCFsv7Qu84of5V2r+CCD2j3s+36pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cMR92U0f; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cMR92U0f"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30229d5b229so107296331fa.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Dec 2024 06:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735657062; x=1736261862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NsA+h8MrPKDybGr9ensERG0vy6cAQACpfuRAvQRAwoY=;
        b=cMR92U0fKiKjIxtJc+3F5IxD5+LBHT8v8V+xw1DzEiIH7CuMhH5of7+B/a/irMXkeB
         1G7HGfDHMDBFa1atXaxr3aFFRbwgb7pLWM5xB+zfwni0bKxqg0A62MhdfDGBUjToes09
         LyK7KSZUJ+pnxnQvY1TaQEswzhF8RqNB+nDr38b6GeEFnsPFv6FUnM5jGxEbUzLLKM62
         S4aio+WVMhOUsBVDThlSnV4Ry7K3r9yMXsaWE/z3G7nrDs+uuH7uYS6s/QYaCc83IWWc
         LcbGDterqIZrll6dci52Mbu9RqbWEi/nvG0N18d65vsN+sOCesRpCaHckBE4b+O+q5Fy
         ZLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735657062; x=1736261862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsA+h8MrPKDybGr9ensERG0vy6cAQACpfuRAvQRAwoY=;
        b=rpcKqJrm/SoIrAEla/Jj34nfaQBt4AwI4L7Cw24QUxUyM1WVBgq+ZTTnE8NUNpvANP
         mPkif6gdm6fNIpMOrc9BbEmgmDQrk1wVXjG+bik8W+zASpLcL8vp+vOKFZrRIETBNoS/
         6OggADPcyZLyR8bJiPc7YYmjFPJ5KfWikow/uLnMHZfC/lOPuCowQkHuZK94aVQQPeYk
         o6rWy2xmwvRjNT+bIZtqLNXHNX2V31KVKxQp0yoYy/ACBCP0MNXbsz2v2Ls237CpZFLu
         +C62xwOkppJl6hLyAhY5lPKv0Knr4eIm4VCwhLc62d8K4XJ0tFjy3acjX5A+l5yYATCT
         Bbyw==
X-Forwarded-Encrypted: i=1; AJvYcCX7KBKzQxmdi0bYIQxqcW62h4P8gcCQBeXZEmHlGB1w8Nl8ESVo9ozzTKyxp5dh4iiTEbrTUoWnWCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhraDs1X+oKnlEfbuScudaJjWodOmCDTmBotctUIFxt+hjAEdm
	JynJdwCBOjOf9agfxZTehxhQ4G7K5oCZ4DW0PjsN/r0NfdcFv9VeEeBc+DRmITc=
X-Gm-Gg: ASbGnctvNwkBaf4XdXVylUWrvrekSshdYb/O0nQzGG00H/pR26F9wv4wXt8QFuyk78a
	aUgoS+QqZ53yfnKLABkCuxeAZ75fGklw2eVvzcm0md6BiiZ5js77T1poqgxWtUrPQab4f6AljTw
	7fzQby6UuAd+9sClPbBFsj9QUNG0rfKnNL9v7m5NcM5jBGv4SFlibcKwQJa9RXu0hQQR+fgJgxY
	4eGaUpB0c2aXwX9DUAYlKm37fSINxzRRLpTgcl7zimtHjmXtSwnMV5JS7ze0KeZgHsS1F55cDru
	fZPJpl8a3/BABsovDjTWV/h7MUsb19MyOH0J
X-Google-Smtp-Source: AGHT+IHHabGJB7P2rP60P6ye1QnJHOTGO/MyUod3wpaOty8DPQW3aBi+vUhFMSCQxe+qZNkA2ZI2rQ==
X-Received: by 2002:a2e:be09:0:b0:302:2a23:cf6 with SMTP id 38308e7fff4ca-30468519747mr130229991fa.12.1735657062365;
        Tue, 31 Dec 2024 06:57:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6c595sm37483571fa.3.2024.12.31.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 06:57:41 -0800 (PST)
Date: Tue, 31 Dec 2024 16:57:38 +0200
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
Message-ID: <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>

On Tue, Dec 31, 2024 at 11:40:02AM +0100, Luca Ceresoli wrote:
> Instead of using dsi->out_bridge during the bridge search process, use a
> temporary variable and assign dsi->out_bridge only on successful
> completion.
> 
> The main goal is to be able to drm_bridge_get() the out_bridge before
> setting it in dsi->out_bridge, which is done in a later commit. Setting
> dsi->out_bridge as in current code would leave a use-after-free window in
> case the bridge is deallocated by some other thread between
> 'dsi->out_bridge = devm_drm_panel_bridge_add()' and drm_bridge_get().

I don't think that's how refcounting should work. Any of the functions
that give you the bridge should also increase refcount, requiring manual
_put() call afterwards. We might need a separate API for that.

> 
> This change additionally avoids leaving an ERR_PTR value in dsi->out_bridge
> on failure. This is not necessarily a problem but it is not clean.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v5.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..c4d1563fd32019efde523dfc0863be044c05a826 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1705,6 +1705,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  	struct device *dev = dsi->dev;
>  	struct device_node *np = dev->of_node;
>  	struct device_node *remote;
> +	struct drm_bridge *out_bridge;
>  	struct drm_panel *panel;
>  	int ret;
>  
> @@ -1740,21 +1741,23 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>  
>  	panel = of_drm_find_panel(remote);
>  	if (!IS_ERR(panel)) {
> -		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		out_bridge = devm_drm_panel_bridge_add(dev, panel);
>  	} else {
> -		dsi->out_bridge = of_drm_find_bridge(remote);
> -		if (!dsi->out_bridge)
> -			dsi->out_bridge = ERR_PTR(-EINVAL);
> +		out_bridge = of_drm_find_bridge(remote);
> +		if (!out_bridge)
> +			out_bridge = ERR_PTR(-EINVAL);
>  	}

While looking at this patch, I think we should migrate the driver to
drm_of_find_panel_or_bridge(). Then your patch might add a function
close to devm_drm_of_get_bridge() or drmm_of_get_bridge(). Otherwise we
end up having too much duplicate boilerplate code.

>  
>  	of_node_put(remote);
>  
> -	if (IS_ERR(dsi->out_bridge)) {
> -		ret = PTR_ERR(dsi->out_bridge);
> +	if (IS_ERR(out_bridge)) {
> +		ret = PTR_ERR(out_bridge);
>  		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>  		return ret;
>  	}
>  
> +	dsi->out_bridge = out_bridge;
> +
>  	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
>  		     device->name, device->lanes,
>  		     mipi_dsi_pixel_format_to_bpp(device->format),
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
