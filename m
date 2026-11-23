Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795450352;
	b=YvCqywopCtdKFBAj7TA7TU5reZg5e1p/Hvm10dbaQROpy1/W2Sb5nbDDaHg9v+H8gmjI
	 cf4gtpQwNCNZOOMb+mo89tTyvL8YAB3Xdnlh/KFGJImXcFv8Go6BKVJHVHwtZTKC10SGR
	 GBi3atERyvNcrhYnFm8oKUeZuce6rbhUiEGuIruTMY+Vyrbyv2ZghzUqxeqRtI0CMoydq
	 xE62Od6E3pI/Apc0DnQZSQC7jfDB01bboQqPrZ70479LbAYgdzF9+dD1CFzaXn5FVIe58
	 g4B27zZdxrOscA6HOewONR2GmRa6UCQZ2Fcx5NZIySuiXoUYfbeIOpqoEPdhOIwAB3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
	b=rAEFltVokpd2rX1G0LtA9burbkb423MWGa5kYAw5ejN1sQzPaq5NoqSE13qDA8s8vYVN
	 w2eY31oc9gScrg+IzegR7kgASQCrY4T8yUisTY3wY88YwLYvov/9zy6tEIq0alnDDgMnE
	 CPIeRiAZOla2v1Bspa1bX/npH3rUBoW0vo4snIs6ALPwwufqpC9nThCjTnS3Rcbj9vqsO
	 Ezlhdo40+1O6KIbZeXdTWqXGKD9RrPNyLDtPUvkESigm4Wi923E72Hdb4W6MRy0sHH6We
	 KagauAlq+UrZHckW5k5OJwAQz0d5csVv7hreaxhaH7QmV0/ghy/0AqDAR8a1lrCdu8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lq6ozNge;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCEE606A32A
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 16:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDCEE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lq6ozNge
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so22242315e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795450350; x=1796055150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
        b=Lq6ozNgefhx1Reb2r25IkR0ULI/2hbXHfEn6Yw5MiFTkBQ/9TM1hJxdSvIUAwA1iV7
         /4MJwvN2YWss7L2ydGbUFAVMBwDjNnCjUqqLW5F6gItVynWIZphrvBOTyN8d0VB7hu3y
         booP+MAOKaqh/zSVAfXstFCggLNmGiyIn+3UU13YABGdNcvn84hB2FXZ/Zjdq9lbjVUK
         FLHCqkvfVJOxJFwCwIVhSoZQmeP8JrrrLD//rL0aup1EXFiXPSRlD7t3T1l9N2+iFaZu
         Z6LmsJP/yjXumS/oMlImdWi43WN80bn1mKPX6Y4/RlZ5sHwqPhSK+RsK8JFCxQVGAx70
         fZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795450350; x=1796055150;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q8nYEbLZ2llq6j+JAuDJiblDLINgvbNEzxuytFyLiig=;
        b=mAsSuHjTm1LuYOquHaVcJMCSCNSbW//rK17R/P0CBDavPPOIGSBV0cpILh3XfG9aOA
         lr+NcBTDCRC/34VumDFIorP9IjdKkFxR00fYM9p69L1srDskYOnGQ1Yl8hVqDbCQ3pKE
         3yGpvhVc21YA4jeFJRr/fRGXgC8BQt6WnTMT8hj4231n40DPYTmcq6GO47py/jT/losE
         Fr6Pi3TleiSeXD9uVl2doJfD7TBvPrZpg/KMmSyX4SgKykQWKlqqD1w/V8KEmBxKMKbU
         018eEMPwgEkcEwQFxcA6oPlyln44BMZVjEIb9+znzntH+m1uHseI7FXpx/zPyV2A40XJ
         Gh5Q==
X-Forwarded-Encrypted: i=1; AL+hErHmoiOw+mO1CVwHQs8APW5oq9MG1/ammpH1mnoU/aRgWQl2VhTnLqGfbKpl+aqXNsu6nhZFvxxM97Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oeCjrU6wxZ30sgwEGCIFDapGjQ7f8HF3nOI9rbexyj1Xtmbh6
	HsSqbAz2b7R99m8uwZ+eQfSM57nvoUGyrMj4+hLMVnuxqYexEoFJwX0O
X-Gm-Gg: AZFdTZdW73MSQiQTGg0D43hMROpyHRtZJG+Rwhba6ymDg4tWs1FXSBgzcXDGx2PZOaM
	OPn/gEWbZJWrkiAbwZbMjd2IBUP1gzawZ+jc2wGZ3GU0F9W9a2fjyk64MfuwyJW+DXFXoWM9xWG
	UNworZOoC2AKMAdw3yKHwX1Ca06+ZH0TNP4xRwybNDQNn60dynhnXFPYmB8bEEmoULi3aawXCve
	MSWFJM0vfpwRLMrGKQEk8zLydIiVRY37IPu3stlyutaqoLHOnHQdcn0WEx4wkGhh62E4MNd8/pt
	26e2lW1iyb0FjZgA5zKwMZWO/DsPaihi+QW1cJw+aPsacNoDxuXYLfD6S/vCEEMs1BigYpJlwaS
	mv0QqHdojaSJqw5w9pDEKLxVAl9NGnfqvClF47gIpJPKls6qWsLjQUTZXiwvFszyx2cd2mjm+9p
	xRR6PMMwz1Cfxlzs3uEoPe/2Q85GTMIIKociKTXxeWm78350BdbmwNGcNOy1EQUbkQOUCwFOeW2
	yAfhcVXGr8FBP766QDmwEOeIQ7LGm3D/C68DJnjeXwbzAqB9U2VjivI8mwbL9z4PqhgZay8IqFh
	b1ZlIz5bB02Xa/1MnkY2o+ANE4jEr0vXkA==
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr237295105e9.4.1795450350202;
        Mon, 23 Nov 2026 08:12:30 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm201819645e9.3.2026.11.23.08.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:12:29 -0800 (PST)
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
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 32/43] drm/vkms: Introduce connector type
Date: Mon, 23 Nov 2026 17:12:08 +0100
Message-ID: <awRlnGwi30MkhfyZ@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-32-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:59:14PM +0100, Louis Chauvet wrote:
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
> index 963e32d5adf7..291c0330bc56 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -651,6 +651,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  		seq_printf(m, "\tstatus=%s\n",
>  			   drm_get_connector_status_name(
>  				   vkms_config_connector_get_status(connector_cfg)));
> +		seq_printf(m, "\ttype=%s\n",
> +			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
>  	}
>  
>  	return 0;
> @@ -984,6 +986,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  	kref_init(&connector_cfg->refcnt);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 9d0a0087c9da..88429e01089b 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -138,6 +138,7 @@ struct vkms_config_encoder {
>   * struct vkms_config_connector
>   *
>   * @link: Link to the others connector in vkms_config
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -150,6 +151,7 @@ struct vkms_config_connector {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  
> @@ -371,6 +373,28 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
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
> index 11e313440225..f5e99e77e84f 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -88,7 +88,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
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

Reviewed-by Oarora Etimis <oaroraetimis@gmail.com>
