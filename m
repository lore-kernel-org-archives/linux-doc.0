Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18C5334685
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721472; cv=none; b=hPhIDlraLASeS5UrYoimo4cMiqurDP9WkdQQBKO9cHk8JJ5gdPBQDMTM518fdA343U6iRwsqivoEWcTT1+5ierfor3niET9cttHV/HJaMN1C8vMr5Km2UNEIzNqNt7srznaAOzYERFLtXHsUN57dzBJ2Obyrg3YmSMZAA1Df/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721472; c=relaxed/simple;
	bh=yFxM+FwWkqZuOBQsTPCSWW9DEUgOF6tUu4tyoHvlr3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iKEKdKGw+915syw7jhsldwWW0Y09/itKF4clLATnTWeYd43pVoBQPvUg9j2ju+ATUfkZ90jV4YyaIxJi03VKuxSMtmos/Lc7rLF+TAQWhEdieHYPrQYNPdSlreMBYG5Wys3L2pNALEmsqBEAwTsoZu91xuVFG3fvMJkK9ctneqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O5KSm1r3; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O5KSm1r3"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-67a22322cebso1581548eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 06:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772721469; x=1773326269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDq5n4yMw9e6z9A1BIBitGCBLWVemJFZFjtS+nGx1SM=;
        b=O5KSm1r3Fe01lOMr6PfDZvDBqt9i3aDg/ryLDrEVQyUvFJD3n8VgIYYWyrSzQWCoUF
         9rOkK6/C+KKeK++3Ud0b0t0SqbqgwgVETo9nMPCGIOyTk7EWmFQCal+KrLyxKGPOvO3d
         uYYS3AlAegopzVOqLv7K8RvITAIHQugAQxiHVctsAh39in1woPbDTISOYR2vn6dthY8p
         7Zp6J4x8+hlrw0NxRskTwDSWsRVtQ/clbubieC0g+iWAY7h4mZVttEqlg3IWVMel/aOx
         ECnJKPK2TiDrAF8gUB+pJjn0Ss4a1MnVHJwkQPhjEPdS08v6n0j0rI60uIQN8Z7XWPEk
         +1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721469; x=1773326269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDq5n4yMw9e6z9A1BIBitGCBLWVemJFZFjtS+nGx1SM=;
        b=xEiOFXABmTv5SfnFl1aZUfvrpvj9I8RAKnH6lD5ZX2yZOGXO7iDLJmzYmf1ER+7+ME
         537zhyquQzOEjYr682Je6kUDUcsy3zKfYjoUECLFZ6Di8tMALSWz4Y+bHH55iR/cRUD/
         6/GLgzeUwyDzIWEUO5bQkDYJ1AEc1h2lq6Mgb1KhiLiIpqWbNqzufX8vvfkFE4tEfxUK
         bCFUCcgN1ZqL2QsL2r9070Cjg9h4Ehv5b3fUQkvkKlqG51Xrm4i4EkLr2YEkzULIg01h
         HYG81ox9Ag/su3EoKjHS5UGNMO/F7CqsnJeedrFVcQStemAmzJlAq1d45vkSceQ4wzC/
         2hbA==
X-Forwarded-Encrypted: i=1; AJvYcCVpFQS8zJFh4iKCjUnJ/kSwYbyfq0xcy5MCbCwV9KmbH8IVLXSngjcQXVD+jYSZOrDSZ5picaM/ByA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25be+dEAt/3SLfwj2yyaLd+GRlVn5qkE+2IQbSP0nFCylUiyd
	W1pAfIZs1UM8aAAEAhBVo0IFRsVWjgEpDMqI7gELiEuqc80tJyLLAfnWbGfUrBaCRFg=
