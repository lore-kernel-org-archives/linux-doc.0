Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555E221545
	for <linux-doc@vger.kernel.org>; Thu, 22 May 2025 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896587; cv=none; b=aPugTc31pl5iOvEX0fDa9+4pGYebhe2NdRdjMUU1CPMLaF2/wJw86kSj3/XIt7GXHreCtfi81c4ajU1C2ROm9xjM2XMInzbTVexyDrjvb746eS429OkEGyDA9UzHRkmmmOJX1H3mBBjQlVcy+3NnreAH1JlrPoSYinz7Jt0vmDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896587; c=relaxed/simple;
	bh=NN18PvERwtDdoTCnb8dTOMXJOoITZnwSQBbXNQA7a0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E1oaxvtr2vWnjIj5VrWT/uF5JFCzF0CmwyjV6wx+i27vovh1toOF3TN3wsG1kmkVnx8lwK4F33aNi4lgXGT7+8dRmFWyCMUaQtlYxvwjiOqTy3BJb907xX7ECBzQdvPcqVF2/bZ5tnDtMb0Sb3bryvfLMq7Ng8oZeho/F0qAx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=h2yatspl; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="h2yatspl"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d1ed82faso59677975e9.0
        for <linux-doc@vger.kernel.org>; Wed, 21 May 2025 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747896584; x=1748501384; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mSfZsD4God9Ts/HLONlfHOWEtM7BhkFonFKtAqIE5Mk=;
        b=h2yatspl14MsY6LqiXygHE0cZu/D0s7+Fwtp37NKiq43zLuVrS7EyQrIpZdKrEwA5Z
         3OkjgQ8uFHAA16JzoSAM2WpHJ/vTXryyIsdHmW/dujtGIgcwXcOU0LAh2r8DcqaIg65o
         O37E4sGvn3nNFoBLMYtZM69dk49IFsU2rFp6CJ/P4GaNUEgtebOV4LfuvWtV/EsuNKcl
         tIRpk0OWE1pgkYRpOzufx69hWN6WWUIFfux/5KB9pyv2HP4cRWD3B0HCPAH9zkbk6892
         0Eulj5wmVyX/UeCTt9zWBZ3lFUrlwr4VSvesTMJz6WrY7y6rJzqgP63Aya+jjE1DPKxv
         OqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747896584; x=1748501384;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSfZsD4God9Ts/HLONlfHOWEtM7BhkFonFKtAqIE5Mk=;
        b=axOL0AkaPm1ZJYNobdNI6A1GwEuGb99Y9TlDgMU/H5N++hjHDFeajQ+JNl+NipOtI9
         qIJsXZQdJUpciJ/ffguZmZOkofQgyHmMJhgJwGzw4VNGNNTEylx+u9OjS43hiMdB91Rk
         WwT5KsetCWojd56bamCFuWxhgYC8ReQ62vKWKDmXHVskmsnmQY8CSU+bTBaoQseKCvo+
         z0jsxr/Ss1LXtbgoq03J3xaYyrYHAndpgR7ruNqMMcFSLWMsWlkpZhbRbEQ9Nvo1AUG4
         +Ouek5v+HOUzXBqEqshP1bB8J9M/evXeEL0Ixv9MOiwVQPwHFbtMomoPcwlhVLJz6REb
         sQsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3EiW8OGKdYowdNJ1Nz0r1JZ0nesmWAZtLqGJ2DFkJjFjM24+fOmCmZVMGF1VO2GFFO8k9IBBPoOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw28a6M/IymVJBlfidh/DSGLrK/TqzfQuX9xxt6tBkFottgOn6y
	g53YYxmcObHGZQsMDMGMl8b/bj6vQM+VKUfFOfAUj1yNwX9TLRyXYoHr+Kp+/jYvB0A=
X-Gm-Gg: ASbGncvw3OXxneLfC55UUisXpSPFkSahG/+9QXbFIMgBxtg35+1SvqOdThaBMS2P/6V
	t8VwJfHYaaOxV+XJpuAh9REFIy9V2S6GWt00F4MSo+m0oLO0BrdJZoYNeGB5LoU90D+KEz8cy+f
	s+nBYYQUzHQ8Hz6EgTlWXerU1VR9z47VUb5w/EJAmYhTH1hWQDANiQfunkNte/zwberl4B3Kkyt
	AiP+YeTS2aYWPkE53bsdIERBzPfP/jS1z+J8gt81WoH/QZQ0BQy32cZNi/j6+kJlBA5S2UzHLiU
	8pOvFSrg1zl3haTl4Fi4qdSNBdE0ZkSeSyHklBk/GaiwD5ag9mQlzs9H3INXJsGax5HDBTTzeBc
	XPb2FsclbDHfzM8GhJnSK
