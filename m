Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC75301704
	for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 21:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403792; cv=none; b=Gqih0GYD8vdVb6aNVz8Zlw0okbOVuDTUppzev95rHNHzkE3YJKO7lWeek6ayvCSsfpbxfoJhR7kBOxXR49JOtmybeM9jT1TXQzjaNP6zNHeinKMJ9Y/vez4vWXJXloCRHUyZRxBC+lTK4IrYnPCGAT8CQjfixuh2C7uCUSkQNoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403792; c=relaxed/simple;
	bh=YYgX0e1gybRiTu68tQB5B3oJIXXzn/Oz2RLQkXM8Dvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZ+/BXsxOqQMKcETUdDTwTZdAys4NzlwCUZSbJ5/6EiGh2z//tdSmO5LSHeocP7YS+SnBANhEXZ8YRHGDTLuPAU3fuftiMXZHIzDJNP0K5mf5DCcASsNK+tPlSWlZAUlMEDYPO045K1ZLZpbtsOVfzU3T42TcwxULPUxEQqa02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naVC3cSM; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naVC3cSM"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-11b6bc976d6so1875872c88.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Dec 2025 13:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765403790; x=1766008590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cXDH6lhQTiBiSLdm58a6wWlqT3rBijDGmMi1XfIS/WE=;
        b=naVC3cSMeyH0tju5m8/vpoTB6ri2vt4P6kFLbJH3f3lywrX9g+niL3xa4bQ8UU16fS
         TyVrtBPbcy+GZ0684mamZyYIU0xNfxTuv2OyB9vcjUyRb4OnUjbg6FEHf2gy+Cs6PMQp
         0RPEc6ug2SZwBpqEooQjTKHAFDuZ/j6P+R5CAwrTaN1rWajch68CKPBXrL4X6zTZs0sY
         2jV3ZJz7suik7cMQNBpPZCDwPt3aQu6sI3ySg2WmHljyAw2lDnrxOQbP01WIhdKtP3cX
         kw2PagMXwclbAVJkSuW2w3RNdPfgq3UOh7AcZ5L7OUw2P7l7kkv5QYK4c7mHcJ7eFPM8
         9n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765403790; x=1766008590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXDH6lhQTiBiSLdm58a6wWlqT3rBijDGmMi1XfIS/WE=;
        b=aZ2HqTiWO/k9lF1YoqhCKOTpTLpcbWl7YxtLLUfQtdgpkPWgYloNGcIG77ITktPc3P
         SjtTMbi4XurFxhXvlpi8j3q+E13RQ7wSZ//BptLplWfkOjvJS+tZaMvTsugMtONnsDRU
         15GQcoICmevjuAAwhiLEK6uwaz0dXxIhstRMUqT0GHIonZHYQToKiOJsN61hVbOImf3t
         NRKBQMrYIxYCTgqn7SVQPXzal2hPj7T6qq9+YaaFjN7zM+i/OEACZGxsr8aIlzz43+T+
         sV66cOvSHMn7HttbSN86g/B8k1YLqeU9ffvp9MLvwTJzTIY/aIVMvr+32JRlyKsQqdaN
         VOeA==
X-Forwarded-Encrypted: i=1; AJvYcCVQDFGifogQp8NFbapA0AnZ2dad8Hhw3zp+NOl/4f06F2qYLq6igtj65kp8MmZjyP8CVwgKYZdrxm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuGNOI0eeWOyTft83UZ7wGS3Bhdl+X381CnsgOChtTSY/4caZX
	ZIxPdAfSBQUDdBpplukR517bkQCPHNGTj5FKk2TEC9dZdIYdPXpdGCOa
