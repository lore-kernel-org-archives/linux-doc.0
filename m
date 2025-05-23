Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F340E1A83E8
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 19:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748028125; cv=none; b=h9ZImKL/DPqlh/JJtkUQmjwF3zGxCPXxiRZDdxU9OAXuQa/L1DJxiy3c847bSSehzizhIxZ8xFIHG7l0SqQNffcPvVBNuSvZUrofc/VTQOrbj/i26VAL2pTWpQTF2LuzCTb3WpIL6C8xPpXQm2luGLKMnwL600puf3W5gp1Qmb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748028125; c=relaxed/simple;
	bh=QTgsq+8ZSYotM2YZLiiLRhq0j7JWuLmmzU6tbY7ZKFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=am8xBvZIq4yIgoCPyc2N3nCDmkQIXNI7rOxSdr2gW8ve+Jfs+3rWUM22iqeeU0SWaopCqkPe0ayzoW4DqrJ5+4ZwMSvUpZ7pdlvna0STg4oJ3YIMeQI1Mr9IDB7lpDINqy2JKUnXdPlgCkgOjNTyb14fYA2y7ZXd8GkIHLg+/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cE8JETa/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cE8JETa/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7399838db7fso294373b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 12:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748028123; x=1748632923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ral+N2d0KfCW37vBolJovFgnCe0tWP7reKx7tiu0DfE=;
        b=cE8JETa/oOGBqW0x9SvgpyUmskZh1q7/pZkOozdng89F5CqAU0gpMM0ZIsko11MFDl
         GQpX5f+z47jJllsE22FaQmoulPgEwqrRvHkQxNrVuS8huyrmowpv2S11zk6KsRpRJoTh
         215wcU0Uyz8CrsJM1grlvO/scEM2W0FJN6YQplJX9nawK2FzH9otqaLmpRM414sOWQLR
         x+CI+QxQokpK8VEE5RPpWLDm/cQv/5uqDPP/zzGu5mXZWeKr+hOv82A29IvQO0L0uFd1
         SwD7ANJ8U+3xzyU7m+dYS9ZBkCDCDhcfeI6WGwgvScLyMFs930ERMPwSErxqOwFK9FS1
         +LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748028123; x=1748632923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ral+N2d0KfCW37vBolJovFgnCe0tWP7reKx7tiu0DfE=;
        b=pAlnH8s/4srBzqfHXXbuBqNAZbj03ElCaNeyGJrR9+eyUf77KC3yoeG3LAKe6AL9mN
         WAUThslMkj+IwmpcuZuuIlqGoyc70XY1IZy0KObZS7cLN48RlIE36Be8ZB5MpKEi6Q5H
         MAyRfout8vBnlnBkdovotboiqp22L3Gy1MSZQcpmFbcn5bneL9uuDawlC5ynZSmz9jOz
         dcz5jJN6thbfx/7W34WIGVkgQvrmsWtWnPd1Vb3912+pWjypij1ziTvALL0U3N5S2uOn
         I6a4VomQIn+2JHNlcLOf7Hu6e6huE+Ixeu/CqJ/p6hmqb5hFwgUbY5DH1qj5rnc35cXN
         3cFA==
X-Forwarded-Encrypted: i=1; AJvYcCWf+fcprpKzmAd9/yfCJWU40pNUfS9TrFV6FpMDyhEahJkUjsYkKh0CgUoEu952hvlio6gJ3/MW/NY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgX12C7FndCzQnmKBDl90IFVzaPfzqv4ZTkDTo3LKc87nMCVWx
	WIx3S/QRlffEwK2ek8wAGqUL0uEz4aQyxqdomoZZ4HpC9nO7akvf9hzD6SRhDvNR9kk=
