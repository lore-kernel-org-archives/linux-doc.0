Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55C71B0F22
	for <linux-doc@vger.kernel.org>; Thu,  2 Jan 2025 18:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841966; cv=none; b=dBQwvHl7bpxh5XqyaxnNYL7gAQuMsMcquKT8PG/iRr1+rArnzc8zeTWjbsnmMbBoxM+wxeEqzE0SeECJ95AElzBq9m/g1xQWNIwCuMlMHra3HL63SsgG+pHmn/VUXag/Pt92hVU68Ga2jr9ASxCrYXxOMxtagiQYfPFj34eCGeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841966; c=relaxed/simple;
	bh=5dvgBABeyGFxnBG3Y5nT2U5CVkpQfQV1dff5/rH3IEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKgNJLhQqJTXKoifcsgK47VoqvGcbgYPU7oZPLNIY1TzSgbLZ/4dvNjGT6wy+5lysDdr8Y5hJK/Q1EnSmRLmGT7TCRYo4clHXmtTveWs8GGB/S4pos48XpM1wPXlT79kXeENnHKpKDrcxzG+z1+JwL3+7ifxGRdIV3XKA1n5pWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m8kmSMil; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m8kmSMil"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6f19a6c04so990311085a.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jan 2025 10:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1735841961; x=1736446761; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bvvb86cIzS/dOwVH6EYJXcGMKz0+uVXUG4GedKpth0U=;
        b=m8kmSMilDE+WE7k6YQRtZ/O9w5G5W+vBpxFYZyixRdRGYV490HO59leIlTS+HqI26t
         YX68Cozl/swLfL4MJilyXyqpjuP9Q0QFw4jIYbPMKTI19Um01SSqURNCPJBZtDxi1TiL
         ySFDme2xTJgtb2hnPYTr5rEcnqddFmguMSD3XGBCDO2wGWvGw4jONYA7AYjqbm4kniNA
         JS6Bn4L8s3rU//RCzPmJMB26MQHEdS3W9K9ek46FI3gf6wp4m4urmGAPcp/HvKoV2+e0
         TWYa+TW9WfYfOYsgLkPtJDB0LLR0zLGeQtDHtzVAKu8ILkrd0UdmSLLSwSk50wt4JT45
         Y7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841961; x=1736446761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bvvb86cIzS/dOwVH6EYJXcGMKz0+uVXUG4GedKpth0U=;
        b=DMoW8ngVGcGQhPt4xGm6/I8jY7FleKeUOiYGj9m4ssiB4ycwuYyq0Q9zLKSXSM5R18
         HTuf5CJ5lC6APQHEPoi86DDIK6jKNIOG0P+M08CvwCgPgS/2G237bLqQu+JYnXLauZVf
         ucDeOZaUKnE1eYvcIdF1M2hyqz/Z1/b5PQD9t7dOdH/eyGbE+jHcoju6ZhttZb5vaA3q
         zix7KK4aISZAUSjjXrZ1WVi+pzkGrpHC1Nn9AsOB7mIXyH+bFImGnNmQPwR0juCVp/S0
         nRZ1PrcDuzAAEzOhFKtGT1MMY+cwkZveZzHyn/FT/TsQe1J4y9CRiG4fvfr2nIU/q3i1
         Od9w==
X-Forwarded-Encrypted: i=1; AJvYcCUJAMLFzx8MoU9/ywmwTHvSeB1MJFPJU5veQn+DGnJnRlpKinf/NZs97xrFAYYIHGRBNwISXj5SOYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+Ctjym1LfoMzq1WY6sPeTsrPFoJYcV0+H2zC0DBdGlggkq4g
	b7H7b/dXXIIkSU89zaBw8XSUaD/aHgUAsfNXkfmj6l+Dy1XXLOeQM1sNkt4EzWI=
X-Gm-Gg: ASbGncv7lpBeRf7zhkIvU/9EIJIbgsnAGGygPmZ9ek7WyVSsbOZgcsDEGUAzpCW/6vU
	6QFotWTQmu9g5WpEf8U29AUDX0hPkzkQdCY5PZBRMko6QdUjiXym+M6AKeKfdcuz+aspjq82HLa
	SUmgqrLK5mNVBBlb9b3iPNa4cTDPrw1ID+3f+lV4IsPVuXbtUUSYdQPPMvAnrqJyy264hFj6VcN
	ZiXXDP5PtzntWZ61z/xDLt/XK4fONBuqLmy5ceaAaDAhrtwN+O2dbAmUaaloyI03bZXtYuc9buo
	skh01+absfD7ioinbKQSvYrG
X-Google-Smtp-Source: AGHT+IGeOONPgFA0dXRFKcX210Q5kkrtbZxdBQLMw2EGeHfAGwIzMg9YGL5jsDDC44doX2Wugk0ppg==
X-Received: by 2002:a05:620a:2807:b0:7b6:edd0:d752 with SMTP id af79cd13be357-7b9ba7167c4mr8333933085a.5.1735841960779;
        Thu, 02 Jan 2025 10:19:20 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3eb2b0a1sm138004651cf.74.2025.01.02.10.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 10:19:20 -0800 (PST)
Message-ID: <1c641b37-475a-4153-bcfc-e0e72d79fa76@baylibre.com>
Date: Thu, 2 Jan 2025 13:19:19 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: ad4695: add offload-based oversampling
 support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 David Lechner <dlechner@baylibre.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241217-ad4695-oversampling-v1-0-0b045d835dac@baylibre.com>
 <20241217-ad4695-oversampling-v1-1-0b045d835dac@baylibre.com>
 <20241219161301.3f708302@jic23-huawei>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241219161301.3f708302@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-12-19 11:13, Jonathan Cameron wrote:
