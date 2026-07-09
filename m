Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3917538C2BF
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612484; cv=none; b=o4ELUw1rARJHxmXIBVHcxTlFdMYI0mB5G4P1N6JtVPwMgvFwYtvXdimdv0oJf70voCkwNOzIt0M/c6KiKUrV5RybMoDA4OQgvXzr0YavRjvGpQydMfpNUIgQcHGf9BQFsyvthoH4DBf+kosA3O+CCPoTsB3pJn/xl1d4JMng2p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612484; c=relaxed/simple;
	bh=PLoGulolsNch+biEk21nQng2ImxUq6L8OXGcxAC3fPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxWuty9sJ5FevzH6oLkmHH661+QxdGU3QyefQNcRxQaHVVWd9UvxCUztHsi5zMfxJUHCL7zz8cNpLaxPWGoliW26uLnFbQL1FV0jpe5xsvNDm9QFeRJ8/3gFmN07s9MYq4UfYafCHGQwbKE+WIFMX3sD6buyWOT8dyKWlLwvUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SyFWovOc; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SyFWovOc"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-448df16ab34so454563fac.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783612480; x=1784217280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoJZzYBp1oB4KO4xVaDbxz5nVfTJ4PzYKcsEvK7N4q4=;
        b=SyFWovOc2/JnIM7UW2tlc0zHngTi1DwrmYmGFPF/ZXAaeuHvpMevVR2+i4J1gZG/0i
         lUMW95P0nDvl1L/NDYUh05FQc0Hg7FzpQ+UYiRmmgl7zteZvEfbHyjoHN4QhA0c8kN1J
         rBPNiKw2PJ6lYoylU6epf4oIH5M9wg3AuOdn4iTkLjNjyen+BixMjmQG46H5hn0/lB57
         yR/oqVuDF/oyw4vWN1S/ToGOiDr67+rZ1VU7aQDuvovEZtZwO+Qs16+U78s3yg0v1hNM
         PCDlfHGQuxWREDgcN1WbOeBSw7o4FPCF/GjjmQ5UPuJEjL977pNIYiZzP45ZtNc5D+Bz
         nb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612480; x=1784217280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LoJZzYBp1oB4KO4xVaDbxz5nVfTJ4PzYKcsEvK7N4q4=;
        b=AFiAc6vpzfF2fgAqsoKIiIyCIAXvaZYJls6BiF4++O4MccXnmdrxJHT1rE4BHVYsPY
         v1HtJBqZV7zCvxIAA+wUdC4M3S23Hflm6qMeqEzs802hEGPqDy8vlcqpczi6k4ouiGBt
         Tq5Uq/Tss1w0AGmBmUtmYDcZpOYBoQS2+/TekwfDsdR1BwP0rRMz16v+sX8Y1g68GdF1
         TOIgUt+FIf3AhJ/XWhLzNTA0ogmpZzr8ryBgyxa8pIKTFOf3COdMRWWgE1+2U/wPPHDs
         hn0JDyZlirfj8WbSuci+z3SJld5jUovzadRxeEvKI5QggJ/kQjybVgyIhT1EA6nxUsDI
         QKsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9v432LcK+urJZtfMe3TBkW8bGOcteNnd1TaOU8AKkzIXqNKaN/vaKa5GZXvTdVzzfbLtwPIGi9LMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyneoMdofDxWOr6Db+s1StNuwJFWiFU26XWUK77Tj5gET2JFeVb
	iIy9/Lr7RG1+Aus7RIHpo6ypPGpdY8SNNjoBKwIp45NDtN6pxAjgsFZp2NN9BhT44Xg=
X-Gm-Gg: AfdE7cmVNDIEHlzecwkx/tBc3PjjN6jYyFvfqdJ6C3zOFFIxXAOWnoKtZxSV/Tgf9WP
	cyV/5IYg0/qcjCDCWhv4ALILfjAGB8/XPt8oU7vYCTqZAML9blpGT+nmE8VeWEfMxTRA81iD8T2
	WrC3MuxcOSZUSgrxWPTjboSJttPLliRvK1XPsOkz7zITrbY68Ox4WLGmhxFjCVBVNBBkln38Scz
	aafDM4x5nz9C5EVANUPPe60glX25QjAfYXsvIqp0YIdyUjgH13HF0uGl8rzDVFIC1lCYVJnKThj
	sjhaW4y5ZWwIHa03bGmnUsYwGh9RP3rr6G/mM/XQ+d/YV6zgY6RfEDP3nlQvgvXyuZ+AT/X9QgB
	oQRcNMQNnfJRhV/dSYAj8RD08oWPqh6ICqrd40guUw+Uc0MjGWYJkfMwUl2vEHFzOquazItjiHD
	vzMNkS89flyW5CL1cubtpvEFZHpgaVLEHFRpOHsUwCIEO+dD4I6i5XNG4+zaMxxPI=
X-Received: by 2002:a05:6808:3086:b0:496:b7c:274b with SMTP id 5614622812f47-4a202e98156mr8019702b6e.19.1783612480192;
        Thu, 09 Jul 2026 08:54:40 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:2a8b:8d9e:f359:9a35? ([2600:8803:e7e4:500:2a8b:8d9e:f359:9a35])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1adca6bedsm4124082b6e.8.2026.07.09.08.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 08:54:39 -0700 (PDT)
Message-ID: <517f688a-6958-473f-bd4d-65dcb56278cb@baylibre.com>
Date: Thu, 9 Jul 2026 10:54:37 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] iio: adc: adi-axi-adc: Add support for CRC
To: Janani Sunil <janani.sunil@analog.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-doc@vger.kernel.org, jananisunil.dev@gmail.com
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260709-ad7768-driver-v1-3-44e1194fd96a@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/9/26 3:50 AM, Janani Sunil wrote:
> Add support for enabling and disabling Cyclic Redundancy Check (CRC)
> processing in the AXI ADC backend. CRC provides data integrity verification
> for high-speed ADC data streams, ensuring reliable data transfer between
> the ADC frontend and backend processing systems.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  drivers/iio/adc/adi-axi-adc.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
> index 26b9c75bd4d8..8af42d26aac0 100644
> --- a/drivers/iio/adc/adi-axi-adc.c
> +++ b/drivers/iio/adc/adi-axi-adc.c
> @@ -47,6 +47,8 @@
>  #define    ADI_AXI_ADC_CTRL_DDR_EDGESEL_MASK	BIT(1)
>  
>  #define ADI_AXI_ADC_REG_CNTRL_3			0x004c
> +#define    ADI_AXI_ADC_REG_CNTRL3_CRC_EN_MASK	BIT(8)

	ADI_AXI_ADC_CNTRL_3_CRC_EN_MASK

to match the existing naming pattern.

Also, add a comment that bit 8 is shared by all AXI ADC cores while bits
7-0 are custom per HDL project. (That is why they have names like AD485X
instead of AXI_ADC).

> +
>  #define   AXI_AD485X_CNTRL_3_OS_EN_MSK		BIT(2)
>  #define   AXI_AD485X_CNTRL_3_PACKET_FORMAT_MSK	GENMASK(1, 0)
>  #define   AXI_AD485X_PACKET_FORMAT_20BIT	0x0
> @@ -567,6 +569,22 @@ static int axi_adc_reg_access(struct iio_backend *back, unsigned int reg,
>  	return regmap_write(st->regmap, reg, writeval);
>  }
>  
