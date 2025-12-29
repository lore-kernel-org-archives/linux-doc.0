Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C39217704
	for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 17:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767028181; cv=none; b=Pn5xuhjQWQoYbR20eQC+ejLUuIPFZA1+sJkK2bhJZSqDR26h882VQIBpy6OGsD6LFnp0Wat7j0zq1opDtlacam3rys5map9dyhAhCkan480JVkNsbyZDlw6QRkmoo3cxOddQdRzEHzIyXSi4L8ByuN9QLcXUY+sXpenSqhkXfgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767028181; c=relaxed/simple;
	bh=BchYWUJMrG+zuaJJpFT32jhNlNVAAReMwcHd+XDyJG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/mqkIjMi87AmDlqHHQZtzRPg94QZe4HeG/3QqriavQJxuVeHSvLrwo8VQglDinguA1xbEUyqPx4Mpu7EAJglby/oxWKKNVuT+JzEE2P7QkEXEzHaFoBy9DrvDwh+v/f6LfJm91ekVi9O7xt9KHYixXlePsNL+nPJBzJwhVlbj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEBBc0CD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEBBc0CD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so34827245e9.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767028178; x=1767632978; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6O6+tk5h/BOteODO+69MaKipjConnQRO/Y3Z/JkS2Zw=;
        b=kEBBc0CDeDduOkPrpyIKQpzIhC1MNaqIICWA98cprfy521bWEmZZIfVMCY0n7tw0aF
         8+hy9Oz0DviE3c2loGw3FJ4/PpUzgHKBGPf3AQwo1423Trnof7d6H7/FR07W0AYRapBr
         j2Ku5mEped6Cja1gOLN0PeMUQxkvp3dZRlxsCNo2z2TOm71JlMUZJhddOejtxkYPO0RF
         ROEHAy2jWOA21/36q3l7jnTrr2FWI+hjRK46Ouk8WqH7WdkVyV53lVSgvbXYEaOJk88X
         pY1kwQuUD/dsKIYEYaR8NeoLZ1iDS3HvFggWN66SpiMwc8eASBudps3lQIFIUbiA9PSF
         tw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767028178; x=1767632978;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6O6+tk5h/BOteODO+69MaKipjConnQRO/Y3Z/JkS2Zw=;
        b=Of235E3/Bbe4FEhcX5RXWv0GEI2N+BW6pcA1VUgXrMgKPLweslwFJs79wru5TKMfq2
         JTys/uNRh51Zoi6ScR7J+4To42Xl0i8FJxjSTW/iGQ7dc1beuFJyW+e7GsifYt/itPp1
         VXDsdSvLIta568P446qz5qUaYkT/RZFxV1BeeAYTh7GtcMNu3xlbFfhrR9dwUOm8rRHR
         urTpHOMw6vpVxV0XJw2tMQL1/BisysBO3GlKrZ5SckVbFgD1LDepfz6qXsmT8BcgofR4
         2v3rkDZIYdYz5hq9ZTVh735r+xvF3xxAz/xENCajBAYV/ohdNT4xEvn9htLFCfcDHGBe
         gK9g==
X-Forwarded-Encrypted: i=1; AJvYcCV1ipYZ/EzUzA6630OnwCmW0OuiOazwEUyIM2vuluGrQL5h4PahU/CmiX6jKtFuJATzZPSUozntzdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwWHFC+RHuBpWBUrue5mKTG/zfrCVlfxxG/ueEAWjATfYvNWY
	ZsumI5cVGCXFYHIdJP/hhJA7Kw80adxdvzndQu56GADlzxnT4bH2YGW6
X-Gm-Gg: AY/fxX6HSX8iJogj0hlXGEtCj3d3wY35maNRj5aFjDlsdMJ6IRtAHfj6EZKqLM3/tu+
	m+/i1U2xT9NiJrNerHer9FTEh0URi1waijiggYg/Dws0TdY7oUV2RiNc0w6gxsvGthIOM7kbpUx
	4FVylZdO9T6hoT3XPK9DdI8udsLHl3rWKwfUz+6bAVV4HYpplZxMnwmGJuFANAArKZhJLe58JAT
	DK41zXkuSVvWbBiGFyZ69/BnILpmwuIU9h5qtqOqcg7ci/mUWez8mCLlo/4AYfNDXP0BMHJOFQh
	vRnve+8o0vwLxPuYelEQfRVWtbNxiNzlc8kQRAm7n5bEPlQlqzQ7FrT24pOJIPszbkPMYKIYjo8
	aEL36GeRk8kmjm5J1UE3d7Ihf01It6j9553gDJzwpZZauNt7PxKL0p8XuIHA35mSpyhJjRcObbi
	ItdyGksyBL0ifhNCoMWDfH
X-Google-Smtp-Source: AGHT+IGBKFcaFsNGe1AsIBsQYOzgDRS5osMCiE0B5NHZqdGkmGV0E+4GLX8TxkrEWyGhl5Lz4KJpsQ==
X-Received: by 2002:a05:6000:178e:b0:430:b100:f594 with SMTP id ffacd0b85a97d-4324e50d9bcmr37799197f8f.50.1767028177789;
        Mon, 29 Dec 2025 09:09:37 -0800 (PST)
