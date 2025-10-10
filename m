Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EE52F83A7
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760113108; cv=none; b=rVs9jq/6N/6Kr+YfAqJis0uRS9yCPtD1smhzp6g3SFYkj/+D0pFNkazKoPnJwSvrWpSAb7luC7PZD4EO19hXBCaZOzL9qmPP0gCTwrDMnQf3usTTVymaVb4WWp0x+qx96v14TLWXn31apVl82ku/LiM6bRcJ3zMWo6GCuXyh2kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760113108; c=relaxed/simple;
	bh=FdYPXGm9deiD/Trs9cMfHlp7XbwPhfQIT9v/Wdt5nis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlNF2Q+Hi404quq0lMHe9pzty+MZ0Q1g+aOZ5t7LDUcc63vEqgejNJPeGagfqkS6XiG55cbBzuW0ohBnWIGhjzL8A0QJFKlyc28ECvLLNnUjg858H/3g7oexGVadUUUeXx7+2a9sQWJNKRpk26hKudCDTmhhtf/B+YBhN3PAtLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=k7VErcXi; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="k7VErcXi"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-30cce892b7dso1189488fac.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 09:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1760113105; x=1760717905; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9w68CQXC1xPR3gkxyDZirmm/itUJmtRYjrTWc5to35A=;
        b=k7VErcXiTSdSzA6bGBoScVNFENhUJPpJdaonLVk1Ps7NKthqAs3DTmZDCzckX/9dZ9
         gSHcKUynJ/G9OXQmWDE7pyKmvpPSJqihJsM6bEWkHAV3hCWq9kDE0ZuEWrjRK+PvEDxo
         zRqc/M/biXlD9FKLj2nHqIbxYAq7pjIt+AmLyk9U/hpPxKB2QyoD1Qfni+cmwNTd7KJe
         BiCdQ1DXKh6/smn0eWVowYxolCtYC6ZNHRL6nPWLp9dwWO6/6U+inw2iO7WuG7zmKhsP
         2x5ohFXFx53uczpwjTAXhfKiNfhC0atvYktW4UhPheAvh8cNVv9RG/7PmtMvsdncyTi7
         ZvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760113105; x=1760717905;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9w68CQXC1xPR3gkxyDZirmm/itUJmtRYjrTWc5to35A=;
        b=OLo7xhatQd8kYYW5IBhbUpMIIwdyNAQ0mYq3nzbHiD5lG8eb8puhQdQDtNgCcLz9cu
         GtjDTGdsqS27fn5Ov92FLC3tSGpqf+/cTXCBUR5CvZbnYgSYY64XimdIT8WTxrPxIWAb
         tu5gzUeBgVyxkhaxe/5/5z5PjmNuL4TfBOajmWa+96f551wL4+TryaCv2ygN6Lq1XFeS
         teoH7BqaKvUzmUBPCvK7K91VjTFU1ZH7WxLBP22++yjLOVVgPzgmP2FDhjnxEZNuQOyR
         6DuGU3sqE0eCPmQLkBBG/5Ll5/cFvLvICQRbFngVZcL9Nysi4ihkiH6wi+YTp9Ieq0qp
         Umcg==
X-Forwarded-Encrypted: i=1; AJvYcCULNQW6b+a6eus5qh4Fzebe1r/Cyd9VJuhfqHSB4/K/PSnHQ+xY3lfIuwQDxNqJmXAAK3H/9tvCvmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHxwysdoHsnMLNoyQVvD5Hu4w2TA2zB/pPjCG8jHX3Y2oPt9M5
	aCNiPsOfDAEs0y+NtlKVQSA7IzFGbmzGDMd7AVxauYxoT5xIhcRFC4ZDUYo5mw8FuFk=
X-Gm-Gg: ASbGnctb+1E8vMXadtTFgejtFZvujj5UqA6K1usVAnK5o+NyLqUdS4ns2IBWITefluf
	msJxHhdfRa5vofwLbZE/vZJF42IFZRmesPUEVazfme3LvNmYnANXSLi68yHtT/g/QWr60ODD/b9
	3LqpiPDTgVOQO000qtlB+OzzwxTQ2QncpOOaBH7scCQI8hvKlLtMJU/nKZwQLZVWGHYJEqGQoiQ
	Ucx8XXBxid23UbmZdez9UwVXrj0fmMGZiQW25KPgoLlvuTUe+JxVl/GN08n0zLkS3uQ397JS2du
	x8+rLRodSWh1KHiWdTJhMvdBwK6FEbbBEPi5HEQ+MkSIsM+qWslCilo/2+raR6m47SgykkUkDm3
	pDuvUZVvq5C+1B6QKAMIst/s7ERW+8vZemnHVmPebGubUdEr3Wk0M91GH7n7tYL/6ZW7LFL9/VC
	ayUt1z0PhURtFH1gM=
