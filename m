Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7FA384243
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 22:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772664946; cv=none; b=plfXRJa0lQQn4j+efagYqko+M97w5JDKKnHnYqQ+EBON4UQF3h857WPp9AQ+QIYz8lo+l+q7arikvh7mIFE5Nld2XT9sYcf4qmge+vDbDYHqccJwRny9ISlzqy0s32oh51hlySBXiyRWUcGDAsY6PNqudXuMvANbDo4xXnPQ9nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772664946; c=relaxed/simple;
	bh=8qlyvD5XDfMUAA6zmyrKLG7QhURU+8uccRHuRSqHzuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ApZIbwLefepiLUcdSFhaTVAdPWobFe9+DfO9MZ19Amh362bpLQQ8iJke+8GW1ZUNKLRq2+iVtb1bt7ZrlYHkJ0VQYHUXKvoW/7i1flmB+ZeyR3yY+Onqk8RdoNt9YijR9gnk6/A9oDlZ/AErfE6KstM5QHGesmEaydpcXtp4Chs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=a5TzMh1M; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="a5TzMh1M"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-46391f4c1f9so4744267b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772664943; x=1773269743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+2Q2TnBwC+gC1aFFNGwdS5pgVGKEvldXr6mdw0p25I=;
        b=a5TzMh1MBq5u/CaN3n7JZhnOAT/X4ZN2iUvlI6f+yxC43num+y1D3q7cDm5Liayqzi
         vWs+IuXATZdPGQnXtQYH5w/Si9mDm/zGBoJR0R/7FAA2QoiVnidoOvIW22fMS4zmgdLj
         wuhjNuOyPLrtbvw1G2z+tHyePr6lCR/DeYePzRizsUd+vLRixgwfBlF9iN317jhtglbQ
         wDMPF4KGbHrd0YCdeA8xt3sHXHW5WPi5a/iOp0qG+5ME0GNvii8QwH1RFpv4pFYss6Uq
         3tNiwDGT7fNpmCfhPcGDvFHNk2XeKZaVzVkHQqO7XdadFCYyVUzpvsNkeRwquglb6v4l
         2DQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664943; x=1773269743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+2Q2TnBwC+gC1aFFNGwdS5pgVGKEvldXr6mdw0p25I=;
        b=F9hjOcHW2S3d2FKgvitL1KKchxsVUJiDW+ZlW+WwDr0AWxTO72+1vt/3C5NY8vd+UC
         AXrMeVYuJScdWu2busXOBHP4I/QFb9W18czsoiLxd30pAqPJwob7zr6PGNNFI3aV0D7e
         usZ34RO3bYBPwp78BpD4dEK6dI0RwSK3kzMmzUQu7xebmhNSmdyGDZGx7rrCRcx4sjtT
         /7OpEEjrUixBAS6Jjpp/MK+2aR+jTka/wv1X0ntTYWDHque+UDIskJ49sJ1y9sNoKcNo
         TsbCBeF7yzVei0Sd5zn1uQ2PADhJbc4Qsj6YNd/ldq1S9CuAxqiOLL5h1ww+a+v0kreO
         i1sw==
X-Forwarded-Encrypted: i=1; AJvYcCUShlwe2paS6WmtfxDpahRDOULWmRpVU9qBFT6RbAUtqOO2kJo88tNk+BDEFRFb3KYUDnr4RjXSN0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5guqgxf7i6Z0qAhYQU6WXh6PsLTWafh6BCnN/S9gRXUlx/I3R
	TcsuRjKYgQ+tdtlAUOkYrQNWw7JUgeVTxYtlaE/RkTBvwBmg9NqNlnFF4PCxDkLC1CQ=
X-Gm-Gg: ATEYQzwECErcTpn3onHdy69P1PH1S2hvItZxGic2befIoGQnW7lyVrk8y0orEH0sd2A
	pcWpByJSgoGSA2WTRG1p1AA/tDbXPE05aC++5CP2ROhOPohmAVagik9G1/+kfdmpH7XkYCARZi5
	E7vXEf2jFdG7yJ+/QmUBJuucSEynsc3lZUMvNHg40w1ZnRjb0V6TZN8e+nxqbYHoX4/69XujdZC
	QnOpD30gvU+kXwgvMvBK/c2Iyn8qgE7vBtmJlrFAr0R2wvZooqyu5cBNqousOva5QwV1VK+q6mJ
	Pjl1P3Gz3Dj2yvA7AbMJeh9msnROk/ElWVXV1ZLIU0QUOY7owJSwSDdBVUuST+1M+Rae0Njkz93
	PVxElq1vDokqk14aquLGRLX9qdPOI3H9OSLv0n9cikKGCUr70/KjJiBrSSQh0uin7GUDFtLoKjT
	jljcQaf5KFvYNeAJR05ROQTFShpTwL/7WwbeyY+8BB2JVzUB9SoT3ZAl0yUOv8FFfH1gZWAgAcl
	OnmUrVT3B5A
X-Received: by 2002:a05:6808:1693:b0:45e:e07d:4eff with SMTP id 5614622812f47-4651ab996camr1955205b6e.21.1772664943498;
        Wed, 04 Mar 2026 14:55:43 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:d719:8353:352f:b2e0? ([2600:8803:e7e4:500:d719:8353:352f:b2e0])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5e0b64sm12432933b6e.15.2026.03.04.14.55.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 14:55:43 -0800 (PST)
Message-ID: <2110d3be-b55d-4b39-a8f4-ebf1312ada96@baylibre.com>
Date: Wed, 4 Mar 2026 16:55:42 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/6] iio: Replace 'sign' field with union in struct
 iio_scan_type
To: Francesco Lavra <flavra@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
References: <20260304080519.2844101-1-flavra@baylibre.com>
 <20260304080640.2844366-1-flavra@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260304080640.2844366-1-flavra@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/4/26 2:06 AM, Francesco Lavra wrote:
> This field is used to differentiate between signed and unsigned integers.
> A following commit will extend its use in order to add support for non-
> integer scan elements; therefore, replace it with a union that contains a
> more generic 'format' field. This union will be dropped when all drivers
> are changed to use the format field.
> 
> Signed-off-by: Francesco Lavra <flavra@baylibre.com>
> ---
>  Documentation/driver-api/iio/buffers.rst | 4 ++--
>  include/linux/iio/iio.h                  | 7 +++++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/driver-api/iio/buffers.rst b/Documentation/driver-api/iio/buffers.rst
> index 63f364e862d1..f36e6d00173f 100644
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
> +		           .format = 's',
>  			   .realbits = 12,
>  			   .storagebits = 16,
>  			   .shift = 4,
> diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
> index a9ecff191bd9..61f1dfc14e02 100644
> --- a/include/linux/iio/iio.h
> +++ b/include/linux/iio/iio.h
> @@ -178,7 +178,7 @@ struct iio_event_spec {
>  
>  /**
>   * struct iio_scan_type - specification for channel data format in buffer
> - * @sign:		's' or 'u' to specify signed or unsigned
> + * @format:		(signed or unsigned) integer, or floating point

We should keep the list of valid values here.

>   * @realbits:		Number of valid bits of data
>   * @storagebits:	Realbits + padding
>   * @shift:		Shift right by this before masking out realbits.
> @@ -189,7 +189,10 @@ struct iio_event_spec {
>   * @endianness:		little or big endian
>   */
>  struct iio_scan_type {
> -	char	sign;
> +	union {
> +		char sign;
> +		char format;

Could add some comments here to say that format should be used
in new code and sign will be removed eventually.

> +	};
>  	u8	realbits;
>  	u8	storagebits;
>  	u8	shift;

