Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69873EEA6
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 09:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557258; cv=none; b=e39+f3nqeQ70i2rk7uth7VPF/JQR0LqJ5mYBunhAyx43xkhtvY1mq7m3ADcve5Gv+INcIb+GI7WODtiOIVHTA/CcxbbiO6sjnt97lIwX0hZm/cTpfJLFLzvVe7O+M5ubDDXTmFJvginX2moDBEcS0SlE3c2fs4S/CCYW3oZAyVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557258; c=relaxed/simple;
	bh=hbRrAsbXn54Lx3mJosQPzrcK6Bk5Y57rqXjvKOvUfjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEmdq6jn5kLUM9tOaT3xsDLeZObDJkvU65I//QpO8DUk3jhYlcUbmEW9hjhw6DG2wFp8ZoO7hPe3aAsq23axgyKmTUirC5cD14ihRQY3WOaG8wQUphM4P8sc0oD0lXYS6kz1SpCtAaIfjN0NM2O81i6KXZLAYAL+8Z764x2Zicc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZcRdzFLm; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZcRdzFLm"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso3973586f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 02:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557255; x=1762162055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XbFQN4z+8uQL2wpQ+sfpguxFieK37cH2bAkG+VAGE0=;
        b=ZcRdzFLmd+65hqiGwvOa5JRSTYS9AV0NwLjUn11LS/Iq960/rMsBA0yBb2P7j4yf0c
         lCoz7cWNE3/MGHLRZ3BYJh+/zgFXaCz5Mt5wM2Up0vmvZLH+nkg3ICnZaLEcKjUehmVl
         xFOKZXoYsn7SmIxJh9BYASuRGXEarASmeNgOD+ksz/I0p/EUbFC3uzm1jYmyAIhuIort
         SHu64IVniQmSE7NgSG3Vb/NNGWe67j4Hawk/IfTjTUK5I9PSS2xtxuWNddwcLBkeqD/h
         ZXMr+LyuELJA97TWanb9rp9AHPKkgvoVsRTjj9+YbW4fHbgb0+Vzhw5b3cnVuWl8mXLf
         wlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557255; x=1762162055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1XbFQN4z+8uQL2wpQ+sfpguxFieK37cH2bAkG+VAGE0=;
        b=RBP/7yLM7/osyM6qlI9a8ve7NmneMRppzlvyjM1IUV90VZ4Oc2Ku9YSgWKxzMT9trr
         7VK1KYTJ+3ySqXsLkDQ6gBSqNWkvQEmHKYl/ZqsAi/a8NzIUVvvpvZNxWO2SYbhgzW0m
         T/3LNXKJm5Pvgfv02+yfHxK4X22BQaysuLnbCTpAyN1mA9JDMgQbf2IXiQWQPT1Z7y6X
         rtJmCvQpAgFQZLmMCQC326ktunwTIKqiE6vQsWpNyA3boET7/YTqzDcJ9QQ45cm1gZl/
         duiPvgu7s+hEJxcIfLD7Ztd4sJyQdwjnWHDtnvWlRvJrKq1bfMhXXm7vG7RiyIRcHWQ8
         JDjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJUhbjSzmAuRxpnJ1QOBD6Kz9GLETlb4T3Ra5wSvESKIyn1R8neIWJmvyG9XINB+6uUCdOuXPtADo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtspx9gT13N4gphyyiQz86QNWvWsbbSPImtf5jM9FKrULF2LEC
	DTOQF9WkH63waTvWTDS+p3grOi5Pwwvp23Eclp326Kd6Cr5JAlvC3Ldp
X-Gm-Gg: ASbGncuxv/tp5J3pamBZPUOmA13Mlwi6WsBumDy1TeZ+hAwFptwmCckBnwr1xgXrCMv
	58aO3VyB/HXVdvWhpF0zgQotb01hHU6atLRwFwynMs3UinFNv9b9fbj9WBNRdiPrMuYoFwG8jka
	9Pjl59cBWamDUEfM2JA799EScdX9xoKZFd1aUj+/Jp9jl5es8SMJ9KXXl0goEntKTWHvp4lG+x0
	VfBVzkSEyauBGpvbWLTrUDC3cCixPZ8rCgxD0DHNjfzzsDidUst9P7JdBVmSeZaN+h3mdQtupxX
	Us3if38rytLSLNzcufpQ0Z+tEhty4ZHm/y2j803YMX+mI4vpdgeN9IuV28UGeG4fgpgsSebvRMT
	5nh54wJG59aBS9mgk6Qlp1zZTXKKgdh3HhayQ4+vJWabT/dsLDhDAOCR3JjwlG4ozCCj2oSyBC6
	6jlJ2LyBUS
