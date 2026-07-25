Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C373254B0
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785013033; cv=none; b=LyAxBpNXSzwriNlxc7fJV9Jpwy/nJhQa9ByMfclQFM2X6Cs8ru+pHTpbUMDpnp5tBTua3CDdURdFY/+veLB5RMpKqR8dok6PGQsOT0HY8/vLDZa3BVnRTWOxC4LUUDS0/7hUyCZKAaZTRGxffebwUVbmEoORTWCj2BoXS11PqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785013033; c=relaxed/simple;
	bh=Sywa6/Ye08B6vTkrcTaHJZX5fieJQ2q2ifsiIriTUl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mm5/i0sjVBCDGliGWpAkoompx8VmS3NzV8+MafCenC1/VtlQzDixcVrHrc5RqF5ayVyZq822VfviHfjbg+PBzVWUeQBqAOpJ9uVatB7XqWgAhhz9bfTBnissN3N6R1ZV8vtP0sNrL1BxKCRuCt7tI09eFRSwNW7+m7ayH9hszu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XgXGecnW; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XgXGecnW"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso487466a34.2
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 13:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785013029; x=1785617829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BJq+VUPT3xZNhGxvs3I7o0afQFSkLHmMhg0Yb2V7f4=;
        b=XgXGecnWc2nEmXeTMJu4aE+7fYlkAajlinZaSfzJqoYWHspr36w66qq6lE9JiL1rO/
         YGJj13SiwXIjqC/4fp5RVpVhP+onvxpmqUXUGOO6Sp9UMx0vhZqVCKcMRe3rQpmFBwKP
         8Crb3Gk/URnYS6g5TZzGm2cg3gXqzNmSTsUfThmm+zgXR8DkG8GDZkIvNeGq6QlM/kab
         7ho5dDQ3jzpmKLdh7Bp+FGYNTWBeLcEQ1AJ/eW+0ns9/RvHv+BCjcZEcJtrG9FOtuS0w
         r0cnJdzeGZ979yUmbd4DmcrNg89ZdbNvpAxuQH0N0t2JeghqlXP6zblvP6+ZvRnS0OS5
         MaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785013029; x=1785617829;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BJq+VUPT3xZNhGxvs3I7o0afQFSkLHmMhg0Yb2V7f4=;
        b=MS4P36eTkdqELZHefX5KBNZthaDs6ugZIUf1P0gGNpqnhaACOdt7rDH/KQ74mu/rsO
         zsHTuBTGHrwdxz8mE+gB7paJf2F3yqlnDxzgUtdPslAS6STqiXXrWaMX+S5g3PbHgN5D
         46TU5h9cl5Kvqf3lqONIC6wjA+N0c9yHx5uI0BZjVuJxN5l62wBoC6YV3nuswmmIIyhW
         s1n7fsXsQ8hzq/U75B1FdBNoO8lltXEQOdNrFKgrIFjpWp5RMDcU0YsmFzUX3TpzIO1o
         8X4/XOZ3/gKT9tN+e905TxWQZotS36yC/gKiPSwBwu0fum8IbkCGwSEDOB0he5WvvgKF
         7lmQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro+jHtvAagEXXg0hxNLgJs3t+aqh954ADBO1HGKkQ64tJ+bp1jXiNE2tbvSscnjGfz/yhBR0V5CF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp4esvFShORVo2gP9SaMR3DdS0zx50QnxuN97ne7+BUQscuP2a
	7zN+8G4nEB+TMXQzdIZ/lsGtrOrcvoK5s0MaN1/Ch27iHOtG+2x9uEFOwdjByQRZJIE=
X-Gm-Gg: AR+sD11vF43ElAAbKK5lGKVE0V2ghiRNfbtI730e25UYDIeKpsSO6pOvdMj/AZadHKc
	9hVC6Kmr3VgF0jFqDFIXfyDUdOMZZDXV24RhbcpKNxy/X0k23AVHZ/D/jwB4E8x11sKpVDZWIRQ
	tUDSw2pjzO0beMaantJrnJhivNk8aRpEOhnpAn1qEwh/uUxxu5JPCPkFg8LCZ94LXOBYHK0TB5y
	rkYxCAnY+xiIsCvbHV4fey+6IQTNOvYTOZzeWYebbDQcaqbo9d5vjulfK9owBhNKE/Pf4NNwqoq
	/azGDOWQqk3RpsoOFwIHiJcbpv7AESA/JZpRqKMUGicbA0lA+6lYj7a0ASB5v2+5+LhBrJIDPv7
	LIT85G6JLvWtgPSExXZUBmZEDEYrXWEFMZE6nY9uRj0XbVKqwO6jGOwWSQQWopNkN959y1Vhi+W
	htTu+c3DEgjK1HC5trP3/vppjcUAHTSz+p51/MKv6CUEZ1cCZgTdS7
X-Received: by 2002:a05:6830:2906:b0:7ed:ceed:95b9 with SMTP id 46e09a7af769-7ee78d2ae71mr2872531a34.32.1785013029154;
        Sat, 25 Jul 2026 13:57:09 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:677a:56dd:37eb:cf53? ([2600:8803:e7e4:500:677a:56dd:37eb:cf53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee2a0ad02fsm9782435a34.19.2026.07.25.13.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 13:57:08 -0700 (PDT)
Message-ID: <cb4098c1-4bad-4a11-9a6f-a833e554f197@baylibre.com>
Date: Sat, 25 Jul 2026 15:57:07 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] dt-bindings: iio: adc: microchip,mcp3564: Add
 spi-device-addr
To: Janani Sunil <janani.sunil@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marius Cristea <marius.cristea@microchip.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Janani Sunil <jan.sun97@gmail.com>, linux-spi@vger.kernel.org,
 Kent Gustavsson <nedo80@gmail.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260722-ad5529r-driver-v7-2-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/22/26 2:54 AM, Janani Sunil wrote:
> Add the generic spi-device-addr property to the binding and deprecate
> the existing vendor specific microchip,hw-device-address property.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  .../devicetree/bindings/iio/adc/microchip,mcp3564.yaml         | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> index 675319276197..de1ea289e7f5 100644
> --- a/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/microchip,mcp3564.yaml
> @@ -80,6 +80,7 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      minimum: 0
>      maximum: 3
> +    deprecated: true
>      description:
>        The address is set on a per-device basis by fuses in the factory,
>        configured on request. If not requested, the fuses are set for 0x1.
> @@ -91,6 +92,12 @@ properties:
>        clocking of the device address (BITS[7:6] - top two bits of COMMAND BYTE
>        which is first one on the wire).
>  
> +  spi-device-addr:
> +    maxItems: 1

Does it not make sense to all for more than once device connected
to the same CS here? I would expect maxItems to be 4 to match the
number of possible addresses.

> +    items:
> +      enum: [0, 1, 2, 3]
> +    default: [1]
> +
>    "#io-channel-cells":
>      const: 1
>  
> @@ -123,7 +130,6 @@ dependencies:
>  required:
>    - compatible
>    - reg
> -  - microchip,hw-device-address
>    - spi-max-frequency
>  
>  allOf:
> @@ -159,7 +165,7 @@ examples:
>              spi-cpha;
>              spi-cpol;
>              spi-max-frequency = <10000000>;
> -            microchip,hw-device-address = <1>;
> +            spi-device-addr = <1>;
>  
>              #address-cells = <1>;
>              #size-cells = <0>;
> 

