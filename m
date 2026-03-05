Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34035979;
	Thu,  5 Mar 2026 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750875; cv=none; b=f5ahPO/HuwAVTZLvAvwZEqiemUgTTSdIcxmQViPbrtXJv5V2pb4C5sdhOwpAncfpHIRIlGoON/mfdQQEQOS7JcyAEszVU/84+CB5vJIh2bjWCvVXo+GW+VUcWVquZcFAg/o7NFX9mZOM35XxV6BJmWv7b36qwgtyyyWK4x6vADw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750875; c=relaxed/simple;
	bh=KhAGM6pflvptDSiMvnM0kYZxZAn+R7XntVrqa1UYsWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eTP18mAml8/G0UECsFBjiJBCK+hUMEf1C5cUZvQObNv2cU1SsX03or2aTvKI2/xiLdRqWxDHrEDXUqRjUCJZDqt5Z/5sMMtH/upXYgO9E6cOigh22YYaPp3WxzaclP+l9IfmWEt1DnVaRguRLrBS++0aIFfCut8oTt8H2lK/BtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Tk+AbOuy; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Tk+AbOuy"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 625Mku5P4040031
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 5 Mar 2026 14:46:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 625Mku5P4040031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772750821;
	bh=LnwuwovknsVFEz/5whX6O+PiryYsTPmBI9q23JdqKLk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tk+AbOuyxVxKckwd862StdX6Femt1S5IfB9I3eIT7ij2GQrSMcgh/KYDTAL478Mo0
	 MlLYuNZghQwnKwKJcslRF8txal1hlwhd4KehQzOdzO8wUjbi4bxXsMSwFugAzBPJCi
	 UQQitt2KABSEUQs/zkjsucSo+SBqSR0bNwPhoM/PxIr4yW0QT5L/b1C4K/4/yB0mnf
	 RU8I6oRVwVn+XLRDy8m0K5wp+o5Xrwxj3TmvkTm59LrTr/YjaOW2vzoPoxrSkE8uo0
	 z/K9TA9boEIabFbjofzhSHWl1ULr9iKnETDYChDXgDIugq/z0vln+d1DbxyZjmLnD6
	 fk5kn+pLMF5ww==
Message-ID: <343d6536-dac3-45e2-9407-61734bec4ab0@zytor.com>
Date: Thu, 5 Mar 2026 14:46:51 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86/cpu: Remove LASS restriction on vsyscall
 emulation
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
 <20260305214026.3887452-6-sohil.mehta@intel.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260305214026.3887452-6-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026-03-05 13:40, Sohil Mehta wrote:
> Vsyscall emulation has two modes of operation: XONLY and EMULATE. The
> default XONLY mode is now supported with a LASS-triggered #GP. OTOH,
> LASS is disabled if someone requests the deprecated EMULATE mode via the
> vsyscall=emulate command line option. So, remove the restriction on LASS
> when the overall vsyscall emulation support is compiled in.
> 
> As a result, there is no need for setup_lass() anymore. LASS is enabled
> by default through a late_initcall().
> 
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> Reviewed-by: Dave Hansen <dave.hansen@linux.intel.com>
> ---
> v2:
>  - Picked up Dave's review tag
>  - Improve commit message
> ---
>  arch/x86/kernel/cpu/common.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
> index 3557f0e6b3aa..02472fc763d9 100644
> --- a/arch/x86/kernel/cpu/common.c
> +++ b/arch/x86/kernel/cpu/common.c
> @@ -406,20 +406,6 @@ static __always_inline void setup_umip(struct cpuinfo_x86 *c)
>  	cr4_clear_bits(X86_CR4_UMIP);
>  }
>  
> -static __always_inline void setup_lass(struct cpuinfo_x86 *c)
> -{
> -	if (!cpu_feature_enabled(X86_FEATURE_LASS))
> -		return;
> -
> -	/*
> -	 * Legacy vsyscall page access causes a #GP when LASS is active.
> -	 * Disable LASS because the #GP handler doesn't support vsyscall
> -	 * emulation.
> -	 */
> -	if (IS_ENABLED(CONFIG_X86_VSYSCALL_EMULATION))
> -		setup_clear_cpu_cap(X86_FEATURE_LASS);
> -}
> -
>  static int enable_lass(unsigned int cpu)
>  {
>  	cr4_set_bits(X86_CR4_LASS);
> @@ -2061,7 +2047,6 @@ static void identify_cpu(struct cpuinfo_x86 *c)
>  	setup_smep(c);
>  	setup_smap(c);
>  	setup_umip(c);
> -	setup_lass(c);
>  
>  	/* Enable FSGSBASE instructions if available. */
>  	if (cpu_has(c, X86_FEATURE_FSGSBASE)) {

Love a patch that just deletes code!

Reviewed-by: H> Peter Anvin (Intel) <hpa@zytor.com>

