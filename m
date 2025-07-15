Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9620199396
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 13:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752584663; cv=none; b=qidZ2C6RPVHlNtsxNs+YyuYAbeV7ZZ1GVXItrIbz1+tvmev+ow50b6NAnw4lyKqKyutm7f+PgqHYNwic214eTpIbHTELqvwlt5g2QZzCepyU/UpTQWo7JMAhB3kKm7CaQe3IPf4A9RJ3mYBu3qnxQOOTrFsEysr6DNpT6DMhPmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752584663; c=relaxed/simple;
	bh=8de/+OVEmpgQ2MrKae7+4kNVlqKqrSROqzrJtp3x0GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FR5ufPMtECVrBgphp9u1xiitRXGvmFNz8EDNJpB8qW3iW2872AlkHand4Q8CHpkaILAg/4UY4bwQPGYWQwaV49F7iKd61wDLr7dI+IcmaVCmGZlHkubVjy/GzswrCm4DwAx3ffrrG1mpSv8RkI7dFZvSYp4kPNLMdB+GFCT06Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2jJrnHY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2jJrnHY"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a582e09144so3174685f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 06:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752584660; x=1753189460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J89r7AvqyeIbrcgrXdArOfzh5yo/o2jaOib37mZOYIs=;
        b=C2jJrnHYZO1oXJwdOZdcm51OSpRKwYPkD+VhpqTXXu9S36yK8TzPp+UM4CYComG0xy
         onm71BFohXyMiemoFeb5NozPpV9DasSPCTerx4ruPUruUu0l8wCmCpKKNcsVqdz90ZAW
         6aJsiXFalWOwTsbr1Z9I0DgcmkPl7CImMkGDy8mekP8lOnjj5vvPMLjT0NrNCeXJmUf3
         CABYh39K0uLD2nBWyTA/3nkEaj6Iax6Wz29gF8rNoSVAyva4NuCR9Ro+C4Qx/vItDTUF
         +4KX682cNk3IGEYvjY005TUz8LRcG1qYJFx0qVxjUrEDiOsrhKdiZMNmTNrKHTFjzBRM
         s1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752584660; x=1753189460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J89r7AvqyeIbrcgrXdArOfzh5yo/o2jaOib37mZOYIs=;
        b=OS1UR5xguqcuv/yOSsbp3rZgatFw7+9bpU6YFtgZuAyoqZ2TJIQt9BVY7JjD6xvetO
         EZK9FjKsivM2Z9iXn2yd9lOwOAmufCTTUhBW8YaAEhwRXOB88a7Z1biASxRh6tu49hX6
         y24ocrbLz07DUiF9Eac/cP28kdjTUvqKVXO2rMs19KKPK4t89r4ykrpenOap0UtnBCHk
         gewFv1v8XQh4Z88+9s/y0pED+H9YF9ycepNcI4wKK0TpYdTCBWN4IO1e1EZdk+S8VrF+
         itlzHZEl+EGzn9ZjRe34fZ8r2CkIEWANOCw1xXMrxZvoGRlKs3+SZp3gei30yhwIaC5f
         px5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWg/7BPyjqLW2+fAcoU8pYmrPF/EVMuQwh8NYHhQ8suLaNld5fBFL0X4XJ99VH6vIoTHXfqImYb8bE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws+njFJIXJfcuOKiQN4/4J3WF7OcWQlDpdK9+QFfDcu8W42DFp
	eZdcTj9fo3JtjZwLHzZ2zeSAkuW9ixWNRMKA+ciyVL5KGNUSolOXVtrOTY6M6lp8xHE=
