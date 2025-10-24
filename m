Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C672494FF
	for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761319006; cv=none; b=W2I5Xv6hABq4I31kRQbhR+fH+h9IUJNmdWJUT+RaJYb27sRu5y1rrR58NIix0PtSeckrFh24R0BBA2Np1iLrAjQ/CqV88GjZLGVJ/3Ry+2eJNMUCO+t5N24ZCl8teM577enwSd79ex7kCN9jFZCMKK8XKA28Ywn43KcCimhHqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761319006; c=relaxed/simple;
	bh=jVc9hLI9fcXAku+oALxNHVDhhx0CP4iDyHCwED8hpRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA7Y/QHAhONdH46SJDm71SJqxkPxF4YBSQ3AZR76+wrhFAhomdV6slCPp1LDZJjRTIbtAsTpWVxrjOddhKYBSkgXEo+xTJcDOAU/PYrxRKzxjWroRjcIhukJzeDLqv9hlTpkKNo0LOC6PaygaVT7hFEMsKPd4rl05E9ux2C7j7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM3X7CTq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM3X7CTq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47114a40161so22773285e9.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761319003; x=1761923803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mevfSuNrxwVFTOkyY7Tm8OrvABJ1d1Eojo95+k8sZtc=;
        b=RM3X7CTqZSiGWKm11Ard7Ya2JK3OzcgT7WCRE92oCpLSwmT9i2Rt8hmOrJLjH3NrvP
         oONGswdZjhgGPUb2HNz+0Bq6j6djxl2HxJGbwu1l1FDqlwwvYERZFdDPFkAbYXP/PQpt
         VG93DSawk1mmJH1qBveFyddHMPzBS83fDRTdB2KVeiPdyzD4+6PM/26Fk8eTP1f3bA71
         AiAa5BDoP+WGqeJ/ChAuDeO+l9m6Iw9c+bj5rF/piJlbQGiurzU9U1D9/Zg0zEHXhujW
         y5UV3nvH4w+MzYHLnHO0tnxRqxR+aKtSUZ4B1M0SLJAccesDbGMi+wo7m6GkkjSk78tj
         cNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761319003; x=1761923803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mevfSuNrxwVFTOkyY7Tm8OrvABJ1d1Eojo95+k8sZtc=;
        b=Xox4QC6RfZwpRFecNLT0cQm67mYZ/pjeW+45oOl+q8NDcHUayQHC+wvqFSGnWrwHvK
         wrKC/fxqF4JsJNiEq1v+ct7wo7/gBsmDo7KofSi+wYbc/Ql7W0JfU80NzC+oUz5UqMYZ
         tyFg7d6h10T4X9sULPeJXT2/KL02WfBn9lzsYTlQ5xRHsYaE4F0IC0qyGfppoyfThI1Z
         QCkv9bCBAIGtNrnqBCl28iwuR2WViVz96EdGF7IvCIwliCeMem/5mQnMUlK4KlH3ZGiF
         fyrOqufQb/S6OGRk8iIxytNgdcq+67AcTUhdp2Hu3LLobNs2OMYlaWYxRAIkC1ofh27r
         8ffQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ia+tZ4MDGVJdV03dAV5O3mqXDetGvbKPC02Bmt2dH9VFQ7s1qqeLWjQULTE0sXewT7jydpuBPyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKpLTWmWRNg0U5bJg0/Z0vpfeV0VKuWcTijkOPzFTZMuG8Zc7
	45Er/XABvmwYwAXGGMDGPlMOOez3BiwhA/BtESWhwVQ74uG46MD0M6nR
X-Gm-Gg: ASbGncu6IySckqENqziKcz64kiplrbM4deLoscjIkRmmrWpsOt0Mmegr23QK0c/UoQd
	I+JHuk4tjbtZ3vBDD9zhhla8rcF68DewnVUS34uOt/jzPpDGdapXLHhTvzF7IFdi6sdMJvshDwX
	1qWJ3emwtLpUkuKTT3TmHxvA0My/bOhwVPBXducIx2arC2RmwDbnevX/9zxTJYTpDdfIqEfzPY0
	CbulTlH7oUS3xSDQkCR54D+jh440rKxuvp91bAey7UHKE3dth8IbxjPk3vHeaHyC0iw+i7li+bJ
	k/a7gE5AF4eFTkN/NYqZKNpqyEumxLvehCquQzNfHKsSpRjajvOI+Jbwm0AZFAho12+mEkP0DTz
	YNoK+J3/ueRVWHEKA6mSxfIOVEjNs++PFyk8zQwVjBrjibuPxOu+nRm8l9Z9vqUvb38HR4JByKa
	8RrsbszgXjMA==
