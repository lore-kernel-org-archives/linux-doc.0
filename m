Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26D2DCC08
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752583147; cv=none; b=n9FJRvrcJVwLCMMCPbkDRpSHxe+z4KzVXqzhWQHooSOfMwNW5oZ0IkjQ0/g/RcsVmJH11SN0D+WhvDD08k7WmnZ3oznMwO3z2cKfU/B9kNwBapR/LZyrf/EzzFJjwcAPE6O2owu0X9BHTjc7vCmSokdOBMtViodw62d5jXtO1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752583147; c=relaxed/simple;
	bh=MjbZdNkanM8+qBW3pTVyd7JkWPnj7tXiIZ37TavIk6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odHzGuvhRaroYRXQ0/MRyXBLYm0+3wkMORsqPyV/fjhiWYBrSyyI0avQ8ks79ze27bFuyZ7uW9LXKlDKkbobAknJwEAlbcZXDmSlA9Y8bSYPujSKG5IS5fGnAFvrrt2Hz2elMEt1UHw7na08DuBGjkhDGnDCRYoz7uDMPfKhKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jT+7/6mZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jT+7/6mZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45600581226so33748545e9.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752583144; x=1753187944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BxsrGe+jWlI7ei+mJSfCZ9EexVILMiT2YG/yR5weNV8=;
        b=jT+7/6mZxgy3PhYuGW4n9xYZsnISG2ZkbmS1zrLmTZ+Xoj5rVgaIXA4SDmkKXWeot/
         Sqo7ZPCvyzghpRmHv7txVYxudHXndblIclgYCzECkzu/dO9YfctvcHOmT4hmVBlwfahH
         Ka84TyLoHK5bZxa0DZz1nLLcD0HRDSmON9ldFHUnYiKx0xll1LJiELdymwUdw85P6YOf
         iyyNsMNv7kVkvST/ox2E3KnyxBm1mW18yXGhkY4YcY2WwNZzJaoDReQ62IGpJXheobiI
         3KzxYvAzNzqPpBtM4aVaky0NAkKuKawhOPTwuQUNYUxNqiXqOgRJ/nNd2XT0gEIh3Zja
         JW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752583144; x=1753187944;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BxsrGe+jWlI7ei+mJSfCZ9EexVILMiT2YG/yR5weNV8=;
        b=wsJfuZfkNPMqT1LHpAJ0hblzLvTQzFVuUEAVwFw2JMEh6y6YzKz5ruy+9HPmx3S5IW
         CvTdjKm0nvY3owwMWhCrRTFTCKTC4D9UsyphicelLiO1fVVvrganHL8lhHalJug6ZWBG
         Fg0d7VfuJ5Rs7pRV88lGcpsnVTT+6v07AeOtHBfaS00fckfvztOnDQJoAERUTdgYLWGD
         YYc8nkjdKFg5fT/1OP/7tO3yi1uww0O3o7guBKQk/Y41MFLRFmJSUhwkVW6ivbCpN/sh
         VIpx7x4xDmbqd5ntH6WXBtYpv/+uUT26VokpQt+jdCyHlQEUgf07ebkUvdAFUnXtpYnq
         B//g==
X-Forwarded-Encrypted: i=1; AJvYcCXJjkokYL5bxT/+7baohj/hm3TbtJuTBF1rWirXMQyuGZDLb2pNBFCmJtk54TDRK60e2hz4YEO469M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lnXP7qETQwg/vSuqcTaQNv6KwU3uIKkhRLtYJLUFyjncwcrs
	EAb1swZdSWSApXjO/ogU3euM8uwwhf4NUkDvT2OwD9k6ZIBkE2LaXFkLDmkWbCdyy9U=
X-Gm-Gg: ASbGnctq7FNUanQwv7yxUI+3Gh4MV+Pio7F1bkz7BV0ZCTNbJ8QBTMJvNnmMv+RDI7t
	XBLsw9mJChdB0hCQ2RQf5AK+f2KfGAnEUSLm7paoKlrEvvj9iatk/5FW90REoxKDf71ECAg2BFF
	lBUKIzUXcdK9jgnfZu+gfu8yosdU77kX3pYbxWOgSlEp6RUU0eyYz4Pfzptu/lNgAcHbyVrlxj8
	tElkk5fpyVOHjoK7kd3Z+MEa8mTbcE7Hq9LHA9G0w5wPGhMF3WNhCjOEtm+IhoNZHvmNDMuEoGZ
	HFmapK0G5uDkCiHloEfHH9t7l6Kcm3bftpOCqc/VpSA/CseEc6gQCA1p//BW/BEXKjxJRyTj7RK
	ai21XB+hS52uKHPkWfIxcM+g7p6o=
