Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB4B3AC0F1
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 12:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773230448; cv=none; b=Ut62XrgTXeOVoVGSaF7j97QfaiOMnmHZFPLDxYvuj600SvDDM6J7vfYSIj3zJL9pBUIM3eeh2TgIVSXtft1dFYOaPCsiDjdrS7R1WlNCgfA1jwC+CQH4CkFlLoUmsDQ95F3K512QBwYk3sm5EQkr63YLrUu3gL/kdOdTfWBai+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773230448; c=relaxed/simple;
	bh=E92Lh4tvjrSsBZrvXHil80NIkNaNGxC/VtXNxe44axA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpHXY5IlKsQEYse5CGkQoklPVv5wCQ3kkn296zGj6u2b9hwAXWSADjKyuLQxK8WY6KzNGoOn5G1lrl880lob2Qh/bR5NuJ5vGAdlB+nEpii7urVsFt95Aj1oUaPn9xJcylm3QwaO31wl4Vtlx0Se1truqdEECIcoaETqg+1zRE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6wX26v9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6wX26v9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso28200225e9.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 05:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773230444; x=1773835244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=;
        b=g6wX26v9+yQvJb3F8Phow6poKPlg3nGTyaNtQdwwjFyIgN8T1fGypOfR16znLPAo8Y
         E7FIrpiPTJbS3z0AeS1WTEU8UZA1CsoJUb/ZBwliNXUEF1FCKiCvxc5yEJKqX/v7rPvn
         z3Jo/EalJ9Wc6qe4j7xrU3NiCl+qwh07n6zG4jgd4K5EXTuL05IRZvZWfkWo1UdrHX65
         2kv0K5v0dmvT8417Au+ZB6jSU3lk/8J1WoP8dtvenDMog2TeZ38wO9X8y7xdxMotdX40
         yybsDoRB2OMx1kuQKW+XZy5oAMqleMn3GChsiomjtthkdNIKPYC1nMGOWNJkJSWZ/sM/
         fNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230444; x=1773835244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=130nMfpxEVLAWE8mJauFzxZjoerVddIIHSIrMCUq+e8=;
        b=MtFsrETVZQvN/DCC3jlzxs6haMgPeKZUxvXQ+2lffeo9pvFRTw65uq12N8KDFWXHrU
         PuBI+2vMmzv/vp+Gu4c3jVxI3leX5lA+vP2oQgorZNhsdgqV4H24mLUQZOvVBTEiaRi0
         ADN+Rdr15Luc1fSDAKQbXoziJ7pLSiLQSk1yG3r+aCWfVBaWjcsCqSA9Gi+V8Iy4+yl4
         RGCSE/aZm2w7AnsHnTjk74A2cfmqEX4fWqIpQvGUxzMNo2Gh11E6bAJrgZKI+X+T1oOG
         bdBSGTpTNwaZCqWKXpNwlv2mOWPn/7VzUu6BtcTl25aP0hqiPm/MybIjouSM56i/bhtI
         vk1A==
X-Forwarded-Encrypted: i=1; AJvYcCXMVGZ3d2A6rFnHv/1ZfEOHF6f6k5A2aKaPrnR4sgTcTW/Ovq3hVBRu/W45rFBtO66G/PW/luzFA4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLFZJxPp65oF4kKIhfSCkuYiKLfkb3jRf/tYAgKvyYCL5lGah
	m09+f0iuDrONOxGtLQs1YGkLvfCus/3J5DZItbcGvVODmAyt6y+w1vNC8uB+aJtGZkI=
X-Gm-Gg: ATEYQzxLGIH5aJ5CWW5/ajt0lGrgmf63HkvlUg3PQ/tPdO8xj67rL8Qv5Ru0tg7muy3
	+p0azXrQap0Kb5McoeE8nZqlwP3eBp+isN9eltGi7QNb9D7vEX9LI0XfQPSmtprre1aHZqV590V
	8y8bgKEGLnIN/9kI0r9uGZI2MhrEwfiwoQN2TFxfNFxhsNvXapLfFqUEY9CREDNRcWdrS/r6Mv5
	4AZAyghC0qTbsk1GNIFbOrtcOXNKdWNBehRPycvNFTdPk1CfEov3vKYT5ryWspW4wSvaL8bBoyQ
	mRDUx86zKt6T50wV+wPlphBSB/aGnqJn/qHtib10lzmU7TUJCKoZ98+mzMm9vXcB+3YGsWeP4yS
	3yI7mH1yz7KZIkGvOMhsfanrBG7HvpQMjgxidJcgeoQ2Ove/m3ZWf1RHa9ogCbyb4robpBpV8Hp
	ji/5HY3OyHAiTgqotmIzTvIa8OxwFc
