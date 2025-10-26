Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB23235358
	for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 17:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761499347; cv=none; b=dDbLU+QQ3yChaV/pgBWwCO5c0W9MrmyH0MUqsqa/60VFq67rk4SYctF5ocOxurxjGpst2g6en4TLkDYoW2xIKd/YwgpOC+HL1pLigF1s6w6P6Nn29JAJhW1Eg//2uQ03uqU4vsYRE9SIF5zYRvWSCFTnUDiNuUvrdXwsOxlOCXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761499347; c=relaxed/simple;
	bh=4vmKXbMbi3uS/+iimrAV+j4b9FQ1EGNT2VjwMdwyTn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SWxbDTf1ihzi3UscdSL9ULLZKkKplS4ztq1IMTQrL+ZriN4j6CroTeBlj2J1MAZFA72xliEIKPbSe1BdBIpFW/8RCcKszK2cGViZsCTJqhzyjZ3EHdcAMc5pBNIhOS5WVRgnQ+303D70DGDnupEdWTj9z2VfC3UIa4+0j91T82g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EgtI2AHA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EgtI2AHA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-78118e163e5so4184356b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Oct 2025 10:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761499345; x=1762104145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x4Pos4CGzqmt5WmekPT/W8etclQHpUj/UrvrixUMDVI=;
        b=EgtI2AHAr3QBbI/iBYbxu3Dn+DxUm5XA9WXaPdMTlM4WE1DLB30fFr3aW0EzHN4z7o
         i4pONdqzxA8XV8CWcQlxwByxsLzireLrT6VtqyQTTFM4h8d8FCToU8+aoNcp27pTBwPq
         b2MemfEsP52lxRSVqgNlVxT2LTopNz5/xJ6MOk0DHGOiwpF1RzFaou19iOPWD70e3PZC
         OMbqURAbjPWZYaVecwcx2BTrGg2SWskT+TCV7eypmDuMbUHZlcPc7jJzAu/NC8mJ5Yzp
         ld/SeKzkNuKCJG9ouvhrfmcO3Pvz2QzelS3BgaQEWIadzqwZhaUTZ4ZwmWnGYL+tgpN5
         AClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761499345; x=1762104145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4Pos4CGzqmt5WmekPT/W8etclQHpUj/UrvrixUMDVI=;
        b=QcvW7Jb0LjRz/CemwjFDal+6kTULhmac9J2PSKJHCech81M5Ddm/PcLVR6WnZXVA9z
         uCTYFd/0Gqt1WrmkEIBLDG1duHuhjru9JoZmM6xCtELn1QyRkzokF6Mwvqp4V9UWFMc3
         mbr83rq4JRHX5C2HjkoI7RDbjzph8xms8J+bRHQxlRQEZUpROMOhQmzpf9dKnm3/Dbk4
         kKtssyblCZa3FZmhqshDSYaI9dM1LCCT8QIJzO/Xl2+wfnC+dxP1IfAhEgVLg2weCogC
         YcNOB8Ui57KzuDh8uh9p7P43iVZ8gNyAAG51vCEOVS3XT1NCocbRTNHvvIe/P24Ab9am
         Hxcw==
X-Forwarded-Encrypted: i=1; AJvYcCWG3QleWx9HSIrTqvmkWV6iOmdxLhJkeofWYHldCOqPWDWGCSGhe/BrK06XkviJ9hvAa5EsLZhU3tI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsOFE8egqrnx63xL3dzu6cQkQm0o4JC7Stlb276vfzxMO1YjSo
	NXaY4ORV8xfCv8Fr3u/c9uGmg1fSemrz//wPtCoQ0Usna0BvVdOLWDFu
X-Gm-Gg: ASbGncuDCVFBtaMI+vNPj2GNd6iuWoYKP7UBOvYXk1esMh6XvVv5kT3QyA1DZDlV1DY
	QVK5dM/v5ne0oZOSqs2ofWnXbU+kyFJZi04cSrx7dtffPg/jY7YTpTO+gmjZFUyz87oMKyA4yr5
	yJVFd5E7xHRZySTegLB9AWeQWvAjYyPQV0Om37BE+F5Jpo2UtRZDrq0b55vyrLFbpsC6VBhZ5wM
	lYNsdbvjSDLF5GB21VUK+NyzUkrRNLFOrGiynO9lj4ITtoD41nPCKsCrhqHgcsItUi5AVEEkU/8
	C0q3KibW/yTH5/zXwSjLGBc4jr/QUkBNHSA2yODoUGb8FMWNPKkktwGs1C3734XAiEorOGNCCm9
	JR6ys542E9sW3hc6sAm4tfWM145CvGe0A090c2td/kjNqSY6kvyjjKunf5mnr3MDKxKXUiQdCSA
	CZbEng9/jAXYhhwdyXHOthxovQkMCQdh8ToYzjitMSAOUgNqrr
X-Google-Smtp-Source: AGHT+IGTYv6tWrPIGkNkmo81p5BgtVsYqslTvhA7eHcXu58XjVEPnZbVQvHL2n5FT7hOuyScz8OMNA==
X-Received: by 2002:a17:903:1b07:b0:278:f46b:d49c with SMTP id d9443c01a7336-29489d8f73cmr95223545ad.9.1761499344967;
        Sun, 26 Oct 2025 10:22:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81b40fsm5681091a91.16.2025.10.26.10.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Oct 2025 10:22:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <635af2ab-969b-4390-b661-44bf171eda7c@roeck-us.net>
Date: Sun, 26 Oct 2025 10:22:23 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641
 power monitor
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Igor Reznichenko <igor@reznichenko.net>, linux-hwmon@vger.kernel.org
Cc: conor+dt@kernel.org, corbet@lwn.net, david.hunter.linux@gmail.com,
 devicetree@vger.kernel.org, krzk+dt@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, skhan@linuxfoundation.org
References: <20251022044708.314287-1-igor@reznichenko.net>
 <20251026065057.627276-1-igor@reznichenko.net>
 <20251026065057.627276-2-igor@reznichenko.net>
 <408c1698-a8ad-4e16-8def-352c2c265f5a@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <408c1698-a8ad-4e16-8def-352c2c265f5a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/25 09:32, Krzysztof Kozlowski wrote:
> On 26/10/2025 07:50, Igor Reznichenko wrote:
>> +properties:
>> +  compatible:
>> +    const: st,tsc1641
> 
> Subject: I asked to drop "binding" and not add "support for". "Support
> for" makes little sense in terms of binding. How binding can support
> anything? This is the "ST TSC1641 power monitor" not support.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  shunt-resistor-micro-ohms:
>> +    description: Shunt resistor value in micro-ohms. Since device has internal
>> +      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
>> +      655.35 mOhm.
>> +    minimum: 100
>> +    default: 1000
>> +    maximum: 655350
>> +
>> +  st,alert-polarity-active-high:
> 
> Isn't this just interrupt? You need proper interrupts property and then
> its flag define the type of interrupt.
> 

This is a value to write into the chip. It is orthogonal to how the interrupt
is reported to the interrupt controller. It may be active low by the chip and
inverted, or it may be active high by the chip and inverted. How does one express
an additional inverter in the interrupt signal path in a devicetree property ?
Can you give an example ?

Thanks,
Guenter

