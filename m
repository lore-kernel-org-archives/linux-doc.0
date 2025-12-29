Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F4D2C08C2
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767023523; cv=none; b=bhBXtD9JIPXJ53IKGVdPsUe2+ecso5ReMgjVOcKF86IDez55nImqTAXkAAb8Lc3kBXuCw6wIKkFYW+FMoElmMh/dKJpxsGgyAqnW2LjoTxbN1eqLdEa3wGGW/rGCbdvjzgknngOblMLg/Km8WXMnGUJT/rNhRMD2C1Rpnpc0/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767023523; c=relaxed/simple;
	bh=HWfDVWpAW+W36QLoJJLhXQL6lFB500muMyA44KQ8NAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9mPS8MhcUzCPHGMmGwyclkOOYLLPHFx0O9OfgO4OEvP70l7i+wVUugZT5VA+ykqriC31+j6eYLBZ0p3sKs7ks3Ru7399/NuzwlSxWrpiPSO9nbGw68xpNCuJUPDdeVtCy4f0IyXczUGoTpwpfiL+/fQT6CIGKDDE8pgPmblB68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cppA13vw; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cppA13vw"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47d3ffa5f33so14933385e9.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 07:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767023520; x=1767628320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r+1e82K7qoFHgWEqXd17Blm6g8fb25C94TiYEboEbs4=;
        b=cppA13vw4qI56MBu0eKdayjB9kwZtcnEqFy/yA+hOvplKMBhVD30FubXZLzAIXbYHQ
         tPlxw0+LNldMn1pBSKA55kMxlSb5pl8jD6lv1wjk76LAHs/h2t0AcdKATSMlIVJd0VH0
         aJPYDSwf9KVGwZPlqncX0Pky7BxHRfugCer5pgvcfnBKFhxDo8pa+EYKYBwiEmxHVI+u
         Z0s5oxJt0WlaEPihPLm2hXews5hadc9aU4giqj77ZhD7kNOa4Ubuq/ZKl6Ju5zxV04Fp
         1/0qKbrdEa/6HyfNKruj+OiDuzfowe8MzxGDxZ3wvvXI2LDxqMKYTnZEvtPpUHwvqO9U
         QaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767023520; x=1767628320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+1e82K7qoFHgWEqXd17Blm6g8fb25C94TiYEboEbs4=;
        b=fI2BnbC4jcC4JpPhGtFotJhjX9cLm5cd3QUvmyvuOToN+KTH13lUbyLbWt72QPX5EO
         kYKbPS0Fe+as6PRLwo1AcNOs/tNV5ObRgOzYukR4mHoP1tfuLNze7FmG2nrfbssrwsxR
         tRk8JN4xKw8VJqn47IiHxkiqrjFOhrFhxK91PoUpeUbJ4kiK8xhJJisFBg7+CNhUA5So
         f9UXBsmwcrFaNbeZn0JlrufqGN+XDdyJ1KC6F1WdqN+XMx/AR91YJT+CkbGb6ZrPIsX8
         /2cYicJXzsygsiHGc2I/nMZ51lo3ZuOPCfX70B36krdi26wWenUAUg+I4dlG+xhR0bje
         RxBw==
X-Forwarded-Encrypted: i=1; AJvYcCVoq6G027VhZRV6xAH8AZR8Pz64I8UAsg5RegjldABSlVDUVRqch2GEpf639OnohIvSyRl7N1v8WYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJ1AyxsTqbSP5PV9EveBmDDF0+0errZ+aroirnqID3HMN/aAT
	o7gVj/KG9lhCS0TBmAucEY7s2wukucW0Ps3GdYcOSnLgCZ/X7X76/6dE
