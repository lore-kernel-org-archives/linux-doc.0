Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505921;
	b=jnhDwNOGBKN9yTuoa+qc6cVuP0IK6eWVTvrCdWiX/tcTndJ7uRsJgfGOtszXUx0F+tU1
	 IrcarWy4erM2Texer2kVUGGmx7P6waVNJMKEIuXUHqn72jT1wtnoF6zmrJLSKe0LRjlQf
	 DxjLLyo0A5Z4bSqHyHtTsR/MGKkzkRqOfJj3F92+f+XiX7NPhgcKCwEUTdRdxLDih3OYS
	 67Qpr3yEdkPysRq8vernbeeyd73kMYkngclyq7ByaCeKi02IXsc+758SDbvfRaZ7EmUKC
	 Gj2DNTXO14cB4RXHN+aPLdi1r3C1jZjuczqTmzo320ZSJ95A+axGP05M4ti+M3/ArXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
	b=d6S96ne7NhX1vUG2Pa+6KrzRqR0sNs9es/S0Vj2NFQ2ChP8uktzeM+KPuP/Olk24iKyz
	 gKlo3AsLARR6mNzDIWSMXkt4Diabo+GWrWO7vfa16SaaPajhchIsEb6L93v+ZcWvAETtz
	 WLBY5sIZtw8nBBfE8UUT4oGK+0TEtFsFLauK9fHKdpSfOOVHHJZMjzn/RQUGYrbbQ8Mjh
	 95FhUc6bLBI3eKMTCSENHPa3c/bhk71p8lrP+2IymYbdFUsICLdZvWWTpX9DEfBtrtiWu
	 XVdWGxq+HV0N85m8KqzAQoD3YkvaSra25wO2/3FTNdFeBMwr6KCVGfsBTcqF0o2jdNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0J7YUXAk;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E077E606A32C
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 07:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E077E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0J7YUXAk
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b467581b98so39498515e9.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505919; x=1796110719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
        b=0J7YUXAkuVbWvNMR2NittZISUbkQHHMqKx/m8queXL87lfLICQTSQntH5YNCat5WgV
         TtXD0MVKx91SOdwxL2MssYhNFdyxJ7H6EKSQ/oqRhOZTWnyrWZMi2em0eim/uK1FNpKT
         Cn0SYV/1VhQ7sxSReeftuTb61c26wbk4Ifo0dgcuCS0a9uMOyLMihnt3NI+8JsyFG1jb
         nPCAA+rNpAS3fT+KVabN2wZ/egkl94rQpIBmGnI1jV8H6PMMqLaKzWoXnx3gDULN3eEn
         x+58fXPCRN6Srdqizx2tg/GX3ONN6Xx+e1/5CRtESslxl6D2J6A1jsZLDeo+FBEG49e+
         VZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505919; x=1796110719;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YsrbWXbneAhmlRMenrVJ4CAefsGYSIi01YHG77kZWSE=;
        b=NpnR6s1kgU88FLDb3sN2nKJxn28Mo/erZV2myBOZ3nUn9r7GGMCegxRwMkGYi2eU0e
         UxJK9koelK4+eAMzD1VK1viQFHx0Tnpec5kT1AKxenNGOyQr32DU3ztmj8jtOvccalaq
         HrZfymrLnJrWKrBVz5x7D1SDgPmTbp65d+kq4n0Mu2zODPRGq7bene1I3vOQ1oQtY0qq
         GLy7JrjjpymRU6wQM1CTCLTfvcNRTWrZgd9ABFIULK/rh+3Yan0mH6BFg6SE+yk9QiVZ
         BHF0nnlkafexa2z4zrF45kB30WXGWK6mg0D++MIUzKCQ1A73Qw8aI9J7D3rFD1wOC/Z0
         uH1w==
X-Forwarded-Encrypted: i=1; AL+hErHwNA7BtDEcRfVnIKKtfmV0/hXfnA/0l6wRQSZ4woywdNIqlIy3Z4HrTPhJYdCowRwehZcMsTXef0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bExdT579/rdqo3NsV5/Qmq9dhY8/XhU5p8LfVZioCKwnUxrxF
	PlZ6oU1K0Byp3Cb/9HlUNq+80KgxfxomRy7Zni2T8TV28JHd/jY1YSWt
