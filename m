Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8E1891B2
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414393; cv=none; b=c6EqMht77fPZBHTV3oaF5wTd3SjQF2xYDJwHsNSGu1JA97Co5PUIKl8zX5vspt3azz+EIVVmphr1fsg8R/SQqMp+SOJ4QB8zFCwJfPad7U9q2FB+aVR/C9CISiyE8mBr9FVo7ppZGxTnpb3RlJnjjNWFil6m7YMGTLX9xQMXAyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414393; c=relaxed/simple;
	bh=CoCJPazVJiE1snnzxxCywTmRfiRQzuKfqpSNMDFrnQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fo+ZU6zyGCOTFOhmZO1jE0ItADfeORsszpu/5DINFYa5DACPf70lhxLXqHgfBRX3pKlXtR8IfOLcf7iSV510ufq29oJw7HYjus6oEcpFXy7oED/S2nVeX3vORnlPPl+FFkosFn6/WN6CtjAIe63dPfhaR1PyWZS/yJH/spKw0DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Mm1LrZqg; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Mm1LrZqg"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d56285aa18so340824b6e.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719414390; x=1720019190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3H0retfhFt4B0iNuv9mzfbvoCs+7PaztlvT0U+sfS+I=;
        b=Mm1LrZqg2O6jK9E+zMTYJQlHmh9anwUpLggmRr+og9UpC2p4tCtzooH5u9kYNHRJnY
         qLCjBY7eKy2kcusORcZZ029j5ZEQsj0cA/OaiXBHfLchKoBjiNXI6FhWX1HPKOn/cmg/
         e3IFKhWPwbV3vgMAJrLt5EeNiChM4odEQb/SpzNkwthFxr98iGIptXZbAIQ6tSB4H+EH
         UeMDPrBgh7YPZdoONgAgnLbUpdVnrfTdqsRohpnM424xJsUX/oItKZW73BqZtPoJ5aDQ
         QaCAw/wo7ziHvQSTlIY7vyduRrXY+Whs1e6Nxto3lEXrxikMP8RAMkvmzo1OGZMKRO8E
         V5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414390; x=1720019190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3H0retfhFt4B0iNuv9mzfbvoCs+7PaztlvT0U+sfS+I=;
        b=djYcrp7mczQXl/vwSSlRVH9D1ywoAYsr/kUmCzuS4B6G5gyn27qw4Rlp//+zjudGv1
         lFeNtWIELjVySYjsNT4DSTOxJxhzfuhJesxzKfsdlhp5HqpykOtZlv6lrmiQwu2RkY6h
         1IByxbgfSwYC/VmoGUa99Hd4NiJzX8EHNnDNEm0W3KLjh++ElWIW2n8ANfy5dor/8GIk
         CJ6yhbcaCFb4DD/T5FzNDyI1uxsyEzlJ6keCFXQlX4o4Q+xve3pNj6VrsLGF2dPYF/y5
         RMeSXdmgQ+Dy4+6kl+tBV7sKeEZphO268Gr8s7wfXYuUccbGU6sInrEvgH1enCq/BOg9
         LJIg==
X-Forwarded-Encrypted: i=1; AJvYcCWIpCXQcMTPz94vXzx3KDTOhfvWKbMi7zuxJeHVRqZHeKjVmh65F383wujAIbCnW2N6HXWwR0wDa8NTcPJf5EWXWhZsmUzNsh5r
X-Gm-Message-State: AOJu0Yz5OZMzayyBBfrKUZRx+nEuRf9sTpNT+0kiSysR7HBHeAz1OqwA
	u8BxFSPNPICMhZzxHwVbbO3XOuACrMRBGXmiLT1nB74bUQkOKZvZtUcyNofDVk0=
X-Google-Smtp-Source: AGHT+IEbHUH0Hr2jKTFaqkcPtABDi3J8yQL+WQyyWj+YxUiTMj8jrSPicsGXlmPwL9shd9LINoNVMg==
X-Received: by 2002:a05:6808:1389:b0:3d2:17c2:8301 with SMTP id 5614622812f47-3d5459cf707mr13133890b6e.30.1719414389687;
        Wed, 26 Jun 2024 08:06:29 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5345a558esm2297700b6e.38.2024.06.26.08.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 08:06:29 -0700 (PDT)
Message-ID: <c1fa9380-7d69-4cf0-b540-4dd22c3272b7@baylibre.com>
Date: Wed, 26 Jun 2024 10:06:28 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] spi: spi-axi-spi-engine: Add support for MOSI idle
 configuration
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, broonie@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nuno.sa@analog.com, corbet@lwn.net, marcelo.schmitt1@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1719351923.git.marcelo.schmitt@analog.com>
 <072d74af9fc624490b84a1d001039424e572e827.1719351923.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <072d74af9fc624490b84a1d001039424e572e827.1719351923.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/24 4:54 PM, Marcelo Schmitt wrote:
> Implement MOSI idle low and MOSI idle high to better support peripherals
> that request specific MOSI behavior.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
>  drivers/spi/spi-axi-spi-engine.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
> index 0aa31d745734..5a88d31ca758 100644
> --- a/drivers/spi/spi-axi-spi-engine.c
> +++ b/drivers/spi/spi-axi-spi-engine.c
> @@ -41,6 +41,7 @@
>  #define SPI_ENGINE_CONFIG_CPHA			BIT(0)
>  #define SPI_ENGINE_CONFIG_CPOL			BIT(1)
>  #define SPI_ENGINE_CONFIG_3WIRE			BIT(2)
> +#define SPI_ENGINE_CONFIG_SDO_IDLE_HIGH		BIT(3)
>  
>  #define SPI_ENGINE_INST_TRANSFER		0x0
>  #define SPI_ENGINE_INST_ASSERT			0x1
> @@ -132,6 +133,10 @@ static unsigned int spi_engine_get_config(struct spi_device *spi)
>  		config |= SPI_ENGINE_CONFIG_CPHA;
>  	if (spi->mode & SPI_3WIRE)
>  		config |= SPI_ENGINE_CONFIG_3WIRE;
> +	if (spi->mode & SPI_MOSI_IDLE_HIGH)
> +		config |= SPI_ENGINE_CONFIG_SDO_IDLE_HIGH;
> +	if (spi->mode & SPI_MOSI_IDLE_LOW)
> +		config &= ~SPI_ENGINE_CONFIG_SDO_IDLE_HIGH;
>  
>  	return config;
>  }
> @@ -646,6 +651,9 @@ static int spi_engine_probe(struct platform_device *pdev)
>  
>  	host->dev.of_node = pdev->dev.of_node;
>  	host->mode_bits = SPI_CPOL | SPI_CPHA | SPI_3WIRE;
> +	if (ADI_AXI_PCORE_VER_MAJOR(version) >= 1 &&
> +	    ADI_AXI_PCORE_VER_MINOR(version) >= 3)
> +		host->mode_bits |=  SPI_MOSI_IDLE_LOW | SPI_MOSI_IDLE_HIGH;
>  	host->bits_per_word_mask = SPI_BPW_RANGE_MASK(1, 32);
>  	host->max_speed_hz = clk_get_rate(spi_engine->ref_clk) / 2;
>  	host->transfer_one_message = spi_engine_transfer_one_message;

The driver already has a section:

	/* Some features depend of the IP core version. */
	if (ADI_AXI_PCORE_VER_MINOR(version) >= 2) {
		host->mode_bits |= SPI_CS_HIGH;
		host->setup = spi_engine_setup;
	}

So I would prefer to add the version check there instead.

With that change:

Reviewed-by: David Lechner <dlechner@baylibre.com>

