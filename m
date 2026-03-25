Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BB3363C49
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471298; cv=none; b=jVG4Ci0VCyCEPqLRFJXCdbtjftOs7Nxy0OX+ctKtklBASw+LUM2dCwknyWfmOvvm3bJBRqZKflZ8/bMi1JAcREpubC50CRRXCZZSwuzSscdO/CbW6P5tebK9tYR/1D/N9jXUuXa3FOD+rKQIS8qaYgO7/pn4cGrNxYva/Mh15go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471298; c=relaxed/simple;
	bh=VVqlxxHZRb8tZz7boU+dlmsJ/0Syk+ZaUNbpJjU3WX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VkCzpnWpD5MXOs6mgad+8hTaPS5FPLqmSNJkvOIEY73ixqZ98f03IrVBaLHffwfd1W7r4CyEVkcl9zV9IO0vd/4HZ4e8DpZKpH6mOtK2Mgvad4QdUM/fPrnUNjEYaSfbQ+EUjg1VPtVBtlRzqKmI0w+vgR4CREpl9tmt3eLYmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U724P3T4; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U724P3T4"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439bcec8613so156117f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 13:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774471295; x=1775076095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z+jLlAQMFJeoih+XE7tLpkictTKxnhNTWJHKi8OqzAA=;
        b=U724P3T45RJC2d4Z1hSbP7gJa4CMMNTbuJlajn5tzNW+q9fmQjE1KOSltxCcUI5sBc
         fSmYYA2k86eqz7hOEXQtu/EbcqsoIvxTdOa3AxM2rA+CDooE1XsgFZcPxjPoDBPS3Sz9
         dFpC85PTSPDwi2LUtzknujzPIXfolL+rT0zb24rUgyGovRUOoI+twQsTWOj/sr7aQE+f
         O1f0AgXqYkj/EppHosIO6t80e+BHB8AviL0qTSS9E8H6cvAm0OAlVMdhby/Dqr1sk/yh
         mUIIhVfk434FKUE2pKltoPEebTt05zhvf9/uWurTNXk+oK5Rjpf+zIBjR8+JQaoAgoLl
         rFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774471295; x=1775076095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+jLlAQMFJeoih+XE7tLpkictTKxnhNTWJHKi8OqzAA=;
        b=O0OBA9ujQjnRt6w7SgJaMvTikj2RwQrCnaY6yjO1vw25HoMHTfIKwmBAwMVAjQeTmQ
         fPHC7I8RNvqPlhUOl5zI+TO2VqJgwgDwilzDJ+Hq2nX4Q7N00ggXdQg8TktbOqxNk129
         bgsWnt/QhuhHt64LTGORvxLc/EXx6VzrRwUrd+LAhWmLlKOlSgRoezK5KDgY7xr9s9jn
         xuQqbqIroW2fE9aXeGLJLo03/wzHRkrJ3vh4F7A48aQUyRlvvpgkSlxg6R4DGQodW9Y1
         p2Yme2g61nwIexcMJfXnOaLXXYdJwdoWPOmPihGxESEVYdTe6Sy+YO7g3Kr1wFe88DyL
         vCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcAmbBY+qPPRg0PEwu/I93Ys5uSmOIRC5OJM/YiAXNqRpFwNIxe6ah0678b3Ev4JgjiSvD6Qnv5IA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKfhxkPVfgo4rBAkCGnU0tYC71dzlgy/ZtvjqBUrV4kJLI2PCD
	9vwcyL2H9Zegix1MDnEa6zBpM9TmFqP4kyuJtTAKjoE3QOIxfRIdkXap
X-Gm-Gg: ATEYQzxYgGuJ5BfvZz7sXmJHwIp5utKtE8dV3vtFk8QdKpjsGryevApZiYUezeaKHss
	lvIVn8cX68nTaThTR37egaAyAa5MX4xEiwF65xo+D+p8501nn39eebks0HpBHlPGfHxkdbIXNy8
	LW31alS/psPu5vkjWfZHmNRPBnardpx/SQDKZKfjv71Ag7lI9OcawpSqzh3MmWRQHqRKRCj6oyN
	wFp0GHq07Ft2QPTE+/Zwy04e/paKrLGpJqaDvfa4pp6eUlVsQw2r5epsRyortR0RGwZLnuxjZ8D
	IY5QEajkXKBHdkej5z3h16hK/6nk+3FdKyqzaI7N8LR6T9J6EJMGGmnFxPMh3kgZ0EEiUxalONO
	TyaFjcnFr3rxk7f+f9IUUmVMx6OIBAmku0sH+7/KPUIZiCyx6qHcC8SE5e7InBcBZint64eBNFg
	2mAHV3Fyj+FkQ+IVQX9wRuHw10D+PAXkl/z1lpkltVzdceuw==
X-Received: by 2002:a05:600c:35c6:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-4871603508fmr80589005e9.19.1774471295365;
        Wed, 25 Mar 2026 13:41:35 -0700 (PDT)
Received: from [192.168.0.193] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871fb3fc8esm6706615e9.11.2026.03.25.13.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:41:34 -0700 (PDT)
Message-ID: <a4f5f16a-3188-4f23-87b4-b068fd9ccf00@gmail.com>
Date: Wed, 25 Mar 2026 21:41:33 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] leds: Introduce the multi_max_intensity sysfs
 attribute
To: Armin Wolf <W_Armin@gmx.de>, lee@kernel.org, pavel@kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-leds@vger.kernel.org, linux-doc@vger.kernel.org,
 wse@tuxedocomputers.com, pobrn@protonmail.com, m.tretter@pengutronix.de
References: <20260324202751.6486-1-W_Armin@gmx.de>
 <20260324202751.6486-2-W_Armin@gmx.de>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20260324202751.6486-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

Thanks for the update.

On 3/24/26 9:27 PM, Armin Wolf wrote:
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
Reviewed-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

