Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F28B4A5726
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881426; cv=pass; b=kPZpJvU6qz3zW/2+4qa0WFyuH6wxfZcmC+Ldn3pM98CEDRUt3gBbnhPoClsYuS7OWD9E+XhVar5F/Zk0MlM1Ij+46rZj1FUvaza7QRji60WLFeyAaldE6guwxT9pkoTli+eRlhXviyoriXua0QG6+GyrUVGi4wOP1khVRw23iMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881426; c=relaxed/simple;
	bh=fqIKEGVdrdDwWR5GKD0/DnIsXWNq4kTzHRbVfGW+jJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIsdEQeEdaZ++RpO/q79I3nUipnl+D2uuhiNxmOc+zIZrgOj3U+zAeAuetRZ/2XcjEPzbgfzRnbDLWf4Vx8+WrOD9PxmD3UO5DHgHuPVytWYklJUJJtfI9/qSLiWu8y6c0L/MosZZzI3+23WN/tk1ByVQCyDRBp4REPfCh02wr0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EJehrLmG; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EJehrLmG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ffbaaafac4so743131cf.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881423; cv=none;
        d=google.com; s=arc-20240605;
        b=GIGTEyOrScbS5kz7x0ZzdbFSloRLclLvRB+YMTRp20N1v88dyW3ePedJoM6atXv1g+
         gxl1qnxAV6EEbOikEnr6p2bCEP2E/izeeHBw+bmA+FNi4eEp6GSsrSfaNxXa5C6uVN4J
         2/k8hsEx0Jke4dgSx9J8ZDTOpVkaO+/usF4Fq/07dCnaPRBw3pUN1KIkfRv1Y1Um3KtT
         RutQ/k+QkleYKFyD3ewi2OPGpUjoIUIkbjIdSyq/RnZGC0BSEANZGQO+PTxJepuHDgfd
         3iIu8HluEW/KTdZQORKthQ58oZKKa9gOgYtPBtrmATT+Vm8gGa/HZwoshVKG7jxdwDay
         cHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=;
        fh=OIKoSM057YY4J2AflTAtZPV8IAuStNNfLQczL6c3pQU=;
        b=g9jf0mkPg9MWz8JAydmBTDZPgjJoXBll78doSgmMDcrfojYXualZwiYIEGKnVuflJu
         Fi/C+I5LRp40mVNir5SotLm4bvye9IgtebPM77m0GSa9YBkAH+O3vq88y7vmLsRrEwhJ
         Xu/GoLHDjknwLIgBVlu6qVmFZZjNU+FfxOBIDxo4FVwwE7595YykJsPm604xzewICe1Z
         yW4qKzLJxXwlCoLloIxWcuMnDD+nEkEWxAcw8WgowZmnXpIvX698jcg9SGkA/lDkzJgv
         5UhcrJZxN5498kRCPvRdiuzxM+a4uNViFX88nLDer4E+lC9CDq9P0eqTXuIpa0d5UcVt
         TD+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881423; x=1768486223; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=;
        b=EJehrLmGVBdJ8xjO7wCBNPGGHCIDyqSfyF0nUdUeicZOzj4iIUUhfxqYt7RqrNWc1P
         UPLloSiW1ZSpb/O4ugOsDWC+0FllVmFUSxHZNHmcKEgYPLwoGQdUYHaydqyWHPDVTP9l
         J6Uu/D8sxBVp6JFHCq7ETy4GJ2xYEbaR39pF501c34iTfE3oSF1fYho3W1C6q0ZQGQga
         j5mioPq1wxSs+taAMifaYy6tSHT5quBNSpWE9fNw59LkysIwR1z0YCkzg0vPGrYusTTS
         CuzmgcE5OGX8Z6Vig5a8ovbiDJmjwTy0x3pxX3MHCdomtcME8TRLeYwfF2W9AWkNk1sD
         /Qzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881423; x=1768486223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaZEGS72KLSqcxT/8N5H1mx02StcfqZHeuPXe2e7POg=;
        b=nKxJr56oYJ1zZpd39bCDs0SEbmnQryfk5A0Y6TWkRZPWy93QbSYeH4PLkgxxAQ8izx
         G9SYuCJ2rofL1JmSdZSXEt9ze10RBUL863SHMm6zFm+1imMiA5NChfNGK7k5eQDz9TT6
         4WlhO3wUCNdw2YX/bHaSm+GUFZvQzWqH4lbqYtesPffq7zF8lgihWg0WBe3G+Uisb/Sz
         xk6p511cIE1RAdUhfbkuLH+o9sgFD4www3fCZ4DkXf21yDIqFrtaQb6C0PjvTbPbY5S2
         evj04JEU7S478nz4YgBjBI1QRbT9AcnpXsFfQTZj9kepKl118LkA4JY0ZxAG7hAA7T+5
         8e/w==
X-Forwarded-Encrypted: i=1; AJvYcCUzl9RfyiI+dTKJEdy6m8Q3aqWLDnbTRt+5Zgx3iEhr/WJocjxVcSP16ix6eAinaYulYPedlVfm4A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPiR9X51WwtKg6U/NTqvVE3naASgAYwA6jHF8dDVzTI9VxdGdP
	gYw9hqMSrgoKlCPrtB6dthVhZMR9RVkwqWDDIKIiYn4fMoeylc9onfQ4fNKSSMkBt+OIPedAjTy
	mHqYcL2RyPoW7oLs2pJD4XfkIGG3Zerw/grQf2XSf
