Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449509;
	b=sWOY3GXeZJrstF7huaHK41dR2Qj2oldrXr3jNUVYdleX0RvgzzAD2aHrA8N3TBDKB9Bk
	 M992teyn0DoJmjSS4ATazyoZRYMsruKJHmKZhawbYEMlfXMmovfOz1m1+q9sAk1LIDCaL
	 eh37LCGn1GFRHI/n3SC5BoZlBuT9BeZcsYiTmSZY3wFyZc4j+fiRpqT+f2tkvhcu5VvkO
	 Qq/LqxiU3FiKf8PgRG5oNW0kGtQWG77GmCXwBZL0VusepnzXa5xsPVA8EL2JtYpJeescU
	 YOEz/qmDCB22RCON+74YiMExbdYxbKwzyHVktLjRoQNAEd7172LhC+u0htHtyfG1gCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
	b=3fA6HpFtavuY2hlyWLPkHUeRj4O0rU0kXG9uK6tIcN3+iHruu8RBBjixitHdDR7wbVf+
	 xzOIbbE7JeosAs7AKkRwQk2oGyWxP36eu1FB6gAEeXX345KenCTZvDBB6Ihj5phbZKvqy
	 6V81KKzXF5f+QyAqRZ4umgZJOGuwyhSNVpunm6VS82Cs+PNmKM+x1ybxJZzOdLP24wvED
	 iHjRm8CEquW9+in2GHL4TY4oz1dP1fyI6qnXp9iIv1SGiR0W1aJ9pVGvGLgABSGF+JWKm
	 KntdoLoIhI6sn7iRTD1sErIoa3s5ib7caWckQ2/i+f9isj4jgOlWGf22pvJ53x/xRBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPuJJBV4;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F05606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F05606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pPuJJBV4
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so32492215e9.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449507; x=1796054307; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
        b=pPuJJBV4k/NV/FpE0NEfi1sotg07S8b9f7yRjPUrhGmBoAdCgkPc4gwu6ZY5sDWQMX
         OSy0AlaIMQecASC1Vv5ECirBLzUED3rPJbs2Td9gKDnQGdZvJPcmVz+2oI8raDLi7+C+
         Xa1Hf5TVycK5LRLk8OmYWg3LtEZGFAHAe7Ns2JjUPmcKIzn4poXfMJ1raZrMoD7j0X9B
         WjzX431T6IOP6LLO0fkU2Ozev48DKYrJwzIobPriLpGN81Y4gJ1m0JAtasQI/mFTyQMd
         Mx+g4A+8diYSFif60jfVnE2FVdxFuPZKQVCQre0vWJJj9c4RzNmkIC41Hw/6Vir6KKN0
         Zpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449507; x=1796054307;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E7V1Mp8qcb2Pgn8vLfudKigHDe8jvtrjrih2NQ7mefs=;
        b=p5ALPJfwsRHSZjis2d+z40O/0nZP/9n2Xrb6SMYoq6PC+MYWeKrlDIBz1p9zBbxqu6
         rWnGVfns6BCJwG1TvozvK8CnnNmaKobx7lC0dPEvftcTi1ps/W96KIMGYO2pkGyySh3v
         HcoutK1iKyXIg6S8eWkje44bpfj7pNV5w3skFtWyLGAnjkG4f5Lh4CE0BIQAs83ld8W5
         0t963jdnyjprc9p8PaQ1ZaLthKdNC6gnBoj7dBV1bfevcHtWGckUeg6SWO6nZKGtTy52
         hjA4JpIiB3NTIT9qhpsa7DWrOIIOmFi1uiqBJoEygWlMM7D3Vw+Cr9KuMqlm/FkQXS+I
         v5Bg==
X-Forwarded-Encrypted: i=1; AL+hErHbJM1+7fdU7/303pzos7GefOohnGeBm2fwlPHK6IGfd7Bx3iUV1ubiP2sgNG+RANEXEbqhKBoC8Po=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o6PxW/DxFJw6YHey95XZV0yqI8rac9n0Qs8l4yeeAeMnHRzNF
	rBlSTQsJ/43w/Q0oSTINxgpxypWcyzJ8qdVxW8QBnOOoI8ri5qvArqPM
