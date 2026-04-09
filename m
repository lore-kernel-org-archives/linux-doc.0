Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F031AAE28
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775765093; cv=none; b=t8ejWp+mSSXJybdzl9cvS3tQZhTWKKW7EsWsAQgUCwBZadioiHdREf1YTkDMtpbqAJE90b165VaJmZD/+rDkALajtEEIWx/RBccy+43GAjbwMTGvE1s3C2SNaKQHGUKgjzBcHMyUCyE+mmqdKQa6OH/GQ7RZbjf789eK1kSW/zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775765093; c=relaxed/simple;
	bh=oyfrRqRvZFeyIVwNrH6Z6dQPaitfntwHluGT/Ji3iNM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtqlE0Zu4937Hu0emCNVFQ1swBhhhxXBrQJ4ItJ1CX3YA09IJpoUYV4kE6oyV7B4M0izyFcoLdCCAHg9gdwxkDTzqNxLCyyQRUjQfGtX0Hw+NdJCIjL1/Nq9QwLEQRM0j0enC797Z3UT+STeTDH9G0FZNv410kgAShCf7XCvsBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abkonLHk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abkonLHk"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66bd3d05e03so1512943a12.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 13:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775765090; x=1776369890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqS5Pf7YsvspLFyoG0lx1qkP9YEtML5bQ5wp6Ju/2Tc=;
        b=abkonLHk1XDsvPUSD0TB6KNlfONxqGtUPmebaneZgLcwaftqUxUNwC1JGtjyC4ufnP
         jWIkOxhddhaDhs//r2va+3Tlec9CRfGpNYPi10Qg6B3ftauqKKJx1NnHP1PDvuouhnFN
         QHIUdQwqla3sm6LNHZG2NJ/6yxsi5yuFGHCjqcEopwKeOu3g0WLx987nk4jHr6lvRrYo
         m+8V/BU9VV6PwBV83gHN2jnjFWEfQKZ9YCInrqWIVuN0Q+1dCtuuUc5bvj3Btbj3k3zL
         YBh3sg1i8QM7ttjzeiejt+8249vqA64W1L6LalUmKJFJxNiYAsE+VaVy8Bbc6lNOpZFD
         xorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775765090; x=1776369890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqS5Pf7YsvspLFyoG0lx1qkP9YEtML5bQ5wp6Ju/2Tc=;
        b=fbRKtSme28Id8UHaEkfDr3xOjWgXW0VpmUNLQY3jR/14K9vmBiIIK3Dc4SvXn+rc05
         0AifKPxX2KJbtfS9TaSgWFht5cOWtNaADS2Dxp/qmwNLrlIE6IttJtz+j/S8D6ytRWGa
         cj0XjQw0/uETGaycPJohx9nQNKqPhcxTWPaSbIc9fRxtmyDcJrFrZypjf/hjWQJbjIoy
         v7m+qgRT5IaJV9+z1yIlgjSXQAvxqYCVyS8WGySaflqS/P4h1TlFulk4+5EbBp34mFPf
         o1ofwI9edy7/kvZ2Nl7bB8fs+Goefsk0NnfVIxuHEmvKkMhRzAimhaXmJOQk5ZVPrl75
         p2MQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/k0rIkllGB7BNIX/gCgZbEU8PyG98Rg/09Xr1GRoie5BumqBfRRWzs6X6xCKcpfrHx4U5KZxMngE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSFNQeyZ/jEBf1gyGcMJbimfmU2kv+0LRBPBKpeETq6RxkfYY
	UB1M8ED8f1uW6Vpq6ZnP7V9zUEtiVRl/z473c4XK1OrXOs72c8T9pxa4
X-Gm-Gg: AeBDiesZL/s6ZLtwCk2btc/dqZXFszsMM6Q5jgJ5ktuq/KtnUUVG+P5TePV0dmN+OwC
	NZOb+wbYDO1gVfXnbpTNzFwgaKMTpWEB3vYojZa/CAQpBo0/mGgHSJ0nN6KlFd012YaMB/fhV1j
	WGMDda/M60n5YMpbJSiVE8nA2UI+3NIVAg3ki7Y/R1qGXKTl7DcXhC4aqcPbN57hVW8/2FMeSXR
	oYsNWJg/E888mhwI7agxxQlvIgH58w8tyRMSNEgOGwOzciWiG9WQiAjMScxBU3sVbQ60ev0jgdY
	82KmlJfEuMt84qXXEWg3BtzrIO17gNaoxKILnfSUDxkzhmuLdtpuM2TY+/WxdrfnI4ppzOpIaHk
	9a5EDyEeryRaWz/3fOkuGezp6/ITaFUh8H1x0WX5l15JmljpgOGV70cVfX610FUxA3csoxNufzR
	QCxUOp2P+hRMChKIZXJhsnwIHQQKRZElFTo2k=
