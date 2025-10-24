Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C37310636
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319684; cv=none; b=Y1pZS+bJMbTo8KXIFrZxYvcjR1RV5+nwKDfUDv3nj7eciwibYzFULarlANswGUKbf+mYW88BLlvmsDC7ugj7YjUVEJIB/YsIKqQLhEl4j3TI3CFP6kD+rxt6grFJoT5qsqhDzMGOrV+4Bulg6yE2OUet8uc0nJLIsReoqT8oImo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319684; c=relaxed/simple;
	bh=V0ye+jYnnU7DLxcZvpfHDeDTB6NQu4sOvjItidqGxhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUTfHpQIgasjOt/9fm9qU//Tp8aLIIrqcDwjHVE8pUTV2onA9SgdUyCvK8PQZdKbm9Dht8B9uyHPFWB+vOxQ1OLxBFe7yei+HTHYwko0dzMdHnOH0udYAQ5Qm5bvvkejKDpsri17nPPS6AeXF4obDhD0c9yEPmNQjNKqov5CQ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXCS8wDW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXCS8wDW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ece1102998so1507495f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 08:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761319679; x=1761924479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ztNfXSF1NkhyWiUsHRf36r0DXviZBccOSUgahHp2yUo=;
        b=AXCS8wDW6acPgg5WtzxUE/V84/wV4XbgmO1aSszul0WjTqbxwUjpvmHeQ0YNOj0Iv+
         KybnMiMYmEyJ0fgkJLUInYamoqgHdn+CNYIhp+t4BbJH+PdJc0cFB5iKSdVTFGBoBesK
         uP98IV0CxoW2I2Fx2w75J4MfMy+TAj5HsVUwygcLbpg97qyxoro3Jrdq3XDDxjh/lHvn
         enlozyHhi3n6cKI6LmEHrrQJb31dJQ5dEqMAlvGGn+bc860S7u0tKH/zyR/6M9pSkh34
         QsauX3eEWpNGzZZfUwe8Nx5zWSWCnG/JHCYBgS0RZbb0f+bOSlCMfb8A0CJllZroH6D9
         BfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761319679; x=1761924479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztNfXSF1NkhyWiUsHRf36r0DXviZBccOSUgahHp2yUo=;
        b=rRaHp12FIuw2P+AoHXMK7lZUeIq+kKxuzGRWKk9nEU2ax1Bww2z51uJSg+DPni0ZB8
         sudBJnA4UwpmM0gLiqtrjSLV3XEi1bYFZjHmcJ4/xEOC8wOnPotBShjaOg+JInoiQwkg
         79GVFktch81yvUIgvMlMfYGfg5lX+qgCbRxaJO21BZVd38E3/zT4yn7zaK1wz+INw6t7
         kk3y+gNTU4H9SyoooUW1O8IdtgMTzo+Ypsbcq8A1ICpTzvlsFDOIb6IeYIAH3lADtj5j
         4E203n5n4DrEPwPEFjnuVWA0jwhhAIgPDf/oa5MYbU/FsTRSTj3VzswzrEwdJqBdikuu
         DdfA==
X-Forwarded-Encrypted: i=1; AJvYcCVC0m0k53W7z6eFukuqNmv8HB6DRXwZpevNNfPkvagtt8L/fiRsKDS7AHFuFpQXjuf1hzVQtgEuCBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFthXBbejgR10Fiv0zmgRx0ri05AHJN2SeHXtjPYdIQlXPLfiw
	hqUCxD3uuIihJ4YRN4AAzClnEfK1VKWiCVHueKP12axxjVJEpg2md5BL
X-Gm-Gg: ASbGncu2nc8u0m6BpfdNnChMygPb8edmTELYhCLoDGK/jzOm22y6U2OTObNN0kcwRSO
	p9IouY2AflFPyrd5FnvfWsPHJcePe5pYKvD/+9Yne3P7LAvNS9l43BQib9xLBm9Sns7tmHJfLuU
	snHHu94924aWWgQfiAYE5c+dHW9qjSgtXhyZIYQbUSQH32JqdoVsRMqMSQO3cafyWp2Dnf4nEH3
	vQpLOI9xtaqaKBCi1PxP74JNr75yZ38sDOwoWHBJ8p5YC1uNHuFL3GzkB0sWkFET/5m6D1/lvkd
	umJadkUBtbY5ATp2yX8RbMW1feKD6X+s/EFXeDbOuZI8O4+9kL+yNFPSCuOeGFcOl9s/GVJDsdK
	uqZbY5VadIJDYFoa8z4Cplnvj34CUJWcPIcDyG1MlPKFnj6dhXWGYD7BJjQdbiKbwR3XmgV0cHo
	CJusJXVjyiSA==
