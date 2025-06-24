Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F92E2E338F
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 15:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778413; cv=none; b=JZJW+zf2xOKr7pwBkMYIyawm7upHVl9B+L6LyzPfJFfkc6n0891H7K4pD5pT3K7dEQQafWWkqTlAbvNkA5l0+QkhUsc9fCCESOrkX1ClHp1ObLfW8lkXCbf4X2c4+5XR8DDMG8NOxtkHpJ1zNNFVIKb4yjQAh2jEBMPJllcuDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778413; c=relaxed/simple;
	bh=Vm3A6wHZ/yoyBgE0EAf83UZWXKbrAMUvq94GaHakSHk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=o988SCrLW+pHvm4vW1hN5E1WZlTE8CPkGkHwXgM47yk1hYC56rkSNarD+j7mt6g0HiqkmTT7H83nnTvfCKrskkFxpIdvmOANydEdkybt5BmrKVwHy+cHX4A3pEu5DvPuooxBEJzU4t9B+7qHXaL8/Fj/ztNGu0T/CvmjR9SZ26w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GbulfpFz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GbulfpFz"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132e7266d3so5361903a91.2
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 08:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750778409; x=1751383209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vGRfoH9LdFtGM39WnIuEZlC9+8YFZhcusYM4kwtNz9g=;
        b=GbulfpFzVniqykzkj1T0Fwd4FIgupk9wVLQnjO1XZ0dHCI4paq6IWRzII0f4ADdtF6
         Vw5y8dzKjjy5hfkHoHo/Oraknp1ykeYbxZTOebR9g46Lx558voUmyyYhTQbj2WLOagRT
         2kw4zB5oXCKgahHLvdxVjVIPZhbRXF51t8MJxwARH8QNczaTsF+Hn+ghw03huk1j6mkb
         eXOyi88F59ApYjVABVDA/HEIUaQ9VN1cm2/UimCsVwwd3p3rnBXXFnjc+ryV0rwA0B1Y
         xz9nYsxjbeARbmbpa5Tn3xUwG63t0yutOK6hnrqWrpX5BWQNVRGm3P5yUOJH/UmHv5Px
         JLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778409; x=1751383209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGRfoH9LdFtGM39WnIuEZlC9+8YFZhcusYM4kwtNz9g=;
        b=Wz5shTt0ULT943qpq36FhVDtyXS9WDbeKOmSCRYYnTMOLy8kq96dmQSfn7sFX2AArm
         vykpFe3sNIFDURGMmrYohNBv48g9xAF6OW6W1HSZ0FJy+n20wWSU6G/HJ+zSG/CLF2dH
         IJpYfq6W96O8MQLrmPrP6i3Xvp17eJSG26dzYcX1uXd+SV0Dz4OD3jqS7XsZ2hJK2A+n
         54t0HN8JnY9cyNoqLERIBG5rYHaXu/Sjv9PcucTd7p+qASZjiihCQU3pSPKuNVVTpwAE
         /ik25xSTeqQfgfBTAC+pgXmJ2IpGKVNv+J/wnBlU7Ui0BBdp5ImcV3bxNHERUoN3mrXi
         BdiA==
X-Forwarded-Encrypted: i=1; AJvYcCUk5EvVwOMNF2SQhxIDxTR68OI5AHoBRuVex6cdqNYZCtOsEdQNa8z/cnw1V49grlYHAP+YZUzkLG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO/TnfPY6S/IEoEhVrv1htqsePidlJs7JejY8IA+OZiefsOycJ
	1OfwVyDJRFDyScVUN4U4ddoSQCvybNs6ivbIbh9xFiOj8VQJGdxaWAv1f8LPtlGfooSySXcCygP
	Ow4c5AA==