X-Google-Smtp-Source: AGHT+IFZyO/97ZoKUOVFH8OyN68wvADyUqzMBItZPtLXzxAkrQ4eexLf8b74z76VvOxoD7DUY+oEPA==
X-Received: by 2002:a05:600c:3b84:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-456270595f5mr29377695e9.0.1752583143968;
        Tue, 15 Jul 2025 05:39:03 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45615a4551bsm72818305e9.37.2025.07.15.05.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 05:39:03 -0700 (PDT)
Message-ID: <c804f4bf-3257-4e6a-b95b-ce6768854521@linaro.org>
Date: Tue, 15 Jul 2025 13:39:02 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] perf: arm_spe: Add support for FEAT_SPE_EFT
 extended filtering
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
 <20250605-james-perf-feat_spe_eft-v3-3-71b0c9f98093@linaro.org>
 <aHUKKPySsJ4ne-EE@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUKKPySsJ4ne-EE@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/07/2025 2:46 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:01AM +0100, James Clark wrote:
>> FEAT_SPE_EFT (optional from Armv9.4) adds mask bits for the existing
>> load, store and branch filters. It also adds two new filter bits for
>> SIMD and floating point with their own associated mask bits. The current
>> filters only allow OR filtering on samples that are load OR store etc,
>> and the new mask bits allow setting part of the filter to an AND, for
>> example filtering samples that are store AND SIMD. With mask bits set to
>> 0, the OR behavior is preserved, so the unless any masks are explicitly
>> set old filters will behave the same.
>>
>> Add them all and make them behave the same way as existing format bits,
>> hidden and return EOPNOTSUPP if set when the feature doesn't exist.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index d9f6d229dce8..9309b846f642 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -86,6 +86,7 @@ struct arm_spe_pmu {
>>   #define SPE_PMU_FEAT_ERND			(1UL << 5)
>>   #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>>   #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
>> +#define SPE_PMU_FEAT_EFT			(1UL << 8)
>>   #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>>   	u64					features;
>>   
>> @@ -197,6 +198,27 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>>   #define ATTR_CFG_FLD_discard_CFG		config	/* PMBLIMITR_EL1.FM = DISCARD */
>>   #define ATTR_CFG_FLD_discard_LO			35
>>   #define ATTR_CFG_FLD_discard_HI			35
>> +#define ATTR_CFG_FLD_branch_filter_mask_CFG	config	/* PMSFCR_EL1.Bm */
>> +#define ATTR_CFG_FLD_branch_filter_mask_LO	36
>> +#define ATTR_CFG_FLD_branch_filter_mask_HI	36
>> +#define ATTR_CFG_FLD_load_filter_mask_CFG	config	/* PMSFCR_EL1.LDm */
>> +#define ATTR_CFG_FLD_load_filter_mask_LO	37
>> +#define ATTR_CFG_FLD_load_filter_mask_HI	37
>> +#define ATTR_CFG_FLD_store_filter_mask_CFG	config	/* PMSFCR_EL1.STm */
>> +#define ATTR_CFG_FLD_store_filter_mask_LO	38
>> +#define ATTR_CFG_FLD_store_filter_mask_HI	38
>> +#define ATTR_CFG_FLD_simd_filter_CFG		config	/* PMSFCR_EL1.SIMD */
>> +#define ATTR_CFG_FLD_simd_filter_LO		39
>> +#define ATTR_CFG_FLD_simd_filter_HI		39
>> +#define ATTR_CFG_FLD_simd_filter_mask_CFG	config	/* PMSFCR_EL1.SIMDm */
>> +#define ATTR_CFG_FLD_simd_filter_mask_LO	40
>> +#define ATTR_CFG_FLD_simd_filter_mask_HI	40
>> +#define ATTR_CFG_FLD_float_filter_CFG		config	/* PMSFCR_EL1.FP */
>> +#define ATTR_CFG_FLD_float_filter_LO		41
>> +#define ATTR_CFG_FLD_float_filter_HI		41
>> +#define ATTR_CFG_FLD_float_filter_mask_CFG	config	/* PMSFCR_EL1.FPm */
>> +#define ATTR_CFG_FLD_float_filter_mask_LO	42
>> +#define ATTR_CFG_FLD_float_filter_mask_HI	42
>>   
>>   #define ATTR_CFG_FLD_event_filter_CFG		config1	/* PMSEVFR_EL1 */
>>   #define ATTR_CFG_FLD_event_filter_LO		0
>> @@ -215,8 +237,15 @@ GEN_PMU_FORMAT_ATTR(pa_enable);
>>   GEN_PMU_FORMAT_ATTR(pct_enable);
>>   GEN_PMU_FORMAT_ATTR(jitter);
>>   GEN_PMU_FORMAT_ATTR(branch_filter);
>> +GEN_PMU_FORMAT_ATTR(branch_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(load_filter);
>> +GEN_PMU_FORMAT_ATTR(load_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(store_filter);
>> +GEN_PMU_FORMAT_ATTR(store_filter_mask);
>> +GEN_PMU_FORMAT_ATTR(simd_filter);
>> +GEN_PMU_FORMAT_ATTR(simd_filter_mask);
>> +GEN_PMU_FORMAT_ATTR(float_filter);
>> +GEN_PMU_FORMAT_ATTR(float_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(event_filter);
>>   GEN_PMU_FORMAT_ATTR(inv_event_filter);
>>   GEN_PMU_FORMAT_ATTR(min_latency);
>> @@ -228,8 +257,15 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_pct_enable.attr,
>>   	&format_attr_jitter.attr,
>>   	&format_attr_branch_filter.attr,
>> +	&format_attr_branch_filter_mask.attr,
>>   	&format_attr_load_filter.attr,
>> +	&format_attr_load_filter_mask.attr,
>>   	&format_attr_store_filter.attr,
>> +	&format_attr_store_filter_mask.attr,
>> +	&format_attr_simd_filter.attr,
>> +	&format_attr_simd_filter_mask.attr,
>> +	&format_attr_float_filter.attr,
>> +	&format_attr_float_filter_mask.attr,
>>   	&format_attr_event_filter.attr,
>>   	&format_attr_inv_event_filter.attr,
>>   	&format_attr_min_latency.attr,
>> @@ -250,6 +286,16 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>>   	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>>   		return 0;
>>   
>> +	if ((attr == &format_attr_branch_filter_mask.attr ||
>> +	     attr == &format_attr_load_filter_mask.attr ||
>> +	     attr == &format_attr_store_filter_mask.attr ||
>> +	     attr == &format_attr_simd_filter.attr ||
>> +	     attr == &format_attr_simd_filter_mask.attr ||
>> +	     attr == &format_attr_float_filter.attr ||
>> +	     attr == &format_attr_float_filter_mask.attr) &&
>> +	     !(spe_pmu->features & SPE_PMU_FEAT_EFT))
>> +		return 0;
>> +
>>   	return attr->mode;
>>   }
>>   
>> @@ -341,8 +387,15 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>   	u64 reg = 0;
>>   
>>   	reg |= FIELD_PREP(PMSFCR_EL1_LD, ATTR_CFG_GET_FLD(attr, load_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_LDm, ATTR_CFG_GET_FLD(attr, load_filter_mask));
>>   	reg |= FIELD_PREP(PMSFCR_EL1_ST, ATTR_CFG_GET_FLD(attr, store_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_STm, ATTR_CFG_GET_FLD(attr, store_filter_mask));
>>   	reg |= FIELD_PREP(PMSFCR_EL1_B, ATTR_CFG_GET_FLD(attr, branch_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_Bm, ATTR_CFG_GET_FLD(attr, branch_filter_mask));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_SIMD, ATTR_CFG_GET_FLD(attr, simd_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_SIMDm, ATTR_CFG_GET_FLD(attr, simd_filter_mask));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_FP, ATTR_CFG_GET_FLD(attr, float_filter));
>> +	reg |= FIELD_PREP(PMSFCR_EL1_FPm, ATTR_CFG_GET_FLD(attr, float_filter_mask));
>>   
>>   	if (reg)
>>   		reg |= PMSFCR_EL1_FT;
>> @@ -716,6 +769,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	u64 reg;
>>   	struct perf_event_attr *attr = &event->attr;
>>   	struct arm_spe_pmu *spe_pmu = to_spe_pmu(event->pmu);
>> +	const u64 feat_spe_eft_bits = PMSFCR_EL1_LDm | PMSFCR_EL1_STm |
>> +				      PMSFCR_EL1_Bm | PMSFCR_EL1_SIMD |
>> +				      PMSFCR_EL1_SIMDm | PMSFCR_EL1_FP |
>> +				      PMSFCR_EL1_FPm;
> 
> I'm not sure this constant is adding much, especially as its defined
> quite a long way from its single user.
> 
>>   
>>   	/* This is, of course, deeply driver-specific */
>>   	if (attr->type != event->pmu->type)
>> @@ -761,6 +818,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	    !(spe_pmu->features & SPE_PMU_FEAT_FILT_LAT))
>>   		return -EOPNOTSUPP;
>>   
>> +	if ((reg & feat_spe_eft_bits) &&
>> +	    !(spe_pmu->features & SPE_PMU_FEAT_EFT))
>> +		return -EOPNOTSUPP;
> 
> You could probably just spell out the entire thing tbh. It's verbose,
> but it's also pretty clear and it means we have everything in one place:
> 
> 	if ((FIELD_GET(PMSFCR_EL1_LDm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_STm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_Bm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_SIMD, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_SIMDm, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_FP, reg) ||
> 	     FIELD_GET(PMSFCR_EL1_FPm, reg)) &&
>             !(spe_pmu->features & SPE_PMU_FEAT_EFT))
> 		return -EOPNOTSUPP;
> 
> Will

Ack

