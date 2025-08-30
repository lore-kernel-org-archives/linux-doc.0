Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8C8221F24
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 18:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756576954; cv=none; b=LH9kzZrg97q0J/jMKM2FhuUcKqy4PaNCJdpy/HUZLxljicTVtPRjA4gvuC7v5Kfa2+Z4P7kG+m/Ta+NIdiTNXDyP7JYRHgh2/8DY08R6P9s/te9gyTzVpLncoewQVM5KGGLX+I+TCPWixK6BuKs2OrExUikjfAzvVk5zQxnIXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756576954; c=relaxed/simple;
	bh=LL1hd9q8LJpTq1VIPJ6jPwhtJlsQGlDix5UjkykB4Z0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JobFmYng1xgmzh2NWFL6U8b7Zx4i8UFFlaOYoYlFGWYR9cY5FDsF3uvP0oKbxNtbC1qXz7QHQawSlI5mDYs6vIiTgzZThsZEh1I6sSCj0+cirUtvMt9uTBAn8EkdcjsbPkWIbR5rwII8hOkYgx0FX99zwyrFesyKUVZhGFqdnH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=d4kFHbRn; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="d4kFHbRn"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-30cce8c3afaso2708071fac.1
        for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 11:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756576950; x=1757181750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PD2EKFpAobF4U0TIuLMjpEcO1H/Nnyn+f8Dfu+DnkNI=;
        b=d4kFHbRnKQoKXBWL1zWyAwAs9XrZhybRacslpYsfOE/8svlNjSAa8Db/NCLXxiJRfA
         J2QD4/foHnDmHwjuCSsOjuJdbemw7PsoCS5Uu6HXPTYCRCgcgnVvheVSKQyQpip6/XBP
         MXz5Fm4B1McmU3Wff8PnTJzziO8LqKydzV6W7lgjTSLztkWWi8KoF8jJh5zTod8q8sIa
         wdfUEv0LJL8woK7iGwOs86dgFktN/7oUDsaxpR4w8skkPSaKoxIEI7ZTIEdD0ImcJ/2B
         NNHGtdWgXgCxV140u8AZQooK2BGzWxAuHzVH5fzMh7d38ELATTJP4PjnOCL/xLmLDsBH
         4Piw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756576950; x=1757181750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PD2EKFpAobF4U0TIuLMjpEcO1H/Nnyn+f8Dfu+DnkNI=;
        b=DsMCT9Kbf/0VKNExu7RaL8f4/Hg+VfdCq4eJNe3ORygS9DHyOVZFbn4TTApcRVC6nM
         KZJ0FyEpomsba81+VxZ8SpaFgxLcqwY5R0cx/1XaaD13Eoizw1ZooaS0CvCyW7ag3c/Z
         92k0+55/zrCjjeXNw/zgNsRGg53T5efNbFi62nt4TUlkReTuyPutK1abNh4GDlCriQ2n
         aaO35XKN/KMsq7927ALNad5C06k9rN4LS/8V4FQu7tkzJgNKYQ3B5Z2CQmsnBOup9Xv2
         nKem0pHSI8O++CPrAco5/i9N0izy98FlvUxkOIu6d47xhPnCnLvteHYIpfZJih2gJGRv
         9aRw==
X-Forwarded-Encrypted: i=1; AJvYcCUPLxROL3dKFVBzqD6r6L/QBoxvot9NSzlxSTxtLVsr51z684RN6MhF4tKn57W9j96GoFTwpoDgl6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy033ZRE0CLvydPLD9cfgf4u8OsixAe0IlMvfA/YInGmzYH2zet
	XvUO1clt009OO/uDuZe4M4Ks/5vldojxJ71Pph7ijOyNr2k4mHNKv0omN7/KmppvpY4=
