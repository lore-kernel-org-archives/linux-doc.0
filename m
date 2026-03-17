Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67C7081E
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 05:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725173; cv=none; b=KifBXOg6Ug8VyQDrDYHr5Iy154wkpcAvjHmaCpJkpzDRdZROsF3oIABuJIEb67v9/NAFtU+MUmgrk3efZqn5PIrJqNJAtRTd7R2ncTnLc41qOiHqKwo2Vx+9U60NALBCOV00DAcVCoDN19hIeM8syBPjOm+YFnqPOS04nqPYvLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725173; c=relaxed/simple;
	bh=7pDv4DdUwxQJp9OSLD8utAzJKGTphWCoO1SOQz+vHQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruVbDbKmWX/5AsaOJpyFyTDYCJ6485E8rfXBQjFb4onpFP+Vok+iOYHVAX8IKFFeUf7wSv6/XDrZmzCBrrqY0ruIkJrLNhf0dCUzJwsIMiz1glVWgkh9Ye72JbOjMQVxtHy9qQw3doQ2w0JpVE35bTn4zIEpuh3+Q4vCwySjqqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5htbewI; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5htbewI"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bea8a1c040so3270684eec.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Mar 2026 22:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773725171; x=1774329971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4nXAAp13nfYGD1zz7+bBHPREfEHHL+lQy1dom2K4cvQ=;
        b=L5htbewI7bUG+WAYOXXgwdclgmyvSwHrA4kvQv5AmoaWbvCfhgvoRkncC9fOh6xC6Y
         u6DQR0knMsmBdWWTHt19DZU9sKjQKVxxofiDavKrDi4GQrmCmvLYXQieSavsFITegKMS
         lRo//IBYWvrXtsueRyifqIHO6sz12OwHjTTdBcaGkay5f08ImLkVXDlvqCLUhTTbu57x
         /6fOYAQIFhk4ZBXJVR+v6AcPDexJA5G8PTD66xyDh2f60G1YOb8XbzboxvrCfAz4yZbT
         qknRzsx005TSyPAbIjsuKS1x/37QT3noo7uzjLaFbLtjGaEM+9HvSqIO2aM0XME2UyuA
         l7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773725171; x=1774329971;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nXAAp13nfYGD1zz7+bBHPREfEHHL+lQy1dom2K4cvQ=;
        b=diCYskzkAWWxgrbnn0KszVePWkzJgOg5XVLTGpTCvi/SCS3Mb+zkmEL4tEa27lMQxk
         8uraQCkAy9qXhQlyDgnn3/2dbKtQpuufCfCDUjcsSkmJipXbAMtubjV4Oojs5vJOOmY1
         1zQTidau5gTzbKFH3SNnhuDY04XpomsjJGicst/Ch3IyD3oDxbcNmuphSIsjqA9h4W0P
         Gr1mHLY7tUlg/aYQ6XhKARjRkU/2igiwYRaCGs/9wOuxApdB2zIS30z31CHsqUnq+FF3
         oWYMuKRJRDLGx3G8H1A1Spd671h7dHiH9clIrY3qBCi7Q9hTHT6ZrSCDjc6CZXCodeMn
         gyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfdG7GbqGhr0LYnQcdZJzMtajuTbIGXgbjsFicyOXUHJegix+/+O3ZU+EHWAHCxycZDtOc6QOgJdo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzb5Nl43PtVIHLR3QaHSXQcn2TCXWdz2Wpea/MeKUgLaV0sLZH
	3OaBqk+8O4wUFqe7JbejQHtJdX2dtSfCODkAcWCiEiL0Gv/1mTNtzssj
X-Gm-Gg: ATEYQzxh5t1NuEJQz+4a465mYsEdpgZfHjB6Mf8rieAv7ch8x3gX2LcU81obcrDl15k
	oNI/Lp3mgam5ZUVHeLZOPTInhesmg14l8x7ANW1YtBBkEctV5zJAJ89zKTWke5FBnYARdObmKYu
	+DYQsF2PjQt3CVisNLJM+QVEqxMvsVEDy9J6Do3PHL+vN3PnoQbGlDcj1VBZjnI0SozJLS8Ug+r
	VlhkiTvQ5oidkDA56Pcti9VrE+CDc+sCbEddl67JetfEKF5TIGFKwGsg/pk7Ss13lVzPgeKmA3I
	TOTGgXt1e99bugprtIwEh6VDKfdQFazXNzwu6hotxH9GD+vA0sakaeCfv8NdnZJ7Cgh+F70/ETZ
	ou0p6XBh/9BG06EIxAbH45ngRGdsbKpHashVcFBEXYzr51fOrxsn5cZoV7J5RWh4bIk2cp/p2M1
	FfpwKzZyf2MNXm9Ex13qU6vBWhtwM1xQbK42jicBgNSQhXzCZ80FnI59iDxjhx1uq9LfGEtsaE
X-Received: by 2002:a05:7300:4307:b0:2c0:dd01:e71b with SMTP id 5a478bee46e88-2c0dd01ed28mr53147eec.24.1773725171296;
        Mon, 16 Mar 2026 22:26:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3e4a54sm19864759eec.10.2026.03.16.22.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:26:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <aa14c65f-9c98-432d-969a-7919a1353f62@roeck-us.net>
Date: Mon, 16 Mar 2026 22:26:09 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: add driver for ARCTIC Fan Controller
To: Aureo Serrano <aureo.serrano@arctic.de>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <c6d6c506-1407-4676-b730-f9fff595bb75@roeck-us.net>
 <20260313111955.36811-1-aureo.serrano@arctic.de>
 <60ba4d74-5145-4996-a26d-b883ea67dcc9@roeck-us.net>
 <FR6P281MB590093105CE0A62A1A69BBFDEF41A@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <FR6P281MB590093105CE0A62A1A69BBFDEF41A@FR6P281MB5900.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/26 21:20, Aureo Serrano wrote:
> On 2026-03-13 09:59:56-0700, Guenter Roeck wrote:
>>> +	buf = kmalloc(ARCTIC_REPORT_LEN, GFP_KERNEL);
>>> +	if (!buf)
>>> +		return -ENOMEM;
>>
>> The second problem does not exist since the hwmon core serializes sysfs
>> attribute accesses, and a single once-allocated buffer would be sufficient
>> for the same reason.
> 
> Moved the buffer into the struct (u8 buf[ARCTIC_REPORT_LEN]), allocated
> once via devm_kzalloc with the rest of the struct. Per-write kmalloc/kfree
> removed. Does that match what you had in mind?
> 
Yes. Keep in mind that the buffer must be dma aligned.

>>> +	{
>>> +		guard(mutex)(&priv->lock);
>>>
>> The { } around the guard() are unnecessary, both here and elsewhere in
>> the code.
>>
>> If the guard() is added is because the call is from an event handler,
>> use hwmon_lock() and hwmon_unlock() to serialize accesses.
> 
> Braces removed. arctic_fan_parse_report() now uses hwmon_lock()/
> hwmon_unlock() as suggested.
> 
> One consequence worth checking: since read and write callbacks are already
> invoked with the hwmon core lock held, keeping a separate private mutex
> alongside hwmon_lock() would protect the same data with two different locks.
> I removed the private mutex entirely instead of converting it with
> devm_mutex_init(). Is that the right conclusion, or would you prefer keeping
> the mutex?
> 
The separate mutex does not make sense, so ok to remove it.

>>> +	mutex_init(&priv->lock);
>>
>> Use devm_mutex_init().
> 
> Addressed as described above.

Thanks,
Guenter