X-Google-Smtp-Source: AGHT+IHcBrXU/Fz3UA3Men54JBGMvR7rPmgEKbKc+z1Guu78ah8GEwVQySPOphDeLouhsLRO/zwPHg==
X-Received: by 2002:a05:600c:3c87:b0:442:d9f2:c6ef with SMTP id 5b1f17b1804b1-442fefd5f98mr249592835e9.2.1747896583771;
        Wed, 21 May 2025 23:49:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78b2f19sm90646175e9.32.2025.05.21.23.49.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 23:49:43 -0700 (PDT)
Message-ID: <957c479e-6233-4294-ac03-ac20b87dfacd@rivosinc.com>
Date: Thu, 22 May 2025 08:49:42 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/14] riscv: misaligned: move emulated access
 uniformity check in a function
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
 <20250515082217.433227-10-cleger@rivosinc.com> <aCu_ce-kVQsyjrh5@ghost>
 <126762fc-17ca-4e9d-94d0-3aed1ae321ff@rivosinc.com> <aCy3A6uUbnWoO9uC@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <aCy3A6uUbnWoO9uC@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 20/05/2025 19:08, Charlie Jenkins wrote:
> On Tue, May 20, 2025 at 10:19:47AM +0200, Clément Léger wrote:
>>
>>
>> On 20/05/2025 01:32, Charlie Jenkins wrote:
>>> On Thu, May 15, 2025 at 10:22:10AM +0200, Clément Léger wrote:
>>>> Split the code that check for the uniformity of misaligned accesses
>>>> performance on all cpus from check_unaligned_access_emulated_all_cpus()
>>>> to its own function which will be used for delegation check. No
>>>> functional changes intended.
>>>>
>>>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>>>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>>>> ---
>>>>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>>>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
>>>> index e551ba17f557..287ec37021c8 100644
>>>> --- a/arch/riscv/kernel/traps_misaligned.c
>>>> +++ b/arch/riscv/kernel/traps_misaligned.c
>>>> @@ -647,6 +647,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>>>>  }
>>>>  #endif
>>>>  
>>>> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>>>> +{
>>>> +	int cpu;
>>>> +
>>>> +	for_each_online_cpu(cpu)
>>>> +		if (per_cpu(misaligned_access_speed, cpu) !=
>>>
>>> misaligned_access_speed is only defined when
>>> CONFIG_RISCV_SCALAR_MISALIGNED. This function should return false when
>>> !CONFIG_RISCV_SCALAR_MISALIGNED and only use this logic otherwise.
>>
>> Hi Charlie,
>>
>> misaligned_access_speed is defined in unaligned_access_speed.c which is
>> compiled based on CONFIG_RISCV_MISALIGNED (ditto for trap_misaligned.c)
>>
>> obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
>>
>> However, the declaration for it in the header cpu-feature.h however is
>> under a CONFIG_RISCV_SCALAR_MISALIGNED ifdef. So either the declaration
>> or the definition is wrong but the ifdefery soup makes it quite
>> difficult to understand what's going on.
>>
>> I would suggest to move the DECLARE_PER_CPU under
>> CONFIG_RISCV_MISALIGNED so that it reduces ifdef in traps_misaligned as
>> well.
> 
> Here is the patch I am using locally for testing purposes, but if there
> is a way to reduce the number of ifdefs that is probably the better way to go:
> 

Hi Charlie,

I have another way to do so which indeed reduces the number of
ifdef/duplicated functions. I'll submit that.

Thanks,

Clément

> From 18f9a056d3b597934c931abdf72fb6e775ccb714 Mon Sep 17 00:00:00 2001
> From: Charlie Jenkins <charlie@rivosinc.com>
> Date: Mon, 19 May 2025 16:35:51 -0700
> Subject: [PATCH] fixup! riscv: misaligned: move emulated access uniformity
>  check in a function
> 
> ---
>  arch/riscv/kernel/traps_misaligned.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
> index f3ab84bc4632..1449c6a4ac21 100644
> --- a/arch/riscv/kernel/traps_misaligned.c
> +++ b/arch/riscv/kernel/traps_misaligned.c
> @@ -647,6 +647,10 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>  }
>  #endif
>  
> +#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
> +
> +static bool unaligned_ctl __read_mostly;
> +
>  static bool all_cpus_unaligned_scalar_access_emulated(void)
>  {
>  	int cpu;
> @@ -659,10 +663,6 @@ static bool all_cpus_unaligned_scalar_access_emulated(void)
>  	return true;
>  }
>  
> -#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
> -
> -static bool unaligned_ctl __read_mostly;
> -
>  static void check_unaligned_access_emulated(void *arg __always_unused)
>  {
>  	int cpu = smp_processor_id();
> @@ -716,6 +716,10 @@ bool unaligned_ctl_available(void)
>  	return unaligned_ctl;
>  }
>  #else
> +static bool all_cpus_unaligned_scalar_access_emulated(void)
> +{
> +	return false;
> +}
>  bool __init check_unaligned_access_emulated_all_cpus(void)
>  {
>  	return false;

