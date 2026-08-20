Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1747DD4B
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787245695; cv=none; b=m22K6zoebeDNgpoDrgoPhT6uaxhL2nRgFrPRacrCywkKcr7wOtRWifqFPd51Bx9OwN2TEnNVu3z+QRLrCO+LK/+R9DZenMku9mA0ERjAJcrNPFI8Uv8dtP//t3+6mibdJf6xo+tpU0HVHHsndbj579OOIT4edlEUCBOF+9wGwIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787245695; c=relaxed/simple;
	bh=UBLd1IGoN3hKD6kq+J9btXca7d2xcuTE0qYOvjMrqko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IqgCcj3JENHU5mKkA4Om4FvQPTqa+ZmPxy7gTfqJToqS0jKacPNBF/Pjc+vf17b8nop0w9CRy8O08S+2xAQWmyOfCRQxtw/t/1pWp2FbEacQMqFwTDNBn01KoeUs6dpGI0izB0hFr8Nh6XpeNIUcvWfFONCka3h20BXm3XeqjXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtM0B5W4; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ola2xbk2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtM0B5W4";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ola2xbk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787245692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uLiaqJfdZPiVkLiAyQhGsqALdMhxud7zy/2Rp0UqKa4=;
	b=WtM0B5W42uyi3iTNdKRggHpyFN9bJSXYn83++OAaoXBlDnKsi9uxP5dM/a71BM869H8cfT
	R0NSVQgDmQ1q36BeX2l9taKK4Ysn6SLWBiYryIY/y8RzHlH57HJCpLHn8dQS2yyhF17rWi
	heJUW7Y9XdQ2OWu1jbD/VDz5l2/4F7U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-Knwve8tIN6yPfXZv4XOTkg-1; Thu, 20 Aug 2026 13:08:10 -0400
X-MC-Unique: Knwve8tIN6yPfXZv4XOTkg-1
X-Mimecast-MFC-AGG-ID: Knwve8tIN6yPfXZv4XOTkg_1787245689
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493bfc3b84aso231505e9.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787245689; x=1787850489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLiaqJfdZPiVkLiAyQhGsqALdMhxud7zy/2Rp0UqKa4=;
        b=Ola2xbk2Z6LfcmNzQUQJP4lbfmJ9GeKTr3IBkyNIRscq1L8eWXApSE5zB7Bap7ClK/
         hE5skfKi5gCnr5p+Aauk6HHEIGIrphywqfdLGKNyGrg1dCE0CyUqFUx2pgEPDXK8ZFS+
         3gnDLWbOgllt5i4wUH3RWBpKSYkY0cgbZ9N6stkFzSObrWwKc1iz0XprvgRih4gRNgk2
         kIk5HyDdJ/joPuD5SA580Jc3Q4koT26HG4ZF/+FBbH+hcIUkiI0UGIeH7J2o+zrRwVtW
         ijogLcMvJwwt0iBjcY5L0Yj+5n02Si1Owyt6J3GQ2AyoUfG/D87rbrOWCuzLpfQUkRJB
         jnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787245689; x=1787850489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLiaqJfdZPiVkLiAyQhGsqALdMhxud7zy/2Rp0UqKa4=;
        b=rBk9Wt7Ty3fUtR5+TYaXxVDuLt1V+HYsxh4QwP+H8S5lCnEKq26KI7tfMWlr0+fswL
         vyzXSUGtoP129r/tT6dEiAYFPYZVlaKlnEZJHEVPgLIQQIvvmzGb96jvhE4JP/YNZkuc
         Zlg4ldDy2mMXVu8A2pV51SvqeBz14LTbLBQFTvjBKJc3RU2BkDELT5/VPeQ8NpVwVMcQ
         cl52WbLU+ULwH3YdVdBifOGv3cMcCuFO/FJvWEe7yA4t2ppO4pBx9/xHgbTbAQgYiNA3
         CUQSiXwqDwchqroIDSfinKL4AWDPzX68pMSF8mYGE3B8EwUk1huJ7CYnrDiQiOWsi0m9
         9Rtg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6CHbbl1anNfycIk+Bc4RqGsDtAAnOWEzBwwBsi0IuTO/H0rHuTW1s1dyGTUEL/EStPlFqTXynIMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIw5HXHwA8ELLHzZAXtQ6fTwIsBbhijdez8Jz/TnaJSSV9ernH
	0meBFtzQs4H6hDD7zqbES+rEG/L3TkMtp8w5oOckf+w50aPjvEdcTe7wJFjlksOEHXyxQkPTY04
	ali8xs4KREd9P3AYoXgQ2QQHTVHuZ8OtLsRBnzFqwE/eEAWtp4SwoJ4yMXqjPeQ==
