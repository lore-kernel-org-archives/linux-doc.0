Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BF2272E4E
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 11:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761306811; cv=none; b=A45YZ/lviwgKGzuQ7D7IqK+ypPvQNvM2+W1tHbiMF17XC67N1GG0UITy9Us8CH6c4NPKhYJ0Up4PRezPLwvlPVo4fN1xN7nbhVMQt18FJwpYDYxgoZJZw9xSVctoRbKbMgpD3RS/IQL8plluqe9Q98CymCmhA5yb9ucHcOHdcic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761306811; c=relaxed/simple;
	bh=e2NphGg9MS23DkOOrlV9Jm/x3tLtOFE0rsKjHsp+D6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XICci16Q7V3bQPqtuu2t1qavPpheEXMMFe35Cx+PnqqCljXqtpzIkmZQQZs/U6JythRRudaqQ1rGI8+pz/Ty880tgz+lgNpoTkh+eQuOo3ndUwBq4kzh9pWp02l40d7+LceVpTcxzmiKGXbzXpIngJRQVa6IsbXcsRurg+lAZrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LF6IOXWf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LF6IOXWf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-427015003eeso1848207f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 04:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761306808; x=1761911608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGRrEw4wcXdorFwaqi+vw3qg5PJt2Z4q8H5R7THz1J8=;
        b=LF6IOXWfPWcSBOW0NMNWo7a1jfNzESb+xnQlAr1IoisELsIBrJ5ehvZSOCJNZvzoEF
         19Q9ztUf1ocU2zS3JC6RhYX3cD3ZHRTwoVPgslEbmKnbdc+tiyaK6WR9wvpZhrXkTO1p
         DmgQfwh8eC6ZetaUBoW4VYrExYqfhLpCNj6e5StCe81PslYYsLMun8B48CrXaCSvLxcS
         3skKGaQPl5upYdtdqFHn0eaxs++g+9Zp7AvfJeijhhj+xG2kRx/Dv9f/6asmCao4SYI5
         k5mbOAUGaGWPhoJ+rNl6nb1+56l0lOhUHRXu1JFKBbhpqFUNmUrFuDaZivsAdY2mv5DQ
         HMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761306808; x=1761911608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGRrEw4wcXdorFwaqi+vw3qg5PJt2Z4q8H5R7THz1J8=;
        b=DcxqIiKPNeuURrRczT8nl3WrKkB3zfHMVIb812Vw6hwdKmGRJPP7SLwA8AC0sCnft5
         Mn8R5DNoWyw5Jk0MMQCwqAkO64oTDFyQXX2EtSzXAmCT+CROVohs+wLECETe8RuoFHYp
         xiH0Xbze6F4NpiPna70EC+XZRJNhaBI91lHNYesQzP6QpGuu68l8qLus0IJezudNFCTF
         EXTibBMEYoGX8J7tWOcp+qP70rxy/GnDMa3UbtVzrlScvoPSLKF1TzgC4LSV4V8Lzzmb
         89xVzhtQ/sA/xMdr2XVuQy+dSlb79Y7P16zLYTAAL+wrFuT5Pkf2GCX/i9oTWYQJg3F8
         Wcug==
X-Forwarded-Encrypted: i=1; AJvYcCV8ZhqYzNI6zA7Q1Mxp3g1ShMtCd2kAIJINuXZsUn3BckODSoHeCnv8iDR2MNHkxxJjDURRSHkQo78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRjn2SDCX6KJg8S8GF+XB/ZQtG8nr5M/AiCfGR6dkA7oVThap
	1TkLu6Fq1c083jGqTSRt4mekzlNukzOqrxDW9kdR1UqQzM4hwoQZvUca
