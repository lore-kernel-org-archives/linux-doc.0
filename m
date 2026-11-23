Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438994;
	b=rUe0jKPw6P0adTq/ffnqQCBGnUQVkxbqSxlSQZ2bvZhcZLS4b3Yd7lrnt08dsv+sZZWQ
	 4KDWdv2rpGpuZ9zE0sDT9xjVzI7WfCsie8GXI0nKNBZ2jI1EEtD1GxCTKG45TrhWdk6hO
	 MMx+TUzQqVDtH0VXsciMyL6ieN6xwwqIY5kYJrWUra2S+FM+/l3SIK3E5O4XayxKwQIZ/
	 iMSCfD4LkP86udTkybGfavUuMeHG/S6s+qDD+zUE0HnPdr/ku+hr0uxJMjC0eOvw3nP27
	 x++okCOoJA7nMOrsaL1mnRiUZ2lhehpEl5Vfq+nfA8symBRSXjaDANvZTdMa2ESGMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
	b=USapFw0K+J9EOaC22zvsQITPbyeGIZ7BU5pv4xvzZnJDxQpZutmx7rj/u6KJlD+lvrAX
	 dpLvgxyJNOkHY9/xeWhUsNalu+rRUOmp50V+m5rIDftKr9DhY8Qpdrur3iihzAth7LlRk
	 aq5maJL8bi5hTjDfNYh7hwV3Mk4AZrnyqjUnXYeXAvzF+yyEyyaPNDYlFLfIOh5Z2jA+W
	 4WXrMv9+jCDc2JOTaN3PWoFxUaSdfxDgXYtAB8oLgb9FKSNKvbzarD4PQPcpqedPu/M8L
	 MIS8vQTZdXIFiHsWnHpero+XwS+8r195XB/GMKk62y6Ngo7NZCwUnoQlxkppBrzgzaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWlVrON9;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD61606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD61606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWlVrON9
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491846221ffso2744838f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 05:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438993; x=1796043793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
        b=YWlVrON9qASERTwqASzXJ83ddjWryow6AmpWp02tR9s0vvwgZzRFsjj2BWosJ/tHe9
         5fY2OukDE+mdBKjofdUmWfqK27mTeUn3I0f3Md/1FdvjzTTUVb2eg3PF2xZeVKyUV1hx
         +FAY2LJQuX/NuaGHGDyFh9bkzzIS+yVLwcL7L4BflrdjKWY1yZ77fpkkcrzJNwrsLDZI
         RLUgFEoJRC1oCS5F1+2e553sqT6oAd34kKZNsEpJhP59EkrBTZnFapbh2YpkXHQ7vY0k
         bEY0BzmN+iaTNix3IgslNOOz/T19GmBm1nTHiKnV3vpRXfjIYjGV/RaPWTfzFqNSPdk7
         IuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438993; x=1796043793;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eMLemh30tOFWEd3J1uHpw9ECe4OgdCLjsL6KtAJT/rA=;
        b=vEC0fUTxmHS8FcSe4tdXiY3OuFu24Pesxy+bO466TGF3Gbus/EUlGQBy5qwmTovrca
         gAwNCyJeg9f04gkcoFdati6SfdhNxKdtq6yeVuo3zduAZnT3/ZwGEDzMeVgFKQ9ytD9e
         11Zv9PCJ24sZsI3sWkLZ0iLGKu8jbxjCjpL8dCxYbtfxU0rOYV3wz+bkn7dIdEPB5CC6
         3xs+iS+C88NfpJQehY3j4vGWvqziMZxP08SVwKpL7rq8/xC7XTb0W3+2O4hjYelwGIwb
         ZB6y+ZrD6e93lrqJ3cjcc0VOZxncYx+kIv+nSaVB2p8nfRAsNa93PspTaxLZ8PSdVlKp
         QwTQ==
X-Forwarded-Encrypted: i=1; AL+hErGlijAYLP3XMX+sI+AV8U2mHuPENiPmGufBqUKMkr7V8ekm88aa1lQLzn+CNlw3ebduqsV/4EU2HLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbcBU4539X45Qp3IwX2AXVAl4Xho6kBlaiaCodTcUsswcvZXM
	jEtzAm2B6ggAikK2Ju/YW6HQO13IcSiAzSGY6WwabY4g0L0bE/T69yEc
X-Gm-Gg: AZFdTZc4Iiqi92k7bb/QOyY2S95vuPae4inb/VH8W8552l9odaIwas/No2ZWA5vToDz
	h21gA8sH0Y3csRK6gk9E7grKLqD3e+425bTifVnZndjgPAbdJyxWKvIlpef6fOmMuo6QUBdCztS
	VyQEUgtJQgOCjKuqZkQJ/uIMkQBr/RlR+xN57eKdUemj/ASsaHf05eYr8X/UbIclUY8RtBcW0CY
	oHr+nyIjOwVTpqgCh/l6MTgOOFIzRLbxlbMwbptfllIeqJtD684BiM/h44a7n9WENyf/RhxQ07M
	3n/aF9tfnOx7u6rDVef/fvPOIv2mfym6hf/0T94yFL+rLRiiWLrwTBBg+4BMNiiYHzVDL8fm9XB
	kZdStBjdlZPP1Nh9K+Tt86MGWsYAXBUqp09ASLSbx4+dyrr5cyUh8gyEMELUTmhj8VWpgno09g/
	Rf5x1G3dXeKImgwhvIsZq4ecPcmAyXQ57Ob8x2eXoYkg6zPvRb6LANaRe/sZu04NdU0SeqrJ84y
	FYmGR0wja51u+P/cYw3Q0U6CpRipYntoMqQLQxEV86r/RQrSws+GZwcGrQP2gic3FuGry7FJ8Yj
	Vk9vjxE+g2jrSwGbE2YTIbpyYXA51gI6Wg==
X-Received: by 2002:a05:600c:a085:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4bb887ca0dfmr253189505e9.4.1795438992240;
        Mon, 23 Nov 2026 05:03:12 -0800 (PST)
Received: from ArchOarora ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm310848795e9.12.2026.11.23.05.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:03:11 -0800 (PST)
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
Subject: Re: [PATCH v6 15/43] drm/vkms: Simplify plane_release code
Date: Mon, 23 Nov 2026 13:02:55 +0000
Message-ID: <awQ5FMhggIVxJ4py@ArchOarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-15-78ace90f4fc1@bootlin.com>
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

On Fri, Nov 20, 2026 at 06:58:57PM +0100, Louis Chauvet wrote:
> plane_release  code used multiple intermediate variable, remove those in
> favor of direct access.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_configfs.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 5f5aa0a1812b..a7ddcfd4e86e 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -331,13 +331,9 @@ static struct configfs_attribute *plane_item_attrs[] = {
>  
>  static void plane_release(struct config_item *item)
>  {
> -	struct vkms_configfs_plane *plane;
> -	struct mutex *lock;
> -
> -	plane = plane_item_to_vkms_configfs_plane(item);
> -	lock = &plane->dev->config->lock;
> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>  
> -	scoped_guard(mutex, lock) {
> +	scoped_guard(mutex, &plane->dev->config->lock) {
>  		vkms_config_destroy_plane(plane->config);
>  		kfree(plane);
>  	}
> 
> -- 
> 2.56.0
>

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