X-Received: by 2002:a05:6402:4344:b0:66e:abc4:ffc5 with SMTP id 4fb4d7f45d1cf-670776521d8mr91248a12.2.1775765090059;
        Thu, 09 Apr 2026 13:04:50 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070816a8esm89789a12.25.2026.04.09.13.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 13:04:48 -0700 (PDT)
Message-ID: <da11f552-52dd-414b-ac73-6601a67dbd2b@gmail.com>
Date: Thu, 9 Apr 2026 22:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 wse@tuxedocomputers.com, pobrn@protonmail.com, m.tretter@pengutronix.de
References: <20260331191619.3729-1-W_Armin@gmx.de>
 <20260331191619.3729-2-W_Armin@gmx.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260331191619.3729-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

On 3/31/26 9:16 PM, Armin Wolf wrote:
> Some multicolor LEDs support global brightness control in hardware,
> meaning that the maximum intensity of the color components is not
> connected to the maximum global brightness. Such LEDs cannot be
> described properly by the current multicolor LED class interface,
> because it assumes that the maximum intensity of each color component
> is described by the maximum global brightness of the LED.
> 
> Fix this by introducing a new sysfs attribute called
> "multi_max_intensity" holding the maximum intensity values for the
> color components of a multicolor LED class device. Drivers can use
> the new max_intensity field inside struct mc_subled to tell the
> multicolor LED class code about those values. Intensity values written
> by userspace applications will be limited to this maximum value.
> 
> Drivers for multicolor LEDs that do not support global brightness
> control in hardware might still want to use the maximum global LED
> brightness supplied via devicetree as the maximum intensity of each
> individual color component. Such drivers should set max_intensity
> to 0 so that the multicolor LED core can act accordingly.
> 
> The lp50xx and ncp5623 LED drivers already use hardware-based control
> for the global LED brightness. Modify those drivers to correctly
> initalize .max_intensity to avoid being limited to the maximum global
> brightness supplied via devicetree.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   .../ABI/testing/sysfs-class-led-multicolor    | 19 ++++++--
>   Documentation/leds/leds-class-multicolor.rst  | 21 ++++++++-
>   drivers/leds/led-class-multicolor.c           | 47 ++++++++++++++++++-
>   drivers/leds/leds-lp50xx.c                    |  1 +
>   drivers/leds/rgb/leds-ncp5623.c               |  4 +-
>   include/linux/led-class-multicolor.h          | 30 +++++++++++-
>   6 files changed, 113 insertions(+), 9 deletions(-)

[...]

> diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
> index db9f34c6736e..6f89d92566b2 100644
> --- a/include/linux/led-class-multicolor.h
> +++ b/include/linux/led-class-multicolor.h
> @@ -9,10 +9,31 @@
>   #include <linux/leds.h>
>   #include <dt-bindings/leds/common.h>
>   
> +/**
> + * struct mc_subled - Color component description.
> + * @color_index: Color ID.
> + * @brightness: Scaled intensity.
> + * @intensity: Current intensity.
> + * @max_intensity: Maximum supported intensity value.
> + * @channel: Channel index.
> + *
> + * Describes a color component of a multicolor LED. Many multicolor LEDs
> + * do no support gobal brightness control in hardware, so they use

s/gobal/global/

> + * the brightness field in connection with led_mc_calc_color_components()
> + * to perform the intensity scaling in software.
> + * Such drivers should set max_intensity to 0 to signal the multicolor LED core
> + * that the maximum global brightness of the LED class device should be used for
> + * limiting incoming intensity values.
> + *
> + * Multicolor LEDs that do support global brightness control in hardware
> + * should instead set max_intensity to the maximum intensity value supported
> + * by the hardware for a given color component.
> + */
>   struct mc_subled {
>   	unsigned int color_index;
>   	unsigned int brightness;
>   	unsigned int intensity;
> +	unsigned int max_intensity;
>   	unsigned int channel;
>   };
>   
> @@ -53,7 +74,14 @@ int led_classdev_multicolor_register_ext(struct device *parent,
>    */
>   void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev);
>   
> -/* Calculate brightness for the monochrome LED cluster */
> +/**
> + * led_mc_calc_color_components() - Calculates component brightness values of a LED cluster.
> + * @mcled_cdev - Multicolor LED class device of the LED cluster.
> + * @brightness - Global brightness of the LED cluster.
> + *
> + * Calculates the brightness values for each color component of a monochrome LED cluster,
> + * see Documentation/leds/leds-class-multicolor.rst for details.
> + */
>   int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
>   				 enum led_brightness brightness);
>   

Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

