Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE762EC092
	for <linux-doc@vger.kernel.org>; Sun,  9 Nov 2025 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762691347; cv=none; b=RTABQrg0HAtbrlu1RtEyMR4+E5JPWGcpVmharnurgpEYW8jlVhrZfCyTbJF18zzyFKSCA7b4SrL2lSJtftaFE/+Lhb3xEiZNc55jbaJrK2UdGlwTAZSDctwCiXReedYUitwQ8GwkytSnIyqNH4rIkTHuR0n9MkRtiW3YXsewXqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762691347; c=relaxed/simple;
	bh=+Fj8UCA6PFYAVUdnQDCZ7U9phZKfSbyakTHFESM1D7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZJjubG3BlFLUVIuzM5G84nhOqibouIQYt0kkD7seNzQJ7FrP+dliaWsVvTYnL4GaQqgLa5BtWUu5riiTup1Uor3JZCq3wle2lVpATwEU8T2tfyDkc4gp0q9oT1oX33Uwx+qVo5X9SWrUFrEtv7N85Kx1nA6CRclLwaOUKwuK1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4XHjkXy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4XHjkXy"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso1536193b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 09 Nov 2025 04:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762691345; x=1763296145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Sfh23gMPuSgFh9wP8m+RA7LgOjNZR3fljD+XVnQlZc=;
        b=K4XHjkXyWwOD1LN3ttrU8mst/IAcGQcqk2M9yWKv7e64+MzXp8wpEXrcMDoAwTqUnb
         ZiL//Etns/PYZb7FkedKuwlCAlRp37sFby0uLvMW0ZYkzL019tAUWAlURcaG99c+TZZ3
         X7YdOxvxy6qZfavELowgl64T9VUBJrowrbs1jAmE8vl8EA5i0aP5Vty21a4ivZn3JvUO
         4Mey0Y3jBNM51ACA/AUhPc1J0wetkLw5ZqmuwzHiGGJuVOxJsr/LCmO/pNiJB9f587bz
         +WH31G/7h45teVibVEq7/GNhhd/qSYcsuQD003aKE/+7wznOTIx6w4bFV1EgsJHcfT96
         w+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762691345; x=1763296145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Sfh23gMPuSgFh9wP8m+RA7LgOjNZR3fljD+XVnQlZc=;
        b=bRgQf9mMrlvsiVLzz1kd5ztPXKvYZXR4zx68igMAR0TxNvDDnZVe24xZvo1kKChs4H
         a9W4NB0i3gy2Q8E8AW8r8nnHMYndbi44BD5jsv/glZD2R2rkCGdT3q3HT0dbIzXQ1C2W
         VzjdeszF5/Zu9enciQIbto/vSTkgJn9Luhl/d5OmOmDKKj30wg02L32z6VgYKHh2mMel
         3lB/yfXfQnGeNUqECQL5Wggcc6NX08ECmeinJ7+ibEG8Laml5nNS4QYsxj07rWFXVTs8
         rg3UhF6zzX7ldyO2e1G3e9zoENE2yM9IHsH0nNJ7HWmoS9LPRQGGZbnlXXyQysyd5jJJ
         9PiA==
X-Forwarded-Encrypted: i=1; AJvYcCXvr34Y1ISr+VfGpr3b9xNqdORk7eB5IZ2Jk+weWtodv1kanV4BEHVDs9pEFj99X83kG3cbijPF4SE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZK3VbNtMCmw3PbuDnB/6x3UZ3AKo66fqBOmz5m4oLCzUFyeeS
	5PXuG+j+SSCi1tgbXyhjEZt3UPn1wGdFPopywEgF7D9ifhzoi7MX5Mo3
X-Gm-Gg: ASbGncuU1CtaQjIJ41s8Z/JyFHDPNa2ai4KUD9djP79Aj6HAYODrjUZdPMe5IBVmxPp
	93LdobDoWqbDVAFNZshD3WBfgCBfeFaHqYpmInnN7oVAdW8vSn7QEZrV/dgIJY4WjLvuc9f2xan
	bBHR3ehNgeF2uZtl2IU5I6TCCEHJsSXCmYF/96wxrAUg0/X+UnSh6Q/lWox7ooIoUQ7vAEm99cg
	mB7aZsejwb1jU6tI+yYj/Kjyi3ci7v+fKn0n505aKGaJ0qZ/45XekHBdHtMIFksYbtDWD/1pZr2
	5r4wHKF2Rsl+M0zZv4cQBdUOx1xDHaPcOsXiQYqRWgcXGaRgyRN7g5LxfiZbBPkhcwG2ur+XUaw
	ug1potI27cIcch/iJEJeem6UWXxeaiTqtDxYuUN3gYmFqyMVBiJ9yQjOhEVd/SDsA8/hRO1oEKF
	MWhOm/wiARxoJlykTJYg==
X-Google-Smtp-Source: AGHT+IEkKiASBAM/v8nmSr1bnyXvE15oiC0TbeFeqMLmzAA0Ln0KLA0nGZWhrWf0I/1B3xOi0IZyGw==
X-Received: by 2002:a05:6a20:734f:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-353a428d5fcmr5965129637.52.1762691344990;
        Sun, 09 Nov 2025 04:29:04 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffd3f6easm10211085a12.21.2025.11.09.04.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 04:29:04 -0800 (PST)
Message-ID: <e5e3a542-ee07-4fe5-a6d5-2bc5b2fa873f@gmail.com>
Date: Sun, 9 Nov 2025 19:29:00 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: tpm: tpm-security: Demote "Null Primary
 Key Certification in Userspace" section
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Integrity <linux-integrity@vger.kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Corbet <corbet@lwn.net>
References: <20251104131312.23791-1-bagasdotme@gmail.com>
 <aRAdiUB9otJk5i9U@kernel.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <aRAdiUB9otJk5i9U@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/9/25 11:50, Jarkko Sakkinen wrote:
> On Tue, Nov 04, 2025 at 08:13:12PM +0700, Bagas Sanjaya wrote:
>> The last section heading in TPM security docs is formatted as title
>> heading instead. As such, it shows up as TPM toctree entry. Demote it
>> to section heading as appropriate.
>>
>> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>> ---
>>   Documentation/security/tpm/tpm-security.rst | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/security/tpm/tpm-security.rst b/Documentation/security/tpm/tpm-security.rst
>> index 4f633f2510336b..bf73bbe66db2fa 100644
>> --- a/Documentation/security/tpm/tpm-security.rst
>> +++ b/Documentation/security/tpm/tpm-security.rst
>> @@ -153,7 +153,7 @@ protect key sealing and parameter decryption to protect key unsealing
>>   and random number generation.
>>   
>>   Null Primary Key Certification in Userspace
>> -===========================================
>> +-------------------------------------------
>>   
>>   Every TPM comes shipped with a couple of X.509 certificates for the
>>   primary endorsement key.  This document assumes that the Elliptic
>>
>> base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
>> -- 
>> An old man doll... just what I always wanted! - Clara
>>
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> Should I pick this?
> 

Of course!

-- 
An old man doll... just what I always wanted! - Clara
