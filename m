Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C70F366043;
	Thu,  5 Mar 2026 23:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772752695; cv=none; b=qhY9B1ePxk+TekIoaigIvBrcN6OroOzq+uxh/Cx5tHt/OSVlO5GTZaYsecc7vkEuC7yYN+T6Io/VaTwfYoyWkLGdjfytxhxqH3QDC3lguAXOIxcTFhwdQ7DzC+h9d/ulJ8F2ficA1HSJKFDyWRoBLAS3vFc2cPnuKuOprk8Ro1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772752695; c=relaxed/simple;
	bh=NRe5SxlQmfuV+FT3Qn+JDIdyoBHSSd5ZOmTifbSFqzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DGxlqlumMB56zuMLD363OrgfPKyNf/d7iQzVhEQpcROoGQE2R0+8eKEPt6KNs+3JA6pQO8AP6hOShubg3l+JEVdEh3cCE2Da6IgqlxieM9zgeVmIfv07E34UqThFZv0cxBIt4DG2FYuwPPz4Ea8UY3CTXSKAKxZYeIkkEjmVPsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=esXiOeWq; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="esXiOeWq"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625MjSjf4038010
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 14:45:34 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625MjSjf4038010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772750739;
	bh=QG866fBkY0ZnxCOc+cBgWHy9UMsZa1nYrHc16jg5Tew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=esXiOeWqjfNFHGo3pQKjaiJxtPy5zx1wXYY8ajZjjgfY6R1UfNc4fu2me9TJPSezf
	 la/c/ase0urh9PZag2OK8odjKrQmEVrqauY0zPcC/pBkvFYiGKa70eH/WOq2+y9wd4
	 Bgbk8YZm8vHi+6wQoD2qcgK4s2feTvLVfRzi5SvqXGTrFWK3BhRkPcsmXUXBGYDBn2
	 SpPdoij5iUuQxQe0fMOC+HiEMM/EjNB6sXCpjILCqMTRlYd+vKeWFRVFAdgbd/gPiw
	 KO1cI4nb3zXj2Nl+mLH06e3iLhbqhMEQdS9bxR4a2ldcfymKs7hWTlJe7x5XMQ8V9L
	 GaGsAih/kruHw==
Message-ID: <7b379620-07a7-4af6-b95f-c2011d2e456d@zytor.com>
Date: Thu, 5 Mar 2026 14:45:22 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/vsyscall: Restore vsyscall=xonly mode under
 LASS
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
 <20260305214026.3887452-4-sohil.mehta@intel.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305214026.3887452-4-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-05 13:40, Sohil Mehta wrote:
> Background
> ==========
> The vsyscall page is located in the high/kernel part of the address
> space. Prior to LASS, a vsyscall page access from userspace would always
> generate a #PF. The kernel emulates the accesses in the #PF handler and
> returns the appropriate values to userspace.
> 
> Vsyscall emulation has two modes of operation, specified by the
> vsyscall={xonly, emulate} kernel command line option. The vsyscall page
> behaves as execute-only in XONLY mode or read-execute in EMULATE mode.
> XONLY mode is the default and the only one expected to be commonly used.
> The EMULATE mode has been deprecated since 2022 and is considered
> insecure.
> 
> With LASS, a vsyscall page access triggers a #GP instead of a #PF.
> Currently, LASS is only enabled when all vsyscall modes are disabled.
> 
> LASS with XONLY mode
> ====================
> Now add support for LASS specifically with XONLY vsyscall emulation. For
> XONLY mode, all that is needed is the faulting RIP, which is trivially
> available regardless of the type of fault. Reuse the #PF emulation code
> during the #GP when the fault address points to the vsyscall page.
> 
> As multiple fault handlers will now be using the emulation code, add a
> sanity check to ensure that the fault truly happened in 64-bit user
> mode.
> 
> LASS with EMULATE mode
> ======================
> Supporting vsyscall=emulate with LASS is much harder because the #GP
> doesn't provide enough error information (such as PFEC and CR2 as in
> case of a #PF). So, complex instruction decoding would be required to
> emulate this mode in the #GP handler.
> 
> This isn't worth the effort as remaining users of EMULATE mode can be
> reasonably assumed to be niche users, who are already trading off
> security for compatibility. LASS and vsyscall=emulate will be kept
> mutually exclusive for simplicity.
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---
> v2:
>  - Rewrote the commit message
> ---
>  arch/x86/entry/vsyscall/vsyscall_64.c | 22 +++++++++++++++++-----
>  arch/x86/include/asm/vsyscall.h       |  6 ++++++
>  arch/x86/kernel/traps.c               |  4 ++++
>  3 files changed, 27 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/entry/vsyscall/vsyscall_64.c b/arch/x86/entry/vsyscall/vsyscall_64.c
> index 5c6559c37c5b..b34c8763d5e9 100644
> --- a/arch/x86/entry/vsyscall/vsyscall_64.c
> +++ b/arch/x86/entry/vsyscall/vsyscall_64.c
> @@ -23,7 +23,7 @@
>   * soon be no new userspace code that will ever use a vsyscall.
>   *
>   * The code in this file emulates vsyscalls when notified of a page
> - * fault to a vsyscall address.
> + * fault or a general protection fault to a vsyscall address.
>   */
>  
>  #include <linux/kernel.h>
> @@ -118,10 +118,9 @@ static bool __emulate_vsyscall(struct pt_regs *regs, unsigned long address)
>  	long ret;
>  	unsigned long orig_dx;
>  
> -	/*
> -	 * No point in checking CS -- the only way to get here is a user mode
> -	 * trap to a high address, which means that we're in 64-bit user code.
> -	 */
> +	/* Confirm that the fault happened in 64-bit user mode */
> +	if (!user_64bit_mode(regs))
> +		return false;
>  
>  	if (vsyscall_mode == NONE) {
>  		warn_bad_vsyscall(KERN_INFO, regs,
> @@ -282,6 +281,19 @@ bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs,
>  	return __emulate_vsyscall(regs, address);
>  }
>  
> +bool emulate_vsyscall_gp(struct pt_regs *regs)
> +{
> +	/* Without LASS, vsyscall accesses are expected to generate a #PF */
> +	if (!cpu_feature_enabled(X86_FEATURE_LASS))
> +		return false;
> +
> +	/* Emulate only if the RIP points to the vsyscall address */
> +	if (!is_vsyscall_vaddr(regs->ip))
> +		return false;
> +
> +	return __emulate_vsyscall(regs, regs->ip);
> +}
> +
>  /*
>   * A pseudo VMA to allow ptrace access for the vsyscall page.  This only
>   * covers the 64bit vsyscall page now. 32bit has a real VMA now and does
> diff --git a/arch/x86/include/asm/vsyscall.h b/arch/x86/include/asm/vsyscall.h
> index f34902364972..538053b1656a 100644
> --- a/arch/x86/include/asm/vsyscall.h
> +++ b/arch/x86/include/asm/vsyscall.h
> @@ -15,6 +15,7 @@ extern void set_vsyscall_pgtable_user_bits(pgd_t *root);
>   * Returns true if handled.
>   */
>  bool emulate_vsyscall_pf(unsigned long error_code, struct pt_regs *regs, unsigned long address);
> +bool emulate_vsyscall_gp(struct pt_regs *regs);
>  #else
>  static inline void map_vsyscall(void) {}
>  static inline bool emulate_vsyscall_pf(unsigned long error_code,
> @@ -22,6 +23,11 @@ static inline bool emulate_vsyscall_pf(unsigned long error_code,
>  {
>  	return false;
>  }
> +
> +static inline bool emulate_vsyscall_gp(struct pt_regs *regs)
> +{
> +	return false;
> +}
>  #endif
>  
>  /*
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 614a281bd419..0ca3912ecb7f 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -70,6 +70,7 @@
>  #include <asm/tdx.h>
>  #include <asm/cfi.h>
>  #include <asm/msr.h>
> +#include <asm/vsyscall.h>
>  
>  #ifdef CONFIG_X86_64
>  #include <asm/x86_init.h>
> @@ -938,6 +939,9 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
>  		if (fixup_umip_exception(regs))
>  			goto exit;
>  
> +		if (emulate_vsyscall_gp(regs))
> +			goto exit;
> +
>  		gp_user_force_sig_segv(regs, X86_TRAP_GP, error_code, desc);
>  		goto exit;
>  	}

Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>

