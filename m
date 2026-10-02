Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5937233D9E
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 12:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944188; cv=none; b=CxzQ0ytAsSEU973+Nrn0sls3trAjFQEoRIS1MjAYO1HM7cf0eLAhtceH8/5ecmzW+13TGV34GKtqRsUcSzrkZS3KzVbqy8i5DiSW9OatoVZJdGxtKmzb9KMX7KRpRoqfaNCmT0pcGlXzKAx6qltXgiQR/uRFxRTM6fKBoubPjf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944188; c=relaxed/simple;
	bh=lEz08Vhdt+1jtm6cu02VYSsbgujCNbBVprsTli2Ncrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lCMKVejvHuoE+Q4V+2pEtU2tdi/cuSrQk2p4ODFB1qi51/Fvgp3153ya/BiXL4zWNVArV69CbXqixkwvu7yx1ZFHTvE/nYKU81aQR2McfE5C5K4ZNuacITv+IIX7SGgTichyuvxwp4J/IoR3vBDTFqxhV8y0Vod/anNGQhpOhoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a6GYOxqy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4LcGvb2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a6GYOxqy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4LcGvb2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nQYv2061966
	for <linux-doc@vger.kernel.org>; Fri, 2 Oct 2026 12:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGpFe92e77m4D8HWFN0+Ju+uFYYNnbJLyePdrrBrkno=; b=a6GYOxqyrbft66Qu
	nkXDlGpXuSpkhzOnmlxQc2oPmbcjG6RteGKwtYZsCIX6YtZ1HKpklhS/eTABRHVP
	ZPwgfER9zZCZ0GfJ2vUWGsd/Z+I4D0jDTEqr8rAJmj3r3e2UZjU5WSUlMKTUcjUA
	JiQnq0yQ7fL0dwLKByXpJYWw2ZknYH2/zoKSIaV1unQioLrjpncUI86/GS5XGw46
	yrBjOyOB5fAb5xfP2lczdKkYR1Q0mPVh+Kt53WhQULldjclOqpFhTdp7YuE55f7a
	FvuiDnQc1B6Naw+jqeydp7ECZrKrjVVNWvPU4kEKgZmw2LwAHZ7fI89LvDFb7mNI
	1vwiuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256msd9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 12:29:46 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso12609157a91.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 05:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790944185; x=1791548985; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGpFe92e77m4D8HWFN0+Ju+uFYYNnbJLyePdrrBrkno=;
        b=X4LcGvb2XzX4RNx5VZQVYtmWL5ocsmrvKKsQrOdgzS+/SzpRjNGbn3UDC1ERRxljV7
         G7IHG/F2zyv1WBfltmPo99LtASF5B2Xf3UrjEGewbBXlBTlCVbZWCAOCnvW7KmMzyLC4
         PXGtl2wWAV1gik5OSS7xCxf92Hx2WMgKq+mU4x5OXR5omKNCuKVV/RW3ZChsm8yexFCo
         Yo2CrQkt7LDIB+UTTRFopb9HLsUyFOEp1W1pz4aWf/SJ4vbs1dj21/xldzTYwycn2zoa
         Ooac6XEcuxJ3F94JifVqVQCYH8m7Bm07w1JrAQppxpMiowIHdOvs2ADCQyK+GNEcDeCA
         BplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944185; x=1791548985;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGpFe92e77m4D8HWFN0+Ju+uFYYNnbJLyePdrrBrkno=;
        b=K20dUZfCf5iRqBFeAPEVwNGMUDhJnMm5sE+JYwSm9R29IOEHws8O74YovzEq0PtR37
         v6UUvzfGVi7nceThLdEuT/IkOSJT96AqUZnAwB6lo4NEbMiOM8/YOfEOKHFdyDoGU41Z
         Dse9bvXln4HMUQp7oX8RO9DXJgZOAlO7u5TzEWupIBVkn3+vaorKr82/ecx8YoAb1x4V
         HBYbYa8eZIW25wiHoFNS3SomvMTbk5OvJ/O8/Ckeezii6N1x07oIThe85A/t7NqZZRkE
         7F72m7VilwaEZtUnj92StjpqrTk4Y1Q0Sd8b7yN0PWcRrOWqyKUjdVA7jsntkVZynkjc
         gouw==
