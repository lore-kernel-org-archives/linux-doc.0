Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322072874E4
	for <linux-doc@vger.kernel.org>; Sun,  1 Feb 2026 19:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769973238; cv=none; b=RFwgGg2y3+zwt778Z925NNCBoGgOoEPFxcJa/VnqC9bNHe+Twp33XPiXCxZzTlsnJ0q955aOMm1vcGrcAGpehJJOomjkuouzN8pfRBJs6Brk7K7NMqY5G7x3CuDDH6rWeK63KS5aitD2UpfEKt3nJorYYtFx3S1o8iAeRQe6CgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769973238; c=relaxed/simple;
	bh=LMDeSbQEzE960rQ43ZlJPj8QobL2TtSDuGRpOwr5CQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ca0fFxuRxWTcNerD2tAWo9PhsTEIEz7Q2FaFp69VCb5/q+N6DIpmqidM/59Zj6X4Od9Ux5tDFO0sdEACnhoIH4tdkaX4tbv6Mj/UtGSPjDJLFwbDlz6OKW/2uED2SrpQHyju21qUviI1q6FBEtAyRzHV1DQKQjv1qm+n/pNNmoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m471btIH; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m471btIH"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7cfdf0c8908so2331764a34.0
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 11:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769973234; x=1770578034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SkDk2sKu2hL/PPwbaE144JaTsQSL8ycHjDsHXoFklA=;
        b=m471btIHLDq5YxCFIotgejvGFRN4+s7brjKXJe+0hHuYakLIR7xZMh1gwoA7lrxtMI
         K5pi848nCqul7sEgwKXnQoM0CHq7r4FnMj3opSjTdIhdBO7KxClgqIiZUOwaP6CJ3qJ0
         kGR4QGy8sa+x2mvd2Mj58+c5tBPY2v1z2SCVXs6+0HCOd1ChceLKd/yqzQ4yYK9vpoeK
         PcC07/DDfg5rkpWDzTqThU73BgX/T8asGK2ncb94soCOj4gP736Or/3HRxl6U2NqcuQ+
         rkNK924JoB2pe/aW3M01H1UqNNVoCt0MiOcoTD9nCHcgeYaB4yPoHzfwx6GS5gdEZR0F
         gB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769973234; x=1770578034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SkDk2sKu2hL/PPwbaE144JaTsQSL8ycHjDsHXoFklA=;
        b=kvh6GwLfDwwEe4jiMi2m/FeqQ6cRdvYxD+fd8HVKxV7koseuQZpGrLDcGGayMHSsRx
         o7burpZjwKTqwN/KdmGmHQuUG0kCOcmy+OmYmipCVVgESbsqx2YJP2gqG4PtF8WCjKz9
         ut9KJQv2J4mO2iLcCVYfatP4KoL5f1DFx/b3EjWLu4qdeVIOMkfDpzls1JQUDH7Eb44G
         2GpFWamWj7xnhuBFnuZhh0hu0TOK6VaUmIQ280M6fWR9eRjB6J+GhPG5WXcMqjQMn27D
         A8Q0B7fXERO4Wg/1v13bxyKYdlIV3rqLWv/dTyehG7lNh8nJI0mc+DgLa+AP0bsjl8A6
         fIYg==
X-Forwarded-Encrypted: i=1; AJvYcCUgTrNUihr9A3sbf5TmCGGAd2ZH/cKPj8GcJ3SVlz/kWmF+NX/hh3kvXKhWuQ0K21PZVDVp9dIcN30=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXag/qfRAWMXkmL5jRZxGP47bqf5wITnsnN1kvaBShUGz9rnGz
	v0SElBaIP6Yv1lYsstb3xdd5jBZ2+kH6TL0++drXjOIIhAgt8DbCCG/bDuWowp3JMFw=
X-Gm-Gg: AZuq6aJlI+UzFdnz9FMy7eHukXDPQPBAoUaot850o1tScge2ZaFrHEBAC2OhCziod4b
	ZrYZrOp2iQHVq7LxrydbBKZub/u0ECwNn4mUTzSbtqSJNgWnyTA9AC+vb1dkt+ZYO/Te8HpclEk
	tHqz3uggfy4EREcYzxMtDV0wOE5hWPQMb4mCd6SvRN0Vj4U1c/Pm3bup2clJNhthsD9UaCk+EX6
	je9ilMPOOxr5M3/5eXBDtrIwnZGfUimeX+FiiZJEYR16zFMY+jTq5mvev7BL0fphpbWzOAJDmpc
	nX0gG+02t6bwrCLtpJPDAytbbPA44Jz9Rtpee2IYwGeU5xvVx1M2FPeUc33PtpAqz7gaT0+o4F1
	5A4a69SZ1732dSwKmwTTa/Bx876q+ICFa/uTLunhtJNfTtsgkwtjnqnZlMdA1yba0bW7e9KLl2E
	kb/NLRijGECL4lM91WNDsi1QaU6uxqELZP36VEm345rjl1BJEI6e4+mBClOh8i