X-Google-Smtp-Source: AGHT+IGLdAA7lW07FJwzdHpunnfAEeHs0j7e6oglL+ICYvhCaN8vtsYMA6YmlpmQQt67WQJiySD2Xg==
X-Received: by 2002:a05:6000:40e0:b0:426:d630:52b7 with SMTP id ffacd0b85a97d-42989edb584mr4809131f8f.0.1761319678541;
        Fri, 24 Oct 2025 08:27:58 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898cceebsm9854782f8f.37.2025.10.24.08.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:27:58 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:27:55 +0200
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
Subject: Re: [PATCH 08/22] drm/vkms: Introduce configfs for plane color range
Message-ID: <aPua-4yt_rMtRCAp@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-8-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-8-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:08AM +0200, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color ranges per planes. VKMS
> supports multiple color ranges, so the userspace can choose any
> combination.
> 
> The supported color ranges are configured by writing a color range bitmask
> to the file `supported_color_ranges` and the default color range is
> chosen by writing a color encoding bitmask to `default_color_range`.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 93 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 99 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 4ff75b53a386..979f8a545498 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 5 configurable attribute:
> +Planes have 7 configurable attribute:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -101,6 +101,11 @@ Planes have 5 configurable attribute:
>    by the COLOR_ENCODING property of a plane)
>  - default_color_encoding: Default color encoding presented to the userspace, same
>    values as supported_color_encoding
> +- supported_color_range: Available color range for a plane, as a bitmask:
> +  0x1 DRM_COLOR_YCBCR_LIMITED_RANGE, 0x2 DRM_COLOR_YCBCR_FULL_RANGE (same values as
> +  those exposed by the COLOR_RANGE property of a plane)
> +- default_color_range: Default color range presented to the userspace, same
> +  values as supported_color_range
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index a4e0e054cf2d..0b280c73b0cc 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -412,6 +412,95 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_supported_color_range_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int supported_color_range;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		supported_color_range = vkms_config_plane_get_supported_color_range(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", supported_color_range);
> +}
> +
> +static ssize_t plane_supported_color_range_store(struct config_item *item,
> +						 const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_default_color_range(plane->config)) !=
> +		     vkms_config_plane_get_default_color_range(plane->config))
> +			return -EINVAL;
> +		vkms_config_plane_set_supported_color_range(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t plane_default_color_range_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int default_color_range;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		default_color_range = vkms_config_plane_get_default_color_range(plane->config);
> +
> +	return sprintf(page, "%u", default_color_range);
> +}
> +
> +static ssize_t plane_default_color_range_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_supported_color_range(plane->config)) !=
> +		     val)
> +			return -EINVAL;
> +		vkms_config_plane_set_default_color_range(plane->config, val);

Same comment about the validation here.

> +	}
> +
> +	return count;
> +}
> +
>  static ssize_t plane_supported_color_encoding_show(struct config_item *item, char *page)
>  {
>  	struct vkms_configfs_plane *plane;
> @@ -513,6 +602,8 @@ static ssize_t plane_default_color_encoding_store(struct config_item *item,
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, supported_rotations);
>  CONFIGFS_ATTR(plane_, default_rotation);
> +CONFIGFS_ATTR(plane_, supported_color_range);
> +CONFIGFS_ATTR(plane_, default_color_range);

And the mixed use of singular and plural for supported_*.

>  CONFIGFS_ATTR(plane_, supported_color_encoding);
>  CONFIGFS_ATTR(plane_, default_color_encoding);
>  
> @@ -520,6 +611,8 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
>  	&plane_attr_supported_rotations,
>  	&plane_attr_default_rotation,
> +	&plane_attr_supported_color_range,
> +	&plane_attr_default_color_range,
>  	&plane_attr_supported_color_encoding,
>  	&plane_attr_default_color_encoding,
>  	NULL,
> 
> -- 
> 2.51.0
> 
