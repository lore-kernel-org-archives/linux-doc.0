Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C511F5E7
	for <linux-doc@vger.kernel.org>; Fri, 27 Oct 2023 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="YKt6CdsI"
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E575BAC;
	Fri, 27 Oct 2023 08:32:39 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7920340E0171;
	Fri, 27 Oct 2023 15:32:37 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id jDJHrcOMWMIw; Fri, 27 Oct 2023 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1698420755; bh=3t32flAh5iWCBkUsdkD01v2UC4zK48deLLcRD6aOnbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKt6CdsI3PO1lX5N1mjnjjZSCJzMnDHyOgAny2v0TiCXURnvA3grQFg4ToXVP9lFm
	 rtLWYY0ZYIHMel93V4hJ/VgClXAtkmiWmVeEqy2TOLXylPe3Ew+Sv9C159d/HNLyCI
	 aUOUkJpIOOg37e+BFWqoeCYNgpOIFoYjf2pNpsX7AuquWdwGqpDVMvWXgOQrEC9485
	 wYa4nIiLei13lqfmjkb7zt5jmSbV7Gs8FAsbfHkpTEsE9j6SmLiZlwZuQVWlUZ2pkT
	 YYOn+oAmBQEacOnhYIYOaqhlCloOaZVGDoSJLflWQvAC0T0d8sD9rO95YQe5RyX+jz
	 aLB/owHRzjFNrqsmL5W4Zd7DcCNCEB84Xl1MtFFbM+MQqPOXyYaSspQ/i6/003cQ0G
	 lM8rFo93buBRR3osQ/9y3eQljKsth+RkEmtSCRqoUH1oJmYH75+R9lhaWWa7jCDNF3
	 AA72GoFOefMhDcgbphON0OFJlG7WfiegKw1iDKwTLcQGH7t0QrJ7csZ/rprLu7f54D
	 i5BElC++CHuaemJoKoDLbdeSfjhLP2n0mU7wGCf/ysZiUt4CucQ4G5is5OwrGEESae
	 av3BsHlxz+lZouQl378TovzqyGol621tBo1FppjQAlr/b3pmW1etHjspbV9MOkVJ29
	 H52Jj8z5domk9d3H6EcQ5mqI=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1F5A940E018F;
	Fri, 27 Oct 2023 15:32:10 +0000 (UTC)
Date: Fri, 27 Oct 2023 17:32:03 +0200
From: Borislav Petkov <bp@alien8.de>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Andy Lutomirski <luto@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>, tony.luck@intel.com,
	ak@linux.intel.com, tim.c.chen@linux.intel.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Nikolay Borisov <nik.borisov@suse.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	Alyssa Milburn <alyssa.milburn@linux.intel.com>,
	Daniel Sneddon <daniel.sneddon@linux.intel.com>,
	antonio.gomez.iglesias@linux.intel.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alyssa Milburn <alyssa.milburn@intel.com>
Subject: Re: [PATCH  v4 1/6] x86/bugs: Add asm helpers for executing VERW
Message-ID: <20231027153203.GJZTvX84mr+63lVWIH@fat_crate.local>
References: <20231027-delay-verw-v4-0-9a3622d4bcf7@linux.intel.com>
 <20231027-delay-verw-v4-1-9a3622d4bcf7@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231027-delay-verw-v4-1-9a3622d4bcf7@linux.intel.com>

