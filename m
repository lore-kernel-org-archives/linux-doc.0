Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4887325F995
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 18:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765046423; cv=none; b=SZKohNuZAwwP/g/lFW/pu7SLiP+zyz/Mw7FoBno/Am6AfTRRe9RleHPmnjzq/Fbsy0aJCkWZWmeeqzMPiLW0FU0Rd/UJTwKJxMVPHLo/4vvyUocc3omv11e/v8qKGfSCt66sAqxokDW4/7gS6Lq8nIw1G8eS3lyBsBsIShO7amY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765046423; c=relaxed/simple;
	bh=Sfqt3gnjZW7b5ARN30YZx+PJVpaUH8MGktTxrp8s/hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgLuiOnTSbZbRy/azzm+KPIYq732oAJsjuagT7b0nrVK6+edx8UvUg7bbwuPQB9xOWZL+S5/DCVZYhDsJD9Bm1/hqrBvU6zCu50Sm7vaRLMj+Cqwi1vzmY0OmNpAcgRB5dyanI59GxCjDidYr6Sosb3LBcGxeRTOWUoK57mcolc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC4Sj/QP; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC4Sj/QP"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29e1b8be48fso1789385ad.1
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 10:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765046421; x=1765651221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ug/ueRrOF0ZJs7tDyCdnAKBzRGfNPmlzAx886ZPB2C4=;
        b=YC4Sj/QPxc/V+lB1n2LlrFChZrUtCBd/HJAjr+QoR6CZYiR/Evc3kxVGYHAwl5cksD
         1LNY494WxqRWtU0gxRoLZucklfMZoEYB6iKHHXOKanXqCAYk0qI0lGuyOZY/OB1zLIOh
         U6ea5trkHdhbLcDymJPxyOD9OoDzd61sBuAGhJvlZay/iUIAiQmOFUrAHbO/CQTyK11L
         89Bm2XLs1gxSi1cF+6Ho2QJv4KtBcp4BEz5QmzC/o5zY3Ghh5tOFI5HPN/dnUKHtszUM
         FdHeWcjyhv02MjP7ihHqbhgqFvfvNDLgaPve2hxUiVuwTzOsJ/WBbjT1kC5Fi9qq0swX
         Dh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765046421; x=1765651221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ug/ueRrOF0ZJs7tDyCdnAKBzRGfNPmlzAx886ZPB2C4=;
        b=VtbbJbNxIfpV6zq7zIi+W8goXZsCHWNkFjgCcmYqIy1VvvTukOxUCd9ZQ6bBZrN/D4
         Bm09BbFmmm17wmHn4w+z/05XoTj31TwS1QTsv04Rcn/OUPKk2d3DWUvWU25GXBON/yDo
         bdJeBAIFuWlcizM5Hr2ql19qC65CW0bzOe47TNYBg6kpdTYX+Lim5A1158fqMgB+yfko
         nc0tqgAi2FK54yhNaqQANXbozLw/9+1V1HNHg8Sdl8RLNFbmw5eHnB+uxtaRGNaYVreH
         6eRnyE1IWBA2007OBV+ea6vUQByaOtmW28R59b3wKJ1Y88Y1q3ZkZyp6f8A2z+PIrrbC
         WYTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoD7NOeilOuPA2lJu3cl++zNKB0jMkWkNZ9U0B0j2krLuLsC3h8rzcIdahcoiirKoxwN2o/4o2q5M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkQUgkIhW6gcbXsQFDYUE+FlvEurWO9CMCberiAG2qMZEKSAnV
	xwf5wq1b9sPuCpqqGnYh7HzWBNmhRH+YB7rPf/VtYyY7l9ymWD6prCcq
X-Gm-Gg: ASbGncseUo6X+Z12nK2GlzJdFCJaMjWYZvLw8gRqOK25ThrIIuMiSQpyCO9O2lhS7dM
	rnvjek5JIXuL9cC3kOZn1OJFEy4sAfD5Rf2eA8FYewBSmvlR0hLalhRGBkXY5ID0K863YNujkYG
	swcM31P6Nfe3hTvR/LajzD6MqdIUTFfFsiPh+HnhlgiXVyk1u0vL5HMqG9zLExudAgaRwRDVXSC
	D1mtrPOmWGcP7ERm59qC9Qz2c7bPN40rMMLrv2ddA5laWruyAsFkuZogpn3LA+UMJD3Ps6ztyET
	nN3UAvwzDoYfhaiop4gnBY+RmPMKKn7iuJHLEUQtEW0p+A4fkKCWmiJXQCzGiuHQ/+eQJfXv0GX
	2d0Um7q/k8dVqlPSCuxBRemde9ViEi+1yZTaxtQQMIcj1pTOgj/EMBiI+GuBX69P9ZT1rNEDDJh
	OLHsFzSJPzs2+HSU+cS6zggAjTM5pBQZ3qihTxHMGVNzpH2RYFgaH5IRcQDDg=
X-Google-Smtp-Source: AGHT+IG0Ve/ZRIK9NvEdzLyuOMm4IvDD4j4EDNmnJ/P3NEM2Fxa6VOcXUycTVDAxkmbTSq3/ss9DGQ==
X-Received: by 2002:a05:7022:221e:b0:11b:9386:a386 with SMTP id a92af1059eb24-11e032ae381mr2517103c88.41.1765046421224;
        Sat, 06 Dec 2025 10:40:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ff44asm34322905c88.9.2025.12.06.10.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 10:40:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
Date: Sat, 6 Dec 2025 10:40:19 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
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
In-Reply-To: <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/4/25 08:15, Nuno Sá via B4 Relay wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Support the LTC4283 How Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

I finally found the time to write module test code for the driver.

Some early feedback:

- The driver must work with non-devicetree systems and without device
   property support. Select defaults where necessary.
- Attributes marked as readable in the is_visible function must be readable.
   It is not acceptable to return -EOPNOTSUPP. That applies to all
   reset_history attributes and maybe to others.
- regmap is configured for 8 bit accesses, but some registers are 16 bit wide.
   The energy register is 48 bit wide, I am not sure if it is safe to use
   regmap_bulk_read() to bypass that. At the very least it seems risky.
   Is there some regmap documentation that guarantees that a bulk operation
   is always executed as a real bulk operation, not as sequence of 8-bit
   operations ? How does this even work to start with on a system with SMBus
   controller ?

Thanks,
Guenter

