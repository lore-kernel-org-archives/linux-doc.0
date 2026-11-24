Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517333;
	b=tlWKtARs8Lpf7DTTEz7S/TVbPKG+xKUBBwzDuUtTa581nZV7z3HZvVEnMOQdwArnnqsf
	 V6yU+j14/DFAn2y1iMZ9R73aUBOe5QFoR73AbFilHP2a+YIs/idvX4fTexWHqzsI2c/VT
	 f+EmeIa/ATglU0rrhcbJInuIqPKajjoPvZpblluhoN3+hPRKMrdZFz4cFxlox7EV0gD2M
	 x7GgDxL7UKZ9uYRAn0dVfRd0+l1RjiRDiK1pw14O/WKk2Slo8quBdaZYNDJr9prYkDIe0
	 psT4EgoinCgBpF8F+mDQhVfiksCh/TeGnu78wtqHXkRnyGJmF1QNcXAUs+H2E0aT6XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
	b=y1OMh5spfOFSrrFUAVS99bHhL257JEXocq6kGiEFXTliohJzuHMkpXg3Rx+nQT8w3IS8
	 MfxUN+Jx5it72dM4XLy0OhULY7mYNBgDXocDykfdOy+pb2M+Y7q7b/5LtrLiwIsiU5Jna
	 KEzOk+sSDKXPwGYukxX5TVisQ1jcOUxCRYQLv2Rf8g/3Wkz+mMUFG/asNag964PlM8IkV
	 ctPfL65IFUm+Ce3pj2FGB/OiG6aEGHWXTZgGuvjuIRzNsUw9gI80F6tdb76U2n61cTiaK
	 sk17cbh7E2jyQdtRg723sL5EjvYGxWwAgynJyUTab3rD5qz0PDrrG/JbQWZwD8Aqcug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUFnst0x;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8B606A33D
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 10:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C8B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUFnst0x
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so24673145e9.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 02:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795517332; x=1796122132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
        b=JUFnst0xtFv7w6OjOq+K6fqMUot4nVGEpjGBDPWVBo1mFyxXXwQeTEEu0DnU/M0eGS
         3lfnPbQbBqX7BtBpGUbFDVxrnobuJNG4e4CnhIE1Jcevr+s0bb3qCdBnEqaR6POrAeJE
         mZdPl6zhw9uJXjtJKAyWMzVH/rclPspvnw8c8s+Z3VOltX6sWH4+gajZKnKhFLsZa1F+
         SvSmXYFyQ7SaZuxF473azwJKPsBB6ZqbxDIQBZIDINYeKNC6muV/vg3TUDVzuUFCtuOs
         jXwZ2B5brMtnA491+Qez1UrB0NFaCnZ6g6XMHeCaxIG46And8WLEvH6npTCIURwEdg1+
         wQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517332; x=1796122132;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BQWm+RaJP4cvkyTJMqTUs+AJFoZOLPdvH4gKpxS4kaE=;
        b=pvSHm2BFnTjwm0ipIMqqBgWoNrizXPinEwbhAqaNZTaBKsIumea6246mPRf9CYzUGK
         bl/KJmrEuevAOljMz8lkYeql74Q/kEASBN7K+UFS7gX3buMn09IWDSNJzt+8VLoYW3Af
         faody5TxR6rzyB+2YTmof5sV+J6hVLikEH8r05PmShv/ZbDRo1GUx1AE90gYkkFNJ2ZF
         b6yE24DKNcqI283K2jtDFHdfMsKZOLrqyJcPuF1fuOnKbodb+JXzWV/ZptsA1oPX2rzn
         TO9GCiPvmKvXfPEoDHQF69tzChfR0lGwEaCHVDaovV98kpF1mcN2mKLdGovDKgFB/FbS
         gGNw==
X-Forwarded-Encrypted: i=1; AL+hErHUPQG9NS76QDQ3MHd63HR+/g00J/QMsFWzpCOPTagDtrv9kSkupeD7w27dXMjkVft4sRPoIJchukA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/efIFe1fMuk/tLec+WFggxmFOZoMx7kSGUwhlvYBy55KrHbtk+
	2C3CMeQp4dg6XYzMQwJkf9t6YeHMJJiIGtWAJBDXKcBtJmHYl2WNOISr