X-Gm-Gg: AZFdTZehO7VkvhhdBTY+/GE/8ai04OSSVUWUfGd6JKM1G71Mbvd16Hd+3nz8uYAuWI3
	2eK/ZU1bli4Tddped1FiXGz8UpN3X02PWT1QFKotoYxP5Ifrc2PY+XMBRi6+n0usRhPsS5ZbFov
	bE/39VfCnBVRVJ59yyjXXeRG0AQcxkSjVSREby98/hOEfGP5gf/t1NbEP4AP7cweinSj9h3YU0S
	DJZcXi6DTft3uMIQXj7O0VIhC6CXL9drRQnhOVwQ44Ti4rJGVCdj0ulhBU8DrzMqBfQdskYMtqo
	asIf0tY6eIqywkwfCAI06hGYi+yrcwZiMOBLFukuP0hZ2AgKBxXfH/vLK9f8oN3uQBrq2n1FndD
	ApyoY+HE2CD89xm4uHmlhhy67ZnQ5WGE7Eq2seiBwqnk55bdXAChL2rN3fvFv7Th1xUT/aCzOgY
	MrG8Sg3mGMkV/LwWNrp8/pZ5BR0fwsBJWW22Lykoo/+lTtG5AqcqNgPZne8SvwxwIG/qVQWKd9A
	nPdSA49NgHudEPcYpSGZmbitoVie4OGk+74a97+7U+A2Bh0RuzY7xEewEbSGDvHwvUVP3yQmWz9
	DnvUvzAGQ+6hXzvpOVEojh/AgRc6ZZYULQ==
X-Received: by 2002:a05:600c:190d:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb888267aemr276593835e9.10.1795505919009;
        Mon, 23 Nov 2026 23:38:39 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm25975635f8f.10.2026.11.23.23.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:38:38 -0800 (PST)
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
Subject: Re: [PATCH v6 18/43] drm/vkms: Introduce config for plane name
Date: Tue, 24 Nov 2026 08:38:23 +0100
Message-ID: <awU9pNtc2l0JXLzs@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-18-78ace90f4fc1@bootlin.com>
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

 index 49510a0957c7..8704b6f71000 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -44,6 +44,7 @@ struct vkms_config {
>   *
>   * @link: Link to the others planes in vkms_config
>   * @config: The vkms_config this plane belongs to
> + * @name: Name of the plane
>   * @type: Type of the plane. The creator of configuration needs to ensures that
>   *        at least one primary plane is present.
>   * @possible_crtcs: Array of CRTCs that can be used with this plane
> @@ -56,6 +57,7 @@ struct vkms_config_plane {
>  	struct list_head link;
>  	struct vkms_config *config;
>  
> +	const char *name;
>  	enum drm_plane_type type;
>  	struct xarray possible_crtcs;
>  	bool default_pipeline;
> @@ -342,6 +344,39 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
>  	plane_cfg->default_pipeline = default_pipeline;
>  }
>  
> +/**
> + * vkms_config_plane_set_name() - Set the plane name
> + * @plane_cfg: Plane to set the name to
> + * @name: New plane name. The name is copied.
> + *
> + * Returns: -ENOMEM if the memory allocation failed, 0 in case of success
> + */
> +static inline int __must_check
> +vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
> +			   const char *name, size_t name_len)
> +{
> +	char *new_name;
> +
> +	new_name = kmemdup_nul(name, name_len, GFP_KERNEL);
> +	if (name && !new_name)
> +		return -ENOMEM;
> +
> +	kfree(plane_cfg->name);
> +	plane_cfg->name = new_name;
> +
> +	return 0;
> +}
> +
> +/**
> + * vkms_config_plane_get_name - Get the plane name
> + * @plane_cfg: Plane to get the name from
> + */
> +static inline const char *
> +vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
> +{
> +	return plane_cfg->name;
> +}
> +
>  /**
>   * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>   * @plane_cfg: Plane to attach
 
Sorry, only noticed this now --one tiny things: this helper is ten lines with an allocation, sitting in a header. coding-style keeps inline under~3 lines, so maybe vkms_config.c is a better home for it? :)