X-Gm-Gg: AR+sD12D/k3Hok7rIgTC52ID+PQIdaqXvsTMX5D7tu3TZG15pjjD3uNd4wj9j5Xwheg
	nsPWz/UMVAGYsxvRF5lsjUP2Y88Pm29xXYQtHRcO0WjqzClrEwhIJmVK2jEUx+P6lTTb6yCYo/N
	mec7bJVWk7vlbB73JfbXsYV5JrWSQCv6tmutxqzSVMtit+zBm08kxBkgRvV+ApQ3mstGBHBiIXJ
	KzjwL++XYZtUP0ABKPJdXIZ0fbtpCJ+zCu/SHXVS/X1MtzKF7FHmqrGvBDhYXOiFdzL3t5FLkvJ
	nkHLnZ585X96GV9gFdbipjGC8q/tmwQZfJc/c9PPp5kiFPVNGqiyClMpUxCRFBIC1w7qv94bOKG
	5NKJMrYpl8vkcuRPO0S9XY+U/NawAK35Knm/NFfrQOdsGkA==
X-Received: by 2002:a05:600c:19cc:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-499b847725emr5442765e9.15.1787245689201;
        Thu, 20 Aug 2026 10:08:09 -0700 (PDT)
X-Received: by 2002:a05:600c:19cc:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-499b847725emr5441695e9.15.1787245688826;
        Thu, 20 Aug 2026 10:08:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:11aa:87f0:935:4f8e:b423:64eb? ([2a01:e0a:11aa:87f0:935:4f8e:b423:64eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499affa25acsm96595825e9.4.2026.08.20.10.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 10:08:08 -0700 (PDT)
Message-ID: <9598769e-597b-45da-b8d6-710c11227858@redhat.com>
Date: Thu, 20 Aug 2026 19:08:04 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] drm/panic: Pass colors to draw_panic_dispatch()
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
 <20260818125012.468092-6-tzimmermann@suse.de>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260818125012.468092-6-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2026 14:28, Thomas Zimmermann wrote:
> Set the panic-screen colors in draw_panic_plane() as a single point
> of truth. Pass the values into the individual drawing functions.
> 
> In the test cases, replace the Kconfig-defined colors with white and
> black. Allows for removal of the tests' limitations and dependency on
> the exact values. All tests now always verify the generated output.
> 
> Hardcoding the test colors will later also allow for building the
> test case without having DRM panic handling enabled.

Thanks, that makes sense, I should've think about it, as this colors was 
a bit painful when writing the KUnit tests.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c            | 54 +++++++++++++++-----------
>   drivers/gpu/drm/tests/drm_panic_test.c | 26 +++++++++----
>   2 files changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 594235661710..ede620b27515 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -478,12 +478,8 @@ static void drm_panic_logo_draw(struct drm_scanout_buffer *sb, struct drm_rect *
>   				   fg_color);
>   }
>   
> -static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_user(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
>   {
> -	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
> -						    sb->format->format);
> -	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
> -						    sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg;
>   	unsigned int msg_width, msg_height;
> @@ -491,6 +487,9 @@ static int draw_panic_screen_user(struct drm_scanout_buffer *sb)
>   	if (!font)
>   		return -EINVAL;
>   
> +	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
> +	bg_color = drm_draw_color_from_xrgb8888(bg_color, sb->format->format);
> +
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	drm_panic_logo_rect(&r_logo, font);
>   
> @@ -549,12 +548,8 @@ static int draw_line_with_wrap(struct drm_scanout_buffer *sb, const struct font_
>    * Draw the kmsg buffer to the screen, starting from the youngest message at the bottom,
>    * and going up until reaching the top of the screen.
>    */
> -static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
>   {
> -	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
> -						    sb->format->format);
> -	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
> -						    sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   	struct kmsg_dump_iter iter;
> @@ -566,6 +561,9 @@ static int draw_panic_screen_kmsg(struct drm_scanout_buffer *sb)
>   	if (!font || font->width > sb->width)
>   		return -EINVAL;
>   
> +	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
> +	bg_color = drm_draw_color_from_xrgb8888(bg_color, sb->format->format);
> +
>   	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
>   
>   	/* Fill with the background color, and draw text on top */
> @@ -748,12 +746,9 @@ static int drm_panic_get_qr_code(u8 **qr_image)
>   /*
>    * Draw the panic message at the center of the screen, with a QR Code
>    */
> -static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
> +static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb,
> +				      u32 fg_color, u32 bg_color)
>   {
> -	u32 fg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR,
> -						    sb->format->format);
> -	u32 bg_color = drm_draw_color_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR,
> -						    sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg, r_qr, r_qr_canvas;
>   	unsigned int max_qr_size, scale;
> @@ -766,6 +761,9 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	if (!font)
>   		return -EINVAL;
>   
> +	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
> +	bg_color = drm_draw_color_from_xrgb8888(bg_color, sb->format->format);
> +
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   
>   	drm_panic_logo_rect(&r_logo, font);
> @@ -818,10 +816,10 @@ static int _draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
>   	return 0;
>   }
>   
> -static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb)
> +static int draw_panic_screen_qr_code(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
>   {
> -	if (_draw_panic_screen_qr_code(sb))
> -		draw_panic_screen_user(sb);
> +	if (_draw_panic_screen_qr_code(sb, fg_color, bg_color))
> +		draw_panic_screen_user(sb, fg_color, bg_color);
>   	return 0;
>   }
>   #else
> @@ -893,22 +891,22 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
>   	return drm_draw_can_convert_from_xrgb8888(format->format);
>   }
>   
> -static int draw_panic_dispatch(struct drm_scanout_buffer *sb)
> +static int draw_panic_dispatch(struct drm_scanout_buffer *sb, u32 fg_color, u32 bg_color)
>   {
>   	int ret;
>   
>   	switch (drm_panic_type) {
>   	case DRM_PANIC_TYPE_KMSG:
> -		ret = draw_panic_screen_kmsg(sb);
> +		ret = draw_panic_screen_kmsg(sb, fg_color, bg_color);
>   		break;
>   #if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
>   	case DRM_PANIC_TYPE_QR:
> -		ret = draw_panic_screen_qr_code(sb);
> +		ret = draw_panic_screen_qr_code(sb, fg_color, bg_color);
>   		break;
>   #endif
>   	case DRM_PANIC_TYPE_USER:
>   	default:
> -		ret = draw_panic_screen_user(sb);
> +		ret = draw_panic_screen_user(sb, fg_color, bg_color);
>   	}
>   
>   	return ret;
> @@ -943,6 +941,16 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   	struct drm_scanout_buffer sb = { };
>   	int ret;
>   	unsigned long flags;
> +#if defined(CONFIG_DRM_PANIC_FOREGROUND_COLOR)
> +	u32 fg_color = CONFIG_DRM_PANIC_FOREGROUND_COLOR;
> +#else
> +	u32 fg_color = 0x00ffffff;
> +#endif
> +#if defined(CONFIG_DRM_PANIC_BACKGROUND_COLOR)
> +	u32 bg_color = CONFIG_DRM_PANIC_BACKGROUND_COLOR;
> +#else
> +	u32 bg_color = 0x00000000;
> +#endif
>   
>   	if (!drm_panic_trylock(plane->dev, flags))
>   		return;
> @@ -958,7 +966,7 @@ static void draw_panic_plane(struct drm_plane *plane, const char *description)
>   
>   	drm_panic_set_description(description);
>   
> -	ret = draw_panic_dispatch(&sb);
> +	ret = draw_panic_dispatch(&sb, fg_color, bg_color);
>   	if (!ret) {
>   		/*
>   		 * Only flush if we have a panic screen to display. Otherwise
> diff --git a/drivers/gpu/drm/tests/drm_panic_test.c b/drivers/gpu/drm/tests/drm_panic_test.c
> index fdd77b0cc54c..969a096ec840 100644
> --- a/drivers/gpu/drm/tests/drm_panic_test.c
> +++ b/drivers/gpu/drm/tests/drm_panic_test.c
> @@ -14,17 +14,10 @@
>   #include <linux/units.h>
>   #include <linux/vmalloc.h>
>   
> -/* Check the framebuffer color only if the panic colors are the default */
> -#if (CONFIG_DRM_PANIC_BACKGROUND_COLOR == 0 && \
> -	CONFIG_DRM_PANIC_FOREGROUND_COLOR == 0xffffff)
> -
>   static void drm_panic_check_color_byte(struct kunit *test, u8 b)
>   {
>   	KUNIT_EXPECT_TRUE(test, (b == 0 || b == 0xff));
>   }
> -#else
> -static void drm_panic_check_color_byte(struct kunit *test, u8 b) {}
> -#endif
>   
>   struct drm_test_mode {
>   	const int width;
> @@ -48,10 +41,27 @@ struct drm_test_mode {
>   	.width = w, \
>   	.height = h, \
>   	.format = f, \
> -	.draw_screen = draw_panic_screen_##name, \
> +	.draw_screen = draw_panic_screen_ ## name ## _default, \
>   	.fname = #name, \
>   	}, \
>   
> +static int draw_panic_screen_user_default(struct drm_scanout_buffer *sb)
> +{
> +	return draw_panic_screen_user(sb, 0x00ffffff, 0x00000000);
> +}
> +
> +static int draw_panic_screen_kmsg_default(struct drm_scanout_buffer *sb)
> +{
> +	return draw_panic_screen_kmsg(sb, 0x00ffffff, 0x00000000);
> +}
> +
> +#if IS_ENABLED(CONFIG_DRM_PANIC_SCREEN_QR_CODE)
> +static int draw_panic_screen_qr_code_default(struct drm_scanout_buffer *sb)
> +{
> +	return draw_panic_screen_qr_code(sb, 0x00ffffff, 0x00000000);
> +}
> +#endif
> +
>   static const struct drm_test_mode drm_test_modes_cases[] = {
>   	DRM_TEST_MODE_LIST(user)
>   	DRM_TEST_MODE_LIST(kmsg)