X-Received: by 2002:a05:600c:3b1c:b0:480:69b6:dfed with SMTP id 5b1f17b1804b1-4854b123903mr37819645e9.24.1773230443521;
        Wed, 11 Mar 2026 05:00:43 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm6957985f8f.6.2026.03.11.05.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:00:43 -0700 (PDT)
Message-ID: <1e97d367-ae01-4cd2-8005-f690e6d7f72d@linaro.org>
Date: Wed, 11 Mar 2026 12:00:42 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/19] perf: arm_pmuv3: Keep out of guest counter
 partition
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260209221414.2169465-1-coltonlewis@google.com>
 <20260209221414.2169465-7-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260209221414.2169465-7-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/02/2026 10:14 pm, Colton Lewis wrote:
> If the PMU is partitioned, keep the driver out of the guest counter
> partition and only use the host counter partition.
> 
> Define some functions that determine whether the PMU is partitioned
> and construct mutually exclusive bitmaps for testing which partition a
> particular counter is in. Note that despite their separate position in
> the bitmap, the cycle and instruction counters are always in the guest
> partition.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   arch/arm/include/asm/arm_pmuv3.h | 18 +++++++
>   arch/arm64/kvm/pmu-direct.c      | 86 ++++++++++++++++++++++++++++++++
>   drivers/perf/arm_pmuv3.c         | 40 +++++++++++++--
>   include/kvm/arm_pmu.h            | 24 +++++++++
>   4 files changed, 164 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
> index 154503f054886..bed4dfa755681 100644
> --- a/arch/arm/include/asm/arm_pmuv3.h
> +++ b/arch/arm/include/asm/arm_pmuv3.h
> @@ -231,6 +231,24 @@ static inline bool kvm_set_pmuserenr(u64 val)
>   }
>   
>   static inline void kvm_vcpu_pmu_resync_el0(void) {}
> +static inline void kvm_pmu_host_counters_enable(void) {}
> +static inline void kvm_pmu_host_counters_disable(void) {}
> +
> +static inline bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	return false;
> +}
> +
> +static inline u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
> +
> +static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ~0;
> +}
> +
>   
>   /* PMU Version in DFR Register */
>   #define ARMV8_PMU_DFR_VER_NI        0
> diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
> index 74e40e4915416..05ac38ec3ea20 100644
> --- a/arch/arm64/kvm/pmu-direct.c
> +++ b/arch/arm64/kvm/pmu-direct.c
> @@ -5,6 +5,8 @@
>    */
>   
>   #include <linux/kvm_host.h>
> +#include <linux/perf/arm_pmu.h>
> +#include <linux/perf/arm_pmuv3.h>
>   
>   #include <asm/arm_pmuv3.h>
>   
> @@ -20,3 +22,87 @@ bool has_host_pmu_partition_support(void)
>   	return has_vhe() &&
>   		system_supports_pmuv3();
>   }
> +
> +/**
> + * kvm_pmu_is_partitioned() - Determine if given PMU is partitioned
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Determine if given PMU is partitioned by looking at hpmn field. The
> + * PMU is partitioned if this field is less than the number of
> + * counters in the system.
> + *
> + * Return: True if the PMU is partitioned, false otherwise
> + */
> +bool kvm_pmu_is_partitioned(struct arm_pmu *pmu)
> +{
> +	if (!pmu)
> +		return false;
> +
> +	return pmu->max_guest_counters >= 0 &&
> +		pmu->max_guest_counters <= *host_data_ptr(nr_event_counters);
> +}
> +
> +/**
> + * kvm_pmu_host_counter_mask() - Compute bitmask of host-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the host-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in HPMN..N
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu)
> +{
> +	u8 nr_counters = *host_data_ptr(nr_event_counters);
> +
> +	if (!kvm_pmu_is_partitioned(pmu))
> +		return ARMV8_PMU_CNT_MASK_ALL;
> +
> +	return GENMASK(nr_counters - 1, pmu->max_guest_counters);
> +}
> +
> +/**
> + * kvm_pmu_guest_counter_mask() - Compute bitmask of guest-reserved counters
> + * @pmu: Pointer to arm_pmu struct
> + *
> + * Compute the bitmask that selects the guest-reserved counters in the
> + * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers. These are the counters
> + * in 0..HPMN and the cycle and instruction counters.
> + *
> + * Return: Bitmask
> + */
> +u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
> +{
> +	return ARMV8_PMU_CNT_MASK_C & GENMASK(pmu->max_guest_counters - 1, 0);

This should be an | instead of an & otherwise it's always zero. None of 
the passed through counters count anything with it like this, although 
the cycle counter always worked even with this issue.

I'm not sure if the selftests that you added catch this? I didn't try 
running them but seems like checking for non zero counter values is a 
very easy thing to test.



