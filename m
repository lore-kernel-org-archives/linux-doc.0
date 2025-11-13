Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73C0128816
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043482; cv=none; b=D2BIPeoWlYmQ1foHHAl8FhfCzrFyZjVej12p/W7Nf7HXctOHhDQQfTtOdI+yVd7Psd0siTQA2Ge9BRTX441XJoHkh+QvfYhpJdd+B94YQwMx0W8ELOQkJvrLIkDJE7EowXya8STChsXxb5PJuxXl0ptdt/hfjT65PjRXPeEH3dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043482; c=relaxed/simple;
	bh=WfkQSgrOUef3gKlt09s448PRBXvpCHLB991nUWuTyRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfGmiqTNteYcx3XlGl1yWo+oB/oKuLWSZG21ewzfVSSjY5iTPseqGZiGXjoOu0hxTmWRaRQmE1wPYdeQBJNaYGvq5TV5N2Wy4Ou/U3Xg5SsAN/FQWSR8Sfh0D8QH42di1cBmw4P5f26w8sL0psWIm3d3sZzNHJPMtvDPife6k7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knlOQHo9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knlOQHo9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47754e9cc7fso5502055e9.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763043479; x=1763648279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ieqda0G4yVO5G82YHI1y7YhCqMKEjUvALjT+1Xp4wgc=;
        b=knlOQHo9g9h9aBEs05DWxTJMoSOgQLuZ2MApGJ2Dq9YczVy7DRvkkKzraj0uuEPweO
         E6n9Fn2mKmBCzn/7KVJHEek8nybGlAtaYRmVxq/wUHzyrqPnWDxoPtbOF8OjAPhUhrGx
         G0m7dcd78X0vrWKLG0JTO7mHio0rMRdEt4wvsMF1yibzs9HRz5RDe/EVQNxVzup1gZrL
         EX5t70p7Aiw7T+DJOwPSNWNj4j6ILHbaqHRKqsaYjYNt71m967GwGcnlIfmnHXmPTAxJ
         UOVb8J9rZwYfehOJcnN3FPebBhKtoAVcsuWHtEs3IBRzv+8ebse9lPrCz+fNEEiXLjk5
         feyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043479; x=1763648279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieqda0G4yVO5G82YHI1y7YhCqMKEjUvALjT+1Xp4wgc=;
        b=s0XUyl++LnvcC963nx/TdpAUDn2lgCtL/BZBx47j8BBBEG2i9ghzu/ORwfsxHzEQ2L
         V26rl5gSKKb+uOdG0OS4Rz+yzIdjJKmYU6tREmHOg4pmtciFm/Ui1Zd974mufAjE9zpe
         UNBCyH6ZxsJZ2UCzgTkV4pw1yIV1vC1AdftRPFeCCDz/ZIX+m4vBbQI2rPczlQ0br4HN
         gIxHQ+LRkIgQGdfGt+Hz/+58umcLrUX5bR3hdyC0vHBCh1gOxYUfhgN/EelLc9n14olk
         Hc0L+dpJFDLEaWEz+0rmvoJAbwONY76KmnkOpGk8PpbbxogqzSubHc77ActyDZ9/Xwot
         g75g==
X-Forwarded-Encrypted: i=1; AJvYcCX2k6b4OPdhDxZ7pGcXaqBCTJtZiDpStAzx2so7T5x5fHXegB4JnBEL4ScdvoIvPuJ3perUquZ1/R0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQi2FmDTzw5frrxcXU5W+cl7UAUyiYfL7e8iE232gDdGq0xq3A
	sTLjN+nnz7EeAikQaiv51EOY9JwVATLm/V4jUakKkpYhZi81eWWmcEWU
X-Gm-Gg: ASbGnctkYHnZQV8Y50VMZsl5Gf37NcoHAiY9/yNVm6zKSMKpsaDimVjDPCXSoctQZE/
	SGvUCH59MfQ+JxASvJGuEvcoGr3ex+TCDOH6CauALpCKhtFu4MKAmnLuPfmhVxIz1KjrZpfTdCQ
	qKEDg9G1mLOFDZAL2MMHq5qHrgHjR//da8BzpLgibHQmMli8h94lheOO5yArbIu+XQSDBIpjENu
	nEIkgFmXbrfdEuYF/P0IgCxSCFVgRu9HIP7Ol/Gjq0N/RPaEpszErLtvGaWcBxAXw+Qird5vcgM
	RaRHceESNm/qNj6haOhzwQZXLaXySoGyx4H+gMQAyweGrMyV6zdX3DYLyIQ5PRogc+Frpznjekh
	A/OT7Y2VvZYfmnhf0hyEzMStPBZyiGuvvv/gHxyDQm/RaD1tXTsBJtUjeIr9MuIo+ymQRMVUlpA
	==
X-Google-Smtp-Source: AGHT+IEBW5aSjQneMUjCfuvdpLmeox+7YNbLpupeAo1lDdWVn7x/zJucaYxSBLZECcpaAE8Pc1DIIQ==
X-Received: by 2002:a05:600c:3546:b0:475:da13:257c with SMTP id 5b1f17b1804b1-477871c37b4mr65109075e9.27.1763043479023;
        Thu, 13 Nov 2025 06:17:59 -0800 (PST)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm94362625e9.3.2025.11.13.06.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:17:58 -0800 (PST)
Date: Thu, 13 Nov 2025 15:17:56 +0100
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
Subject: Re: [PATCH RESEND v2 05/32] drm/vkms: Introduce config for plane name
Message-ID: <aRXolNJJ5caay_H1@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-5-a49a2d4cba26@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029-vkms-all-config-v2-5-a49a2d4cba26@bootlin.com>

On Wed, Oct 29, 2025 at 03:36:42PM +0100, Louis Chauvet wrote:
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
> index 858bec2d1312..bfafb5d2504d 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -352,6 +352,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		seq_puts(m, "plane:\n");
>  		seq_printf(m, "\ttype=%s\n",
>  			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
> +		seq_printf(m, "\tname=%s\n",
> +			   vkms_config_plane_get_name(plane_cfg));

I discovered this while working on some basic IGT tests to validate
your changes.

I think that this triggers undefined behavior. printf() and friends
expect a non NULL value for %s:
https://stackoverflow.com/a/11589479

In my Fedora system, this prints "name=(null)", instead of an empty
string.

The same happens with the ConfigFS API:

$ cat /sys/kernel/config/vkms/test_plane_default_values/planes/plane0/name
(null)

We'd need to return in both places an empty string instead.

>  	}
>  
>  	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
> @@ -392,6 +394,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  
>  	plane_cfg->config = config;
>  	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
> +	vkms_config_plane_set_name(plane_cfg, NULL);
>  	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&plane_cfg->link, &config->planes);
> @@ -404,6 +407,7 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
>  {
>  	xa_destroy(&plane_cfg->possible_crtcs);
>  	list_del(&plane_cfg->link);
> +	kfree_const(plane_cfg->name);
>  	kfree(plane_cfg);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 4c8d668e7ef8..57342db5795a 100644
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
> +
> +/**
> + * vkms_config_plane_get_name - Get the plane name
> + * @plane_cfg: Plane to get the name from
> + */
> +static inline const char *
> +vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
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
> index e592e47a5736..73180cbb78b1 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -9,6 +9,7 @@
>  #include <drm/drm_gem_atomic_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  
> +#include "vkms_config.h"
>  #include "vkms_drv.h"
>  #include "vkms_formats.h"
>  
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
