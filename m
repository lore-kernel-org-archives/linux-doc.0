Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2EB63AFD1D;
	Thu, 16 Jul 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193341; cv=none; b=ifmKawsd20EXr/TvAdNl4DFONVhiFZzO2bM3l9+hgk3j4SnSGPWKYnyO9HrTR+J89Dml2rGbZSmbeb8S5qXq68m53KjkcHLSu9uEu6vM4nT4f2OPxCr4aPHZT7DTSq7WF6qc1UYDKxYUOcOBVZQxP5+q5iwRw077Dfd1WTd4/8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193341; c=relaxed/simple;
	bh=7anBZ6OTIpWSYxgyESTtKVaHR7bYEWhaSqqDb5JYirc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Psw1eu6/EmTPI+Iv25KgR1OXfRMPd5bAktokiGJhruBfW/PJ5JgrLtgvhrn7UcXvzKFI+YLfudbuk45w5OMQENqsbu/N9Fw8oP9Zd4sR0YLOagAgHBfJamLY0iSdZcCDyRKypJBzjNq/AafNUg/acHMOrV2QcMKfWZZLyOBkdQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fO+xBjQU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fO+xBjQU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93EAD2B;
	Thu, 16 Jul 2026 02:15:30 -0700 (PDT)
Received: from [10.1.34.162] (e121487-lin.cambridge.arm.com [10.1.34.162])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B49B3F905;
	Thu, 16 Jul 2026 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784193334; bh=7anBZ6OTIpWSYxgyESTtKVaHR7bYEWhaSqqDb5JYirc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fO+xBjQUYJt0icGfFgcYY9v5oS0N5QeP2oHRuyx22gghS5orEVA26k/D12G2atmU0
	 Ilyniy9a1Z7V5Z4O4fboWA9o8a/YgZXSlVb4I6dDd4XiSVgqY/Dapqhhdnsj+SfEJs
	 LWtecgW6SQmgV1adGC1RNh5HQ5iWB91hrxekM9BA=
Message-ID: <ce08c8f8-1cb8-4c35-8973-a242c1360184@arm.com>
Date: Thu, 16 Jul 2026 10:15:31 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: errata: work around NVIDIA Olympus device
 store/load ordering
To: Shanker Donthineni <sdonthineni@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Vikram Sethi <vsethi@nvidia.com>,
 Jason Sequeira <jsequeira@nvidia.com>
