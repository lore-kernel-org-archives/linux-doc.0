Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDEC22836C
	for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 15:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745941219; cv=none; b=tMYni9OSmIDdKwoIP+7HHy1k0qADma34QwVLUHbdy2Bo0oOP7f5HGgmUeikaM3jgSyyxCZzhw3Wer8I/fCrWI9OHQbA08N2nRb65t8mOAXcH7nTfEQ2MaKMvpUN8alVnfg+QpxGyhMgnDGs4hAnLVYAplEcuVunPWcMvorA6a34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745941219; c=relaxed/simple;
	bh=ZSlaSOOnAD2Cp1tBIlvme8AqpEDC6hlg0gqvRaVTa9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SMBemEw7Bff9rfnXSUvyvjXR+0dN5rv8OI5MTzfRjeyDZsX6rn56Q710xq1SrxfC4CjDnGexVOPlzFWoWzmawNw7l50jal6MsGzXGX3pgyoJWtYHVNa4vbDTet5Igl0vQ9RsFT/xT04b0L+TPc0elQ0CQ5tUUzdZ17F52f/Gmjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YcjTq8pj; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YcjTq8pj"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3fea0363284so4130329b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Apr 2025 08:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745941217; x=1746546017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKHZLFnrfagn8Gc44g2MZTpXJ9t5oidezhlrUDWVs0Y=;
        b=YcjTq8pjS1P3iyQIQa+y+f0PTT18kC5URqpqC9eSdoczJ6mSQCMKAsI7zZbclH4vdV
         HqaQfHUEd7ZmdewTEWlob4/Yo7EF5XyM8iH2A4SKgdq/Der4dxzrXCW3zsXwDofH2gHj
         3+gBjYxeR3a2bCKBoKBdhdY+hU++Cvw32RsEZ/x6ZmbGygg1VyCTEyNzKp0r+EDN6drJ
         jjYYPGdxTvwkPHX6c5FAZ0D7+2jhC9wQLn1z5mw0SJTVzYcyzXmGZm7e1QEMOf/IIPkj
         CTcD37u/Qmw9ggMLLHLLW7v41et1kE4yrw33wtRjv7LA17ZtgYwBPY6G5jJ9WdrBg74H
         pSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745941217; x=1746546017;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKHZLFnrfagn8Gc44g2MZTpXJ9t5oidezhlrUDWVs0Y=;
        b=Ph6FzYROKPKqgUsXPwJ+w1davC3VQLj7CuS0dlY6IQS8UxO/uToTnmuaz3CmURzyPg
         5JhrWb/1E0i/lRV03S6ocAqLc2artCLB/PMBsRFYeat2w+G7OfRuxSW64v+CYHthAukH
         yw1vYME35anwzjAuVzpaFgadhddr5AVlSDTt6YW1g1O/8RR1INlvJRypzfKkmPrBwCJQ
         09cCzfSkL4h7PykBZg/tipvC9xcuUq31PNNtMl2s2tfZpXtHaV3gjLTM1m3e+CL2T0Ca
         lDirjlhyz+F1wGz3odHdtRrKSJ14cJUP79PLVlvqpebgA1pAva0JEZMq01UJ5gi5GRau
         zpbA==
X-Forwarded-Encrypted: i=1; AJvYcCXsfsD9F3P6NwLKkv21IKWhbUxHK3yjGVIGqFO2Dm7V8C34eABJ6hQiFZusNiW2wKqLvXk2n1VjTBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4/H9l99LbcpCIcQFaYey/p5WvUVbFzn3Tz6JAoGawye7uze6Q
	8jM71ymKpkBlc0i2ViVPkjrddkfMk42oE2gF64Sjlv7smJQnyNaCSDkg3mi09D4=
X-Gm-Gg: ASbGncsQU8dEts8cW33/S4Zxck3xp0sumZmIsnW6eaTHbKKDUEeYopx9qYVGp3aEoSM
	M+8TVJ0xr6HXEGGMiyenbl1lsZkUVE1q4mjIgmIgX3fhfLTqMgQfqdsIqMhTWZvxWz8RbHv1UQX
	rX1dr2fPH1MamIdwdkFfwsgCeNckW25BHFET50JRXSX52Wtx0jfmkkMoYDOs3vWvtmPcLkNy6tf
	bJszh4+cLs0iSAYKH7e60yHzqStOeckx3NOUBGDAisZZrCop/o3U9vNk86WXl36LjCYcNuMAhLR
	vSdpNY5Ji+FrA2JhnIYAfA/Ufc9U4Oe67ctfIlneeFNQzmEBj9zL22TsKp3Btz6kEOZzVgwtl0p
	iiUxXOOC/mvdfGxxHYvd3slPTXPOH
X-Google-Smtp-Source: AGHT+IEoUSoJwOEaMAzGJzx8g+iEjy8VILrk9/hm7FHFKGMS1oJnNn7zWdRkCw1+SUiqaiAkTKDS6w==
X-Received: by 2002:a05:6808:2214:b0:400:7dd3:2dbe with SMTP id 5614622812f47-402110303f0mr1770338b6e.14.1745941216954;
        Tue, 29 Apr 2025 08:40:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6? ([2600:8803:e7e4:1d00:dc17:157d:e8b2:3ad6])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40212c4d567sm293636b6e.43.2025.04.29.08.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:40:16 -0700 (PDT)
Message-ID: <5aa4d76f-6f16-40ae-9dbf-767c63aa0a3d@baylibre.com>
Date: Tue, 29 Apr 2025 10:40:14 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] Documentation: ABI: add oversampling frequency in
 sysfs-bus-iio
To: Jorge Marques <gastmaier@gmail.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250422-iio-driver-ad4052-v2-0-638af47e9eb3@analog.com>
 <20250422-iio-driver-ad4052-v2-1-638af47e9eb3@analog.com>
 <aAe6u6NhAsgjaL5_@smile.fi.intel.com>
 <c3i7g273lgvx7rpihzq6r7exxxnglbwrqwfryyz6ciqo52tszf@cvi7pz4bmkvq>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <c3i7g273lgvx7rpihzq6r7exxxnglbwrqwfryyz6ciqo52tszf@cvi7pz4bmkvq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 8:47 AM, Jorge Marques wrote:
> 
> Hi Andy,
> 
> I agree with your suggestion, and in this case the appropriate kernel
> version is 3.10.
> 
>>
>>> +What:		/sys/bus/iio/devices/iio:deviceX/oversampling_frequency
>>> +KernelVersion:	6.15
>>
>> Then why don't you put the real version of the first release that has it?
>>
>>> +Contact:	linux-iio@vger.kernel.org
>>> +Description:
>>> +		Some devices have internal clocks for oversampling.
>>> +		Sets the resulting frequency in Hz to trigger a conversion used by
>>> +		the oversampling filter.
>>> +		If the device has a fixed internal clock or is computed based on
>>> +		the sampling frequency parameter, the parameter is read only.
>>> +
>>> +What:		/sys/bus/iio/devices/iio:deviceX/oversampling_frequency_available
>>> +KernelVersion:	6.15
>>
>> Ditto.
>>
>>> +Contact:	linux-iio@vger.kernel.org
>>> +Description:
>>> +		Hardware dependent values supported by the oversampling
>>> +		frequency.


I don't see oversampling_frequency used in any existing driver, so how could
it be introduced in kernel 3.10? I think you confuse it with
events/sampling_frequency.

oversampling_frequency is new and so 6.16 should be correct if Jonathan picks
this up in the next few weeks, otherwise it will be 6.17.