X-Received: by 2002:a05:6830:6811:b0:7c7:59a1:48d7 with SMTP id 46e09a7af769-7d1a5233607mr5007579a34.2.1769973234082;
        Sun, 01 Feb 2026 11:13:54 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:66ee:10f7:4858:7df6? ([2600:8803:e7e4:500:66ee:10f7:4858:7df6])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c6708e1sm9496319a34.5.2026.02.01.11.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Feb 2026 11:13:53 -0800 (PST)
Message-ID: <8e46ce3c-41b4-4a6c-9b1c-a9ab56814d1a@baylibre.com>
Date: Sun, 1 Feb 2026 13:13:51 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] docs: iio: adxl345: update math and examples for
 scaling
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, jic23@kernel.org
Cc: me@brighamcampbell.com, skhan@linuxfoundation.org,
 linux-kernel-mentees-archive@lists.linuxfoundation.org,
 rdunlap@infradead.org, nuno.sa@analog.com, andy@kernel.org, corbet@lwn.net,
 lars@metafoo.de, Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260201183320.27023-1-0rayn.dev@gmail.com>
 <20260201183320.27023-5-0rayn.dev@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260201183320.27023-5-0rayn.dev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2/1/26 12:33 PM, Taha Ed-Dafili wrote:
> Update the documentation to reflect the addition of event scaling
> and correct existing technical errors inscale values.

s/inscale/in scale/

> 
> key changes:
> - Fix the 62.5 g/LSB typo to 62.5 mg/LSB and add SI unit conversion.
> - Correct decimal precision of in_accel_scale and
> in_accel_scale_available to match actual SI unit (m/s^2)
> values reported by the driver.
> - Add sysfs example showing how to read and interpret the
> newly implemented event scale factor.
> 
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
> ---
>  Documentation/iio/adxl345.rst | 41 +++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/iio/adxl345.rst b/Documentation/iio/adxl345.rst
> index 41d209a4dccf..2f51a2a4fbd0 100644
> --- a/Documentation/iio/adxl345.rst
> +++ b/Documentation/iio/adxl345.rst
> @@ -13,7 +13,11 @@ This driver supports Analog Device's ADXL345/375 on SPI/I2C bus.
>  * `ADXL375 <https://www.analog.com/ADXL375>`_
>  
>  The ADXL345 is a general-purpose, low-power, 3-axis accelerometer with selectable
> -measurement ranges. The ADXL345 supports the ±2 g, ±4 g, ±8 g, and ±16 g ranges.
> +measurement ranges. The ADXL345 supports the following ranges:
> +- ±2g  (approx. ±19.61 m/s^2)
> +- ±4g  (approx. ±39.23 m/s^2)
> +- ±8g  (approx. ±78.45 m/s^2)
> +- ±16g (approx. ±156.91 m/s^2)
>  
>  2. Device Attributes
>  ====================
> @@ -98,23 +102,28 @@ listed.
>  +---------------------------------------------+---------------------------------------------+
>  | in_accel_gesture_singletap_timeout          | Single tap duration in [us]                 |
>  +---------------------------------------------+---------------------------------------------+
> -| in_accel_gesture_singletap_value            | Single tap threshold value in 62.5/LSB      |
> +| in_accel_gesture_singletap_value            | Single tap threshold value in               |
> +|                                             | 0.612915 m/s^2/LSB                          |
>  +---------------------------------------------+---------------------------------------------+
>  | in_accel_mag_falling_period                 | Inactivity time in seconds                  |
>  +---------------------------------------------+---------------------------------------------+
> -| in_accel_mag_falling_value                  | Inactivity threshold value in 62.5/LSB      |
> +| in_accel_mag_falling_value                  | Inactivity threshold value in               |
> +|                                             | 0.612915 m/s^2/LSB                          |
>  +---------------------------------------------+---------------------------------------------+
>  | in_accel_mag_adaptive_rising_en             | Enable AC coupled activity on X axis        |
>  +---------------------------------------------+---------------------------------------------+
>  | in_accel_mag_adaptive_falling_period        | AC coupled inactivity time in seconds       |
>  +---------------------------------------------+---------------------------------------------+
> -| in_accel_mag_adaptive_falling_value         | AC coupled inactivity threshold in 62.5/LSB |
> +| in_accel_mag_adaptive_falling_value         | AC coupled inactivity threshold in          |
> +|                                             | 0.612915 m/s^2/LSB                          |
>  +---------------------------------------------+---------------------------------------------+
> -| in_accel_mag_adaptive_rising_value          | AC coupled activity threshold in 62.5/LSB   |
> +| in_accel_mag_adaptive_rising_value          | AC coupled activity threshold in            |
> +|                                             | 0.612915 m/s^2/LSB                          |
>  +---------------------------------------------+---------------------------------------------+
>  | in_accel_mag_rising_en                      | Enable activity detection on X axis         |
>  +---------------------------------------------+---------------------------------------------+
> -| in_accel_mag_rising_value                   | Activity threshold value in 62.5/LSB        |
> +| in_accel_mag_rising_value                   | Activity threshold value in                 |
> +|                                             | 0.612915 m/s^2/LSB                          |
>  +---------------------------------------------+---------------------------------------------+
>  | in_accel_x_gesture_singletap_en             | Enable single tap detection on X axis       |
>  +---------------------------------------------+---------------------------------------------+

Why not also adding the new in_accel_*_scale attributes to the table?