References: <20260715204856.3707449-1-sdonthineni@nvidia.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260715204856.3707449-1-sdonthineni@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/15/26 21:48, Shanker Donthineni wrote:
> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
> observed by a peripheral before an older, non-overlapping Device-nGnR*
> store to the same peripheral. This breaks the program-order guarantee
> that software expects for Device-nGnR* accesses and can leave a
> peripheral in an incorrect state.
> 
> The erratum can occur only when all of the following apply:
> 
>   - A PE executes a Device-nGnR* store followed by a younger
>     Device-nGnR* load.
>   - The store is not a store-release.
>   - The accesses target the same peripheral and do not overlap in bytes.
>   - There is at most one intervening Device-nGnR* store in program
>     order, and there are no intervening Device-nGnR* loads.
>   - There is no DSB or full DMB between the store and the load.
>   - Specific microarchitectural and timing conditions occur.
> 
> Insert a DMB OSH immediately before each raw MMIO load on affected CPUs.
> As a full barrier, DMB OSH orders the older Device store before the
> younger Device load and prevents the erroneous observation.
> 
> Add the barrier directly to the __raw_read*() helpers, independently of
> the existing device-load-acquire alternative. On affected CPUs this adds
> one DMB OSH per raw MMIO load, including each load used by
> memcpy_fromio(). On unaffected CPUs the alternative remains a NOP.
> 
> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Link: https://lore.kernel.org/all/akPQ8F3OgER621UP@willie-the-truck/
> ---
> Changes since v4:
>   - Reworked the workaround following Will Deacon's review: leave the raw
>     MMIO write helpers unchanged and insert a DMB OSH before raw MMIO loads.
>   - Use DMB OSH after hardware confirmation that it fixes T410-OLY-1027.
>   - Dropped the separate memcpy_fromio() optimization patch because the
>     benchmark showed no noticeable benefit over the per-load workaround.
>   - Updated the cpucap, Kconfig help text, and commit messages for the
>     load-side workaround.
> 
> Changes since v3:
>   - Split the workaround into two patches: the erratum fix (1/2) and the
>     arm64 memset_io()/memcpy_toio() block writers (2/2).
>   - Reworked the raw MMIO write helpers to use a direct base-register
>     str*/stlr* alternative sequence instead of a per-write static branch.
>   - Covered the write-combining __iowrite{32,64}_copy() path by patching
>     dgh() to dmb osh on affected CPUs, keeping the contiguous STR groups
>     and the ordering barrier outside the copy loop; the single-element
>     case now uses a plain str* as well.
>   - Added arm64 memset_io()/memcpy_toio() so the byte/word block writers
>     take one trailing dmb osh instead of a per-store store-release.
>   - Updated the commit messages to describe the offset-addressing
>     trade-off.
> 
> Changes since v2:
>   - Reworked the raw MMIO write helpers so unaffected CPUs keep the
>     existing offset-addressed STR sequence, while affected CPUs use the
>     base-register STLR path.
>   - Updated the commit message to match the code changes.
>   - Rebased on top of the arm64 for-next/errata branch:
>     https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata
> 
> Changes since v1:
>   - Updated the commit message based on feedback from Vladimir Murzin.
> 
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 22 +++++++++++++++++++++
>  arch/arm64/include/asm/io.h                 | 16 ++++++++++++----
>  arch/arm64/kernel/cpu_errata.c              |  8 ++++++++
>  arch/arm64/tools/cpucaps                    |  1 +
>  5 files changed, 45 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index ad04d1cdc0f0..c4137f89acef 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -298,6 +298,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 10c69474f276..73e3e68db161 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1363,6 +1363,28 @@ config NVIDIA_CARMEL_CNP_ERRATUM
>  
>  	  If unsure, say Y.
>  
> +config NVIDIA_OLYMPUS_1027_ERRATUM
> +	bool "NVIDIA Olympus: device store/load ordering erratum"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around an
> +	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
> +	  observed by a peripheral after a younger Device-nGnR* load to the
> +	  same peripheral. This breaks the program order that drivers rely
> +	  on for MMIO and can leave a device in an incorrect state.
> +
> +	  The workaround inserts a DMB OSH immediately before raw MMIO loads.
> +	  The erratum cannot occur when a DMB that orders loads appears
> +	  between the store and load, preventing the younger load from being
> +	  observed before the older store.
> +
> +	  The alternatives framework patches in DMB OSH only when an affected
> +	  CPU is detected. Other CPUs execute a NOP in its place. Disabling
> +	  this option leaves the original MMIO read instruction stream
> +	  unchanged.
> +
> +	  If unsure, say Y.
> +
>  config ROCKCHIP_ERRATUM_3568002
>  	bool "Rockchip 3568002: GIC600 can not access physical addresses higher than 4GB"
>  	default y
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 8cbd1e96fd50..6d6d54c1b74c 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -54,7 +54,9 @@ static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
>  static __always_inline u8 __raw_readb(const volatile void __iomem *addr)
>  {
>  	u8 val;
> -	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
> +	asm volatile(ALTERNATIVE("nop", "dmb osh",
> +				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
> +		     ALTERNATIVE("ldrb %w0, [%1]",
>  				 "ldarb %w0, [%1]",
>  				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
>  		     : "=r" (val) : "r" (addr));
> @@ -66,7 +68,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
>  {
>  	u16 val;
>  
> -	asm volatile(ALTERNATIVE("ldrh %w0, [%1]",
> +	asm volatile(ALTERNATIVE("nop", "dmb osh",
> +				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
> +		     ALTERNATIVE("ldrh %w0, [%1]",
>  				 "ldarh %w0, [%1]",
>  				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
>  		     : "=r" (val) : "r" (addr));
> @@ -77,7 +81,9 @@ static __always_inline u16 __raw_readw(const volatile void __iomem *addr)
>  static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
>  {
>  	u32 val;
> -	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
> +	asm volatile(ALTERNATIVE("nop", "dmb osh",
> +				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
> +		     ALTERNATIVE("ldr %w0, [%1]",
>  				 "ldar %w0, [%1]",
>  				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
>  		     : "=r" (val) : "r" (addr));
> @@ -88,7 +94,9 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
>  static __always_inline u64 __raw_readq(const volatile void __iomem *addr)
>  {
>  	u64 val;
> -	asm volatile(ALTERNATIVE("ldr %0, [%1]",
> +	asm volatile(ALTERNATIVE("nop", "dmb osh",
> +				 ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027)
> +		     ALTERNATIVE("ldr %0, [%1]",
>  				 "ldar %0, [%1]",
>  				 ARM64_WORKAROUND_DEVICE_LOAD_ACQUIRE)
>  		     : "=r" (val) : "r" (addr));
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index 4b0d5d932897..740ba3d51e30 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -839,6 +839,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
>  		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
>  	},
>  #endif
> +#ifdef CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM
> +	{
> +		/* NVIDIA Olympus core */
> +		.desc = "NVIDIA Olympus device store/load ordering erratum",
> +		.capability = ARM64_WORKAROUND_NVIDIA_OLYMPUS_1027,
> +		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> +	},
> +#endif
>  #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
>  	{
>  		/*
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 811c2479e82d..8d919b6699f0 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -121,6 +121,7 @@ WORKAROUND_CAVIUM_TX2_219_TVM
>  WORKAROUND_CLEAN_CACHE
>  WORKAROUND_DEVICE_LOAD_ACQUIRE
>  WORKAROUND_NVIDIA_CARMEL_CNP

Nitpick: this ^ line has changed recently, so patch might not apply

> +WORKAROUND_NVIDIA_OLYMPUS_1027
>  WORKAROUND_PMUV3_IMPDEF_TRAPS
>  WORKAROUND_QCOM_FALKOR_E1003
>  WORKAROUND_QCOM_ORYON_CNTVOFF
> -- 2.54.0.windows.1
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


Thanks
Vladimir


