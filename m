Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A056823816F
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498108; cv=none; b=k+hS3aJoFkODxdWXwllY9QxqwbvbF1BEWpShwWrALMe6octXE7QtjjblKHISRMO6xBQ7/YKZ/Kv0JbxHX9I9Vp35x8FG2LkmwYaGaNHK90zPSIWo0urxd7xyvNqjxYargC+YL2qZQPmTqNyVqo6Vy+ZoBtAxElEx22QxPRDQmGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498108; c=relaxed/simple;
	bh=6IMg657M64uQmwN+jh4utQmYgOvUnVhFe0GlDIgoHdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrGqdXLWhd3guJL2nbg/rYX6Np49r2F3yIMNyTXJ2SX4nqJ/lmaqu6BpAxB6thhSmjLkrMP9bujgO0pYj8C2lNFWZS4Rr7X/OhIzdv/QcjphZ1AYOfNQ+r2mR5kkkSDOowi6phr8ZJXT0ljfk0qYhdXkP1i5MTATTFz56UZTcWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CV874tSA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CV874tSA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so9163015e9.1
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745498104; x=1746102904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RNMAR2ow2m6nJc7QSxTl3I9Uc8Pm3w7ZW7eElxL9kzk=;
        b=CV874tSAThAe0Q8AGgsz2fCdMzfBqAqSPPVo0p2ZDGgV9llwVZRTwQps3gvfaXQTDa
         kkUuO2b/cfBdZ2UoxdeRsx5vA1PyNrAX8WvPfAE3YOz3YfWySMV5t4YevWxIVYEXMfUN
         CfH/MouZGAT74/G5lcdL1+VGu2GvVlJvH/JwC+OKyEKp37sfB8VAVMKPwZOwuIvB78DM
         qJanJ5YVKw7c2cGpV7GNSvWewii2CXwDPnX1A0xK8q9x48oMv1xquqgg4fLb52wxgku/
         /YvT86ItqK+X3EsyL5Q+hH3zGz6aiddUPQhxvXKaUjXlgGsbvN8fmhzCn4vPY7JmfYBX
         mjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498104; x=1746102904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNMAR2ow2m6nJc7QSxTl3I9Uc8Pm3w7ZW7eElxL9kzk=;
        b=rXj9pXtQf6wqpta0lb2EEW5ZCohpmxbU8fY6LGvdRVcL+bbGbLpVALzkujrx6Rq9lJ
         TdK0+2ksgfH6WcjVApVCwT9CVXoGxj/pbxf73k+G+/HBPZvJqLSuYoAcg892lWBIjIHr
         E8Gg/57c4UosOd8VSnet88VY6AyHclP+kiiP+A904pzTeB+CvVdLZa0c301BZoAB/M1W
         VREvtHdPpwlrkpS8E7qTR9OIlH4xQ3b5Qj8rjujkHHZpLqM7ox1cGh3H9wd59MUb0lNp
         EKtW23pm/3KtVpaw2zoDs0JY3ypRfc6DYjrQ8nRWTqPVWU3/yePPMib0AXb8+aT+UZ+s
         4IWw==
X-Forwarded-Encrypted: i=1; AJvYcCWqnW9Gk6aPPLtE2zh+fJumsIZvV6grNsTE0fQZ5OyAziN4bChV4KwsHAO9OKBLEWgCRJZ5tGmHBoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytCUDHckN9xdXA1M3RdZopOhmL1vW4a5rCc89Q7+0jLBicizJn
	Rw0KmQNjqHThW7zZjWq4aQkpxyEZub7CdTttHyBX7KpwsEsE3AHd9bpjS4u/pCk=
X-Gm-Gg: ASbGncuiVSHttCAvL00QB1L7WEzNxDCkzFBKLwPdCHTSz/xvxS3kfFYXMPg62A0/buW
	TA39LhwLJyMgl+/gyiaIavnn/e5Nbo3e8fpD1Dnsq3Xs4cf2QXTp/7o6Fehh5KeZCbdfLPt9W0S
	kqHjnCzw3IfmZPxqUB+pXO/aU3Zqq7S54oMe6/AVqunZNXSUwGfkNJoA6kEQyIrPYQh3QW0eOIR
	x+y79rfXO5bty/HjW65T4awepEX+KVML9bMJSZmvwj/0Gt4YiymJ3HDAHewve87R4L26wL69d/k
	xCVZnqAfG6Ru8ZOVEzJ06sqDVkENuUQDyB+Oz3i4d6unQGEfDXUIAvq3WkNqlw2yZ8Lg9xnH7vS
	yAIL/JAYRQg==
