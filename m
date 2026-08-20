Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571713DA7D7
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245839; cv=none; b=CB+g3Yx/+9iXfym42GEn6W4ap6tsKy5qKSIeuZA3npW7nS/zAqyNWO7FygDy8BJKN8kYmjkaSpypToPDLhiX4otSwtxf60dckYLdAfshuyOdZl50SF/kojdVwXm7iMM6AG4JudYcHLtDPIxhsaaI7zFSJPgyLe92RZnnLNYcOKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245839; c=relaxed/simple;
	bh=jnaTZjotwBm1xZ9HP6h3dDXEkOJupBhQaF95iCJctKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMIs2bxAehqZ2dHUxDD8bv/wc1tsXDu2AmYnRKqAzrGuPy3+ptamqoW8lmoaKwNQ8ZqLcBpWQTyR5rM9+LVWrQS+MV9M0g6VGwa4MeEFEfwY/N8Se3uMxC7SgpRMDSAjXG7ogJ4DOY25WTIfxmQ5kYODGIrjCI4V0NGy/CV3FZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SyUs9T3r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YRwfUuaW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SyUs9T3r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YRwfUuaW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
	b=SyUs9T3rxjkBcikuWg70F+upFG7lVJLDaDapAVeO5kYleGO2mHGmlI1rRzuUsl2EygWdvv
	lgq14PgDKjXFV7bXZN91GxFOa6kNYXB6kN2JO2K/pf8RXi3RABfVNXK1N7UrPU2TcbTfGz
	T+v9D7Q84VgttWJfrg8Tz6xd1+RM/NM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-oWMQ52N1Oa2rSebdV68gTw-1; Thu, 20 Aug 2026 13:10:25 -0400
X-MC-Unique: oWMQ52N1Oa2rSebdV68gTw-1
X-Mimecast-MFC-AGG-ID: oWMQ52N1Oa2rSebdV68gTw_1787245824
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4954a93c565so271755e9.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245824; x=1787850624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
        b=YRwfUuaWUO/q0wEaPo/Xvgx/qN3eWzJhChFieUKhzmGnspZmZxgrQuFwd7RBDAz29H
         +s6F91I6XSdOjh34EcTFC49ZiJtO5L29sK01l9TWMvbyIpsS8pCmQDc1uSrOC6ety73j
         0Vo6lweAiCjHtgEly1yYZIV9RTXITE02bQl020Io15Wh00K1ScyJroZ+iNu+vmVCOaCH
         q2NRQnYadkFZZvoPLYpSUTDT2TA9F2mhLWIXFJckR9iLKqx5p+saUXVWMAyUGvC0AnGn
         KCOMyZKrthSpZPoaaIW615OuyzIcjjqpLmTUtw0xG/F2jJ0ENHmiq8s2tc65SJfIkD7U
         gXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245824; x=1787850624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RFOFNhe8dD42ULPXJPC0m4cGSa+x0bKLYsWhLafPUQ=;
        b=nqd9a/WFaLve4MTcuX+xOlFl5MDl4F5/qGp5/qOQOyUM3ZOfhizDg7ay1cChTyzTJy
         jTi24LbJt1GfUi2H68H4s2gLfhvOO1srwaEM3XpkuIZ5xL7O4fRvTk11/Xpyb74GCJQc
         ahKOdeaZBGjMecCxkfJZulufXt7pZS/V8ES0F+PwM+Kfwk8rUI9I4pldS7DTXE348/IY
         PEhMt+tEt8gEIRsJe/sKjpE97iBFH6hwFCUAqs0eVxJ94MBoyBDqmc787mM8Zr+UmhLE
         zO76F3K2uJ6f49cza7h8e/UCfTDAtotlE+sS2ePxpZBGu6xFu5cvU8yPdj3KMMj3hosf
         HklQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEXmVAbChljJ0X11tlJR1jdtcxNSVX6D6sTA9ixp07KBZ9kBDX34+Ks8Rp74y9VUyBNK8SlZuXahw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyczNwbeI5Knlx823oSpkpey+d/0o9rErtaPQ/Z7Zi6DPOZvtyx
	YUxniW0sqfi0Ehq58nqzCMhyaM/Sm6ot3gCJBxH8ZTQ0BquzsA0E0f5oD2PYA89KagZnJvXEnLN
	qs02OEF4CKqKn+ZYBGgbDcej6w5X2TKMNXd9xZG4fQW8dDwZoV0ptCMOCN8sDQQ==
X-Gm-Gg: AR+sD12Qg9JekB7HzN6LMdwgW7+YopRBvmM1acWi5WOah2suzY41ho2IERmbkwg+2gx
	LmivCiq6ytEHAFk4c5VYE7oGt+5YyhZ/TpIZwWiV1AG6JMhWiAVbY0cehtKb13SocGbkGw28sh3
	KjrfUbDvEtKGl4xaUuYW6MoPPc72pgeTNJGB5b8v9/8bl6AELCuakcK5hBOO1wCbSzhc9TU/VDa
	1xDmle0XQpno9qG6uPYGGIWD7OfIUzvGxD1P8ZsBrjEZf7mO2G1yBLaG8qhcbZQC760wsFoGU8G
	Kr8AECUgKzjjHbPhnECIcetB3AXB+yksZ0aFquovrleFjd1YKgIs4b14N8aInpgGZLZTQmVFCAs
	VFkVZdnEF5BdIdcCvxj3Y/MP8MeZpgRZRTI0AWFluElRWYg==