X-Gm-Gg: ATEYQzzNh1NKqfPvyUs9iefff+vYRDzBSkF5k7HOZaZqH3G1IbBPb7LC6jtRb9YEHrB
	r5BNTGoeVyjgPmp2ZmVPkuHwdvWhZSTHG3MzDNmXBWzaQeCvIVefSJ01olsZFFkCrEUATwgDTnT
	xdTG/pZCkbqRgz7wiLP6Y5OOtPFaT4NhGmBrl7ifvFCBtS6ckRqW+R6CnYaiEpmSLB2jfOYJps1
	JwPWMw1Thrtt+aiU/9ICGE1zTYa+W932c76BNJA/rwBxgGKwSaWM7IdvmMYgFDMvxCCzAqa+PF0
	VBMKKfytPv2XcyPKt0Ux8YdF1cSlRB66knMSqMRlbRNVHJFcCPDA1NMhR5S3ZznJs8iVSpOw+0z
	0EoKF0JdzjEDtDYaMXe44l+hm6+ix9xmxNBNZ+Bra00qG3U02rOK0mHgACTLtHIMtJblT7Mow9p
	Tc0vPdCiqDEHI770aLdxRIy6FgBPEWNujOOUj2EBg33F1ft7r1kc+tSdwSFLx8LJSj8C+A8ITlc
	A==
X-Received: by 2002:a05:6820:4cc1:b0:679:9844:698a with SMTP id 006d021491bc7-67b1776ab7cmr3503859eaf.55.1772721469509;
        Thu, 05 Mar 2026 06:37:49 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:874e:e775:4f67:b3a5? ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67a1d603f31sm5413217eaf.5.2026.03.05.06.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 06:37:49 -0800 (PST)
Message-ID: <dd6d1436-d509-4233-ba1f-5a3f870f35fb@baylibre.com>
Date: Thu, 5 Mar 2026 08:37:48 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] iio: ABI: Add support for floating-point numbers
 in buffer scan elements
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Francesco Lavra <flavra@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260304080519.2844101-1-flavra@baylibre.com>
 <20260304080658.2844434-1-flavra@baylibre.com>
 <70f25902-5c79-46f9-8c67-99633b22b5ac@baylibre.com>
 <098886563f5fdcde837989d0556ed9a2d8d3203b.camel@baylibre.com>
 <CAHp75Vdni=OgHiDi8G5s6CgBFZZuypOyJSo5DFjaKYFkLGPqkQ@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CAHp75Vdni=OgHiDi8G5s6CgBFZZuypOyJSo5DFjaKYFkLGPqkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 3/5/26 3:23 AM, Andy Shevchenko wrote:
> On Thu, Mar 5, 2026 at 11:09 AM Francesco Lavra <flavra@baylibre.com> wrote:
>> On Wed, 2026-03-04 at 16:45 -0600, David Lechner wrote:
>>> On 3/4/26 2:06 AM, Francesco Lavra wrote:
>>>> In the data storage description of a scan element, the first character
>>>> after the colon can have the values 's' and 'u' to specify signed and
>>>> unsigned integers, respectively.
>>>> Add 'f' as an allowed value to specify floating-point numbers formatted
>>>> according to the IEEE 754 standard.
> 
> ...
> 
>>>> -  Format is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift] .
>>>> +  Format is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift] .
>>>>
>>>>    * *be* or *le*, specifies big or little endian.
>>>> +  * *f*, specifies if floating-point.
>>>>    * *s* or *u*, specifies if signed (2's complement) or unsigned.
>>>
>>> I would keep all of the format options on one bullet point.
>>
>> That's what I did initially, but Andy suggested doing differently [1].
> 
> And still I think it's better to not mix them. The floating in the
> same sentence is confusing (along with 2's complement mention and
> sign).

Then I would split up all 3. It is strange to mix some and not
all.

> 
> ...
> 
>>>> -is [be|le]:[s|u]bits/storagebits[Xrepeat][>>shift], where:
>>>> +is [be|le]:[f|s|u]bits/storagebits[Xrepeat][>>shift], where:
>>>>
>>>>  - **be** or **le** specifies big or little-endian.
>>>> +- **f** specifies if floating-point.
>>>>  - **s** or **u** specifies if signed (2's complement) or unsigned.
>>>
>>> same here
>>
>> [1] https://lore.kernel.org/linux-iio/aZ7dCdLs5xcJ4UGW@smile.fi.intel.com/
> 
> Same here.
> 

