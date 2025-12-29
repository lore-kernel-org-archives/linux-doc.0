Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6352318146
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 17:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767029058; cv=none; b=A0gX+mTIR33lM/YgKh/vNKiK16DO2fRMGVjtk3X3bOOf/BGJfuVMih0ylpafI9HgPrEiF3hCCJJ4zlEVzlfYcz3I6zD8l8ubiNWU1TQLv4ttRdnySZz6BhaeabWKPrscfFtBRnK7Bdj3fnQMQCkS5nQheV5ZdbxBB/h24RbDXmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767029058; c=relaxed/simple;
	bh=+8IFQZlpj5kBn+XJ6rzf77Z8tubSvfNKFitAqSBVXVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+ERlYFySjxjfX61vykkO+PnihkcdGKow4BkHfI4i105ySYxRfutJsS/ANKzWSBV8Ceu4WicK3Kst3KtWiosG1JO71HO7bpX8ddr0M0ba15FjT5W97wvZL0cNxUVo6Tz42V+DF3OYzIilVsrLuFbLAxiZnSFJrGMDQcXB7Ew32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJsi85KK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJsi85KK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so4618879f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 09:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767029053; x=1767633853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Is+BjYELOU6FjihtrsgHdu+zn60dvtmelOgIKE/GkpE=;
        b=TJsi85KK4TGrnIW0LQ+K0cEykCC/bYx2V5yrKgw2yMZ3UqoDczb3rz2UmItl1cRKt0
         rs+emTkwy4hsW/Nxb3PoZwnIdpCE8IDBXQHqvmjbbHdO5pYZqvFEWxQPDTe1LYDpcq9B
         JrimXijDisDB8mw+IKYmJ4mBTkPotC0HKjZHmASfrkG7WE83yrtZEPZesa50POa2Yjbh
         LNPD0lf2VTjrmrwPh9NkKMyQzAB9UBLtteAgWUNKsPvs6EchjChZz6jk8sfug0ysyDjY
         KYBesdKpOlEQGzWxqYoPJ+VxQ4ABm5XC12Kc9AoNW3EoP+rG08Qeo8kTdUthEbTdsiv4
         zbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767029053; x=1767633853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Is+BjYELOU6FjihtrsgHdu+zn60dvtmelOgIKE/GkpE=;
        b=TmJAJdA9HIoqAfVmHJYiFw8X1gO7NRM9o3+uXEI6xJggSI6ousevXRKRtC1TrtfwLL
         67mvdZoX8KbJPf1hAkO9SPvjVaq/9dJy9AmKDKBL5FoaJ/LR5UsLZjW5sLd7NQp4Y0ap
         4pyhltm+4drvu3EXaMSM938I0saeA6CzHuJJhyc82sIl+KiqV9y6c7UrS4TNyzMr+KR+
         ywCONwmoAw/Drb2xVzT8vLYLJFQgnnND3FWrs0jqk7JI6QA0ST5uj+2OvA/HJxKHRKNl
         0FXhsCovd5yG4ysB85yGnK3bO1jM2OXI3wXpsTUPAO910R2vqcri6q4AA82XI4MhNurF
         uhSg==
X-Forwarded-Encrypted: i=1; AJvYcCXcqNzchKUL8jxQbl4MHewYHb1pw2mWCez4/gB0pYilGEO6v8wKMqY0gvv2hy+bHdpRT6oC+hduusU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJRyZIWwrlD0UKr1LM15xBwDbzsukpmet917T2ds2rKT3Tj9O
	BJh89Bz9cjMVA9IUyEyI/uPtMSD7TOY3X35txsfNRCyqtfiV2kdL3Q1g
