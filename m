Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DFE26ED48
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763042779; cv=none; b=SkpxsEsjsiDV43GT72pR57iwMgl3RdxW381tQp43rbA3Fm7vOkNloZoXwJRJhop2d6wD4jI0lvcao+YSfnyFvXmLM249MpsgJ+qiT1ylZAtdA35h8Le4mscM9qtjB6SBd5HdfUm/eVUJySfe5MLl77gY4oxoY+9PwVVVI/k29gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763042779; c=relaxed/simple;
	bh=nK8MVAuFtnwjDTKej3Wwkox0y6Sz4b5Ew5nLHAtDTk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIVglVH7VtTqVtMuKY6mCUR04jg8fLcJADAaM06kOxzv7LeycpdSH8uSd2hzFH7EGtEHtAy7rTobv1ipYfatoFdZaFqLHiHkfHSsc9+bkoKpLxreYC7tHW/3HS0EILIcbREIDdlMomnwnEWWlo6JLbVzoxX8UrSyqgJD8/sXWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGJS330C; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGJS330C"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775895d69cso4928855e9.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763042774; x=1763647574; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+fBsOlwKGvCQ9PsGreXfd2z/e8NXAroPl/lCt9m4U78=;
        b=YGJS330C1hnIzun0+YSph7MwVKDSqxwKzNoh4RwdpoDkpVJn953eu9HwZARWQFbPee
         Y4zlaBPSgsr4MU3u1q1aoMydjPZ5FY38KxeXt69mwUWKrCr4LGQiaoK4H4LcdthafSjA
         Nkt34sGuZWtmEPa63cQx+aLyEC5VAAWBz8RPtneLJA/hMrPYaZ6cGclSA3tauB+kWBxR
         wif9avmKBxNUaDTuTCK/1x1FSWjBpzWUPhC0a3qHB9MxZLmi5eV2wqske/HxkBxqQzcr
         nPUJwuVCz01uso0UU8mH8xY2ExKwXpe2d2os4Pk99Svct5QzdGH/Sqa/upbJF/t8MCDQ
         c9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763042774; x=1763647574;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fBsOlwKGvCQ9PsGreXfd2z/e8NXAroPl/lCt9m4U78=;
        b=ZeYI0p5qA5xYSRuboTlt3BoaSYa4Yd47hzs2XahsaF4BFPNtKjAH3vYabxu5mjz6AC
         fhx+hNx8bAFkiAj/6HA6xvICSxhSATx8z6mYhKFUZoND3NxNteww9mveg/4TLmWJwgbr
         7LxR56uE1vfVYXmqWJvKKlkd6AC4hZmdKZQMWR/SCm8m0pLGLQ8mmA9ZvWBdKufMfxjl
         7OoJN6ndLvAJghZ/x3Y1oN5hqccU++B+hJN0wSdubi6lrLwcM1LLkgp7AuqctdQepbk7
         ysLHFqnGLI04PsI5PjlPNZszGXbngJ8AWCGV7hu4tH/Gx8DW8Pcw0MkhVqm+bJ8sc8G0
         miJw==
X-Forwarded-Encrypted: i=1; AJvYcCXmozMByxX1Z+tJrilPut43uZcu6dYG9VRt5B+DRDOPHUCADDGz8rrCSe5A1HJWSZA8l6hQGFJastY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92Mzj3ru64t8dGVRtE1A51d2ffYLUohQ/s3Db/Mrt8u2CgQ1D
	KJdjDm8zOZr5fUwbGr8IxsREiB67i9mw57UnprVqG+3QUIz7TglsGDpc
X-Gm-Gg: ASbGncvoA1mBG9XHlPFT3ZYaRKSG1ncTg/2SpLsdhwgqrYFa3YYFN8Yr0ROrmc8C/BO
	CIsg8K1Df16Ok27SOVLQHi2offeNiBUoBxJXbJgtTEzebqpo3j5GODM/ufvgbG+U6beCd8Ra2gB
	toIfFaJGlSYJA+fwZfzmtvVzheuvz5ToKFauiD63CK8yy6w0YXSh5h3G0kzeCeua4VyhSU2DYlP
	35QyEgU3I0wumvO3i3BdOZtCN1JDYwVkkAV+rSlzZHL1Q1j8puvTNFaT1U2ffyoNTeslFR3+3P4
	s1vohWt74dsl4HM73HYYXhG6n6pZWSIAhDt3L59Dwghbl/K00nXOjYJXRvpxJOW3WbqbCsvWx5x
	hK0u9dEQfUugLm40XVmr/FPZ7qivWpTrPRviI5tJ7eumtvfzo0rubGen9nfGg0mr1/nanWU9p5W
	jcqDsiNi5w
X-Google-Smtp-Source: AGHT+IGUZx82/rO7Dbnk+No1GqhvJ0gfmQBea08lRQxmlKlDUu75KygUGkRVhWdZ43wtSDUahYjtnA==
X-Received: by 2002:a05:600c:4f91:b0:477:54cd:202f with SMTP id 5b1f17b1804b1-4778707095emr70617955e9.3.1763042773366;
        Thu, 13 Nov 2025 06:06:13 -0800 (PST)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bcf051dsm21104525e9.3.2025.11.13.06.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:06:12 -0800 (PST)
Date: Thu, 13 Nov 2025 15:06:10 +0100
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
Subject: Re: [PATCH RESEND v2 01/32] drm/drm_mode_config: Add helper to get
 plane type name
Message-ID: <aRXl0jt2_rmXFRUW@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>

Hey Louis,

On Wed, Oct 29, 2025 at 03:36:38PM +0100, Louis Chauvet wrote:
> Create and export an helper to display plane type using the
> property string. This could be used to display debug
> information in VKMS.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 13 +++++++++++++
>  include/drm/drm_mode_config.h     |  3 +++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 25f376869b3a..1a1a3f43db4d 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -226,6 +226,19 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>  	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>  };
>  
> +/**
> + * drm_get_plane_type_name - return a string for plane name
> + * @type: plane type to compute name of

Maybe we could document here what happens when the plane type is
not valid.

Returns: The name of the plane type. "(unknown)" if type is not a
known plane type.

Other than that:
Reviewed-by: José Expósito <jose.exposito@redhat.com>

> + */
> +const char *drm_get_plane_type_name(enum drm_plane_type type)
> +{
> +	if (type < ARRAY_SIZE(drm_plane_type_enum_list))
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
> index 2e848b816218..89f3dd46178d 100644
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
> @@ -983,4 +984,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
>  void drm_mode_config_reset(struct drm_device *dev);
>  void drm_mode_config_cleanup(struct drm_device *dev);
>  
> +const char *drm_get_plane_type_name(enum drm_plane_type type);
> +
>  #endif
> 
> -- 
> 2.51.0
> 
