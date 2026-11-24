Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512519;
	b=xAZtEeYRBXuhvXEm2JcYtavR6M1L4XvUOC4oCSS0At6j+Q65IESR5ewmqyHQun5DR3UH
	 bEu676dSzAhIUcECwg3XBuZbSfCZw5kCfgz297xbFBB39scN4s55MmJBOknP70Il6pnFw
	 znQC5jKYW/S9qhXktRSL7axGqhp+BpH04JZGmGprXhn3lMDfLZb2BSzURvfpyLrQUcX7d
	 McsqG7Ey5egJNHP0yb8Dxz/6IxxbNk9p9XGfOXx1CiHDcMkZESqETiSknRvCuLoLpXBKI
	 6NUymOKyqOtDbdHyEg8ALD1jRy4UConfMUOdQoeGfvtT7AsFy/EFwpUY2exirJn850Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512519;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
	b=TF5BtprnyzsiqnVkFSaTDwPweOpWL7jeTHjb/X9vnRszNtvx9me0syzEkT6VxtCqSTXV
	 WWS3rrZrlRVawDx1nQKYWDppnGQTZfBjB7UI6PheDiJNJ7J6dd0JleE4T9T5oESJ5vDBc
	 G6Map7rHfc03DaHyfAi7G8PgYEv1hVNHuTdJU/nlqFSP7jKxdruBtVHdWgm/gH5/+suE8
	 uEhhaitdGbI0mb35cVXpK7hle4aQns2UJ/fBFfVcCX2kM0az/1gUhzJwhVmcEWvMS07cE
	 VcJxzt1FkfJgI0jShsUVIoRgG9ETtC6w/tkNOhjEmw1LZOv+3GHMqXdJdYS2RQerRfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5KW4ryk;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DAE606A322
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 09:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85DAE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a5KW4ryk
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so39011245e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795512518; x=1796117318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
        b=a5KW4rykzmoBF3wpBKu6drmzIHlRb0P4hCdIPV0t6U4Zfn6x+uBKAXogFnZn8p0sYK
         keE5gJbm0vr4PZx4QFkVG9HDIi1NMNDvnJMaGTUk/LN6sdCX1XWI6DXDNgMmST3r5EcF
         aVcmcl1tSvUV0sWwqer2aUv7IV/7xd3ObJ0LC4WO08KD2mcGGdHq59CKdvRETcHxLJPJ
         r1hFIg2P6qeQYVO1G1D5NTlvC11jsCGBHLHTd0EMuQ+tOMueed7B75XA5s2jX6wEuMHy
         vsch2iLxmQG/7vRjqtyqcgcJloEDQ7SB2dKEtHQTdGRNWmO+kvhlWRdk8wtdiLdphFEu
         wPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512518; x=1796117318;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CzKgPvM79v6jsfljA7yM9iAbIcPsktxf49AuQD8Felg=;
        b=Ci6rLxmg4VimITAE21isW3U2+AP3Xfe0N7t0jekaby+dUSonTlPZ3RB28uO/c6gjjQ
         Yuez+epBR0sUA7UzcCV5GWe9oFudI+vAWOD2CVdNokw/voctN0+G4IkRCmxXPer0XweR
         whhp7tY2+Fgd0ogG/RfTukKtyp0gzK2kH2V7L6PVosHvneT6bu1QUafZz+/sJ8Un+pK8
         2xVnP9OzQ1I2FpEFQiF3QTQBzdh0blmX2+uZ1tzSsYfoheWS0tb7PTdMcI7yCrS0thB/
         mP4pXcY+5D6C2euJCN/bZN52kZnWcsfQ+EP6ctq9cYM5zyYVuSZIThehZ5WMK99+4ULI
         aOPg==
X-Forwarded-Encrypted: i=1; AL+hErHYCBqN3dHyt47JhDX0z8i/NqLiJp41BbYXDfA7blhPVtmpK15nQ8Od/s7Sipb1PqgAaxDC8d8XJzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fC9CnUSvTThmxf8OpLsovv4kcYBRYSVK8eQAfKo9F2TmGgjuK
	vT9bkE+x40fVPKKMdM8obNero6dnxy8gRDBN3zA/Zth9UgvU0LChCCsk
X-Gm-Gg: AZFdTZeuG3G89lye1EAaiiEDtv76gp4Eq7LjS11fxTRgjDHz1OyLnrTNt05d+Ub0w+Z
	Bp5hlYXcFbCDQFlLKxHml2IBr5xqOgNtKWeBP3AQS7d60zQVT4zIYUiqgLrfjeIO1+0AiBFy0ly
	FPwmH62cXmfuwtyNIh/gM5RrOzuDBA70z/YojEKBbJBh5l0Q08hSrSAHF5E9LoW2Enx6BX2VrUK
	wEZbsMyOO2WIBQFoXXAIkbIm9Al+BZn+pWJdtqh7rYd1nY9rAXsBVhIAM75RUTODJHvLHBd1Iy0
	qSy/ENZ3PK+uLM0JHWSu+TF0hZFOSuCTmKMwId+wafGwwsYkwheLoJuv9wEQUm6lM0hpSqhElsZ
	qoRAb1hmes2ZZvHnC0SX68tfsB/pgzSozgq+JtbC7kNs2cvZX2+6fDVItizDzuYE69SxpQMp2fP
	YYGb1ccTUU5w+4swtxB8Me0tCsTTzZldOnikwgtgJomPi2aPYU8QCRAtjTE+Y4NK9k1sVx0DTzY
	s11H8AuzmtAvgqhet9DhyLJqig0Zw6PU7am+zm9oO9cTorURD1jgsn3Px1Hz2HMZHAR9wJNIdly
	h+UuKYgEDb/YebnvSADWfzpkM0nR+jMyPA==
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr275531005e9.12.1795512517667;
        Tue, 24 Nov 2026 01:28:37 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf61e8sm28275775f8f.11.2026.11.24.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:28:36 -0800 (PST)
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
	llvm@lists.linux.dev,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito@redhat.com>
Subject: Re: [PATCH v6 04/43] drm/drm_mode_config: Add helper to get plane type name
Date: Tue, 24 Nov 2026 10:28:20 +0100
Message-ID: <awVWbUPDh_7UHoay@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-4-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-4-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:46PM +0100, Louis Chauvet wrote:
> Create and export a helper to display plane type using the property
> string. This could be used to display debug information in VKMS.
> 
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index c1e993a78702..0d814424c698 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -419,6 +419,22 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>  
> +/**
> + * drm_get_plane_type_name - return a string for plane type name
> + * @type: plane type to compute name of
> + *
> + * Returns: The name of the plane type. "(unknown)" if type is not a known
> + * plane type.
> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type >= 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
> +		return drm_plane_type_enum_list[type].name;
> +	else
> +		return "(unknown)";
> +}
> +EXPORT_SYMBOL(drm_get_plane_type_name);
> +
>  static int drm_mode_create_standard_properties(struct drm_device *dev)
>  {
>  	struct drm_property *prop;
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 084517beb924..545a5b684acc 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -30,6 +30,7 @@
>  #include <linux/llist.h>
>  
>  #include <drm/drm_modeset_lock.h>
> +#include <drm/drm_plane.h>
>  
>  struct drm_file;
>  struct drm_device;
> @@ -1011,4 +1012,6 @@ int drm_mode_config_create_initial_state(struct drm_device *dev);
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>  
> +const char *drm_get_plane_type_name(enum drm_plane_type type);
> +
>  #endif
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
