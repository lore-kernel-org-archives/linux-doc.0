Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452DC352014
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 17:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786728937; cv=none; b=cTivh+1R37HKGNb1P1wmmhbpi71Xor4TwP0RpAD6VC4to7+sHxm2ZqaIRhjYSQ4t6zv8CAsKB9oma3YcG8QFVRhMsKzwsfvXksADI3fJwV7pGbIvz0jCeMKyLN5mnbRwGfIVdaDnSeHyfgLV0zPWQrX8v/Y72SwTfPX4E92PHsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786728937; c=relaxed/simple;
	bh=ZSp8kcuPa4zSJOjijpCyKWPre2cCkNQIezmEiP1Rb5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6F4cUfO+Xj0ed/P67hslEjOP6PxZs/zgVP1htIM5HAvUkkA8t9YkSu0UUSNiiLX4cT3ML0htkhZWqzd31q0g+s8enxMSDYJ/VbVm1MGnflbJLPyQFT5gZpD+VQaDcr92mvwnj3The1mi0i8HEaCvIBWkcnausT0N700toJVdi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfI8pVnT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfI8pVnT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso16969755e9.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786728934; x=1787333734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a40VMlhH/9VccjXZglrfB7wRIR2LPsxaN+/Gt+UtGkc=;
        b=MfI8pVnTDHs5Onin3iffbiqNjykl0rRapSSwi+pTsdZ/sR+ApcbimmyToNCWGP7mVx
         3AF8ZB/eF1/nO4F3A5mtgNVwqVcynbUYL4kKBqHpj6YxujG9reyrqM+HQQfZUfZe2OyS
         gO6ff1PwRafOJFS7+hYxJSanBY0IE7maiv+jmG+ZHZiUH31lijhKVsmcpIe6ZIyFlNUS
         pKE2Zue8pVB2XLzPI+98TAI/VkJesrYxcEYRJ7RLcF4YJ+lL5Dp9fXRNLyumMzxe/PSq
         Uqo42XeoCLMAY+qJf47QBnrhbEm0Hv8jCfp5qmt9/lf0hAr9MFF9H/PqTwkmru0yg/uJ
         nJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786728934; x=1787333734;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a40VMlhH/9VccjXZglrfB7wRIR2LPsxaN+/Gt+UtGkc=;
        b=KG+hf/xiV5r/cXAjNcJVedQFxZtBP2foISdeTBTqSPjGtEvcEmIBaoTHExHuMBYQvI
         AOpo1zAulvw4cKn1IpeXt27KlrzIV1H3fcUo6VYjHVoJ751xDg0lFH/U2poEVZ5vWKFt
         QfxU3Wz7hHKltnCpnhB1aF5x79R5xclyQ9U1QhZ+quDAY4dASuWNEjB/TX3ed2GOq8IV
         PBccjI1+qHh2p0ne9IPCmU0xycd/PKEUioZMJ3EivGy/Gituh7/KbIlthZrGW/80wfc7
         bwx4NRmvQtoHcsbgrYxZOZzEuUc9lf6VXstDjUIE+cI2eTX+Y0Jd073i6xMhpmRcythb
         KiDQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRnqES/l8aXO3Dtx5uJwJKsJ9TvpsQiK7olI59f4SSAtNbncbehcG5rZrW0zLFPUPXXiisLTzU0sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa9dpjZGf/uwj4ObdFF43cm12Z5+vjGDEEE2t3WSNXW+EiWk7g
	+8vwaxdILcs2LUtygNVLQpT0jsA8r03zgK9GcDrgxZC/3SZ1L8bCt+rH
X-Gm-Gg: AR+sD13vhzfsZuWc9CqYupwyI92zibSuAE1dOUNb2by2K+ykOUWnRi44cJnZIULegMP
	PFhXt62+tnx22ZJGIUzAhxHBCS1UcXNQjztG/ZqGx10pJWQFA/p6FpaGiOYPKDc0Bhxrozmm3xg
	GCMBAMZdC/4k6PhXVzDKTrmhlZ0lehdQEpPgICMz5lmYHG+4wE/Fa3o+NQR+G7nxqYnl1cmmaUm
	/e/Ip07p/jwV11Tq7k2HPy0+b+EIag4k7UIcxMGYstE6ahM1LLr08SXyoiGvd30Xt/92IZogrzg
	1mRr2ow+I3GeftZoQqO+5L/Q9x8oPpwEPakUM/7CN4HPt76GiE4aDqQkuQPSbhgb9wInRWK+fvo
	FVq3MoaCtG/rAMEFavensLc1Sh6WW/3nxjchSbyYx+CWzRbu3kN2nHp1vZI74LjOAXMImAC3X0N
	lUhfPIIY+Jl0zDKF8GvJWv+HlNEaJqPx5ezAJ5ItF1AWxEr4CGoNYwvwnoURufwHbsXOwa7h9pC
	1+zvOBynQpXODifx34s12tND13l6Wd50w==