X-Gm-Gg: ASbGncvoc4kjubElTPUfGr98UvjzSX/irJy3ImTRfwwGyKjfiivwpI4gfOSPvf1e5Ss
	mi2DpuSedYIdngZyYMUvlu8KUK0mU95rglNnreveo2weAWLM048YtiIU3LJoqBPVR+ccwRA4/B9
	7PcfuuDHpU9k6HkNT6uXAKOQg5SLXEwyQTh9qbFoQDht3sUixxv+LAbFl9j9j6r+3io/4UyT4QI
	AZHyQ8WCS1+QRueCpQjLKOk4wwjvGYcbwhMctQ7+bPu3uhsAymmMQrGlKEy9J78qeOvMsMySgqO
	IGi9s3hV/kiL0+amgrMpVx+SW0ZvGDl9TJQLVIalhvfDT4rPlTRl3a7tEVmDYdWQiJZZvkXPhR4
	zsmWbmipehblyyPudPcowr82BeIVb0b83VhJRwu7PBfJWjMOzjvM6MEqFn5ya5U68zekqe4MPON
	I=
X-Google-Smtp-Source: AGHT+IH7HuFQMoipaAL9bwqFjfslgEwUXurZypDZoTSr0Qrn6+wEvE/TPAHcyLz7mEw9Bk37KsBong==
X-Received: by 2002:a5d:5d82:0:b0:428:4004:8226 with SMTP id ffacd0b85a97d-4284004ab91mr13628155f8f.34.1761306807817;
        Fri, 24 Oct 2025 04:53:27 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e77dasm8910351f8f.2.2025.10.24.04.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:53:27 -0700 (PDT)
