Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE30185956
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718228491; cv=none; b=qdXdCMddNjHbLXD3XzfybSC9NE+lGR8xARTDMq/clBnSa9vqrUsphMR+DD+jrJDjG1M2+nzNjhHZmMRx/M7dzqwhdEXrs8fFhrNRjx6VV0jKllVRsZgJVNzGjglNixeYJy8ejo+8d+qMqiqMCCbuKcf1Wkn1Zq4iapRxZBIgYSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718228491; c=relaxed/simple;
	bh=67HimRWaOGcR94s5nxBB2Mq+DzVfjSTg7cKrm0Wpvhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qM5grGFqMIR/Gtkx6yB+2vI+fTXUb1/GG53D0yXn41MISLAhxj4G8cXwh9QVTsHxM1SqVV35QF7Qr5CsnFVXdhdQY7sMA1wSJr0+ORQMG+o9tOReB0EALK1mxtZgqRsHsT549VXkt7Myvx0eq6WW1XHmLPQ0O715oRXVEspDUoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XggfXzyM; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XggfXzyM"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfedfecada4so702573276.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718228489; x=1718833289; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HTQmzQkZFO50boRFOtlelRlvtzu8rK9h6SKmuODGoO8=;
        b=XggfXzyMstRxKCqRll+7QU/Ci0hFq0KnQSrT5yFh+pj463/u3cV0lHbF6TbnsW1caD
         E6kK5cZKLY60T6UYN+JeolX+VLAxx4XkUSp8wZz2ZLfCbnjMQmY7J3th3grNGLuHZPYu
         fZTpBWtUjkVc0POdrLoIEWOV4bsGAI+8GIRiIXZg8X5HKxZRUFgzxjV1845efE1q/449
         MkXvOqnr2T8K8VIYoCF7XRkFSSqyhVUJS4T/9IbsKX+BuTwdydm8nm77lxyghZ8IrVES
         JuzD+1Q28Pk5iD+qHXU15qw/cy7AGXWJkSz1ltZxr/jYh7ivhQgd5ypAcpkXmD9R6hvO
         +mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718228489; x=1718833289;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTQmzQkZFO50boRFOtlelRlvtzu8rK9h6SKmuODGoO8=;
        b=E8Uooj6THKfHTpzo9gRlUhajZB4hMVlZgS9vxgKm0bKi9T4pI+fpVO+DNitACIfID/
         z0n+qfpmwcKnSxYI3/Tb8/2t6v5PKsqrT9xKulZVeNXpeaB/h0iG+mrA+SXLe5kDjGFb
         eQ6dzkyCAR5GKp/k4h3C7CS3dAZdwyAI0Df+CF0lTfk7nr30u1bxQWlpg6gHjBFmyaD9
         f9OQsiGkxTyVN73pJGkZf84Xbd1nUyH5Ku/u2Yz29QP7/rdlWjNjJ144f5B2raMuLh85
         JjWWFUJX34EnRwm5zsEpTKDjdlpki0p/bHdKciIRWuyuo7oJ5YgM4eccnxgCUvRp6snE
         06aA==
X-Forwarded-Encrypted: i=1; AJvYcCWX90i3xDKlAyTiWoXIwk0afvAobw6H0W3KcTAMlXhKGn5MIe9l/geNqTTAleolMg/t2XGKbOMZb84XT7l/O9MfD5umUwMoUrI/
X-Gm-Message-State: AOJu0YydZ6UiY7zWlUd5H4HWpkL5RBXVBaaLJtoF6D5b93E/4wpOky7c
	8sP7IqEPaUG53FBlCTNRcHhCD5IYneKVZ0+gCtbIvZxDI59NkTK+hpwVy4Znta1P6dsasdeNNf/
	yWw==
X-Google-Smtp-Source: AGHT+IGyG+mtcr/kVU3oAvt9em/qYRB1UDjtYQnTl1yJOreZRmpK01aFGB2+hznOEVLDsABe9yFV/Tj5WtE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:df7:8c1b:430a with SMTP id
 3f1490d57ef6-dfe65e7eb4dmr855641276.3.1718228489057; Wed, 12 Jun 2024
 14:41:29 -0700 (PDT)
