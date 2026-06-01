Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1697E384235;
	Mon,  1 Jun 2026 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304988; cv=none; b=fcb0bRLVQRnJpt9wPAHq89feEgI9aXmVnfiMxUDolAlD2Z+iuRC//Iuo0g2rXSpML0We8t+sl6OuMNZU7YF6zW1v+Dpq/R62YXD2uaoAiax+lHJl5ubV6HdpB2nU7II55QsA3xc4X6RR0pJgTtbVymZq/kXwnyTb9sHpvJz/mJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304988; c=relaxed/simple;
	bh=bGko8OABDqOiipnO9PQ5X/iKfJawFh8TXGCB8OtqLAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPwKV4PitQd+ALMvw8wCqglXvW5Sj9A0QIK8rg/ufqL/eDVlddwbrAq8YB0AzsOYmPLs/ponReo9OTU6SrJVPhytw+IaCfmgoQeKv2YGOS+bhW2wLQVSyniaL+x2M63qQzh4f66ikS3mIrmILCPqcar4GVUSPRzf6KBJuXKqJ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RCajWz98; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RCajWz98"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BAD91FCD;
	Mon,  1 Jun 2026 02:09:40 -0700 (PDT)
Received: from [10.57.72.38] (unknown [10.57.72.38])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2E7A3F905;
	Mon,  1 Jun 2026 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780304985; bh=bGko8OABDqOiipnO9PQ5X/iKfJawFh8TXGCB8OtqLAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RCajWz98ja/sZRPh/oFEnbImqK0BLXhY4yaLyyqG6o/g20Dw10PNbgJ/DhYlNKHO4
	 /cWmo8yw3s0MQ9vLdnXamPWN0GFgWTk+eJJcWML3yUZw0kGYK1dmcvbijDNMdy68eS
	 cLNR0hchc1urmzp69S1aiYOGFLGvOI9QXzVW0pww=
Message-ID: <0958edfa-1f0d-43a3-9332-a9b4f88423fd@arm.com>
Date: Mon, 1 Jun 2026 10:09:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: kernel: Unify CNP disable workaround into
 ARM64_WORKAROUND_DISABLE_CNP
To: Zeng Heng <zengheng@huaweicloud.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, maz@kernel.org, skhan@linuxfoundation.org,
 miko.lenczewski@arm.com, lucaswei@google.com, broonie@kernel.org,
 thuth@redhat.com, ryan.roberts@arm.com, tongtiangen@huawei.com,
 oupton@kernel.org, kuninori.morimoto.gx@renesas.com, mark.rutland@arm.com,
 will@kernel.org, corbet@lwn.net, catalin.marinas@arm.com,
 kevin.brodsky@arm.com, lpieralisi@kernel.org, yangyicong@hisilicon.com,
 james.clark@linaro.org, yeoreum.yun@arm.com
Cc: linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260529063132.766491-1-zengheng@huaweicloud.com>
 <1e107eba-e28c-4fbf-80dc-808b8c3f4bb5@arm.com>
 <58ffd225-c9d0-b2f6-eefe-13c056746faa@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <58ffd225-c9d0-b2f6-eefe-13c056746faa@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/1/26 09:50, Zeng Heng wrote:
