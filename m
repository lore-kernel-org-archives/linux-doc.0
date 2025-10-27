Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7A2E7645
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761556777; cv=none; b=kuOs/32GfTxEJ8ERUjtuM+wRs/ib34N3IUVBbY8Ybx/S6zcsdTE/SDSEMWObWysGkleXTIq8TuJz8ewewiOziWHTRzAQMehchJSUm3ZHiU0dBAYNTERKFxp1U4ny+Ps51fq/8SlHZXJ7tTanZou0PEMeD7OuU9E9KDJHW/oUwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761556777; c=relaxed/simple;
	bh=aUR/o5Tzh5jjaEbJxxPdEANvkhGhslkHX1jzmGcUy5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PESa2W4A4oCo7QwueMLwykhwWr5IxocinLUi1M4hIEUXQjzB8/Ay2A7DrzjQhff75vHBLfdzNJajCmC0BYx8IyPq2gAWQlr2Raa+PRzJLRHg/jPbSdvVVVN2OT4GpPpNZmW0s8oqK8i5V/rpO/5gI9DfuZVhYxQFsxFBEVNLEV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWGKz4OY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWGKz4OY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso33092085e9.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761556774; x=1762161574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RTI5qEHo4F3tyayqLpNzKrDWrYSmqs4Q2J88vtSyuEo=;
        b=YWGKz4OY8gqnUHRLrVq3MsQKjopX4CDnskVo4/YmHVKGZIn58ndDbfesfldU/XOYAl
         kFV4RhRD54T/x7nbWe0TpkQGw5mGeiD2KS8FEXnHf1NU+DanDMxzfDz80M0QRlvO9VoB
         k2kJjqqE9d5Vg5t7b4AHmIVM+nbIDZpu3ACfnIzrt3VPToQFiQzGURuzoQOpR5mmxE3X
         kN1Cybp1EOd6hYqZ+bLZBNcjT+Hy3E+EcMVwj8dPYLkXzoQxb5pkuX9zEUidp/akTCbY
         1c7S36CIU4tembJxBOXPf4wJbUfQ0dNlSh5gNz50xDEPPDJmXn1BP6iLmD1cQgJAV8Ss
         BdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761556774; x=1762161574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTI5qEHo4F3tyayqLpNzKrDWrYSmqs4Q2J88vtSyuEo=;
        b=FXInNHDIYsSSFWPhh+GHW9Z7rd56/KloDmHMybcZUk1ADbqUi2KZ4s5vOJd+tjKNLV
         P0L9qnCf+8C7Qq56yujwqil8fE6nQI+nbJ+Gx5tL4+izdo6o78k5CLGin9mSZ1vdn+U/
         YMGsCPnJ11YO67p2CzZ/o6h5gN/3yEkhsw7ILKRzv28BD+ZCbAXhUxTX2H4dYvDThJZs
         PaWd/1lYf2zB8Q/Aq72wv0vcUR8Aw+csmYWD37jzLGDw4/4+vh33FUTgkr7uls4PWmg8
         vicUpTJ8350fI+fEn0YYtFxxV0IP71xWgq9EFn6jVTeiTNbtTWn/DY7BnKMtb8ZYevUt
         G8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUVfNYWfwhE+LlHcJaUtNVRTzhLf1BIg4/tMINT8Antndl8BIy8bFmEtPziDGCLfou84zc97RJERr4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw43Q2fcGi5GGWc3xB+nBpDiGOuCoU5n0431GhwPgeG6XPl5rNS
	x1gWsYUhZsMzAyk7r6DQkJR9q8wcYA/w34d1EIEfqP/UJxydmq8byhpL
X-Gm-Gg: ASbGncv620mYYTqKs/rV6H2uVZ4YlzbEnkG/TbzXtcCoNw5jDuZeV/6kGzZ56a4+u4k
	LNUjgEqGT2xdb60IIA4G+4i1L46BXow82DnpjUw/A/j+RG7MMk98meXCl/CqjRka38y8bbEcuZ+
	uzHpG7DB2qy1wAoAVAqrbXl7CL2jRuXpl2bVLHj+bDQbzZ5rBP7D/XTdn0jwLWiV6hgLwyLjC7O
	0t12pnz0U7SWEKTkMzlGGrazIID489phbfdbtuhqi8mHUbkp3RXU5BpnQtfnXlDQSjxKHJ4JogR
	WHDjzs/TMVKytvF64ilRyueItmquxCtUs1mNosuFX40aaU8X7tIWBJa0iOCz0G97rjkQb+Y0gfI
	+VUt1/Z1zarO9OcESN8fH4yGQ8P627NNsIoK4h6h3dQ1hRBPuwLfJvDM+HeLO//zBGtH/Ev3637
	UqOXcfDaVr
X-Google-Smtp-Source: AGHT+IEYfZuDR+EDAVwmqpUFyDB0rjYL884Z2JT6vB2wdMgxcgM2I8sCQOec+I32TSlNthShfx7FGQ==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr297376615e9.30.1761556774328;
        Mon, 27 Oct 2025 02:19:34 -0700 (PDT)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df6b9sm13577660f8f.44.2025.10.27.02.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:19:33 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:19:32 +0100
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
Subject: Re: [PATCH 13/22] drm/vkms: Introduce configfs for plane zpos
 property
