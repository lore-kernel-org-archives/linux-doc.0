Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE780330B3C
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 17:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767028473; cv=none; b=u2EzxSfuvAPgTcUi4edvRmzkcI+t1l6w+vbiCj8GNyUxUcoLGCJeShnDhiQbRJjpFlkEKPkrCT7PqjEhlPmFmrfT1v6VoTTvYrvUoVKoWuTTcGeyM376WTDz1vPL740jZUxbsRL/lhj238gfF0Y5OYntyWpbstoP9u3iDeOnKLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767028473; c=relaxed/simple;
	bh=OCoxNjBnU/ZrVsYBqE5TbHXjqBUfTlG5bL3rH/RMBqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgINg4rT2aCE62ui3Wr4j0Hn6j/3S+z5qymGhaz7cmPriBMEbabQojBkyHi+L/YSXJl54R4cDeGZNKh1KQDDyJhkVhFq6zbdI2LyCgtf7KQD2AZxgM0t7Ti0S8RZ/BhfI/fzMwJeyNuDpMCKG9vclgDWbw9aI/cMCWlGTTD0BoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU1kqLc2; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU1kqLc2"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so97874675e9.2
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 09:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767028469; x=1767633269; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTI/U24baEJ9fAs5xJsCxvW/ApkzbnYPUtzjDdhtFs4=;
        b=PU1kqLc2kqd/64gf/RL/WuW8IVH52up38eSBK3GO54Jxyc0OzyORcOemqF65CQ4wPk
         SfCWn+B8LLtnvHvhUdmy+J9HfpwBE/CApAf+00DqxVX5n60cBsyIlEeoGKI5/CkGnL4X
         3ZZlW/MlZ2Tn/baaV1goh3LdNv6hocpy2/T8hk9VnVK+Bo83re3xz6/l/5zj0+m4DmCP
         ZVoSmsfGuImswmvULwzuzhP6PO80O+IsdxrCv84AeB2jaTkua0btto6BPmb5wyLomTxC
         2iwliBpDxquWiqUzhF88hHojyp10IkzuzjurTzb+5cmRC4uLET1tmFkunyjpm8y4WOv7
         vowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767028469; x=1767633269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTI/U24baEJ9fAs5xJsCxvW/ApkzbnYPUtzjDdhtFs4=;
        b=tdhlOP3ktW47YMQNOoMXwhVbqLNKggpnORSyf0SVzR2rIHyc9/Qzj+3tHoAfe7afQL
         CkzbHp47HqCkVqlLsaT0FyULe8iCv+37ZhD1YWy0/1METWNv6QM1LOH6vL4Dq8s7u0vf
         QR8mqhCb9gWW5bwDuDEGnjLHhWf0DdzAnOhx2rcuNyiGydta6jl2iqVXmVDBdarbhVcz
         Jt90B+aWXMZDRp8rZ8b3aHPD09or8qRT1+O80K5dzwEzjRTKsExwcptISvV77Jk66jTT
         F78VTyhn4tvJ7tZIK2bofZpqlO0DtXwEYrutqwV4Ys2gntIoaXqFW63QpPtLr6zVh7YQ
         AO8w==
X-Forwarded-Encrypted: i=1; AJvYcCX+obPZTo/6Vkf6VixMiF9G2sZFpM/G4/qsxZA/NGJiqbi22W+ZsBYwsAeqgiz8JS55nROcfbjBqUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASyDmtbZxyABHGMW4VfFD4LSi7dg5+1BAgeWspfGoevM2gqL7
	2fs6sDcVH/UXiokxsVftCO7mjq6dV9gRm4nQmoPuwDMtA13psHaDlyoh
X-Gm-Gg: AY/fxX6yh54yafjKj56Ht0o8JAKwuHpQX+bAPXKyr4fb65IFdYlzw7/uEgWsS90pt/c
	fa9/OoIFTaFFvmVk7uX6krh3MvFkMBpJSqK9ZoFprTJegSmmnzJE6qnOPh0yp5HL1IzgXN7h7jb
	nCgruOQgdbbaylzdvvsUvUc9ta2CPT3JcNwV+yqFWbHIbXHa6XKUf2rH2VmgZDfvVdeKHjWNMEP
	4EbOq3Rmdn64zQ7yGIVjiFSUMnE9m7xzlJ64IHMTaojIzRCMezqKV5HZAgL2sTTFBCOC+I0JSUU
	QvYZ3qUd4YHtvNvIJ0CEk1zH0p0OW8uTLOtRaF+/Z8BwIvlGNNHpWkxo8AxGixslnXZgbedWmS5
	36PbKywQzW0SpOZsJViSng1rUUQN52fR+AEWLBP3jAnOFKtOv2ulq8GK03qXBjOWesooY4WjumO
	fY6VVGneFJ5g==
