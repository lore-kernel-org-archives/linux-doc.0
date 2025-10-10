Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BA32F7459
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 18:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760119939; cv=none; b=P9mKgO5eLhST8qUL/m2J3KVv6oPojC/rz7QwFKKAGriK9bpGVOCh9htNBy+bjRyGm2W8dUeZtfvfuDgvg/Y3ELN2CaGLxTq81Abz6MsO+xGKM9IDTSCu79y6j7S+PGHQIyD8jajWH+UpVwIlRcBh7mEp5ojYFtR9hj5inNLCtzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760119939; c=relaxed/simple;
	bh=5sOPNs/pVYr2aEdLdYkxtrupFFKn+aERSvll06ITe7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t5SXkSj9JC0RbV6dj7eLT4taYBJo/T4l90a5U+y52SMau9eC/YnoRIrlCDnvDAG8TVjixmuKvzisz8rPiNhhqxfh8Xvd4C9YPR/V97AfWTWJAOe2ElmfstFukQ9a2kFK5LU/0HUpgKXyJilweNF7B+cGjTaeQAeRkpWPMdbfli4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PBX1mq5r; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PBX1mq5r"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7a7d79839b2so1916898a34.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 11:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760119936; x=1760724736; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJITi+/a5Uy4Ywybn43TGus/0RCOWKapqQ9K/U9rCqU=;
        b=PBX1mq5r9veqx2nhSMlcRzjG3ZXNZ9XKO0P3mfcjQjQD8uBRKof0H5usVKH1PJ1D3n
         OC1mFKC2hhXvY/jJCBYq/WHUNrKuJKcAW+r7pB3cWDJz26HdKJXPW+H9K9WY6Rhtl829
         Xgh4jNNgtgVJu0ZvwwopeQ0BzIwxAg3kTIViaickRGBjH9vTUwPhB7LfUj0eZwB2OC7L
         nDvQMJApSYJC7d3yw4qz5COMORlGmk/cQyeqGAwlbHLMPdo9Y37ym58fV2tzsaa6uNBF
         8ZuQV9N9+UlrMhHkI4IqrXYkfhYHGpwCkq4TMqGnj8UI+4jDyCKXpXFpM5BzLXVB3hNV
         nFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760119936; x=1760724736;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kJITi+/a5Uy4Ywybn43TGus/0RCOWKapqQ9K/U9rCqU=;
        b=XdqG7fUfcl5BE9uKrt20Qv3RkHXPyoRxgu0fwWExeus6HFdMQ7vFMeGooCubhTTHQH
         QNBuFzU/zh9GZ4+/82TWJdSdFQ2mrpMS9a0IxMpxgYo653cZCECHt6NYgekHm3eO+wKA
         es1Xdsw0lywDyLVDfO7hzNcSjwci0CuMFiNLHPzrXeZ3LWgoMDvXKwHj4apV4IbimHR9
         uKk8LYGeEjNIUgx0lvQrr0rpUCTwuZvCfaNA9yiaYl5JfyOV0O96rB90ISsUnl7FKSfR
         JFWru82jTDdU0lmeOjYyPYDDIRYi0RXOtwwzNgSaDUJE6gCUZcrIUSP/s9yA+V8xCHey
         CTNg==
X-Forwarded-Encrypted: i=1; AJvYcCWb7wKW5a5QboTiKujJK/05EHWXim8/X899pQYPeVZwbSJmYNUinSlqzl59lVy2XhAgS/NppcQZzdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjjS4Le7vyxM3J/FpGL6y+SwvVqv4VwGspxBNuesNuu94xmgp/
	Zd6Nj6WPoQR95KL0jEzG9v62bQuv1ZAK7T59VBoBF96rPbO77KH6OVAcyzEXQ5KNyXI=
