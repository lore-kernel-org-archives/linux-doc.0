Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BCC3E5EE7;
	Wed, 10 Jun 2026 10:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781085620; cv=none; b=C9XY7pRX4Xlj8zKbsf5js8trt8Co6+ocTl9WkBAbO2kMBLsUkzh1zAU26WHTtuqDepAfc7uVEw6RD3o0SyrHGkKVt7QVilosz+zu649kzhP0blwIheAm2lHovr36/jhGcNb3hZ/JuzUKzc6npzZQSwCHSoTOk4y6+SwiGhGh57c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781085620; c=relaxed/simple;
	bh=U2i/BzqvOeDZaVsXMtMz/mBhJTdVMdg3yMk1ZEcMUKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fg7j4/DivoxQLvR44cYTDkK9Zl2mQtdTL/uLhIh13CJAjPnSbMkEx8DeuCVVk+tKxOMAlXID92sBFlyunyRrY9z9ONfRT3mide0YGGhjS5G9lrJb5kASQ8ujakQrbTcVRJSMzqKZSASTpBFCIPIMlmxrujxk3eJLXxFxeK0i7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=awfoF/IU; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="awfoF/IU"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56D9625E3;
	Wed, 10 Jun 2026 03:00:12 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28C9E3FDE2;
	Wed, 10 Jun 2026 03:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781085617; bh=U2i/BzqvOeDZaVsXMtMz/mBhJTdVMdg3yMk1ZEcMUKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awfoF/IUr5HdAybfH+nRjakt4TUakG4zQraI/8G05d6OVdbsA1VRTQG6tMuk1mmbW
	 rpMLhnpNYDG1vDF1h7K/9B60q6xKXfeaUZOMRBUfOWByxCBwQWkddeqNnm7LB73Vnq
	 igCUjDizuohrFWBWhFUgkpf14BaCN7n59D8OENOU=
Date: Wed, 10 Jun 2026 11:00:03 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>,
	Jason Sequeira <jsequeira@nvidia.com>,
	Alok Mooley <amooley@nvidia.com>, Rich Wiley <rwiley@nvidia.com>
Subject: Re: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus
 CPU
Message-ID: <aik1owW9Rz8B7rEz@J2N7QTR9R3>
References: <20260609234044.3945938-1-sdonthineni@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609234044.3945938-1-sdonthineni@nvidia.com>

On Tue, Jun 09, 2026 at 06:40:44PM -0500, Shanker Donthineni wrote:
> NVIDIA Olympus cores are affected by the TLBI completion issue tracked as
> CVE-2025-10263. The existing ARM64_ERRATUM_4118414 handling already uses
> ARM64_WORKAROUND_REPEAT_TLBI to issue an additional broadcast TLBI;DSB
> sequence and ensure affected memory write effects are globally observed.
> 
> Add MIDR_NVIDIA_OLYMPUS to the repeat-TLBI match list so the same
> mitigation is enabled on affected Olympus systems. Also document the
> NVIDIA Olympus erratum in the arm64 silicon errata table and list it in
> the Kconfig help text.
> 
> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
> Note: This patch depends on the following series as a prerequisite:
> https://lore.kernel.org/all/20260609101203.1512409-1-mark.rutland@arm.com/

FWIW:

Acked-by: Mark Rutland <mark.rutland@arm.com>

I'll keep note of this when backporting the other patches; as a
prerequisite we'll also need to pick commit

  e185c8a0d842 ("arm64: cputype: Add NVIDIA Olympus definitions")

I have one minor comment below, but that's more for Catalin/Will, and
doesn't require a respin.

>  Documentation/arch/arm64/silicon-errata.rst | 2 ++
>  arch/arm64/Kconfig                          | 3 ++-
>  arch/arm64/kernel/cpu_errata.c              | 1 +
>  3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index a01e916ede17..ad09bbb10da8 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -298,6 +298,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 48233b54c482..c65cef81be86 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1155,7 +1155,7 @@ config ARM64_ERRATUM_4193714
>  	  If unsure, say Y.
>  
>  config ARM64_ERRATUM_4118414
> -	bool "Cortex-*/Neoverse-*/C1-*: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"
> +	bool "Cortex-*/Neoverse-*/C1-*/Olympus: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

As this is getting increasingly long, maybe it's worth reducing this to
"Various" in the title, i.e.

	bool "Cortex-*/Neoverse: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"

... but as above, no need to respin for that.

Mark.

>  	default y
>  	select ARM64_WORKAROUND_REPEAT_TLBI
>  	help
> @@ -1182,6 +1182,7 @@ config ARM64_ERRATUM_4118414
>  	  * ARM Neoverse-V2 erratum 4193787
>  	  * ARM Neoverse-V3 erratum 4193784
>  	  * ARM Neoverse-V3AE erratum 4193784
> +	  * NVIDIA Olympus erratum T410-OLY-1029
>  
>  	  On affected cores, some memory accesses might not be completed by
>  	  broadcast TLB invalidation.
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index fe6fe5de495b..d597896b0f7f 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -364,6 +364,7 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
> +			MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
>  			{}
>  		})),
>  	},
> -- 
> 2.43.0
> 
