Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936445039
	for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 20:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785011904; cv=none; b=YmDNH7j+XVz2f3PKRneGGINsyOwFpCvfFvHjaKl2REjI/YrovWPjl2/1MfkLfU83STCh/9AqYGOtPvzD+RpU2Nwa6C+EDzFZpcY7Ex+idkhVQFpFnYKGKTgQgOT/maylfly97wbpsB8yyvrQ3V6RTTd3l0wHwf6imitPWFlCfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785011904; c=relaxed/simple;
	bh=iONqM2Lq54NpnqmXjiLdtYtjE4xrJUW9mk+59xZC6g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNjwmk+eekw76XLdwoJXPthCnc0k66K0dJTSpd3D6SiwwRNamvViktLxWrORuzUoTo6LU2Ec24Q1Opal4flFHiuFL5J/lwjzdItaU12Q2QKVwtvynT/cYlWv+Yjv1lIfisXRgeJjI+0VHyBRYUu3TzYhRW1CnTX6DcXYIDrRsQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=T245BYQd; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="T245BYQd"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44cb057311bso791950fac.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 13:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785011901; x=1785616701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IaoMi6Hd0SLtKbgts/aDL0YFdHS36nKYEo+scTrYk4=;
        b=T245BYQdhzhB2xMb26XRlbPzRglEvd/9VdyuCGfwOmPkyWQLDuWDZDqTnktAKCpat2
         FNdo0Dr97uCS6ne4I4RAgFownIgs1cKLd95XgkEXt/rUEceVg6v31K8cqtD0JU2tH9VE
         9eN6Rj8LnYs7wjGjnTybcnc4JOBxyO69PxlFt4Skw+Ext1uwYmbFlOH4svgPVBB8Zqpw
         OlCI7bmiZOUpoeRlGSlHi1R3tzmEOgPMS28e9nHmpdlUpiwSw4eyRRmqa890DPnTS1Vb
         lSCdU7Vi0J+jBWK44dCvTVukx4+i20mKW7XcjppJi8VR8c4j/iouMPHxx2obpRgTY8ls
         3eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785011901; x=1785616701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IaoMi6Hd0SLtKbgts/aDL0YFdHS36nKYEo+scTrYk4=;
        b=iO7ywLWhTO/OTod94i0Etf7lXcDS7JNCFU+jsJ1Tm6KwCVaNabXC56AHzTYmiLBflr
         yA3qp0Mz1j5iX8Mpc0OOXhT3qiYpGU1zEPgxruj1tWJIBPdV2Jn44zECFQVrKdV/pirD
         a7Bz2/p7VmYcGKgiCgKchQLylKILVAFW1giiILnXIvM2ta5Dk27+UPzVhRxWLzJsVqBq
         wQ+/8iKAbutuFmIPzDhDEajXVEYPdXcwXgpcHZQUn8JpBcahR7k3Am12EERILJ8T0Tj6
         kNVo/Q3ltWVV8qUCgwR/CBDg5gs8I77Yn8GZDhxZRmy3bCHnf6buDaTjPyEhwVh7lL1B
         jF5w==
X-Forwarded-Encrypted: i=1; AHgh+RqGACZ0ChdVShnYfj6IgSoTZXqB+c3HjWPvRiI5N6BTOqg+/BxiIa1TTclt8x25J2LoedDpVbfQ5KI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNnNZWBdKM/D8j5Vep1kwR5mNjOgXS8wuzMW0/i60HxWVWnQdW
	anEufHecOIJWN/W5Q5O1I03nwgeaeGbKj2MJE3QYyXxXN+RCXPr1ym1uVxC+qMWk29A=
X-Gm-Gg: AR+sD11A7Buh9mdBNIWxqyM9i86YKOy0Duwvx9ukaSyBoW9f51bI1svUACDyv/1r/7g
	GbTt+kfVtEHUWRUEju94vgVqR5Yq8VR3nL4+G6/aZgkHtDLLYyoQEPC8dcARDLXSeBZXnZwLwpM
	2A1tob4B7pWGu13QRPUPdg2kFCFqqgB82JCEK0pVZk63w4IPVKYHrY4Tt0wWvRixWPiWDoc5BQ3
	WeOwULEO7UiBIlDpuYmAUtq29uYD1HZmd5hynAx4cFkhJw7n9A/UPYI5us4vzNhQ09srSGveZaJ
	mn8eQfmv59tiuLR5QXSGPvw9Lf6Wm/h3HLp0tDVY1k2rBQoSobLg9vAWLcv7NeVb4BIIhLiOZDh
	Nuf3NmGZhrqlkytzolVZm3uDBGlELxDzURap41e0TSaRPUN1dylfh3HuLNm+MwtPiLG5ykphRrc
	uH0PEDuXTDbvPlwVlHKPL8A0n7hpkedNGbFzQA/gNOqFcx11NUi9Nx
X-Received: by 2002:a05:6870:3c07:b0:43b:6ad5:6ab8 with SMTP id 586e51a60fabf-457f26bb220mr3050354fac.20.1785011901114;
        Sat, 25 Jul 2026 13:38:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:677a:56dd:37eb:cf53? ([2600:8803:e7e4:500:677a:56dd:37eb:cf53])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766f16dfcsm11225502fac.7.2026.07.25.13.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Jul 2026 13:38:19 -0700 (PDT)
Message-ID: <e39a9345-0302-425d-ac43-53a524f13394@baylibre.com>
Date: Sat, 25 Jul 2026 15:38:17 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] dt-bindings: iio: dac: Add AD5529R
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
 <20260722-ad5529r-driver-v7-6-7781cd74ad75@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260722-ad5529r-driver-v7-6-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/22/26 2:54 AM, Janani Sunil wrote:
> Devicetree bindings for AD5529R 16 channel 12/16 bit high voltage,
> buffered voltage output digital-to-analog converter (DAC) with an
> integrated precision reference.
> 

...

> +  vdd-supply:

So vdd-io-supply to match the datasheet name?

> +    description: Digital power supply (1.08V to 1.98V)
> +
> +  avdd-supply:

And vdd-5v-supply? Datasheet doesn't mention any AVDD.

> +    description: Analog power supply (4.75V to 5.25V)
> +
> +  hvdd-supply:

There are 4 of these according to the datasheet. e.g. vdd-hd0-supply ...

> +    description:
> +      High voltage positive supply (7V to 45V). Supply voltage should be chosen
> +      based on configured output ranges (see datasheet Table 9).
> +
> +  hvss-supply:

Same here.

> +    description:
> +      High voltage negative supply (-22.5V to 0V). Required only when using
> +      bipolar output ranges (±5V, ±10V, ±15V, ±20V). Supply voltage should be
> +      chosen based on configured output ranges (see datasheet Table 9).
> +
> +  vref-supply:
> +    description:
> +      External voltage reference supply (4.056V to 4.136V, typically 4.096V).
> +      When specified, the device uses external reference mode and the VREF pin
> +      becomes an input. The device uses the internal 4.096V precision reference
> +      otherwise.
> +
