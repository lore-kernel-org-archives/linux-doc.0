Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD3C31352C
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 15:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318866; cv=none; b=MJmSn7SOxHcw8SF8oFGvvsWTkSXVjwM9lCkE9M+RjN3XOR+5S98XbSkemkW8nCPLDML5ai3OS67lJ8a+t6jO8LSeo7nnDgUIU4yUIazb+c7R2G5cyDNZ0ga/MMJsg0gedUvkTOPFuq9OoHMPnzem0XwaH7uCxJtHlFhLuh2YASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318866; c=relaxed/simple;
	bh=/g3JKMg0E1LetZr1FVgvL3SUb0e3wf+Hm2PB2HucCBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rha1NDvx4MzGRGVj1VGpS7idXrrRTgO88Pr5ZWpw4ZDRNbiB+NXZK4f33IZH/OSRow1w2jtFtTDkWBGDeM6glUnrSJ2I4PnCPLtl6kEGC+qhGmh1aPhriafbEX+cT3iApOhqvA9Lu9xRdIrj5gGkTzAQAAFt9Z/4Ithikxm2F6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+GMbHLJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+GMbHLJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47495477241so18564155e9.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 08:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761318863; x=1761923663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Xb1iOk36N91mas4Cq5cRC/PrSP6DadKgPF6bPCQmBE=;
        b=C+GMbHLJHz9L7m0bmImL8a1ELWicVQW9JhUwtr2qLp5pWrSUUw1Pz8omk3g6nlewyI
         p1ZTL/AqQulQwo1DJyfs/cfTa2jkwG7edONYC5rpNUPBtJk5EZ3OjfCN4ULSU1wCAp4/
         W9qQtiwtMjD032W/ufiyIuz72vApv+l1HnIvmgK5Dm3tRfnkeibD8cn3A1HGzeYcYFn7
         Rz/lltVtYoozGq5UKbQAxEykoxfUIBT9w8NwBR/KKns6vIsNjCPqtVJCCIMVuLBxQeA/
         bIp5eEBJVja3HWSzNE+P0MBOTg/3eziFHzAwHMqT9lF6KH6+Xy3nN4rCSaRHUa5y64lQ
         z3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318863; x=1761923663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Xb1iOk36N91mas4Cq5cRC/PrSP6DadKgPF6bPCQmBE=;
        b=Ia4Ffp0fNnKKGosL3lxD3QzWbTGjfVZSAO/LrzBv/vSLUgqFEDjXn0rDowScSTj8f5
         +SkdF8QvYYonaLxs7KYTO/GSIsjFAcQWU59s7FbhVFuMbnPJCSgF1BKZGxvmkvT4VTLu
         0fveynYBVmhVBT/rexVrW+NB3JiMG6XwR50tLnRqgINLxvoCamV+F5d9XCw5F/sup/nZ
         vzlzvb804J29Wbme9myUXXwgCb3ZlnqCYFan6Zw/lyiZTzm4cU131E/uqPXDPY1UmsCF
         l2fml+gnBXahMjLYwFMXDmKw2ln6fNM4zHa3QODC0aeZlzOqZTiCwBGmTTWv8+f9/2zZ
         qZ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoyLVgUEsgiFcTjcMn616sqQ4IJbRRcnalTj7uvh2WIBeGNEQMdJz8eo/UxINHFl3UETC33T/ac70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Tb5hnkthsXRdYTg3tL3GDG1eflVtDKQzVM4udrjTPksqjX2A
	gITzQf6DyRVV9DZIfMN0tRTj5kMhLvhYJ2AP+UU1JkzkVoUSZ8CClYgN
X-Gm-Gg: ASbGncuACYXwhNbw+/CeRVrvKWkeCGjO/Fq9sbY3R2e01MIACoiEnNwI3SQsXPrJA7K
	pYsej/5FmJx3JxySvF5qbEVF88XyRCIzudAf904QGU0E8sCqNUFlK8I6iqyAvl4xuRAifeNyDTp
	vmf+qcaEy2WlFLEFC+dvlJLaizIgQTlNEL3pKXILXgkvhN3buo3+ilGW8gQV2D+X1bZETgfhdiY
	ckD6r8eLRGZafk3vErmS8rzlmQTQq0Hal7veghAM237f9IlTju6/utI8J+H9DAoloj9JvQSsQUg
	JhAgh2S2H6gjDf8t9+TXHW0GuZzWpJS01ocxP54ZMRrkPKHn2k6Qvw1TwVk+k19Mmb5PkQpLrJK
	jPdotRepjj9VZ34thOJLvIAnif0WVvHHtrXTGAFc8SYsnTuWKewhM4JoIgrEQ60VUyOjKGisq0p
	sglhDIj06qyBCdje0rP0Rp
X-Google-Smtp-Source: AGHT+IE4w//uQGSAi5tqfRdUfcGhOr1Jz/5zPaPVehBcOpQFdZyB7QRU2MAgBZyfmYynLj3u+5+sTw==
X-Received: by 2002:a05:600c:1554:b0:46e:206a:78cc with SMTP id 5b1f17b1804b1-475cb044e25mr59411265e9.28.1761318862319;
        Fri, 24 Oct 2025 08:14:22 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c14a26sm86965605e9.4.2025.10.24.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:14:21 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:14:18 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 05/22] drm/vkms: Introduce config for plane color encoding
