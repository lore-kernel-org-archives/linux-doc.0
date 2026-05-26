Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA213F5BD0;
	Tue, 26 May 2026 12:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779797986; cv=none; b=bTgzMUcVPD0ryinwwmX+YgKiav8lXJM6sUwWrolqLgqghKuK01OJrDtF1Jm+RHNfWdaxg3pE9cnI+MVI57puXla84+5KKw7IHQ4M2J4DmxSLWLkGpbOD2mprJcizng9iCIVDvvoDNlgkooeij9k3FMkfwGgl5lq2PfiUYrbZzt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779797986; c=relaxed/simple;
	bh=Hh2oQgwDDxLIYUFwNwUl9sy4Mm/ft3z5K4JupbKs8XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FYIsW4JITvJACWzBh5ILCBx87V27xCCe3bTKqxENyngzYRQ5D4l4N5pJzjpk3unQE4S1Rend2fivoa8JM8UYa/fe3TS+zRJY64Q/9XdV+1+6LdFnXFvLaktF5k+ohlez44BAZcyzdum+pfKjNKTYHxDEl7PrKztmOeE/LdEE8OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gPsHp0t3mzKHMdk;
	Tue, 26 May 2026 20:19:18 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 2730140576;
	Tue, 26 May 2026 20:19:31 +0800 (CST)
Received: from [10.174.179.37] (unknown [10.174.179.37])
	by APP4 (Coremail) with SMTP id gCh0CgAX31rQjxVq6kXSDg--.29133S3;
	Tue, 26 May 2026 20:19:30 +0800 (CST)
Message-ID: <262fdd41-81bf-fb65-c1b7-c9f15e893156@huaweicloud.com>
Date: Tue, 26 May 2026 20:19:28 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: kernel: Disable CNP on HiSilicon HIP09
Content-Language: en-US
To: Vladimir Murzin <vladimir.murzin@arm.com>,
 Zeng Heng <zengheng@huaweicloud.com>, corbet@lwn.net,
 kuninori.morimoto.gx@renesas.com, maz@kernel.org, oupton@kernel.org,
 catalin.marinas@arm.com, lucaswei@google.com, yeoreum.yun@arm.com,
 skhan@linuxfoundation.org, james.clark@linaro.org, broonie@kernel.org,
 mark.rutland@arm.com, lpieralisi@kernel.org, ryan.roberts@arm.com,
 will@kernel.org, tongtiangen@huawei.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, miko.lenczewski@arm.com
Cc: linux-doc@vger.kernel.org, wangkefeng.wang@huawei.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sunnanyong@huawei.com
References: <20260526015720.206854-1-zengheng@huaweicloud.com>
 <3e7d5472-9c40-456c-876e-c2e71fa0e8fa@arm.com>
From: Zeng Heng <zengheng@huaweicloud.com>
In-Reply-To: <3e7d5472-9c40-456c-876e-c2e71fa0e8fa@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:gCh0CgAX31rQjxVq6kXSDg--.29133S3
X-Coremail-Antispam: 1UD129KBjvJXoW3GryrGr1ktFyxZFy5tw18Xwb_yoW7XF15pw
	4fJr4fJF1DWF13G34UXw1UXr45Ca1fGwn0gF1Utry0qr1avryUAF18Xw1xGFWjqrykWw48
	ur1j9FyjyF17ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRidbbtUUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/

Hi Vladimir,