X-Google-Smtp-Source: AGHT+IEBRzGXuLgSaz9wTV+nukamkWrWJa/t3Yey+9LK++9obBuXdopvSYIO5cdNq4uNXtWz3OkyiQ==
X-Received: by 2002:a05:600c:314f:b0:47d:4fbe:e6cc with SMTP id 5b1f17b1804b1-47d4fbee749mr98214255e9.13.1767028468987;
        Mon, 29 Dec 2025 09:14:28 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3aa9971sm235149495e9.13.2025.12.29.09.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:14:28 -0800 (PST)
Date: Mon, 29 Dec 2025 18:14:26 +0100
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
Subject: Re: [PATCH v3 33/33] drm/vkms: Introduce configfs for dynamic
 connector creation
Message-ID: <aVK28mBT6PwD7Rkr@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-vkms-all-config-v3-33-ba42dc3fb9ff@bootlin.com>

On Mon, Dec 22, 2025 at 11:11:35AM +0100, Louis Chauvet wrote:
> DRM allows the connector to be created after the device. To allows
> emulating this, add two configfs attributes to connector to allows this.
> 
> Using the dynamic attribute you can set if a connector will be dynamic or
> not.
> Using the enabled attribute, you can set at runtime if a dynamic connector
> is present or not.
> 
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  14 +++
>  Documentation/gpu/vkms.rst              |   6 +-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 146 ++++++++++++++++++++++++++++++--
>  3 files changed, 155 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 4061ada5d88b..a7fce35fcf91 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -62,6 +62,20 @@ Description:
>          Content of the EDID for this connector. Ignored if
>          edid_enabled is not set.
>  
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/dynamic
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Set to 1 to create a dynamic connector (emulates DP MST).
> +        Value: 1 - dynamic, 0 - static.
> +
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/enabled
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        For dynamic connectors, set to 1 to create the connector,
> +        0 to remove it. Value: 1 - enabled, 0 - disabled.
> +
>  What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 60367fd1bd65..fce229fbfc7c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -138,7 +138,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 5 configurable attribute:
> +Connectors have 7 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -150,7 +150,9 @@ Connectors have 5 configurable attribute:
>  - edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
>    EDID but just a list of modes, this attribute allows to disable EDID property.
>  - edid: Content of the EDID. Ignored if edid_enabled is not set
> -
> +- dynamic: Set to 1 while configuring the device to create a dynamic connector. A dynamic
> +  connector can be used to emulate DP MST connectors.
> +- enabled: For dynamic connector, set it to 1 to create the connector, 0 to remove it.
>  
>  To finish the configuration, link the different pipeline items::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 20f5150e8b24..657381a8a4c2 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1144,6 +1144,12 @@ static ssize_t connector_status_show(struct config_item *item, char *page)
>  	return sprintf(page, "%u", status);
>  }
>  
> +static bool connector_is_enabled(struct vkms_config_connector *connector_cfg)
> +{
> +	return !connector_cfg->dynamic ||
> +	       (connector_cfg->dynamic && connector_cfg->enabled);
> +}
> +
>  static ssize_t connector_status_store(struct config_item *item,
>  				      const char *page, size_t count)
>  {
> @@ -1163,7 +1169,7 @@ static ssize_t connector_status_store(struct config_item *item,
>  	scoped_guard(mutex, &connector->dev->lock) {
>  		vkms_config_connector_set_status(connector->config, status);
>  
> -		if (connector->dev->enabled)
> +		if (connector->dev->enabled && connector_is_enabled(connector->config))
>  			vkms_trigger_connector_hotplug(connector->dev->config->dev);
>  	}
>  
> @@ -1224,7 +1230,7 @@ static ssize_t connector_type_store(struct config_item *item,
>  	}
>  
>  	scoped_guard(mutex, &connector->dev->lock) {
> -		if (connector->dev->enabled)
> +		if (connector->dev->enabled && connector_is_enabled(connector->config))
>  			return -EBUSY;
>  
>  		vkms_config_connector_set_type(connector->config, val);
> @@ -1343,6 +1349,107 @@ static ssize_t connector_edid_store(struct config_item *item,
>  		    connector_status_disconnected)
>  			vkms_trigger_connector_hotplug(connector->dev->config->dev);
>  	}
> +	return count;
> +}
> +
> +static ssize_t connector_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		enabled = vkms_config_connector_is_enabled(connector->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_enabled_store(struct config_item *item,
> +				       const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool enabled, was_enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		if (!connector->dev->enabled) {
> +			vkms_config_connector_set_enabled(connector_cfg, enabled);
> +		} else {
> +			// Only dynamic connector can be enabled/disabled at runtime
> +			if (!connector_cfg->dynamic)
> +				return -EBUSY;
> +
> +			was_enabled = vkms_config_connector_is_enabled(connector_cfg);
> +			vkms_config_connector_set_enabled(connector_cfg, enabled);
> +
> +			// Resulting configuration is invalid (missing encoder for example)
> +			// Early return to avoid drm core issue
> +			if (!vkms_config_is_valid(connector->dev->config)) {
> +				count = -EINVAL;
> +				goto rollback;

Since this rollback jumps out of the guard, there is a chance that, while the connector is
"enabled" (enabled as in the variable) and before is set to "was_enabled", another thread
is executed and reads an invalid value.

The cleanup path needs to be inside the guard.

Jose

> +			}
> +
> +			if (!was_enabled && enabled) {
> +				// Adding the connector
> +				connector_cfg->connector = vkms_connector_hot_add(connector->dev->config->dev,
> +										  connector_cfg);
> +				if (IS_ERR(connector_cfg->connector)) {
> +					count = PTR_ERR(connector_cfg->connector);
> +					goto rollback;
> +				}
> +			} else if (was_enabled && !enabled) {
> +				vkms_connector_hot_remove(connector->dev->config->dev,
> +							  connector_cfg->connector);
> +			}
> +		}
> +	}
> +	return count;
> +
> +rollback:
> +	vkms_config_connector_set_enabled(connector_cfg, was_enabled);
> +	return count;
> +}
> +
> +static ssize_t connector_dynamic_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		enabled = vkms_config_connector_is_dynamic(connector->config);
> +	}
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_dynamic_store(struct config_item *item,
> +				       const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool dynamic;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &dynamic))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		// Can't change the dynamic status when the device is activated
> +		if (connector->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_connector_set_dynamic(connector_cfg, dynamic);
> +	}
>  
>  	return count;
>  }
> @@ -1352,6 +1459,8 @@ CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
>  CONFIGFS_ATTR(connector_, edid_enabled);
>  CONFIGFS_ATTR(connector_, edid);
> +CONFIGFS_ATTR(connector_, dynamic);
> +CONFIGFS_ATTR(connector_, enabled);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
> @@ -1359,19 +1468,28 @@ static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_supported_colorspaces,
>  	&connector_attr_edid_enabled,
>  	&connector_attr_edid,
> +	&connector_attr_dynamic,
> +	&connector_attr_enabled,
>  	NULL,
>  };
>  
>  static void connector_release(struct config_item *item)
>  {
>  	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
>  	struct mutex *lock;
>  
>  	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
>  	lock = &connector->dev->lock;
>  
>  	scoped_guard(mutex, lock) {
> +		if (connector->dev->enabled && connector_cfg->dynamic && connector_cfg->enabled)
> +			vkms_connector_hot_remove(connector->dev->config->dev,
> +						  connector_cfg->connector);
> +
>  		vkms_config_destroy_connector(connector->config);
> +
>  		kfree(connector);
>  	}
>  }
> @@ -1390,6 +1508,7 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
>  						  struct config_item *target)
>  {
>  	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
>  	struct vkms_configfs_encoder *encoder;
>  	int ret;
>  
> @@ -1397,16 +1516,26 @@ static int connector_possible_encoders_allow_link(struct config_item *src,
>  		return -EINVAL;
>  
>  	connector = connector_possible_encoders_item_to_vkms_configfs_connector(src);
> +	connector_cfg = connector->config;
>  	encoder = encoder_item_to_vkms_configfs_encoder(target);
>  
>  	scoped_guard(mutex, &connector->dev->lock) {
> -		if (connector->dev->enabled)
> -			return -EBUSY;
> +		if (connector->dev->enabled && connector_cfg->enabled) {
> +			if (!connector_cfg->dynamic)
> +				return -EBUSY;
> +
> +			ret = vkms_connector_hot_attach_encoder(connector->dev->config->dev,
> +								connector->config->connector,
> +								encoder->config->encoder);
> +			if (ret)
> +				return ret;
> +		}
>  
>  		ret = vkms_config_connector_attach_encoder(connector->config,
>  							   encoder->config);
> +		if (ret)
> +			return ret;
>  	}
> -
>  	return ret;
>  }
>  
> @@ -1445,9 +1574,6 @@ static struct config_group *make_connector_group(struct config_group *group,
>  	dev = child_group_to_vkms_configfs_device(group);
>  
>  	scoped_guard(mutex, &dev->lock) {
> -		if (dev->enabled)
> -			return ERR_PTR(-EBUSY);
> -
>  		connector = kzalloc(sizeof(*connector), GFP_KERNEL);
>  		if (!connector)
>  			return ERR_PTR(-ENOMEM);
> @@ -1461,9 +1587,11 @@ static struct config_group *make_connector_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		vkms_config_connector_set_dynamic(connector->config, connector->dev->enabled);
> +		vkms_config_connector_set_enabled(connector->config, !connector->dev->enabled);
> +
>  		config_group_init_type_name(&connector->group, name,
>  					    &connector_item_type);
> -
>  		config_group_init_type_name(&connector->possible_encoders_group,
>  					    "possible_encoders",
>  					    &connector_possible_encoders_group_type);
> 
> -- 
> 2.51.2
> 
