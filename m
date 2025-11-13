Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313F42727FC
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763043800; cv=none; b=NiRFLNh7UFbAn0O1WgXUk4x+OWQ9MAOLPiGinI0tZUl36xc3IrumGA5kUfzEYusnZF9XXz8d0WeSOj2nG0zjF03hy7z9bEm427TBt5poVbYBDsaZaTeTLjVZmdRpzaHNqfs8kyyzHlrIUr42tltFtR5PnWSZed/fEHyIO5v1u1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763043800; c=relaxed/simple;
	bh=Clg5sgelmLHIJ5z8SyFZ6KUG1rYMaJFsiuldl9IIEBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sPDFL2IbZBboKCmHjCT+PpaINMEjSksT6j/qTzLZJxhlyQ3DZzDvnKnXQ+l8zBUdOeeIJos3818KvSfZIoFPB0bI+uYUYp4RHfIANuwKwjmfPVx72FJC7qTHzDzIUU9o570oWinlmzqxz+KSUVdd85D9ccP/199ssw8mflBGPXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXhivovE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXhivovE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so729026f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 06:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763043797; x=1763648597; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhYQOOtjjyjB/jgUZ1+VwE5sf09BZ6WsEiD3C3pc0mU=;
        b=TXhivovEKDFxjaHLkzVrfVhKNHhiagJxUjnE4H2GD2lZMCUIrVt3Yg0IqAT10ALcFj
         qg8QWHsdYe71VNbi8CTKkVpC/dmR4R0ovXPODo8lwGktvvXa+ibopR9aFGlGky2DbEqv
         7SG2YKttSltpV5w9oSUKSLrxIYR3GACQwO8TFbCXRSBqUtfLbUHm4Or+tOpPr0RuHzbV
         T3ZaKUUUj5mMSlNU3eBhF7Df+OsgeGHnNKCjGV/jJ9vFvOjKsbRRwg46M8BUx3igrj/2
         BRUA//biFIAlWe2qyNSlDeFtpupjNCyBGyTzH8w8+AMFrFHwsxGaARsqqEZ8nVX9ewpt
         Pomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763043797; x=1763648597;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhYQOOtjjyjB/jgUZ1+VwE5sf09BZ6WsEiD3C3pc0mU=;
        b=uWv14oegQkdnh9lAGoxlErKI3dQxqP60AutEKFlpoiEjhEIz7q5/B64Us5XR4dDn9a
         InlEqPnVatKTtJSZ+6oQuiyo3uAG8adXkPd4OQqz8Wh1mLCsyguKQi5tP7Bx0Pvws5Nr
         VdlWXFEsHuX1XAbaaHDUTAsCtMZGKRdfGEHZdGPNOIv+N4V9T4+iJmx25JCfxVUA5VNB
         Rc90jXKjrs7+2vQNvt/BxaMrfCC7oBkd68QoRIVFMa1CkH6ujBE4cFx7VSP7yNggeuqN
         MaIv9vlFdwDGhC/uRJnWWt7GMOREquoHG6V7mQHKSRmLYQjywZHjNANxrT/rUjRegVGG
         gaOw==
X-Forwarded-Encrypted: i=1; AJvYcCX8eZaEsiQEz+yt/fggV3+KTHzhtB7L3VVJT8rhWxTYgA2QYIZu75TDdvHfgfvvirOS5MDWG2kZgPs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0wyicATwWlN0wfKCXSyss5JVHZQvkhM1zQF0ev0vtjPr3uChB
	itvjsuY9L+rTy/zwiERgucx9NJRkkFu87lDEGnJDAdof1cPTTrrgyAeT