On 2026/5/26 20:10, Vladimir Murzin wrote:
> Hi,
> 
> On 5/26/26 02:57, Zeng Heng wrote:
>> From: Tong Tiangen <tongtiangen@huawei.com>
>>
>> HiSilicon HIP09 implements TLB entry matching behavior that deviates
>> from the ARM architecture specification when the CNP (Common not Private)
>> bit is set in TTBRx_ELx.
>>
>> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
>> cores, leading to TLB conflicts and stale mappings. This affects
>> coherency and can result in incorrect translations.
>>
>> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
>> disable CNP on affected HIP09 cores.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
>> ---
>>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>   arch/arm64/Kconfig                          | 15 +++++++++++++++
>>   arch/arm64/kernel/cpu_errata.c              |  7 +++++++
>>   arch/arm64/kernel/cpufeature.c              |  3 ++-
>>   arch/arm64/tools/cpucaps                    |  1 +
>>   5 files changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index 211119ce7adc..cd50059edb85 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -284,6 +284,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> +| Hisilicon      | Hip09           | #162100125      | HISILICON_ERRATUM_162100125 |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index fe60738e5943..ed6207c75b54 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -1273,6 +1273,21 @@ config HISILICON_ERRATUM_162100801
>>   
>>   	  If unsure, say Y.
>>   
>> +config HISILICON_ERRATUM_162100125
>> +	bool "Hisilicon erratum 162100125"
>> +	default y
>> +	help
>> +	  On HiSilicon HIP09, TLB entry matching behavior when CNP
>> +	  (TTBRx.CNP=1) is enabled differs from the ARM architecture
>> +	  specification.
>> +
>> +	  TLB entries may be incorrectly shared between CPUs, potentially
>> +	  causing TLB conflicts and stale mappings.
>> +
>> +	  Disable CNP support for affected HiSilicon HIP09 cores.
>> +
>> +	  If unsure, say Y.
>> +
>>   config QCOM_FALKOR_ERRATUM_1003
>>   	bool "Falkor E1003: Incorrect translation due to ASID change"
>>   	default y
>> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
>> index 5377e4c2eba2..26d9677a20fc 100644
>> --- a/arch/arm64/kernel/cpu_errata.c
>> +++ b/arch/arm64/kernel/cpu_errata.c
>> @@ -968,6 +968,13 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>>   		.matches = has_impdef_pmuv3,
>>   		.cpu_enable = cpu_enable_impdef_pmuv3_traps,
>>   	},
>> +#ifdef CONFIG_HISILICON_ERRATUM_162100125
>> +	{
>> +		.desc = "Hisilicon erratum 162100125",
>> +		.capability = ARM64_WORKAROUND_HISILICON_ERRATUM_162100125,
>> +		ERRATA_MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
>> +	},
>> +#endif
>>   	{
>>   	}
>>   };
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 6d53bb15cf7b..c4b0db77a58a 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -1785,7 +1785,8 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
>>   	if (is_kdump_kernel())
>>   		return false;
>>   
>> -	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
>> +	if (cpus_have_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP) ||
>> +	    cpus_have_cap(ARM64_WORKAROUND_HISILICON_ERRATUM_162100125))
>>   		return false;
> 
> Since we now have a second user for this workaround, would it
> make sense to:
> 1. factor out the existing ARM64_WORKAROUND_NVIDIA_CARMEL_CNP into a common capability,
>     for example ARM64_WORKAROUND_DISABLE_CNP
> 2. wire up erratum 162100125 to use the common ARM64_WORKAROUND_DISABLE_CNP capability?
> 
> Cheers
> Vladimir
> 

This makes sense to me. Thanks for the reminder.

Best regards,
Zeng Heng

>>   
>>   	return has_cpuid_feature(entry, scope);
>> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
>> index 811c2479e82d..b797d4893adc 100644
>> --- a/arch/arm64/tools/cpucaps
>> +++ b/arch/arm64/tools/cpucaps
>> @@ -128,3 +128,4 @@ WORKAROUND_REPEAT_TLBI
>>   WORKAROUND_SPECULATIVE_AT
>>   WORKAROUND_SPECULATIVE_SSBS
>>   WORKAROUND_SPECULATIVE_UNPRIV_LOAD
>> +WORKAROUND_HISILICON_ERRATUM_162100125
>> -- 2.43.0
>>
> 
> 
> 

