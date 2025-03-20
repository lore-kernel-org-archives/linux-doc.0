Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB10D22A4E0
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742503387; cv=none; b=eobCR/azZpN2QKQTH/YecBXA3xgyuX5Kt9fr16HItn3+dA+rfLpogBKzTNPT2etfIxeAzMZ0IADVeHPfqKcHVSDrDJZmuUJyoXAiVFT+V4DUT5xcm0jxvKAN/G0sd6sLU3xWtYZenLuGBSQb3VLX8EUf1YGbxEdhF/uFhHQ3bxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742503387; c=relaxed/simple;
	bh=FpuegLmU5tbQxu4BeI6waAfSkfTSY0kMV2xhhNvEvm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTpCf9VVPkKciJVk70im7zoxjRdtec5tHYfhGUs/GbGtdq0CMJ8GkLfDaLkjVsG4mXI0NW/StE+mQoGQvc/645XwrR0rbvbc6NjObxeus4M2p7GCFdCm6HKXAwlgNvYbmP/pY/oHdQaBoe6Bk20hwF9tec+VcB7yPctTG1/YrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kpt3j7rE; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kpt3j7rE"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3fea67e64caso746395b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 13:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742503384; x=1743108184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JndwPcEu40LTfcktnqoRyV1fHHjivjql1RHGUu6ZCpk=;
        b=kpt3j7rETHSFaFIAO+I3sKZH9baiTJ5sqT8BYFy9kuZK+aH3yKsmd0DyDmcGgKTPYJ
         KkNijPHk+4eHa5efJIqGDD2eo0DEUix7af5hcRSHd4fkJ15BA/aosl/JPemddTIAe92u
         PKEQoIuZVt1ZOtuNb51CqAX0qehMaYl6h5QEOg5COFuI3Hf0nc1NZooTTMXwJjDFSTJN
         DDZJ0gRa4admAOtzuTPqJ/yqhm6dIpy+jRBZECQKXHw8vlteVEY3SE3ssi+36r6Q/gTD
         on3h96wteoecb+X5oKEYNYbHEfZ/g2w/DlPsvzFiNkXGPPry7X5vbeX27AOADvx1KQi2
         xtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742503384; x=1743108184;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JndwPcEu40LTfcktnqoRyV1fHHjivjql1RHGUu6ZCpk=;
        b=H0NSx2pu/EgfvwPMLGVJ50/oQu+MoXFB2zwxDXcP8GsC6eVz0a4MPxGxzA/OcI44B5
         XO11gwdWCkPidVuBhsEjbK17YL0u0saekjR3DuZUTcYB1PEz+MPjjP+sQqS1uo5WOeub
         6/RJSeo7FC67/fXUfS2xgN/mZxbtRy9JDLmsqWMi+Wu1Fu9A0in6upnanPs75CoE3rWk
         6N4fFFU4X2Dkq7z52VDBoJglx61FvVXp0tJpUWbjtUeI/vylh2f3iybCYSofM2emcOoV
         0fleSAWs+BlbZ2FA2+771Ku92/utgHvdA2/r+LJTccLLcmP/yPh50IeHKgAZEStm8AM0
         AmiA==
X-Forwarded-Encrypted: i=1; AJvYcCUulZOiR8cfCrcRB67jLrEWUx7W/9+fvqgJVaSB6s3G4fDm09H3qsrG1tREGnpB0DghR9Q/rk3mJTo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhVKJhJBIfKxQeMlBoZ5+ug7nMmM/fyJ97KluYZ8rT/AuayxM7
	WhLqHySwYuMa7pN7lKsbiEDxn3xn0BltpkM7hX/Mn6c0+GkaUunavA6LegYnrck=
X-Gm-Gg: ASbGncu+BNGlsPUosMO6EwEWTWwlnQ/+25Ye0XntNDt5Mk4j1VfzyV0zl/vrHAvq/As
	jSwJQ2gKBgKEN0kQHwgGODnkg0ZATVm56rTppuIWXW9r4fiJBEF8r2ALH8aEwztxpuJIx8CgRW0
	9I1DDCQ5NI9sY1Q+aIwaKApl7U+Gu5Vqcs4GfT4fxu3+AMOa19+KRnyDRbG0fCDCKe9Cq+Nu6Uo
	I4fUhs98/yk8Bzxhnyy5h8Ghw+CLm7AybxX8q0If8GSUp0ly5TmxI9ND8W1pPGnOg4mrpwJrihR
	wViQZg5D/qj247AhVvmTSGYzUb7GNVwe6BSVD3aG8+uuDvOr61ORmCUlYkLiO98ix4VwqyYZs70
	LFn+UzQ==
X-Google-Smtp-Source: AGHT+IGrPQlyXSXYBY7u+saxCR6isREiortDVdrxVss20iMydrEK8XXm7gPitUstCTe1G0rs6K8I/Q==
X-Received: by 2002:a05:6808:178d:b0:3fa:cf11:1493 with SMTP id 5614622812f47-3febf70afbfmr451429b6e.1.1742503383804;
        Thu, 20 Mar 2025 13:43:03 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3febf6dce65sm62432b6e.14.2025.03.20.13.43.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 13:43:02 -0700 (PDT)
Message-ID: <4fb5329f-be34-4d98-b34e-2da4e035f44c@baylibre.com>
Date: Thu, 20 Mar 2025 15:43:00 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] iio: adc: ad400: Set transfer bits_per_word to
 have data in CPU endianness
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742394806.git.marcelo.schmitt@analog.com>
 <930560a0d0ca7af597d4ad901422bc9ba3fc6a79.1742394806.git.marcelo.schmitt@analog.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <930560a0d0ca7af597d4ad901422bc9ba3fc6a79.1742394806.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/19/25 9:57 AM, Marcelo Schmitt wrote:
> When SPI `bits_per_word` is not set, SPI transfers default 8-bit word size
> and ADC data gets stored in big-endian format in memory. Because of that,
> the IIO driver requests ADC data to be rearranged from BE to CPU
> endianness. However, with `bits_per_word` set to the number of ADC
> precision bits, transfers use larger word sizes that get stored in
> 'in-memory wordsizes' and can be read in CPU endianness.
> 
> Use proper `bits_per_word` size for SPI transfers thus saving the driver
> from requesting endianness conversions. With that, shifting the buffer
> data is also no longer needed. This change has no impact on IIO device
> functionality.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

This is a breaking change. Some SPI controllers, like RPi can only do 8-bit
transfers, so this driver would stop working on those platforms. Also, if
anyone made software already that depended on the big-endian ordering without
checking the scan_type attribute, it would break that software.

I would leave this as-is (drop this patch) and just make it:

	.endianness = _offl ? IIO_CPU : IIO_BE,

in the next patch.