X-Forwarded-Encrypted: i=1; AKwUvBzMDot7Mvtp+mupBBob5Cg9Nneh/CcTq64oTsxhNBr+1/0TCaiWHx6Oxj4NnR4fHaArZtKe2n9c85I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR3AbQlepxS3b5PJkph0DepHeFtKCn6RpDKXAfQIJlD7ylENh4
	nligdo2IwKSnjZCowJm/5lNZkjUR3GADYoekf5weJTWv+DFI0Vd9cL9B0Y8UB5DECHsGHOGnptK
	iyctOz455DnGDDo5igMfFAVgH4I3JmRAWmFL2Mpw0Xt5VrSTzb+ODH6s9L2Ln0Bs=
X-Gm-Gg: AYBFou0QldY745DCxHE06cGJa8Wzyz7G4v8m2iWJv+vPmI47v84iQRRw5AA+Cqdh72l
	R1rlE7lT/vNjMbE8n2f/P0q7+xUKGyX4U/5XNLN3KXaWvPMF3e/bLiMbpHcWJf2SemdjcqGKV6R
	+rEq+7MYIp8Sbq8aNRg4X0etfHdFuc0jGq35aIGKmWeJ49MbgQhPldTGyGnYGiLsGPQmZ3AlAno
	GdCa92R/ptxXLnMFbXKRmqQYRXF4oOhfSdIPbyC+G3SeWikPhKOw1SUU1nImS/h5f8Km552H7fR
	vdzQpqSbvCCrJn3IYdW24RmOiewC/3BrQLeaN/xFQtf+JUJR0U83BkF5rxXCfNP6ePK/Jp43XKI
	/ql4edWyRkpgY81zt3y+yGbAseyrZBMN/5IgUZoXitHxLVArVlscbrlUqyQyBC8h267ecYQ==
X-Received: by 2002:a17:90b:518d:b0:3a4:c725:2870 with SMTP id 98e67ed59e1d1-3a6ce6cbcb4mr2417494a91.14.1790944185125;
        Fri, 02 Oct 2026 05:29:45 -0700 (PDT)
X-Received: by 2002:a17:90b:518d:b0:3a4:c725:2870 with SMTP id 98e67ed59e1d1-3a6ce6cbcb4mr2417472a91.14.1790944184563;
        Fri, 02 Oct 2026 05:29:44 -0700 (PDT)
Received: from [10.133.33.14] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm8913230a91.13.2026.10.02.05.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 05:29:44 -0700 (PDT)
Message-ID: <0a4a28b8-0b26-41df-bd55-c809177a9909@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 20:29:34 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] cpufreq: CPPC: Resolve frequencies to performance
 levels
To: Christian Loehle <christian.loehle@arm.com>, rafael@kernel.org
Cc: zhenglifeng1@huawei.com, viresh.kumar@linaro.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Huang Rui <ray.huang@amd.com>, Perry Yuan <perry.yuan@amd.com>,
        "Gautham R . Shenoy"
 <gautham.shenoy@amd.com>,
        Vanshidhar Konda <vanshikonda@os.amperecomputing.com>,
        Shubhang Kaushik <sh@gentwo.org>,
        Pierre Gondois <pierre.gondois@arm.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Peter Zijlstra
 <peterz@infradead.org>, jonathanh@nvidia.com,
        zhanjie9@hisilicon.com, Vincent Guittot <vincent.guittot@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, zhongqiu.han@oss.qualcomm.com
