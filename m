Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15502E36F9
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752578594; cv=none; b=VmyxTCk4CfGJgvvTWEx1J6fnrsg3ICsQKAAWSY48b6KEc8cym36tnT2p3YFBC5sbr9zD1jKpbxZ7wir06B0EsAX6aNhLi3gRMjaSQeDfOh+xchLFg/hnblpn3CIcELD0ZIb0HnDq3Ev9Wr36X/b68H37+HMHhUAUfmOl4AvTMec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752578594; c=relaxed/simple;
	bh=mhNykQkifGSKuraYqLYMQoQw6/eZOe4Mg3CeEcJvqi4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHeHlsZbeoP2z6VADOa4wBE+bDyl2Y3gR0pUC704mMNdaA6Z7ILV+qZ1Fwiodv9jBG3msmNTEuXOuZ2fnHGbChxgpheO9QeE9IDqt1wqeHjrnA82/t1RLHmX/6SENeKxfOpxj+Bg1Xc8sAcR8MJyVgGPZsDw8IurfAKjWsHWAoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XqItrv8s; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XqItrv8s"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso3040969f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 04:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752578590; x=1753183390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnLmuhlpJIPCopV7crhcFtkC5B2uM5pzLBY6qzCT9Rk=;
        b=XqItrv8s1xFVoYR56a+74U/qg0R5XappgVEc1hgbxXgF3tDfoaTIE0Pg+RiWUCr+PT
         OZMUOoPPdKRgsLeV+n6pqSnYDtzIAKNjTUsD6n9Qc5DutLp0o2eqvhDBlSqDyPxISpuf
         7Sdi2RA/uGMby3PkLnihtZAy6qthHHK9YppGlK9LSYW9qxAnGdHzymT0Uyep8+443Zu3
         HkOAJZe6Q4WCueZrFzq4r3jtUQq7JC3B1rFYSg/6GUKX1ihFDkDQymLWc7RChCaCDmwe
         aZDDJONqSA47udDmJE908Gd++f1KLKxcDoJRwdb8B5aqQ9ZRZkEsEyMd2mN9VxRvmJjg
         CejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752578590; x=1753183390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnLmuhlpJIPCopV7crhcFtkC5B2uM5pzLBY6qzCT9Rk=;
        b=DMnXwSDPVH60MHlDOvmYNek5Z/0Q8V+tHg7II3FgGNkiTLPCcvylIJVYTC+cxCBmnd
         IsSCWYf8a09l/NpTd3Ta0v6qy0G9y52TIZR2kWaD+9ShQg18WnQl2UPfklSwmTAONmyb
         Hy42P/SVSa6TW34AFMXhNP0vimOmN2RzsNpD9Lvj1BIuMElGT3GwsdDaGNsXx/fJHvpz
         6hVCILJb3N7giYEPX02JIqJgPemr6hG1RxHQ8vCQfWlVEbXGIuPD5xwbAwU5tic4ne7C
         06reQ4bC8zH4NL85H4zSH3OR0v73Z82HLnYQBHHoD0m29QDEoz/QQid1TEggsUrO6nKr
         JBWg==
X-Forwarded-Encrypted: i=1; AJvYcCUIX1mUOgLMBT3YP/L0RBgkwIdzGEKQkEoHe2f5ca/l1Sh4Cq0TSW6+qWH/sBQ5WlSTZWIvfbAzKQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtMgD2YB8f8TZXkVvYt3UGyzn+rmPS4mipUJ8w+C3LukvCqMg
	0zPxqex0RNEDA5iklaG4djpTdfB3FvnmHCX8u3De4OmyCmaZWupbKN1poJ/oHdVcrD8=
X-Gm-Gg: ASbGncvJdsIM+UKphf5bNi2SJHWYagbWmbt4EYkurbuDLhUApIF2jaUroJ5sRS1NScq
	dMyS4ydg1brxAVZaOlK5imON/xE/oovL8jbaK5JiKvXLRwQE0EHS60AZTBNhdiOo0oJCnXJ3R9G
	V9+1X5oO6fuSnTkSa2E2dSgMQcZagatoZ7gpiQ777QmWfFmGR7r5rLwZ62btbU1t4/t9TlUDcba
	49SoKRxgNX5Q8VFrqVjoQGbOVw9/+GnjFYnKekqF6LW3jnJVdcMCAgzvgVrTejtD2Hlzz44ViqB
	Mo1z8yotlGiRAMCRhhzyTvgzOmaAOx85bcURlcFrl8i503Hl88ge4M6PBKm9+7+Z44FwGBPpXe6
	mBO0o2+Eene/9gKUhNRZ/x5o5i1I=