Date: Wed, 12 Jun 2024 14:41:27 -0700
In-Reply-To: <20240207172646.3981-9-xin3.li@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240207172646.3981-1-xin3.li@intel.com> <20240207172646.3981-9-xin3.li@intel.com>
Message-ID: <ZmoWB_XtA0wR2K4Q@google.com>
Subject: Re: [PATCH v2 08/25] KVM: VMX: Initialize VMCS FRED fields
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin3.li@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	shuah@kernel.org, vkuznets@redhat.com, peterz@infradead.org, 
	ravi.v.shankar@intel.com, xin@zytor.com
Content-Type: text/plain; charset="us-ascii"

On Wed, Feb 07, 2024, Xin Li wrote:
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index d58ed2d3d379..b7b772183ee4 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1470,6 +1470,18 @@ void vmx_vcpu_load_vmcs(struct kvm_vcpu *vcpu, int cpu,
>  				    (unsigned long)(cpu_entry_stack(cpu) + 1));
>  		}
>  
> +#ifdef CONFIG_X86_64

Don't bother, practically no one cares about 32-bit KVM these days, and I highly
don't anyone that runs 32-bit KVM cares about the code footprint to this degree.

> +		/* Per-CPU FRED MSRs */
> +		if (kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> +			vmcs_write64(HOST_IA32_FRED_RSP1, read_msr(MSR_IA32_FRED_RSP1));
> +			vmcs_write64(HOST_IA32_FRED_RSP2, read_msr(MSR_IA32_FRED_RSP2));
> +			vmcs_write64(HOST_IA32_FRED_RSP3, read_msr(MSR_IA32_FRED_RSP3));
> +			vmcs_write64(HOST_IA32_FRED_SSP1, read_msr(MSR_IA32_FRED_SSP1));
> +			vmcs_write64(HOST_IA32_FRED_SSP2, read_msr(MSR_IA32_FRED_SSP2));
> +			vmcs_write64(HOST_IA32_FRED_SSP3, read_msr(MSR_IA32_FRED_SSP3));

That's a lot of RDMSRs to eat on every task migration.  How hard would it be to
add a per-CPU cache for each of these?  Or is there a pre-existing way to get at
the info that's faster than RDMSR?

> +		}
> +#endif
> +
>  		vmx->loaded_vmcs->cpu = cpu;
>  	}
>  }
> @@ -4321,6 +4333,15 @@ void vmx_set_constant_host_state(struct vcpu_vmx *vmx)
>  	 */
>  	vmcs_write16(HOST_DS_SELECTOR, 0);
>  	vmcs_write16(HOST_ES_SELECTOR, 0);
> +
> +	/*
> +	 * FRED MSRs are per-cpu, however FRED CONFIG and STKLVLS MSRs
> +	 * are the same on all CPUs, thus they are initialized here.

Eh, just trim this to:

	/* FRED CONFIG and STKLVLS are the same on all CPUs. */

> +	 */
> +	if (kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> +		vmcs_write64(HOST_IA32_FRED_CONFIG, read_msr(MSR_IA32_FRED_CONFIG));
> +		vmcs_write64(HOST_IA32_FRED_STKLVLS, read_msr(MSR_IA32_FRED_STKLVLS));
> +	}
>  #else
>  	vmcs_write16(HOST_DS_SELECTOR, __KERNEL_DS);  /* 22.2.4 */
>  	vmcs_write16(HOST_ES_SELECTOR, __KERNEL_DS);  /* 22.2.4 */
> @@ -4865,6 +4886,19 @@ static void __vmx_vcpu_reset(struct kvm_vcpu *vcpu)
>  	 */
>  	vmx->pi_desc.nv = POSTED_INTR_VECTOR;
>  	vmx->pi_desc.sn = 1;
> +
> +#ifdef CONFIG_X86_64
> +	if (kvm_cpu_cap_has(X86_FEATURE_FRED)) {
> +		vmcs_write64(GUEST_IA32_FRED_CONFIG, 0);
> +		vmcs_write64(GUEST_IA32_FRED_RSP1, 0);
> +		vmcs_write64(GUEST_IA32_FRED_RSP2, 0);
> +		vmcs_write64(GUEST_IA32_FRED_RSP3, 0);
> +		vmcs_write64(GUEST_IA32_FRED_STKLVLS, 0);
> +		vmcs_write64(GUEST_IA32_FRED_SSP1, 0);
> +		vmcs_write64(GUEST_IA32_FRED_SSP2, 0);
> +		vmcs_write64(GUEST_IA32_FRED_SSP3, 0);
> +	}

Somewhat of a moot point, but this belongs in init_vmcs(), not __vmx_vcpu_reset().
