Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDFA18E12
	for <linux-doc@vger.kernel.org>; Fri,  2 Feb 2024 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706862171; cv=none; b=kapnSv5tNx9FUWRER1pZJiS10Z3ngqu/ZjoJzcQjxcX6OaPoCuTjl31KY+GVmTl4xOFrZWgCAdWOD8eHPc5T1PjzK8Ry9oOmW/qwVJsdgWvR+Ui1Bv6h9IDHY6eVjNkxS8qOg9BQ5/hwhXlm/kxyyOYmXj/zzN4ipjP12tSdNnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706862171; c=relaxed/simple;
	bh=7tIHhc9IDe5ns2/JSRcv7LK0v4LwL4LEesVFyzRNJAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QY2NlU3AvxXesRyx+7xdMq5rantxNLk5lw9PwoGdT6vAPDcCUryPsIKd225zi7VAUk4j1UX4FFv8c+cUtCY+W+RUvA5QZ5pqvS+crjo4AIQeHnhpsk6aDB3sZpoNTzxl0deXBDjy2GA7g81RP9kJxUpb5WAnlNHHdGjatqtVVVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=iExGsu6b; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="iExGsu6b"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59a1e21b0ebso464739eaf.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Feb 2024 00:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706862167; x=1707466967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=of+2VS6dyzD16ALuDPAa9WDdPy6fg9Ys9tT8Ytug3g4=;
        b=iExGsu6bEAfKW4SU2H0VKVIe65R4fgMT8DxEYemRwlqsjPfKkungYzyaqD17vAl1QN
         FqCBsgoa4EixvZTKWuyzKnQrFdOLFrq+TVe0ssSyHDirwZ4GpjcATn6GFd0ZKdzIluU+
         uEpDmSMAmhokVk4OUnNgNEUBJVkz9qFDXlwnMEWrpYmht1sbPMGs7YZeo9N/667UjZID
         Oo7dGWFmT+5P+kYWT6DJDZlScPUttMGMZOrZ2Mo4Qb109miU8B+Q6TERD4SW4KpG63eb
         j5tkMQ0/BZKs8pcC74a5CHUDIb/msvzZL+JmPDyZ2kvpMwHSkt4wxysue+PuU/rgq/62
         XbrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706862167; x=1707466967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=of+2VS6dyzD16ALuDPAa9WDdPy6fg9Ys9tT8Ytug3g4=;
        b=Spy33jVKqBgt07a/qxCGjFjFjdEzxQJ+8vuHB+FTZEll2LTa0YONgQGJ0Dblg0y97t
         rOfpzjjAm5mL6z/eAg3vtJTjmsNgBfo/EaBOtN8G3HPjKbshbmfJKomQD8gAeCUZUPLv
         t7ouHozurHt/ZwVPrpN6QUCs8QpwwJOKzSyNWX/y3W2PxB8wU6xuouBhV+gdS/8t4eeV
         ED6DfG9kzEoEtGBgeWgsreuEeRuHjhc/Q5PL1z7VXpOXO+NjqR6nM1axzD0MVqCKDVM+
         a7t3zi7CiEWcWsAeUvRLN2ahzSE0S4yMW0OcpCpsRlPiu1Ka4s4nz1fSO/ookxYrjZRq
         sqCA==
X-Gm-Message-State: AOJu0Yw6YMUB8o0axSal7Qh3bMW8BIVeXoFP4wz0letP+EEKpxHzcS/f
	K6uRTPz/P0KcXqDWZPKN1c7/1BIDNOeG2JhO3vq5v3zZof22W/Ejek/UYoIJvFs=
X-Google-Smtp-Source: AGHT+IEqFgJjxsho51lgtlCQHbrRjML9//5X83vR4EP4Q6fKUc3ZeWRRAaFSJm8yIThVMvRZf7pMXw==
X-Received: by 2002:a05:6808:144e:b0:3bf:bbd7:c770 with SMTP id x14-20020a056808144e00b003bfbbd7c770mr1842892oiv.0.1706862167503;
        Fri, 02 Feb 2024 00:22:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW3DGFuK/LBFiPor3fjHm3Swk3yg/Ka5eaAjYPzEU+qprxT87NNjvtfixg9RxSNf9ML3AtgHiQlRFhUhc1jxHt2VpPEl4Fc+V/ILNHjw3IDJlHW4qxg6DK4VzqrYRAN4Ec2m4UnlPYE4zcCOCaLUloy5HfRHSibwCcwqkciUoU6snY57i0C7wdR3E/5wFLD3x1Dcb+1BXTbifx7Tqu8IrB04TXsXdSBTYGnjFRshKEVF2FEvj8Z0Xsi0kePgrdeplDwmC3UJq9s8kflXCsw50+rLpH8HgwJnwfPFygJ/N+Kww==
