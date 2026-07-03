Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5AF414DC0
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 15:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783090940; cv=none; b=PN44pEqS+DA3ZEob4U72AF0WdtDaHFoEwNVxKa5RN+PlEGT97s4IHI5ubBpfT5MZE0Rl8nlk2K0fZ8JpAmAfnivPBa22ou7GF7t2Pxj+tmICSS4DjOwmOIseCAhKZYTQuhOgNg55M252/LN8LULevzOeeEGoejQLG3VdotZLmJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783090940; c=relaxed/simple;
	bh=vU5G6kbkbMYUju8uEzt/NM53se+SV59vfYr8ggF++Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BUfA6h5juPbHG+sX+MzomaOv3FzyP50wbnMvMEE72PzyuoTMBBf4jVaFE+3jMqselsI3eElHqPbcGtxEwJ+pFBRzeF1YXBQuKSF317ybvPWggdtre6oJk+T1HoS/tOO5I8kG2YFf1y6Wr0+ZB+LgSDWdqOCbHbs0pIlzv93zYGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ow5ZN/Ap; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ow5ZN/Ap"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-43cce8288c7so248705fac.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783090934; x=1783695734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0Grj9Qi0+dk5fVU5XSa7j0vuzMhx4RJGQKccjW2bkw=;
        b=Ow5ZN/ApokUjAXmdOBLCTM1PpuiYh5jwlBkWNH9wc7pRsUHBUf45Fh8mHU5NhyB9oL
         4JocQbyZd+xhhPn2lIgYR3aLCWBUKC2eoGsdvPRMqqhvI83gxORYOx8y+lv8juhd+r/R
         OINJBeioalzBMVphz/EqSmIFlb0t3tl7o0OouWlf28G41PMnzF0Ocv3fglR/jfo+Z+j5
         qi8I9q3UCokbaf2XcGgTSIuMtCzJZlyoLGRX+4X/5VeQ+kHPqBDgFD7O4MmjSwPUNwIF
         fS2ntVtoIsWETN9qjoIs9qI0n5chsEqns0cHvkqtBKrO3Y7hg4bC1wzM3HcddZ86aY3n
         LaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783090934; x=1783695734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W0Grj9Qi0+dk5fVU5XSa7j0vuzMhx4RJGQKccjW2bkw=;
        b=fdnFA7KADcq2jymJWc4GfKshG1pLGiqASLmskdxwJ5lbnP8BIvpOhn4Su+F73fYQUn
         nFDFkzbFIUgl3rXwSx+O6pPosYMRAIkxnW8sUDa8UkYWpVetniaqgXZgGtWfB1B6SR1B
         TIVk58ZHmtNbGNMKIpZF3Z4hOrUsXbCOnA1pvuet5sykkeYbWjS8PwColScVt8v+IxKV
         gaiz72qVf/0SHGdnP8VhN8gGn+/Bny3zfjZ0eTn5dTvT4DVmFvcvZGbhcDB6TqFygio4
         PH5e4S8rrK8CQSRo186dcq8fWAcOUeiICSQ5K+EZo1TCrNsLCQkEaYZ6NBOWKF/ec3NP
         Lb7g==
X-Forwarded-Encrypted: i=1; AHgh+RoZj6y+qMEoLP43ypSeKzdWtEcD4GfEAyXDzBVSZyeQhupoEOnigtJM3yxVcOZpd9H4b8Au3OaDcNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbGBDBrH0NcAh9YssfV1EcLDYeKHnrMVpOBTRnBwguxnE7IEV
	Jc5RI1DTXhNpK+tKzmPXtlJRyqXB0la1pmkO/51UUt7bBNKxo8wR14V15EwrxpAAZYE=
X-Gm-Gg: AfdE7cnzZ/oC8dkUTXb5q6Ift5ZCIiIEVcH6b9VeBRRiLR4ICm8VPx1bNCQvrrYxSAO
	J4cp0UTENQTUxnlvx0sASnjwrM8RtaB+X0OXgtjz68g4HkndlKYU7e2+JqiMxAmgQkWpolQAGCZ
	ZnLQaGuy6dHaVPJoya88aprw9QY2oaW0UdA+dtetbA3FV/DZiQ/viB4gxNeWeGFR6bARHlYe4/i
	X60HKmtrGij8muQuJETp4yjFad0f2RkD1qeZGVkS9vKVNPOGxMvpjxRpHk7nePOZzAf4FvwQ+m1
	q5fYv3o2u+zx1I6G3+h9+by+P8fVwquUI8DMN3mYqRn6dczhB3VrTbWx9Q55uWmDbMncI1/SMhc
	duaWOpHAHpRAsK5U2VUz6pjVR9Y6+tmUzUzzUbBx63yufQUKLNIxkhUZNtdhIjjOG8i0mb/jzif
	0Gl6yxZ61OwybWIvqsGnMcQ5xT5y/XLGvPyLQoR6OBCQbem1stPY0PSydKPdMJDWk=
X-Received: by 2002:a05:6870:326f:b0:440:67b1:b59b with SMTP id 586e51a60fabf-44caac0e76bmr6806975fac.0.1783090933482;
        Fri, 03 Jul 2026 08:02:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:6af9:a9d7:17b5:2644? ([2600:8803:e7e4:500:6af9:a9d7:17b5:2644])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1bb17fsm2183286fac.5.2026.07.03.08.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:02:13 -0700 (PDT)
Message-ID: <7a549442-f61e-42a1-86b6-aed6a8977290@baylibre.com>
Date: Fri, 3 Jul 2026 10:02:12 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: dac: Add AD5529R
To: Janani Sunil <jan.sun97@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
 <20260701194103.45541cbe@jic23-huawei>
 <3e094744-8603-443e-8027-8fc2f2817879@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <3e094744-8603-443e-8027-8fc2f2817879@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/3/26 5:01 AM, Janani Sunil wrote:
> 
> On 7/1/26 20:41, Jonathan Cameron wrote:
>> On Wed, 1 Jul 2026 08:40:40 +0200
>> Janani Sunil <janani.sunil@analog.com> wrote:
>>
>>
>>> +      adi,output-range-microvolt:
>>> +        description: |
>>> +          Output voltage range for this channel as [min, max] in microvolts.
>>> +          If not specified, defaults to 0V to 5V range.
>> No way to specify the default as part of the binding rather than a comment?
>> I haven't checked but does
>>         default: [0 5000000]
>> not work?
> 
> Tried that approach. But the dt binding check does not accept default for this DT cell-array property.
> 

Wouldn't it have to be written like:

  adi,output-range-microvolt:
    ...
    items:
      - enum: [...]
        default: 0
      - enum: [...]
        default: 5000000