Date: Fri, 24 Oct 2025 13:53:24 +0200
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
Subject: Re: [PATCH 03/22] drm/vkms: Introduce config for plane rotation
Message-ID: <aPtotO_FnA1i1AhX@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-3-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-3-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:03AM +0200, Louis Chauvet wrote:
> VKMS driver supports all the rotation on planes, but for testing it can be
> useful to only advertise few of them. This new configuration interface
> will allow configuring the rotation per planes.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 26 ++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h | 54 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_plane.c  |  6 +++--
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index ed172f800685..b8cabe6f6cf8 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -144,6 +144,22 @@ static bool valid_plane_number(const struct vkms_config *config)
>  	return true;
>  }
>  
> +static bool valid_plane_properties(const struct vkms_config *config)
> +{
> +	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
> +	struct vkms_config_plane *plane_cfg;
> +
> +	vkms_config_for_each_plane(config, plane_cfg) {
> +		if ((vkms_config_plane_get_default_rotation(plane_cfg) &
> +		     vkms_config_plane_get_supported_rotations(plane_cfg)) !=
> +		    vkms_config_plane_get_default_rotation(plane_cfg)) {
> +			drm_info(dev, "Configured default rotation is not supported by the plane\n");
> +			return false;
> +		}
> +	}
> +	return true;
> +}
> +
>  static bool valid_planes_for_crtc(const struct vkms_config *config,
>  				  struct vkms_config_crtc *crtc_cfg)
>  {
> @@ -302,6 +318,9 @@ bool vkms_config_is_valid(const struct vkms_config *config)
>  {
>  	struct vkms_config_crtc *crtc_cfg;
>  
> +	if (!valid_plane_properties(config))
> +		return false;
> +

I think that it makes sense to check this after we are sure that the number
of display pipeline items are correct and they are linked correctly, i.e., at
the end of the function.

Also, for testing purposes, it'd be usefull to have something like:

vkms_config_for_each_plane(config, plane_cfg) {
	if (!valid_plane_name(plane_cfg)
		return false;

	if (!valid_plane_rotation(plane_cfg)
		return false;

	// ...
}

This would allow us to have smaller functions and also write unit tests
for them easily.

What do you think?

>  	if (!valid_plane_number(config))
>  		return false;
>  
> @@ -352,6 +371,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			   vkms_config_plane_get_type(plane_cfg));
>  		seq_printf(m, "\tname=%s\n",
>  			   vkms_config_plane_get_name(plane_cfg));
> +		seq_printf(m, "\tsupported rotations: 0x%x\n",
> +			   vkms_config_plane_get_supported_rotations(plane_cfg));
> +		seq_printf(m, "\tdefault rotation: 0x%x\n",
> +			   vkms_config_plane_get_default_rotation(plane_cfg));
>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -393,6 +416,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	plane_cfg->config = config;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
>  	vkms_config_plane_set_name(plane_cfg, NULL);
> +	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_MASK);
> +	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);

At the moment, drm_info returns this rotation for the default VKMS device:

"rotation": bitmask {rotate-0, rotate-90, rotate-180, rotate-270, reflect-x, reflect-y} = (rotate-0)

With this patch, this is returned:

"rotation": bitmask {rotate-0, rotate-90, rotate-180, rotate-270} = (rotate-0)

You need to add DRM_MODE_REFLECT_MASK to avoid changing the default device.

Ideally, we should add an IGT test to make sure we don't change any value
accidentally.

> +
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&plane_cfg->link, &config->planes);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index b69c35097ba0..3c3cbefcc67f 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -39,6 +39,8 @@ struct vkms_config {
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> + * @default_rotation: Default rotation that should be used by this plane
> + * @supported_rotation: Rotation that this plane will support

Missing final s: @supported_rotations

>   * @plane: Internal usage. This pointer should never be considered as valid.
>   *         It can be used to store a temporary reference to a VKMS plane during
>   *         device creation. This pointer is not managed by the configuration and
> @@ -50,6 +52,8 @@ struct vkms_config_plane {
>  
>  	const char *name;
>  	enum drm_plane_type type;
> +	unsigned int default_rotation;
> +	unsigned int supported_rotations;
>  	struct xarray possible_crtcs;
>  
>  	/* Internal usage */
> @@ -290,6 +294,56 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->type = type;
>  }
>  
> +/**
> + * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
> + * @plane_cfg: Plane to get the default rotation from
> + *
> + * Returns:
> + * The default rotation for the plane.
> + */
> +static inline unsigned int
> +vkms_config_plane_get_default_rotation(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->default_rotation;
> +}
> +
> +/**
> + * vkms_config_plane_set_default_rotation() - Set the default rotation for a plane
> + * @plane_cfg: Plane to set the default rotation to
> + * @default_rotation: New default rotation for the plane
> + */
> +static inline void
> +vkms_config_plane_set_default_rotation(struct vkms_config_plane *plane_cfg,
> +				       unsigned int default_rotation)
> +{
> +	plane_cfg->default_rotation = default_rotation;
> +}
> +
> +/**
> + * vkms_config_plane_get_supported_rotations() - Get the supported rotations for a plane
> + * @plane_cfg: Plane to get the supported rotations from
> + *
> + * Returns:
> + * The supported rotations for the plane.
> + */
> +static inline unsigned int
> +vkms_config_plane_get_supported_rotations(struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->supported_rotations;
> +}
> +
> +/**
> + * vkms_config_plane_set_supported_rotations() - Set the supported rotations for a plane
> + * @plane_cfg: Plane to set the supported rotations to
> + * @supported_rotations: New supported rotations for the plane
> + */
> +static inline void
> +vkms_config_plane_set_supported_rotations(struct vkms_config_plane *plane_cfg,
> +					  unsigned int supported_rotations)
> +{
> +	plane_cfg->supported_rotations = supported_rotations;
> +}
> +
>  /**
>   * vkms_config_plane_set_name() - Set the plane name
>   * @plane_cfg: Plane to set the name to
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 263376686794..6e6bfe1b7400 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> +#include "vkms_config.h"

This include is already present.

>  #include <linux/iosys-map.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -233,8 +234,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  
>  	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
>  
> -	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
> -					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
> +	drm_plane_create_rotation_property(&plane->base,
> +					   vkms_config_plane_get_default_rotation(config),
> +					   vkms_config_plane_get_supported_rotations(config));
>  
>  	drm_plane_create_color_properties(&plane->base,
>  					  BIT(DRM_COLOR_YCBCR_BT601) |
> 
> -- 
> 2.51.0
> 