X-Received: by 2002:a05:600d:117:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-49987ab4e1bmr68329775e9.7.1786728934527;
        Fri, 14 Aug 2026 10:35:34 -0700 (PDT)
Received: from [192.168.0.32] (cable-178-148-247-5.dynamic.sbb.rs. [178.148.247.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b25ad8sm56586045e9.2.2026.08.14.10.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 10:35:34 -0700 (PDT)
Message-ID: <e640aa47-a879-46db-b10c-8ccce0ccd032@gmail.com>
Date: Fri, 14 Aug 2026 19:35:33 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] hwmon: (asus_rog_ryujin) Add ROG Ryujin III White
 Edition
To: Arie Miller <renari@arimil.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Will Smith <github@notthatwillsmith.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260812103532.395049-1-renari@arimil.com>
 <20260812103532.395049-4-renari@arimil.com>
Content-Language: en-US
From: Aleksa Savic <savicaleksa83@gmail.com>
In-Reply-To: <20260812103532.395049-4-renari@arimil.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/12/26 12:35 PM, Arie Miller wrote:
> From: Will Smith <github@notthatwillsmith.com>
> 
> The ROG Ryujin III White Edition uses the same report layout as the
> other supported Ryujin III variants. Add its USB device ID and list it
> in the driver documentation.
> 
> The device was tested with the driver on the author's hardware.
> 
> Link: https://github.com/aleksamagicka/asus_rog_ryujin-hwmon/pull/10
> Signed-off-by: Will Smith <github@notthatwillsmith.com>
> Assisted-by: Codex:gpt-5.6-sol sparse
> Signed-off-by: Arie Miller <renari@arimil.com>
> ---
>   Documentation/hwmon/asus_rog_ryujin.rst | 1 +
>   drivers/hwmon/asus_rog_ryujin.c         | 3 +++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/hwmon/asus_rog_ryujin.rst b/Documentation/hwmon/asus_rog_ryujin.rst
> index cfdfe3712f19..b0d7ce8dd921 100644
> --- a/Documentation/hwmon/asus_rog_ryujin.rst
> +++ b/Documentation/hwmon/asus_rog_ryujin.rst
> @@ -8,6 +8,7 @@ Supported devices:
>   * ASUS ROG RYUJIN II 360
>   * ASUS ROG RYUJIN III EXTREME
>   * ASUS ROG RYUJIN III EVA EDITION
> +* ASUS ROG RYUJIN III WHITE EDITION
>   
>   Author: Aleksa Savic
>   
> diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
> index 79e5b6d6dae0..702edb831394 100644
> --- a/drivers/hwmon/asus_rog_ryujin.c
> +++ b/drivers/hwmon/asus_rog_ryujin.c
> @@ -19,6 +19,7 @@
>   #define USB_PRODUCT_ID_RYUJIN_AIO	0x1988	/* ASUS ROG RYUJIN II 360 */
>   #define USB_PRODUCT_ID_RYUJIN_III_EXTREME	0x1bcb
>   #define USB_PRODUCT_ID_RYUJIN_III_EVA		0x1ade
> +#define USB_PRODUCT_ID_RYUJIN_III_WHITE		0x1ada
>   
>   struct rog_ryujin_device_info {
>   	u8 temp_offset;
> @@ -590,6 +591,8 @@ static const struct hid_device_id rog_ryujin_table[] = {
>   	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
>   	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_EVA),
>   	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUS_ROG, USB_PRODUCT_ID_RYUJIN_III_WHITE),
> +	  .driver_data = (kernel_ulong_t)&rog_ryujin_iii_info },
>   	{ }
>   };
>   

Reviewed-by: Aleksa Savic <savicaleksa83@gmail.com>

Thanks,
Aleksa
