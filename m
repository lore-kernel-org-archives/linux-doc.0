Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775782;
	b=FmObwkNoukFVHHaOScV/6NV30CmidEMtglXqE+fW51ZtsUMYPHKl88KjLlrdD2y4KKcD
	 uUgUBMU9sh/t9hZSv1dtyWJQAV6UeM08lwfOVqVd23/XYBQMvXBVC9ECyYFM+lkdXP/7f
	 e4UIzI6Sjxl/akeFxUH95gMWdLProlsXefVLvHK50k/eG3iyt+cYK4UvmNFTUi4Wnq4E8
	 mG1BsbcQQ7CDmF8ISc5HB7wad+7B+GmcDTm2oVJCLs4IqH19Vkylddb+T+4wGhw4Bbv2m
	 kz06bi5jHyC4gh0OfOMjfrycGO6TtXEDzJayAsj6TEVz6RfHxZthduDLPyEhv/qMiHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
	b=Ez6SiNLf0ou9MFJ0Q40Hzl/OYexxIx4AQXnZ2g7TdXSS0qzGqHDup/cZYiy+0Ie2r0Hk
	 Vmf4qe2w1HWio02S3RomjdTU+Y/3MIe3q4E/5A6c79G2zpMmqiXaBDvO9QrAq7he44NNl
	 U1eGdO1XQkTvU6TrC7LpXRA+5Qhndo2o2g15Kv6dWEbAP+Dp1drc8HAWQkuWRSiqwIMPD
	 vIs2gjGrzMlw91VO7qtEeCDAeDkD3Sjx0MBm91wHelen2FzaBa+WNI6myfesoG2zpzC77
	 q59gHsNhKz/C4HiNE+miHeQ61YxTOMIGvFhSLn0uOgAyYSlfp3H/HZedsqEff5cl1Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik5G0Fci;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80D606A31F
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 10:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA80D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ik5G0Fci
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so69179125e9.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 02:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795775780; x=1796380580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
        b=Ik5G0FciQpGYL334LoqWbf3SmW1Rn/ZTUFXdMWWLEK+D4HilKeCz/3t31YZCGkw1Jl
         eITA0U3xgUDxmPvXfLGO2azz7MM37/41jCZn2que7SSaPIm8O4vJzBC4JeetYAhIB2sq
         xTaseH5BGl6ALyfmCp+dfbySZ47UV+UQz5Hx5rIUzCtjw5iNrPsu5RomWst/jP3CHH4+
         0qFR/raZpMaJSdTKSs5/JSXiMAfo1GKXRLnSCrM8XjnXVhZjiof7tsTQqnohpMIHHgGQ
         ap6pdQFqtsnm9MFoUkgltL/qHtoGl5RlIvjNm+QJNK42yPh63KxDlWqff30kTL5KvuD7
         bYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775780; x=1796380580;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iCTbyzZob8FXKeEZRFMgEo/F2TymOMg6sLKTzhBxgFI=;
        b=n+NQrzzeOAPXilT2S9+jU+xSIhIclB9ajB77P7y4mZy3FGKrZvX0a++kC2BVc5to1J
         ly6wjtXSJ/2mnn1NBZjjkXAS9Yhe8725ad+uiL1Nev1GgZRiLlL7NzvU5Qr2/3z5/L9T
         1k0WWuJk3aijzbjfZAUBY1XIT6eOovggOGB7UNULsPT4aNUY5DIsj5EenJIrS73BKSXS
         MNeoQDwBXX4R7HPCWe1+iUNo19gUHBzXta0ygTjp7NqI2SHIAGe6iZOFI9fMbAy/3mvZ
         x7EMhcuMVu/mxwh6gVfgFihDjkyAB/ExBC+fHps/m3LyZgChZjvpGwouxqwZqs+GwGKO
         SExw==
X-Forwarded-Encrypted: i=1; AL+hErHAwhU6mK2sqouPVTyBYU/NkT47GJXhqu9CActyO6SfVc10v5/RE9IoduACMx6eMB/7gZwJ1oxx4Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PrpLh2setBEJHvkPfeRS65kVvHWolTRwFJoyeQUdf6LGv2DYe
	Y100b8mkX06wNBDXujpsEzwLEQXD6a5uzFVyWYTX0LGIaRAlmaDaquZm
X-Gm-Gg: AZFdTZfKIHJW8fLAU/7EyJRAGXlYjjMu0aAqIESo9l2dUO/lFRgBD4DU1xmwVEtvSJd
	hbWRL6kiVsWDREj+QBkXFvWiFtLcrCyfDMSTLFnnUVy5w8T+mtqC/WsRlaaHKNQFCsIkI9wpQHl
	PdXfKPTmViPKGTTb3N3f1vDgy+fp7nMJvx+yYPOhulS1YTeLhy6fq7I0YpQWjEtPRzdKuQqfgvQ
	TQPHcNTel5qopCvDxYUrj57e1JRiHHoOBR9LakKUBkCThbJ6YrXhO6TIvkBP57WPnCIwBvvVrxp
	PaLUM1fGBaI+Fihk1vWCwTPfwXAdAB5lGQ5U73zC2Yc0omIVwIetBYc5M6zp+YzatKRzwO8mu0x
	+lyUzhfD8ml/jke1FsZRl3a5Mnex7DUu/8PIh2mFW8njQhcD6+11xLC4V6s7S0peO2CTJ0mewP5
	Ql/SnP7Ul7IElNbEQ81lDuso32ysanFXrsT+V7787mH6OK3rETlnTbLa0bUw8tVlwJcet2vB/Cm
	syV11rdxu6TvWnYwS+7Oj9+sH3j48QG202AHvRT4ubayD8zkBIIowYrVV321SaqQXgZMH/Ts/si
	a1GD1RS3Ns5VydaV79UtrHc+dAWlar0=
X-Received: by 2002:a05:600c:8b76:b0:4bb:b796:66f8 with SMTP id 5b1f17b1804b1-4bbb7966874mr14558915e9.21.1795775780152;
        Fri, 27 Nov 2026 02:36:20 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm670160975e9.10.2026.11.27.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:36:19 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 13/43] drm/vkms: Add error handling in plane config creation
Date: Fri, 27 Nov 2026 11:36:00 +0100
Message-ID: <awldBcp6Ci4FoQX5@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-13-21194cda2468@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 12:28:56PM +0100, Louis Chauvet wrote:
> Properly route the error path of vkms_config_create_plane() through a
> fail label to simplify future work.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 12 +++++++++---
>  drivers/gpu/drm/vkms/vkms_config.h |  2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 8cd4fe6551fb..c5d90f7e934a 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -421,13 +421,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  }
>  
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *plane_cfg;
> +	int ret;
>  
>  	plane_cfg = kzalloc_obj(*plane_cfg);
> -	if (!plane_cfg)
> -		return ERR_PTR(-ENOMEM);
> +	if (!plane_cfg) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
>  
>  	plane_cfg->config = config;
>  	plane_cfg->default_pipeline = false;
> @@ -437,6 +440,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	list_add_tail_rcu(&plane_cfg->link, &config->planes);
>  
>  	return plane_cfg;
> +
> +fail:
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 95e5c3694742..8f038562afd4 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -314,7 +314,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
>   * The new plane configuration or an error. Call vkms_config_destroy_plane() to
>   * free the returned plane configuration.
>   */
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config);
>  
>  /**
>   * vkms_config_destroy_plane() - Remove and free a plane configuration
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