> On Tue, 17 Dec 2024 16:47:28 -0500
> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>> Add support for the ad4695's oversampling feature when SPI offload is
>> available. This allows the ad4695 to set oversampling ratios on a
>> per-channel basis, raising the effective-number-of-bits from 16
>> (OSR == 1) to 17 (4), 18 (16), or 19 (64) for a given sample (i.e. one
>> full cycle through the auto-sequencer). The logic for reading and
>> writing sampling frequency for a given channel is also adjusted based on
>> the current oversampling ratio.
>>
>> The non-offload case isn't supported as there isn't a good way to
>> trigger the CNV pin in this mode. Support could be added in the future
>> if a use-case arises.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> Hi Trevor,
>
> The clamping fun of get_calibbias seems overkill. If this isn't going to ever
> overflow an s64 maybe just use the high precision to do it the easy way.
> I'm not sure you can't just fit it in an s32 for that matter. I've just
> not done the maths to check.
>
> Jonathan
>
>
>> +static unsigned int ad4695_get_calibbias(int val, int val2, int osr)
>> +{
>> +	unsigned int reg_val;
>> +
>> +	switch (osr) {
>> +	case 4:
>> +		if (val2 >= 0 && val > S16_MAX / 2)
>> +			reg_val = S16_MAX;
>> +		else if ((val2 < 0 ? -val : val) < S16_MIN / 2)
> It has been a while, but IIRC if val2 < 0 then val == 0 as otherwise
> we carry the sign in the val part.  Sometimes we generalize that to
> make life easier for driver writers but I think you can use that here
> to simplify things.
>
> (for background look at __iio_str_to_fixpoint() - it's a bit of a hack
> to deal with integers have no negative 0)
>
> 		if (val > S16_MAX / 2)
> 			...
> 		else if (val < S16_MIN / 2)
> 			...	
> 		else if (val2 < 0) etc
>
> You may feel it is better to keep the code considering the val2 < 0 when
> val != 0 case and I don't mind that as it's not wrong, just overly complex!
>
> If you can easily clamp the overall range you can just do some maths
> with enough precision to get one number (probably a s64) and clamp that.
> Easy to sanity check for overflow based on val to ensure no overflows.

Hi Jonathan,

I'm reviewing this again but I'm not entirely clear what you mean.

Are you suggesting that the entire switch block could be simplified 
(i.e. eliminating the previous simplification for the val2 < 0 case in 
the process), or that the calls to clamp_t can be combined?

I've tested out simplifying the val2 < 0 case locally and driver 
functionality still seems OK. Maybe I'm missing a third option.

- Trevor

>
> 		
>
>
>> +			reg_val = S16_MIN;
>> +		else if (val2 < 0)
>> +			reg_val = clamp_t(int,
>> +				-(val * 2 + -val2 * 2 / MICRO),
>> +				S16_MIN, S16_MAX);
>> +		else if (val < 0)
>> +			reg_val = clamp_t(int,
>> +				val * 2 - val2 * 2 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		else
>> +			reg_val = clamp_t(int,
>> +				val * 2 + val2 * 2 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		return reg_val;
>> +	case 16:
>> +		if (val2 >= 0 && val > S16_MAX)
>> +			reg_val = S16_MAX;
>> +		else if ((val2 < 0 ? -val : val) < S16_MIN)
>> +			reg_val = S16_MIN;
>> +		else if (val2 < 0)
>> +			reg_val = clamp_t(int,
>> +				-(val + -val2 / MICRO),
>> +				S16_MIN, S16_MAX);
>> +		else if (val < 0)
>> +			reg_val = clamp_t(int,
>> +				val - val2 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		else
>> +			reg_val = clamp_t(int,
>> +				val + val2 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		return reg_val;
>> +	case 64:
>> +		if (val2 >= 0 && val > S16_MAX * 2)
>> +			reg_val = S16_MAX;
>> +		else if ((val2 < 0 ? -val : val) < S16_MIN * 2)
>> +			reg_val = S16_MIN;
>> +		else if (val2 < 0)
>> +			reg_val = clamp_t(int,
>> +				-(val / 2 + -val2 / 2 / MICRO),
>> +				S16_MIN, S16_MAX);
>> +		else if (val < 0)
>> +			reg_val = clamp_t(int,
>> +				val / 2 - val2 / 2 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		else
>> +			reg_val = clamp_t(int,
>> +				val / 2 + val2 / 2 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		return reg_val;
>> +	default:
>> +		if (val2 >= 0 && val > S16_MAX / 4)
>> +			reg_val = S16_MAX;
>> +		else if ((val2 < 0 ? -val : val) < S16_MIN / 4)
>> +			reg_val = S16_MIN;
>> +		else if (val2 < 0)
>> +			reg_val = clamp_t(int,
>> +				-(val * 4 + -val2 * 4 / MICRO),
>> +				S16_MIN, S16_MAX);
>> +		else if (val < 0)
>> +			reg_val = clamp_t(int,
>> +				val * 4 - val2 * 4 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		else
>> +			reg_val = clamp_t(int,
>> +				val * 4 + val2 * 4 / MICRO,
>> +				S16_MIN, S16_MAX);
>> +		return reg_val;
>> +	}
>> +}
>> +
