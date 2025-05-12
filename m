Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CEF51022
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 08:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747037680; cv=none; b=eeYswDvK1RNah1qa3Db7Iz9G1gZJaQMaEVVPmbM3Fcx9Z5cj1TFOlBzIKxmXsYJOqi4Hbk1GVVRemFJFK24nw5l4KjzHGjMA/jKtyctZ9kBnyvIazMs/XyVlhNTKVTMlxOd8GD12XBEw2VUky22o7OsRJg/7MO35CST07TmLf6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747037680; c=relaxed/simple;
	bh=ZTzMqrn1URom1KwjBf0pttZCkEBA9ZhKUjt81jZvKpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olLqNvGsrABgTKSD9XXqEe63/JLYer3s8Z85WsbgyrbI8S8alNEgpdZwiq1131Jvmno/ypotNvPPHJLSq+XLR35V0+SsV1iReys46QqlWa8m0rEQqsjf4cLblKO/ssxsNFvetzqv1BchqaKxt15uobOCr0y9Mrj3l1XaK69hA0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ar35yTb7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ar35yTb7"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so3518990f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747037677; x=1747642477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KUWtnXREtfU0bglSJPdPg3dSI06mpwAnzzgVNIScr4k=;
        b=ar35yTb7To8DY9zWyhaj6CjMROYLdYrYlJZcHgm8BIoBZKjBvh9TZEgkQaroHM/MrB
         0wf28gvakTOoSeYMpA6KMAbG08lbGK/ok2kSq9L1ZmyJh5KXFFlmffG9UELfgi7zB18U
         jP0ErP40tITWcyfs3kIvcjv1BmmqBu8kTyM33P+c6cGRxbXKDOPAGGWPp5h6uRx3cHTR
         31XQCxU138vYBdRT6Hm9wTWKs8uVODmvhntVgrSj6w4mpYbUxROsxbTkO9u26UyFwdNq
         WgXQxFMF4ViuxbOgxtOkjQNkhJhJpamWjzsewC/ctHdizn8euM/TQ+GmPG+em6a4ObwO
         c+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747037677; x=1747642477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUWtnXREtfU0bglSJPdPg3dSI06mpwAnzzgVNIScr4k=;
        b=Lx9u6xXP0dnNRaeOvtl/j6RgXxC2oW1qvjkBqgcakE3E2aaCJMyHNHOxO2zw0qJj8e
         8Iblmy6YN+DM7qT9k/aDrjV99NlXcVlleDRmVc+skWrFzK9okg+ulIaFQSlO+1IdM144
         jNa28ujYTygUOZ9PBPjgMvOd7vNfMcX5vK3n2I1wNslyZrWpRAwU0hkh8xmOp+bg4gI2
         bsaoEPvnPwFVFctiqi+zdvCcY5kp4RwxCn3QzLIKqj+EtgnSVV/ZFRlJW2JCwRu3YUvR
         gdVwiCWBQPFszTHNpJT7j5UGUf+tFKMmTXlK26tIAS3wQZM6fU8OyuoqOurftHwrsm5Z
         V4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWf1ZZvklEE6/jh9JFKD2jRGi9VAfd1a3qnV0ZGHUlrbVij7RFZE75bIyDqbS23SHp4EEN6EeYT8J0=@vger.kernel.org
X-Gm-Message-State: AOJu0YycpsKnf97U30k08jFTD2hpzEuu2t9a/RQvWVtrZQPToPodyTWW
	vPnyRDlzXCoa6zh/cdMsW0z/dWJKN8zGpAWabFKnwjWEtxQHmJQZ9WshgpROFEQ=
X-Gm-Gg: ASbGncueZ5VKXMQkZHkZwkXmtmtDxKPPSJ0oxJR4fZ3uiCb9Xi09VJCQQJ8Uu6sJSBw
	3owyZCsyJl+4zgLMfPfwb/K+Ys/Y2no80iErjL48qPWYNqiVT5yqNxZH5/FCPIhthQNOxydj4pz
	T76MClU0x23bjWSpWHAuBPVF/ZpRDN3uHI+uvFP0eLyVwWHvcxkvFpRuVcfBQVHsNDdhUvYSWCF
	+9pLNWBqqzuiqUbF1d2MFhI+KIZDsszqOLAdHwPYK9mz51J2FeqyNdlU7GyXsq0XZ8uxFjdIKPT
	cMtfkrj5+BTaoPS2Nko55DngG8rkkBKDFSddBbctaMF9xIwQoHv3GHlQoyoNv+uD4bb9IsMgGta
	68n/mJlWQFfiLS1L6xd1V