References: <20260929102957.2591657-1-christian.loehle@arm.com>
 <20260929102957.2591657-3-christian.loehle@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260929102957.2591657-3-christian.loehle@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0OSBTYWx0ZWRfX15wOOxarPsE/
 vhYDNlVdtNIupNx57KarItHFq5lDIPx/9VEqwbqWjD4z487SG1w7MxTDqh1KuAONpbACULT2FVN
 +g4/BNWQZ9QGTI3BCXzJHg2zeZw82HI=
X-Proofpoint-ORIG-GUID: w07TIQ4LUscCa4iZu_aLIHy6WNPPhfiF
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abfa3ba cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=g-wu5bF9rX8ehRTGOaUA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: w07TIQ4LUscCa4iZu_aLIHy6WNPPhfiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0OSBTYWx0ZWRfX80grsSsFmgjz
 20VrV77MlW3kZOs7nd5or76qn4txeGOrdxe0iz6iitnQTNYUlPW/Ze1VZSqNmr6ZMDOodCQhNJW
 TJjLpPALY6ASfqiJe4oMcpXDoodjjhttaMjWNX8OLGvV0SaroKIo+Yv3RGC7t8tc2erogldx86V
 C70xCQy4pYXmsD5TukFj4jHpQaLbvFhdvlwotQfFbJdINzby+LjjP4yZTIhM2y5L0/ayLR1EZLP
 mzYOrwy0JFCf75Z2VGGUu/R5ruqH+QV+WkKvCV9QnaG4iXQCcmvKkC6nYYvcIVK+U/2tRF7yIhM
 1IcNpCxC9d3Dj7/1c19EQxSzJvvWaCNSu6+z+ahh1BITVyUwpxYj5P6vOGczyoAuvQO69+11shf
 uX1LftX4mhBkryckkE20pYCWz12PCwwKF0naSfs7INU+r+caJ0B5RESx4ZepRQBPqLkIyNlNNmh
 Qa6U9JR5Hicu4toeu3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020049

Hi Christian,