Received: from fedora ([94.73.37.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227e0sm65088089f8f.17.2025.12.29.09.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 09:09:37 -0800 (PST)
Date: Mon, 29 Dec 2025 18:09:35 +0100
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
Subject: Re: [PATCH v3 32/33] drm/vkms: Allow to hot-add connectors
Message-ID: <aVK1z_WUUQ-5frII@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-32-ba42dc3fb9ff@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-vkms-all-config-v3-32-ba42dc3fb9ff@bootlin.com>

On Mon, Dec 22, 2025 at 11:11:34AM +0100, Louis Chauvet wrote:
> In order to allow creating dynamic connector, add the required
> infrastructure in vkms_connector.
> 
> [Louis Chauvet: use drm_atomic_helper_connector_reset instead of
> drm_mode_config_reset because connector is not yet registered]
> 
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_connector.c | 81 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.h | 33 ++++++++++++++
>  drivers/gpu/drm/vkms/vkms_output.c    |  9 ++++
>  3 files changed, 123 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 3ad614642355..616036494937 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -163,9 +163,90 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
>  	return connector;
>  }
>  
> +static void vkms_connector_dynamic_destroy(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct vkms_connector *vkms_connector;
> +
> +	drm_connector_cleanup(connector);
> +
> +	vkms_connector = drm_connector_to_vkms_connector(connector);
> +	drmm_kfree(dev, vkms_connector);
> +}
> +
> +static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.destroy = vkms_connector_dynamic_destroy,
> +	.detect = vkms_connector_detect,
> +};
> +
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  
>  	drm_kms_helper_hotplug_event(dev);
>  }
> +
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
> +					      struct vkms_config_connector *connector_cfg)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_connector *connector;
> +	int ret;
> +	unsigned long idx = 0;
> +
> +	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
> +	if (IS_ERR(connector))

I need to test this patch carefully, but in a first review I noticed that this
"if" should check for NULL, not for error.

Jose

> +		return connector;
> +	ret = drm_connector_dynamic_init(&vkmsdev->drm,
> +					 &connector->base,
> +					 &vkms_dynamic_connector_funcs,
> +					 connector_cfg->type,
> +					 NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, encoder_cfg) {
> +		ret = drm_connector_attach_encoder(&connector->base,
> +						   encoder_cfg->encoder);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	drm_atomic_helper_connector_reset(&connector->base);
> +
> +	vkms_connector_init(vkmsdev, connector, connector_cfg);
> +
> +	ret = drm_connector_dynamic_register(&connector->base);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return connector;
> +}
> +
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector)
> +{
> +	drm_connector_unregister(&connector->base);
> +	drm_mode_config_reset(&vkmsdev->drm);
> +	drm_connector_put(&connector->base);
> +}
> +
> +int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
> +				      struct vkms_connector *connector,
> +				      struct drm_encoder *encoder)
> +{
> +	int ret;
> +
> +	ret = drm_connector_attach_encoder(&connector->base, encoder);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(&vkmsdev->drm);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index 85f9082c710e..a235a518d5a0 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -34,4 +34,37 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
>   */
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
>  
> +/**
> + * vkms_connector_hot_add() - Create a connector after the device is created
> + * @vkmsdev: Device to hot-add the connector to
> + * @connector_cfg: Connector's configuration
> + *
> + * Returns:
> + * A pointer to the newly created connector or a PTR_ERR on failure.
> + */
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
> +					      struct vkms_config_connector *connector_cfg);
> +
> +/**
> + * vkms_connector_hot_remove() - Remove a connector after a device is created
> + * @vkmsdev: Device to containing the connector to be removed
> + * @connector: The connector to hot-remove
> + */
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector);
> +
> +/**
> + * vkms_connector_hot_attach_encoder() - Attach a connector to a encoder after
> + * the device is created.
> + * @vkmsdev: Device containing the connector and the encoder
> + * @connector: Connector to attach to @encoder
> + * @encoder: Target encoder
> + *
> + * Returns:
> + * 0 on success or an error on failure.
> + */
> +int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
> +				      struct vkms_connector *connector,
> +				      struct drm_encoder *encoder);
> +
>  #endif /* _VKMS_CONNECTOR_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 13c4ca5fd39d..50f7d88dee8b 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -117,5 +117,14 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  	drm_mode_config_reset(dev);
>  
> +	vkms_config_for_each_connector_dynamic(vkmsdev->config, connector_cfg) {
> +		if (connector_cfg->enabled) {
> +			connector_cfg->connector = vkms_connector_hot_add(vkmsdev, connector_cfg);
> +
> +			if (IS_ERR(connector_cfg->connector))
> +				return PTR_ERR(connector_cfg->connector);
> +		}
> +	}
> +
>  	return 0;
>  }
> 
> -- 
> 2.51.2
> 
