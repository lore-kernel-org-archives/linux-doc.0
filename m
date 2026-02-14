Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462C61D54FA
	for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 17:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771088975; cv=none; b=ZKlSyfpDhqK8XuTtlOJY6GW3XShVYCdvgrw36Dk4+uw1ngak4Tj7Nnv0dEJNzd6/V3bKLzscDyueAB0E7LP3uh6vpsfQ7taztc66pDjWdluv8g4BArfhhqEuOjCAGoUGsJ+nCBfsojO7b0V4NLMwhGTvG95hfETTC2Yu5O59PFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771088975; c=relaxed/simple;
	bh=dbIKZyx1wqWvoVfET5QSbDQ7g8Bez4WCJlHr4gZEjwM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=kTOKuMQGW5e8DhPVgROVijZfPlxqGLN4ZUfUgtqvF4+NbamZdN/nMeJ5fyOX8yWpic9mudr0sDDcCSUq/GvBGbjVkKmAbEJeD9T/3Peb2Rf5Ec+Dcud9FY8wuuZTykZbU3nxEqDHnCZxI3FZRCqxAR/W53iHnaBtYzZ2iEKwr8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0N5rAGIr; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0N5rAGIr"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-677a11d11e0so435726eaf.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Feb 2026 09:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771088972; x=1771693772; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6IUlnbhB2kMGCrw14cml/lzwiGDaGw9e5IGUkFOP+xk=;
        b=0N5rAGIrGOcKVwjXTha4ASNMw6z2IFmQf+O0TH+62PaPP4V4iUB+dMZIPgOrwul2iZ
         QdAcXAU4CZa1EEteyfTVEqqu5djv7PSoxmRbSsuJLyaGLr8wa1ldcS63aBRVI9vw9BPh
         seJh5nK25DyyyowVi7Ve42CNIFahxXEl5xHaIpqJIk5gchnb5pdv/T+s+/oPidb62c8z
         5ZOgIUKA15FpOZjSu77a9VEta+Uwr4hV/ONE7SKzFf/FJAW9fNk2yK8nvbUXXdmRJx1z
         cCqriKI17yrKhkv0kKzoJ16L0uy3vnlg+CZzEvRCuYsAwk4IE1GE63/bHIpcPVLyltLD
         tLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771088972; x=1771693772;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IUlnbhB2kMGCrw14cml/lzwiGDaGw9e5IGUkFOP+xk=;
        b=lqHMtVM5QXECn7aVeiD8g8RKh+Xj3Jzqfhq2NzxuU5EYvtpmI1SUVbhP7O7YETnJry
         UcqjOBzneXDkeNoCMcIUz2MxmJwtMgy0Xs0SICOU/QSgHSEo6eJwgfZBxfSN9OlkIuXO
         JY9SUjzgtdOkhfxWFTic9DGq5TPGlngJCwp12eeLO9TE+NJtchLxAIKxTBui7HXw8tyR
         /jaT3vT4LjxwZcbaigmJGZ599ecPe/JaAqppRwMikwJm9Teu9VHjz+IWa8bX/kuU4kRx
         NmRwSTM+CD1DkywpZb3urB5cGDwC0raGxKQcQIBP0/mAkC2F3Al6jo4+rPL7Q+ma58Rd
         shYw==
X-Forwarded-Encrypted: i=1; AJvYcCWlWACz5EswIqPtccUrrAHZUuN81Qq0z+X4idSsolW+aSvESiCa9rpEA9NwxP+6vgkspujKia2MpGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkyzJ+QwVfvSka1N6lsPu5d3pAriP8LRTBgm7T4bApFqr7F0fs
	+WzHn+nGwlPf6Xw/lzeQ2m4HWjY5IsPDbw2n44e3znwGfRhaisp67N1q0KN1OlgTabw=