Message-ID: <aPuXyp43xtlVUHTw@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-5-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-5-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:05AM +0200, Louis Chauvet wrote:
> VKMS driver supports all the color encoding on planes, but for testing it
> can be useful to only advertise few of them. This new configuration
> interface will allow configuring the color encoding per planes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 15 +++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++----
>  3 files changed, 47 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index b8cabe6f6cf8..5353719a476d 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -156,6 +156,13 @@ static bool valid_plane_properties(const struct vkms_config *config)
>  			drm_info(dev, "Configured default rotation is not supported by the plane\n");
>  			return false;
>  		}
> +
> +		if ((BIT(vkms_config_plane_get_default_color_encoding(plane_cfg)) &
> +		     vkms_config_plane_get_supported_color_encoding(plane_cfg)) !=
> +		    BIT(vkms_config_plane_get_default_color_encoding(plane_cfg))) {

Could you document what kind of value should be stored when using
vkms_config_plane_set_default_color_encoding(), please?

I'm confused by the use of BIT() here but not in the next commit
("drm/vkms: Introduce configfs for plane color encoding") during
a similar validation.

> +			drm_info(dev, "Configured default color encoding is not supported by the plane\n");
> +			return false;
> +		}
>  	}
>  	return true;
>  }
> @@ -375,6 +382,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_supported_rotations(plane_cfg));
>  		seq_printf(m, "\tdefault rotation: 0x%x\n",
>  			   vkms_config_plane_get_default_rotation(plane_cfg));
> +		seq_printf(m, "\tsupported color encoding: 0x%x\n",
> +			   vkms_config_plane_get_supported_color_encoding(plane_cfg));
> +		seq_printf(m, "\tdefault color encoding: %d\n",

Is this one expressed in decimal rather than hex on purpose?

> +			   vkms_config_plane_get_default_color_encoding(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -418,6 +429,10 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	vkms_config_plane_set_name(plane_cfg, NULL);
>  	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_MASK);
>  	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
> +	vkms_config_plane_set_supported_color_encoding(plane_cfg, BIT(DRM_COLOR_YCBCR_BT601) |
> +							BIT(DRM_COLOR_YCBCR_BT709) |
> +							BIT(DRM_COLOR_YCBCR_BT2020));
> +	vkms_config_plane_set_default_color_encoding(plane_cfg, DRM_COLOR_YCBCR_BT601);
>  
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 3c3cbefcc67f..11160c3c13bc 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -45,6 +45,8 @@ struct vkms_config {
>   *         It can be used to store a temporary reference to a VKMS plane during
>   *         device creation. This pointer is not managed by the configuration and
>   *         must be managed by other means.
> + * @default_color_encoding: Default color encoding that should be used by this plane
> + * @supported_color_encoding: Color encoding that this plane will support

To be consistent with "supported_rotations", should this prop
be "supported_color_encodings"?

>   */
>  struct vkms_config_plane {
>  	struct list_head link;
> @@ -54,6 +56,8 @@ struct vkms_config_plane {
>  	enum drm_plane_type type;
>  	unsigned int default_rotation;
>  	unsigned int supported_rotations;
> +	enum drm_color_encoding default_color_encoding;
> +	unsigned int supported_color_encoding;
>  	struct xarray possible_crtcs;
>  
>  	/* Internal usage */
> @@ -344,6 +348,32 @@ vkms_config_plane_set_supported_rotations(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->supported_rotations = supported_rotations;
>  }
>  
> +static inline enum drm_color_encoding
> +vkms_config_plane_get_default_color_encoding(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->default_color_encoding;
> +}
> +
> +static inline void
> +vkms_config_plane_set_default_color_encoding(struct vkms_config_plane *plane_cfg,
> +					     enum drm_color_encoding default_color_encoding)
> +{
> +	plane_cfg->default_color_encoding = default_color_encoding;
> +}
> +
> +static inline unsigned int
> +vkms_config_plane_get_supported_color_encoding(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->supported_color_encoding;
> +}
> +
> +static inline void
> +vkms_config_plane_set_supported_color_encoding(struct vkms_config_plane *plane_cfg,
> +					       unsigned int supported_color_encoding)
> +{
> +	plane_cfg->supported_color_encoding = supported_color_encoding;
> +}
> +
>  /**
>   * vkms_config_plane_set_name() - Set the plane name
>   * @plane_cfg: Plane to set the name to
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 6e6bfe1b7400..5869000415e4 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -239,12 +239,10 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  					   vkms_config_plane_get_supported_rotations(config));
>  
>  	drm_plane_create_color_properties(&plane->base,
> -					  BIT(DRM_COLOR_YCBCR_BT601) |
> -					  BIT(DRM_COLOR_YCBCR_BT709) |
> -					  BIT(DRM_COLOR_YCBCR_BT2020),
> +					  vkms_config_plane_get_supported_color_encoding(config),
>  					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>  					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
> -					  DRM_COLOR_YCBCR_BT601,
> +					  vkms_config_plane_get_default_color_encoding(config),
>  					  DRM_COLOR_YCBCR_FULL_RANGE);
>  
>  	return plane;
> 
> -- 
> 2.51.0
> 