X-Gm-Gg: AY/fxX6IXnbHztaEtsN7Jdsh/NT8JRbHSh9Ln0x3qjSwshTqJtQ06Dx1Eb8OWyFqB7Q
	wDj26Cd79K4p5lAxQMWb6/7oAIdU1i3DPSkbJkIMr+xMUNNbbDoggAeGO7kdpoGB4OVrhQhArY3
	kwQWA4MCupk8vzuCabYdds6odaduOl5/LPBnaKkJkF1zz+fKpYsrzk+NfTpAvUQDJswFRglOV+w
	pJervb9D1vPVk0Kk1KQjpUByTMcO+x41iTp8taAx6t68mi3tLcNJWEMrhNZSufpznR8oe7BncF5
	ZCKaXZEjUYMcsKBlezFdO9HbNZZqGKOB1nXhEYOiuJrG96gPk/YgoKPcfZCNH9k6DaWWPVjS3+6
	rkegQn/QeQ2msqAQ9DZWD2mYRy+THkKOGap0AlTlT2fLCOAdY0VMEclFQ4c/FqtwotpJOJHdwTo
	Hv5DIQtj5ZpQ==
X-Google-Smtp-Source: AGHT+IFUYYJiXk5vDyIxA7187o6+sbSBSV7PUMGC6bnELEkTRcsCNUIjDa8pXfmgXR1aZY/nCkjnhQ==
X-Received: by 2002:a05:6000:2dc7:b0:430:f449:5f18 with SMTP id ffacd0b85a97d-4324e50b88emr36388839f8f.46.1767029053151;
        Mon, 29 Dec 2025 09:24:13 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm62985046f8f.5.2025.12.29.09.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:24:12 -0800 (PST)
Date: Mon, 29 Dec 2025 18:24:11 +0100
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
Subject: Re: [PATCH v3 28/33] drm/vkms: Introduce configfs for connector EDID
Message-ID: <aVK5OyydXrQfIcc7@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-28-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-28-ba42dc3fb9ff@bootlin.com>

On Mon, Dec 22, 2025 at 11:11:30AM +0100, Louis Chauvet wrote:
> Introduce new attributes to configure EDID of a connector:
> - edid_enable - chose if the connector will have an EDID or not
> - edid - raw edid content
> 
> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
> x86), it should be sufficient for many tests. One possible evolution is
> using a ConfigFS blob to allow bigger EDID.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms | 14 ++++++
>  Documentation/gpu/vkms.rst              |  5 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 80 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c   |  3 ++
>  4 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index f750e616be54..4061ada5d88b 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -48,6 +48,20 @@ Description:
>          Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
>          etc. See enum drm_colorspace for full list.
>  
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid_enabled
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Enable or disable EDID for this connector. Value:
> +        1 - enabled, 0 - disabled.
> +
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Content of the EDID for this connector. Ignored if
> +        edid_enabled is not set.
> +
>  What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 1c4a8023374c..60367fd1bd65 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -138,7 +138,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 3 configurable attribute:
> +Connectors have 5 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -147,6 +147,9 @@ Connectors have 3 configurable attribute:
>    If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
>    Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
>    for full list.
> +- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
> +  EDID but just a list of modes, this attribute allows to disable EDID property.
> +- edid: Content of the EDID. Ignored if edid_enabled is not set
>  
>  
>  To finish the configuration, link the different pipeline items::
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 90bf6e6995ae..20f5150e8b24 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1271,14 +1271,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		enabled = vkms_config_connector_get_edid_enabled(connector->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_edid_enabled_store(struct config_item *item,
> +					    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector_cfg) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +	return count;
> +}
> +
> +static ssize_t connector_edid_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{

Sorry for the additional email. I forgot to mention that this brace should go
in the same line.

> +		unsigned int len = 0;
> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
> +
> +		memcpy(page, edid, min(len, PAGE_SIZE));
> +		return min(len, PAGE_SIZE);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static ssize_t connector_edid_store(struct config_item *item,
> +				    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid(connector->config, page, count);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector->config) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(connector_, status);
>  CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
> +CONFIGFS_ATTR(connector_, edid_enabled);
> +CONFIGFS_ATTR(connector_, edid);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
>  	&connector_attr_type,
>  	&connector_attr_supported_colorspaces,
> +	&connector_attr_edid_enabled,
> +	&connector_attr_edid,
>  	NULL,
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index c85d19013720..311858727175 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -143,6 +143,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  
>  	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
>  
> +	if (vkms_config_connector_get_edid_enabled(connector_cfg))
> +		drm_connector_attach_edid_property(&connector->base);
> +
>  	return connector;
>  }
>  
> 
> -- 
> 2.51.2
> 