X-Google-Smtp-Source: AGHT+IEA18WK4Q9IiYqGhwYZgRRsCaQtZ15viH6p/QSrbM4l3uPsWojVndH+d8P9+fufilJ2qEw4Ew==
X-Received: by 2002:a05:600c:3512:b0:46e:5b74:4858 with SMTP id 5b1f17b1804b1-47117877122mr173891065e9.13.1761319002904;
        Fri, 24 Oct 2025 08:16:42 -0700 (PDT)
Received: from fedora ([37.29.213.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4378cbesm150983915e9.16.2025.10.24.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:16:42 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:16:39 +0200
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
Subject: Re: [PATCH 06/22] drm/vkms: Introduce configfs for plane color
 encoding
Message-ID: <aPuYV5D_QktyNSmM@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-6-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-6-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:06AM +0200, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color encoding per planes. VKMS
> supports multiple color encoding, so the userspace can choose any
> combination.
> 
> The supported color encoding are configured by writing a color encoding
> bitmask to the file `supported_color_encoding` and the default color
> encoding is chosen by writing a color encoding bitmask to
> `default_color_encoding`.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |   7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 102 +++++++++++++++++++++++++++++++++++
>  2 files changed, 108 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index a432968cc711..4ff75b53a386 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>  
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>  
> -Planes have 3 configurable attribute:
> +Planes have 5 configurable attribute:
>  
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
> @@ -96,6 +96,11 @@ Planes have 3 configurable attribute:
>    (same values as those exposed by the "rotation" property of a plane)
>  - default_rotation: Default rotation presented to the userspace, same values as
>    possible_rotations.
> +- supported_color_encoding: Available encoding for a plane, as a bitmask:
> +  0x01 YCBCR_BT601, 0x02: YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
> +  by the COLOR_ENCODING property of a plane)
> +- default_color_encoding: Default color encoding presented to the userspace, same
> +  values as supported_color_encoding
>  
>  Continue by creating one or more CRTCs::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 450e45e66a45..a4e0e054cf2d 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -412,14 +412,116 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t plane_supported_color_encoding_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int supported_color_encoding;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		supported_color_encoding = vkms_config_plane_get_supported_color_encoding(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", supported_color_encoding);
> +}
> +
> +static ssize_t plane_supported_color_encoding_store(struct config_item *item,
> +						    const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_default_color_encoding(plane->config)) !=
> +		     vkms_config_plane_get_default_color_encoding(plane->config))
> +			return -EINVAL;

I think that the same problem that I mention having to configure
plane rotation in 2 steps applies for color encoding.

> +		vkms_config_plane_set_supported_color_encoding(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
> +/* Plane default_color_encoding : vkms/<device>/planes/<plane>/default_color_encoding */
> +
> +static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int default_color_encoding;
> +
> +	plane = plane_item_to_vkms_configfs_plane(item);
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		default_color_encoding = vkms_config_plane_get_default_color_encoding(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", default_color_encoding);
> +}
> +
> +static ssize_t plane_default_color_encoding_store(struct config_item *item,
> +						  const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> +	int ret, val = 0;
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
> +		    BIT(DRM_COLOR_YCBCR_BT709) |
> +		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation */
> +		if (plane->dev->enabled ||
> +		    (val & vkms_config_plane_get_supported_color_encoding(plane->config)) !=
> +		     val)
> +			return -EINVAL;
> +
> +		vkms_config_plane_set_default_color_encoding(plane->config, val);

As I mentioned in the previous patch, I think that default color encoding
is sometimes a bitmask and sometimes the actual color?

> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(plane_, type);
>  CONFIGFS_ATTR(plane_, supported_rotations);
>  CONFIGFS_ATTR(plane_, default_rotation);
> +CONFIGFS_ATTR(plane_, supported_color_encoding);
> +CONFIGFS_ATTR(plane_, default_color_encoding);
>  
>  static struct configfs_attribute *plane_item_attrs[] = {
>  	&plane_attr_type,
>  	&plane_attr_supported_rotations,
>  	&plane_attr_default_rotation,
> +	&plane_attr_supported_color_encoding,
> +	&plane_attr_default_color_encoding,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
