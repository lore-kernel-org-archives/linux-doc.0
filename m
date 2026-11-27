Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779660;
	b=jJ+7DsvhWcEBZ55+6a3ObVHwkCdVztY2weJ//PFWm8z7DaR9tt5thXfbrEWoKneUkv7q
	 niJfvGmYt/E+1BXqzG7es/G5StNPXNJUAqOXH4Ph/rAiCUb03cYi4nLD/rPrt2EOHZatw
	 AmgGsGA2s1SsCxgJ39HCFXN2gTvJZhmX7Mt7Tls+LceqNETGo1oPri8PCJIxIR/R+g+cS
	 Km8crPUKknyy3HfYPsBhwjlcK8PMpGgnBY9zpLFPKBt5ExykDj+cfAdZPSc+BrykBHb1/
	 XcpERdxajni+DqR/ECLhbzfACrvdPxdeuyTjtoHN0WSRPKCRJP9Wvn2s4XbS5ofSddw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
	b=llDjveASlnzFdXYr03jcKa1YAZpXi7JI7lggysKImZsYc9jGT3c19Tw0likLu+iQKxYO
	 TPYI6mbjzYwTfsNVBhW4pbadB8mi1RHdKTwNIZT/8Hr7RjyScoR8QDtxZjTXMlc9x843m
	 SzUhy2HwU9xezQGaChnVFBMlCigrSYPWmOLCsuN4zhuj01vObSB3Nl51Zmc2sefLluqgP
	 b3Hco0b2cAc0FZcmr+WrfwQA6Bi1vjQ0445QB7qEaPtv35ivuH06geiYVpczd5z2fVw4a
	 Vs9bQadd0Q+eoh2yCw3GTjb/Q6vatR3jHCVwsr3AcaPSLM94fZhJZ8zL3/obarTeZHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76lUYV0;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4F606A31F
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 11:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20A4F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w76lUYV0
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so72980405e9.1
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 03:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779658; x=1796384458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
        b=w76lUYV0D4/fpgQ7lJjXlr1jys2WZNl7dtEN7kZpf8x4waPSVDQ3xCU59ShzGHLJ7J
         DxaGd++kmDwn8bekrJkp8EGtNzSf0iu/BM/12/DEsZuTHrgEpnDuAHF69Eba9IT3G0lh
         I8GWsI0fbWH1QmLitKTQhBfdTR6eQPxbBtamuVRZNZMmNHHuIj2pd4V7NMESw0KtS9U4
         /UN+jHiZIa2Ui60zEKxQoxqwwmTVGEqIKViOB84s/65Ay1jkEW1PQLFC4LkujB2V1kEM
         XtTSfDEqU6LeaY/od/qoBE8wpVWsstt5voftAXO8BcW/s9OmTDJ9DxqdIiFLhQWIqfmi
         Cdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779658; x=1796384458;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bp/KRA36N8EH7qPrylVQjtX79x1i14QeIGDoVR7yhis=;
        b=NQD5d1HrYAc7xCMsw0+7+ziJRyM3lMoF/Awpaa++znq5e0Uo+KhTwSPnWZykjfPRdI
         clMuo6VOCOGU7G4W+PewLWHsr+4SvmD1JhBhombadVTHfIrd9ReKJFCOwqRrLvxfxdZI
         EAbD28nFXeUNxhAaqQgekTLDncpSxvY3ewQ5NkEwW1bbqWJZjhS8wSx+dVVzK/9SVR+O
         14HU5pa/p3V9KkK1ajbsZuX+bI0MJyRO1Khkd4GR8qa4vHS/R6m9OIz9aYiM7osOVkxD
         wN9fYcmDKsUcBMwb0eTFz1/igLRV9u6trbW2rXQMy1dVVF1uwGUZy4kFT2FkISmT5ALP
         gU2g==
