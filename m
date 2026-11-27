Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763718;
	b=emBBOmCKIXSscnd8mSSWFrMKoDTSZTQ1opSETlFsbPRCAxWeuVm/yXuASBrfROnVmLqc
	 VuCR9VJKPw+b5h9g8fuKu3USigYzLDeb/Fpm/nLzL0KICfzv7PFZ8Bh/HZn/tYTK2WPvv
	 mKZC97tqhAUu5D6TfVFD+vE9YgD5lImTLiAO/+n75WbQO9byARGzL7eoRbXpfPj/ZNjnD
	 JF4NpWuQfduiZ+4WnTf1pfBuE6EUbqDz2yWoPP0jn9fyz2ZrDCf3qmMroTSjJWFLGgFzK
	 GKZLzvW8KX7ofO5xefGuCzWhTLVUBUcFrMjv0Gezlh2gz6T/vxUk0OAgPPRTJjvquIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
	b=vi0oe2hbvgATWtLTWcUH2vtTk63lXHu8H1JNZQ9shImIblslNKBsKm/lYM1Ts4kVETHX
	 1mZEJe2CmnLQ0ixPEr3jrkxdGgQp5mvbzTYRyxUaOhhMqVitnHs36Gl+XUWa/xuDX0jME
	 SGpcLjCMpVO8m6d6GhFNT/NwgeTzIwdsY9CuzJQ9M4H4CkVTNM+TYt/pQuKhlZlJDGK/y
	 0eYyGyBbY3M9fVwpjBRcLQu0CbJlaP9yTizd3gUaQJa7NQrU1vGm4+Rs1pn+ML632QIi+
	 WJX/T+DZxb7R25XVeYCeGy/19iIfV60zUjXjReYxiB5eCA1mKCv5ZKlsvp+HhgBD0pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGce4Hb3;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8AE606A326
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 07:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGce4Hb3
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49465892f7bso5668827f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 23:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763716; x=1796368516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
        b=cGce4Hb35o/vxcQ5vjpStXA8xJGlB1XuenFpeR0e9jbCyLye848Y0GUN3a83AJOJSj
         6Etjay4JbcYxW3GszOxqFZwo8mq3kZwemWj6tS6q2NZoS5oXoHaxD5XTMSIz6xTSgyXw
         aa9ltx//D4O3OTT2PUCN5FS8rjgz15n/2FaCOzETKnR4uSbI4YWL66cZ6f4pERd5bgdy
         2RYtnrJzlIKZS4Jt2SIn+QIu2O43fsOEAf+IoT5Ns4kk8PTGkH57kHoRbjI2vAf4ZCII
         JKrg7qoGTwi+eCO024d7FNDqhy/b9rVOp6raQ6BSVKP2gPsSm1U2h3JJZq48dnZ/JiAD
         xMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763716; x=1796368516;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wSJgjK+A00lNH/iVraNbWq5SwVJ5+VOU0GV4DugumqU=;
        b=qW2I+R03762d2PtkqljlqScpjuuNcPezdyedVc+eV40jdKQZyrgDmVDDMFHpMRkJxk
         CLFsxmy3rhlraw9XF8Oq0r4eyeorCQFy+UZtXNUC8PRhw001uEHlYHcjaod3ZKY4par7
         xClXt7voZGbNnFvNqTg5PmAQhZVuHlBdluSOJyBqQmqwKvT4Xaupjey8/3ly5+4IhI0Z
         HCbAwlGEILhYey8F0igcK3N9HzJtht1HEqXkgAgR3dOji80/HXtgZm135htke2PBkaaX
         HJbfGmG4RWfJedkue+gzd1peDfaKppMudX+QRJiu3ddA9V+16ueJctnmKyrkpS811E9O
         W5Iw==
X-Forwarded-Encrypted: i=1; AL+hErFaxT1THAjwvsHbmwNnMvTzc52WQmT+CDkhxMnEW/Nu/eAkmbACFFIZ81HJlLwSEPruU6TvrHhpjZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jNB5eDsUYBEz4AKIK3fPYVnND3Qng5KKAg6I8OHpspLITo1cE
	dPggaSLI+DIndM8EfuMlO3I37B4gbp5mIFUXCJxoSDrtaQlH/KtCdqN1
