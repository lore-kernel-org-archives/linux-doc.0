Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076372248A8;
	Tue,  2 Jun 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392252; cv=none; b=KBpEAZW4iJYZwlosl/zRFo0Ato27nqzpaRY9WZyQc0m9U8ct9t+C3BN//L9QNunb/AeuqvtpVMfcm90siVRuKIqwVJK/Y2vmsC2SeA43NxKJjl2EOZnWFLW8m38p0WMc69WrYfTs73H63PrEZuX3H7uFAAaHZrYMEYpTrEakw1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392252; c=relaxed/simple;
	bh=kURsakSarcl//H2lXUzaloTxQoTNSvHm76NHoueoSPA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MeXdptZVfZ/j0FTTRKH/0YHF+thNyOFDdG37C2jaNZZlNEtfC0Ws5Qr4qy3VwZtCP+kLvBfCRRTEwghJZZM4cIQSv86MWulRpj+XFT8qdRQUFDbak4Bulcb0qhwvxnJbucw9JG3A0D34IADoN56X3E/SuweKVKm1mvYMcDHw2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UgQP5zO7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UgQP5zO7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B80176C;
	Tue,  2 Jun 2026 02:24:05 -0700 (PDT)
Received: from [10.1.25.162] (e121487-lin.cambridge.arm.com [10.1.25.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A82D3F7D8;
	Tue,  2 Jun 2026 02:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780392250; bh=kURsakSarcl//H2lXUzaloTxQoTNSvHm76NHoueoSPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UgQP5zO7KBi6zVGpIAGZ1VsGduXv8Mu5uoHno/xmOJn2v8gh1qYsu1ECLNUhHrATt
	 BZsiNBQEtc/CN54Pxd1hACgHSB8jaE2VcuN/mCtI5+bGMjZ1tdwka+taPxXpBGUttH
	 EzhSzh8WYnXyxvpv5RaT8z7SFnbvAPPt1pPRV7UU=
Message-ID: <0b4cae62-bb4a-4b2c-af4e-0f9d7077961a@arm.com>
Date: Tue, 2 Jun 2026 10:24:03 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
To: Zeng Heng <zengheng@huaweicloud.com>, xuwei5@huawei.com,
 wangyushan12@huawei.com, yangyicong@hisilicon.com, maz@kernel.org,
 yeoreum.yun@arm.com, miko.lenczewski@arm.com, james.clark@linaro.org,
 corbet@lwn.net, skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
 lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
 lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
 tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
 mark.rutland@arm.com, will@kernel.org, Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260601112000.1145391-3-zengheng@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/1/26 12:20, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> HiSilicon HIP09 implements TLB entry matching behavior that deviates
> from the ARM architecture specification when the CNP (Common not Private)
> bit is set in TTBRx_ELx.
> 
> When TTBRx.CNP=1, TLB entries may be incorrectly shared between CPU
> cores, leading to TLB conflicts and stale mappings. This affects
> coherency and can result in incorrect translations.
> 
> Add the hardware erratum workaround (Hisilicon erratum 162100125) to
> disable CNP on affected HIP09 cores.
> 
> Co-developed-by: Tong Tiangen <tongtiangen@huawei.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> Signed-off-by: Zeng Heng <zengheng4@huawei.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 16 ++++++++++++++++
>  arch/arm64/kernel/cpu_errata.c              | 13 ++++++++++---
>  3 files changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index 211119ce7adc..cd50059edb85 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -284,6 +284,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Hisilicon      | Hip09           | #162100801      | HISILICON_ERRATUM_162100801 |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| Hisilicon      | Hip09           | #162100125      | HISILICON_ERRATUM_162100125 |
> ++----------------+-----------------+-----------------+-----------------------------+
>  +----------------+-----------------+-----------------+-----------------------------+
>  | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
>  +----------------+-----------------+-----------------+-----------------------------+
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index f297517a83b9..75638e37883d 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1273,6 +1273,22 @@ config HISILICON_ERRATUM_162100801
> 
>  	  If unsure, say Y.
> 
> +config HISILICON_ERRATUM_162100125
> +	bool "Hisilicon erratum 162100125"
> +	default y
> +	select ARM64_WORKAROUND_DISABLE_CNP
> +	help
> +	  On HiSilicon HIP09, TLB entry matching behavior when CNP
> +	  (TTBRx.CNP=1) is enabled differs from the ARM architecture
> +	  specification.
> +
> +	  TLB entries may be incorrectly shared between CPUs, potentially
> +	  causing TLB conflicts and stale mappings.
> +
> +	  Disable CNP support for affected HiSilicon HIP09 cores.
> +
> +	  If unsure, say Y.
> +
>  config QCOM_FALKOR_ERRATUM_1003
>  	bool "Falkor E1003: Incorrect translation due to ASID change"
>  	default y
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index b0db946568b7..02e0ee5c948c 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>  };
>  #endif
> 
> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
> +static const struct midr_range cnp_erratum_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
> +	{},
> +};
> +#endif
> +
>  const struct arm64_cpu_capabilities arm64_errata[] = {
>  #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
>  	{
> @@ -803,10 +811,9 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  #endif
>  #ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
>  	{
> -		/* NVIDIA Carmel */
> -		.desc = "NVIDIA Carmel CNP erratum",
> +		.desc = "NVIDIA Carmel CNP erratum, or Hisilicon erratum 162100125",
>  		.capability = ARM64_WORKAROUND_DISABLE_CNP,
> -		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +		ERRATA_MIDR_RANGE_LIST(cnp_erratum_cpus),
>  	},
>  #endif
>  #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
> --
> 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