X-Forwarded-Encrypted: i=1; AL+hErH2AypEoMCFzuAFP4mdMB2g7L+75w6m7A22IXzYA8lgwOCBLvwmQKrjryME39PgU0qMCLVorcqzwIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UywuKtMWniXmVkv/fhmEHu9CHxJeMXwuTQHkDpR9tnGH2TPzU
	Yel2VsZSfu0ah40Wh1fCicRmlQ+16ZEbMXRZjdfp7qz0YQP8YoF2ReLr
X-Gm-Gg: AZFdTZfc25D4MYitfLvX6/eJQt5B7AYvCCooxiCEcikp/OgP84xiRVJ0HYs1rgoq7Ne
	3emhgIoMYTgT6Jc/T4lfT9BOoUAaGiy4VG5eb2BeBxc+yGMQZGfpXyQgQG1tRoS99E4s0SsK1cI
	vqv8HSVAGwxFqFjQtdfLPduksH27/uCOnjfCnNHt8LXQ/RxkVoW69e6tNoeApLcmVRUlPwSfOAk
	BUtdzJUOFcIJYwX0U82kmXjHxFcKgTXBCUJzWuBTEdaFWmGcJK/gsQBJCldeg3eqm4ReMOWZBtJ
	C8V7YYb50mVc5XSum02xglgNRRJLyVByiKNY3hRGFk82Q/2I9dUkUmcqe7XaH1xwtK1P7WKKgyo
	YCnvAOSPz2AMFcDDl0wkMDAtYvWwHp6qZ8qLwAemj7/KLSDeEbOgeHNqxvA2+N8gpr+sMEoOzkt
	/bznvAOKQp6NdLwhkXo07el97P/Zl0taVbGIlgcZ+okG1a5C2O4r90r/P5844Zs/qBGGvrL/ZNB
	cGS802gO7NOenksyJQV6ILBqigWq9D28LVbz3Ju325Zo5Sfu9tz0xNnZA9yrnKK1PMPXb2cF4jX
	HwBI7heYYB8t4ln30yzKcodievhLfRI=
X-Received: by 2002:a05:600c:5246:b0:4bb:6de4:2f7c with SMTP id 5b1f17b1804b1-4bb8881c5bdmr504767125e9.20.1795779658410;
        Fri, 27 Nov 2026 03:40:58 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm47752163f8f.3.2026.11.27.03.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:40:57 -0800 (PST)
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
Subject: Re: [PATCH v7 18/43] drm/vkms: Use plane folder name as plane name
Date: Fri, 27 Nov 2026 12:40:44 +0100
Message-ID: <awlsJLmNiJhyZH6Y@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com> <20261126-vkms-all-config-v7-18-21194cda2468@bootlin.com>
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

On Thu, Nov 26, 2026 at 12:29:01PM +0100, Louis Chauvet wrote:
> The plane name is now directly derived from the configfs folder
> name. When a plane directory is created under
> /config/vkms/<device>/planes/, the folder name is used as the
> plane name via vkms_config_plane_set_name.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms | 3 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 7 +++++++
>  2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 26e7f81b5b7d..55e4183046ec 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -98,7 +98,8 @@ Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
>  Description:
>  	This group contains attributes corresponding to the
> -	plane <plane> of the VKMS device <device>.
> +	plane <plane> of the VKMS device <device>. The name of
> +	the directory becomes the name of the DRM plane.
>  
>  What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
>  Date:		Nov 2025
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index c57791df72cb..bbfc0c8a922c 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -375,6 +375,13 @@ static struct config_group *make_plane_group(struct config_group *group,
>  			return ERR_PTR(ret);
>  		}
>  
> +		ret = vkms_config_plane_set_name(plane->config, name, strlen(name));
> +		if (ret) {
> +			vkms_config_destroy_plane(plane->config);
> +			kfree(plane);
> +			return ERR_PTR(ret);
> +		}
> +
>  		config_group_init_type_name(&plane->group, name, &plane_item_type);
>  
>  		config_group_init_type_name(&plane->possible_crtcs_group,
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
