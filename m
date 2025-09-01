Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C77026D4C1
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729366; cv=none; b=nLEcZoUWkXSvFD7Rq3CTpIQ7CRKuR8JqrP+8lXo5Y85wnhZpWotSWi+ARYQhW6UMj7bCsr+DOEgowbiME30dp04oBBNbMkHF4/V4JuGYfzO9EJrOzGSC8lekIbYHepHBJWKeXYZsOgKvHywS98kPF1IR67COOX8n1Ru+8JlrdoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729366; c=relaxed/simple;
	bh=VxC6+65N7fwjuQSBZWaB2FdQLsbh1mR1wNFbx5IdIN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmMk8U8ve9YCAlv/FaqIOjUEI2v3XLKng/hKK8cM2xODx76GG1pxKSz6qL2mk5sL92mzcvAph5fXrLpJLoPxHSFImphwN5ZqhIIPGqQ2O2St9Pfm9HhRxgIy7VCy1x+M/+DSIDWgF467awoOCXl9KW6SGYoGzr1Kuq/CQ7rkzZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkZhwX4f; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkZhwX4f"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b7d485173so26302615e9.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756729363; x=1757334163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LoSJIL4KWhDGVADj7RHQlobVtqqX19ExJc3z0hs3VMY=;
        b=gkZhwX4f67XZycM8iNmC/aDa18Yx6W5g5tRRPmFMIS480yTP8VgwFHAgPC+XgaAuYI
         mdFg7nR6Z9QX/1KdLf1cmIlalyJe0NliyufIUCFH2egk43pZLeKvRVZ7hW0wwiURV0NN
         RbtQwnHcIGIdJgNHsHY60/I2OYZygHuoZ29Ph3UtWFM3tsv/PvcSBSt0enlyBUPElGMk
         7a/lpBQH4uYoc2auMEMm9Vud2MBI1pcijg2TLU2JZ1tuZMqwt5TnakgjwCSylNyCp10i
         129dWclu3yVpIdnDV/vrGuo2QQdvLTmaRBqNSJYBrChp8/YbDP4d0ySR2oDYhF0Lwiiu
         HzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756729363; x=1757334163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LoSJIL4KWhDGVADj7RHQlobVtqqX19ExJc3z0hs3VMY=;
        b=O8cVtSpyJgHVTfXkiOU0HKECr+dyHmDplFtIO6ECsOsqpskBMnYCiz011JYBx2aU2l
         WqFXqrOBMOjtXZZLTSyufNDCq7OH/V10ZR/wQF/BomvszxsWNyuXjZvWVXT1IC4zFMA2
         LsRTeAUjihI1o8AfdUL8ahni8aEnRVGqZIGdsqQhG+3ilh+k7x6sjoqNiOE8wv+47IJY
         EPK6LvaC0TUv/rAITjHP/m+6ho1PpkhJP3TTDub0oBR4Ii8T/qHmwRTif73GEmeDlXKP
         Q0822lqxm9Zmqq3n/VafzBhXYhHsTr//5/oSGFtASsbkBEgpeihse9PFuBVt2GP/a64J
         /Rsg==
X-Forwarded-Encrypted: i=1; AJvYcCWRLNh4N6NHYP6gS8XUqP/R2UpTYAiCmV3mnoUvF1bi26saRAg48BjIMP4hmy8E1ztuItmbaa5+Njo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1AGhsABFIqK3IcSdc5mvwiQpjxuumahPpmQ+hB/c7+o6PRw3/
	voa1Ezzssptk2V3DI/dlZ6E5VrVr92cir9VgQQyRtsWp1oIggh1XNxRjQ2fnbSkHTm8=
