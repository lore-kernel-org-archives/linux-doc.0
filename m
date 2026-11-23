Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437671;
	b=QyqdfApaIJw4eWWbsTcIq6Fpl5OQWmuTLIk/RoN3AFLBkhIjlB9rygAFCpk3jX18JK7E
	 ifMHuf/jixWZtLPTQfn8WwojHZ/Ph+FVIqJGrs1COIf10kb3B0ODHgSQkOvmyvniTvYYv
	 a+5VguvprAUoXZe9jpCn2JoOxqI8X4KleCHNonpZIIPmffA6Zc8z3+Bgu5rtS49UrEfdy
	 ukSeQNtyHSLbqt9VQb5A4AIkUnvSpuoSSHvPqwxnB5zhnY3N4fvCtLs03vz6SOHLvvwqo
	 K4wYNbPJ/graNuNPCD8jIjbxR9l3dRVXxsWsHoS0eHhiqlO45HycVHge81vJmSCh5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
	b=iYA91MVvdOuyMvm5scIzDH4yRMU54csl0zd5kpfe/yyNGal+pBIxi3UpBkzDZgAo/yDb
	 ddzDQiKwdqzUvaAV8TnYzG7mqwYbIv8G2YiBVAL5wpONnwNCNPKGSi6msXL6fUIgCT187
	 3YAXVo6qdFLlFnxWYaGDscbq12kRqOBX+nIakGHY84EF1NVVF4Ozk2363gAnCbdEnsLG6
	 OFCIVp+S4C2cZJFCLPbR1MsyVE6ZGhNGRQVlGz3CM8R0nHaV1B1iZE5+aR9lplvJAjQnW
	 MPnJmeFJnAEO5upInQ+49hgulJ3AsVhMlq4DxJGt4q3T3SsY+IHRkA5QNHtz2AOD+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="UwJvQ/zE";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8A7606A321
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 12:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C8A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UwJvQ/zE
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so40364335e9.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 04:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437669; x=1796042469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
        b=UwJvQ/zEJUosDi5F/d5/RBF5Tx5Bu0Cm4GZ1MRPVxDYjlPPgB/qghK99FcbQBXWX0J
         kVz/u7Xw9GE5yC0CMzetEoEip0gqmzNQ6NnGUikk6XNeP1x/yU9QhFSJ2MG5FTzD0cZT
         e/tq2Zepmoo8drkSqjt/xCXIqtK4u8/AiXcy8RPW1UStqDZfK7GnSSTOKXBF6qxiDovs
         ykzFmpg8pddldS1KhWXMaOE3pdu3jNcdyEPjvOqqUtAmPoB8RzS4+wIwEXNNlBWXBXIP
         rN3VGmkaY3eIp2EY0qPULcthluSoLQqhlM7BPXikjkuVRq0Y0V5QRvm2EaWZ82wPUvnT
         cHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437669; x=1796042469;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n3T4SwHjmz2olFUDLYwHC6yLLAFa2tC0UOBRI/f1adc=;
        b=2r83D4u+4P3cQ4DUPyKZz8kWEQeOeuP9GVjePleqXCBcHvuafYzG3u9qth60Pnd7rw
         fN7o59asDXqS/Vov8xICX9WN2gNvO7xQnkd+pfHa77T/KjhfVA98I+zbodxLvM6uwGkI
         2X6XTvoAKEo+pPj62sSV1SngYixVLkvpRzvh3q1oYKD+/DelDNAtK2xhiPXELvz+fE8q
         /NWxcoHNYyvmhlfq3F3RMzAG/htJOcNjg3myXd0wi1EZmiVsjAFVRIMlMLvcEAbpGUEM
         ah73vBK6iE2Pvj/1nsGAnbOJSGSdSJ4WJHanW61wGeptke+Is9LBw2N7hYdZE/4t6ZOl
         06SA==
