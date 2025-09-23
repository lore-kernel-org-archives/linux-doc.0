Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 616D114EC46
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 16:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758643439; cv=none; b=LAwstFIZU8Mud+1740gmoma+BJYqYkRbCZlhRGPOoBHHTaBkc0RKuduM8Wujikep97RqcfNwrZRVdCyw/y5giYd2Kz7AF4GTO9ClllZozxvHdcbE1QqZ9BT5mXK2UafoBnFnSDd05KZbprrXQ2WCDApG3omjGh7o5jbbGSlYbWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758643439; c=relaxed/simple;
	bh=VxXxBVnPT3bjBJlGNuKjLv1N/mqpt8+iHvovsX2ivRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pI1nYXkzhnQ7ulG9RETdWEF3IYYAY2HtD5CUJIZFmnPVG6jO3Jw5L3x00BqoJVHCdwiiSnyfpyLAGkwR84JjiTU3TSFdsCiJV1CsiPP/A8jAAMG4tL6QUZ/CVaPXU4f0LoBJYtfaTVPtTnncpy8M7oUA7MBS6z6vJK9PViJpkqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=D32UbrOj; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="D32UbrOj"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-746d7c469a8so4810046a34.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 09:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758643436; x=1759248236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=law/k3CtXNu6hM9p5KpraV1Cz+DWuIPBGWWxReZ36Yo=;
        b=D32UbrOjk4gKhJX/uZLTgtT6sT1LMZp+IB5oht8sJ8bIizbvM0zgeC6N95iINwsPMk
         E4yt738kYwmHVWl4yVQMi3pi8GdkoWQYs4xLf2+Xfb8keOFhZVI1l5IlX1vqe9Puqpvf
         /69Le/ivN0oLIL2CRFyeB5yEAYfh9zrqU7UiUVA6FICnlGjuWwSc25So17GRe/PACDGT
         SI8rFu7qKCm4Tmo3Qhtt5KVReD3Fm6MpaxW80B8P/5vwLpvXNqh5JjRnGUANxruyxJK1
         S/5Q0AIf/5BvQ60+J1inv0NOReuHccF+ywiDc7rxQGAX++NBvzCALm+/uXDJeO8aoiAO
         UHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758643436; x=1759248236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=law/k3CtXNu6hM9p5KpraV1Cz+DWuIPBGWWxReZ36Yo=;
        b=tbSz2dhbLl6snKc8fFritt5JeIxm4P9tJVM3A9+oY1YbKOlzTINQeMsQVzahpk6V1G
         ZAlOzP1g24PsHx+FrNDlAAfZb7mU+GBFsx1+KbG6kym+h8Hg7XF7nNpdv3TD5zPBjgbg
         fD5AZUPAT73X/1LLMVNNL811ShIeTmG/g0ZIrdbLCXMh1lSyoVbmardiTilXmXW7VIf5
         UYTA226LpCZ8naQ9J4T+/2Ful4XxNS1ifx8800mfvhS/qo031Bpv3PnVBcoVxL7OrERz
         yha6yocjChiehlbMilnHN7wMTHo7IrgNZqgxBUyrIfjM7Jy39eMzUfEn44CYfEU/Yg9L
         Picg==
X-Forwarded-Encrypted: i=1; AJvYcCU7omEst0CxxDR8O5Ejtk+MgNYk+SPkXn7+IllicmbGumJ2ESHZP1zoJQ/UnFInRcjNDJNvIl4ezmg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8M7y5FgVswfQXF8bqQ8HhUGrLNtRuB0A0uDyDm7FHSvYw03Bb
	fE9uEohImaiSji1sYHkQ7+mnIu7Wt1a5qbwhfzPbt2YG/bhkBjmbYaCZmZGrB5M+mqI=
X-Gm-Gg: ASbGncvYsKTm++CLXGhxJ2/ba0G9Gd61DFKnZTUXwbdcoFCQcJT2r8+tV2coIhpurg+
	0NhDuRxy7v1Z1MgbibK0JkDAKE3uqDfTTZMOVlV09PFc/KY4//k1sF8ZRVCyM4x8LMd8Qr0+Sx5
	fPs7RG+u6UD6IkCh+VBaYLjtFFiih/c0MUbjJ/vKsCBIrHo464vupBSdrkzyBZknaQchKrAjBa4
	gRRRoYNj2m+rvaRT+nAXOnUrHyON630R/Vp5PgQDRlU1/9qMJH7ThrH4dbbYYymmNDSRXEsQFhw
	lke10rYsqp8yF0oixsefZhkG8skNMKNxO/xlyG+H8KR6r7mawe3CRfEE4WDY1OgZT2WhMTS7Z3G
	qTl/j6k2Xii8d4GrzxGCoAzWNuGX6IEhCxAPTb8tn9FmcNnoF3jlq54e0nj1Ai1tkaji0X9UX43
	Y=
