Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9110C2417E0
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756579688; cv=none; b=DicDu7KjGZx9HeZY62trM/MrWa3nXNP3nSybRR3BFNCU26/1N9xH94Zt88D2Z1SviESJhSwEXaBVnF6aSDk+ftfceoCscdtM274XkICM9+gXwMoLqVIT7MTo5s6Kaox0s4KvsTqgkV0riE//eSRQOofTbqGpExxNeL9zK0i2ezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756579688; c=relaxed/simple;
	bh=DD7DefC7ukvmx58D5ApAi7pdjLyBv9rq18lNqvOe6SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvvMZJENDmMolD/3YPPdlu8hINtXqC2RmzPPZIt4izuw3EP8xvFnTyEzcxzFH309uMsVhn99eRCNWOrIF4iGf++A8kq7oxBfO2jD+BhaTxBzT7LxGMuyoBFYRUAYG7KkjZOV/yRIpZL4VzcvFqEBo4rwlqXsVDZiY5y2GhC0sJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bHyI/gNU; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bHyI/gNU"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-435de801abeso1109145b6e.3
        for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 11:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756579685; x=1757184485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m5Xj0H0mStsxJLJCOC7FKJU4x7mcdP/yvgXS7VpGPqg=;
        b=bHyI/gNUW3I1YHVORjd+OPt7LY14H6lSgviX9nsLHUfCaRRr52zsNT51MZMuCRxfgY
         q4MBujnX4APwrGCLP6lmuwZIb8O+ElEVovDWLwnOSYsnUe+b16B/5UIUST4zTR8WoLPs
         eNVV/xrdFC5gsGVJcCbSGilsCMwlRfg2wprFcMPUrqsfp1TvCe19p88jftF8e/QOyYWs
         dVC/D0JJhWXimRhYTl/t5BZIaOHzcEdkITIrMrQSED/DmLm3e3NXQHsJGxlGpkd1xz0K
         zTBlNdJu9QZ00yNVx3c67kSWd4BF8ZPfASPqj8yL3gOlNxlCQAG+PCFyhbBfmAHF9WxU
         6HNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756579686; x=1757184486;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m5Xj0H0mStsxJLJCOC7FKJU4x7mcdP/yvgXS7VpGPqg=;
        b=EK5LlMndSOvOibrSowYxWfDYDqro7+e6m6quif/6xhbI4cce+jEvFTWVki6mEllqWd
         TM+CuUp+7X8emEKgIcR0jDOTkX1rMjgBDKv1d9zFbpfj1t/3TyY1EWuCCApXpQuUtXOG
         N2j3gfBw961C9tV0xtYuUFnqA1Y15yB7NE8zq7OEN5VmAtvd6U/Rf9Q/xzyO76AqRkKm
         nRTRtWsxpH0lh0fYU4YMFkysZZ3FSjha+jtMSS+RwO4IREh6lyxfsvjX++TRK4bHg46C
         lBV4IgTgiJLYNw/JzahiLQNUx5+qcg4UFhdXy8qSfjsgW/7HHETEKsPU3o44Zfy5hykS
         0FlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+iQRZ5fiDXdKP3gU/tBIr5tQ9ZqE55BOxIPT7sUpVHA2rUo8NlCcYimCYdpMvSm7ADIoVMqUK3dU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9ei91u1av93PIABo5kIMoEfnmx8E79tDJ8ss63USDtx3xzrf
	6tIT7Vd/CQs4nrIfQD+vNDcYALF+bNUgwK6BWoIzn//NSmfDA6E+IWSDuecmM3pJTB0=
X-Gm-Gg: ASbGncuIWjA5iDnCN3J+n7wIwov0oc4jFQ+Zbd4IF9Otuj+41a5IM/UtwwGlQwsVMjd
	AjaAY+1eMQEWmceOd8f7pI1NwzUE3mNCZhKlt5kt+eIVKUI6lHq5fACbu8QLINeV7gza74PXmaE
	9mzzwk2mKXxLh7OjB8v9EsysQ2Qr8iE0c0Pbu3KqmdP9U5yDT7Eg47Lx/2ETiMPpNuWrp+U30S4
	vaeymWkOfq8DgjDNwf2K37wJH5IKW2Ln/CazLwQ1ZkDADsXdYBPoCzjTedXc1Qpmm9axyMa/Wy9
	z3ptbWhx4WP2nhtV5p8Oo8UQyGujuozapboXEiWHO5AFlDSpVi8Mw53gK51Ys95YU543U6W9z90
	WBWoEixZsq5zf7jZdzOy1zTX5NVdYAstFpRYZAQNJZkBqJBs4NVkLc0XTC+428K1yjy1NF0pNmq
	P5V80aRtttxw==
X-Google-Smtp-Source: AGHT+IGSev9qbLSBhI0IZugbu8NAy2nFpxdYwCkrkjiUPJ2fDHLmRW1GmCDslyXrxwFppSI9n0uNbQ==
X-Received: by 2002:a05:6808:1889:b0:437:cfa1:73bd with SMTP id 5614622812f47-437f7d03adcmr1220355b6e.22.1756579685636;
        Sat, 30 Aug 2025 11:48:05 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:f7b4:dfbd:5110:c59d? ([2600:8803:e7e4:1d00:f7b4:dfbd:5110:c59d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437ffedd355sm21206b6e.12.2025.08.30.11.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 11:48:04 -0700 (PDT)
Message-ID: <97f20435-e4b9-49c5-ab02-b67a8112f0ee@baylibre.com>
Date: Sat, 30 Aug 2025 13:48:03 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] iio: adc: ad4030: Fix _scale for when oversampling
 is enabled
To: Jonathan Cameron <jic23@kernel.org>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, Michael.Hennerich@analog.com, nuno.sa@analog.com,
 eblanc@baylibre.com, andy@kernel.org, corbet@lwn.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com,
 ahaslam@baylibre.com, marcelo.schmitt1@gmail.com
References: <cover.1756511030.git.marcelo.schmitt@analog.com>
 <f9d40e8deb3d17a41b4fd6ecc1b8ac92275f0078.1756511030.git.marcelo.schmitt@analog.com>
 <20250830194308.32def0e5@jic23-huawei>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250830194308.32def0e5@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/30/25 1:43 PM, Jonathan Cameron wrote:
> On Fri, 29 Aug 2025 21:40:24 -0300
> Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> 
>> Previously, the AD4030 driver was using the number of scan realbits for the
>> voltage channel to derive the scale to millivolts. Though, when sample
>> averaging is enabled (oversampling_ratio > 1), the number of scan realbits
>> for the channel is set to 30 and doesn't match the amount of conversion
>> precision bits. Due to that, the calculated channel scale did not correctly
>> scale raw sample data to millivolt units in those cases. Use chip specific
>> precision bits to derive the correct channel _scale on every and all
>> channel configuration.
>>
>> Fixes: dc78e71d7c15 ("iio: adc: ad4030: remove some duplicate code")
>> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> 
> Hi Marcelo
> 
> I was assuming that when this said 'averaging' it actually meant
> summing (there is a note about using the upper precision bits to get the same
> scaling which is what we'd expect it were simply summing over X samples).
> 
> So given that we don't divide back down to get the original scaling I'm
> not following how this works.

I had the same feeling. I have some hardware I can test later this week.