X-Gm-Gg: AY/fxX7FMOEKehRQDjt98KujbTQoYZol4oBoQ1SsI2xSFuY5U01Sns/3WFyzOyfV26e
	sxAisR4ntUAzooPYTl9Cspj0uCGnvqThJJ+ldAsKRQ4xDT5qqgR015ytK4VEWKH+akk8rjVmdFR
	C4yl1ojfM7f/V9KqF9L45aynrMWAPunK7nERFWSl3kv7fiEhQhaeVcpI6W95aXJMQsIRpnnVxxX
	AQpr69uEMhU8A7lnAwUutX6NwMbeo82aAvMeBz2/b3Ll4liUXwkJRZHmTjmO04gSwuJ+g14
X-Received: by 2002:ac8:574f:0:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-4ffc0997e9emr8640981cf.17.1767881422911; Thu, 08 Jan 2026
 06:10:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-7-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-7-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:46 +0000
X-Gm-Features: AQt7F2pJrrFIu8j-RnjtZsOw-SyaBAdPJA09Q8QxhF8SmvfGBU7bWTwW9oJJhUU
Message-ID: <CA+EHjTzTjaZoGQzivOSd97Z9VzySOAM=Qvye0p-R5rzUDwrSFw@mail.gmail.com>
Subject: Re: [PATCH v9 07/30] KVM: arm64: Pull ctxt_has_ helpers to start of sysreg-sr.h
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> Rather than add earlier prototypes of specific ctxt_has_ helpers let's just
> pull all their definitions to the top of sysreg-sr.h so they're all
> available to all the individual save/restore functions.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 84 +++++++++++++++---------------
>  1 file changed, 41 insertions(+), 43 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index a17cbe7582de..5624fd705ae3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -16,8 +16,6 @@
>  #include <asm/kvm_hyp.h>
>  #include <asm/kvm_mmu.h>
>
> -static inline bool ctxt_has_s1poe(struct kvm_cpu_context *ctxt);
> -
>  static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>  {
>         struct kvm_vcpu *vcpu = ctxt->__hyp_running_vcpu;
> @@ -28,47 +26,6 @@ static inline struct kvm_vcpu *ctxt_to_vcpu(struct kvm_cpu_context *ctxt)
>         return vcpu;
>  }
>
> -static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> -{
> -       return host_data_ptr(host_ctxt) != ctxt;
> -}
> -
> -static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> -{
> -       struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> -
> -       if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> -               return &vcpu->arch.external_mdscr_el1;
> -
> -       return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> -}
> -
> -static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> -{
> -       struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> -
> -       if (!(ctxt_is_guest(ctxt) &&
> -             test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> -               return read_cpuid_id();
> -
> -       return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> -}
> -
> -static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> -{
> -       *ctxt_mdscr_el1(ctxt)   = read_sysreg(mdscr_el1);
> -
> -       // POR_EL0 can affect uaccess, so must be saved/restored early.
> -       if (ctxt_has_s1poe(ctxt))
> -               ctxt_sys_reg(ctxt, POR_EL0)     = read_sysreg_s(SYS_POR_EL0);
> -}
> -
> -static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> -{
> -       ctxt_sys_reg(ctxt, TPIDR_EL0)   = read_sysreg(tpidr_el0);
> -       ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
> -}
> -
>  static inline bool ctxt_has_mte(struct kvm_cpu_context *ctxt)
>  {
>         struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> @@ -131,6 +88,47 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>         return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>
> +static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
> +{
> +       return host_data_ptr(host_ctxt) != ctxt;
> +}
> +
> +static inline u64 *ctxt_mdscr_el1(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm_vcpu *vcpu = ctxt_to_vcpu(ctxt);
> +
> +       if (ctxt_is_guest(ctxt) && kvm_host_owns_debug_regs(vcpu))
> +               return &vcpu->arch.external_mdscr_el1;
> +
> +       return &ctxt_sys_reg(ctxt, MDSCR_EL1);
> +}
> +
> +static inline u64 ctxt_midr_el1(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm *kvm = kern_hyp_va(ctxt_to_vcpu(ctxt)->kvm);
> +
> +       if (!(ctxt_is_guest(ctxt) &&
> +             test_bit(KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS, &kvm->arch.flags)))
> +               return read_cpuid_id();
> +
> +       return kvm_read_vm_id_reg(kvm, SYS_MIDR_EL1);
> +}
> +
> +static inline void __sysreg_save_common_state(struct kvm_cpu_context *ctxt)
> +{
> +       *ctxt_mdscr_el1(ctxt)   = read_sysreg(mdscr_el1);
> +
> +       // POR_EL0 can affect uaccess, so must be saved/restored early.
> +       if (ctxt_has_s1poe(ctxt))
> +               ctxt_sys_reg(ctxt, POR_EL0)     = read_sysreg_s(SYS_POR_EL0);
> +}
> +
> +static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
> +{
> +       ctxt_sys_reg(ctxt, TPIDR_EL0)   = read_sysreg(tpidr_el0);
> +       ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
> +}
> +
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
>  {
>         ctxt_sys_reg(ctxt, SCTLR_EL1)   = read_sysreg_el1(SYS_SCTLR);
>
> --
> 2.47.3
>
