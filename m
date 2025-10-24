Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208FF7483
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304593; cv=none; b=RnX4+EGaWr1jxrtPHvkwSjmaE++wLncPof90+B5tzMFnqv/KW85URIPO0ScfCA+ZN+yZDGzn+sUFgYaQXfWmwM5Gz0frNF4d1YQGXp0Ick3wPsipmmH+nmZHg2fos65UHBa4qUKJdMod44Thn1fEBc8X02+0i9q8k4J9VAjhpoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304593; c=relaxed/simple;
	bh=WyNsDsfa3gayi4AFzTVz+zbL6eQyv+P7SQ+kovtRd9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bwL9RNydmzllZzxeSkMDdE5m/ZTUJfFQ18ucLYCyIViQyr0aalQk686aTsk2dY+FwxfE2jZYo54QV+2qxU/h2cC6EL9swEmB0eEOVx3wV/9Nsyi6uJMu06LuNyek6lSo5G5OxQXaKEwc0GjyiQfbzv1gChZ05t2Oe6pMZbh1dvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wlvje81j; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wlvje81j"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so19194255e9.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 04:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761304589; x=1761909389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOYFJP18GQ2OUczGrlV4tj7QX2qw5H6RUygunpUvm1A=;
        b=Wlvje81jkjuggCGRnpsNq6VUeuzDwYjK9pb5yWOwJ1fX6OoKi9Ui8ku9Gd7pam9C0S
         sbdWC02f6egpk27V2yJdz+cr6hygkTAHBYQp2ZLRJbJAPlWGFexoTuDRzx+9Nb50WyX9
         yp25pxvIcE2o6UrzGIRofbHrP+6laOdpNo5oUn9rBFGGgp/LwCkT3/WveCXSlM7S+ElI
         AT0keeS2KjVyNjvHeOVQHydp6qATQDLpnsJn3KlXS6EU+nrQNC4Ug4CkWo8wLeFOWTU5
         fVFgODCMnNddZUtqA+b/N93I0Wk2L62vO4zZtab5+Jh6vjjSU/4pyjKwhDsVtjEWTm0P
         lUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761304589; x=1761909389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOYFJP18GQ2OUczGrlV4tj7QX2qw5H6RUygunpUvm1A=;
        b=bRZx6dSA/t2Om10h7lvmo1HPlYm1nu5mZwgXuxPHA95wE4gMOnRVNKl8ny0z8QuCPG
         bMPifPR1vUnRCI/QgTiLwPshkyfAUaNM2zEQOMmMZncYzxj2sZbTABnfa/mAdv7TH3SE
         wxHXfWviHOyzuZ0rC2+uUJ5/Ay215shxcDd4awDxtgS7XmnHdgO2B94srcF83TZtNHen
         C1huX0tyUNqE+MogpnqROaRc0CCD4a/6JoI3GrS1MTPm5X37BwttS29d5PKjsC4LSK88
         NfUm9s6lCMO0viU+bR2GTrmF47ME5pRZ+0svK6oOz2IJvJo86n2p9hgVninBGFDw3ux8
         TJ2g==
X-Forwarded-Encrypted: i=1; AJvYcCUuFN2jZVUuOFWbLBtHU4/hEZsgffTVrL4hbooxNSimR6IhONxkMZYYLMOUSBTeQvBpoolIR4tHbcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcqtRvMKYai+BKmfXOvWS30NKU0av0E6pdqsFsiuk3uzoW6+jU
	qA4gGcR9WXkmPfppUaTOdkzcFawSyzVygmisIgrAi1ifxo1hKCtbWGbU
X-Gm-Gg: ASbGncuj2MrtOVAKSSX7WFklNu3qNMeCnzt/Wi2YF2/bmkr6hpZAyYZYyGt7VeZiuuG
	k/8B6F3pealX2yInSBJ8vv6NCdzGl4XYj22U70Gq0L04Ips80UAWsxZlU/spI10+FoiJXqxJC17
	x3OwErBv//nLSSVfsfDbu8XZF11ozBgLKIgcEkvSYnMy9v4JOLyAKIwWPLlrvJB0SAE7m4M12bi
	qA7umJ2HlXh0JaA5oGQFsdE+RHVUloovt+08iokyEq+vfXJNlw0kcBBuU9cjzG29ZzlKF9clP64
	ZWI/FySv0hP3wiuESo2w7bmybybLgTDhyqtxijgignwx80zYCiBH+YQCM916EyCywlByPAGG/Mb
	kLNfn9jBZ/2WXRcBqoLFindlLALC0RxpTvkrR3COnEAa1MWNkaxV37YxnE1tnQwZFyzL8gB1DAc
	32+fiJgym5Jw==
X-Google-Smtp-Source: AGHT+IGnrzoxmGVkMjEWD2Ko8GINo3qyo00kse2cliLugsWK1IDfwV6V83Vq+H2BZ5vKxr7YcZeTIQ==
X-Received: by 2002:a05:600c:6085:b0:471:133c:4b9a with SMTP id 5b1f17b1804b1-4711786c79emr236436915e9.6.1761304589326;
        Fri, 24 Oct 2025 04:16:29 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898ccd88sm10596977f8f.36.2025.10.24.04.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:16:28 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:16:25 +0200
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
Subject: Re: [PATCH 01/22] drm/vkms: Introduce config for plane name
Message-ID: <aPtgCUX5kixTh2ua@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-1-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-1-a7760755d92d@bootlin.com>

