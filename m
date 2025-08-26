Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888C1EDA0B
	for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 22:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756246625; cv=none; b=HwYX2XGiuuQo2m+JimduDFg49vVW7kq3kBOTfJFBX00din/CHtBEbHOHMyY9QMTP2TmMO+1w/NuGasipek3TelDWoguxnki4U9falZk9KM7tSrNPWwGnzNbEYcTh+j59OQ4SVRLQBE/ysxE9Jn0qNhY9K+jaixolp16xtttvh2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756246625; c=relaxed/simple;
	bh=dkRSR9yZaCnIUCxE/Pgdphs1W8URLyyPWrcuAKR2zC8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qu4ttafXDU2HXYD8po6sjchVRNtxZlXUkDsDvxdUP1yl+cEwOIAx7+05RCr5lYU9rqBqlRVJrjndJTyv8sqGghyZjmjQkub0Ezjr6OPNoSYhKgmzMSzSykL6mvtGqIKugQJGPgYka37ZgrwNnKuixaQ5akqWEiv4MnUsZarfEdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rQpjTnDU; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rQpjTnDU"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b4c409a09a8so593992a12.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Aug 2025 15:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756246623; x=1756851423; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf+sOaWz6yQxPEq8o5h2X+bhucVHOfGy49sr09fK5G4=;
        b=rQpjTnDUnXuP/eLF9Rc4QbA63kFi7ZCGPN4p2ZD114Wak3skjOMhtEJ2unj6r5HIUr
         QmxqxxrI41bh8QCALDSMd89UZ5EQbTYMFBNL/bW6RW+pAvUEnh+o4e2UPrI+UvhHunto
         Hm4gASn+dFfql9CEFFY4LaujvhqXEmbcVWE6E/YHDey5hdJ2lMdohusajiJE9p4MwWur
         dy2vfQbYkO/EWCOxyGKpM8RlIEl9p5wHEFK5y7NFlzNkXIamkLgNyL/e5q+plXH/dSF5
         zCLGzU/ZP5AuzAFxycsUa8+J/COPxB7gqdyHPxdc8j7ypx0CGnVA8rTfxZEq0OZFM+b3
         IEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756246623; x=1756851423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hf+sOaWz6yQxPEq8o5h2X+bhucVHOfGy49sr09fK5G4=;
        b=isgqPhYyVAQ0mYn3rAZQ0HFkZWyqEr9/hI7ZFwrx2IzMWJt2+243bfU1Nbzhs0LChz
         atIBlvo97RzwY/vWxHuDktVelKhRQr3Fv6vrbbHN/r0bgpwr12GMpuIScXs0iZrv4yCe
         AwhNDYIkJL8aef06YGraMJsyZwOCtuYgdnbcNCmldXfH+iHAYyNFS+anzUzO/KRpTeA9
         WAt8M/xZXrVQQby9B/dZYfdBlqRML/+TanPale9CCcjaSRHX7zdY1VkS4GNudSE211Rt
         UJvtAvr5VmLl23ciL4wAqTh3BC2gO0yScS1gWg6e/jarKIDlNd+GsNJX7sI9OOA5pe8W
         IYmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFeoEs7qH8N20/8hnaaTR0BXc5Np5B7jm0EIEtv1IK+BPJMx5IvrrI4TW3r+9pUE2tcN2xfM5QyJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPIZZod0se2CeX2sX0WFieQgRuoWYnEM3rMRpLwxrfQs4SiZY6
	ZYWKPIrceG6hGXYHTPbIuC5Nd5gw3gg8PKOgEhoLDEBuDYcxsAQNMcXRmlfKc3sK5bZLgVlZhV3
	RJrPv5w==
X-Google-Smtp-Source: AGHT+IFd2nZLGsKTjSAp4ps46TIxZ2hwPxdGjLuatk+HBTF+Ar5n/37PnMCKYCg4jfWAvsVgpFeVA+wo7o0=
X-Received: from pjz3.prod.google.com ([2002:a17:90b:56c3:b0:324:ed49:6c92])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:210c:b0:23f:f7ae:6e1c
 with SMTP id adf61e73a8af0-24340d00d45mr23557012637.25.1756246623098; Tue, 26
 Aug 2025 15:17:03 -0700 (PDT)