X-Gm-Gg: ASbGnct9Y2TbtPO3KBJcSZAaym6iy7m8IEeFK2OlDMQeKpegLOlmnxGYf0jqaPFC+w0
	otXBLnbTh+5F/5aXcL/XBnJ0owHb1HhP3fRjLtG7Kmni725mEKjcq+KrSdaILVtI28ldiVRdFjt
	qOdKQdDzhfKc9o4AT9bPu8NXiTclOhAXASNWjVPhUuv5yOWYu6FTdYNZ8JyXKeiOBYWVVhFsmmz
	QbH8OFOz4nuR8EPkqcyrAA+ZgM4JvL7GhhBHDd8/GkX/L/WO/hayVLZIDv4WNfYCXArGzTYg6+v
	3bOKpzGwY7JVDCcquM+MP87qnCcQAO1dnZ0OBK5VTGrhSm3S6yBV+Z/wsqcudUWKF9wohlROw2l
	RaDYv5fKoxfULt//3luhijSc+u8o=
X-Google-Smtp-Source: AGHT+IFtWJR4N1CKamdsyz9XjtkQHpkuQDX/87ZZ/cBBW4+sRrWYHFWFc00klxjEz4K5K+dv4kcPxw==
X-Received: by 2002:a05:6000:4612:b0:3a3:7ba5:960e with SMTP id ffacd0b85a97d-3b5f2e3e99dmr11999857f8f.59.1752584659975;
        Tue, 15 Jul 2025 06:04:19 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e332sm15169687f8f.79.2025.07.15.06.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 06:04:19 -0700 (PDT)
Message-ID: <7f51d4f9-7e08-49b5-ab43-8bc765bb2ca8@linaro.org>
Date: Tue, 15 Jul 2025 14:04:18 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] perf: arm_spe: Add support for filtering on data
 source
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
 <20250605-james-perf-feat_spe_eft-v3-7-71b0c9f98093@linaro.org>
 <aHUOig-kaRo15ZH5@willie-the-truck>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aHUOig-kaRo15ZH5@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/07/2025 3:04 pm, Will Deacon wrote:
> On Thu, Jun 05, 2025 at 11:49:05AM +0100, James Clark wrote:
>> SPE_FEAT_FDS adds the ability to filter on the data source of packets.
>> Like the other existing filters, enable filtering with PMSFCR_EL1.FDS
>> when any of the filter bits are set.
>>
>> Each bit maps to data sources 0-63 described by bits[0:5] in the data
>> source packet (although the full range of data source is 16 bits so
>> higher value data sources can't be filtered on). The filter is an OR of
>> all the bits, so for example setting bits 0 and 3 filters packets from
>> data sources 0 OR 3.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/perf/arm_spe_pmu.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
>> index 9309b846f642..d04318411f77 100644
>> --- a/drivers/perf/arm_spe_pmu.c
>> +++ b/drivers/perf/arm_spe_pmu.c
>> @@ -87,6 +87,7 @@ struct arm_spe_pmu {
>>   #define SPE_PMU_FEAT_INV_FILT_EVT		(1UL << 6)
>>   #define SPE_PMU_FEAT_DISCARD			(1UL << 7)
>>   #define SPE_PMU_FEAT_EFT			(1UL << 8)
>> +#define SPE_PMU_FEAT_FDS			(1UL << 9)
>>   #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
>>   	u64					features;
>>   
>> @@ -232,6 +233,10 @@ static const struct attribute_group arm_spe_pmu_cap_group = {
>>   #define ATTR_CFG_FLD_inv_event_filter_LO	0
>>   #define ATTR_CFG_FLD_inv_event_filter_HI	63
>>   
>> +#define ATTR_CFG_FLD_data_src_filter_CFG	config4	/* PMSDSFR_EL1 */
>> +#define ATTR_CFG_FLD_data_src_filter_LO	0
>> +#define ATTR_CFG_FLD_data_src_filter_HI	63
>> +
>>   GEN_PMU_FORMAT_ATTR(ts_enable);
>>   GEN_PMU_FORMAT_ATTR(pa_enable);
>>   GEN_PMU_FORMAT_ATTR(pct_enable);
>> @@ -248,6 +253,7 @@ GEN_PMU_FORMAT_ATTR(float_filter);
>>   GEN_PMU_FORMAT_ATTR(float_filter_mask);
>>   GEN_PMU_FORMAT_ATTR(event_filter);
>>   GEN_PMU_FORMAT_ATTR(inv_event_filter);
>> +GEN_PMU_FORMAT_ATTR(data_src_filter);
>>   GEN_PMU_FORMAT_ATTR(min_latency);
>>   GEN_PMU_FORMAT_ATTR(discard);
>>   
>> @@ -268,6 +274,7 @@ static struct attribute *arm_spe_pmu_formats_attr[] = {
>>   	&format_attr_float_filter_mask.attr,
>>   	&format_attr_event_filter.attr,
>>   	&format_attr_inv_event_filter.attr,
>> +	&format_attr_data_src_filter.attr,
>>   	&format_attr_min_latency.attr,
>>   	&format_attr_discard.attr,
>>   	NULL,
>> @@ -286,6 +293,9 @@ static umode_t arm_spe_pmu_format_attr_is_visible(struct kobject *kobj,
>>   	if (attr == &format_attr_inv_event_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_INV_FILT_EVT))
>>   		return 0;
>>   
>> +	if (attr == &format_attr_data_src_filter.attr && !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>> +		return 0;
>> +
>>   	if ((attr == &format_attr_branch_filter_mask.attr ||
>>   	     attr == &format_attr_load_filter_mask.attr ||
>>   	     attr == &format_attr_store_filter_mask.attr ||
>> @@ -406,6 +416,9 @@ static u64 arm_spe_event_to_pmsfcr(struct perf_event *event)
>>   	if (ATTR_CFG_GET_FLD(attr, inv_event_filter))
>>   		reg |= PMSFCR_EL1_FnE;
>>   
>> +	if (ATTR_CFG_GET_FLD(attr, data_src_filter))
>> +		reg |= PMSFCR_EL1_FDS;
> 
> Is the polarity correct here? The description of PMSDSFR_EL1.S<m> suggests
> that setting bits to 1 _excludes_ the FDS filtering.
> 

Setting filter bits to 1 means that samples matching are included. 
Setting bits to 0 means that they are excluded. And PMSFCR_EL1.FDS 
enables filtering as a whole, so if the user sets any filter bit to 1 we 
want to enable filtering:

   PMSDSFR_EL1.S<m>

   0b0  If PMSFCR_EL1.FDS is 1, do not record load operations that have
        bits [5:0] of the Data Source packet set to <m>.

   0b1  Load operations with Data Source <m> are unaffected by
        PMSFCR_EL1.FDS.

I think it's all the right way around and it ends up being the same as 
the other filters in SPE. Because we're using any bit being set to 
enable the filtering, the only thing you can't do is enable filtering 
with a 0 filter, but I didn't think that was useful. See the previous 
discussion on this here: 
https://lore.kernel.org/all/5752f039-51c1-4452-b5df-03ff06da7be3@linaro.org/

Reading the "Data source filtering" section in the docs change at the 
end might help too.

>>   	if (ATTR_CFG_GET_FLD(attr, min_latency))
>>   		reg |= PMSFCR_EL1_FL;
>>   
>> @@ -430,6 +443,12 @@ static u64 arm_spe_event_to_pmslatfr(struct perf_event *event)
>>   	return FIELD_PREP(PMSLATFR_EL1_MINLAT, ATTR_CFG_GET_FLD(attr, min_latency));
>>   }
>>   
>> +static u64 arm_spe_event_to_pmsdsfr(struct perf_event *event)
>> +{
>> +	struct perf_event_attr *attr = &event->attr;
>> +	return ATTR_CFG_GET_FLD(attr, data_src_filter);
>> +}
>> +
>>   static void arm_spe_pmu_pad_buf(struct perf_output_handle *handle, int len)
>>   {
>>   	struct arm_spe_pmu_buf *buf = perf_get_aux(handle);
>> @@ -788,6 +807,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
>>   	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
>>   		return -EOPNOTSUPP;
>>   
>> +	if (arm_spe_event_to_pmsdsfr(event) &&
>> +	    !(spe_pmu->features & SPE_PMU_FEAT_FDS))
>> +		return -EOPNOTSUPP;
> 
> Same question here.
> 
> Will