X-Google-Smtp-Source: AGHT+IFUgsfz7Ex07AYDtS4oV0I5U/VvNBB0yugLcGoxcyClcNuZz5Pm27qy30apXU2xqduwfNqc/Q==
X-Received: by 2002:adf:9dc4:0:b0:3a5:42:b17b with SMTP id ffacd0b85a97d-3b5f18b3d0emr10973282f8f.29.1752578590122;
        Tue, 15 Jul 2025 04:23:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561752340esm68968605e9.38.2025.07.15.04.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:23:09 -0700 (PDT)
Message-ID: <3578865d-a2c2-4cb6-9271-abf880403097@linaro.org>
Date: Tue, 15 Jul 2025 12:23:08 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
 <aHUFj9lH5bZwa4Z2@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUFj9lH5bZwa4Z2@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/07/2025 2:26 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:00AM +0100, James Clark wrote:
>> FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
>> remove them from the previous version's RES0 bits using
>> PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
>> unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
>> E.g:
>>
>>    E[30], bit [30]
>>    When FEAT_SPEv1p4 is _not_ implemented ...
>>
>> FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
>> switch.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   arch/arm64/include/asm/sysreg.h | 7 +++++++
>>   drivers/perf/arm_spe_pmu.c      | 5 ++++-
>>   2 files changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
>> index f1bb0d10c39a..880090df3efc 100644
>> --- a/arch/arm64/include/asm/sysreg.h
>> +++ b/arch/arm64/include/asm/sysreg.h
>> @@ -358,6 +358,13 @@
>>   	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
>>   #define PMSEVFR_EL1_RES0_V1P2	\
>>   	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
>> +#define PMSEVFR_EL1_RES0_V1P4_EXCL \
>> +	(BIT_ULL(2) | BIT_ULL(4) | GENMASK_ULL(10, 8) | GENMASK_ULL(23, 19))
>> +#define PMSEVFR_EL1_RES0_V1P4_INCL \
>> +	(GENMASK_ULL(31, 26))
>> +#define PMSEVFR_EL1_RES0_V1P4	\
>> +	(PMSEVFR_EL1_RES0_V1P4_INCL | \
>> +	(PMSEVFR_EL1_RES0_V1P2 & ~PMSEVFR_EL1_RES0_V1P4_EXCL))
>>   
>>   /* Buffer error reporting */
>>   #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 3efed8839a4e..d9f6d229dce8 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -701,9 +701,12 @@ static u64 arm_spe_pmsevfr_res0(u16 pmsver)
>>   	case ID_AA64DFR0_EL1_PMSVer_V1P1:
>>   		return PMSEVFR_EL1_RES0_V1P1;
>>   	case ID_AA64DFR0_EL1_PMSVer_V1P2:
>> +	case ID_AA64DFR0_EL1_PMSVer_V1P3:
>> +		return PMSEVFR_EL1_RES0_V1P2;
>> +	case ID_AA64DFR0_EL1_PMSVer_V1P4:
>>   	/* Return the highest version we support in default */
>>   	default:
>> -		return PMSEVFR_EL1_RES0_V1P2;
>> +		return PMSEVFR_EL1_RES0_V1P4;
> 
> See my reply [1] to Leo about this function, but I think we should just
> remove it.
> 
> Will
> 
> [1] https://lore.kernel.org/all/20250707-arm_spe_support_hitm_overhead_v1_public-v3-0-33ea82da3280@arm.com/

We're only refusing filters that we know for sure are RES0. Unless 
there's a mistake, the ones that are maybes are still up to userspace to 
decide whether it wants to use them or not.

I think it could be quite useful for some automated tool to fall back to 
another behavior if it needs an event that isn't implemented.

If they were _all_ defined as maybes like "When FEAT_SPEv1p4 is 
implemented or filtering on event 2 is optionally supported" then I 
would agree it's not definite enough to bother restricting them. But a 
lot of them are known for sure like "When FEAT_SPEv1p4 is not 
implemented ...", so I don't see the harm in preventing use of those.

Or as I mentioned in the other thread if we think we can probe the valid 
filters that would be even better.

Thanks
James