X-Gm-Gg: ASbGncsdF+kXFlTDwB3x5Q4XVaorLMI56YxOpSTHSO6C5Wtb5Ieoc//sM7bJzcGzCZM
	SUX+NOuyrF1xVcn6HPkhFsKPfa90RX+QRRPbra2kbi234AhLOIyRlaJSEhTa9h15nxBgcQvpPvb
	RHde2gff0cB5isVaWGPh/J8WEPvLKgGdqrvTHAvmUDEk7b/8ypay8XCfTATakk7JIDtFg6qwE6p
	rcbUTB1jxN90jsz1pKFotuV09HcJ+DR8VIm5sOORCspi28RgJaBLcUamfVHP65dRZ1Crmd5JGYv
	Kuzo2Rj27bESFZZva4aLKrSji9F4GmtLkv1jKq3q+pLd6JpfvsOLyTdMhBNXTNLNirMOJRCeIkm
	yqbJF8B6ctZ4/5PzpqawU
X-Google-Smtp-Source: AGHT+IFZ/6OL3e/+nBzCYIYloiMUYM//2VK/chpXTyoMI+nuh1v5hqPREUkHkrHrx1lhvJEatv4h8w==
X-Received: by 2002:a05:6a00:391e:b0:742:ae7e:7da1 with SMTP id d2e1a72fcca58-745fdb50dfamr1094649b3a.0.1748028123175;
        Fri, 23 May 2025 12:22:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98770cdsm13178352b3a.151.2025.05.23.12.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 12:22:02 -0700 (PDT)
Message-ID: <b2afb9c7-a3d2-4bf6-bfaa-d804358ccd88@rivosinc.com>
Date: Fri, 23 May 2025 21:21:51 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 09/14] riscv: misaligned: move emulated access
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
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <20250523101932.1594077-10-cleger@rivosinc.com> <aDC-0qe5STR7ow4m@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <aDC-0qe5STR7ow4m@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/05/2025 20:30, Charlie Jenkins wrote:
> On Fri, May 23, 2025 at 12:19:26PM +0200, Clément Léger wrote:
>> Split the code that check for the uniformity of misaligned accesses
>> performance on all cpus from check_unaligned_access_emulated_all_cpus()
>> to its own function which will be used for delegation check. No
>> functional changes intended.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>> ---
>>  arch/riscv/kernel/traps_misaligned.c | 20 ++++++++++++++------
>>  1 file changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
>> index f1b2af515592..7ecaa8103fe7 100644
>> --- a/arch/riscv/kernel/traps_misaligned.c
>> +++ b/arch/riscv/kernel/traps_misaligned.c
>> @@ -645,6 +645,18 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
>>  }
>>  #endif
>>  
>> +static bool all_cpus_unaligned_scalar_access_emulated(void)
>> +{
>> +	int cpu;
>> +
>> +	for_each_online_cpu(cpu)
>> +		if (per_cpu(misaligned_access_speed, cpu) !=
>> +		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
>> +			return false;
>> +
>> +	return true;
>> +}
> 
> This ends up wasting time when !CONFIG_RISCV_SCALAR_MISALIGNED since it
> will always return false in that case. Maybe there is a way to simplify
> the ifdefs and still have performant code, but I don't think this is a
> big enough problem to prevent this patch from merging.

Yeah I though of that as well but the amount of call to this function is
probably well below 10 times so I guess it does not really matters in
that case to justify yet another ifdef ?

> 
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>

Thanks,

Clément

> 
>> +
>>  #ifdef CONFIG_RISCV_SCALAR_MISALIGNED
>>  
>>  static bool unaligned_ctl __read_mostly;
>> @@ -683,8 +695,6 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
>>  
>>  bool __init check_unaligned_access_emulated_all_cpus(void)
>>  {
>> -	int cpu;
>> -
>>  	/*
>>  	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
>>  	 * accesses emulated since tasks requesting such control can run on any
>> @@ -692,10 +702,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
>>  	 */
>>  	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
>>  
>> -	for_each_online_cpu(cpu)
>> -		if (per_cpu(misaligned_access_speed, cpu)
>> -		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
>> -			return false;
>> +	if (!all_cpus_unaligned_scalar_access_emulated())
>> +		return false;
>>  
>>  	unaligned_ctl = true;
>>  	return true;
>> -- 
>> 2.49.0
>>