> Hi Vladimir,
> 
> On 2026/5/29 17:17, Vladimir Murzin wrote:
>> Hi,
>>
>> On 5/29/26 07:31, Zeng Heng wrote:
>>> From: Zeng Heng <zengheng4@huawei.com>
>>>
>>> HiSilicon HIP09 implements TLB entry matching behavior that deviates
>>> from the ARM architecture specification when the CnP (Common not Private)
>>> bit is set in TTBRx_ELx.
>>>
>>> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
>>> cores, leading to TLB conflicts and stale mappings. This breaks
>>> coherency and can result in incorrect translations.
>>>
>>> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
>>> disable CNP on affected HIP09 cores.
>>>
>>> Merge the existing NVIDIA Carmel and the HiSilicon HIP09 CNP errata
>>> workarounds into a single generic capability ARM64_WORKAROUND_DISABLE_CNP.
>>>
>>> Both NVIDIA Carmel and HiSilicon HIP09 have hardware errata where
>>> CNP (Common Not Private) behavior differs from the ARM specification,
>>> causing incorrect TLB entry sharing between cores. The existing
>>> NVIDIA_CARMEL_CNP_ERRATUM and the newly added HISILICON_ERRATUM_162100125
>>> are now both handled by the unified ARM64_WORKAROUND_DISABLE_CNP.
>>>
>>> Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
>>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>>> ---
>>> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
>>>
>>> Changes in v2:
>>>    - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
>>> ---
>>>
>>>   Documentation/arch/arm64/silicon-errata.rst |  4 +++-
>>>   arch/arm64/Kconfig                          | 17 ++++++++++++-----
>>>   arch/arm64/include/asm/cpucaps.h            |  4 ++--
>>>   arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>>>   arch/arm64/kernel/cpufeature.c              |  2 +-
>>>   arch/arm64/tools/cpucaps                    |  2 +-
>>>   6 files changed, 31 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>>> index 211119ce7adc..b4565e1a726d 100644
>>> --- a/Documentation/arch/arm64/silicon-errata.rst
>>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>>> @@ -254,7 +254,7 @@ stable kernels.
>>>   | Marvell        | ARM-MMU-500     | #582743         | N/A                         |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> -| NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>>> +| NVIDIA         | Carmel Core     | N/A             | ARM64_WORKAROUND_DISABLE_CNP|
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> @@ -284,6 +284,8 @@ stable kernels.
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> +| Hisilicon      | Hip09           | #162100125      | ARM64_WORKAROUND_DISABLE_CNP|
>>> ++----------------+-----------------+-----------------+-----------------------------+
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>>   | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>>   +----------------+-----------------+-----------------+-----------------------------+
>>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>>> index fe60738e5943..dc0bd32ea2d1 100644
>>> --- a/arch/arm64/Kconfig
>>> +++ b/arch/arm64/Kconfig
>>> @@ -1315,13 +1315,20 @@ config QCOM_FALKOR_ERRATUM_E1041
>>>
>>>         If unsure, say Y.
>>>
>>> -config NVIDIA_CARMEL_CNP_ERRATUM
>>> -    bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>>> +config ARM64_WORKAROUND_DISABLE_CNP
>>> +    bool "Disable CNP on affected CPUs"
>>>       default y
>>>       help
>>> -      If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>>> -      invalidate shared TLB entries installed by a different core, as it would
>>> -      on standard ARM cores.
>>> +      This option disables the CNP (Common Not Private) feature on CPUs
>>> +      that have hardware errata affecting CNP behavior.
>>> +
>>> +      On NVIDIA Carmel cores, CNP behaves differently than on standard ARM
>>> +      cores: non-shareable TLBIs on a core may not invalidate shared TLB
>>> +      entries installed by a different core.
>>> +
>>> +      On Hisilicon HIP09 cores, TLB entries may be incorrectly shared
>>> +      between cores when TTBRx.CNP=1, leading to TLB conflicts and
>>> +      stale mappings.
>>>
>>>         If unsure, say Y.
>>>
>> I'm afraid we cannot swap one config with another. Instead, we need to follow
>> established pattern for sharing workaround, something like
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 378e50fef247..68eb2993cfd3 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1315,9 +1315,13 @@ config QCOM_FALKOR_ERRATUM_E1041
>>              If unsure, say Y.
>>   +config ARM64_WORKAROUND_DISABLE_CNP
>> +       bool
>> +
>>   config NVIDIA_CARMEL_CNP_ERRATUM
>>          bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
>>          default y
>> +       select ARM64_WORKAROUND_DISABLE_CNP
>>          help
>>            If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
>>            invalidate shared TLB entries installed by a different core, as it would
>>
>>
>> and related changes for generalisation of the workaround - that would to be patch 1/2.
>>
>> Then we can easily wire-up your errata with something like
>>
>> +config HISILICON_ERRATUM_162100125
>> +       bool "Hisilicon erratum 162100125"
>> +       default y
>> +       select ARM64_WORKAROUND_DISABLE_CNP
>> +       help
>> +         On HiSilicon HIP09, TLB entry matching behavior when CNP
>> +         (TTBRx.CNP=1) is enabled differs from the ARM architecture
>> +         specification.
>> +
>> +         TLB entries may be incorrectly shared between CPUs, potentially
>> +         causing TLB conflicts and stale mappings.
>> +
>> +         Disable CNP support for affected HiSilicon HIP09 cores.
>> +
>> +         If unsure, say Y.
>>
>> and related update in documentation and MIDR list - that would be patch 2/2
>>
>> Thanks
>> Vladimir
>>  
>>> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
>>> index d0d3cdd5763c..25c61cda901c 100644
>>> --- a/arch/arm64/include/asm/cpucaps.h
>>> +++ b/arch/arm64/include/asm/cpucaps.h
>>> @@ -58,8 +58,8 @@ cpucap_is_possible(const unsigned int cap)
>>>           return IS_ENABLED(CONFIG_ARM64_ERRATUM_2658417);
>>>       case ARM64_WORKAROUND_CAVIUM_23154:
>>>           return IS_ENABLED(CONFIG_CAVIUM_ERRATUM_23154);
>>> -    case ARM64_WORKAROUND_NVIDIA_CARMEL_CNP:
>>> -        return IS_ENABLED(CONFIG_NVIDIA_CARMEL_CNP_ERRATUM);
>>> +    case ARM64_WORKAROUND_DISABLE_CNP:
>>> +        return IS_ENABLED(CONFIG_ARM64_WORKAROUND_DISABLE_CNP);
>>>       case ARM64_WORKAROUND_REPEAT_TLBI:
>>>           return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
>>>       case ARM64_WORKAROUND_SPECULATIVE_SSBS:
>>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>>> index 5377e4c2eba2..675cd059165c 100644
>>> --- a/arch/arm64/kernel/cpu_errata.c
>>> +++ b/arch/arm64/kernel/cpu_errata.c
>>> @@ -394,6 +394,14 @@ static const struct arm64_cpu_capabilities qcom_erratum_1003_list[] = {
>>>   };
>>>   #endif
>>>
>>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>>> +static const struct midr_range cnp_erratum_cpus[] = {
>>> +    MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>>> +    MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>>> +    {},
>>> +};
>>> +#endif
>>> +
>>>   #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
>>>   static const struct midr_range workaround_clean_cache[] = {
>>>   #if    defined(CONFIG_ARM64_ERRATUM_826319) || \
>>> @@ -801,12 +809,11 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>>>                     1, 0),
>>>       },
>>>   #endif
>>> -#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
>>> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>>>       {
>>> -        /* NVIDIA Carmel */
>>> -        .desc = "NVIDIA Carmel CNP erratum",
>>> -        .capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
>>> -        ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>>> +        .desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
>>> +        .capability = ARM64_WORKAROUND_DISABLE_CNP,
>>> +        ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
>>>       },
>>>   #endif
>>>   #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index 6d53bb15cf7b..20c5f24f74a9 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -1785,7 +1785,7 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>>>       if (is_kdump_kernel())
>>>           return false;
>>>
>>> -    if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
>>> +    if (cpus_have_cap(ARM64_WORKAROUND_DISABLE_CNP))
> 
> Here, ARM64_WORKAROUND_DISABLE_CNP comes from arch/arm64/tools/cpucaps,
> not from arch/arm64/Kconfig. Therefore, if we do not replace WORKAROUND_NVIDIA_CARMEL_CNP
> in arch/arm64/tools/cpucaps, we will have to continue adding a redundant
> WORKAROUND_DISABLE_CNP along with its corresponding redundant logic.
> 
> I prefer to keep CONFIG_ARM64_WORKAROUND_NVIDIA_CARMEL_CNP in arch/arm64/Kconfig
> and replace WORKAROUND_NVIDIA_CARMEL_CNP in arch/arm64/tools/cpucaps.
> 
> I would like to confirm whether the above aligns with your expectations.
> 

Yes indeed, keep config and generalise capability.

Thanks
Vladimir

> 
> Best regards,
> Zeng Heng
> 
> 
>>>           return false;
>>>
>>>       return has_cpuid_feature(entry, scope);
>>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>>> index 811c2479e82d..9b85a84f6fd4 100644
>>> --- a/arch/arm64/tools/cpucaps
>>> +++ b/arch/arm64/tools/cpucaps
>>> @@ -120,7 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
>>>   WORKAROUND_CAVIUM_TX2_219_TVM
>>>   WORKAROUND_CLEAN_CACHE
>>>   WORKAROUND_DEVICE_LOAD_ACQUIRE
>>> -WORKAROUND_NVIDIA_CARMEL_CNP
>>> +WORKAROUND_DISABLE_CNP
>>>   WORKAROUND_PMUV3_IMPDEF_TRAPS
>>>   WORKAROUND_QCOM_FALKOR_E1003
>>>   WORKAROUND_QCOM_ORYON_CNTVOFF
>>> -- 
>>> 2.43.0
>>>
> 

