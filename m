Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F64E20766C
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 21:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739480942; cv=none; b=gR5nLvKO2QedwwUi29grifev9mWcznkQ+OdI8Y49EcgEsdQ5GNMQaX03b340Nn0t7fWFei8Un2kPH83gFbYoZmJmm1wnVviz6hxPbRDY7CWg/gYkPQpy7dXPocTV572nj1zMRcw7kcWy68Gb0ZKMBH+HW6R13rH2cbD9NjVMYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739480942; c=relaxed/simple;
	bh=U6wiO9BFzqs/502pytstj6KNgptL9YhRbQLkNh432rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9NSrzp00wf+wLEx2vraI0aONKJizWq2XUT2gb4oNwHTX8to7/AG/EUyOyyiTIuGlvBH9obpAJJSbAsfVhozWDBS5gK6AaUqJQeFws0TL1k/Dov+A/DXFUoeqGgGAmIBpHmnajRm2vMhEH/PP2gPsdtOWwY8vX9hEviexc/NtNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o5deJ2pD; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o5deJ2pD"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613802a04so14157711fa.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739480938; x=1740085738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeNMrpUqpwoLFI0ojzBCoD9uOLScIV/Ka4QcI/0Cif0=;
        b=o5deJ2pDVYGop2hCKG7D+rKckRfYnZeEj+01GRIql50N+birOV/2G/Z4p002NKD5B0
         122W7+2nTh1wWD+IjyH4PIwY6fR0lzLELDV8ATrqbT5k1yr2elnBXKYncpd+Sz9omyyd
         tx+6s1D5ScwjYEefsbQScEKskaPu5fgpddJqFJUYnCggLFMyjjLy4TaM9wDLpAwFcBVo
         zKqhaWaKOePZ5kWqef8rMm+ktd/ySB8CnUxUCgl6gLMolFFYKzFOBKtx6p5jwzIiEuHZ
         RWI8foZYa5QEu4MV/OuClaJYkpvylapnPphkjNQygAiMDybRzhgJ4s98G9JPKF1EeZQ3
         Bu7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739480938; x=1740085738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeNMrpUqpwoLFI0ojzBCoD9uOLScIV/Ka4QcI/0Cif0=;
        b=bP4KP2jxGB98ZbTYyug3p/rWnPZNufUGe4yYHJsW4JXmE1vhkO7Vm/kJuG1yexVS4u
         TddlZqBNOG2uFILYkAFNE0UL9jy7YJ3h/RzMbua2CCSI3ZlWqB8WZx7UaldKDkJrJh8y
         pj6bIUkgsz/mBkYvs6zBe2p2lYLk+bu2izkhSzqgUX9OUeGK8m5cyErpM8l//vNqaFyx
         4iOyRYizzSkYiBc09Gw+anyuBSI6BNsbihc0UKRLvV0bh8VASu1XZzUzL7T3c0mdf28n
         sh2OuMJN8Elv3r98rFxywp2HCIg1FeTcdR+cHtmpik1GwBwC/2LTYf4gJkCpRbt02XwS
         MkHg==
X-Forwarded-Encrypted: i=1; AJvYcCVvzU2fN998/b/xB8+pzA+mivWpoylrO5QcgYDLHS3uboMlQysmh6EABGD8sqHzficH9QmuemPfJsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjyEl0ojTzRU+OAPeR4Elcny71m9RxEEaqIgc8KoddzwvCOmWW
	f8vGamo8cj+oLkgYjL/CTyMD0lk7p0fKXejfi+aw7v9oycjSxESuHb8a4kJQc3k=
X-Gm-Gg: ASbGncuujS/TaRurSOFcL4xgBCwRUsFT97N9MJsuFyA8I9ykKtWu3xmY6b/pkd2BSMl
	HJoj9eRYTrQ1k2yENYRlVeuNnhzqSnAgdPrbruxIL5QS+3JIUxtLyJzs+7xxFSdZ93CUit0G/jF
	neA5CRuK8V1//tTSgkhjlsvClvMnD1ykNwQ2bdt9eHv0ZG1u5t0yJatMcQ8M+wg4HGBFRlgAYJw
	eKM3WSHyp9buPNutcgikV3MeQ7O4XuhVV0eMuk+XuGSjtnUnD0/otRiZwaEqwF22cA8rIsxszfN
	LliMtG0K+5Hkq4R9iHkW69p+crsKCDLnBvY/7BYavNH0cjKgD7whqT1sRiQT1V2sNxHZkgo=
X-Google-Smtp-Source: AGHT+IFoISTHPwl7NmM39tEjJazTxUu4ZlSD1ldej2CAwAd50t/8PacosIj09OljiXHD8nuiFDIq4g==
X-Received: by 2002:a05:651c:211f:b0:2ff:a89b:4210 with SMTP id 38308e7fff4ca-3090379d3f6mr26646011fa.8.1739480938463;
        Thu, 13 Feb 2025 13:08:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30914801757sm1997551fa.94.2025.02.13.13.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:08:57 -0800 (PST)
Date: Thu, 13 Feb 2025 23:08:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>, 
	Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
	Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 03/20] drm/panel/asus-tm5p5-n35596: Move to using
 mipi_dsi_*_multi() variants
Message-ID: <axar3e6jb7uzway52adqm27cox43uubkey7fcqqi5yu6wp3kfy@imipkyyg4ag7>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
 <20250213-mipi_cocci_multi-v1-3-67d94ff319cc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mipi_cocci_multi-v1-3-67d94ff319cc@redhat.com>

On Thu, Feb 13, 2025 at 03:44:20PM -0500, Anusha Srivatsa wrote:
> Stop using deprecated API.
> Used Coccinelle to make the change.
> 
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> index b05a663c134c974df2909e228d6b2e67e39d54c0..aedf644b4a81649fd9a17b6dfdcdb95be1d5762c 100644
> --- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> +++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
> @@ -168,14 +168,12 @@ static const struct drm_panel_funcs tm5p5_nt35596_panel_funcs = {
>  static int tm5p5_nt35596_bl_update_status(struct backlight_device *bl)
>  {
>  	struct mipi_dsi_device *dsi = bl_get_data(bl);
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  	u16 brightness = backlight_get_brightness(bl);
> -	int ret;
>  
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
> -	ret = mipi_dsi_dcs_set_display_brightness(dsi, brightness);
> -	if (ret < 0)
> -		return ret;
> +	mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx, brightness);

Lost return in the error case.

>  
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry
