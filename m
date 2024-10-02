Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34A8612C49C
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 09:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862323; cv=none; b=c+2JFv2wFAbATWW/R2GEWVsg2RWKcWGiTv1cZI6QqLMT7eJPPYlahVxmKkZ61V9S8NACinQrD1ITs6u9HDryLAVkPMGa1O/U4Rkc4KZpX2dcIb5xIB7LsvhlwU7Yo+3BzytUjR6L30AasZY5YqZv2HCUFYMpPsD9z6q5SO3nRJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862323; c=relaxed/simple;
	bh=8xR0KoSf45qMLZqBdxsH3HoxXXB1L2eTP/TZvRU9r0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hgbwxr0cOVXXpnS3B1MD7Rzp745Ly3cVi3hPi0fSWY0xy1U8LnKxPQCB5K55N6eNUNhxmAwB6GcJDfG1Qq7oW6lhhYLZixG+iwuxV89rdGfpGA3XE8l9Gg8aBQeQYmAV37DvuJO56WA9VpQmKvTuc2H4lNGxuDIjqUEBP0k2iLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0974C339;
	Wed,  2 Oct 2024 02:45:50 -0700 (PDT)
Received: from [10.57.76.89] (unknown [10.57.76.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F5EC3F64C;
	Wed,  2 Oct 2024 02:45:18 -0700 (PDT)
Message-ID: <ea7eacbb-928e-4b71-b50f-9a5d2930424c@arm.com>
Date: Wed, 2 Oct 2024 11:45:16 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] arm64: set POR_EL0 for kernel threads
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, corbet@lwn.net, will@kernel.org,
 linux-doc@vger.kernel.org
References: <20241001133618.1547996-1-joey.gouly@arm.com>
 <20241001133618.1547996-2-joey.gouly@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20241001133618.1547996-2-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/2024 15:36, Joey Gouly wrote:
> Restrict kernel threads to only have RWX overlays for pkey 0.  This matches
> what arch/x86 does, by defaulting to a restrictive PKRU.
>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> ---
>  arch/arm64/kernel/process.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 0540653fbf38..94f42df249e3 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -410,6 +410,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>  		memset(childregs, 0, sizeof(struct pt_regs));
>  		childregs->pstate = PSR_MODE_EL1h | PSR_IL_BIT;
>  
> +		if (system_supports_poe())
> +			p->thread.por_el0 = POR_EL0_INIT;

Nit: I'd expect this to be done after all the unconditional assignments,
i.e. after setting x19/x20.

Otherwise:

Reviewed-by: Kevin Brodsky <Kevin.Brodsky@arm.com>

Kevin

> +
>  		p->thread.cpu_context.x19 = (unsigned long)args->fn;
>  		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
>  	}

