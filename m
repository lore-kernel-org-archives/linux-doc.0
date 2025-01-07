Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA69192D84
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736283738; cv=none; b=eoOZY05Zdxda9kkOqvYGSNZ4p0WlalHDR7bxDHcsFNWCeUTLVOhRuG1/xvJ1nBD6zYsTanGTlQ+jwLZRoj1paw0ZJw/eUpA9uTf+IRk7QBZM9n9k7oPnbOPCYipCmklU843GgqfWykAaFq8z3J3MOtzQi3EHA/GTnqSiagqKp0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736283738; c=relaxed/simple;
	bh=RAiQKmoPhhDgFGQS+Lev1D4yJuL4voNfsadzpfP/Xc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUJvehNsPpYz4PUGuBTSn19DtYI8V/zrBiukU4nXuJ7swfE3cI7Ssc7QH75e9vRcIKX14flb2ksdJFX3jrkGme3OHmO37qpoOKWpm1e0N2U1be3cecm+rX0yovWCSfazRhE6y+PYPimoLE3Ib7rrpikRJpbhGbABpuvg7PFq9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ptjfNupi; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ptjfNupi"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71e2a32297dso119825a34.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Jan 2025 13:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736283734; x=1736888534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WZxISArBXhdM3prebti4oFN1Q9XwKL/nN5FqnNyN7Ro=;
        b=ptjfNupisXxvd75no6NQc+gZH8LSZWVFxEIQ+FuVzl1zrWzhJkHZCzqBo+/03u8O0K
         SQ7cDLixCx6C4ByxLhjuWyGNjEbin8YJ5Hr+esjaIelcLI/YO74/U5sSRlvhxk77qU6g
         hgXSFQUUySf0TMjpfXjYnwW7XJgQwOx6lEuI5cBc1n40z9qhPpoJboZPnZ9UiHdndegV
         e44UL4NffEqbUMOE5V1nMS1m4GsqLbqf6yoAwEuacpe2H6wkjbKdTS0Q0MpHiJOGtnNl
         ag9g6XJnwLeVh3ZIRX4vXxIM0dAIppd3IcvjnOlSxCoV/pPgGwuKwq9UiSnCOtt8NPgg
         OqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736283734; x=1736888534;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WZxISArBXhdM3prebti4oFN1Q9XwKL/nN5FqnNyN7Ro=;
        b=m5HQaUXkhOar51bNB2ke1HdjlQ4YPYWr+arwtY1HltEyjGFC1OEVlVdPexjl+0jr0z
         fgWT2WNx4LD4z3p3BP2lwZ6Gc8EN2EgHLg4hhR3WDOY3SJjThuk1hCN2MppBRbvH04q0
         AP26c95Xl47kXvrNCFvMHeMKVXg6TPVrOn/bf4Lcl4de69cyAcWIBoS7Kfqg4fU7d2CL
         wOC3RzqO1d7xgq/rEjWeq7ZiaTzK7wHv0WydeHqbUHZdUfGrhoti8rfUnJLLqrK2Pgue
         0mrM/pgv2TGcV5o0phWYUtxCP98wKV+1lpfNMRgDlwjVT6RotznLuy7E4if+CxrxDaJs
         xfZg==
X-Forwarded-Encrypted: i=1; AJvYcCUcjLg0c7QY54eDWfAmBfLUxTODIShHy7l7q0JXr5oceTl28TYHZpHC1AwfrjmZcdjETEMAZfgWHxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlKPP7Mw03ilvaoDKHs9ZZCyzcMLtRTCaxqVgLAiARtrpf73Us
	EHQxcW/VCsETi5mSPjYooPTYJKQ7QPkS07yEozKHoA3qmaCJ7l943V25kQn6uRE=
X-Gm-Gg: ASbGnct16AFJ13IWL9ouCOOAAH63bGVOBhXrFUSB75YrXAa77wra869LNw5HB7GRqAh
	OKpQRTfW0gObGW6h08tn48g+KV14bHAgMXcCcsT9w/odI7KmyNpuj061lA2VG6YCTrC+vjDhyNd
	nFcHS66/u9gkWgZvKJdBcR7td+Sh6kTNMY1Tp8t1mWXwzyUPpveS7cR+1f0B03ak5/1IqnFpsny
	tiY++8TMt64/ml9Kk/FX4LZt+pLojmANHq9LDLHbCMsXyoablYNCRTi8Y/+y5abraMvBvaoyVFP
	92EezN5iaCHGHvHnrA==