Received: from ?IPV6:2a01:e0a:999:a3a0:6d51:959f:bb28:92? ([2a01:e0a:999:a3a0:6d51:959f:bb28:92])
        by smtp.gmail.com with ESMTPSA id a21-20020ac844b5000000b0042bfbdb46f9sm603925qto.91.2024.02.02.00.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 00:22:46 -0800 (PST)
Message-ID: <701d3350-93d3-4235-aaf7-04c6492420a7@rivosinc.com>
Date: Fri, 2 Feb 2024 09:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export VA_BITS
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Robin Ehn <rehn@rivosinc.com>
References: <20240201140319.360088-1-cleger@rivosinc.com>
 <ZbxUUsKdKIPI8Fb/@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <ZbxUUsKdKIPI8Fb/@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 02/02/2024 03:32, Charlie Jenkins wrote:
> On Thu, Feb 01, 2024 at 03:02:45PM +0100, Clément Léger wrote:
>> Some userspace applications (OpenJDK for instance) uses the free bits
>> in pointers to insert additional information for their own logic.
>> Currently they rely on parsing /proc/cpuinfo to obtain the current value
>> of virtual address used bits [1]. Exporting VA_BITS through hwprobe will
>> allow for a more stable interface to be used.
> 
> mmap already supports this without a need for applications to know the
> underlying hardware. If a hint address is passed into mmap, it will never
> return an address that uses more bits than the hint address. I designed
> it that way so that something like this wasn't necessary.

Ok even though probing this kind of thing is probably not what mmap is
meant to do. IMHO, probing this through the regular hwprobe interface is
probably more coherent but maybe Robin (which needs this information)
can rely on that.

Clément

> 
> - Charlie
> 
>>
>> Link: https://github.com/openjdk/jdk/blob/master/src/hotspot/os_cpu/linux_riscv/vm_version_linux_riscv.cpp#L171 [1]
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>
>> ---
>>  Documentation/arch/riscv/hwprobe.rst  | 3 +++
>>  arch/riscv/include/asm/hwprobe.h      | 2 +-
>>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>>  arch/riscv/kernel/sys_hwprobe.c       | 3 +++
>>  4 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
>> index b2bcc9eed9aa..6f198c6ed4f0 100644
>> --- a/Documentation/arch/riscv/hwprobe.rst
>> +++ b/Documentation/arch/riscv/hwprobe.rst
>> @@ -210,3 +210,6 @@ The following keys are defined:
>>  
>>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>>    represents the size of the Zicboz block in bytes.
>> +
>> +* :c:macro:`RISCV_HWPROBE_KEY_VA_BITS`: An unsigned long which
>> +  represent the number of bits used to store virtual addresses.
>> diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
>> index 630507dff5ea..150a9877b0af 100644
>> --- a/arch/riscv/include/asm/hwprobe.h
>> +++ b/arch/riscv/include/asm/hwprobe.h
>> @@ -8,7 +8,7 @@
>>  
>>  #include <uapi/asm/hwprobe.h>
>>  
>> -#define RISCV_HWPROBE_MAX_KEY 6
>> +#define RISCV_HWPROBE_MAX_KEY 7
>>  
>>  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
>>  {
>> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
>> index 9f2a8e3ff204..2a5006cddb7b 100644
>> --- a/arch/riscv/include/uapi/asm/hwprobe.h
>> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
>> @@ -67,6 +67,7 @@ struct riscv_hwprobe {
>>  #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
>>  #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
>>  #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
>> +#define RISCV_HWPROBE_KEY_VA_BITS		7
>>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>>  
>>  /* Flags */
>> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
>> index a7c56b41efd2..328435836e36 100644
>> --- a/arch/riscv/kernel/sys_hwprobe.c
>> +++ b/arch/riscv/kernel/sys_hwprobe.c
>> @@ -202,6 +202,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
>>  		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
>>  			pair->value = riscv_cboz_block_size;
>>  		break;
>> +	case RISCV_HWPROBE_KEY_VA_BITS:
>> +		pair->value = VA_BITS;
>> +		break;
>>  
>>  	/*
>>  	 * For forward compatibility, unknown keys don't fail the whole
>> -- 
>> 2.43.0
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