X-Gm-Gg: ASbGncv5umjaRYmqDDGlwIiH7mDMHeno29OQK7qHPmudJV3zG6oQI+bqHvh2fljnGQN
	VMY/OcMbJIFeeGBRdL+k2aTd5sWFGkvEdYAytbnmTXIay3gAmA0EgqPzT715KieTrmtaA/04dfC
	NKQJpnCPk49bR8fNQA947ydK9zSQ2fycP9152AuxH4/phUZ+jABamIIziKoHs6RSGUvQnpVhE9i
	Ngxo4CkhNuHVt9zJDDa/N0ZRhm+FqYyWpvvNToXVdVamAhOSbvqoNitn0nIK7EWOk3HJtGxCGG5
	41UZVpWn5mNhrq0bNn1vGuF/da7epf/IvMjCjoLEfjpGGBRLc4HUqLq1hRN8jmVHcu/jxGxuGZE
	H3r4SFYTsK+n7wSSUkfCnYHuGUBKa3GZlqo5s5vahSa1Ha8AS
X-Google-Smtp-Source: AGHT+IEUYIop2eCnZ9cDKO0ghaVfpBEoRkqiBiGK9LUPFsTbQpLi8gzA5x26B8+fFer989zfNL4Sag==
X-Received: by 2002:a05:600c:4f41:b0:45b:8b3e:9f7c with SMTP id 5b1f17b1804b1-45b8b3ea0e1mr33370165e9.19.1756729362553;
        Mon, 01 Sep 2025 05:22:42 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87abc740sm88325035e9.7.2025.09.01.05.22.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 05:22:42 -0700 (PDT)
Message-ID: <e759f728-2a77-42a7-ba92-0d5f8afe2273@linaro.org>
Date: Mon, 1 Sep 2025 13:22:40 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/12] arm64/boot: Factor out a macro to check SPE
 version
To: Leo Yan <leo.yan@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
 <20250814-james-perf-feat_spe_eft-v7-5-6a743f7fa259@linaro.org>
 <20250901100558.GJ745921@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250901100558.GJ745921@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/09/2025 11:05 am, Leo Yan wrote:
> On Thu, Aug 14, 2025 at 10:25:27AM +0100, James Clark wrote:
>> We check the version of SPE twice, and we'll add one more check in the
>> next commit so factor out a macro to do this. Change the #3 magic number
>> to the actual SPE version define (V1p2) to make it more readable.
>>
>> No functional changes intended.
>>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
>> index 46033027510c..3a4ca7f9acfb 100644
>> --- a/arch/arm64/include/asm/el2_setup.h
>> +++ b/arch/arm64/include/asm/el2_setup.h
>> @@ -103,8 +103,7 @@
>>   	csel	x2, xzr, x0, eq			// all PMU counters from EL1
>>   
>>   	/* Statistical profiling */
>> -	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> -	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
>> +	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
>>   
>>   	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
>>   	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
>> @@ -255,6 +254,14 @@
>>   .Lskip_brbe_\@:
>>   .endm
>>   
>> +/* Branch to skip_label if SPE version is less than given version */
>> +.macro __spe_vers_imp skip_label, version, tmp
>> +    mrs    \tmp, id_aa64dfr0_el1
>> +    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> +    cmp    \tmp, \version
>> +    b.lt   \skip_label
>> +.endm
>> +
> 
> Just wondering if we need to move the macro to the beginning of the
> file, so that we can define it first and call it afterwards.
> 
> Otherwise, LGTM:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> 

It's not required, but all the other macros are defined before use and 
it looks a bit weird to not do it, so I can move it.

>>   /* Disable any fine grained traps */
>>   .macro __init_el2_fgt
>>   	mrs	x1, id_aa64mmfr0_el1
>> @@ -263,10 +270,8 @@
>>   
>>   	mov	x0, xzr
>>   	mov	x2, xzr
>> -	mrs	x1, id_aa64dfr0_el1
>> -	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
>> -	cmp	x1, #3
>> -	b.lt	.Lskip_spe_fgt_\@
>> +	/* If SPEv1p2 is implemented, */
>> +	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
>>   	/* Disable PMSNEVFR_EL1 read and write traps */
>>   	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
>>   	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK
>>
>> -- 
>> 2.34.1
>>