X-Google-Smtp-Source: AGHT+IHd0omg/rlvWPFBEqlcSVQAWZIDB8yoaKyD9jCTVYWmDrXVdGmrtHcE+pAoTAHuCLm4ZKiTag==
X-Received: by 2002:a05:6871:6d12:b0:31d:7326:c3a7 with SMTP id 586e51a60fabf-3c0f9e6cf08mr5691630fac.41.1760113104781;
        Fri, 10 Oct 2025 09:18:24 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6d3b:e3bd:4210:32e2? ([2600:8803:e7e4:500:6d3b:e3bd:4210:32e2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3c8c8ae1de8sm1007500fac.4.2025.10.10.09.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 09:18:24 -0700 (PDT)
Message-ID: <576b582e-7388-4ee4-9a4c-4f7e04fc3fda@baylibre.com>
Date: Fri, 10 Oct 2025 11:18:22 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] iio: adc: ad4030: Add SPI offload support
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, ukleinek@kernel.org, michael.hennerich@analog.com,
 nuno.sa@analog.com, eblanc@baylibre.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 marcelo.schmitt1@gmail.com, Trevor Gamblin <tgamblin@baylibre.com>,
 Axel Haslam <ahaslam@baylibre.com>
References: <cover.1759929814.git.marcelo.schmitt@analog.com>
 <2bde211f1bc730ee147c9540b88339a93b2983e6.1759929814.git.marcelo.schmitt@analog.com>
 <a86007ab148f9556af032f5ba61991a74a5641c0.camel@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <a86007ab148f9556af032f5ba61991a74a5641c0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/10/25 6:19 AM, Nuno Sá wrote:
> On Wed, 2025-10-08 at 10:51 -0300, Marcelo Schmitt wrote:
>> AD4030 and similar ADCs can capture data at sample rates up to 2 mega
>> samples per second (MSPS). Not all SPI controllers are able to achieve such
>> high throughputs and even when the controller is fast enough to run
>> transfers at the required speed, it may be costly to the CPU to handle
>> transfer data at such high sample rates. Add SPI offload support for AD4030
>> and similar ADCs to enable data capture at maximum sample rates.
>>
>> Co-developed-by: Trevor Gamblin <tgamblin@baylibre.com>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> Co-developed-by: Axel Haslam <ahaslam@baylibre.com>
>> Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
>> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
>> ---
>> Change log v3 -> v4
>> - Applied code adjustments suggested to SPI offload patch.
>> - Only select SPI_OFFLOAD_TRIGGER_PWM if (SPI_OFFLOAD && PWM).
>>
>>  drivers/iio/adc/Kconfig  |   3 +
>>  drivers/iio/adc/ad4030.c | 504 +++++++++++++++++++++++++++++++++++----
>>  2 files changed, 465 insertions(+), 42 deletions(-)
>>
>> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
>> index 58a14e6833f6..1ed091b6731a 100644
>> --- a/drivers/iio/adc/Kconfig
>> +++ b/drivers/iio/adc/Kconfig
>> @@ -62,7 +62,10 @@ config AD4030
>>  	depends on GPIOLIB
>>  	select REGMAP
>>  	select IIO_BUFFER
>> +	select IIO_BUFFER_DMA
>> +	select IIO_BUFFER_DMAENGINE
>>  	select IIO_TRIGGERED_BUFFER
>> +	select SPI_OFFLOAD_TRIGGER_PWM if (SPI_OFFLOAD && PWM)
> 
> Two things as I mentioned in [1]:
> 
> 1) Wouldn't 'imply SPI_OFFLOAD_TRIGGER_PWM' accomplish the same?
> 2) Don't we also need stubs for spi/offload/consumer.h?

It doesn't hurt to enable SPI offload support even if no controller
supports it, so I would prefer that drivers that use it just select
SPI_OFFLOAD.

> 
> [1]: https://lore.kernel.org/linux-pwm/2e82eaf275b5c8df768c8b842167c3562991e50c.camel@gmail.com/T/#t
> - Nuno Sá
>  
