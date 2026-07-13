Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF58A3E2AB6;
	Mon, 13 Jul 2026 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936668; cv=none; b=hWqM4hKU+ZxvyjoZ6MrK44l6smJ42mmUQk/3zacwJmZmk7Pst0HLK0JSfdf/Ueg1HqdKhydH/82MH7LnEMbjwnsG6iDuF+P7j/W5w7diHIsljSUIMCOXCyGm1uAKjCMPl29nMmXuoYQ8IPW1XyNJHYGKElB1x9d3IFPSST31r6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936668; c=relaxed/simple;
	bh=la3YNnos8fO30PpKphG30Z8QyQ2Elt6Z+LYql8V1iyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDBhxKZ+QywuVefpQ2sitsFz4zhyjGrfjA9iexurn8cCw3CjeOMVGDgLPs9B5aBUkVv5HA3GinNH5nVq5MKHgt9mJGBKfBcBe1R/8CxpP97AL0yZOFIjx7TwloXmbGBP7/r2ZjuiinEReFDSVbU/yR1FuIGzDcnWVl7V82sht7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfTueQg9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfTueQg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB261F00A3D;
	Mon, 13 Jul 2026 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783936662;
	bh=aBrXVBLeI2IEHvIvaOWKwyqAdMHFb6oga++/AXMhGxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hfTueQg900K2ypOWxlKMzGOIEgWSbJrvzJnxo3vCHRq+jA7KVhy3HOtmzQ5/GWEEl
	 lpyAc37NQF69qqd/vVEsM3k1mfO28ktyM9yxPIRjpREeBcMfMniJdMWENMEqn5taMN
	 k4ZenW3aSYUU6w3LQswfS7bPvbr41Zd8gC4HPSW3fQvxOvsEfjetms3C5rSp8zLC4L
	 bFF5zuM8pCjti4SLwujr2ti0l0Wo1NKFpbPj7bTodj8FCcZG4ZCtis+zBRNPZtislV
	 RS+8xBcr9nv0x9BOtuPHH1L1IrbTHSN3whtbtue3Dhc1o10q/sl0R/oeKDWJHa3omJ
	 OoloLUPtEuoQA==
Date: Mon, 13 Jul 2026 10:57:38 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Message-ID: <20260713-bulky-thistle-leopard-c66a18@sudeepholla>
References: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>

On Sat, Jul 11, 2026 at 09:35:25AM +0200, Yureka Lilian wrote:
> Overriding the idle mechanism might be useful for debugging and performance
> testing. Add a cmdline parameter for it, similar to the existing idle=
> parameter already present for the x86 and ppc architectures.
> 
> It is also useful on platforms where the WFI instruction misbehaves,
> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> be treated as an erratum and patched using the alternatives framework.
> However, in the Apple Silicon case we need more flexibility because it is
> difficult to detect whether the erratum applies. For example, Linux VMs
> inside macOS have the same MIDR and may even seem like they're running
> in EL2 in the case of NV, but should continue using WFI (it's trapped and
> handled correctly by the hypervisor there). Thus, we prefer to
> let the m1n1 bootloader add the idle=nop parameter[1].
> 
> Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
> Changes in v2:
> - Applied suggestions by Anshuman Khandual (Thanks!)
> - Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
>  arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
>  arch/arm64/kernel/idle.h                        | 13 +++++++++++
>  arch/arm64/lib/delay.c                          |  5 ++++-
>  4 files changed, 68 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b2d7d3540ded..d7f5471edf8f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2239,6 +2239,29 @@ Kernel parameters
>  
>  			idle=nomwait: Disable mwait for CPU C-states
>  
> +			[ARM64,EARLY]
> +			Format: idle=wfi, idle=yield, idle=nop
> +
> +			idle=wfi: Use the WFI (Wait For Interrupt) hint
> +			instruction in the idle loop. This is the default and
> +			allows the CPU to enter a low-power state until an
> +			interrupt arrives.

Just curious as when and why one would need to use idle=wfi if that is the
default behaviour. I am missing the need to have it.

> +
> +			idle=yield: Use the YIELD hint instruction instead of
> +			WFI. CPUs supporting simultaneous multi-threading (SMT),
> +			can continue executing another thread when the current
> +			thread reaches the idle loop. This will make the CPUs
> +			eat more power, but may be useful to get slightly better
> +			performance in some applications, since the CPUs will
> +			not enter a low-power state.
> +
> +			idle=nop: Do not execute any idle instruction in the
> +			idle loop. This is useful on platforms where WFI
> +			misbehaves, leading to system instability or loss of CPU
> +			state. This will make the CPUs eat more power, but may
> +			give slightly better performance in some applications,
> +			since the CPUs will not enter a low-power state.
> +
>  	idxd.sva=	[HW]
>  			Format: <bool>
>  			Allow force disabling of Shared Virtual Memory (SVA)
> diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
> index 05cfb347ec26..f161711a9954 100644
> --- a/arch/arm64/kernel/idle.c
> +++ b/arch/arm64/kernel/idle.c
> @@ -11,6 +11,27 @@
>  #include <asm/cpufeature.h>
>  #include <asm/sysreg.h>
>  
> +#include "idle.h"
> +
> +enum arm64_idle_mode idle = ARM64_IDLE_WFI;
> +
> +static int __init setup_idle(char *arg)
> +{
> +	if (!arg)
> +		return -1;
> +	else if (!strcmp(arg, "wfi"))
> +		idle = ARM64_IDLE_WFI;
> +	else if (!strcmp(arg, "yield"))
> +		idle = ARM64_IDLE_YIELD;
> +	else if (!strcmp(arg, "nop"))
> +		idle = ARM64_IDLE_NOP;
> +	else
> +		return -1;
> +
> +	return 0;
> +}
> +early_param("idle", setup_idle);
> +
>  /*
>   *	cpu_do_idle()
>   *
> @@ -26,8 +47,13 @@ void __cpuidle cpu_do_idle(void)
>  
>  	arm_cpuidle_save_irq_context(&context);
>  
> -	dsb(sy);
> -	wfi();
> +	if (likely(idle == ARM64_IDLE_WFI)) {
> +		dsb(sy);
> +		wfi();
> +	} else if (idle == ARM64_IDLE_YIELD) {
> +		dsb(sy);
> +		asm volatile("yield" ::: "memory");
> +	}
>  
>  	arm_cpuidle_restore_irq_context(&context);


If WFI is replaced by NOP or YIELD, do we really need to save/restore
IRQ context used for pseudo-NMIs which may add some overhead ?

-- 
Regards,
Sudeep