X-Gm-Gg: ASbGncuAQ6h2fb4928nAWDxOeWYeswvt3piVywmu8TCrOcLu409YJuR+c06CZ7RjbZh
	rQgalC0ttQIg7EWKoA6fTAXVcXBZkR6FYvoSJIF7dgl+PDvtXhYKkXhb2xNxdJucWRx0Y4LuY4G
	gRnKGwbDuDRhQ8VSvwvwWiP2TURlhOno8Ym4cA0a4/Dp3bNdyTP+0A9ETTAsDnZsNggytkcQVrZ
	UOSfVLFm9/Ah8oGjiDBIUISVyuhtEmn9GEMZARKp+qahoQt82DbqKMNugcmsQimck/RZpE0LTh0
	BwNRa9bPOqufwsKPQIFDvPgRvPefY+E+r1q+ci2HjojxzqM3KhHsekmAFxEFqh2AK7G3RPR7Qxt
	nVfOmko7WllSwxnFCVG5+zc/29WONpjRQ3M6p7Emx+U9PjyDf2gYTZV/ykRnWBRJluRXmExH/Qq
	WZxRUnYWuDNewItyz30HVVc7sY2tvR4tjbnmpFPgPO8VzI7uokKMwF76I0z6I=
X-Google-Smtp-Source: AGHT+IFh2YDRWVKv8ppwm5EiLIYikJ3C5kHwmG8NEf5Wi2an9tk9XW9uMU/5ZRhqXIhrT8o8WCwAEg==
X-Received: by 2002:a05:7022:ec6:b0:11b:c86b:3870 with SMTP id a92af1059eb24-11f2e0a7b1dmr629353c88.4.1765403789763;
        Wed, 10 Dec 2025 13:56:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2ffac2sm1887767c88.11.2025.12.10.13.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 13:56:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4d4ab58f-fa71-4c03-a239-1e2603d03e5a@roeck-us.net>
Date: Wed, 10 Dec 2025 13:56:28 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (sht3x) add support for SHT85
To: Antoni Pokusinski <apokusinski01@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251209175848.5739-1-apokusinski01@gmail.com>
 <2683b84f-d7d1-4445-b5d3-bed393de34a0@roeck-us.net>
 <d11e3cf6-3095-46df-a4f2-442d209675b1@roeck-us.net>
 <20251210214413.pyzke7etf7xfjf5t@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251210214413.pyzke7etf7xfjf5t@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/25 13:44, Antoni Pokusinski wrote:
> 
> Hello Guenter,
> Thanks for the quick review
> 
> On Tue, Dec 09, 2025 at 07:09:55PM -0800, Guenter Roeck wrote:
>> On 12/9/25 13:19, Guenter Roeck wrote:
>>> On 12/9/25 09:58, Antoni Pokusinski wrote:
>>>> SHT85 is a temperature and humidity sensor with an interface very
>>>> similar to SHT3x. However, it does not feature alerts (and therefore
>>>> limits).
>>>>
>>>
>>> The datasheet does suggest that the chip supports both temperature and
>>> humidity tracking alert status, which only makes sense if the chip
>>> supports alert limits. It does not support an alert _pin_, but that
>>> doesn't mean that it does not support limits. I'll want to see definite
>>> confirmation that the chip does not support the limit commands.
>>>
>>
>> Looking closer into the SHT85 datasheet, the sensor chip is actually a SHT35.
>> Given that, disabling limit attributes and alarms is neither necessary
>> nor acceptable. It isn't even necessary to add "sht85" to the device ID
>> table; sht3x works just fine. I don't mind if it is added, but it does
>> not need a new chip ID (at least until/unless interrupt support is added
>> to the driver).
>>
>> Thanks,
>> Guenter
>>
> I've just tested the SHT85 sensor with the non-modified sht3x driver and
> the limits and alerts work fine indeed. I was a bit confused by the SHT85
> datasheet which does not explicitly mention the limit commands, that's
> why I excluded them in the patch, sorry for the confusion.
> 
No problem.

> I guess I could simply add {"sht85", sht3x} entry to the i2c_device_id[],
> this would also indicate clearly that sht85 is supported by this driver.
> 

Yes, please do that, and add a note to the documentation and Kconfig.

Thanks,
Guenter