Message-ID: <aP85JP02YJdVkYJ2@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-13-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-13-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:13AM +0200, Louis Chauvet wrote:
> Modern compositor rely on zpos managment to offload some processing to
> deticated hardware. In order to test multiple configurations, add zpos
> configuration to configFS.
> 
> Introduce multiple attributes to configure zpos:
> - zpos_enabled - Create or not the zpos property. If not created, the zpos
>   is undefined.
> - zpos_mutable - If the zpos property is created, allow or not the
>   userspace to modify it
> - zpos_initial - Intial value for zpos property. Must be between zpos_min
>   and zpos_max
> - zpos_min - Minimal zpos value for this plane. Must be smaller than or
>   equals to zpos_max
> - zpos_max - Maximal zpos value for this plane. Must be greater than or
>   equals to zpos_min
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |   9 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 199 +++++++++++++++++++++++++++++++++++
>  2 files changed, 207 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index deb14e7c48ea..d4ad4af45414 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 8 configurable attribute:
> +Planes have 13 configurable attribute:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -111,6 +111,13 @@ Planes have 8 configurable attribute:
>    To remove a format, use a minus and its fourcc: -XR24
>    To add all formats use +*
>    To remove all formats, use -*
> +- zpos_enabled: Enable or not the zpos property: 1 enable, 0 disable
> +- zpos_mutable: Create the zpos property as a mutable or imutable property: 1 mutable,
> +  0 disable. No effect if zpos_enabled is not set.
> +- zpos_initial: Set the initial zpos value. Must be between zpos_min and zpos_max. No
> +  effect if zpos_enabled is not set.
> +- zpos_min: Set the minimal zpos value. No effect if zpos_enabled is not set.
> +- zpos_max: Set the maximal zpos value. No effect if zpos_enabled is not set.

Aren't zpos_min/max also ignored when zpos_mutable is false?

>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 528f22fa2df1..fd1be7292058 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0+
> +#include "asm-generic/errno-base.h"

Accidentally included by IDE?

>  #include <linux/cleanup.h>
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
> @@ -679,6 +680,194 @@ static ssize_t plane_supported_formats_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_zpos_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	bool enabled;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		enabled = vkms_config_plane_get_zpos_enabled(plane->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t plane_zpos_enabled_store(struct config_item *item, const char *page,
> +					size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	bool enabled;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_plane_set_zpos_enabled(plane->config, enabled);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
> +static ssize_t plane_zpos_mutable_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	bool mutable;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		mutable = vkms_config_plane_get_zpos_mutable(plane->config);
> +
> +	return sprintf(page, "%d\n", mutable);
> +}
> +
> +static ssize_t plane_zpos_mutable_store(struct config_item *item, const char *page,
> +					size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	bool mutable;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	if (kstrtobool(page, &mutable))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_plane_set_zpos_mutable(plane->config, mutable);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
> +static ssize_t plane_zpos_initial_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int initial;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		initial = vkms_config_plane_get_zpos_initial(plane->config);
> +
> +	return sprintf(page, "%u\n", initial);
> +}
> +
> +static ssize_t plane_zpos_initial_store(struct config_item *item, const char *page,
> +					size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int initial;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	if (kstrtouint(page, 10, &initial))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		if (initial > vkms_config_plane_get_zpos_max(plane->config))
> +			return -EINVAL;
> +
> +		if (initial < vkms_config_plane_get_zpos_min(plane->config))
> +			return -EINVAL;
> +
> +		vkms_config_plane_set_zpos_initial(plane->config, initial);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
> +static ssize_t plane_zpos_min_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int min;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		min = vkms_config_plane_get_zpos_min(plane->config);
> +
> +	return sprintf(page, "%u\n", min);
> +}
> +
> +static ssize_t plane_zpos_min_store(struct config_item *item, const char *page,
> +				    size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int min;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	if (kstrtouint(page, 10, &min))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		if (min > vkms_config_plane_get_zpos_max(plane->config))
> +			return -EINVAL;
> +
> +		if (min > vkms_config_plane_get_zpos_initial(plane->config))
> +			return -EINVAL;
> +
> +		vkms_config_plane_set_zpos_min(plane->config, min);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
> +static ssize_t plane_zpos_max_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int max;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		max = vkms_config_plane_get_zpos_max(plane->config);
> +
> +	return sprintf(page, "%u\n", max);
> +}
> +
> +static ssize_t plane_zpos_max_store(struct config_item *item, const char *page,
> +				    size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int max;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	if (kstrtouint(page, 10, &max))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		if (max < vkms_config_plane_get_zpos_min(plane->config))
> +			return -EINVAL;
> +
> +		if (max < vkms_config_plane_get_zpos_initial(plane->config))
> +			return -EINVAL;
> +
> +		vkms_config_plane_set_zpos_max(plane->config, max);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, supported_rotations);
>  CONFIGFS_ATTR(plane_, default_rotation);
> @@ -687,6 +876,11 @@ CONFIGFS_ATTR(plane_, default_color_range);
>  CONFIGFS_ATTR(plane_, supported_color_encoding);
>  CONFIGFS_ATTR(plane_, default_color_encoding);
>  CONFIGFS_ATTR(plane_, supported_formats);
> +CONFIGFS_ATTR(plane_, zpos_enabled);
> +CONFIGFS_ATTR(plane_, zpos_mutable);
> +CONFIGFS_ATTR(plane_, zpos_initial);
> +CONFIGFS_ATTR(plane_, zpos_min);
> +CONFIGFS_ATTR(plane_, zpos_max);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> @@ -697,6 +891,11 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_supported_color_encoding,
>  	&plane_attr_default_color_encoding,
>  	&plane_attr_supported_formats,
> +	&plane_attr_zpos_enabled,
> +	&plane_attr_zpos_mutable,
> +	&plane_attr_zpos_initial,
> +	&plane_attr_zpos_min,
> +	&plane_attr_zpos_max,

LGTM, other than my previous comment on adding validation in this layer.
It can force to change attributtes in a specific order. I think we should
only validate in vkms_config_is_valid().

>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