X-Gm-Gg: ASbGnctd0qyGTAKcrwJaU2/d/ovseQQkx6sdL0pCo2WSw6g8w5h+VsLIzRlAGCxyu0W
	3Nh4jv7rEwN/4dHou57Bm21+guePHgVSo/GWcxAPb6RK3pqSffmqUAMO1i3kZHKHgzlrZa/3rVd
	Bl5gQKNnTIBdjpVanDFHCHjtpvq2n8YrfNt+8EeuKPCJhIoJC+jOpJuUYDRAaHNn/kavYE5L8gy
	hA6z6JVugLzKqYnWmWQVeARz5bI17gVWjCoYbM2uDW6fRBxgwrUeZBIQ519cHvOzmNrSZZ7n68I
	TPEETy7doiT26tnw/h1B7aGofgQU4N882tyLG4ivXagX4QbLa/gxosfKaYNeL2fCxIhQc9sRhvZ
	X2vZbit+fR/eqyTsrD4waJ9EFGXqDGjtcTp4zSQ4A7FWIaH1yP45NzWQ3EZHLlAVQzExgWTG5q7
	T6VGEaqA1E8A==
X-Google-Smtp-Source: AGHT+IGSJvFvC9dcmKaGf9glwESPFKs7sboRW3GSWHC52Tz6jlzKsP6xrkD7Hc7UHEkT8qvw/3aY5Q==
X-Received: by 2002:a05:6870:c0d:b0:315:b768:bd23 with SMTP id 586e51a60fabf-319633c79a1mr1298016fac.34.1756576949951;
        Sat, 30 Aug 2025 11:02:29 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:f7b4:dfbd:5110:c59d? ([2600:8803:e7e4:1d00:f7b4:dfbd:5110:c59d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3196d2a7f3csm392769fac.8.2025.08.30.11.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 11:02:29 -0700 (PDT)
Message-ID: <033e8639-67db-4397-b8c1-d1b7774eb9fe@baylibre.com>
Date: Sat, 30 Aug 2025 13:02:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] dt-bindings: iio: adc: adi,ad4030: Add
 adi,clock-mode
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
Cc: jic23@kernel.org, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, corbet@lwn.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com,
 ahaslam@baylibre.com, sergiu.cuciurean@analog.com, marcelo.schmitt1@gmail.com
References: <cover.1756511030.git.marcelo.schmitt@analog.com>
 <1acb071f7140c9d44ed616a9eaea00b0ee423164.1756511030.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <1acb071f7140c9d44ed616a9eaea00b0ee423164.1756511030.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/25 7:43 PM, Marcelo Schmitt wrote:
> AD4030 and similar designs support three different options for the clock
> that frames ADC output data. Each option implies a different hardware
> configuration for reading ADC data. Document AD4030 clock mode options.
> 
> Co-developed-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> Signed-off-by: Sergiu Cuciurean <sergiu.cuciurean@analog.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
>  .../devicetree/bindings/iio/adc/adi,ad4030.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> index bee85087a7b2..1e4e025b835f 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
> @@ -78,6 +78,18 @@ properties:
>    interrupt-names:
>      const: busy
>  
> +  adi,clock-mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [ spi, echo, host ]
> +    default: spi
> +    description:
> +      Describes how the clock that frames ADC data output is setup.
> +      spi  - Spi-compatible. Normal SPI operation clocking.
> +      echo - Echo-clock. Synchronous clock echoing to ease timing requirements
> +             when using isolation on the digital interface.
> +      host - Host. The Host clock mode uses an internal oscillator to clock out
> +             the data bits. In this mode, the spi controller is not driving SCLK.
> +
>  required:
>    - compatible
>    - reg

I think this would make sense as a common property in spi-peripheral-props.yaml
as this is something that is not specific to just this ADC and also requires
a supporting SPI controller with the matching wiring.

I would also tweak the names and descriptions a bit to describe how it is wired
rather than how it is used.

  spi-sclk-source:
    enum: [ controller, echo, peripheral ]
    default: controller
    description: |
      Indicates how the SCLK is wired.
      controller: The SCLK line is driven by the controller (typical SPI bus).
      echo: The SCLK line is driven by the controller and the peripheral echos
        the clock back to an input on the controller on a second line.
      peripheral: The SCLK line from the controller is not connected to the
        peripheral and an independent clock output driven by the peripheral is
        connected to an input on the controller.


