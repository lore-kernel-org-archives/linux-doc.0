Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6440635A952
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967693; cv=none; b=q20ljzzI9wgm6NFl//oDX2goWGABXMXKjlMRB/GO6sUURu+tY0QByNm8itrLK5u5F4vNA4R9ZfPigEZZobt2y59XJnjE20NVr16/NkEWTu3eZKvL3RbiqIW/85WR0dR6j3E2a5RgIoGm2X7ZT/NzEE/rEMuEvJU4mhIfMb4vu/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967693; c=relaxed/simple;
	bh=qM4OzjmvdOSaKgv3mmsNcBVzz2Wq5zOBOAGMLzUa3hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MO2v2TubbunPl3dAvfOP4FkePBrnRb1Xu2ODCJX56JwjhVf0cBU6hVbZnu7GsW18BuOow/NpU/g2E69xushubrIEdrLrOaUAH0l8BIU/Og+MO1vE6YjAeEQqbxwUnxQ9xYhQ6rkkGddru5h7ey9AOspPq0Fast/HkoWGgpJCYr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PK90metz; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PK90metz"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso39652775e9.3
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 06:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767967690; x=1768572490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qMdtktVPYLQdp20i3sGMyB8hcMRTbHonc8uUiEXE1Ps=;
        b=PK90metzIaFqXFBmFQU0RDVGAm1K5o04smnpr8ikxSAk/7pqrpN8vkkgW3TGwwoXNl
         yA6HUx1vH7huw1uRsRHqnl6rhWskI4r9jVCX0masj6ie1Yob7oilHIz0M0py9X3Eyrv5
         35E6HjO5bde1YjVU7ZUlfLaNIj2cKKmUXFydSFmGA1Hs+D8+Wsg6cGGmDOa96tDZ4hoM
         DmxEqCy4ovrATJuE9pTvOdD9bepTrgUXQ8sss/HO+NRl1vVMy5IETC3RJ3ziaUg/xn/S
         5o7tyR1dz2oU78FnyoN0uwUIpmnmlM0LeLW4HsYEXVPEnwgGOZC2H85F0HYIZ/5U+d8R
         5D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767967690; x=1768572490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMdtktVPYLQdp20i3sGMyB8hcMRTbHonc8uUiEXE1Ps=;
        b=ohui9rPCFQkjzRoSjJzF1/fgKYA7TRGuKiuJGRZPpJ0mm1MOcJNFTSj1VYTKdhmVDr
         XEAq5+yPNk8kq3syYI7hlwTDIeH4KBFfyHYoYSOB3XHLVjQBCE0W9Vffzj0U+1rPr7Fu
         25KW+WpV4as+zlj+4vLE7NdT+hBxB8bwdPTTXmm69PIPFevEa0orPvWtJJOV2E2fvNt/
         IwlQ0Nyme++f04E2jE3fj8SEV7cZvt0ATZE32+0aJUGURLX2mtUvfE23JtfOhGn2+1TK
         Nz0W6JIAIRe7qjBy4ZrBSMnngim7TK6NHGVz8SZal9DFTXbABeXCLaKCTEU43OhfBSfW
         V45g==
X-Forwarded-Encrypted: i=1; AJvYcCUUj5vlCzqY0tTEXvEME4Wch9ZmoZDSA1ixTCg+U0FaVJwf1ABHS2Funt03I7uxUdUbD8SXz3JVtcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZsUNdBmjZgcjz+ohNQaBjm2/ZtlaEHVwpOh8VMRfM8Py0uA3K
	IwgrygjeIWiNn952MZ4prs7tVSXN5yy2kBPFgv1RsYZYQlOKzZOKDmPV
X-Gm-Gg: AY/fxX6XLbtdjUZtT1pVd2CyZ3HT+UZrlFp8QIwPSrqIB2JGoc3CLg7+5+T0bV6tPLQ
	x4GKNqzJaM4DLOJxoOXEzaUUf/FrCZ9X7ViUtCyS0qeYBYBcIRA4CQZt/j5gUxgO/4XS1gEWgp6
	ajKQ8rEBnkYvBU+FqiETj0twljCQ8Uh+GSoKKx4dDXaV2exB1+hP0pasIpBN9XAS9JMB7hlTByX
	aFPyB186oL/oRcwyvKhBmfvpkkPTLJagNQ1m6roL6jGV0SV5NaA2KlcUYMIBaQVDa9Y2GPMfnTj
	gvOuMhWpuWWbI8GSzQv8R+k2/gUR2oBzGPXY/forr4sG9AtcYpiLHn66IIUkrchqefO9oELSmNI
	b8IQoG7vltu4kW/Bc2jvK65Pn2K2CNTUQfgv3paAjAQn5jE+pOCTIvzAwzgjZLASbDxv5gHBqXa
	FYQfw2e1WT+ElkIHs=
X-Google-Smtp-Source: AGHT+IEW1P2FdJb52OHGZMAf1KlZ/qNCYOV/Vkk/nXNZ0uETDqC9KRFPngmTvu01WHkiH0xdVBiioA==
X-Received: by 2002:a05:600c:83c9:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47d84b3b650mr111945045e9.26.1767967689454;
        Fri, 09 Jan 2026 06:08:09 -0800 (PST)
Received: from [172.24.138.145] ([137.71.226.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653c61sm212023925e9.10.2026.01.09.06.08.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 06:08:09 -0800 (PST)
Message-ID: <cd918f27-3939-4987-ab5c-3d88572e6e0e@gmail.com>
Date: Fri, 9 Jan 2026 15:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: dac: Add max22007
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, jan.sun97@gmail.com
References: <20260108-max22007-dev-v2-0-2506c738784f@analog.com>
 <20260108-max22007-dev-v2-1-2506c738784f@analog.com>
 <aWD4LA7Y1fl3yvh-@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <aWD4LA7Y1fl3yvh-@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Marcelo,

Thank you for the suggestion.
However, reusing the output-range-microamp and output-range-microvolt properties might mislead the users into thinking that they can configure the DAC output range, which the device does not support. The adi,ch-func fits better here.

On 1/9/26 13:44, Marcelo Schmitt wrote:
> Hi Janani,
>
> One extra comment in addition to Krzysztof's.
>
> On 01/08, Janani Sunil wrote:
>> Devicetree bindings for MAX22007 4-channel 12-bit DAC that drives a
>> voltage or current output on each channel
>>
>> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
>> ---
> ...
>> +
>> +patternProperties:
>> +  "^channel@[0-3]$":
>> +    $ref: /schemas/iio/dac/dac.yaml#
>> +    type: object
>> +    description:
>> +      Represents the external channels which are connected to the DAC.
>> +
>> +    properties:
>> +      reg:
>> +        description: Channel number
>> +        items:
>> +          minimum: 0
>> +          maximum: 3
>> +
>> +      adi,ch-func:
>> +        description:
>> +          Channel output type. Use CH_FUNC_VOLTAGE_OUTPUT for voltage
>> +          output or CH_FUNC_CURRENT_OUTPUT for current output.
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        enum: [1, 2]
> adi,ad74413r.yaml has many possibilities for the channel output type.
> max22007 is only either voltage or current.
> Can't we do this with output-range-microamp and output-range-microvolt from dac.yaml?
> Figure out the channel type from the output-range- property?
>
>> +
>> +    required:
>> +      - reg
>> +      - adi,ch-func
>> +
>> +    unevaluatedProperties: false
> With best regards,
> Marcelo

Best Regards,
Janani Sunil

