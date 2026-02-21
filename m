Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BDE34AAE0
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771692458; cv=none; b=ETbN7y1n2lQPs3X1O7qLyMgFq45OVMhLwK3sa0MSyVCn80VfT9fG3au41yQzLaSi3v9VWpaiYe3AKSpL/IzfwSlBoQI2Vo9RCA/Ey2Sgb0LceB9si9KgS4La+tm0cTYtZx0HbSbavWK/VXvpwWd563t3MHVNqA2gyEThi135D+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771692458; c=relaxed/simple;
	bh=NZkC0XrrAc6VJQltoZM0wC9Es2xPIesX2D4zRKy3KOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nFI+PCOkIx6xqlza9eiW2+O1LUXFpyG+hWlptlG4hVAtgAW3/brmfEe8FNHok+o1sB6yGIqlHck4b7qzYP7sZqxGyYslesYMMisvu+GTqF5bIM/9eFHLuM0Rl9zSqkWVCw7cygKnjALU8fcg+EQAE5cFmgbgpP7RnLl6sVxYW+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vztTjvRX; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vztTjvRX"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7d18d0e6d71so2014156a34.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 08:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771692455; x=1772297255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NVSDVNsVU3WfS0jvVP+0eZ25UumXRJFiv0S9bwylHTs=;
        b=vztTjvRXbACJSagRHqdR30Yw7YRRK3YwDtfFX8jCMvgyPpxX2NZnvU4QhV5x3gIsFE
         CBHXdZa+4yesmSqwxyBllRVSGX0IwvSjZ7yPfQD64hFHB/YBjgGnCF9WngHUcSJJzAQd
         CI3j9lI8mbZLGSgdQI3BPftmwFDZTTzwDd9oXXSEX5768LhMsC+gRHPjEqAbtTHoflCZ
         eyl2VO35F3YmH1lk0RfRJCoGWeAPy1z5MqFZcp6xhpmO/BOVYuJeC2/ZcBHQKaV+BvMR
         GhmHU66z4fj5vPGn0ceK6raj7TqC0q56+9cncgwN903sXrbwDZu5fbX38s0QSrOdrMSr
         h+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771692455; x=1772297255;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVSDVNsVU3WfS0jvVP+0eZ25UumXRJFiv0S9bwylHTs=;
        b=cf5ty0k65PZCTFXrOF/7ll6dyEKgEImSki5t30tnzn8MfSd4SINaUw3G8LKGbBalmq
         e8yhoMvRX81BQ9rXxF+Jnc7Ym3gY+uryUIPS0o6p0nfjmSMN+ubqA57OCLrEI9rRscvL
         5tSvbYJCeziuObAeGw0ZIftNlXDwa9R217MrQrbkNb0qt1d/R5A0LKn6S44cscBVEvF4
         PcKxL55liBnkemp4f5RdliaTvnInHHChrLYyJxkeQvb+SjR8k1NzzdcUWC+0mvFCPTbJ
         fZMQD08tsoyrRIk6FDpQDTriB1yQGovLS7Xj8YoEXz9cEqNasSqfqzzvLjMDxyYDUA1h
         WFEg==
X-Forwarded-Encrypted: i=1; AJvYcCU0752g8u9LodfoHFfjY1ZgiyN8d76jbPyRtDcZMObMrFbVLj0N9V8J75y0ZgFXjs31C0pbdpM1znM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJmS6PvfntZdVvapyiT5LAtU4PmJN4iD3vJXNM2OfdsZkDMYiO
	/HbtvYIr+VVNIFlGcopysMfZJDuURr34vadHh7vu47O7+kAQ9YYQpYxHlLkrftDC8Gc=
X-Gm-Gg: AZuq6aJMwWIpRmNtjHZsePIloI26/P2UESgbmaIjjGilvb4Vw7aXa7saXYpUQmqsRIx
	8nNgKPR/pCBsuU1ij7B6ASHDRJx17QF0athxpe6M0ZpumkT0Kfh0XjdI/I5524Keexo20iti0h8
	rdZMuBkmKnfqFtf3Rvc2XkZqLtRzNiwqsN8jxUBeVh0uIrahYSEMYjy20xZaQVdQ/ZxOZL7xGgR
	gLUrTE5c6paD+9gjIPMvo6L/miBUlL+2FvRZe/QBKForpHnppA1nM+L1IMQh1Vmtl9gc28fy0Ql
	OJRD42ucLAfISt56CY6fmjC76/wRgc7q6lcurwebF8vlE3pSW7JpcOuRzIMbjJggMq6FeLOIeRK
	4kZeU7DWCrrkDkzB43mORGfCB3PIjt+zQgNYPDwgghmHloByCKh0RIWq4QtWM4tzNMWuZ5xIC2D
	PnuM+MChrLXkkrmeQs3IZIiYarbOauq8EYhpd/sRhqSUuJJdEv42LsOhMBt3rvY7YZHSWMgA==
