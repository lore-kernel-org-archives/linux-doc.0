Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5F238FA3
	for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 17:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771088548; cv=none; b=hlvTUFBcpA7I1RX6O9p3PDvBkXOmgLaH8R/f8oNbXveR+OWPqaXkhPRl2zOw86z6bcP4WQg3V1iWOroB3DPDdfjEmrnHLWMRhWL9rTCCSajhwelfbXS4YFd/cOE1RLDkO9mgZjkvozyWpezwypniBRhp9iPN6kspgqx71o/j3po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771088548; c=relaxed/simple;
	bh=IWe8bBazU2PkA3rgswWuKDmjpnVTc8WXdHKYy0hVDDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ynr7P8fwFMYHL0uDw69v+nIw53sErotVylBkCAZ1S4qNoBzjmR+snFHLEsRCiPQfz6DmkVanDh3qJ6wvYjSvbjb6FA71tr6LWW+dtgA8IATPkip6V5bQTmUAjFtbpbLp/eXvM5FbfpbmMNfkWXOfcDgDIPFzsTbhNIzsi9V4Nvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jw6w6uPh; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jw6w6uPh"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4639279c7a6so660222b6e.1
        for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771088544; x=1771693344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wE+4Pe3Qwx4PDX3LtFLuC8UoLqhBg7N/8yceyc0Nk2k=;
        b=Jw6w6uPh3ATEBGzdRa796J8Tv55p1UQk1hz0jmdJafbxKm0l7EFkFO6ZliAsDo7HQT
         UD8IWiT08lbJ3bYQt7E/bH8+H0eBqJQspa6ORYm7IgZ29AoJHQ8JdkmjI9nxiwgQJDY6
         Hhpm4bTCGFw5xAj5+5YOF64uHF0A189mo+n4lA0MYPikEFyyEMZe8XKVL15udzQ59P1D
         0aoh4SgdcXnz6zymCnYhhoBJEhZtcDF4jL8pKGdcY9MtaDvciFpvB2MuHSRELcz7XAgl
         /rVHsOlIljNJCdViMWI0e28E7v4O81xvPUT5YeYCZprUr7AolvLTeU6FhDuCe1GVrVJO
         UKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771088544; x=1771693344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wE+4Pe3Qwx4PDX3LtFLuC8UoLqhBg7N/8yceyc0Nk2k=;
        b=HkmfRFMUo/v9X/UFlSeCcO1WNW+7h62zl9QXIoBLiRM3j3xKjFSSPZdb6XSps5MTxF
         P3U5EI2W1B9doBZTEfoXuh8uFlknKyNIviBKemvphFCgaZUfdUmQiGNOsvP2wi9mwWan
         Saooz/g6WLPFeadnP0/o3IHZSkNFUxXs8cCE/H/CdqQvecRWgM9CTQZkTjDVA/vuUCqe
         +sMOWGtWwfh3DWjcVBrz+aNJixQy0v47AEH6tB1TX4LIpbmDWRIFgJXRu+wnZmpGBdmx
         bq9oUdZEUlTF58l84htrjb49oBqh5KcK5VP301a2GuxWQzt5FgWxn27AOIyHoqGQ0mPN
         710Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4wdTVYhNuvsOOsJ1xpIyeOAT+u3oL/sW6gd3VQ9GScx+rak3GyqKQSVOoECa/FaQyid4ktUkz/CA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6ngIdTZOgW22ek8Ev69EaOCy21QZp3IkNejq0hyuW15KUyJed
	DSQ2B3Tt5oOhAx3X4rsay8PRexwryVmg3mp/Jw3O+1UEVpzsIn3JQB3ZAXq8YJ94PTc=
X-Gm-Gg: AZuq6aL7ir9U7FXO2hj4s2qOn0plDHemwwTnZj7COssQamkEVzv3VZxPTB6VNE60qcK
	+iHUqVFQ0UvehAiXAV5q78c8xpNugkZU10Crt8tXg5RRbYsi17wUo4OxfrDyQUiewROfTuG4PN7
	L9bbm+ER5llT4xYJ9cJnnG2lQ/8qXTzVRTk0zrXSlRfxBSavitlZMTYb92jY8k48tbgeue/8qa7
	Hc8vKmwQSDam7qCa4CSbf+5gCB0LvGA/zDFkiRlaaCdOiDskaEuq5dyDaPL0LLGqdECg0jUCm/P
	XlkqeKzz2M1U5qXlXRyikLiN72Z++DK7JzGFk+5/DKRQ+Vwh4oVDpVzqMhdMqbIPN3NcuZgbfJa
	ryxVEh50GAQIBXlggKU1R1M0Cszq9SItrbGDwD9EmZ/OKEWx4ErJZwrrz36GJs6IjgP/sHnbpfa
	nWnMEo1UeDNPpa6S5l9UQPMmgHE/vLGFr5/m27BdKLR1S7j8JVPyS17OAeBji4m04vfaLuwEV7+
	GvwNszZ
