Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B48B27A107
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 17:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767028852; cv=none; b=R3giMhN6HortY8kLs36LAVGgpe5W1gsfvDBDwLnJmwKahPwGYqTpKfva3HdofqZ7oiZ/3lXOgtAsUBaZuLWTTWyntFsyIWtnZE8PPLSMJhxDhA91wM8MOfc7PLsEQHR5FJ2npYo4A4opGMYal1BrUl/Wn+61LwnFVhO/tVWLQdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767028852; c=relaxed/simple;
	bh=JN/JS0/LvHAiQjiDsVBikQNTy3AOjzEY92VEWL2XslU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vuhf/hMskG8WrS0EckDIHTzoS2RWOb+TXYTXgODdk49BRsCYjkSEKqe4BT+4iqDq3JVrykH7aZIadrR8fLegWNbkTUrm+EygUhHCZIDWkrSIEDzcZ6x5VPTslXYAf9B3CsIUT6EC+ehFGvN/qy2CIYwlikicN9uqciHBwUGGdIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLg6hQwK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLg6hQwK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso84380875e9.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767028849; x=1767633649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujThKWml8uMLDf0KX6SXAAMWz7lsuk/sdoB2hkb6sc8=;
        b=VLg6hQwKhH7zKKEJdKmeevtJU9CXliuyax8w4pQDw3YRoaVBxlxLfrmxMyX54tNSfd
         3mC5J9y45hVnNYyQU4qI50LUtBRvLxriHGnkSoqX+qtU6VSqovQxshWEBt+RxVkcEM22
         46qILg3A9jX+4R352x8QrGMvoQwkJ/KgCfM3xrsPIpa9QbwgNrwszc5y3ikQgSqJTm/I
         3EpGluwX8dOpUKPjfH+z0Cw58lF2iHiTipKgT40IK5WcN6xg8c/rJvoPtDrY/p2KzfVf
         lvFF5fANK+FfUEN0qis+0YZqjKfBMldAMMZp9h15lKh6j+cW5K3X6YMSnL8S0damPADX
         7grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767028849; x=1767633649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujThKWml8uMLDf0KX6SXAAMWz7lsuk/sdoB2hkb6sc8=;
        b=AHsu60igptsWY3OyaaUuJh1zNgrVfGZbke085NzYSgyzzR/N/te0kT/kx2douE2tWy
         v40YcQapP/pYfwPSeHRyJRMqysYMsLn8o5jTOSugAW2gNSc1mEDwOTjZe/8EWcstq0ql
         7d4zRwGFIeiAru8bKqNspP9DIq9tacObxddvUgQuvhsOO5/EB25H9EqqTcv0wbdeorEd
         0ipkKnpla3rESGy76rpUITS26Ew7MJjKBcmZPoCZxb0d74vFwKCzjo+UnzHAf+u6iGI3
         ZA7hoZvD2DTAZlTCWIbV7Mv+5DOzxKWcF01XXd1Cr0zCg7GjKfOftb6wJaCCOhwbHghH
         qQuA==
X-Forwarded-Encrypted: i=1; AJvYcCVrG33hPgzoeR3QwLyyKPVxRN9NjQAIckYvVLdm9Yr6GPkIzOt5kLX3X1zzLaJaAFbB8M/aapf1Tno=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrqkzfyRdcsCGuvkZT4L+2gYY3TOU37grXrCkwXASbMEe5590D
	HmYxi3OHBwZH/MnIYM84XgsV2C2bZVO7l4m1iK+zilfIbosz1JrV3xV5
X-Gm-Gg: AY/fxX4NOoBPSCcm46b4FHnpBFvtTbOmjfBa+NHnOVu+uq9dCpiwex7ekq25lfiZ9Kr
	ORDHX5czWA590OitkYIr7q/Y+HkFs0CBdT8iS9eJIo/NwGDghn4dnv+FWm+HwwTvxORa4Sne/7N
	jX7p/t3JVO6jEJqXVog+FmTvxfxclquTg84X9ffqC8oSLwLLM+pWVD1oirxVaQ1qT1lL65fBT3v
	ihyDY8NvFY2wJBAppAg3Lf3xXIA7/5wAPxliSHL0whYQmkLEcTsXB+lwg5SE2ax6FnXfYiqZqxS
	2qZ80K2Ls+V05WbwY0sNz+NoDzhBIyvv1YEA04Mo8bKmfzuWqrFp4nlhhUVw6kpexsLoXVUU3w7
	Qr586ER3tAGlCBWaCST7RM3AKgxanXcSonHxtiUo9UNvTlW0uYKbLIPBMZgGYpFwz73j+YBYarm
	ny7kexWFX7OQ==
X-Google-Smtp-Source: AGHT+IFrILSmVylZfJiTDXSk9lzVTNGdCw1i+yRhADg/0AM5KWye8SNJlE1bk/NR2SBP5KInjYBesA==
X-Received: by 2002:a05:600c:8208:b0:47b:d949:9ba9 with SMTP id 5b1f17b1804b1-47d19566f0dmr361853255e9.13.1767028848573;
        Mon, 29 Dec 2025 09:20:48 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac4c1esm235624195e9.14.2025.12.29.09.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:20:48 -0800 (PST)
Date: Mon, 29 Dec 2025 18:20:46 +0100
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
Message-ID: <aVK4biJig9qKRDHw@fedora>
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
> +		unsigned int len = 0;
> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
> +
> +		memcpy(page, edid, min(len, PAGE_SIZE));
> +		return min(len, PAGE_SIZE);
> +	}
> +
> +	return -EINVAL;

This return is unreachable, the guard block returns unconditionally.

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
