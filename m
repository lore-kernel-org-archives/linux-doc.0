Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32439150B
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257687; cv=none; b=JiCVIboTUFN4KPVEJNtiDLHH6qqKf/Ar6G2P/7U4HinL6+FrYCibVl6N0vA1pzbTxxf/MBeAOqWQ6h5OnByDJei+XU5Iqs+4ufD0JQ+OeCV9xQDgSHW6iSgUzBGIoX5MqfJxDywTZO31z4g2Ok6+PoADgIfs7rfegDLMac0DHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257687; c=relaxed/simple;
	bh=jhSuL7gt9VIpF/6X00TJsqok9yskPwKTngvmyB336xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRp55ODMhwgVkqrhmIx0GgaiHZtBiMPb6zhd3RGSwzUf1xxDposEMFa7yCgrjdJfCrErMOkn+6GYWb3M5cMp5O9X1v2Ug/LyC3aJtodvR5vC4Xf1ARXbN7dpf6AS1YPhZev87iHQO2e495FKQGjaYvFSgji4J9ltCZ1AHG6+3RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9BEWwb9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9BEWwb9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de0093c42so75908f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 09:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785257682; x=1785862482; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lW1gGRbXyp32cWc8RnOmCHBS0mWa+Js0uD7RvlhagQk=;
        b=L9BEWwb9mNi3QHRZxtd7JNr4cvX7ydc+N+epqEtJSvddyzuWq8fcOlUSDFU7GeSXqP
         nPqFi8lDfrqWyOVnsG7M2cibJmeYqDpXfWW13ftLfEUmb+r/VKKf1WXwQrw6qg2SRBNo
         Zp34ZR5WXKIMESAoNhMw+f+jTJs39Pr6pT7WlcIrqiU/kAxJoIKp+B/lunlEYtnkbp8n
         qCVYQyTmNyNoo8MA6PG3wdt2UU+4lG0dd7GpAOaiA/83l9IKDSC7FJw53a8OLDpji2Ah
         WjAKZDeeDA88HpkLh5Pc+hMtnU4xAxOpUMBen0l9E0fHn4Yf4RIyWrylX0T230sMZYmi
         A34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257682; x=1785862482;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lW1gGRbXyp32cWc8RnOmCHBS0mWa+Js0uD7RvlhagQk=;
        b=hKx2nIQbb5oORQrG5gUJlB1Ba6QapDxgl4dgz9jRhpKAG4eGeQwwsv84Z7HsyQdhH3
         Azd8UHifeY53EY+1ZER58DiJ9ROk3a9S4fTF5YStd+HpbV3D7w2S/2KGDmZiAJlDNhOR
         JkNr4cQM2Do8n3ZnIdSkRpZTPBS6UnfYeAnHgW48JU7j20P6YOg7Fc9jc/OQ5mOeJP68
         wBdRxyGrmpsc7pGRBCay2JLKCuvDTF1fHL+uu+6vM8KLKT8n6Une3Ncy9crt934uy+4g
         lpSj2HSh5SZ+Oep9ZvkH2ZXkSGA8PNeC964ope16zg5lZbxrIGSr9Q/eoAjCwt08ykF2
         MwIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Z+BPXaADiqpoVMN0+syhQiaIkjoEn2yBwgMNSPg5ZZHEXmbaD2VxVXX9eIlEYC5yzQiupXiqYBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+jMuoz+8lu1svwd1MFLcOKY1Q6KFZHQAPJ4mJhEzi7Wog8EMk
	Vbhw2DnBNQZSGsqKDdbXY2OkhpQMa6YDQ8gQ9x2K6UZ+XWhkuENb6I5V
X-Gm-Gg: AR+sD11RsbirvKQyE3XNwU330QYF/Dbm2DjBnZusLLfrBdU+udiXgrno8MOGqDAR8KL
	X/XN2eeV0KjCJ59O2eAYR0RfWFpbkA1+im/UYdjhYAZs6fiWjqcq9TDzR3HiSb9zScMJQE5q+bU
	ICDAjuuVQ2Wun5iMNIvGFEDaD0GMYu5Z7JjC5USfJLfB7FRfz2aUiBspyBWJdV1PvnsUj8BihyL
	zHYpD3Whau3EiVK86ApFULmp/9vMc7N8VNGQxuBnXJI0xnnlzs6azXuHiNMjBU6ZNlv0rLsRDnw
	qzCLlrdR05eFoBCz2trVVbpLhZK/+CTfRGdGFSriD1glxeyNY9QQGb3ogv9//m1TzddBo1GK/mK
	OTcHsDTCAaAxkpEs8H+WHV47260gRGE8J/g5HC8Obim+CJAByrhCGpVuhf9Euko+Rnqvecw==
X-Received: by 2002:a05:6000:471b:b0:47f:90a4:ff41 with SMTP id ffacd0b85a97d-47fb1ebbdf8mr3941679f8f.58.1785257682051;
        Tue, 28 Jul 2026 09:54:42 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm495883f8f.6.2026.07.28.09.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:54:41 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:55:50 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, 
	Marius Cristea <marius.cristea@microchip.com>, Marcus Folkesson <marcus.folkesson@gmail.com>, 
	Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>, 
	linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v7 1/7] spi: dt-bindings: Add spi-device-addr peripheral
 property
Message-ID: <amjfAV5HvcIxOdv_@nsa>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-1-7781cd74ad75@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722-ad5529r-driver-v7-1-7781cd74ad75@analog.com>

On Wed, Jul 22, 2026 at 09:54:13AM +0200, Janani Sunil wrote:
> Some SPI devices support sharing a single chip select across multiple
> physical chips by encoding a device address in the SPI frame itself.
> Add the generic spi-device-addr property for describing these hardware
> addresses. The property is placed on the SPI peripheral node and may
> contain multiple addresses.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---

Acked-by: Nuno Sá <nuno.sa@analog.com>

>  Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f624566..b59d047cf117 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -142,6 +142,13 @@ properties:
>      minItems: 2
>      maxItems: 4
>  
> +  spi-device-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      Device addresses used when multiple peripherals share a single chip
> +      select. The array allows one logical peripheral to comprise multiple
> +      physical devices, with one address per device.
> +
>    st,spi-midi-ns:
>      deprecated: true
>      description: |
> 
> -- 
> 2.43.0
> 
