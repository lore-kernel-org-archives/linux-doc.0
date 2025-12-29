Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B4527A107
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767029176; cv=none; b=fAIOvjQV1KQ+FM6Xxwu2IKPx+gGlb+zP4SLVUFSKPhA7L9VJ3HU/YVG5wn6eg+3ducFd5BdbrWUcq1o0UBceA116ZhV6GoC1NGlBs/gDhRrnLy2lPKLzGhTnc3zOpUxg7Nsgf/cH/6lYJWRBDLtB4ZmOdB/QjvG7Paje6pxjK/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767029176; c=relaxed/simple;
	bh=q8ZzgQmPWJowajqmw14aEHk9mt2O+6caU6Rr6iTbqVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LL0j4t8ysHhu2fieFuz4fO3fW0Q2CcuUhV4gfhX/AoSzPr0IXbSj81NzGyd8v90RvtK5Ici+PF1KI1US+o3advK/P7Zi72NOjGoKwtyyt8tVm9YvnSk69uOsxIMmcsMEl/OvB54PSTaKv/qEiBUtktXJyyU3imvnNawVRMpIpPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dqdrsnql; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dqdrsnql"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so53853675e9.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 09:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767029172; x=1767633972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ae5fwqLEzbzqxY2Ws8MB1zw9Sg4yilZoV68uIEmuwGY=;
        b=DqdrsnqlpBIyqfbhU+x+D54LoFyahE3KWAmdMHbeoonwu5b/lhrSlYxE2Fw/SYgL/7
         NFk6q9C1vbk1y2ijbOH3cCdVUr9WBrQN4mhHZsh8k5J5G2nVyERNxmrknsR3moJrJG8d
         7uI43Q8oKdZI/W1vNjp5Ikp/RUTbu5R652LsKvz6OHCyq4xrkbNRgSfiOHAJEMegRAit
         r6bqzNq3cuCbpvD6dY1hjKjdsX+SiVE1u068n2K4QcYIM1julZET0s2asJeofCiYhHyP
         r3lfGd4F1j6WGXZjGCbrL0ZAnjhqd955//0h6KvY1WvgivKK3nZKna6yMjuirVF4P+xO
         vIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767029172; x=1767633972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ae5fwqLEzbzqxY2Ws8MB1zw9Sg4yilZoV68uIEmuwGY=;
        b=wPscGWJOjbKefhy07Mbq7lZP7LLBTttCMkCkEa/rDS5SWI0bzk2VersUDYi8u7lRf2
         g0j2OERS7nTMQwTFcFiAbstKDcbqZCsmt66hx774VgkQabia3Zdq4M0haewyFd5ds/7W
         sdt6lnB5TY0BwYENMJP2Y63OYYjZYLoIo97QG7/ajPDrmlyohWubsH7mE+ZaCXG7UwHN
         VFkp319oO5cHfg37jYeWodW31VfTRKLuG0GLuBQMVFy/n+7JjzqyHAqHfD5GdefRw9oY
         QZBWSobFKwStjaBKqe0SCeEgii5ov5XT9Tykyo8HCgnrbn8V8XZk5YAPE2nk0qf2i03B
         qgQw==
X-Forwarded-Encrypted: i=1; AJvYcCWDxspwUWhcoy/IVa8NLWMoQ8OhnjEsAM01RGz8KtEQ2Qr1xoGTOgRev5/J2mGZN6mjx/ahhGQUJ88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAeNiZOdD3oT+gm/sZ0rBZGnYZZ8FJlzzQUaJ3acFBhJe6peT6
	HRYLAfWB1xlgrQTM2PeatSQdKPXB9fX24ZpPsc+I/RVc5s+vjbCar9bZ
X-Gm-Gg: AY/fxX7a+ABfeDGWLcayskBWS6eWOESeq2n1x5e65vWP7zD+AeiRu7RuwAq9h4Zli/J
	UwH+v8qVr46b5/GKn9fgLCtBB5A+TyHzQezcL/9Rrm3c+byqrgH3rZugYbZqTnoegZOMlGp/7+f
	BiArfWyPXTv/VPT8oEqhxYj9oVRpSe9QdMfxmP2KBXvA3eOpoQuLT2Zszho/lczy0y8/Q3LIt4+
	iV6qCZR0vQGtt18J86p6MkKM4U+Gyt3xEW6sQSdh82GK7js51TT2HMfjhGcPdj9+1s3I8tb4H8G
	seo8N+7CCVFHuvBBQYgB98+lG4xDv5Z4fiisUSqHjII3TjnvfhkfsDo7rfjknJzpWCX8SY6wklL
	YcAO3EKYK6Zr9Io8Tk7o8z5TY2QMfNgV3E+zzOi5Kxdb5i01jfDyY1EgUvYN9bMiEuG+Vs557LV
	iOzgORNAGYSOfXR0fFNLZu
X-Google-Smtp-Source: AGHT+IEbAPfQK1RuZK+nE8beMDen7Z0FnzbXcsf76kNLQrLVD5yeuJY7YFmRoC0b8XImWAEfK6WHHg==
X-Received: by 2002:a05:600c:37ce:b0:477:8a2a:123e with SMTP id 5b1f17b1804b1-47d195911admr370622385e9.33.1767029171885;
        Mon, 29 Dec 2025 09:26:11 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2a94sm64024482f8f.43.2025.12.29.09.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:26:11 -0800 (PST)
Date: Mon, 29 Dec 2025 18:26:09 +0100
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
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 26/33] drm/vkms: Introduce configfs for connector
 supported colorspace
Message-ID: <aVK5sdhaMdhZlhDQ@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-26-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-26-ba42dc3fb9ff@bootlin.com>

On Mon, Dec 22, 2025 at 11:11:28AM +0100, Louis Chauvet wrote:
> Add the attribute supported_colorspaces to configure the supported
> colorspace of a connector. It will allows emulating some HDR features of
> displays. This feature is only supported for HDMI, DP and eDP connectors.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  8 +++++++
>  Documentation/gpu/vkms.rst              |  7 +++++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 40 +++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 5452140cc508..f750e616be54 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -40,6 +40,14 @@ Description:
>          Type of the connector. Possible values match those
>          exposed by the "type" field in drm_connector.
>  
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/supported_colorspaces
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Supported colorspaces for HDMI, DP, and eDP connectors.
> +        Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
> +        etc. See enum drm_colorspace for full list.
> +
>  What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 41c6f4733663..1c4a8023374c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -138,11 +138,16 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 2 configurable attribute:
> +Connectors have 3 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
>  - type: Type of connector. Same values as exposed by the "type" field in drm_connector.
> +- supported_colorspaces: Supported colorspaces values for HDMI, DP and eDP connectors.
> +  If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
> +  Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
> +  for full list.
> +
>  
>  To finish the configuration, link the different pipeline items::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index d6a85d6c466f..90bf6e6995ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1233,12 +1233,52 @@ static ssize_t connector_type_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t connector_supported_colorspaces_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	int colorspaces;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	colorspaces = vkms_config_connector_get_supported_colorspaces(connector->config);

Missing identation in this line.

> +
> +	return sprintf(page, "%u", colorspaces);
> +}
> +
> +static ssize_t connector_supported_colorspaces_store(struct config_item *item,
> +						     const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	int val, ret;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	if ((val & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		if (connector->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_connector_set_supported_colorspaces(connector->config, val);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(connector_, status);
>  CONFIGFS_ATTR(connector_, type);
> +CONFIGFS_ATTR(connector_, supported_colorspaces);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
>  	&connector_attr_type,
> +	&connector_attr_supported_colorspaces,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.2
> 
