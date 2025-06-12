Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D67222596
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717765; cv=none; b=cxJWkrwXYmyikxVjmyjHo6+7WwW6hh5wKM7afEWna7wWR9nWu/QqovuFx54exTb8j6gEOKcHB05oDDxKY9QoJ+GFiuBI6kSu/0RVFOMG0e/wPx9fsAQrUB8zIR8RdWGiwkgUsjEhwLnEgaNS6aduGQgzXz32q8RT1fI0TOA+8rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717765; c=relaxed/simple;
	bh=w6yjx7Dori93CG6sK3ncvH9uiqhy4vTnBe+XPdGSOr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YjgRzsgpH6IoZEj+QNxKJofK2mnZFTopdkdytIIAThNclJ+YAI+D1UQ200v0C+m7DBsj/IMTlDpK2Axl/4yoJNSlg1SLfIU2+uGskwQwD/zn0OZUTjKpSmjFhsDCtp6RZRo8HB4GJS1olg8OWqo9oPDdd15MFdtM77/Wyknszrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cpN4mtGF; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cpN4mtGF"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a35c894313so636927f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749717761; x=1750322561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MXXMkVVqt6xR4uvFmH/ZMvt5aZcIpXe/yS2Xx6mdmS8=;
        b=cpN4mtGFRx1ek/qTNgd3FCmxK0uh+GArTjwAW4G2LSbdj5+J2QTAzBMLPasQ9TiqKV
         lmlIGcFroefYleU+a70Q+0DCisih3OS0cMYnaofZw+wOIm0DXZhQrZqaNWReaS3jqDoX
         7qN2sXWDUw5ZrpF3B7qKAHXtpTgAvWd7/Szr/TRYrVKlOe/C+HEyTrG1MlGq02cIcSQ7
         9d3QEM2YdlMrHsJOtFKpN1/gxABsH6Qkwz4BYRndeRbDQ5zNrdm85Us4dpw+ysOk8esi
         VkHMCVS9EnCjbWYlBp6X87hK0n/nPAZ/revSBp3WPePz/FYvS1mDV3XHp95MmFC0FjOE
         uhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717761; x=1750322561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXXMkVVqt6xR4uvFmH/ZMvt5aZcIpXe/yS2Xx6mdmS8=;
        b=NvgzGirjCzoxkB1sID9tC4HgLcqyVST4vtIEH0d0D6r+Gu6/ddMMauopVvj8orB92F
         4rcVLiRiuzgblZv5+pAxNJ89LPOWqBdTwD/LeJkb72J44i7zJZgn+gGvQvtyzEpZ2NQ8
         0se9at/IGSEUQqJMadtCJ2i7uRhRpJtsMQYToNFTWGDdyQ0t86W6lwvXkvB5DNt7S3ZK
         lfRXmNQGlkxDxLWXqZ/ZkJH6w+3SCWdExdEeHWhn9jyI6Yaawjv0OHbyJXgG/wFd7MqR
         F7eVqBDCvz3+zSxUn2RTDuIySlCj4pVTvQT2BYNLsYECZrpkQVOYMMHSAIXMOp+KtRYk
         uyBw==
X-Forwarded-Encrypted: i=1; AJvYcCUhpmyed91sNV3LZByjjPJY4wI4+YWi2DBYFx4gRpXRi2HOsPMP/fv1IQLXlfOWMYVJPVbZ+W4LOAc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3Wjq2QsTs9fdEgK6PUCrjNAkZJafsFgQWPcaauIaE6aQHx1S
	lihvCCPvxIPFoYOnZXl4FZIYmOlytLeIPU/plS92D5LljfRDS42sM6/Lo4FL0XVGDgo=
X-Gm-Gg: ASbGncvnsfUIqhIP8Cmt/JX4kgIFk+nZvc9Dg9OxPZRCuA0tCTTehPfL8IYw11mizmQ
	BBBKa2BrA/lCX6JT+y6aP1v5/HDuFR/xaq5tRDwV0ujcE2sL+fiBbWk5QwtqpADnINVMO+YsExd
	EHwDp5E76vdJ0c+7HPKZP7tyXPg2S2/q+BLFh96F4wJF2gXz8/1qFRNjfsnI868LgrPZZd2XOGn
	2Lj7eJbNX62NPb4hgG2/wev55CRKb0mrSBQVOdWLOamNHmLluge9F6tDux1FfPQOOPa/lrRiwHF
	rHAfb7IT0+xJEV7EbPu0e1jG5tKdYXwyjBZGejys8Gj6ONGyD49KhhtZqMO7bQuRXoQ=
X-Google-Smtp-Source: AGHT+IHRFPEqNYv7rElVTsM+/O2Bep9AczSNG7lUyxK1KtND+mFBsYtU9egUwJboJsW4Mk1sSOYf4w==
X-Received: by 2002:a05:6000:2411:b0:3a5:2fb2:35ac with SMTP id ffacd0b85a97d-3a5612946a2mr1683069f8f.24.1749717761081;
        Thu, 12 Jun 2025 01:42:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5619ab86dsm1296971f8f.44.2025.06.12.01.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 01:42:40 -0700 (PDT)
Message-ID: <7b080e97-375d-4521-b167-d0c4256dc464@linaro.org>
Date: Thu, 12 Jun 2025 09:42:39 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] perf: arm_spe: Support FEAT_SPEv1p4 filters
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
 <20250605-james-perf-feat_spe_eft-v3-2-71b0c9f98093@linaro.org>
 <10f63976-afa7-4e1c-bec1-d9f2447d9c13@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <10f63976-afa7-4e1c-bec1-d9f2447d9c13@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 8:35 am, Anshuman Khandual wrote:
> On 05/06/25 4:19 PM, James Clark wrote:
>> FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits, so
>> remove them from the previous version's RES0 bits using
>> PMSEVFR_EL1_RES0_V1P4_EXCL. It also makes some previously available bits
>> unavailable again, so add those back using PMSEVFR_EL1_RES0_V1P4_INCL.
> 
> Just wondering - why cannot all the new applicable filter bits be added
> explicitly for PMSEVFR_EL1_RES0_V1P4 without using exclude and include
> intermediaries.
> 

They could but there would be a lot of duplication. Each version tended 
to add only a few bits to the previous version. Also for consistency, 
they were already defined in this way. I didn't think there was much to 
gain by redefining the whole bitset just for this one, it's probably 
going to look just as messy.

>> E.g:
>>
>>    E[30], bit [30]
>>    When FEAT_SPEv1p4 is _not_ implemented ...
>>
>> FEAT_SPE_V1P3 has the same filters as V1P2 so explicitly add it to the
>> switch.
> A small nit - should FEAT_SPE_V1P3 addition be done in a previous patch
> as it is an already existing thing ?
> 

It's related to this patch because I change the default case. Before 
V1P3 hits 'default:' and returns PMSEVFR_EL1_RES0_V1P2. But now the 
highest supported is PMSEVFR_EL1_RES0_V1P4 for the default case so I 
need to add a case for V1P3 to keep it returning PMSEVFR_EL1_RES0_V1P2 
filters. There's no bug.

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
>> +	(GENMASK_ULL(31, 26))> +#define PMSEVFR_EL1_RES0_V1P4	\
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
>>   	}
>>   }
>>   
>>
> 
> 
> 
> 