X-Google-Smtp-Source: AGHT+IF5FdpyihNwkP+pz8qwsSi03YYChIIL/diT4CyeFnMpdYT9qUG8HkxnvNgaNA1vzLlpCGu/5Q==
X-Received: by 2002:a05:6000:186f:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a1f643acbemr9221007f8f.9.1747037676817;
        Mon, 12 May 2025 01:14:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2cf43sm11626947f8f.70.2025.05.12.01.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:14:36 -0700 (PDT)
Message-ID: <fe9d801b-007d-476d-97fe-96d0f3d218cd@rivosinc.com>
Date: Mon, 12 May 2025 10:14:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/14] riscv: sbi: add FWFT extension interface
To: Atish Patra <atish.patra@linux.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
 <20250424173204.1948385-5-cleger@rivosinc.com>
 <1c385a47-0a01-4be4-a34b-51a2f168e62d@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <1c385a47-0a01-4be4-a34b-51a2f168e62d@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 09/05/2025 02:18, Atish Patra wrote:
> On 4/24/25 10:31 AM, ClÃ©ment LÃ©ger wrote:
>> This SBI extensions enables supervisor mode to control feature that are
>> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
>> DTE, etc). Add an interface to set local features for a specific cpu
>> mask as well as for the online cpu mask.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>   arch/riscv/include/asm/sbi.h | 17 +++++++++++
>>   arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 74 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 7ec249fea880..3bbef56bcefc 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct
>> cpumask *cpu_mask,
>>                   unsigned long asid);
>>   long sbi_probe_extension(int ext);
>>   +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long
>> flags);
>> +int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
>> +             unsigned long value, unsigned long flags);
>> +/**
>> + * sbi_fwft_set_online_cpus() - Set a feature on all online cpus
>> + * @feature: The feature to be set
>> + * @value: The feature value to be set
>> + * @flags: FWFT feature set flags
>> + *
>> + * Return: 0 on success, appropriate linux error code otherwise.
>> + */
>> +static inline int sbi_fwft_set_online_cpus(u32 feature, unsigned long
>> value,
>> +                       unsigned long flags)
>> +{
>> +    return sbi_fwft_set_cpumask(cpu_online_mask, feature, value, flags);
>> +}
>> +
>>   /* Check if current SBI specification version is 0.1 or not */
>>   static inline int sbi_spec_is_0_1(void)
>>   {
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 1d44c35305a9..d57e4dae7dac 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -299,6 +299,63 @@ static int __sbi_rfence_v02(int fid, const struct
>> cpumask *cpu_mask,
>>       return 0;
>>   }
>>   +/**
>> + * sbi_fwft_set() - Set a feature on the local hart
>> + * @feature: The feature ID to be set
>> + * @value: The feature value to be set
>> + * @flags: FWFT feature set flags
>> + *
>> + * Return: 0 on success, appropriate linux error code otherwise.
>> + */
>> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
>> +{
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +struct fwft_set_req {
>> +    u32 feature;
>> +    unsigned long value;
>> +    unsigned long flags;
>> +    atomic_t error;
>> +};
>> +
>> +static void cpu_sbi_fwft_set(void *arg)
>> +{
>> +    struct fwft_set_req *req = arg;
>> +    int ret;
>> +
>> +    ret = sbi_fwft_set(req->feature, req->value, req->flags);
>> +    if (ret)
>> +        atomic_set(&req->error, ret);
> 
> What happens when cpuX executed first reported an error but cpuY
> executed this function later and report success.
> 
> The error will be masked in that case.

We actually only set the bit if an error happened (consider it as a
sticky error bit). So if CPUy reports success, it won't clear the bit.

Thanks,

Clément

> 
>> +}
>> +
>> +/**
>> + * sbi_fwft_set_cpumask() - Set a feature for the specified cpumask
>> + * @mask: CPU mask of cpus that need the feature to be set
>> + * @feature: The feature ID to be set
>> + * @value: The feature value to be set
>> + * @flags: FWFT feature set flags
>> + *
>> + * Return: 0 on success, appropriate linux error code otherwise.
>> + */
>> +int sbi_fwft_set_cpumask(const cpumask_t *mask, u32 feature,
>> +                   unsigned long value, unsigned long flags)
>> +{
>> +    struct fwft_set_req req = {
>> +        .feature = feature,
>> +        .value = value,
>> +        .flags = flags,
>> +        .error = ATOMIC_INIT(0),
>> +    };
>> +
>> +    if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
>> +        return -EINVAL;
>> +
>> +    on_each_cpu_mask(mask, cpu_sbi_fwft_set, &req, 1);
>> +
>> +    return atomic_read(&req.error);
>> +}
>> +
>>   /**
>>    * sbi_set_timer() - Program the timer for next timer event.
>>    * @stime_value: The value after which next timer event should fire.
> 