On 9/29/2026 6:29 PM, Christian Loehle wrote:
> Different kHz requests can select the same CPPC performance level.
> Implement ->resolve_freq() so governors such as schedutil can skip
> redundant writes.
> 
> Precompute the affine conversion and invert its integer rounding directly.
> Share bounded conversions with ->target() and ->fast_switch(), choosing the
> first performance level when several share a kHz value. Recompute limits
> from each policy snapshot to avoid caching sysfs-shared mutable controls.
> 
> Cap intervals at or below nominal kHz at Nominal Performance, excluding
> boosted levels that alias it. Unchanged frequency limits then imply
> unchanged performance limits across boost toggles.
> 
> After clamping to CPU limits, snap the limits to supported frequencies.
> If none lies in the interval, collapse both limits to the highest supported
> frequency not above its maximum, as frequency-table verification does.
> 
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>   drivers/cpufreq/cppc_cpufreq.c | 257 ++++++++++++++++++++++++++++++---
>   1 file changed, 239 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 4ea444ff889e..fa85efb9f701 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -18,8 +18,10 @@
>   #include <linux/cpufreq.h>
>   #include <linux/irq_work.h>
>   #include <linux/kthread.h>
> +#include <linux/math64.h>
>   #include <linux/mutex.h>
>   #include <linux/time.h>
> +#include <linux/units.h>
>   #include <linux/vmalloc.h>
>   #include <uapi/linux/sched/types.h>
>   
> @@ -29,6 +31,24 @@
>   
>   static struct cpufreq_driver cppc_cpufreq_driver;
>   
> +struct cppc_perf_freq_map {
> +	s64 offset;
> +	u64 multiplier;
> +	u32 divisor;
> +};
> +
> +struct cppc_cpufreq_data {
> +	struct cppc_cpudata cpu_data;
> +	struct cppc_perf_freq_map map;
> +	unsigned int nominal_khz;
> +};
> +
> +static struct cppc_cpufreq_data *
> +cppc_cpufreq_data(struct cppc_cpudata *cpu_data)
> +{
> +	return container_of(cpu_data, struct cppc_cpufreq_data, cpu_data);
> +}
> +
>   #ifdef CONFIG_ACPI_CPPC_CPUFREQ_FIE
>   static enum {
>   	FIE_UNSET = -1,
> @@ -302,11 +322,159 @@ static inline void cppc_freq_invariance_exit(void)
>   }
>   #endif /* CONFIG_ACPI_CPPC_CPUFREQ_FIE */
>   
> +/* Precompute the affine mapping used by cppc_perf_to_khz(). */
> +static void cppc_cpufreq_init_perf_map(struct cppc_perf_caps *caps,
> +				       struct cppc_perf_freq_map *map)
> +{
> +	if (caps->lowest_freq && caps->nominal_freq) {
> +		if (caps->lowest_freq == caps->nominal_freq) {
> +			map->multiplier = (u64)caps->nominal_freq * KHZ_PER_MHZ;

This duplicates the perf<->kHz conversion, but cppc_perf_to_khz() rounds
its offset at MHz granularity before scaling to kHz while the new map
scales first, so the two can differ by up to 999 kHz. In current patch
func cppc_cpufreq_perf_limits() the max_freq operand still derives from
cpuinfo.max_freq (old conversion) while data->nominal_khz uses the new
one -- with boost off, could the max_freq <= data->nominal_khz test
still be relied upon? If it goes false, will policy_max_perf become
highest_perf and max_perf seems to end up above nominal_perf?

> +			map->divisor = caps->nominal_perf;
> +			map->offset = 0;
> +		} else {
> +			map->multiplier = (u64)(caps->nominal_freq -
> +					   caps->lowest_freq) * KHZ_PER_MHZ;
> +			map->divisor = caps->nominal_perf - caps->lowest_perf;
> +			map->offset = (s64)caps->nominal_freq * KHZ_PER_MHZ -
> +				div64_u64(caps->nominal_perf * map->multiplier,
> +					  map->divisor);
> +		}
> +	} else {
> +		map->multiplier = cppc_get_dmi_max_khz();
> +		map->divisor = caps->highest_perf;
> +		map->offset = 0;
> +	}
> +}
> +
> +static unsigned int
> +cppc_cpufreq_perf_to_khz(const struct cppc_perf_freq_map *map, u32 perf)
> +{
> +	s64 freq = map->offset + div64_u64(perf * map->multiplier,
> +					    map->divisor);
> +
> +	return freq > 0 ? freq : 0;
> +}
> +
> +/*
> + * Invert integer-kHz rounding: L finds the first level at or above the
> + * target frequency, H the last at or below it, within the supplied bounds.
> + */
> +static u32 cppc_cpufreq_perf_for_freq(const struct cppc_perf_freq_map *map,
> +				      unsigned int target_freq,
> +				      u32 min_perf, u32 max_perf,
> +				      unsigned int relation)
> +{
> +	s64 scaled_freq = (s64)target_freq - map->offset;
> +	u64 perf;
> +
> +	switch (relation) {
> +	case CPUFREQ_RELATION_L:
> +		if (!target_freq || scaled_freq <= 0)
> +			perf = 0;
> +		else
> +			perf = mul_u64_u64_div_u64_roundup(scaled_freq,
> +							   map->divisor,
> +							   map->multiplier);
> +		break;
> +
> +	case CPUFREQ_RELATION_H:
> +		if (scaled_freq < 0) {
> +			perf = 0;
> +		} else {
> +			perf = mul_u64_u64_div_u64_roundup(scaled_freq + 1,
> +							   map->divisor,
> +							   map->multiplier);
> +			perf--;
> +		}
> +		break;
> +
> +	default:
> +		WARN_ON_ONCE(1);
> +		return min_perf;
> +	}
> +
> +	return clamp_t(u64, perf, min_perf, max_perf);
> +}
> +
> +static void cppc_cpufreq_perf_limits(struct cppc_perf_caps *caps,
> +				     struct cppc_cpufreq_data *data,
> +				     unsigned int min_freq,
> +				     unsigned int max_freq,
> +				     u32 *min_perf, u32 *max_perf)
> +{
> +	u32 policy_max_perf;
> +
> +	/* Do not include boosted levels that alias the nominal frequency. */
> +	policy_max_perf = max_freq <= data->nominal_khz ?
> +			  caps->nominal_perf : caps->highest_perf;
> +	*min_perf = cppc_cpufreq_perf_for_freq(&data->map, min_freq,
> +					       caps->lowest_perf,
> +					       policy_max_perf,
> +					       CPUFREQ_RELATION_L);
> +	*max_perf = cppc_cpufreq_perf_for_freq(&data->map, max_freq,
> +					       caps->lowest_perf,
> +					       policy_max_perf,
> +					       CPUFREQ_RELATION_H);
> +}
> +
> +static unsigned int
> +cppc_cpufreq_resolve_freq(struct cpufreq_policy *policy,
> +			  unsigned int target_freq,
> +			  unsigned int min_freq,
> +			  unsigned int max_freq,
> +			  unsigned int relation)
> +{
> +	struct cppc_cpudata *cpu_data = policy->driver_data;
> +	struct cppc_perf_caps *caps = &cpu_data->perf_caps;
> +	struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
> +	const struct cppc_perf_freq_map *map = &data->map;
> +	u32 min_perf, max_perf, perf;
> +
> +	cppc_cpufreq_perf_limits(caps, data, min_freq, max_freq,
> +				 &min_perf, &max_perf);
> +	if (WARN_ON_ONCE(min_perf > max_perf))
> +		return cppc_cpufreq_perf_to_khz(map, max_perf);
> +
> +	switch (relation) {
> +	case CPUFREQ_RELATION_L:
> +	case CPUFREQ_RELATION_H:
> +		perf = cppc_cpufreq_perf_for_freq(map, target_freq,
> +						  min_perf, max_perf, relation);
> +		break;
> +	case CPUFREQ_RELATION_C: {
> +		u32 lower = cppc_cpufreq_perf_for_freq(map, target_freq,
> +							min_perf, max_perf,
> +							CPUFREQ_RELATION_H);
> +		u32 upper = cppc_cpufreq_perf_for_freq(map, target_freq,
> +							min_perf, max_perf,
> +							CPUFREQ_RELATION_L);
> +		unsigned int lower_freq = cppc_cpufreq_perf_to_khz(map, lower);
> +		unsigned int upper_freq = cppc_cpufreq_perf_to_khz(map, upper);
> +
> +		if (lower_freq >= target_freq)
> +			perf = lower;
> +		else if (upper_freq <= target_freq)
> +			perf = upper;
> +		else if (target_freq - lower_freq < upper_freq - target_freq)
> +			perf = lower;
> +		else
> +			perf = upper;
> +		break;
> +	}
> +	default:
> +		WARN_ON_ONCE(1);
> +		return target_freq;
> +	}
> +
> +	return cppc_cpufreq_perf_to_khz(map, perf);
> +}
> +
>   static void cppc_cpufreq_get_perf_limits(struct cppc_cpudata *cpu_data,
>   					 struct cpufreq_policy *policy,
>   					 u32 *min_perf, u32 *max_perf)
>   {
>   	struct cppc_perf_caps *caps = &cpu_data->perf_caps;
> +	struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
>   	unsigned int min_freq, max_freq;
>   	u32 min, max;
>   
> @@ -315,11 +483,11 @@ static void cppc_cpufreq_get_perf_limits(struct cppc_cpudata *cpu_data,
>   	if (unlikely(min_freq > max_freq))
>   		min_freq = max_freq;
>   
> -	min = cppc_khz_to_perf(caps, min_freq);
> -	max = cppc_khz_to_perf(caps, max_freq);
> +	cppc_cpufreq_perf_limits(caps, data, min_freq, max_freq,
> +				 &min, &max);
>   
> -	*min_perf = clamp_t(u32, min, caps->lowest_perf, caps->highest_perf);
> -	*max_perf = clamp_t(u32, max, caps->lowest_perf, caps->highest_perf);
> +	*min_perf = min(min, max);
> +	*max_perf = max;
>   }
>   
>   static void cppc_cpufreq_update_perf_limits(struct cppc_cpudata *cpu_data,
> @@ -330,6 +498,26 @@ static void cppc_cpufreq_update_perf_limits(struct cppc_cpudata *cpu_data,
>   				     &cpu_data->perf_ctrls.max_perf);
>   }
>   
> +static unsigned int
> +cppc_cpufreq_update_perf_ctrls(struct cppc_cpudata *cpu_data,
> +			       struct cpufreq_policy *policy,
> +			       unsigned int target_freq)
> +{
> +	struct cppc_cpufreq_data *data = cppc_cpufreq_data(cpu_data);
> +	u32 min_perf, max_perf, desired_perf;
> +
> +	cppc_cpufreq_get_perf_limits(cpu_data, policy, &min_perf, &max_perf);
> +	/* Use the first level when several share the same integer-kHz value. */
> +	desired_perf = cppc_cpufreq_perf_for_freq(&data->map, target_freq,
> +						  min_perf, max_perf,
> +						  CPUFREQ_RELATION_L);
> +	cpu_data->perf_ctrls.min_perf = min_perf;
> +	cpu_data->perf_ctrls.max_perf = max_perf;
> +	cpu_data->perf_ctrls.desired_perf = desired_perf;
> +
> +	return cppc_cpufreq_perf_to_khz(&data->map, desired_perf);
> +}
> +
>   static int cppc_cpufreq_set_target(struct cpufreq_policy *policy,
>   				   unsigned int target_freq,
>   				   unsigned int relation)
> @@ -339,12 +527,9 @@ static int cppc_cpufreq_set_target(struct cpufreq_policy *policy,
>   	struct cpufreq_freqs freqs;
>   	int ret = 0;
>   
> -	cpu_data->perf_ctrls.desired_perf =
> -			cppc_khz_to_perf(&cpu_data->perf_caps, target_freq);
> -	cppc_cpufreq_update_perf_limits(cpu_data, policy);
> -
>   	freqs.old = policy->cur;
> -	freqs.new = target_freq;
> +	freqs.new = cppc_cpufreq_update_perf_ctrls(cpu_data, policy,
> +						   target_freq);
>   
>   	cpufreq_freq_transition_begin(policy, &freqs);
>   	ret = cppc_set_perf(cpu, &cpu_data->perf_ctrls);
> @@ -361,13 +546,12 @@ static unsigned int cppc_cpufreq_fast_switch(struct cpufreq_policy *policy,
>   					      unsigned int target_freq)
>   {
>   	struct cppc_cpudata *cpu_data = policy->driver_data;
> +	unsigned int resolved_freq;
>   	unsigned int cpu = policy->cpu;
> -	u32 desired_perf;
>   	int ret;
>   
> -	desired_perf = cppc_khz_to_perf(&cpu_data->perf_caps, target_freq);
> -	cpu_data->perf_ctrls.desired_perf = desired_perf;
> -	cppc_cpufreq_update_perf_limits(cpu_data, policy);
> +	resolved_freq = cppc_cpufreq_update_perf_ctrls(cpu_data, policy,
> +						       target_freq);
>   
>   	ret = cppc_set_perf(cpu, &cpu_data->perf_ctrls);
>   	if (ret) {
> @@ -376,12 +560,39 @@ static unsigned int cppc_cpufreq_fast_switch(struct cpufreq_policy *policy,
>   		return 0;
>   	}
>   
> -	return target_freq;
> +	return resolved_freq;
>   }
>   
>   static int cppc_verify_policy(struct cpufreq_policy_data *policy)
>   {
> +	struct cpufreq_policy *cur_policy;
> +	struct cppc_cpudata *cpu_data;
> +	struct cppc_cpufreq_data *data;
> +	struct cppc_perf_caps *caps;
> +	unsigned int min_freq, max_freq;
> +	u32 min_perf, max_perf;
> +
>   	cpufreq_verify_within_cpu_limits(policy);
> +
> +	cur_policy = cpufreq_cpu_get_raw(policy->cpu);
> +	if (WARN_ON_ONCE(!cur_policy || !cur_policy->driver_data))
> +		return -ENODEV;
> +
> +	cpu_data = cur_policy->driver_data;
> +	data = cppc_cpufreq_data(cpu_data);
> +	caps = &cpu_data->perf_caps;
> +	cppc_cpufreq_perf_limits(caps, data, policy->min, policy->max,
> +				 &min_perf, &max_perf);
> +	min_freq = cppc_cpufreq_perf_to_khz(&data->map, min_perf);
> +	max_freq = cppc_cpufreq_perf_to_khz(&data->map, max_perf);
> +
> +	/* Favor the maximum if no supported frequency lies in the interval. */
> +	if (min_perf > max_perf || min_freq > policy->max ||
> +	    max_freq < policy->min)
> +		min_freq = max_freq;
> +
> +	policy->min = min_freq;
> +	policy->max = max_freq;
>   	return 0;
>   }
>   
> @@ -618,12 +829,14 @@ static void populate_efficiency_class(void)
>   
>   static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>   {
> +	struct cppc_cpufreq_data *data;
>   	struct cppc_cpudata *cpu_data;
>   	int ret;
>   
> -	cpu_data = kzalloc_obj(struct cppc_cpudata);
> -	if (!cpu_data)
> +	data = kzalloc_obj(struct cppc_cpufreq_data);
> +	if (!data)
>   		goto out;
> +	cpu_data = &data->cpu_data;
>   
>   	if (!zalloc_cpumask_var(&cpu_data->shared_cpu_map, GFP_KERNEL))
>   		goto free_cpu;
> @@ -640,6 +853,10 @@ static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>   		goto free_mask;
>   	}
>   
> +	cppc_cpufreq_init_perf_map(&cpu_data->perf_caps, &data->map);
> +	data->nominal_khz = cppc_cpufreq_perf_to_khz(&data->map,
> +						     cpu_data->perf_caps.nominal_perf);
> +
>   	ret = cppc_get_perf(cpu, &cpu_data->perf_ctrls);
>   	if (ret) {
>   		pr_debug("Err reading CPU%d perf ctrls: ret:%d\n", cpu, ret);
> @@ -651,7 +868,7 @@ static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>   free_mask:
>   	free_cpumask_var(cpu_data->shared_cpu_map);
>   free_cpu:
> -	kfree(cpu_data);
> +	kfree(data);
>   out:
>   	return NULL;
>   }
> @@ -659,9 +876,12 @@ static struct cppc_cpudata *cppc_cpufreq_get_cpu_data(unsigned int cpu)
>   static void cppc_cpufreq_put_cpu_data(struct cpufreq_policy *policy)
>   {
>   	struct cppc_cpudata *cpu_data = policy->driver_data;
> +	struct cppc_cpufreq_data *data;
> +
> +	data = container_of(cpu_data, struct cppc_cpufreq_data, cpu_data);
>   
>   	free_cpumask_var(cpu_data->shared_cpu_map);
> -	kfree(cpu_data);
> +	kfree(data);
>   	policy->driver_data = NULL;
>   }
>   
> @@ -1056,6 +1276,7 @@ static struct cpufreq_driver cppc_cpufreq_driver = {
>   	.flags = CPUFREQ_CONST_LOOPS | CPUFREQ_NEED_UPDATE_LIMITS,
>   	.verify = cppc_verify_policy,
>   	.target = cppc_cpufreq_set_target,
> +	.resolve_freq = cppc_cpufreq_resolve_freq,
>   	.get = cppc_cpufreq_get_rate,
>   	.fast_switch = cppc_cpufreq_fast_switch,
>   	.init = cppc_cpufreq_cpu_init,


-- 
Thx and BRs,
Zhongqiu Han