X-Google-Smtp-Source: AGHT+IGVtiMSUESCXxVr8lAA6TW/b8o7vs1YUH21uoFbmNmUInqOubAKtgP45r/urKl+RsY3D8dRJg==
X-Received: by 2002:a05:600c:1c8d:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-4409bd1f46cmr23664385e9.17.1745498103920;
        Thu, 24 Apr 2025 05:35:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2e59sm19303745e9.16.2025.04.24.05.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 05:35:03 -0700 (PDT)
Message-ID: <f6c5c92d-73aa-41a7-99bb-f95e388ea294@rivosinc.com>
Date: Thu, 24 Apr 2025 14:35:02 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-5-cleger@rivosinc.com>
 <20250424-c0700f89bcd29438d6d8d65c@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250424-c0700f89bcd29438d6d8d65c@orel>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/04/2025 13:06, Andrew Jones wrote:
> On Thu, Apr 17, 2025 at 02:19:51PM +0200, Clément Léger wrote:
>> Add FWFT extension calls. This will be ratified in SBI V3.0 hence, it is
>> provided as a separate commit that can be left out if needed.
>>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  arch/riscv/kernel/sbi.c | 20 +++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
>> index 379981c2bb21..7b062189b184 100644
>> --- a/arch/riscv/kernel/sbi.c
>> +++ b/arch/riscv/kernel/sbi.c
>> @@ -299,6 +299,8 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>>  	return 0;
>>  }
>>  
>> +static bool sbi_fwft_supported;
> 
> At some point we may want an SBI extension bitmap, but this is only the
> second SBI extension supported boolean that I'm aware of, so I guess we're
> still OK for now.

That seems reasonable to have a bitmap rather than duplicating
*ext*_supported. If that's something that bothers you, I can take care
of it and use a bitmap. SSE will also have a sse_supported boolean but
in it's own driver file though.

> 
>> +
>>  /**
>>   * sbi_fwft_set() - Set a feature on the local hart
>>   * @feature: The feature ID to be set
>> @@ -309,7 +311,15 @@ static int __sbi_rfence_v02(int fid, const struct cpumask *cpu_mask,
>>   */
>>  int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags)
>>  {
>> -	return -EOPNOTSUPP;
>> +	struct sbiret ret;
>> +
>> +	if (!sbi_fwft_supported)
>> +		return -EOPNOTSUPP;
>> +
>> +	ret = sbi_ecall(SBI_EXT_FWFT, SBI_EXT_FWFT_SET,
>> +			feature, value, flags, 0, 0, 0);
>> +
>> +	return sbi_err_map_linux_errno(ret.error);
>>  }
>>  
>>  struct fwft_set_req {
>> @@ -348,6 +358,9 @@ int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
>>  		.error = ATOMIC_INIT(0),
>>  	};
>>  
>> +	if (!sbi_fwft_supported)
>> +		return -EOPNOTSUPP;
>> +
>>  	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
>>  		return -EINVAL;
>>  
>> @@ -679,6 +692,11 @@ void __init sbi_init(void)
>>  			pr_info("SBI DBCN extension detected\n");
>>  			sbi_debug_console_available = true;
>>  		}
>> +		if ((sbi_spec_version >= sbi_mk_version(3, 0)) &&
>> +		    (sbi_probe_extension(SBI_EXT_FWFT) > 0)) {
> 
> Unnecessary (), but I see it's consistent with the expressions above.

I can fix the other ones as well in another commit.

> 
>> +			pr_info("SBI FWFT extension detected\n");
>> +			sbi_fwft_supported = true;
>> +		}
>>  	} else {
>>  		__sbi_set_timer = __sbi_set_timer_v01;
>>  		__sbi_send_ipi	= __sbi_send_ipi_v01;
>> -- 
>> 2.49.0
>>

Thanks,

Clément

> 
> Besides the () nit
> 
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