X-Google-Smtp-Source: AGHT+IGt+WO07cHyo0KGdsHsWGQNVNTID6bqFPImBKjJW+ieTZFVbQ/jTnDS2WSIykEd8QxgZNu6gQ==
X-Received: by 2002:a05:6808:3319:b0:43f:18a2:97ae with SMTP id 5614622812f47-43f2d494e3emr1476355b6e.30.1758643436230;
        Tue, 23 Sep 2025 09:03:56 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:505f:96cd:1359:fff4? ([2600:8803:e7e4:1d00:505f:96cd:1359:fff4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43d5c67bbdcsm5948711b6e.7.2025.09.23.09.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 09:03:55 -0700 (PDT)
Message-ID: <21b52acb-9710-4363-803e-280773da0351@baylibre.com>
Date: Tue, 23 Sep 2025 11:03:54 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] iio: adc: ad4030: Add SPI offload support
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 michael.hennerich@analog.com, nuno.sa@analog.com, eblanc@baylibre.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Trevor Gamblin <tgamblin@baylibre.com>, Axel Haslam <ahaslam@baylibre.com>
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <da55c0ed6fe895dc84e79c8b64e5923a4851e58f.1758214628.git.marcelo.schmitt@analog.com>
 <30659b16-290d-4ae5-a644-214c106bbe87@baylibre.com>
 <aNK8ZZu74mK0_ygB@debian-BULLSEYE-live-builder-AMD64>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <aNK8ZZu74mK0_ygB@debian-BULLSEYE-live-builder-AMD64>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/25 10:27 AM, Marcelo Schmitt wrote:
> Hi David, thanks for the insightful review.
> 
> On 09/22, David Lechner wrote:
>> On 9/18/25 12:39 PM, Marcelo Schmitt wrote:

...

>>> +	cnv_wf.period_length_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, freq);
>>> +	/*
>>> +	 * The datasheet lists a minimum time of 9.8 ns, but no maximum. If the
>>> +	 * rounded PWM's value is less than 10, increase the target value by 10
>>> +	 * and attempt to round the waveform again, until the value is at least
>>> +	 * 10 ns. Use a separate variable to represent the target in case the
>>> +	 * rounding is severe enough to keep putting the first few results under
>>> +	 * the minimum 10ns condition checked by the while loop.
>>> +	 */
>>> +	do {
>>> +		cnv_wf.duty_length_ns = target;
>>> +		ret = pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);
>>> +		if (ret)
>>> +			return ret;
>>> +		target += AD4030_TCNVH_NS;
>>> +	} while (cnv_wf.duty_length_ns < AD4030_TCNVH_NS);
>>> +
>>> +	if (!in_range(cnv_wf.period_length_ns, AD4030_TCYC_NS, INT_MAX))
>>> +		return -EINVAL;
>>
>> I hit this error during testing with the default max_sample_rate_hz assigned
>> in probe. We could have a loop for this too to try to get the closest valid
>> period rather than erroring if the exact value isn't available.
>>
> Yes, this makes sense. Though, looping to try to get a suitable period wouldn't
> potentially also change the duty_length we settled above?

I didn't think too hard about it or debug too deep. So it might be fine the
way it is. We'll just want to make sure that when testing with a 2 MSPS part
that we can get the max sample rate without error. The ZedBoard has some funny
rounding due to clocks being divided by 3, so it could just be a case of
having to to put in 1.998 MHz to actually get 2 MHz or something like
that because of the lack of accuracy due to rounding.

> 
>>> +
>>> +	offload_period_ns = cnv_wf.period_length_ns;
>>> +	if (st->mode == AD4030_OUT_DATA_MD_30_AVERAGED_DIFF)
>>
> ...
>>> +static int ad4030_set_sampling_freq(struct iio_dev *indio_dev, int freq)
>>> +{
>>> +	struct ad4030_state *st = iio_priv(indio_dev);
>>> +
>>> +	/*
>>> +	 * We have no control over the sampling frequency without SPI offload
>>> +	 * triggering.
>>> +	 */
>>> +	if (!st->offload_trigger)
>>> +		return -ENODEV;
>>> +
>>> +	if (!in_range(freq, 1, st->chip->max_sample_rate_hz))
>>> +		return -EINVAL;
>>> +
>>> +	guard(mutex)(&st->lock);
>>
>> Why not iio_device_claim_direct() instead of a new lock? We wouldn't
>> want to change the sampling frequency during a buffered read anyway.
>> This driver already uses iio_device_claim_direct() to protect other
>> register access.
> 
> The new lock is to protect concurrent updates of the oversampling and sampling
> frequency. Since, oversampling and the sampling frequency properties are
> mutually dependent one from another, a simultaneous write to those attributes
> could lead to an invalid oversamp + samp freq configuration.

I understand the need for the protection. And using iio_device_claim_direct()
seems like it could do the job without the need for an additional lock.