X-Gm-Gg: ASbGnctFAfocZ1H2/MYkdsoi2dJuvI1HPJKYSuyemQPaSL/4Gcgchsv4LWgDg6zJdWB
	vt/0+Qel1QEB/ZBl1yTJz96gi9ofTxstLOcqqL1jRORUPrfSq95HApLSU9qDNLn5punOEI4/LJT
	8ynAw4rH/LeTZzps7duxK6k/1tN2HY3D8/ljVnJtxAZTlzftHQ18KZdq+ZhqPZCvCMMCSQd0E8y
	ijRSanIxLoxecTug5S11UoNccttZVjo8qrdRM+6O69KQB1P1Xm2tbpkJ3jAOuq7alfQpXlwRny3
	y/8dtit1o0Ue5nk6RBB4wb/VhZKfizAlXlo2liDJZcftJFHyY86mAPhs8xR31RDh24lvjr0+1LD
	raBXQdk+BWX5g42aS4KJ3DqvggVjooEHtxPGtyluqtQHvFvfULUGK0nxJuxUSryA5c/AiQhQyfQ
	==
X-Google-Smtp-Source: AGHT+IE//V7nbtwXC5oFFlsMj1/yL13x4ZMxszjS+8enQRa1LEBFN0JNqsEJq8K17yBdpD+Niv3ZaQ==
X-Received: by 2002:a05:6000:400b:b0:429:b958:218a with SMTP id ffacd0b85a97d-42b4bd9106bmr6183342f8f.28.1763043797368;
        Thu, 13 Nov 2025 06:23:17 -0800 (PST)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm4433060f8f.19.2025.11.13.06.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 06:23:16 -0800 (PST)
Date: Thu, 13 Nov 2025 15:23:14 +0100
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
Subject: Re: [PATCH RESEND v2 07/32] drm/blend: Get a rotation name from it's
 bitfield
Message-ID: <aRXp0rfAoXxJ8PEh@fedora>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-7-a49a2d4cba26@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251029-vkms-all-config-v2-7-a49a2d4cba26@bootlin.com>

On Wed, Oct 29, 2025 at 03:36:44PM +0100, Louis Chauvet wrote:
> Having the rotation/reflection name from its value can be useful for
> debugging purpose. Extract the rotation property table and implement
> drm_get_rotation_name.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
>  include/drm/drm_blend.h     |  2 ++
>  2 files changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6852d73c931c..bc7c05e20242 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -241,6 +241,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
>  }
>  EXPORT_SYMBOL(drm_plane_create_alpha_property);
>  
> +static const struct drm_prop_enum_list rotation_props[] = {
> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> +};
> +
> +/**
> + * drm_get_rotation_name - Return the name of a rotation
> + * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> + *
> + * Returns: the name of the rotation type (unknown) if rotation is not
> + * a known rotation/reflection
> + */
> +const char *drm_get_rotation_name(unsigned int rotation)
> +{
> +	if (rotation < ARRAY_SIZE(rotation_props))
> +		return rotation_props[rotation].name;
> +
> +	return "(unknown)";
> +}
> +EXPORT_SYMBOL(drm_get_rotation_name);
> +
>  /**
>   * drm_plane_create_rotation_property - create a new rotation property
>   * @plane: drm plane
> @@ -279,14 +304,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
>  				       unsigned int supported_rotations)
>  {
> -	static const struct drm_prop_enum_list props[] = {
> -		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
> -		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
> -		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
> -	};
>  	struct drm_property *prop;
>  
>  	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
> @@ -294,7 +311,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  	WARN_ON(rotation & ~supported_rotations);
>  
>  	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
> -					   props, ARRAY_SIZE(props),
> +					   rotation_props, ARRAY_SIZE(rotation_props),
>  					   supported_rotations);
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index 88bdfec3bd88..381d1f8d815b 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -42,6 +42,8 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
>  
>  #define DRM_BLEND_ALPHA_OPAQUE		0xffff
>  
> +const char *drm_get_rotation_name(unsigned int rotation);
> +
>  int drm_plane_create_alpha_property(struct drm_plane *plane);
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
> 
> -- 
> 2.51.0
> 