X-Gm-Gg: AZFdTZdmmX/qDl9on6LMybcAfxhM0qi7GZ+KV3s9qEFXRlhJfMlabqh9jFcwkhBd32+
	bU/k6+MX/1b5+0piAQh4JkF3asUP71uBxVNW3fBwxaRHv9wsUUGeaPdpJWIIR0jwmxeb/zWKrmK
	FDZjep1mqfqrx0sENdtTWm7u44l6INbssoTvt2APBk2w41aPd0F84YuDsUCV58T4o6RpOFYZegD
	JLABai03mmjhs0TW50JodKsNvKrNJeLiys8f0i3F22NMEaiD+Yyj17Ve0UkMlqPk2GP8G7/vdZK
	y9gXhF5XPOty0xF3sDGRckz0XM2i6uwbF/RipditQtE44j663lWRFAFFUX7Bn0DFyxUFjgyugdp
	EfDgVE5PwiI17ENI1nG6iOsCcSzVNDUZsgxWkCC4fDxHcM+y8OiIgklXYlGHETtxER1nSJvvd3x
	8kCy7HHxW4xW+xOvWGOKU+qlyqnZV7JJFKiSAD9VYSGN3xuqWqmr5CU4NyCcc71ArVDp4Vq6n3n
	HGaFZX43MF3s3ECT8y4lqRHsyGujx0uy8TJBIpldvZ9ix7FLA1KnnNLyAdlSzJIsr5tkAMfCYPa
	qDHZ/ZH6SRat1Lk/i08VubyWzCb8bFLuYdvg0ilk3/4H3ULmziBjHy8=
X-Received: by 2002:a05:600c:5307:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4bb888283d8mr232622925e9.17.1795449507258;
        Mon, 23 Nov 2026 07:58:27 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm175808205e9.2.2026.11.23.07.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:58:26 -0800 (PST)
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
Subject: Re: [PATCH v6 34/43] drm/vkms: Rename vkms_connector_init to vkms_connector_init_static
Date: Mon, 23 Nov 2026 16:58:05 +0100
Message-ID: <awRiOQv8H-nI8bpq@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-34-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:59:16PM +0100, Louis Chauvet wrote:
> With the introduction of dynamic connectors we will have two way of
> initializing a VKMS connector. Rename the current function to clarify
> the case.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_connector.c | 5 ++---
>  drivers/gpu/drm/vkms/vkms_connector.h | 6 +++---
>  drivers/gpu/drm/vkms/vkms_output.c    | 2 +-
>  3 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index f5e99e77e84f..64d79b778551 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -75,9 +75,8 @@ static void vkms_connector_static_cfg_release(struct drm_device *dev, void *res)
>  	vkms_config_connector_put(connector->cfg);
>  }
>  
> -
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> -					   struct vkms_config_connector *connector_cfg)
> +struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
> +						  struct vkms_config_connector *connector_cfg)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	struct vkms_connector *connector;
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index 89d7f3a15d6e..61a8dd55d7f7 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -23,15 +23,15 @@ struct vkms_connector {
>  };
>  
>  /**
> - * vkms_connector_init() - Initialize a connector
> + * vkms_connector_init_static() - Initialize a connector
>   * @vkmsdev: VKMS device containing the connector
>   * @connector_cfg: Connector's configuration
>   *
>   * Returns:
>   * The connector or an error on failure.
>   */
> -struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
> -					   struct vkms_config_connector *connector_cfg);
> +struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
> +						  struct vkms_config_connector *connector_cfg);
>  
>  /**
>   * vkms_trigger_connector_hotplug() - Update the device's connectors status
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 7783a2f6d343..2b0f7a8a80b5 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -97,7 +97,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		struct vkms_config_encoder *possible_encoder;
>  		unsigned long idx = 0;
>  
> -		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
> +		connector_cfg->connector = vkms_connector_init_static(vkmsdev, connector_cfg);
>  		if (IS_ERR(connector_cfg->connector)) {
>  			DRM_ERROR("Failed to init connector\n");
>  			return PTR_ERR(connector_cfg->connector);
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
