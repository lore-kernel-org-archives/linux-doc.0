Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC4175A71
	for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 17:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774113765; cv=none; b=TmySB+WnuIVlKPweTubbsRvLQ0viIORpMbB4UddSBANEhXq9+DqE33rMBp5OwEsdUN42H3jbXdJ5CRxIDH7PBIULtKUpzMGEJ++Z6D4816XrY8uVnqAn7/sOhTOG2kp0YijTGAsvW+QKZiV6LO9MDLpx/KP92GjTFPe9GaxnabI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774113765; c=relaxed/simple;
	bh=o6x5gDlBMI1vC6r0hnZwOnzYq29prUryz8UCnxNewFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JZ8tAhvUymXBl6GBiOJo9OhiOoQilqXhb55pJruPRWtaujVhhALz2ZzruA/toqPpnVQ+oIJVgPHueBsPxWR5bdtxye8560dvOkxvf7PFZIn0PW821flTTtaU+wyw72Dxu+HASyUfOywcXqbcBprFld2aND9EbWfKAClAe8P57BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=I0T480FL; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="I0T480FL"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-417c34b0509so1946078fac.1
        for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774113761; x=1774718561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w7pwaIFO7HCZbp0oT8plX1bmKBkO4yMl+IaxIvVYW04=;
        b=I0T480FLKryAir4/TTYR3F3OoAjxtPwD8G7gO5jn/vRzBXkT2lKA+NoDs5wCQnkIsA
         76WEQrvrKqoRFiqIqsfhQFiv9TbR+kTTXMcidStv47Cz5gHF+ZRYpwTiIoAAaR7aBSK6
         MCcL9tRs+/UyFYbQ0TcaMmOzW6yKusO2KO2vj4N7mNuXmqOXNwsuNb1LAJ4j7iQhfWFe
         EimhGNGSYzkh6+Gf6np+hiGMVYRSRQwzmWs8lwOGzOmPTbqhOBYf4Be0+FrmHMDbQ8LB
         tcdUKZcHCYFGwEkTBwbT/NDswf6D+6In156zj/GC5gMY9h7QmrMz8PsnPjvuvTCkO0gJ
         0Byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774113761; x=1774718561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w7pwaIFO7HCZbp0oT8plX1bmKBkO4yMl+IaxIvVYW04=;
        b=CjOSuJ1z3hC42vTggCk9MWzKmmMf8kDzWtaNK2p+8ZwVyYFIfFkUF4UYCN9L3R1b+n
         D1RYWDDCJBfGeKVSUfJj8cKzEiuFbRsHAf38pWR/zOCBGXEQ8A2oHidChd0ewMEjWbJ5
         z2zOT3Z+wlDHMLTYTIw1pI8yTc6SIr9CB4RXO/e26dy7QCc9IYNCaxvxg5M0b/IsTQOW
         P2mGatP8IjeOSRDMOqj+I4MbcAvadqXHYE/ZBsqW9MHhWjH4BTRzWXtayn67LcgpUK34
         zWHw3ugz89sTVfF/8q79vVjKE4prt4/SUalQ69FU72oHuY3w/Gb1hoWRFf5T6ELpmCar
         aepQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYAr1rF2DCgrDuRxTEeLM0PyTv2iygQdH/bD2PlmEaQOoqc52sBu3YaYnFEenhefgNLn6MtS6OnN4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7JHpXFmuCG6YcNxk2/cOw2OSSMkelTe64fsTHpd+Ksc8nkH8C
	t6ht4NvPxhzpCGX9hHV8zBa2IjtjYBwXgMLOfvct+5l3iTxiIWQqEBdQjub6XBYUapo=