X-Received: by 2002:a05:6830:6af3:b0:7d4:bc46:e35e with SMTP id 46e09a7af769-7d52bc7368dmr2008264a34.0.1771692455398;
        Sat, 21 Feb 2026 08:47:35 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:611:96af:f385:64bf? ([2600:8803:e7e4:500:611:96af:f385:64bf])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d52d038804sm2728289a34.18.2026.02.21.08.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 08:47:35 -0800 (PST)
Message-ID: <e2c74e7f-d851-457f-88f8-d80a8d17c51f@baylibre.com>
Date: Sat, 21 Feb 2026 10:47:34 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] iio: accel: adxl345: Implement event scaling for
 ABI compliance
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, linux-iio@vger.kernel.org,
 jic23@kernel.org
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org,
 linux-kernel-mentees-archive@lists.linuxfoundation.org, nuno.sa@analog.com,
 andy@kernel.org, corbet@lwn.net, lars@metafoo.de,
 Michael.Hennerich@analog.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260221141251.34855-1-0rayn.dev@gmail.com>
 <20260221141251.34855-4-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260221141251.34855-4-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/21/26 8:12 AM, Taha Ed-Dafili wrote:
> The ADXL345 uses a fixed threshold resolution of 62.5 mg/LSB for
> event-related registers. Previously, the driver reported raw
> values without a scale factor.
> 
> Implement IIO_EV_INFO_SCALE for all event types to provide the
> conversion factor (0.612915 m/s^2) as required by the IIO ABI.
> 
> Consequently, remove the obsolete comment in adxl345_read_event_value()
> which stated that the scale factor is not applied.
> 
> Add explicit write rejection for IIO_EV_INFO_SCALE in
> adxl345_write_event_value() returning -EINVAL.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
> ---
>  drivers/iio/accel/adxl345_core.c | 37 ++++++++++++++++++++++----------
>  1 file changed, 26 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
> index 78e3f799ecc1..eac4ab052fa2 100644
> --- a/drivers/iio/accel/adxl345_core.c
> +++ b/drivers/iio/accel/adxl345_core.c
> @@ -213,7 +213,8 @@ static const struct iio_event_spec adxl345_events[] = {
>  		.dir = IIO_EV_DIR_RISING,
>  		.mask_shared_by_type =
>  			BIT(IIO_EV_INFO_ENABLE) |
> -			BIT(IIO_EV_INFO_VALUE),
> +			BIT(IIO_EV_INFO_VALUE)	|
> +			BIT(IIO_EV_INFO_SCALE),
>  	},
>  	{
>  		/* activity, ac bit set */
> @@ -221,22 +222,27 @@ static const struct iio_event_spec adxl345_events[] = {
>  		.dir = IIO_EV_DIR_RISING,
>  		.mask_shared_by_type =
>  			BIT(IIO_EV_INFO_ENABLE) |
> -			BIT(IIO_EV_INFO_VALUE),
> +			BIT(IIO_EV_INFO_VALUE)	|
> +			BIT(IIO_EV_INFO_SCALE),
>  	},
>  	{
>  		/* single tap */
>  		.type = IIO_EV_TYPE_GESTURE,
>  		.dir = IIO_EV_DIR_SINGLETAP,
>  		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
> -		.mask_shared_by_type = BIT(IIO_EV_INFO_VALUE) |
> +		.mask_shared_by_type =
> +			BIT(IIO_EV_INFO_VALUE)	|
> +			BIT(IIO_EV_INFO_SCALE)	|
>  			BIT(IIO_EV_INFO_TIMEOUT),
>  	},
>  	{
>  		/* double tap */
>  		.type = IIO_EV_TYPE_GESTURE,
>  		.dir = IIO_EV_DIR_DOUBLETAP,
> -		.mask_shared_by_type = BIT(IIO_EV_INFO_ENABLE) |
> -			BIT(IIO_EV_INFO_RESET_TIMEOUT) |
> +		.mask_shared_by_type =
> +			BIT(IIO_EV_INFO_ENABLE)		|
> +			BIT(IIO_EV_INFO_SCALE)		|

I still question this one. Why do we have a IIO_EV_INFO_SCALE with no
IIO_EV_INFO_VALUE?

The docs say:

| in_accel_gesture_doubletap_scale | Double tap gesture threshold scale. |

But there is no attribute labeled "Double tap gesture threshold" that it
could be referring to.


> +			BIT(IIO_EV_INFO_RESET_TIMEOUT)  |
>  			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
>  	},
>  };ret = adxl345_write_mag_value(st, dir, info,