X-Gm-Gg: AZuq6aIyF+IKpR/1vtiJXanSI3VhrXDa8OmcENZbftR8Z90+vNjiCljgXbm8GsqSWaW
	DhwklnCdnhRE7b1PuqgdAxKTgCUXok9QWoT70F9dP8W9VfBcvyKbqnunAk9HjPYcklwiwUTw1JU
	ZvX7jzEnEGv/tUK2+7/d8EXx+NhH1Y6c8HkKiy5bxATWqCvyD+AHmMfCi9nlagpHqRyambfS2TT
	mJroIMc0HzP5cTuhrldMYOThQJWUIM6Thhm+LZhINO4+EReSE94zkyQSQWBSwRu+3Xx6AWPiB7A
	tAsnXMw8Zd12dgByzoPvek1GtA27e/LHienUXYzWyYCObac5W0jri+bqY5aHMbEwySut+HL22UI
	fU6glRwSCjblRDBYkRzRE/xI0HjmGTbh/5kqlHs8CYYQsXobj9WMHLTJ9k6Mne2zTsOGBIGPq4h
	buK4UNx8saCtB4lJw085NM0LexruY98GCGU4BMWCFErG3vIAK5SLDC3B8tVSQXr2MAEYjlCA==
X-Received: by 2002:a05:6820:80f:b0:676:96fa:299f with SMTP id 006d021491bc7-6776748602bmr2433820eaf.34.1771088972181;
        Sat, 14 Feb 2026 09:09:32 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:109:393c:254e:962e? ([2600:8803:e7e4:500:109:393c:254e:962e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6772583294bsm3334429eaf.14.2026.02.14.09.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Feb 2026 09:09:30 -0800 (PST)
Message-ID: <40a0d410-731a-43e0-9078-bc8190ccba87@baylibre.com>
Date: Sat, 14 Feb 2026 11:09:28 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] iio: accel: adxl345: Implement event scaling for
 ABI compliance
From: David Lechner <dlechner@baylibre.com>
To: Taha Ed-Dafili <0rayn.dev@gmail.com>, jic23@kernel.org
Cc: rdunlap@infradead.org, skhan@linuxfoundation.org,
 linux-kernel-mentees-archive@lists.linuxfoundation.org, nuno.sa@analog.com,
 andy@kernel.org, corbet@lwn.net, lars@metafoo.de,
 Michael.Hennerich@analog.com, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260208150515.14798-1-0rayn.dev@gmail.com>
 <20260208150515.14798-4-0rayn.dev@gmail.com>
 <af774bb9-817d-4d88-9fe3-54468949ea54@baylibre.com>
Content-Language: en-US
In-Reply-To: <af774bb9-817d-4d88-9fe3-54468949ea54@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/14/26 11:02 AM, David Lechner wrote:
> On 2/8/26 9:05 AM, Taha Ed-Dafili wrote:
>> The ADXL345 uses a fixed threshold resolution of 62.5 mg/LSB for
>> event-related registers. Previously, the driver reported raw
>> values without a scale factor.
>>
>> Implement IIO_EV_INFO_SCALE for all event types to provide the
>> conversion factor (0.612915 m/s^2) as required by the IIO ABI.
>>
>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
>> Signed-off-by: Taha Ed-Dafili <0rayn.dev@gmail.com>
>> ---
>>  drivers/iio/accel/adxl345_core.c | 28 ++++++++++++++++++++++------
>>  1 file changed, 22 insertions(+), 6 deletions(-)
>>

...

>> @@ -228,15 +230,19 @@ static const struct iio_event_spec adxl345_events[] = {
>>  		.type = IIO_EV_TYPE_GESTURE,
>>  		.dir = IIO_EV_DIR_SINGLETAP,
>>  		.mask_separate = BIT(IIO_EV_INFO_ENABLE),
>> -		.mask_shared_by_type = BIT(IIO_EV_INFO_VALUE) |
>> +		.mask_shared_by_type =
>> +			BIT(IIO_EV_INFO_VALUE)	|
>> +			BIT(IIO_EV_INFO_SCALE)	|
> 
> What is the units for gesture that we are scaling to?

After looking at the docs, I understand this now, so no need
to reply.

> 
>>  			BIT(IIO_EV_INFO_TIMEOUT),
>>  	},
