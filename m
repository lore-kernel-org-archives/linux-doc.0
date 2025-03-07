Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296462066F9
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741344733; cv=none; b=sEx+mMH7hrHwmANjIWuP9AitXGgMCgWX8oHr5qinfRO+UGoSjAdtvXDxMKskqZ/+goZ+1K41yyM3kOXxXePymD43hxTl9GZ+WUq/CbdFB65kvFm2TfotDJ4OXeyqXGcbdYmsc82zK+Hb9ZT+NtwXnnhCPoUVYcazpcAnmnzNSJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741344733; c=relaxed/simple;
	bh=2yrl245pQFYTteb+/aA4r5Ui0KBjICUD+1rxdgPp0wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSNFgyOnttjsihJRgUQ2I1AkNOQetBZa9J+zcbw6rg2tfH8Ncr25QqYFeCoDEnFSwfK9+0IZkkWgMdZXFolNTx2t5mYotqmEJJTNz5SwU2Fm8Z6GKfGRRc8hDd4nXk1lBeiognxwObwbvTzHN71vrteQzSnz0JBdch4L0Q2WSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZtArpcoG; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZtArpcoG"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30761be8fcfso18569971fa.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 02:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741344728; x=1741949528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRsjrYylaGqHOYSS2Im8OTeS/8b87MG8RUTJovWmnVs=;
        b=ZtArpcoG4xHxWeEYG8wOl/3hi3Tzm3qdOwHW2xTnK/WVdHb0RLYpcy7dcpfp4fEt1I
         4wgkWBRyLhdlERz0dfGu35NYoqSUEj4Rwxb7smcVVBN83u75ZI++K8xMsAG16HnYdnwr
         u6iBzCJZO1ELuz1qpEyqrRJycZrU5FEEAnatTk2jUzXEw/R3lfqWwJiyEM3FKo/XLCAZ
         L+bgFTD2j/YLzgn3yzfXgDL5f5xk1FfI5RGSR8QKRaFldJsIwLVH3yK1Xs+/kFhqhMwK
         tkP6+ZFIK63Lm8HgpECxWD0rB6zwXtx8b/af1tQ6PGEaaj8ZNGxXWJ2NeRbHby2TYPuV
         kf2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344728; x=1741949528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRsjrYylaGqHOYSS2Im8OTeS/8b87MG8RUTJovWmnVs=;
        b=XrLg1EEz/RYcc5ZHprW42nq26oTMLUJZ5eFaIZwVPFf1DEd37vwgYp/BObeHiWj385
         AOevi3OEO7ftuNTpIxxQpr6aDvRaakIulb4UeXeE3Y0urni2RRCLXiT/073RO/jBQJd0
         yxB9FoIhFWcdwjymC695Axk0KpA1JpmKA06PfbRs73rFlvMvO+oFOZaX14v4cdGXxH15
         N9uRNngxLqR0jTTv/7se9/ctvyXuXfUm66HfFKLCyZBKvG85Nwxo7jzssulDvcNst7G6
         DYqekiumGeNmxSe98UBFy4fjToyoVjRgDTHsJudb6RCDxqooolPs3dNN2aaN0j7g9BTC
         4YLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWTrCncB04HOaxbCldG1rfLT17srL1mNIB/avWN5NgThcyFPthfbeWUMCMGjJ7jSpe5gKQ1O8kWcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7Iz6PhlkeVpyrxGNDc3AzPHd7DK+p1kTw5iL+zWCuewYKmf7E
	Xb9bBvP0ygWf0lqKlh00LY/gCoodt83AruiFI/iaNf1K0ilbd1ha3jK4dGjvPXSqlpAIqJTVcHP
	rviokYC56Hq6ZgRT5p4bJgD5gET+ptuzXtrNVyg==
X-Gm-Gg: ASbGnctZ111o5IqjXGN4u6bgnLMVd+uXrSd/bdYWEdPKE4xenQtbxpbAz5SWr2Q+7MW
	jkvzIAcAvPJmtQTUEXlgdlD86hcBEo2W88nUpFL99lKisp1GO+KFjoG8Mqk6oaVQ6xfFJ4Qn4R4
	gdF1cMhE27IVTxE9WOGzDR6sLLTA==
X-Google-Smtp-Source: AGHT+IGTv8b2iGGJntdmFYPrxn5rBDY0hEoMs3EOIxh9tMQRsB5GFmoHIuYXVfRwM0Is+sU2gQz8J72mVJX/HKidY/U=
X-Received: by 2002:a2e:3a15:0:b0:308:eb34:103a with SMTP id
 38308e7fff4ca-30bf45f4820mr8917921fa.28.1741344728194; Fri, 07 Mar 2025
 02:52:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-iio-driver-ad4052-v1-0-2badad30116c@analog.com> <20250306-iio-driver-ad4052-v1-2-2badad30116c@analog.com>
