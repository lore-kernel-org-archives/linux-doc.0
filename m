Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57519155C8C
	for <linux-doc@vger.kernel.org>; Fri,  7 Feb 2025 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738894911; cv=none; b=PrrB/o7Mb3Tv40Pm8BwMr+gKczg57niG+TThBnwgtyblTzqdVqIRDuWW9sZ8tW2m5fw+e3KpBxmTdxHtKhcGEx1n5SQ4kT9YvoUtuqgQ790WllwPfHOtJUcVdwR3PQJcuQ6dIDZf4iEQ+Zas4qStiYGilvHUPL1y9tGOP2uxsJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738894911; c=relaxed/simple;
	bh=NwprDrTmE/wpQWc71fqFMJ+9Mlb8oEsxHNb1kniSsss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmmkG/i3cPVmeRk1i8Xj+tz2ed5ckiEviIpsi1Ha9O6OWj6JESVNpwT8FhEBOmCMZhadXyLwdwVAbO8/cirk6X7SwoG9TQmmXd0wLdr+deYLsIzX9yaFuxnfQ3ArbiLi5948E4i1DlpH1S55wn3r+gwX4QZT3iGlCY1PvwpPDns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVRYGDXI; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVRYGDXI"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5441040a325so1168035e87.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Feb 2025 18:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894907; x=1739499707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
        b=dVRYGDXI1TjQl1PwYD/QdU4sXXB4fNRr9BLrBdLR7f+0UKAMLK6NYh1ZZI1Lgns+Pj
         d/BROoxx6wMQXGJdjPvVBNkWXGnnh184nYATow8HG2AbgeMrmRtB0AnnhS8+N3M0hGhU
         kEyNzVaLvruT8YlDcMxRnN4SM46v8oG6xIXfIbHfZfcJqGTsCbuIxgI8x8x0U0bP2fpe
         9hcLbhde1G7UTIWKOar/TV2t+haaA570E0yAKvKv8K6GE5rCDHW/OppSQxwK1PDJmWH2
         yv27+FFBaS1CyfVecw7Ecnn22onTome4C7z2KPnMwM44Hw3kc6vm19WZAJlitLUia7VS
         NRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894907; x=1739499707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lzta5S0gzTGOLstB++0r/Lba8xmTnzwJ+9gzDMBGEjI=;
        b=O4t45XUGhg5gCOaW0zRqje8wUQjhF6OkjC/88tp7xmtWmDFk/0B8+giED+nFOfxfKj
         MBmOHlKwGBKxeDqgKph/4runQ+p+7/81EkNtBHltwUS8OAwIdIuqpkvQr5WMXl6DfUE8
         scCnquyMqcAeXW6EdtlYd5yD0guidarGcvQg1kjbR4Vh8zZCx+tWkY86OMzXOoMraiIj
         gy37nRWla9qFmpRQTvUSzfYmvS6iTzfF22ZP7NloTwKJvZNUHBL66bRHlcnwRG89GJH1
         ZkMhFCffe3H+uhGYT8khP5XnwpGYd4yaDUwkSNvMfPcNr+OnxPkJ5GRoNH8X9qE4fdy2
         WjKA==
X-Forwarded-Encrypted: i=1; AJvYcCXpaUfZSw3/Ib0m1c1BxpuJeq98eV0fjem2J7MieiLbrHHIP0GlXjCjIRKE+1OQnc0rLL5eLpL/Tvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78mnI2/7RpgwREXHODwI0ydkZry/J3b8+6o5JHc1fQ95drvbk
	dur6qGnAqvfKgOtS3EKedj0WquarTZ4lXAGqoPZVH0WExMKnJDO4XIffJYQ6bJA=
X-Gm-Gg: ASbGnctyHQDMIXwQFpS4eyv6RT0NzGLky/a1/y5JnnbMXGm3Qjj2qnxwid0zVxi44kW
	RZ/soF3QW7fGuediZdkKYJJJu/IkZD+njHMaReSF1+v7WKZG6FpVw2A3MNJQlAYN88LKOlEC+5+
	CNPpVc2Ep1yy4+03PO8beNEoV9pF2mNHTnzV+LNltinmgwIBOIzldSSFYYF1GX9nffjFJ7RiaCg
	71dqHs4HOC9Dd4Kpl5RHkfqC7iGgc+3Z9Ls6N8e6+lqyKwT8E4KAVpz458LPcL/XV3NQkf7cKGi
	9hrfFtIWzkdzHxIAJf6ADAlNkXAtl000JhBdOoJZoJZOEZAdEL5huQ8jul4z3U2zlP3NgFo=
X-Google-Smtp-Source: AGHT+IEEMycc7B1Xywi6/voRjDNNe0jaAwgIo39w5VQbQbJyRuz6zbWk5Cv25Kf+Od2N2WEWuA4GlA==
X-Received: by 2002:a05:6512:3d0b:b0:542:2388:3f09 with SMTP id 2adb3069b0e04-54414ae0b88mr338836e87.37.1738894907389;
        Thu, 06 Feb 2025 18:21:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053eb2dsm296973e87.28.2025.02.06.18.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:21:46 -0800 (PST)
Date: Fri, 7 Feb 2025 04:21:44 +0200
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
Subject: Re: [PATCH v6 03/26] drm/bridge: panel: use drm_bridge_is_panel()
 instead of open code
Message-ID: <yokzxkh2fobfvrvcsp72o7j44tnhhb7w7sf5ofvsuibivju2my@bpauhrvwpkmh>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-3-9d6f2c9c3058@bootlin.com>

On Thu, Feb 06, 2025 at 07:14:18PM +0100, Luca Ceresoli wrote:
> drm_panel_bridge_remove() reads bridge->funcs to find out whether this is a
> panel bridge or another kind of bridge. drm_bridge_is_panel() is made
> exactly for that, so use it.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