X-Gm-Gg: AZFdTZfiSDnsJVM8DEqFaB8+GcQb8XccLC8Y0kAoWbppaQpm1QLsSJ//TFX7gjE780/
	SlFaCGL6mdA4V8Hj4Za/92mgz3F98PPsw4JKEUCMzS+5aRxu8gF9RJFDMKdB6/bSED9bb4ofAU5
	75PBBCyTVEgcIIY16hNdb6+9h4PvxyvL2UiSbiV6G3SxtZWEIAiIM9r3RYkZV3JU0JQJWWBkcn+
	KyGrbkUMZ7EpjHh+wL/A4R5uk3FOVYNe0+PNJPiQ7snHdDRQhA5IlLHbe2rK7Q29hhySPGGHlSN
	CJvPg8weSAJL1O9N8DVUKhcsQW30W2hBAcUj62H6znjh95U1rxazE48ke0j48/ELtTxX/Z9fPLc
	hI8c1n2NQG5OJePzA5GPr0gOaRQ4gi9E04KC13J1nL5QrKW3h4KQ1zkqOs/D7zpn1/q0lZjhuXS
	+0pgNH68QZ1J4iSf3g/8dFJJrlzCn26mkwJa1dpW/4SsCb5dmrbLdzUvrFhGAl7jvxq/i+/6Pq+
	hht9s8sN3UJ0MZGTy+HeWrAJvix0sdH6RMs61NmhYYZyOghg07gQVUza7vUzSXCfJZ4Fn2FVPZ+
	m083swY8bkZCJygrzwlGWhSvnP0ahzU=
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr55547662f8f.37.1795763715954;
        Thu, 26 Nov 2026 23:15:15 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c50sm44603961f8f.37.2026.11.26.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:15:15 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 31/43] drm/vkms: Introduce connector type
Date: Fri, 27 Nov 2026 08:15:03 +0100
Message-ID: <awkt6PBpmDa69llM@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-31-21194cda2468@bootlin.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Nov 26, 2026 at 12:29:14PM +0100, Louis Chauvet wrote:
> In order to emulate connector-specific behavior, add the connector type
> to the connector configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  5 +++++
>  drivers/gpu/drm/vkms/vkms_config.c            |  3 +++
>  drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         |  2 +-
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index a43dff511fc3..257ba0342034 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -137,6 +137,7 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int n_primaries = 0;
>  	int n_cursors = 0;
>  	int n_overlays = 0;
> @@ -211,6 +212,10 @@ static void vkms_config_test_default_config(struct kunit *test)
>  
>  	/* Connectors */
>  	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
> +	vkms_config_for_each_connector(config, connector_cfg) {
> +		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
> +				DRM_MODE_CONNECTOR_VIRTUAL);
> +	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 342b844bfc6d..b415d4bf6edb 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -647,6 +647,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  			seq_puts(m, "connector:\n");
>  			seq_printf(m, "\tstatus=%s\n",
>  				   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
> +			seq_printf(m, "\ttype=%s\n",
> +				   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
>  		}
>  	}
>  
> @@ -1005,6 +1007,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  	/* refcnt starts at 1: this reference is owned by config->connectors */
>  	kref_init(&connector_cfg->refcnt);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index eb29008e54f0..efebb190ce40 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -150,6 +150,7 @@ struct vkms_config_encoder {
>   *
>   * @link: Link to the others connector in vkms_config
>   * @rcu: RCU head for deferred freeing of this object
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -167,6 +168,7 @@ struct vkms_config_connector {
>  	struct rcu_head rcu;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  	bool unlinked;
> @@ -397,6 +399,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
>  }
>  
>  /**
> + * vkms_config_connector_get_type() - Return the connector type
> + * @connector_cfg: Connector to get the type from
> + */
> +static inline int
> +vkms_config_connector_get_type(const struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->type;
> +}
> +
> +/**
> + * vkms_config_connector_set_type() - Set the connector type
> + * @connector_cfg: Connector to set the type to
> + * @type: New connector type
> + */
> +static inline void
> +vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
> +			       int type)
> +{
> +	connector_cfg->type = type;
> +}
> +
> +/*
>   * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
>   * @plane_cfg: Plane to get the default rotation from
>   *
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index bb023b5af4e4..84c49915ed44 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -89,7 +89,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  		return ERR_PTR(-ENOMEM);
>  
>  	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
> -				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +				  vkms_config_connector_get_type(connector_cfg), NULL);
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