On Fri, Oct 27, 2023 at 07:38:40AM -0700, Pawan Gupta wrote:
> MDS mitigation requires clearing the CPU buffers before returning to
> user. This needs to be done late in the exit-to-user path. Current
> location of VERW leaves a possibility of kernel data ending up in CPU
> buffers for memory accesses done after VERW such as:
> 
>   1. Kernel data accessed by an NMI between VERW and return-to-user can
>      remain in CPU buffers ( since NMI returning to kernel does not

Some leftover '('

>      execute VERW to clear CPU buffers.
>   2. Alyssa reported that after VERW is executed,
>      CONFIG_GCC_PLUGIN_STACKLEAK=y scrubs the stack used by a system
>      call. Memory accesses during stack scrubbing can move kernel stack
>      contents into CPU buffers.
>   3. When caller saved registers are restored after a return from
>      function executing VERW, the kernel stack accesses can remain in
>      CPU buffers(since they occur after VERW).
> 
> To fix this VERW needs to be moved very late in exit-to-user path.
> 
> In preparation for moving VERW to entry/exit asm code, create macros
> that can be used in asm. Also make them depend on a new feature flag
> X86_FEATURE_CLEAR_CPU_BUF.

The macros don't depend on the feature flag - VERW patching is done
based on it.

> @@ -20,3 +23,17 @@ SYM_FUNC_END(entry_ibpb)
>  EXPORT_SYMBOL_GPL(entry_ibpb);
>  
>  .popsection
> +
> +.pushsection .entry.text, "ax"
> +
> +.align L1_CACHE_BYTES, 0xcc
> +SYM_CODE_START_NOALIGN(mds_verw_sel)

That weird thing needs a comment explaining what it is for.

> +	UNWIND_HINT_UNDEFINED
> +	ANNOTATE_NOENDBR
> +	.word __KERNEL_DS
> +.align L1_CACHE_BYTES, 0xcc
> +SYM_CODE_END(mds_verw_sel);
> +/* For KVM */
> +EXPORT_SYMBOL_GPL(mds_verw_sel);
> +
> +.popsection
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 58cb9495e40f..f21fc0f12737 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -308,10 +308,10 @@
>  #define X86_FEATURE_SMBA		(11*32+21) /* "" Slow Memory Bandwidth Allocation */
>  #define X86_FEATURE_BMEC		(11*32+22) /* "" Bandwidth Monitoring Event Configuration */
>  #define X86_FEATURE_USER_SHSTK		(11*32+23) /* Shadow stack support for user mode applications */
> -
>  #define X86_FEATURE_SRSO		(11*32+24) /* "" AMD BTB untrain RETs */
>  #define X86_FEATURE_SRSO_ALIAS		(11*32+25) /* "" AMD BTB untrain RETs through aliasing */
>  #define X86_FEATURE_IBPB_ON_VMEXIT	(11*32+26) /* "" Issue an IBPB only on VMEXIT */
> +#define X86_FEATURE_CLEAR_CPU_BUF	(11*32+27) /* "" Clear CPU buffers */

									   ... using VERW

>  
>  /* Intel-defined CPU features, CPUID level 0x00000007:1 (EAX), word 12 */
>  #define X86_FEATURE_AVX_VNNI		(12*32+ 4) /* AVX VNNI instructions */
> diff --git a/arch/x86/include/asm/nospec-branch.h b/arch/x86/include/asm/nospec-branch.h
> index c55cc243592e..005e69f93115 100644
> --- a/arch/x86/include/asm/nospec-branch.h
> +++ b/arch/x86/include/asm/nospec-branch.h
> @@ -329,6 +329,21 @@
>  #endif
>  .endm
>  
> +/*
> + * Macros to execute VERW instruction that mitigate transient data sampling
> + * attacks such as MDS. On affected systems a microcode update overloaded VERW
> + * instruction to also clear the CPU buffers. VERW clobbers CFLAGS.ZF.
> + *
> + * Note: Only the memory operand variant of VERW clears the CPU buffers.
> + */
> +.macro EXEC_VERW
> +	verw _ASM_RIP(mds_verw_sel)
> +.endm
> +
> +.macro CLEAR_CPU_BUFFERS
> +	ALTERNATIVE "", __stringify(EXEC_VERW), X86_FEATURE_CLEAR_CPU_BUF
> +.endm

Why can't this simply be:

.macro CLEAR_CPU_BUFFERS
        ALTERNATIVE "", "verw mds_verw_sel(%rip)", X86_FEATURE_CLEAR_CPU_BUF
.endm

without that silly EXEC_VERW macro?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