Hey Louis,

Thanks a lot for this series.

I'm reviewing it on my side and adding some KUnit tests to help
me with the review/testing process. I'll send the new tests once
they are ready :)

On Sat, Oct 18, 2025 at 04:01:01AM +0200, Louis Chauvet wrote:
> As planes can have a name in DRM, prepare VKMS to configure it using
> ConfigFS.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c |  4 ++++
>  drivers/gpu/drm/vkms/vkms_config.h | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_drv.h    |  5 +++--
>  drivers/gpu/drm/vkms/vkms_output.c |  6 +-----
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++++--
>  5 files changed, 38 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index f8394a063ecf..ed172f800685 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -350,6 +350,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		seq_puts(m, "plane:\n");
>  		seq_printf(m, "\ttype=%d\n",
>  			   vkms_config_plane_get_type(plane_cfg));
> +		seq_printf(m, "\tname=%s\n",
> +			   vkms_config_plane_get_name(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -390,6 +392,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  
>  	plane_cfg->config = config;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
> +	vkms_config_plane_set_name(plane_cfg, NULL);
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&plane_cfg->link, &config->planes);
> @@ -402,6 +405,7 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
>  {
>  	xa_destroy(&plane_cfg->possible_crtcs);
>  	list_del(&plane_cfg->link);
> +	kfree_const(plane_cfg->name);
>  	kfree(plane_cfg);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 4c8d668e7ef8..b69c35097ba0 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -35,6 +35,7 @@ struct vkms_config {
>   *
>   * @link: Link to the others planes in vkms_config
>   * @config: The vkms_config this plane belongs to
> + * @name: Name of the plane
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> @@ -47,6 +48,7 @@ struct vkms_config_plane {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	const char *name;
>  	enum drm_plane_type type;
>  	struct xarray possible_crtcs;
>  
> @@ -288,6 +290,30 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->type = type;
>  }
>  
> +/**
> + * vkms_config_plane_set_name() - Set the plane name
> + * @plane_cfg: Plane to set the name to
> + * @name: New plane name. The name is copied.
> + */
> +static inline void
> +vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
> +			   const char *name)
> +{
> +	if (plane_cfg->name)
> +		kfree_const(plane_cfg->name);
> +	plane_cfg->name = kstrdup_const(name, GFP_KERNEL);
> +}

I think we should limit the name to a set of well-known charaters.

The reason is that, in libinput, we had a format string vulnerability
due to the kernel exposing devices with names containing strings like
"%s" in the name (CVE-2022-1215):
https://gitlab.freedesktop.org/libinput/libinput/-/issues/752

In my opinion, we could avoid surprising user-space too much and allow
only a set of "safe" characters.

> +/**
> + * vkms_config_plane_get_name - Get the plane name

Missing "()":
vkms_config_plane_get_name() - Get the plane name

> + * @plane_cfg: Plane to get the name from
> + */
> +static inline const char *
> +vkms_config_plane_get_name(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->name;
> +}
> +
>  /**
>   * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>   * @plane_cfg: Plane to attach
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index db260df1d4f6..9ad286f043b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -225,6 +225,7 @@ struct vkms_output {
>  };
>  
>  struct vkms_config;
> +struct vkms_config_plane;
>  
>  /**
>   * struct vkms_device - Description of a VKMS device
> @@ -298,10 +299,10 @@ int vkms_output_init(struct vkms_device *vkmsdev);
>   * vkms_plane_init() - Initialize a plane
>   *
>   * @vkmsdev: VKMS device containing the plane
> - * @type: type of plane to initialize
> + * @config: plane configuration
>   */
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type);
> +				   struct vkms_config_plane *config);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 2ee3749e2b28..22208d02afa4 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -19,11 +19,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		return -EINVAL;
>  
>  	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
> -		enum drm_plane_type type;
> -
> -		type = vkms_config_plane_get_type(plane_cfg);
> -
> -		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
> +		plane_cfg->plane = vkms_plane_init(vkmsdev, plane_cfg);
>  		if (IS_ERR(plane_cfg->plane)) {
>  			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
>  			return PTR_ERR(plane_cfg->plane);
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e592e47a5736..263376686794 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -11,6 +11,7 @@
>  
>  #include "vkms_drv.h"
>  #include "vkms_formats.h"
> +#include "vkms_config.h"

Nit: Includes are sorted alphabetically.

Jose
  
>  static const u32 vkms_formats[] = {
>  	DRM_FORMAT_ARGB8888,
> @@ -217,7 +218,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>  };
>  
>  struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type)
> +				   struct vkms_config_plane *config)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_plane *plane;
> @@ -225,7 +226,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>  					   &vkms_plane_funcs,
>  					   vkms_formats, ARRAY_SIZE(vkms_formats),
> -					   NULL, type, NULL);
> +					   NULL, vkms_config_plane_get_type(config),
> +					   vkms_config_plane_get_name(config));
>  	if (IS_ERR(plane))
>  		return plane;
>  
> 
> -- 
> 2.51.0
> 