X-Google-Smtp-Source: AGHT+IG/pUPh5oFZgJvnAqyY5u8bfPLLosDJtDnmFZTmZjvoyQYt5CXVBLaAyl6COW8K7MuKwCV+hw==
X-Received: by 2002:a05:6830:6616:b0:71e:1511:5d7 with SMTP id 46e09a7af769-721e27da35fmr296972a34.5.1736283734382;
        Tue, 07 Jan 2025 13:02:14 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc976ba23sm10566121a34.1.2025.01.07.13.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 13:02:13 -0800 (PST)
Message-ID: <f801aecd-be1c-45f5-9ea0-081162dd74e2@baylibre.com>
Date: Tue, 7 Jan 2025 15:02:13 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] iio: adc: ad4695: add offload-based oversampling
 support
To: Trevor Gamblin <tgamblin@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241217-ad4695-oversampling-v1-0-0b045d835dac@baylibre.com>
 <20241217-ad4695-oversampling-v1-1-0b045d835dac@baylibre.com>
 <20241219161301.3f708302@jic23-huawei>
 <1c641b37-475a-4153-bcfc-e0e72d79fa76@baylibre.com>
 <20250104123029.12a4e19e@jic23-huawei>
 <9128ecae-73e9-4a66-8cd0-4d98c14ff05f@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <9128ecae-73e9-4a66-8cd0-4d98c14ff05f@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 1/7/25 2:21 PM, Trevor Gamblin wrote:
> 
> On 2025-01-04 07:30, Jonathan Cameron wrote:
>> On Thu, 2 Jan 2025 13:19:19 -0500
>> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>
>>> On 2024-12-19 11:13, Jonathan Cameron wrote:
>>>> On Tue, 17 Dec 2024 16:47:28 -0500
>>>> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>>>  
>>>>> Add support for the ad4695's oversampling feature when SPI offload is
>>>>> available. This allows the ad4695 to set oversampling ratios on a
>>>>> per-channel basis, raising the effective-number-of-bits from 16
>>>>> (OSR == 1) to 17 (4), 18 (16), or 19 (64) for a given sample (i.e. one
>>>>> full cycle through the auto-sequencer). The logic for reading and
>>>>> writing sampling frequency for a given channel is also adjusted based on
>>>>> the current oversampling ratio.
>>>>>
>>>>> The non-offload case isn't supported as there isn't a good way to
>>>>> trigger the CNV pin in this mode. Support could be added in the future
>>>>> if a use-case arises.
>>>>>
>>>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

...

>> Maybe trick is to reorder into 3 conditions and set the value in a temporary integer.
>>     int val_calc;
>>     if (val > 0)
>>         val_calc = val * 2 + val2 * 2 / MICRO;
>>     else if (val < 0)
>>         val_calc = -(val * 2 - val2 * 2 / MICRO);
>>     else /* Only now does val2 sign matter as val == 0 */
>>         val_calc = val2 * 2 / MICRO;
> 
> I've been testing out these simplifications (but using the scaling suggestion from below, which is great - for some reason I had it in my head that doing so wasn't an option).
> 
> These seem to have some issues with signs for particularly small calibbias values. I think it's because while my (val2 < 0) case was doing unnecessary clamping, the math itself was OK.
> 

Mail is easier to read when wrapped to 80 chars. ;-)


> I did some more experimenting, and came up with a new version of the function that looks like this:
> 
> static unsigned int ad4695_get_calibbias(int val, int val2, int osr)
> {
>         int val_calc, scale;
> 
>         switch (osr) {
>         case 4:
>                 scale = 4;
>                 break;
>         case 16:
>                 scale = 2;
>                 break;
>         case 64:
>                 scale = 1;
>                 break;
>         default:
>                 scale = 8;
>                 break;
>         }
> 
>         /* Note that val2 > 0 if val != 0 and val2 range +- MICRO */

This comment doesn't seem 100% accurate. val2 range is (-MICRO, MICRO) if
val == 0 or [0, MICRO) if val != 0.

>         if (val < 0)
>                 val_calc = val * scale - val2 * scale / MICRO;
>         else if (val2 < 0)
>                 /* if val2 < 0 then val == 0 */
>                 val_calc = -(-val2 * scale / MICRO);

Could also write this as `val2 * scale / (int)MICRO` lest someone try to remove
the double negative and break it (because MICRO is unsigned).

This also calls into question if MICRO and similar macros should actually be
unsigned because it can lead to subtle bugs since it is perfectly reasonable
to expect -1 * MICRO to be -1000000, but it isn't.

>         else
>                 val_calc = val * scale + val2 * scale / MICRO;
> 
>         val_calc /= 2;
> 
>         return clamp_t(int, val_calc, S16_MIN, S16_MAX);
> }
> 
> This seems to match all of the expected outputs for the pre-simplification version in this patch series when I test it. If there are no issues with it, I'll send a v2.

Probably not a big deal, but there is unhanded overflow when val is near S32_MAX
or S32_MIN.