X-Received: by 2002:a05:600c:4744:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-499b831c0b1mr6516225e9.15.1787245824362;
        Thu, 20 Aug 2026 10:10:24 -0700 (PDT)
X-Received: by 2002:a05:600c:4744:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-499b831c0b1mr6515045e9.15.1787245823921;
        Thu, 20 Aug 2026 10:10:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e805a4sm169531595e9.4.2026.08.20.10.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:10:23 -0700 (PDT)
Message-ID: <deba971f-7f8b-4c91-86c5-e3cf0e3c4bdd@redhat.com>
Date: Thu, 20 Aug 2026 19:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/panic: Pass global module parameters to
 drm_panic_dispatch()
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
References: <20260818125012.468092-1-tzimmermann@suse.de>
 <20260818125012.468092-7-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-7-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Set the panic type and QR version in draw_panic_plane() as a single
> point of truth. Pass the values into the individual drawing functions.
> 
> In the test case, always create a QR code with version 40 (i.e., the
> highest supported version).

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 39 ++++++++++++++++----------
>   drivers/gpu/drm/tests/drm_panic_test.c |  2 +-
>   2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ede620b27515..12c39217cbcb 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -657,7 +657,7 @@ static void drm_panic_qr_exit(void)
>   	stream.workspace = NULL;
>   }
>   
> -static int drm_panic_get_qr_code_url(u8 **qr_image)
> +static int drm_panic_get_qr_code_url(u8 **qr_image, unsigned int qr_version)
>   {
>   	struct kmsg_dump_iter iter;
>   	char url[256];
> @@ -672,7 +672,7 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   		return -EINVAL;
>   	url_len = ret;
>   
> -	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
> +	max_qr_data_size = drm_panic_qr_max_data_size(qr_version, url_len);
>   	max_kmsg_size = min(MAX_ZLIB_RATIO * max_qr_data_size, sizeof(qrbuf1));
>   
>   	/* get kmsg to buffer 1 */
> @@ -718,11 +718,11 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
>   				     qrbuf1, sizeof(qrbuf1));
>   }
>   
> -static int drm_panic_get_qr_code_raw(u8 **qr_image)
> +static int drm_panic_get_qr_code_raw(u8 **qr_image, unsigned int qr_version)
>   {
>   	struct kmsg_dump_iter iter;
>   	size_t kmsg_len;
> -	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(panic_qr_version, 0),
> +	size_t max_kmsg_size = min(drm_panic_qr_max_data_size(qr_version, 0),
>   				   sizeof(qrbuf1));
>   
>   	kmsg_dump_rewind(&iter);
> @@ -735,19 +735,20 @@ static int drm_panic_get_qr_code_raw(u8 **qr_image)
>   				     qrbuf2, sizeof(qrbuf2));
>   }
>   
> -static int drm_panic_get_qr_code(u8 **qr_image)
> +static int drm_panic_get_qr_code(u8 **qr_image, unsigned int qr_version)
>   {
>   	if (strlen(CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL) > 0)
> -		return drm_panic_get_qr_code_url(qr_image);
> +		return drm_panic_get_qr_code_url(qr_image, qr_version);
>   	else
> -		return drm_panic_get_qr_code_raw(qr_image);
> +		return drm_panic_get_qr_code_raw(qr_image, qr_version);
>   }
>   
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
>   static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> -				      u32 fg_color, u32 bg_color)
> +				      u32 fg_color, u32 bg_color,
> +				      unsigned int qr_version)
>   {
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
> @@ -774,7 +775,7 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   
>   	max_qr_size = min(3 * sb->width / 4, 3 * sb->height / 4);
>   
> -	qr_width = drm_panic_get_qr_code(&qr_image);
> +	qr_width = drm_panic_get_qr_code(&qr_image, qr_version);
>   	if (qr_width <= 0)
>   		return -ENOSPC;
>   
> @@ -816,9 +817,11 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
>   	return 0;
>   }
>   
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				     u32 fg_color, u32 bg_color,
> +				     unsigned int qr_version)
>   {
> -	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color))
> +	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version))
>   		draw_panic_screen_user(sb, fg_color, bg_color);
>   	return 0;
>   }
> @@ -891,17 +894,18 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static int draw_panic_dispatch(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb, enum drm_panic_type panic_type,
> +			       u32 fg_color, u32 bg_color, unsigned int qr_version)
>   {
>   	int ret;
>   
> -	switch (drm_panic_type) {
> +	switch (panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
>   		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color);
> +		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color, qr_version);
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:
> @@ -951,6 +955,11 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   #else
>   	u32 bg_color = 0x00000000;
>   #endif
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +	unsigned int qr_version = panic_qr_version;
> +#else
> +	unsigned int qr_version = 0;
> +#endif
>   
>   	if (!drm_panic_trylock(plane->dev, flags))
>   		return;
> @@ -966,7 +975,7 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	ret = draw_panic_dispatch(&sb, fg_color, bg_color);
> +	ret = draw_panic_dispatch(&sb, drm_panic_type, fg_color, bg_color, qr_version);
>   	if (!ret) {
>   		/*
>   		 * Only flush if we have a panic screen to display. Otherwise
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index 969a096ec840..196496238d23 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -58,7 +58,7 @@ static int draw_panic_screen_kmsg_default(struct drm_scanout_buffer *sb)
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   static int draw_panic_screen_qr_code_default(struct drm_scanout_buffer *sb)
>   {
> -	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000);
> +	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000, 40);
>   }
>   #endif
>   