X-Gm-Gg: AZFdTZcK+qmO3tvkcE23jdfm4CYCKpIbGc4D/0mxT5b80MUX/RFStWr9f5sZPJRnmK1
	gHZ9F3peU/WE9SIvbTU+QPLWccWb8MhzfvveCpTyqMO9RdPGdNV3Xz/Ixe042tHyt1837A86tfw
	PtX3qp5pX8IMtaqxRE2zXKEMLCaDcok3OsMudcXh0W+8bO+H41EfKLRqEIsGv4FGEcCSd86B9Ya
	PvigzSw8dWdbU5Fv74F7ZudmTSDjSMHM/NJgAFIDOmYA1mUZSQBWrY6xlygTscu0IljdTod42ld
	2KT8BZiaHW29Rr/GfgxBAgqt4RmEAQEsBeYISn3nR2fwZLOQKy7xDLrimcem+qspqpBYSI91xM+
	WFfjpEk/QZUlB5pPx3cM8N45f6x89Yhst/XpqTz0Vxy6cub+q9WkMb+z/ZJWozPX9+t4nrKgJNa
	u2bkmWlJx8DzTl4aZxOi3FS3iD4nGWxKXxVOZRdoQRlrZggyz1QMR7oJiRHxPpsMbaw6P/dFcDN
	tJoOhA3cxcZ8wqmlmvWoyBgRRrnBwejsSYjyLeJC4WY4/cZo+aC6LgZeHxqU56xKNHQoTvyGTyu
	KWaJfgiS/j+pST861Jy5Nbhjq0P2nmirdw==
X-Received: by 2002:a05:600c:4f4e:b0:4bb:6c71:b268 with SMTP id 5b1f17b1804b1-4bb8882672fmr303322955e9.6.1795517331573;
        Tue, 24 Nov 2026 02:48:51 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm585521185e9.13.2026.11.24.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:48:49 -0800 (PST)
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
Subject: Re: [PATCH v6 05/43] drm/blend: Get a rotation name from its bitfield
Date: Tue, 24 Nov 2026 11:48:33 +0100
Message-ID: <awVrWZkluWav6Jg9@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-5-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-5-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:47PM +0100, Louis Chauvet wrote:
> Extract the rotation/reflection name table and expose the
> DRM_ROTATION_FMT()/DRM_ROTATION_FMT_ARGS() helpers to print a
> human-readable rotation mask.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 19 ++++++++++---------
>  include/drm/drm_blend.h     | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index d17ae964fb21..b62f1db9c311 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -256,6 +256,15 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
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
>  /**
>   * drm_plane_create_rotation_property - create a new rotation property
>   * @plane: drm plane
> @@ -294,14 +303,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
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
> @@ -309,7 +310,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
>  	WARN_ON(rotation & ~supported_rotations);
>  
>  	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
> -					   props, ARRAY_SIZE(props),
> +					   rotation_props, ARRAY_SIZE(rotation_props),
>  					   supported_rotations);
>  	if (!prop)
>  		return -ENOMEM;
> diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
> index bebbb77a8f21..f000b10a16e7 100644
> --- a/include/drm/drm_blend.h
> +++ b/include/drm/drm_blend.h
> @@ -43,6 +43,40 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
>  
>  #define DRM_BLEND_ALPHA_OPAQUE		0xffff
>  
> +/**
> + * DRM_ROTATION_FMT - printf format string describing a rotation bitmask
> + *
> + * To be used together with DRM_ROTATION_FMT_ARGS(), e.g.:
> + *
> + *	seq_printf(m, "rotation=" DRM_ROTATION_FMT "\n",
> + *		   DRM_ROTATION_FMT_ARGS(state->rotation));
> + *
> + * The result names every set bit, separated by single spaces, and ends
> + * with the raw value in parentheses, e.g.:
> + *
> + *	rotate-90 reflect-x (0x00000012)
> + *
> + * The trailing raw value ensures the output is never empty and never
> + * ends with a space, even when no bit is set.
> + */
> +#define DRM_ROTATION_FMT "%s%s%s%s%s%s(0x%08x)"
> +
> +/**
> + * DRM_ROTATION_FMT_ARGS - printf arguments for DRM_ROTATION_FMT
> + * @rot: rotation bitmask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
> + *
> + * Evaluates @rot several times: only pass a variable or an expression
> + * without side effects.
> + */
> +#define DRM_ROTATION_FMT_ARGS(rot) \
> +	((rot) & DRM_MODE_ROTATE_0)   ? "rotate-0 "   : "", \
> +	((rot) & DRM_MODE_ROTATE_90)  ? "rotate-90 "  : "", \
> +	((rot) & DRM_MODE_ROTATE_180) ? "rotate-180 " : "", \
> +	((rot) & DRM_MODE_ROTATE_270) ? "rotate-270 " : "", \
> +	((rot) & DRM_MODE_REFLECT_X)  ? "reflect-x "  : "", \
> +	((rot) & DRM_MODE_REFLECT_Y)  ? "reflect-y "  : "", \
> +	(rot)
> +
>  int drm_plane_create_alpha_property(struct drm_plane *plane);
>  int drm_plane_create_rotation_property(struct drm_plane *plane,
>  				       unsigned int rotation,
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