X-Gm-Gg: ATEYQzw5cKFqZJ4BTXXEE9cZlJhX5A323OwtvwS91vV5Xk3v9CsGnCidzPcMRKu6DHg
	/H50GmS9aJ6hBZZFPcj6DYDcEDdGGFtatOX/rzl26NDzB7Ucd4Bq/7u07bWjhSGEzJC0uWV+4ms
	OhpOF7U61LgLfbaJTjtXicir2gKLFsip1RGBszB1Sb6OJeq+sAqG4C1+pTO17T3miU9QVTv8NTF
	laMyj32O8TWFIBUwIsiSutjPRyGdjsXSMazF18ayF0b8rI7X+tin0gcvDEkT3aBR7N6+ZaDLh9m
	NGiuQ0XiGZrfB9o84Rrant8uDtS/XQfrbqvTzfYaAqUwMKWN26nZWiI5z8bJOavVJMgUKffIPdt
	nIuTWGLQ1nOetVm/93A9pOEysbidu/n/oxOK/0tlISPWRm5jmhSwAJs0SAjv5vqE707Jj+bvTF9
	qPr2i3ctKY0Y5WCD+veASUEroOl4wTJkdA0omRK7HrcPuK/tqg3wTn2UvlzHHgdGGDumhgl/x+i
	g==
X-Received: by 2002:a05:6870:5e13:b0:3ec:5267:cb6e with SMTP id 586e51a60fabf-41c1115940bmr4469069fac.23.1774113760854;
        Sat, 21 Mar 2026 10:22:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:8e89:f58e:e4e6:5567? ([2600:8803:e7e4:500:8e89:f58e:e4e6:5567])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41c144015fbsm5534816fac.0.2026.03.21.10.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 10:22:40 -0700 (PDT)
Message-ID: <4723284d-1e18-4a13-9ec1-878220af257e@baylibre.com>
Date: Sat, 21 Mar 2026 12:22:38 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20260317150316.3878107-1-flavra@baylibre.com>
 <20260317150401.3878294-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260317150401.3878294-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/17/26 10:04 AM, Francesco Lavra wrote:
> This field is used to differentiate between signed and unsigned integers.
> A following commit will extend its use in order to add support for non-
> integer scan elements; therefore, replace it with a union that contains a
> more generic 'format' field. This union will be dropped when all drivers
> are changed to use the format field.
> Opportunistically replace character literals with symbolic constants that
> represent the set of allowed values for the format field.
> 
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
>  Documentation/driver-api/iio/buffers.rst |  4 ++--
>  include/linux/iio/iio.h                  | 17 +++++++++++++++--
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
> index 63f364e862d1..e16abaf826fe 100644
> --- a/Documentation/driver-api/iio/buffers.rst
> +++ b/Documentation/driver-api/iio/buffers.rst
> @@ -78,7 +78,7 @@ fields in iio_chan_spec definition::
>     /* other members */
>             int scan_index
>             struct {
> -                   char sign;
> +                   char format;
>                     u8 realbits;
>                     u8 storagebits;
>                     u8 shift;
> @@ -98,7 +98,7 @@ following channel definition::
>  		   /* other stuff here */
>  		   .scan_index = 0,
>  		   .scan_type = {
> -		           .sign = 's',
> +		           .format = IIO_SCAN_FORMAT_SIGNED_INT,
>  			   .realbits = 12,
>  			   .storagebits = 16,
>  			   .shift = 4,
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index a9ecff191bd9..d48a0ab01b8d 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -176,9 +176,19 @@ struct iio_event_spec {
>  	unsigned long mask_shared_by_all;
>  };
>  
> +/*
> + * Format values in scan type
> + * @IIO_SCAN_FORMAT_SIGNED_INT: Signed integer (two's complement).
> + * @IIO_SCAN_FORMAT_UNSIGNED_INT: Unsigned integer.
> + */

We could make this proper kernel doc format with one comment per macro.

> +#define IIO_SCAN_FORMAT_SIGNED_INT	's'
> +#define IIO_SCAN_FORMAT_UNSIGNED_INT	'u'
> +
>  /**
>   * struct iio_scan_type - specification for channel data format in buffer
> - * @sign:		's' or 'u' to specify signed or unsigned
> + * @sign:		Deprecated, use @format instead.
> + * @format:		Data format, can have any of the IIO_SCAN_FORMAT_*
> + *			values.
>   * @realbits:		Number of valid bits of data
>   * @storagebits:	Realbits + padding
>   * @shift:		Shift right by this before masking out realbits.
> @@ -189,7 +199,10 @@ struct iio_event_spec {
>   * @endianness:		little or big endian
>   */
>  struct iio_scan_type {
> -	char	sign;
> +	union {
> +		char sign;
> +		char format;
> +	};
>  	u8	realbits;
>  	u8	storagebits;
>  	u8	shift;