X-Gm-Gg: AY/fxX4SWDSZ55folRvioAyeoSXqstEoig9M7es62XbMIlWcthTp5i3EQ5/ay+iTFhb
	/NXGk0033pw7gfvCmO1LS0MZrlyVtIsY70TEIr+N3mG7qzm9KIrVc2KLMrFil90NgXfUoveu23+
	1L1hfCjVWNjN0PpoMt3FMZJPQcH3TRxDFNlzx/TJYVjKuYT0p42wMm2Y6Z+bYsynhvC5/qrg1Zg
	CE+2jufnMv42+OsytPMdWhCvKysmESEiWe6ronitOeCkdB7JEkb9CHYsMED2biI156jrKXr/tVL
	T0JrPEKewptkMkpUu5mWQ/byoV4upryAyLTjHDyizigUZKq239RXHe4nuJfekeiDu+03ezocR9q
	7b0fvnL8RAUg16baMLJHIOfy/Q30Aghh/226V8vppHiREQ94sTNLM6zhIzEjwk21AetIeqSnB7t
	pUOwSXHXG2mw==
X-Google-Smtp-Source: AGHT+IEojd66/KRf/+AdS55kro88HIpMthbNVHbK/I9tDZ6XYWlwKV3LZP6ceu8h/WnqqV4S9HZPjg==
X-Received: by 2002:a05:600c:45c5:b0:47d:4fbe:e6d2 with SMTP id 5b1f17b1804b1-47d4fbee7b1mr99109135e9.12.1767023520288;
        Mon, 29 Dec 2025 07:52:00 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19362345sm543465845e9.6.2025.12.29.07.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:51:59 -0800 (PST)
Date: Mon, 29 Dec 2025 16:51:58 +0100
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
Subject: Re: [PATCH v3 07/33] drm/vkms: Introduce configfs for plane name
Message-ID: <aVKjnhrDCYLvn5iu@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-7-ba42dc3fb9ff@bootlin.com>

Hey Louis,

On Mon, Dec 22, 2025 at 11:11:09AM +0100, Louis Chauvet wrote:
> Planes can have name, create a plane attribute to configure it. Currently
> plane name is mainly used in logs.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  6 +++++
>  Documentation/gpu/vkms.rst              |  3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 43 +++++++++++++++++++++++++++++++++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 0beaa25f30ba..6fe375d1636f 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -103,6 +103,12 @@ Description:
>          Plane type. Possible values: 0 - overlay, 1 - primary,
>          2 - cursor.
>  
> +What:		/sys/kernel/config/vkms/<device>/planes/<plane>/name
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Name of the plane.
> +
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 1e79e62a6bc4..79f1185d8645 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,10 +87,11 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 1 configurable attribute:
> +Planes have 2 configurable attributes:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> +- name: Name of the plane. Allowed characters are [A-Za-z1-9_-]
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 506666e21c91..989788042191 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -324,10 +324,53 @@ static ssize_t plane_type_store(struct config_item *item, const char *page,
>  	return (ssize_t)count;
>  }
>  
> +static ssize_t plane_name_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	const char *name;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock)
> +		name = vkms_config_plane_get_name(plane->config);
> +
> +	if (name)
> +		return sprintf(page, "%s\n", name);
> +	return sprintf(page, "\n");
> +}
> +
> +static ssize_t plane_name_store(struct config_item *item, const char *page,
> +				size_t count)
> +{
> +	struct vkms_configfs_plane *plane;
> +	size_t str_len;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	// strspn is not lenght-protected, ensure that page is a null-terminated string.
> +	str_len = strnlen(page, count);
> +	if (str_len >= count)
> +		return -EINVAL;

I made a very quick review of v3 and I'm sending the initial issues I found, but I'd need
to do a deeper review.

This check is preventing me to set the name. For example, running:

$ echo "planename" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/name

Fails because str_len = 10 and count = 10. Does the same happen on your side?

Jose

> +
> +	if (strspn(page, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-") != count - 1)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		if (plane->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_plane_set_name(plane->config, page);
> +	}
> +
> +	return (ssize_t)count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
> +CONFIGFS_ATTR(plane_, name);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
> +	&plane_attr_name,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.2
> 
