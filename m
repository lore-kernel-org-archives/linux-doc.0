Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF2E1547CA
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894954; cv=none; b=TK6thra9U+m0Ehx14FlTF5wEHRQxyelpw12XOWuxVQ6Hi0JqToUNfylaA8fnjlowVXYSvjm6AH/nwJmFJ27eCnFy4B97buUC49XoKMUNg9sDsBBieKmpkVBVX5j8GUV9Tp948NVMHqQoR/ZhIcH3jaQTTgjYk6yjEWgzUJJYUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894954; c=relaxed/simple;
	bh=jvE8zKpfRmfKAz2BQ6sxAgZ6btqjmbBFLAixmmadIsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcdEjgLNQsPfiinqoxi3MHrpqhku+WQTPQa6HK3KMnhs8jHGFzEeYFPr4X38Ad6KVC4DsKnkaSCdNTjdjPHD1cw68Slr0kTVu08roMmpPug6SO8RMeT5OHSXFYryh2a1qm+K9gfM3+Nr0sBJ1GPsLadv0nMVf1wMtA61gb6Scrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lJw6UwpX; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lJw6UwpX"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3076262bfc6so16351531fa.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894949; x=1739499749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
        b=lJw6UwpXtiE+1ArUUJzsDI13yS2GsjlmNIz+LNRnkYGp8nKVtXdkDbOHSym4nINJsX
         WjiL0ugINjlqbAZHFlTKacCL/wSCZg5Yp3PdVqPuR+Xo+PmBJ4L9ywHhL0yKH6HU0Cop
         YIxmcXyJcBfzeVwMlMEUN+BvUzjf1cHlhq96TktHEf2qFfDGUeptozQnZ0GwkrvMUOQ0
         d4yRHEUez/1gIQxLrg43q7WhCZOgLDcJuQKWWdYRViMyXVTQWzdAtJXM4sxUjmCAD8cQ
         sjdbTZ4BlgyX/fhZRM2WyTGCZ4LUcfMJNFeMuNyOUsiPrBNZCqV2XPcB/NffZ/iW8K5R
         fJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894949; x=1739499749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ2zkKifpQ89f3hMtzxU+G41sKfC/86q4GHwa2AD6jI=;
        b=GGFBE/BQZr0PGIlEBJmo/dE3qFBRrtYckmaKRvcjnev4duV11MR7m/Qtzzn+XGoU6m
         5NH/PRlJNB9ErsY0fptL0fKM9MzuRhEJJuhFxGrwca0bBqTz+UhLMJWkj05gB6zHK7Nc
         KMcFx6Bd7dPoohBC0UeIuxJzFCA5QqbAnBGPSOojwSc9X9l93Gm3A+wBsqPJ7Olp0DZ9
         T3DC/Qz8nJe5D3cl5ICtAnUWrSC6zp5jMdBgscJ7NXb4sGyhO/M1vOvzswVoEHl7qqdV
         PU93+rMMCXfsvHQPKiu0y4KnnvODlBqn6gxRVl8hziJenHeRuMduxMYEGnel1r6/byoq
         k3wA==
X-Forwarded-Encrypted: i=1; AJvYcCW+2vurOyOxiATJWl/PxNq3hwn+gDn3m4WnwV+uphgkuoFvxhQ6EZB2gYgl9LPPR46GFveVq/s+SEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eb0zBMRfLHOJwtjtacNFZNz5VF/v1vMeVCV2o9fwEF/gtXI7
	ivk1UPHwOv7YdfOGdHGviZRw0EOf2DaPQD2mYXCY2SwyoDCQeWVCDJP+fU/JP94=
X-Gm-Gg: ASbGncvpO4v90Td5yBZOlmvRdgWcE3Swef4Zj0aQGk+La1lUM0KqKISX1VTJaj/s6yP
	QVsBMOQKYGGHOhKECrvBdFKjyCSEBsk8Q1HBsALQCcrj0FHyrhjC/JczuVl3YgETKygbG/7S621
	hU0je7gDhOvR+fPop1Rs8ETxzoNpuIdo0XojcVJrc+qrH/UvImiGR0LFIVa0zPaqvlqYZEbjFJ5
	MMMUicjGWU2kgQQAo2UegXbw1JloCuy3WFGlBY+U5+6p15kmj2rSRw+nwVrt9la/QZDq6FhX72G
	Heh5eRMoTpKDgcbY1M4mtN1zm79B5HyxQQxWd7tRDqO22dR2Th8z5h0Nqoa3HPU/4qRfpac=
X-Google-Smtp-Source: AGHT+IGYPeDLkcUcJNuKIyN2Hu1GKaefHM6B17kcLxSwD3vE/zsB8TapdQI7IpzwkzI9FScw1YMjSg==
X-Received: by 2002:a2e:be21:0:b0:300:3de4:ff72 with SMTP id 38308e7fff4ca-307e5a739e3mr2648431fa.27.1738894949030;
        Thu, 06 Feb 2025 18:22:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm2915881fa.48.2025.02.06.18.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:22:27 -0800 (PST)
Date: Fri, 7 Feb 2025 04:22:25 +0200
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
Subject: Re: [PATCH v6 04/26] drm/bridge: panel: drm_panel_bridge_remove:
 warn when called on non-panel bridge
Message-ID: <cpe634qeg46gfph6diw7lshdiolnpmuik3nmd4fpayg4st5r55@5bcfdwjme7z7>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:19PM +0100, Luca Ceresoli wrote:
> This function is for panel_bridge instances only. The silent return when
> invoked on other bridges might hide actual errors, so avoid them to go
> unnoticed.

Is there a real case of something using this function in a wrong way?

> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index 0c5db13b11dcb90ee88b9932b91aa05fc48d59bd..c57036b06493a6922e2cae38bcd1733930ff0073 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -322,8 +322,10 @@ void drm_panel_bridge_remove(struct drm_bridge *bridge)
>  	if (!bridge)
>  		return;
>  
> -	if (!drm_bridge_is_panel(bridge))
> +	if (!drm_bridge_is_panel(bridge)) {
> +		drm_warn(bridge->dev, "%s: called on non-panel bridge!\n", __func__);
>  		return;
> +	}
>  
>  	panel_bridge = drm_bridge_to_panel_bridge(bridge);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