X-Forwarded-Encrypted: i=1; AL+hErFLE3CKhCNFglLEMYA9GQObzLJ3tEP4Z2/K+rvp/0Bh+cuz9FGRYYxZN1hRkCsoQlDy/B8iZWGOuzM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vXQXy+x8YZt/Q7/PJgwtZl0UiY8/INESyn1NAb9m67ncPzXtT
	NOclkxfsZn6wUNf0XNSOhL7PPdHp6dyFhi+HiGvMg2Scd9rV4Lwe6Kqy
X-Gm-Gg: AZFdTZdCMyivnorHbs7IDTtTvlaTbDq3MS1ZEUYsRb88P4tl1kayVaU8lVeT2df08MY
	8DCpdceFOu/qIhjfDyNVBM8geu0KvmPBcpSZmdDLcVjXxga7fpHiUtkIxxLLGL5TBhxPBifnLoR
	g7gRaxkvdlPuuvqnspK02R9ZdFOYQZLiR7oonGwaWVOLTQxgCk9BFXtXnWxDsLNLbrIhAtmc/Ac
	RUuHRoeGujzjtJydsNYkK4I1NJK2nf3Y5MUrr1/BfNWDzYqFc1jn1jV0erNi63ov0/rDfAjzdXx
	ntK6o98/G5dgeeDpEzW5P9EhF1pabLOM9fsKrnpJHA7i4L6qRkHTBb+v8GG2PnlhbbbalwqlL58
	46Z3WR7L/ze2CPnr5PkNXcKlA3Hsp/H19gKnlI1GBitio9eS4kQhRiGiqtjXqFfr8osF7VogBEo
	8Byxwtc6yyh+7AVaI8QEBePHbWOGTqYLGqaXB3+hmXB9GgM/Vo5OJ3MpegKNiaHgJ3oYxI8qCh6
	fjk3L3aeRFCoEKwrjJRrPtAbH20/SgLRY746GL5LNBQqUJZzYknAX8bPgeh0UD5wEYye/T/zra9
	hGuio1KClL+dV3nKDpxw3DaLbUd9iNf7AQ==
X-Received: by 2002:a05:600c:3b84:b0:4bb:6f45:2a6d with SMTP id 5b1f17b1804b1-4bb888074bbmr277880715e9.12.1795437669058;
        Mon, 23 Nov 2026 04:41:09 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm269127865e9.2.2026.11.23.04.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:41:08 -0800 (PST)
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
Subject: Re: [PATCH v6 14/43] drm/vkms: Add error handling in plane config creation
Date: Mon, 23 Nov 2026 12:40:53 +0000
Message-ID: <awQzMoSQfHO47QgQ@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-14-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-14-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:56PM +0100, Louis Chauvet wrote:
> Properly route the error path of vkms_config_create_plane() through a
> fail label to simplify future work.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 12 +++++++++---
>  drivers/gpu/drm/vkms/vkms_config.h |  2 +-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 50cde689f482..03f2d0f0e327 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -424,13 +424,16 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device)
>  			      ARRAY_SIZE(vkms_config_debugfs_list));
>  }
>  
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config)
>  {
>  	struct vkms_config_plane *plane_cfg;
> +	int ret;
>  
>  	plane_cfg = kzalloc_obj(*plane_cfg);
> -	if (!plane_cfg)
> -		return ERR_PTR(-ENOMEM);
> +	if (!plane_cfg) {
> +		ret = -ENOMEM;
> +		goto fail;
> +	}
>  
>  	plane_cfg->config = config;
>  	plane_cfg->default_pipeline = false;
> @@ -440,6 +443,9 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>  	list_add_tail(&plane_cfg->link, &config->planes);
>  
>  	return plane_cfg;
> +
> +fail:
> +	return ERR_PTR(ret);
>  }
>  EXPORT_SYMBOL_IF_KUNIT(vkms_config_create_plane);
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index de6a89819daf..49510a0957c7 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -288,7 +288,7 @@ void vkms_config_register_debugfs(struct vkms_device *vkms_device);
>   * The new plane configuration or an error. Call vkms_config_destroy_plane() to
>   * free the returned plane configuration.
>   */
> -struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config);
> +struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_config *config);
>  
>  /**
>   * vkms_config_destroy_plane() - Remove and free a plane configuration
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