Date: Tue, 26 Aug 2025 15:17:01 -0700
In-Reply-To: <c45a7c91-e393-4f71-8b22-aef6486aaa9e@zytor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250821223630.984383-1-xin@zytor.com> <20250821223630.984383-7-xin@zytor.com>
 <2dd8c323-7654-4a28-86f1-d743b70d10b1@zytor.com> <aK340-6yIE_qujUm@google.com>
 <c45a7c91-e393-4f71-8b22-aef6486aaa9e@zytor.com>
Message-ID: <aK4yXT9y5YHeEWkb@google.com>
Subject: Re: [PATCH v6 06/20] KVM: VMX: Set FRED MSR intercepts
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org, 
	peterz@infradead.org, andrew.cooper3@citrix.com, chao.gao@intel.com, 
	hch@infradead.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 26, 2025, Xin Li wrote:
> 
> > > Hi Sean,
> > > 
> > > I'd like to bring up an issue concerning MSR_IA32_PL0_SSP.
> > > 
> > > The FRED spec claims:
> > > 
> > > The FRED SSP MSRs are supported by any processor that enumerates
> > > CPUID.(EAX=7,ECX=1):EAX.FRED[bit 17] as 1. If such a processor does not
> > > support CET, FRED transitions will not use the MSRs (because shadow stacks
> > > are not enabled), but the MSRs would still be accessible using MSR-access
> > > instructions (e.g., RDMSR, WRMSR).
> > > 
> > > It means KVM needs to handle MSR_IA32_PL0_SSP even when FRED is supported
> > > but CET is not.  And this can be broken down into two subtasks:
> > > 
> > > 1) Allow such a guest to access MSR_IA32_PL0_SSP w/o triggering #GP.  And
> > > this behavior is already implemented in patch 8 of this series.
> > > 
> > > 2) Save and restore MSR_IA32_PL0_SSP in both KVM and Qemu for such a guest.
> > 
> > What novel work needs to be done in KVM?  For QEMU, I assume it's just adding an
> > "or FRED" somewhere.  For KVM, I'm missing what additional work would be required
> > that wouldn't be naturally covered by patch 8 (assuming patch 8 is bug-free).
> 
> Extra patches:
> 
> 1) A patch to save/restore guest MSR_IA32_PL0_SSP (i.e., FRED SSP0), as
> what we have done for RSP0, following is the patch on top of the patch
> saving/restoring RSP0:
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 449a5e02c7de..0bf684342a71 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1294,8 +1294,13 @@ void vmx_prepare_switch_to_guest(struct kvm_vcpu *vcpu)
> 
>  	wrmsrq(MSR_KERNEL_GS_BASE, vmx->msr_guest_kernel_gs_base);
> 
> -	if (guest_cpu_cap_has(vcpu, X86_FEATURE_FRED))
> +	if (guest_cpu_cap_has(vcpu, X86_FEATURE_FRED)) {
>  		wrmsrns(MSR_IA32_FRED_RSP0, vmx->msr_guest_fred_rsp0);
> +
> +		/* XSAVES/XRSTORS do not cover SSP MSRs */

Eww.  I'm with Andrew, fix the SDM.  This is silly.

> +		if (!kvm_cpu_cap_has(X86_FEATURE_SHSTK))
> +			wrmsrns(MSR_IA32_FRED_SSP0, vmx->msr_guest_fred_ssp0);

FWIW, if we can't get an SDM change, don't bother with RDMSR/WRMSRNS, just
configure KVM to intercept accesses.  Then in kvm_set_msr_common(), pivot on
X86_FEATURE_SHSTK, e.g.

	case MSR_IA32_U_CET:
	case MSR_IA32_PL0_SSP ... MSR_IA32_PL3_SSP:
		if (!kvm_cpu_cap_has(X86_FEATURE_SHSTK)) {
			WARN_ON_ONCE(msr != MSR_IA32_FRED_SSP0);
			vcpu->arch.fred_rsp0_fallback = data;
			break;
		}

		kvm_set_xstate_msr(vcpu, msr_info);
		break;

and

	case MSR_IA32_U_CET:
	case MSR_IA32_PL0_SSP ... MSR_IA32_PL3_SSP:
		if (!kvm_cpu_cap_has(X86_FEATURE_SHSTK)) {
			WARN_ON_ONCE(msr_info->index != MSR_IA32_FRED_SSP0);
			vcpu->arch.fred_rsp0_fallback = msr_info->data;
			break;
		}

		kvm_get_xstate_msr(vcpu, msr_info);
		break;