X-Google-Smtp-Source: AGHT+IHcyTe136nWSTxsMQKxX59pQ/f0Ypkv0sfxJUZlqYO+kymBeNP1oT9oBON1N3Qewg0X6Y2Jvw==
X-Received: by 2002:a05:6000:1863:b0:425:742e:7823 with SMTP id ffacd0b85a97d-42704d7e91dmr25788662f8f.12.1761557254451;
        Mon, 27 Oct 2025 02:27:34 -0700 (PDT)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a7csm13166563f8f.8.2025.10.27.02.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:27:34 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:27:32 +0100
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
Subject: Re: [PATCH 14/22] drm/vkms: Introduce config for connector type
Message-ID: <aP87BOrWoR7tdGga@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-14-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-14-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:14AM +0200, Louis Chauvet wrote:
> In order to emulate connector-specific behavior, add connector type
> configuration.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  6 ++++++
>  drivers/gpu/drm/vkms/vkms_config.c            |  1 +
>  drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         |  5 +++--
>  drivers/gpu/drm/vkms/vkms_connector.h         |  3 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h               |  1 +
>  drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
>  7 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index f2b38b436252..8633210342a4 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  
> +#include "drm/drm_mode.h"

#include <drm/drm_mode.h>?

>  #include <kunit/test.h>
>  
>  #include "../vkms_config.h"
> @@ -126,6 +127,7 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	struct vkms_config *config;
>  	struct vkms_config_plane *plane_cfg;
>  	struct vkms_config_crtc *crtc_cfg;
> +	struct vkms_config_connector *connector_cfg;
>  	int n_primaries = 0;
>  	int n_cursors = 0;
>  	int n_overlays = 0;
> @@ -182,6 +184,10 @@ static void vkms_config_test_default_config(struct kunit *test)
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
> index 5da34a3e8114..20750c9f6d08 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -771,6 +771,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
> +	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 267e45f5a617..36d289a010f6 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -126,6 +126,7 @@ struct vkms_config_encoder {
>   * struct vkms_config_connector
>   *
>   * @link: Link to the others connector in vkms_config
> + * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
>   * @config: The vkms_config this connector belongs to
>   * @status: Status (connected, disconnected...) of the connector
>   * @possible_encoders: Array of encoders that can be used with this connector
> @@ -138,6 +139,7 @@ struct vkms_config_connector {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	int type;
>  	enum drm_connector_status status;
>  	struct xarray possible_encoders;
>  
> @@ -315,6 +317,28 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>  }
>  
>  /**
> + * vkms_config_connector_get_type() - Return the connector type
> + * @connector_cfg: Connector to get the type from
> + */
> +static inline int
> +vkms_config_connector_get_type(struct vkms_config_connector *connector_cfg)
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
> index b0a6b212d3f4..5a87dc2d4c63 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -68,7 +68,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>  	.best_encoder = vkms_conn_best_encoder,
>  };
>  
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
> +struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> +					   struct vkms_config_connector *connector_cfg)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_connector *connector;
> @@ -79,7 +80,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
>  		return ERR_PTR(-ENOMEM);
>  
>  	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
> -				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
> +				  vkms_config_connector_get_type(connector_cfg), NULL);

For debugging, it'd be nice to print the connector type in vkms_config_show().

>  	if (ret)
>  		return ERR_PTR(ret);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index ed312f4eff3a..a124c5403697 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -24,7 +24,8 @@ struct vkms_connector {
>   * Returns:
>   * The connector or an error on failure.
>   */
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
> +struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> +					   struct vkms_config_connector *connector_cfg);
>  
>  /**
>   * vkms_trigger_connector_hotplug() - Update the device's connectors status
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 9ad286f043b5..07bdf3f550ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -226,6 +226,7 @@ struct vkms_output {
>  
>  struct vkms_config;
>  struct vkms_config_plane;
> +struct vkms_config_connector;

Since vkms_connector_init() is defined in vkms_connector.h, I don't think
this is required.

>  /**
>   * struct vkms_device - Description of a VKMS device
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 22208d02afa4..217f054d9598 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -96,7 +96,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		struct vkms_config_encoder *possible_encoder;
>  		unsigned long idx = 0;
>  
> -		connector_cfg->connector = vkms_connector_init(vkmsdev);
> +		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
>  		if (IS_ERR(connector_cfg->connector)) {
>  			DRM_ERROR("Failed to init connector\n");
>  			return PTR_ERR(connector_cfg->connector);
> 
> -- 
> 2.51.0
> 