In-Reply-To: <20250306-iio-driver-ad4052-v1-2-2badad30116c@analog.com>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 7 Mar 2025 11:51:57 +0100
X-Gm-Features: AQ5f1Jo2uhYB71XpyIkYmXnZs7v-ATTx9ln-Jijl_UCZHNfpilpA8uAirwbAS44
Message-ID: <CAMknhBHeqhkGaSM0S_zahC1ZrKTfoYj87fFEwL362FhhjNOfpA@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: iio: adc: Add adi,ad4052
To: Jorge Marques <jorge.marques@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 3:04=E2=80=AFPM Jorge Marques <jorge.marques@analog.=
com> wrote:
>
> Add dt-bindings for AD4052 family, devices AD4050/AD4052/AD4056/AD4058,
> low-power with monitor capabilities SAR ADCs.

> Contain selectable oversampling and sample rate, the latter for both
> oversampling and monitor mode.
> The monitor capability is exposed as an IIO threshold either direction
> event.

These sounds like they are describing the driver so aren't appropriate
for this commit message. Here we should only be talking about the
bindings.

>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  .../devicetree/bindings/iio/adc/adi,ad4052.yaml    | 80 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 86 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4052.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad4052.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..4602f1f0184d58f33883852ff=
6d76933758825f1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4052.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2025 Analog Devices Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/adi,ad4052.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD4052 ADC family device driver
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +description: |
> +  Analog Devices AD4052 Single Channel Precision SAR ADC family
> +
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad=
4050.pdf
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/ad=
4052.pdf

The links above don't work for me. Instead...

https://www.analog.com/media/en/technical-documentation/data-sheets/ad4050-=
ad4056.pdf
https://www.analog.com/media/en/technical-documentation/data-sheets/ad4052-=
ad4058.pdf

> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad4050
> +      - adi,ad4052
> +      - adi,ad4056
> +      - adi,ad4058
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      Reference clock
> +    maxItems: 1

I don't see any pins in the datasheet about a "reference clock" input.
Is this for the CNV pin? If this is for the internal clock, then we
don't need a property for it.

> +
> +  interrupts:
> +    items:
> +      - description: threshold events.
> +      - description: device ready and data ready.
> +

Since there are multiple interrupts, we should also have an
interrupt-names property. Also, the interrupts should be named after
the pin they are connected to, not the function. So the interrupt
names should be "rdy", "gp0", and "gp1".

> +  cnv-gpios:
> +    maxItems: 1

Not necessary, but I would not mind having a description that says
that the CNV pin may also be connected to the CS line of the SPI
controller if it is not connected to a GPIO.

> +
> +  spi-max-frequency:
> +    maximum: 62500000
> +
> +  vdd-supply: true

> +  vdd_1_8-supply: true

This one seems redundant and should be dropped.

But there is also a possible separate reference voltage supply, so we
should have a ref-supply property.

> +  vio-supply: true

These chips also have GPIO pins, so we can add the gpio-controller and
#gpio-cells properties to the bindings even if we don't implement this
in the driver.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

The chip won't work without vcc-supply and vio-supply so they should
be required. ref-supply is clearly optional though.



> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        adc@0 {
> +            compatible =3D "adi,ad4052";
> +            reg =3D <0>;
> +            spi-max-frequency =3D <25000000>;
> +
> +            interrupt-parent =3D <&gpio>;
> +            interrupts =3D <0 0 IRQ_TYPE_EDGE_RISING>,
> +                         <0 1 IRQ_TYPE_EDGE_RISING>;
> +            cnv-gpios =3D <&gpio 2 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 06f122cb8bbd15a0076c229dfc89be0b5126f237..fef8adaee888d59e1aa3b3592=
dda5a8bea0b7677 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1317,6 +1317,12 @@ F:       Documentation/devicetree/bindings/iio/adc=
/adi,ad4030.yaml
>  F:     Documentation/iio/ad4030.rst
>  F:     drivers/iio/adc/ad4030.c
>
> +ANALOG DEVICES INC AD4052 DRIVER
> +M:     Jorge Marques <jorge.marques@analog.com>
> +S:     Supported
> +W:     https://ez.analog.com/linux-software-drivers
> +F:     Documentation/devicetree/bindings/iio/adc/adi,ad4052.yaml
> +
>  ANALOG DEVICES INC AD4130 DRIVER
>  M:     Cosmin Tanislav <cosmin.tanislav@analog.com>
>  L:     linux-iio@vger.kernel.org
>
> --
> 2.48.1
>
