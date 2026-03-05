Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174673630B4;
	Thu,  5 Mar 2026 22:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750550; cv=none; b=n6og+VB/sRrWEoljCKnIw0fowaRWXM9uGX3j6hRCVk43dNmA9mepwNPtzszz8UC5cmiPcA0/xdwrLRwIEqb6f6cKGhuMXu8q50y3GzLtGtlUjN/SuTFXHL3zLfHhKiyrE5lMdpMxgIPN2JbP45F8mnvnWX9BDNqO+I1T2ZC1Ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750550; c=relaxed/simple;
	bh=DUPJexJleYu6Vg98FCtp1+b79Qn3pqAQMBWcGBTDvIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jGA5ePUYlIgcuJ2RthNNetSI/dBXhihWTh770Loi7eXYMJJC2j+JJAIY4RxI1K+aQK1rM79mzz6HlhR6PS8+7P2a9S36fGFXeMk/rq/OSQRn1BmL3rmvqULnmmWuQ1RPKJWrYbbRjig/TLQInePancRJqXHDgQaReJS8YV66CYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=BYOKglcj; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="BYOKglcj"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625MfD7K4029791
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 14:41:14 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625MfD7K4029791
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772750477;
	bh=02DuAYCD8u99FixTc+hp/jQH56usQlch2YTa0ti+kbY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BYOKglcjtuOiV/jU+RfIjH6a8mCGIR48x32UZb8B0l99Kw7xKKWi821L1kWcgsb+A
	 ZIs5zjG9RwHsFWytpudYbhjqI2ZUyULhzd9W2VcdjCOC9x0kBIAfNCfUrGiH3eJWw2
	 KRGgrx3FAHuF8CCWa5t/7EaU2eN9VbuQUM5FPLDVnoTKg9YwiXkEvL/yKDYSclRcPv
	 hDYYcM9Ey3VesSCyiiRIE+p5V6m6BC2GQ25I71E1Dbx/7ZDb6I19H3yuxX9A+A/zTM
	 eJaJnqiJyF5Hp1WzM8OMMoMsc4YFNkePsdLpoX8Cm4TIzR4MqXZhQiJWsnlpop2iqP
	 CN9djAABzshVQ==
Message-ID: <ee1a171a-ec3c-43ee-8a32-2b7a2fd5795d@zytor.com>
Date: Thu, 5 Mar 2026 14:41:08 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] x86/traps: Consolidate user fixups in the #GP
 handler
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
 <20260305214026.3887452-3-sohil.mehta@intel.com>
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305214026.3887452-3-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-05 13:40, Sohil Mehta wrote:
> Move the UMIP exception fixup under the common "if (user_mode(regs))"
> condition where the rest of user mode fixups reside. Also, move the UMIP
> feature check into its fixup function to keep the calling code
> consistent and clean.
> 
> No functional change intended.
> 
> Suggested-by: Dave Hansen <dave.hansen@intel.com>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> v2:
>  - No change
> ---
>  arch/x86/kernel/traps.c | 8 +++-----
>  arch/x86/kernel/umip.c  | 3 +++
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 4dbff8ef9b1c..614a281bd419 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -921,11 +921,6 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
>  
>  	cond_local_irq_enable(regs);
>  
> -	if (static_cpu_has(X86_FEATURE_UMIP)) {
> -		if (user_mode(regs) && fixup_umip_exception(regs))
> -			goto exit;
> -	}
> -
>  	if (v8086_mode(regs)) {
>  		local_irq_enable();
>  		handle_vm86_fault((struct kernel_vm86_regs *) regs, error_code);
> @@ -940,6 +935,9 @@ DEFINE_IDTENTRY_ERRORCODE(exc_general_protection)
>  		if (fixup_vdso_exception(regs, X86_TRAP_GP, error_code, 0))
>  			goto exit;
>  
> +		if (fixup_umip_exception(regs))
> +			goto exit;
> +
>  		gp_user_force_sig_segv(regs, X86_TRAP_GP, error_code, desc);
>  		goto exit;
>  	}
> diff --git a/arch/x86/kernel/umip.c b/arch/x86/kernel/umip.c
> index d432f3824f0c..3ce99cbcf187 100644
> --- a/arch/x86/kernel/umip.c
> +++ b/arch/x86/kernel/umip.c
> @@ -354,6 +354,9 @@ bool fixup_umip_exception(struct pt_regs *regs)
>  	void __user *uaddr;
>  	struct insn insn;
>  
> +	if (!cpu_feature_enabled(X86_FEATURE_UMIP))
> +		return false;
> +
>  	if (!regs)
>  		return false;
>  

Reviewed-by: H. Peter Anvin (Intel) <hpa@zytor.com>

