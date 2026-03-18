Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D0D33121E
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856154; cv=none; b=E5rI1JlvMd0Tl0KX26kgl0j2s4izk7M36mJUulrz8liwTmCiYCD6UzYdVuVEK3jjzOsRZOziOAlLYvWaQYiWbSWXgWEeSspiioeUEqQwlNwVvfxck+M1NEpxRz9syoLgqW8u3kvzbe1DiaBSACVTDHfukCoH66F8vMcPFRxT4ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856154; c=relaxed/simple;
	bh=7foqOo4PO1+dY1J9snRPo3pULD+nFZ65/Jc53Tf6BUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvCk2Skheg6TRYRoeiyZz9swu5jmlYaCiZhGJmUJykoghriXqPoyLI1ByvWQLvSvab6vUAWO87q0x+VceCWLYjMLMTCVfBTDTolMuimlg9ZCge/vkknuak7L2ZCcax9BmHkCNZb+xdVJlPDpgXZfbRpOqf+ZiCDtCoh4tOiNiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2pRfzic; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2pRfzic"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b0586d5bb8so392235ad.3
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 10:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773856152; x=1774460952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kweWB3MHB0sQFqv3t56LlX9dg8y07f5j3ZR4fhpqzGk=;
        b=R2pRfzicrEth/rmvQIt78s2xyxoRCQd63voZ+mMyEJnGU9WX7jxOySDIWfDcvm0JtZ
         wRgZ5vbDgCfLaw9MzbBTZWYMB+wBZvblhyZvsIl+OUFCBowxwp5I8A/lUphHO619vqfi
         S4Dnuk+2wTmhOiUsbmRDbppKWK7e6Vn61jpPNEJBnPd313pbyelMdPpv5MVpZr5V45DC
         QMbZNzwVohf/ehlo/yI8wcpqdUZH98eomckDA0+jkgMsECYAG9hXceZhQis2pgofskEz
         X776OXl+WZdaiZuLZVPiizbjnHuSh9SQTaVV4hv57DDhj2EkBj9mSFA0ELpJqLPNAyj6
         CIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773856152; x=1774460952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kweWB3MHB0sQFqv3t56LlX9dg8y07f5j3ZR4fhpqzGk=;
        b=YOu9v20GH7Q4RO4k4shYegQT966X9bzYxOOTFxxYjmSy9ytMxhukHCk283F5EJBx+g
         a5Y9A6jnpgyZZLvSOqVz8ow4ocTsvu3jyj9XoWArWVavJw95ERKFyeOUVC3c+uF3liWV
         MGDjvxH/JPP/NFFJ1dXA/hS+Ktty1GxgVT0N7Nk2MrdU0mdIPVj4VP/ka4QhcMiL3TXh
         tubCwJz2AMdwo5PzrSxM9f6NHw/Sq1EI+HRCj8wST6B74azWjA9eVYN9++DzhdT6hG1O
         EdS2s7gM2dj32oItxys4qR0CMO1WHIDkCuC2t8f/TGROSq53Jt6D6CsH+kIAf/4FWqRk
         B6Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUe8yEqov3yzEiWBkRj1oG94ajzsBtjNcGkAgsfiC8GAgsV63FY2tz/+6S5HuotBMP5V2OKawv2gIE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxVngvpAe0VJeVr8i1qiPsGV57ezszhYCG7H0nbqssD3/sHO5F
	HqjhnhmWA5LEccRMVziskG27Rw9C1s8H9nc2/bzYnHlIf2ODu/1NZ69c
X-Gm-Gg: ATEYQzzPifm30Y0ZIeM1lTVfSDYeC80lxGbIgRsD82je9HbCQwgXDqMigb5xYEdVPIw
	bcIH8NDT8b8+p72WwHVuephoz/EdO0YBJzYL6BkuTgMruCYaTt8hpj6T39KCHQ7fN/0x5J2HgBt
	pCmNS5kIB04f8r34L1/hi6UP6P6+LiwGB8TyGHWuUngeByIkBuBYpy+bv8jvVx6OPREjK5Ek8Y6
	ngpb1yIornJHj5o3k4ctRaR9j33sVbHPGNsD7ikB4b/8QFRu7yp8v65xVV1VYOTwbVvdC3Sw+U4
	x25b1j/oIOwUk4oV58PD3f/QOssO1YSjkY4H2z6nTOj5wlsRO5a9EsepxqDSctql6IU8zLDYHZR
	qFyD62ZQSouvzr451IMCrwny8BzXU9xKZydi8DDew80GcP9pKOkQJiNl1kR4COa5BClzjXHfgPt
	BFrHDNpIYQqPzgrPDU7FvAq3hgN33fDJdejYU+k2ARAMb9JCa2uT31WhMNnjRWb3bAkYFMnPNNP
	HWjjiy9p7A=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr40969735ad.43.1773856152438;
        Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm34123755ad.57.2026.03.18.10.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6101afc-b1df-4f6d-9e32-09b09e17afa9@roeck-us.net>
Date: Wed, 18 Mar 2026 10:49:10 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dawei Liu <dawei.liu.jy@renesas.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 grant.peltier.jg@renesas.com, linda.xin.jg@renesas.com, tabreztalks@gmail.com
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-3-dawei.liu.jy@renesas.com>
 <9ec35dce-5f6a-454a-9ab5-e61b22796325@roeck-us.net>
 <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
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
In-Reply-To: <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 01:25, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 10:23:57PM -0700, Guenter Roeck wrote:
>> On 3/17/26 19:19, Dawei Liu wrote:
>>> Both RAA228942 and RAA228943 are digital dual-output 16-Phase
>>> (X+Y <= 16) PWM controllers. They are PMBus command compatible
>>> with the RAA228228/RAA228244/RAA228246 family and use the same
>>> 2-rail non-TC driver configuration.
>>>
>>> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
>>
>> For my reference:
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Note that technically the devicetree patch should come first,
>> and I can not apply this and the next patch because you dropped
>> Krzysztof's Acked-by: tag from that patch.
> 
> Was there an Ack? I see only one reply from me, but maybe something is
> lost because entire posting is completely mixed up (v2 being part of v1)
> so it all appears mixed in my inbox.
> 

My sincere apologies. No, there wasn't. Not a good excuse, but I got confused
with another submission.

Sorry for that.

Guenter

