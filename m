Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872B3537F7
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 22:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664339; cv=none; b=nBIkRxWXzHmpsapXXZBQLRjHSQdhKIHTlfU95iiYs8o6MTKOOlei1RkbxtWoITMCZM/a7sokGn40nDiXJ3drHNvjgM9G+ggEezKz248a8COxs3NpAt6atlzSVTbF5t7bucVykIdka2aswCX48D9lA2rt5mAyu7FIImN7mJdAyyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664339; c=relaxed/simple;
	bh=8y0AY7pdxF3ZXmno3d6a1Z5FLbl7EiDCsNEdPAYxEaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m32FxyclNOAeBK8BInPimwLoPDNFsXAdTN0Kb8GyOkBWmBnePxfrHcbPJ4T3UVs5TcP9/MxgYHFPOzQnjqScR7qHSo5/tf8QMBLyrbknG+TYQ0XFrWlc8YQlSedhWL4HgeLKIMMldj3x7q1jOmoRLz3INwJQh80kRAeK5bZxbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=2B9LJhDG; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="2B9LJhDG"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6726f320b54so4296471eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 14:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772664337; x=1773269137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zoM9auab0e4iB9I2DJCod95IuvSIckvHaF9+CeqFu54=;
        b=2B9LJhDGgt6X+2BIjREDLxJWz6cud0LC5cmM9CLWENS31rZEZmH38Pm60H6AY5cU10
         SooEd6MQcakVsCMUpWqFrOo8N9bs4/HkkBuV88Ddele2nHXqJjwO9pAtnFzIb7gTVyQl
         KenJiDQutwP5DB11ua6qpt+x9YaypR3ONBtk3kJ5KWuVT5SR5YndRsBnoX3qdmEYBv7t
         CLaC/h6od5yT+YZ29hcrd51NieXPjO25OtTeTt01hPXUPW6nqxggqfgyEE+dqiNI+jhk
         EB3bnKVYWZ3sGXkB0xJZjNOeHS/uEDnyfEONTcjfEi11Nl6JOY5qh6RL4ijdvxOu8Lg0
         YHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664337; x=1773269137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoM9auab0e4iB9I2DJCod95IuvSIckvHaF9+CeqFu54=;
        b=e7esGH4s11FBj65og8oQ2iXjzSj1FtFrKMaHC7dlztwUflfBLOj0BPZeeR+/byM+lS
         zgQEJgM5VPDrhj5miYsVo802kI6JZ+W3Wz1PN9bKgFbguq+GPWhS5W4XjqQ1FgEutM55
         wHBtsg9RU4dDnOnXuP9dNgyrh2otPyKmzPxJFxK0J7Uwi7bkN1art4IgDp1VUYbhgHtd
         6Cb0lmjNCO7mHQYavIAgxb02uC0Jm7RsqnRcpLO+u6YKoOTbxNgqgO8zWRLVlOGpTOWr
         YR0qcPd8brp/qUI/Euy01U/YUCLgEKdaP7mdJAd2ri45nyFazf81iHyoSdxy4cqZt2dH
         uDvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAffgs5QdpmGsmWVihZ9SZz8ME0Gbx+vYPy+5RhlR4GrLQ7epGG60FjyF3Fe4JAoYHKHBTKYYd4uo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9PqgAbp9FeJT8PsFz5Y0TYJI8kwytW42eAsadqeibFF/RP7h
	LF8ej7l0b/DbnhYoRHX3jRXLrbWBxX5DNYh84NajDJMKW94Kor0BM8sLJfMt8HJwTao=
X-Gm-Gg: ATEYQzyn3YwGOYrnWNCFFhebFlxXXAVu1nnF+KONTkO0XbaVL8CgrpYb8vXqvqktegb
	WPnEsU55SLlDfIP+2D9fnLYCG6V+rBU7eHLGh25aHHnIEJVEkFcN+iXvqrw7pkAtWsrEkGEyJMX
	SAB7HVVQy+5awHrfVNNoBqG/wOJenvyK6DCFk9tY3MrTILK8Zt1NNa/JzUQm4SVLErXy6J+Y/wN
	6hHhjIe1opEGPIYTyTrw7GdKxfm2Ubpjpw7QWEZ3xZdI1aionL9DzQEgfRztj4PopILYFUhehp+
	IQuOb38HuhtpdgRMm0LpF4V/yk5FUZ85ccfR9psZOpSozojNxaiKvIH/2zrb05V8QWc7Jah0Gfl
	B941noZXqVOVMLNkOGon34+sNqHjnrY1WXRhQ+GN/QTmyTr4Rr7QGlVF8hzVCYrOStroOjF1hbr
	YOLy2dTRyKMedq6Ot81W90m0U2Ffxy69ijeVWnuCISYz4u3IyhnExOsK08cjcqUCIYnSzqv4yCt
	w==
X-Received: by 2002:a05:6820:987:b0:679:e59a:8b8c with SMTP id 006d021491bc7-67b176f9d8dmr2082246eaf.26.1772664337436;
        Wed, 04 Mar 2026 14:45:37 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d719:8353:352f:b2e0? ([2600:8803:e7e4:500:d719:8353:352f:b2e0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d84dacsm13903905eaf.9.2026.03.04.14.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 14:45:37 -0800 (PST)
Message-ID: <70f25902-5c79-46f9-8c67-99633b22b5ac@baylibre.com>
Date: Wed, 4 Mar 2026 16:45:36 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] iio: ABI: Add support for floating-point numbers
 in buffer scan elements
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Cameron
 <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260304080519.2844101-1-flavra@baylibre.com>
 <20260304080658.2844434-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260304080658.2844434-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/26 2:06 AM, Francesco Lavra wrote:
> In the data storage description of a scan element, the first character
> after the colon can have the values 's' and 'u' to specify signed and
> unsigned integers, respectively.
> Add 'f' as an allowed value to specify floating-point numbers formatted
> according to the IEEE 754 standard.
> 
...

> diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
> index f36e6d00173f..2fc9c2951a9d 100644
> --- a/Documentation/driver-api/iio/buffers.rst
> +++ b/Documentation/driver-api/iio/buffers.rst
> @@ -37,9 +37,10 @@ directory contains attributes of the following form:
>  * :file:`index`, the scan_index of the channel.
>  * :file:`type`, description of the scan element data storage within the buffer
>    and hence the form in which it is read from user space.
> -  Format is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift] .
> +  Format is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift] .
>  
>    * *be* or *le*, specifies big or little endian.
> +  * *f*, specifies if floating-point.
>    * *s* or *u*, specifies if signed (2's complement) or unsigned.

I would keep all of the format options on one bullet point.

>    * *bits*, is the number of valid data bits.
>    * *storagebits*, is the number of bits (after padding) that it occupies in the
> diff --git a/Documentation/iio/iio_devbuf.rst b/Documentation/iio/iio_devbuf.rst
> index dca1f0200b0d..e91730fa3cea 100644
> --- a/Documentation/iio/iio_devbuf.rst
> +++ b/Documentation/iio/iio_devbuf.rst
> @@ -83,9 +83,10 @@ and the relevant _type attributes to establish the data storage format.
>  
>  Read-only attribute containing the description of the scan element data storage
>  within the buffer and hence the form in which it is read from userspace. Format
> -is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift], where:
> +is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift], where:
>  
>  - **be** or **le** specifies big or little-endian.
> +- **f** specifies if floating-point.
>  - **s** or **u** specifies if signed (2's complement) or unsigned.

same here

>  - **bits** is the number of valid data bits.
>  - **storagebits** is the number of bits (after padding) that it occupies in the