X-Received: by 2002:a05:6808:398d:b0:45f:f8a:1886 with SMTP id 5614622812f47-463b404a5b9mr1655779b6e.35.1771088543997;
        Sat, 14 Feb 2026 09:02:23 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:109:393c:254e:962e? ([2600:8803:e7e4:500:109:393c:254e:962e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-463be5433ebsm983732b6e.17.2026.02.14.09.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 09:02:23 -0800 (PST)
Message-ID: <af774bb9-817d-4d88-9fe3-54468949ea54@baylibre.com>
Date: Sat, 14 Feb 2026 11:02:22 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] iio: accel: adxl345: Implement event scaling for
 ABI compliance
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, jic23@kernel.org
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org,
 linux-kernel-mentees-archive@lists.linuxfoundation.org, nuno.sa@analog.com,
 andy@kernel.org, corbet@lwn.net, lars@metafoo.de,
 Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260208150515.14798-1-0rayn.dev@gmail.com>
 <20260208150515.14798-4-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260208150515.14798-4-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/8/26 9:05 AM, Taha Ed-Dafili wrote:
> The ADXL345 uses a fixed threshold resolution of 62.5 mg/LSB for
> event-related registers. Previously, the driver reported raw
> values without a scale factor.
> 
> Implement IIO_EV_INFO_SCALE for all event types to provide the
> conversion factor (0.612915 m/s^2) as required by the IIO ABI.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
> ---
>  drivers/iio/accel/adxl345_core.c | 28 ++++++++++++++++++++++------
>  1 file changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
> index 78e3f799ecc1..dfe3169ffc5f 100644
> --- a/drivers/iio/accel/adxl345_core.c
> +++ b/drivers/iio/accel/adxl345_core.c
> @@ -212,7 +212,8 @@ static const struct iio_event_spec adxl345_events[] = {
>  		.type = IIO_EV_TYPE_MAG,
>  		.dir = IIO_EV_DIR_RISING,
>  		.mask_shared_by_type =
> -			BIT(IIO_EV_INFO_ENABLE) |
> +			BIT(IIO_EV_INFO_ENABLE)	|
> +			BIT(IIO_EV_INFO_SCALE)	|
>  			BIT(IIO_EV_INFO_VALUE),

Would be nice to be consistent and put scale after value as the ones
at the end.

>  	},
>  	{
> @@ -221,6 +222,7 @@ static const struct iio_event_spec adxl345_events[] = {
>  		.dir = IIO_EV_DIR_RISING,
>  		.mask_shared_by_type =
>  			BIT(IIO_EV_INFO_ENABLE) |
> +			BIT(IIO_EV_INFO_SCALE)	|
>  			BIT(IIO_EV_INFO_VALUE),
>  	},
>  	{
> @@ -228,15 +230,19 @@ static const struct iio_event_spec adxl345_events[] = {
>  		.type = IIO_EV_TYPE_GESTURE,
>  		.dir = IIO_EV_DIR_SINGLETAP,
>  		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
> -		.mask_shared_by_type = BIT(IIO_EV_INFO_VALUE) |
> +		.mask_shared_by_type =
> +			BIT(IIO_EV_INFO_VALUE)	|
> +			BIT(IIO_EV_INFO_SCALE)	|

What is the units for gesture that we are scaling to?

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
> +			BIT(IIO_EV_INFO_RESET_TIMEOUT)	|
> +			BIT(IIO_EV_INFO_SCALE)		|

There is no value here, so scale doesn't make sense (plus it is gesture
as above.

>  			BIT(IIO_EV_INFO_TAP2_MIN_DELAY),
>  	},
>  };
> @@ -274,7 +280,8 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
>  		.dir = IIO_EV_DIR_FALLING,
>  		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
>  		.mask_shared_by_type =
> -			BIT(IIO_EV_INFO_VALUE) |
> +			BIT(IIO_EV_INFO_VALUE)	|
> +			BIT(IIO_EV_INFO_SCALE)	|
>  			BIT(IIO_EV_INFO_PERIOD),
>  	},
>  	{
> @@ -283,7 +290,8 @@ static const struct iio_event_spec adxl345_fake_chan_events[] = {
>  		.dir = IIO_EV_DIR_FALLING,
>  		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
>  		.mask_shared_by_type =
> -			BIT(IIO_EV_INFO_VALUE) |
> +			BIT(IIO_EV_INFO_VALUE)	|
> +			BIT(IIO_EV_INFO_SCALE)	|
>  			BIT(IIO_EV_INFO_PERIOD),
>  	},
>  };
> @@ -1367,6 +1375,14 @@ static int adxl345_read_event_value(struct iio_dev *indio_dev,
>  				return ret;
>  			*val = sign_extend32(tap_threshold, 7);
>  			return IIO_VAL_INT;
> +		case IIO_EV_INFO_SCALE:
> +			/*
> +			 * The event threshold LSB is fixed at 62.5 mg/LSB
> +			 * 0.0625 * 9.80665 = 0.612915625 m/s^2
> +			 */
> +			*val = 0;
> +			*val2 = 612915;
> +			return IIO_VAL_INT_PLUS_MICRO;
>  		case IIO_EV_INFO_TIMEOUT:
>  			*val = st->tap_duration_us;
>  			*val2 = MICRO;

