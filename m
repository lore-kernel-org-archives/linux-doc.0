Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292813DBD4F
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 21:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775857134; cv=none; b=s+jk6OpxaM8ZNrEyGtDq2vrGIjYMnxy/X6gRMnsEE8ot+cXNkDI2hQIRLmAZoyXlhZFt4pYWMadYyt08CjoP2qgozNFKsVX7dxcOabmX8tkPUJmydB7UskMqjmy75VZnreC7yuup839+4JBGXcJImDMRno0DW4Xah7qsXRifPSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775857134; c=relaxed/simple;
	bh=AfxJCGuDwawedT7P4I/1sW7q39LqQw75gWL8s0+dAh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uyYI6N+UsdIenoWFCanvxPPYyfk3d7O4AFx+O+2vutaidtY60hrfWrceNr6nwIHrbOox9OxsLYacKurKt7+ZhoPbeEnBUxWbnT1kIm1ZK5loCrs2CfhpCswH5ZEx/KfbxaALKL1p6eMBfBUgDuCKMJYsNpTXJy+4ZMGEqlqPphU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=rowVptpZ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="rowVptpZ"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbff06e4a6so2398589a34.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 14:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775857130; x=1776461930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaFyqgC3R1GXm84D3GWzj8iqNT7a1oUcf/2QMWQlMeg=;
        b=rowVptpZ9UsLOgQik7lVyrdF6+0eY2gPqRnhkmcgu/6QsD99GYfkanNJsi2AKSIXD7
         88VqicmttTOrzlAWUidS213yc6pY8yVX8IksXXJQ3MYkEiGEiZxWpWQQecHNXXjq9/8C
         XZBGam90Cs62hlon1Ih5+sHpbdvigOtZMFLQXkSKX5xAlW7TuzoCZrozGYqMXrQCviuS
         79MPxY9ZkNpiu+PCEM6l4cEMO7buD0M6ZhQAqacUbbm57Nm5P50QuZBouVuGBMjAthKW
         eXNJ8GQEDbGefxYshH/1nBwLSFEoxuM+api7VjUBUmFZOgZdYjmBL9UPCFLvTpfkGy6T
         ctRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775857130; x=1776461930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaFyqgC3R1GXm84D3GWzj8iqNT7a1oUcf/2QMWQlMeg=;
        b=D3SWOmX7uDgnE0pftDZ4rA+QnTvpTiAZ1rNM2l+Se45LYzra/n8DgYku+Im7GgCYr2
         mO9+24O14PyZfijohHSbvQqwC38NBmSN6IFuF1wkOCYyaXBVkHpCVAT7T79FCerbA0hn
         dHqyM2vvJhOksP8fk7NKi4LJ2x0YCDRTuPHpSwBgzN3DPi5AmXl0qpRKfUO48Iq6o0Xd
         TPSGw5pBp1+aDYd79+ttPdjz5GGtKtGBW2H+kP34fEYYvU+vl70E5grGNIhfn1FUvUxR
         WRIZWtWOeuWn9QClW7Hs39csjk8+TsaKgLgvzkMPSkvM1zYLtc5rsJMNKxMbNV8WwI2I
         Htag==
X-Forwarded-Encrypted: i=1; AJvYcCXcLLY1xTqBA+ZRmN7zOIXCCuVP6JiMfgJH/KIpY5CKrdyVnhbuPc9zZu4x49FSHq/XQzKrG60NGiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNbfgfSgYK/ShSozyg3UuvkawCXwnNJlWia8VoZSAkltx7vLEi
	dCTx0fn96OEc3Cl9IjA9cXXfKksFVGIJj3Pr7bJghiYSJ4h9uUzgKAwmmsvQK4NN17g=
