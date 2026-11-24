Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529539;
	b=1YLEKbDVoNazDo4sUlBGZG8XNTN6gAR+57ZjGO+x9hPJ/JnpnvogBL2RrG3jVWRPnTl9
	 BlgTsFeq3bh6cZxWXSkBcbOoxb99SV+Sdg7HTjXIUK8X3GCAtLJxgJmVf/UhchGHCXFWC
	 T79GmarlzI6DXGzOOGIFrerydL+xHp+2dUctuHx9ELhqGK1kNsfoWk/P5NZmWO/aku5LN
	 n8oVUy1+Yh5Ef0/GXcB3OwX6tKa2tQ2OdRTJUXZ5OFPtTcsEyfIvHLvaOixz56OKxg3VN
	 f6jk7wgP6EoYECDRS9dz9ViZ+Rt8Hgz/uJTLsCoZIV5AU2cTw5fOM9JEAYvovRDT3qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
	b=iDR/FEH2El0SneCm/G9Bpd7psfoMap2Pm7lQNRrpqCKbXMl9Pw32UIiIgI0e5t44kQDo
	 Rn473MmH8HPTaTPpqthMYIQTNrby7UlVLRQn3DUicTAHLeA76ECGWO24U5Td5gGTOFznX
	 Ko2c3PILNtdMj1oo/OvMDcMYmF5E+Vu2wA53q0KRn6OWOxuL227vY18+81ggdz7uybt1V
	 hw9TSSz1zJj8UUDQH11jvaTXyWhzSY31CfMwOAT2GfMnIvEUUteFs/z80gq8a9zf5A+Qk
	 3iRIIGqpp29Hew5YVeP9fJCdRlSUniOxfzKU4ltHnE1oaNrecpWe9NYOfNO/WCyvSmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mh9/B5NC";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848B7606A327
	for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 14:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 848B7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mh9/B5NC
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50aaad19fbso506509466b.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 06:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529537; x=1796134337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
        b=mh9/B5NCDd7FTPewAQdCKu+NtCWx4NkbGoNSdHUS2Xm+2zJ0DEKjDHQdgZUX6Ofdiu
         gzBrJPPDx/OdrrKxyNNg7xMQCLCYcTUkWJOFSj3tlGo5A72moyxiU7QuJONFcYhqEgJs
         mFMtXYgcu1+B1+BfXfTZAO3xIA+VvmcvYUYYKsqmlDHCUFgkGsQTumkFcyeamtKkB168
         1oCjphr/iEF03J8z5od7m+uEXFydUnK8qjOMFCZy2yKyOxG3kyqfApoFnyzM8wnSwRZS
         YT0q/19V0X6qV/pOWLv4gHP+DjWS3EJGE6rChvrymuiXSBQS6lnEahqyFrw6OfeIg1gS
         y+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529537; x=1796134337;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
        b=Mh4synYr99Q8+cA19ydqZsV1WCP2ODkXPb8Qp3pAioI1v0cCg2NZ2t4KXBcOx1KN0I
         Yblj/Qfs138p0sWF8UvLUqRuurF2dbDmVtTLqS5K2zx1NFLQqlROvlB2xTMCK5vJ3sFa
         ocuuyvvpCnVswcxiR6fXB9EmRP23z/mUqrxvxrgocZ0RpqjXXoLZWvp05di3APjBngu5
         kc41NVh1OF3BoTZmCI7Zp+/uK9b9onyABtO+Ae0UqCv2OKNCOvmuhdKanoVZMi3x+me8
         pazqEWb1Rw6vSay4P1gNsX3fU0cGoAKl0+rx7GwEEcMD8SXfABnyrvu4NQGNSJW9tqrF
         z6Zw==
X-Forwarded-Encrypted: i=1; AL+hErGva/sK6R6uo42VG9nghNHA96Tb0YltncrKM74dzfq7QYLjJQfpF2gV/0N+EeCIHnF45e72EvTssYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KoIAKsakSmwYYBg/5xwCQgQw59T4rm/4cgBCO70yCVOhQfsje
	cFE6WsoU3L6b1tj2gAGRX4yRZiuibtO4YgL+ycCsqGln525nafNNm8tx
X-Gm-Gg: AZFdTZce2wcQQ8tFQrJ1IIfH6KQmFk0MaAIHeIl8fwdi/kC5qQAPWyf1e3uLiFyeLGH
	9vGgiLJa1JwPQITph6go7JmEyvHMEVBxVzRxi6L1+PT4qQu3zaf7dFgII5VWQPHEXpjab1iUebP
	YQ5+bqWegcyM2XOl8T+Boxbxw1wXuU6LmQu4Z1KBK5r3tf62lPvoEAaRZNtPGMrfiTJSLP7HHyV
	WBXo5lti7QYghOb9DNuq6CFaDxwnO1xuLBz/hyoTV1cKbFzcPxgORU8T9M2sSHWA2vJq9Myrzyu
	yFLKIJ0TNqcLDovvV7H2LDmFPIh4jOipLz2e5q0dSrmA8TNZKgLgtZ8U7lZbkb9ARMCXwy+OF1q
	aHMoYSFRh4u/Wja0ELKTLYqmHvq9hbjYNB1FtJc0k9qxottOpRHbQgVJKSqz7JaaPnMeNWD/Cm/
	H6xCKJrZaYcL2JSUC1/ghm03nbKjGCjRrXdpehTpibbW1hXh+LEsp05tCVowFNiXMPw+XdRJutT
	taxlW64rQu+A3zMqSsCy8qpAhhWgMpgU83osLBRVF7yLKLJ/jBa8UTq4SXco6d8ZJnEkSbQ2mYk
	ak6VqKkuX01C8JQX5RKd822c/yDkS+8=
X-Received: by 2002:a17:906:26cd:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c513a5db1d6mr934692166b.10.1795529536866;
        Tue, 24 Nov 2026 06:12:16 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm520054266b.35.2026.11.24.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:16 -0800 (PST)
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
Subject: Re: [PATCH v6 10/43] drm/drm_atomic_state_helper: Properly load default value for rotation
Date: Tue, 24 Nov 2026 15:11:59 +0100
Message-ID: <awWbIh471dkjKGII@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:52PM +0100, Louis Chauvet wrote:
> Currently, the default rotation is always DRM_MODE_ROTATE_0 for all planes.
> Some planes may have a rotation property, and the property may specify a
> different default value and supported values.
> 
> This is not an issue for "fixed" configurations, but with the introduction
> of VKMS configuration, some plane may only support 90° and 180°
> rotations, so the reset state of the plane was wrong (forced to 0°).
> 
> Fixes: ab2dd990f4ab ("drm: Add __drm_atomic_helper_crtc_state_reset() & co.")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 267f44330629..13e848abb33c 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_mode_object.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> @@ -231,6 +232,11 @@ void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
>  
>  	plane_state->plane = plane;
>  	plane_state->rotation = DRM_MODE_ROTATE_0;
> +	if (plane->rotation_property &&
> +	    !drm_object_property_get_default_value(&plane->base,
> +						   plane->rotation_property,
> +						   &val))
> +		plane_state->rotation = val;
>  
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