X-Gm-Gg: ASbGnctjto17E3Eb7TByEgiGhI+1yvT+t3iDJEnG8lE2WsD5COYpi8zsioK2FvBWm0J
	6AW7x/HFyRRYJ2CCwF4s65t1qS5G4Ztv+MOydsppIBAp8zOFWAlHCul9rN5+7qtY14D02rShH/D
	KM3KseRaS3exwB2pdrE+Xi3j3D1WtSKKNruzbrL8u0+HgYZ8sIoy7JSWFJHv+WRWkJwRiGt3vDQ
	0h60GxzLcsUKxOk5IKolm9mlxxkgb2+wQoX5pshi5jwHoIn63fAyu7erTyfcGPWs3xzc1EPCX7N
	yXbefngfpmcWJpahRYv9rOFAm63xgIsrG6zIRcBCFBZlrQSGvw3YoPNJLWNspp0sNH/0r7fl8Vg
	xUyFtm1icqeB0A9x+TILuem3vx24lh6po4pr3tZQ3nM2V4pIkjpGZtTCVOAI+pBtru1092LjrW9
	VMvN5s1balCv5z+J7u8rRR3EyKig==
X-Google-Smtp-Source: AGHT+IGdiPP3DRGOJKjYj4pluDC86vZ/Ybmz+/mK35EcOXVcyBnRq20OMLL70oFsIcshIMYVWisL+w==
X-Received: by 2002:a05:6830:210d:b0:746:d22b:11f2 with SMTP id 46e09a7af769-7c0df752992mr6630275a34.4.1760119936239;
        Fri, 10 Oct 2025 11:12:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6d3b:e3bd:4210:32e2? ([2600:8803:e7e4:500:6d3b:e3bd:4210:32e2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f911aefasm1045881a34.31.2025.10.10.11.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 11:12:14 -0700 (PDT)
Message-ID: <07c11aae-6440-46bb-880f-80d09da1bf40@baylibre.com>
Date: Fri, 10 Oct 2025 13:12:12 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] iio: adc: ad4030: Add support for ADAQ4216 and
 ADAQ4224
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, ukleinek@kernel.org, michael.hennerich@analog.com,
 nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 marcelo.schmitt1@gmail.com
References: <cover.1759929814.git.marcelo.schmitt@analog.com>
 <7f8a65deb597d2d26e1d1d373d70851c7cb3d3e3.1759929814.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7f8a65deb597d2d26e1d1d373d70851c7cb3d3e3.1759929814.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/25 8:51 AM, Marcelo Schmitt wrote:

...

> +static const int adaq4216_hw_gains_db[] = {
> +	-10,	/* 1/3 V/V gain */
> +	-5,	/* 5/9 V/V gain */
> +	7,	/* 20/9 V/V gain */
> +	16,	/* 20/3 V/V gain */
> +};

This is only being used for ARRAY_SIZE() and can be dropped.

> +
> +/*
> + * Gains computed as fractions of 1000 so they can be expressed by integers.
> + */
> +static const int adaq4216_hw_gains_vpv[] = {
> +	MILLI / 3,		/* 333 */
> +	(5 * MILLI / 9),	/* 555 */
> +	(20 * MILLI / 9),	/* 2222 */
> +	(20 * MILLI / 3),	/* 6666 */
> +};
> +
> +static const int adaq4216_hw_gains_frac[][2] = {
> +	{ 1, 3 },  /* 1/3 V/V gain */
> +	{ 5, 9 },  /* 5/9 V/V gain */
> +	{ 20, 9 }, /* 20/9 V/V gain */
> +	{ 20, 3 }, /* 20/3 V/V gain */
> +};
> +

...

> @@ -432,7 +533,14 @@ static int ad4030_get_chan_scale(struct iio_dev *indio_dev,
>  
>  	*val2 = scan_type->realbits;
>  
> -	return IIO_VAL_FRACTIONAL_LOG2;
> +	/* The LSB of the 8-bit common-mode data is always vref/256. */
> +	if (scan_type->realbits == 8 || !st->chip->has_pga)
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +
> +	*val = st->scale_avail[st->pga_index][0];
> +	*val2 = st->scale_avail[st->pga_index][1];

Instead of writing over val and val2, it would make more sense to
move the if up a bit, invert the condition, and have it return early.

> +
> +	return IIO_VAL_INT_PLUS_NANO;
>  }
>  
