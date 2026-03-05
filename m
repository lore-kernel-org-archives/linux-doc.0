Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD178346773;
	Thu,  5 Mar 2026 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750315; cv=none; b=KsxBusu1bYukiQI4WED6egxN06piD11kdFpuoe8W/Ta8fr1GBdL2g0WwGd3ZZ4c3/A/FCQtUY5DjVTtNXGM9JbF7wbZkHTUH9YK+6UmaFub7mzROPG911GyWheUmpEQL6YA04x/y188nb3BhIdnhv0ueiloBhhI3L6tvSAbYPDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750315; c=relaxed/simple;
	bh=QGmHinNNoLt5w+YZr0UA0v3wKoT58gdyCxpDy4CoYv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCnNZJloh0dPZ+O2KBqeGl+RJrsnQmOAXmar1sunxLHJ0ZMl0QOswODX9MtsY25m0NjP1N/Vu0f8W5d8OhqNY5JnndhD1nDhmQHgeQLk0eoD0f2skGmZ1HQwTts8qysCwgZwBESmxP+rG0HfqydoavOeF1HUXdgbUCBJW9iRQ/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=VmWVmPRZ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="VmWVmPRZ"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625Macwn4023766
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 14:36:50 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625Macwn4023766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772750211;
	bh=M/G/iKOcUA4PAAfxc3jXEcQc2rLKz3x4cVp/HmOQlrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VmWVmPRZ+15cdol2cT0W03HWllcw0w6hbwPCwjXe29I6vXBpl/A6mh121U3xPfc+/
	 eSnSznrrszqNEank2RprBmoH8jdoDlndd+OW3jzvDRRpWnvoGjSBgGQH/dnMGTSuIU
	 P7FMujPvCd91mEluocy6+h+1qS/unyMUb7aYGp3QhMoFWghfETFbdl3e9ncmQaVQ85
	 RTsxoMhXKakt61cZQUaaTrg3ugkd+Xt8Pt7ATTdCfq2D9dGaZEfgDx+fOlxb0QPGCy
	 h4XN5WF+JdRYtWBrM6GqD5fmlDybAOK9Ngxwux1c4+FZWxoe7rk24cidE/DayY+cci
	 momKJNmSKarug==
Message-ID: <2074c00d-2e73-4bd9-89d2-7b0a015b134e@zytor.com>
Date: Thu, 5 Mar 2026 14:36:33 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/vsyscall: Reorganize the page fault emulation
 code
To: Sohil Mehta <sohil.mehta@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Kiryl Shutsemau <kas@kernel.org>,
        Brendan Jackman <jackmanb@google.com>,
        Sean Christopherson <seanjc@google.com>,
        Nam Cao <namcao@linutronix.de>, Cedric Xing <cedric.xing@intel.com>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Tony Luck <tony.luck@intel.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maciej Wieczor-Retman <m.wieczorretman@pm.me>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260305214026.3887452-1-sohil.mehta@intel.com>
 <20260305214026.3887452-2-sohil.mehta@intel.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305214026.3887452-2-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-05 13:40, Sohil Mehta wrote:
> With LASS, vsyscall page accesses will cause a #GP instead of a #PF.
> Separate out the core vsyscall emulation code from the #PF specific
> handling in preparation for the upcoming #GP emulation.
> 
> No functional change intended.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> v2:
>  - No change
> ---
>  arch/x86/entry/vsyscall/vsyscall_64.c | 64 ++++++++++++++-------------
>  arch/x86/include/asm/vsyscall.h       |  7 ++-
>  arch/x86/mm/fault.c                   |  2 +-
>  3 files changed, 37 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
> index 4bd1e271bb22..5c6559c37c5b 100644
> --- a/arch/x86/entry/vsyscall/vsyscall_64.c
> +++ b/arch/x86/entry/vsyscall/vsyscall_64.c
> @@ -111,43 +111,13 @@ static bool write_ok_or_segv(unsigned long ptr, size_t size)
>  	}
>  }
>  
> -bool emulate_vsyscall(unsigned long error_code,
> -		      struct pt_regs *regs, unsigned long address)
> +static bool __emulate_vsyscall(struct pt_regs *regs, unsigned long address)
>  {
>  	unsigned long caller;
>  	int vsyscall_nr, syscall_nr, tmp;
>  	long ret;
>  	unsigned long orig_dx;
>  
> -	/* Write faults or kernel-privilege faults never get fixed up. */
> -	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
> -		return false;
> -
> -	/*
> -	 * Assume that faults at regs->ip are because of an
> -	 * instruction fetch. Return early and avoid
> -	 * emulation for faults during data accesses:
> -	 */
> -	if (address != regs->ip) {
> -		/* Failed vsyscall read */
> -		if (vsyscall_mode == EMULATE)
> -			return false;
> -
> -		/*
> -		 * User code tried and failed to read the vsyscall page.
> -		 */
> -		warn_bad_vsyscall(KERN_INFO, regs, "vsyscall read attempt denied -- look up the vsyscall kernel parameter if you need a workaround");
> -		return false;
> -	}
> -
> -	/*
> -	 * X86_PF_INSTR is only set when NX is supported.  When
> -	 * available, use it to double-check that the emulation code
> -	 * is only being used for instruction fetches:
> -	 */
> -	if (cpu_feature_enabled(X86_FEATURE_NX))
> -		WARN_ON_ONCE(!(error_code & X86_PF_INSTR));
> -
>  	/*
>  	 * No point in checking CS -- the only way to get here is a user mode
>  	 * trap to a high address, which means that we're in 64-bit user code.
> @@ -280,6 +250,38 @@ bool emulate_vsyscall(unsigned long error_code,
>  	return true;
>  }
>  
> +bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs,
> +			 unsigned long address)
> +{
> +	/* Write faults or kernel-privilege faults never get fixed up. */
> +	if ((error_code & (X86_PF_WRITE | X86_PF_USER)) != X86_PF_USER)
> +		return false;


I think this can be tightened further.  If X86_PF_PK, X86_PF_SHSTK or
X86_PF_RSVD are set we should definitely not try to do any emulation, and I
believe the same is true for X86_PF_SGX or X86_PF_RMP; I'm not 100% as I don't
have the semantics of those bits in my head at the moment.

> +	/*
> +	 * Assume that faults at regs->ip are because of an instruction
> +	 * fetch. Return early and avoid emulation for faults during
> +	 * data accesses:
> +	 */
> +	if (address != regs->ip) {
> +		 /* User code tried and failed to read the vsyscall page. */
> +		if (vsyscall_mode != EMULATE)
> +			warn_bad_vsyscall(KERN_INFO, regs,
> +					  "vsyscall read attempt denied -- look up the vsyscall kernel parameter if you need a workaround");
> +
> +		return false;
> +	}
> +

I don't really like the reshuffling of the code here.

> +	/*
> +	 * X86_PF_INSTR is only set when NX is supported.  When
> +	 * available, use it to double-check that the emulation code
> +	 * is only being used for instruction fetches:
> +	 */
> +	if (cpu_feature_enabled(X86_FEATURE_NX))
> +		WARN_ON_ONCE(!(error_code & X86_PF_INSTR));
> +

I realize this is the same as the previous code, but I really think this
should have a "return false;" in it as well.

> +	return __emulate_vsyscall(regs, address);
> +}
> +
>  /*
>   * A pseudo VMA to allow ptrace access for the vsyscall page.  This only
>   * covers the 64bit vsyscall page now. 32bit has a real VMA now and does
> diff --git a/arch/x86/include/asm/vsyscall.h b/arch/x86/include/asm/vsyscall.h
> index 472f0263dbc6..f34902364972 100644
> --- a/arch/x86/include/asm/vsyscall.h
> +++ b/arch/x86/include/asm/vsyscall.h
> @@ -14,12 +14,11 @@ extern void set_vsyscall_pgtable_user_bits(pgd_t *root);
>   * Called on instruction fetch fault in vsyscall page.
>   * Returns true if handled.
>   */
> -extern bool emulate_vsyscall(unsigned long error_code,
> -			     struct pt_regs *regs, unsigned long address);
> +bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs, unsigned long address);
>  #else
>  static inline void map_vsyscall(void) {}
> -static inline bool emulate_vsyscall(unsigned long error_code,
> -				    struct pt_regs *regs, unsigned long address)
> +static inline bool emulate_vsyscall_pf(unsigned long error_code,
> +				       struct pt_regs *regs, unsigned long address)
>  {
>  	return false;
>  }
> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index b83a06739b51..f0e77e084482 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -1314,7 +1314,7 @@ void do_user_addr_fault(struct pt_regs *regs,
>  	 * to consider the PF_PK bit.
>  	 */
>  	if (is_vsyscall_vaddr(address)) {
> -		if (emulate_vsyscall(error_code, regs, address))
> +		if (emulate_vsyscall_pf(error_code, regs, address))
>  			return;
>  	}
>  #endif


Other than the above minor nitpicks, looks good to me.

Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>