X-Google-Smtp-Source: AGHT+IGY1sNiClwBZTcmK97/eMChbdF+koURDQ4b/nqndAH0Pf6+wiOIfdVBF86RlKu8osKt9rWO6gJhKmc=
X-Received: from pjn14.prod.google.com ([2002:a17:90b:570e:b0:30a:7da4:f075])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c11:b0:312:26d9:d5b4
 with SMTP id 98e67ed59e1d1-3159d8c7e55mr28632166a91.17.1750778408771; Tue, 24
 Jun 2025 08:20:08 -0700 (PDT)
Date: Tue, 24 Jun 2025 08:20:07 -0700
In-Reply-To: <20250328171205.2029296-4-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328171205.2029296-1-xin@zytor.com> <20250328171205.2029296-4-xin@zytor.com>
Message-ID: <aFrCJzodXP0sT6Ny@google.com>
Subject: Re: [PATCH v4 03/19] KVM: VMX: Disable FRED if FRED consistency
 checks fail
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: pbonzini@redhat.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, andrew.cooper3@citrix.com, luto@kernel.org, 
	peterz@infradead.org, chao.gao@intel.com, xin3.li@intel.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Mar 28, 2025, Xin Li (Intel) wrote:
> From: Xin Li <xin3.li@intel.com>
> 
> Do not virtualize FRED if FRED consistency checks fail.
> 
> Either on broken hardware, or when run KVM on top of another hypervisor
> before the underlying hypervisor implements nested FRED correctly.
> 
> Suggested-by: Chao Gao <chao.gao@intel.com>
> Signed-off-by: Xin Li <xin3.li@intel.com>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Tested-by: Shan Kang <shan.kang@intel.com>
> Reviewed-by: Chao Gao <chao.gao@intel.com>
> ---
> 
> Change in v4:
> * Call out the reason why not check FRED VM-exit controls in
>   cpu_has_vmx_fred() (Chao Gao).
> ---
>  arch/x86/kvm/vmx/capabilities.h | 11 +++++++++++
>  arch/x86/kvm/vmx/vmx.c          |  3 +++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
> index b2aefee59395..b4f49a4690ca 100644
> --- a/arch/x86/kvm/vmx/capabilities.h
> +++ b/arch/x86/kvm/vmx/capabilities.h
> @@ -400,6 +400,17 @@ static inline bool vmx_pebs_supported(void)
>  	return boot_cpu_has(X86_FEATURE_PEBS) && kvm_pmu_cap.pebs_ept;
>  }
>  
> +static inline bool cpu_has_vmx_fred(void)
> +{
> +	/*
> +	 * setup_vmcs_config() guarantees FRED VM-entry/exit controls
> +	 * are either all set or none.  So, no need to check FRED VM-exit
> +	 * controls.
> +	 */
> +	return cpu_feature_enabled(X86_FEATURE_FRED) &&

Drop the cpu_feature_enabled().  These helpers are all about checking raw CPU
support; whether or not the kernel is configured to support FRED is irrelevant.

[For these helpers; KVM obviously needs to account for FRED support in other
 paths, but that should be automagically handled by kvm_set_cpu_caps()]


> +		(vmcs_config.vmentry_ctrl & VM_ENTRY_LOAD_IA32_FRED);
> +}
> +
>  static inline bool cpu_has_notify_vmexit(void)
>  {
>  	return vmcs_config.cpu_based_2nd_exec_ctrl &
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index e38545d0dd17..ab84939ace96 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8052,6 +8052,9 @@ static __init void vmx_set_cpu_caps(void)
>  		kvm_cpu_cap_check_and_set(X86_FEATURE_DTES64);
>  	}
>  
> +	if (!cpu_has_vmx_fred())
> +		kvm_cpu_cap_clear(X86_FEATURE_FRED);
> +
>  	if (!enable_pmu)
>  		kvm_cpu_cap_clear(X86_FEATURE_PDCM);
>  	kvm_caps.supported_perf_cap = vmx_get_perf_capabilities();
> -- 
> 2.48.1
> 