X-Gm-Gg: AeBDietGGlrN1RVpvr3mQ94VX47PpzoK/IDEJdDMkpGz18Rvj6chB9i3RS7Fgvx86dy
	f5FaIImN8SnGaXbcQcropiVYSRUKJSxoLEerQ5xOF4FzJiG/Zrq1JIAcCKSY56f+/AEY/2mPFZH
	ijSuiePjmRRYASBfAGMGks4qGbvl+AobdFtEN60t+6Zs6P5HwclXkzgvldnn5+D6/gcMU8S9XKM
	XhQ2BdrX1kUPvhBwUKGMCdtk6VZv+/gDcqhUZce+69yJJhacRM3RNpO2t2x0lpxhFc7Eu953n3E
	n5/u2SZNDBnrd8zxziWFQCH9KJENIo3DzHH3tfC8WTCD1GQ92LP5Saj7UHA2N9177ieoUKRsg9s
	WtaqnDIhO4uwEQA+7HsBtbUYWvGrPK6m49EXgJtRMBfPqLm+iZw86FHsq+slTG2UbU61Ir5EGKv
	Y4PudkNBuhhPkyVh3ze3X5PAulKXecGZ41qACIdJBbmOFjXwDb/bVJhyRqJelAl2J1CBSxW2cDL
	g==
X-Received: by 2002:a05:6830:498b:b0:7d7:f617:3573 with SMTP id 46e09a7af769-7dc27cbf49bmr3103286a34.10.1775857130046;
        Fri, 10 Apr 2026 14:38:50 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:b75d:2440:dc10:808b? ([2600:8803:e7e4:500:b75d:2440:dc10:808b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc26941b7esm2736484a34.19.2026.04.10.14.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:38:49 -0700 (PDT)
Message-ID: <9c36ee85-12da-41e8-b9ab-e32b7ec29e75@baylibre.com>
Date: Fri, 10 Apr 2026 16:38:48 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] docs: iio: adc: ad4691: add driver documentation
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260409-ad4692-multichannel-sar-adc-driver-v7-0-be375d4df2c5@analog.com>
 <20260409-ad4692-multichannel-sar-adc-driver-v7-6-be375d4df2c5@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260409-ad4692-multichannel-sar-adc-driver-v7-6-be375d4df2c5@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/26 10:28 AM, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
> 
> Add RST documentation for the AD4691 family ADC driver covering
> supported devices, IIO channels, operating modes, oversampling,
> reference voltage, LDO supply, reset, GP pins, SPI offload support,
> and buffer data format.
> 
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
>  Documentation/iio/ad4691.rst | 283 +++++++++++++++++++++++++++++++++++++++++++
>  Documentation/iio/index.rst  |   1 +
>  MAINTAINERS                  |   1 +
>  3 files changed, 285 insertions(+)
> 
> diff --git a/Documentation/iio/ad4691.rst b/Documentation/iio/ad4691.rst
> new file mode 100644
> index 000000000000..a1012c8b78a3
> --- /dev/null
> +++ b/Documentation/iio/ad4691.rst
> @@ -0,0 +1,283 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=============
> +AD4691 driver
> +=============


One overall comment. This goes into driver implementation details quite a bit.
I think that is really better done as comments in the driver itself. And this
document should just focus on how to use the driver from the userspace point
of view.


> +Buffer data format
> +==================
> +
> +The IIO buffer data format (``in_voltageN_type``) is the same across all
> +paths: 16-bit unsigned big-endian samples with no shift.
> +
> ++-------------------------+-------------+----------+-------+
> +| Path                    | storagebits | realbits | shift |
> ++=========================+=============+==========+=======+
> +| Triggered buffer        | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+
> +| CNV Burst offload (DMA) | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+
> +| Manual offload (DMA)    | 16          | 16       | 0     |
> ++-------------------------+-------------+----------+-------+

Not sure this table is helpful since all values are the same everywhere.

Also, doesn't SPI offload have storagebits == 32?

> +
> +In the triggered-buffer path the SPI rx_buf for each transfer points directly
> +into the scan buffer, so the 16-bit big-endian result is written in place with
> +no additional copying.
> +

