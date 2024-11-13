Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52666174EFA
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523563; cv=none; b=bAIMsDphQu1mmCJmIGNt8byzwZP+EwMRfR6oR/fFdxmcVkKXAT1wbjCImtvTjAwXjvJ+7pNuT9EaIz3+Gi6QcPuG155sBKpF+2s7aaOyJ4ZX07WblcN1CL5O+H2KW3y2bIGa1yBP942Pl6Jo1xeKctBPFfUB+ciAbWsH+Sg50kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523563; c=relaxed/simple;
	bh=qJpxyAs4H+dTLoeEZp4VwJIFz2j9VXgI9Zeo2ZAExbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TzvIPxlyL17juuDeUU02z8xyJT7M4cDc3k00O4yQtla0unGeVZgmh2gSrTOG5cnVftgBo0hNu26oDjBZqjF7yuwW3lN57BfE+YbiwaWjXyFazw7WGkFB/jvHUbB4WAcl0tyR7cxh2RuQp7YwmQJhOVgrGDoYFj+4wnoKjHkLF/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=agLeTEUf; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="agLeTEUf"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-28854674160so3141711fac.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 10:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731523560; x=1732128360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJ7Y/M/QGwKyB5CvuHkhSVy962R5KxlMZ/Ip0/+E6l8=;
        b=agLeTEUfStG/SX5jUqWSsYj/dB3fR/2DLhiNGYufvz2ex0Zd9/vxeCEMmw7dd3RmDW
         LUm5VWMTPeXf3ge4H1Cqru8HdrMmQQYDskEnYp2rBBedrFaV7pCb847eIrm4K3DxSeMa
         N64H5jiG0cbHDY6gNICEdWroO7+/Bk07v0p50SbxUWFMxEn3OmcHOdfDW/NeGJMJImul
         j7R07k0AOPf0fy4bccU6qS/BfvXapK/jEfvxliKN00uDF2laPh41HxbEaaKzdAjfeBaL
         8lyufTGBRYrKJ/05rPTpUcy0LDekRpCpND51sPh8Bgo03yaSLUv7APpryml0IgqLmfk5
         v2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523560; x=1732128360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ7Y/M/QGwKyB5CvuHkhSVy962R5KxlMZ/Ip0/+E6l8=;
        b=ViUcVIj9d0W82Bj/7wfcXdqwu8LcmORGyHfNUhzTP55gCU8KGGCPjpWshoEyGOc56C
         /C1B01pG15I9E7rBasR+wZeY5nNe9sZF4Ms99ChxoRQAO7RDiYCZy9C6Alnqk13ix0Ai
         UzXSVOGg5i8Dd0INfxMrqlA2yeV6Gmj89xy2HBZ3kGNu99nKPydtE/QJpr6M+ADr6NUN
         nHIKxlGvr3efjZo+9pbS/ebiXoBtUG8UH26LcPhLYzl4AfZMhoxHPQR12n8DIt1mPWle
         DSUbOGTHsC38N18ATSRHmLsG4CZbtl4ZnVDcSK7OjNrMgtaJjx2rv6vSz2F4U8R+/NEf
         2Miw==
X-Forwarded-Encrypted: i=1; AJvYcCXy7xXq9BsWxNNFxFqV2rCeMpsip1hOIFj6VKAHSSZk7H1LPzwfQgRBbl+Ukh/pVGZURQX8X9ndHkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN8y/XstTpYN30eHB/h3i7XkUcek0K3+SpUKvY2CU//H+Av9U9
	pjBdE+wQYURTruEnBq/XHxUBvUVcXIDClk3sguTXC+9Vse56OavqHJYyJBZZ5Nk=
X-Google-Smtp-Source: AGHT+IGDnM8FDvc9dksVkdxOZk5+ligG6UwLyNCFDFxzr3nHZV7huFdENqO8b10hbKcokqz9jofFmQ==
X-Received: by 2002:a05:6870:70a2:b0:288:a953:a5c7 with SMTP id 586e51a60fabf-295e8d6a2bamr4648440fac.14.1731523560424;
        Wed, 13 Nov 2024 10:46:00 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a600a23cfsm827198a34.66.2024.11.13.10.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 10:46:00 -0800 (PST)
Message-ID: <ad1b7946-02c4-4447-9b4b-1d57200f482f@baylibre.com>
Date: Wed, 13 Nov 2024 12:45:59 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: iio: adc: adi,ad4695: change include
 path
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Hennerich <michael.hennerich@analog.com>
References: <20241113-iio-adc-ad4695-move-dt-bindings-header-v1-0-aba1f0f9b628@baylibre.com>
 <20241113-iio-adc-ad4695-move-dt-bindings-header-v1-2-aba1f0f9b628@baylibre.com>
 <173152191678.1024361.7493718883312810903.robh@kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <173152191678.1024361.7493718883312810903.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/13/24 12:18 PM, Rob Herring (Arm) wrote:
> 
> On Wed, 13 Nov 2024 10:55:20 -0600, David Lechner wrote:
>> Change the include path for the adi,ad4695.h header since it has been
>> moved to the include/dt-bindings/iio/adc/ directory.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/iio/adc/adi,ad4695.yaml | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/iio/adc/adi,ad4695.example.dts:19:18: fatal error: dt-bindings/iio/adc/adi,ad4695.h: No such file or directory
>    19 |         #include <dt-bindings/iio/adc/adi,ad4695.h>
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Is this testing this patch without the other patch from this series?

I did run make `dt_binding_check DT_SCHEMA_FILES=adi,ad4695.yaml ...`
locally before sending the patch, so wasn't expecting an error here.

I know that normally we should be including the header change in the same
patch as the .yaml file, but in this case, I had to make an exception
because the same header is also included in a .c file. It seemed better
to not break compiling .c files rather than follow the rule strictly.
