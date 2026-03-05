Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DFC364EA0;
	Thu,  5 Mar 2026 22:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772751335; cv=none; b=mGRq6oWxlsc6k4S1NLnJnbNbRzWQ3OgwOMSIkI63RdRa+W2f/cNf5AP5slt0D6w0r5je7HNBH/AyuHhx7ABk/y/ldAzWKBoGm5qbx6GQyGVJE0pewVbJK9D6Nhj/6i/L6Vju3V/Wn7sDVgt70GYccpHz8aqcrYKVr/rWlt8n22E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772751335; c=relaxed/simple;
	bh=0WSs8a5NYbU6+fIELTvoRl1PamGFQXLIBvAN6eHidDM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvwyNaJmtj29U4KSYnp4sOzXIjeX61/2UP+pImqjOJqJ9SzK44XRkQ3aqU2n/VEt3/TZfuR26elU6NDirYboIhaRf33BIRCZ3SyrdcTBl3vRbOJqTtzqkEJxw91nszNr5csmW7FcqpGqkusD3iUY5W2TmfDkGEFeTUl5bYPJcgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=TSwkgePL; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="TSwkgePL"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625MMTJA3999960
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 14:22:52 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625MMTJA3999960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772749375;
	bh=WdnaxFYzkS7/Cig9gljHa02ekMGWM3ioEow8ByxwYww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TSwkgePLCGKzEDfTxuXJ42NK4dGRcUUau3FRMDzERUEFYPqWsOYecyWov9TfRI3s0
	 r6MXpa4jg787yxMQ6YuVZjNicSdWN50r3gkXzPXCj7wPojMQcYES5/rqxlyJofR+jL
	 FC9dHkz5QhrI5E5QJUCBIPFgA0lsunREZOsqPVrBZtcqSsdUnoNBOaj2L7VBIK26GA
	 Xj8YS0wAQGiJp2yCd4xTtz9VJ8+UQRqzqJPogGxqmnf0tJjhlH44umm0y6Uh5m0Qm3
	 ANjhtZI45d9qaE+qt49xXE1jPb+apm2Wqxq8k6S3zPb81DXj8f1dagmsUOss7VCGPS
	 EApHFNupun3MA==
Message-ID: <1ff952b1-7f8e-4062-9741-5469b5f91eeb@zytor.com>
Date: Thu, 5 Mar 2026 14:22:24 -0800
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
Content-Language: en-US, sv-SE
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

[General comment, not really applicable to this patch]

I like this kind cleanups. However, if this had been a hot path (which it
isn't) and if UMIP wasn't very common (which it is), then it probably would be
desirable to push the cpu_feature_enabled() into the call site. This is
trivially done with an inline function in the header file where this is exported:

static inline bool fixup_umip_exception(struct pt_regs *regs)
{
	return cpu_feature_enabled(X86_FEATURE_UMIP) &&
		__fixup_umip_exception(regs);
}

