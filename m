Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2C423EAB7
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974452; cv=pass; b=XXHvwglSIKqecbZnsqJlsaTkfH2wsR8BnRS2KHtOvZP9abd3M1Ph6AkbAutWws7FUSGJigiOzlrEUqIkKeDYXNy5+/X8wL0jQIY+bfnXEPm9Dtv0tzDM/rBYmF2ui+ZSt7KXfbarbGVMZFcsHhZOhjNS3Iyrc67yRC+8Fd1UGpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974452; c=relaxed/simple;
	bh=2nfwmb94yGrA9ID/nouOw462cfRKH8fQ5ttQFoLy0TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWamuonAS0CUyMyUle530qQ0rlquP1L5j9G1cdjawjKtynQiyBuNhEsKZVrng4rmghcKFOIwyPA8QzSLDO+eLf49N1AyBcHWtIY8cW2JHTKBB/X59SZbY+tpkd6RCWdXVZXxU32+chI0gtt/tf370j07lR8vE5S5pItuuaC6b0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wi5gfPUh; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wi5gfPUh"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4edb8d6e98aso582291cf.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 08:00:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974448; cv=none;
        d=google.com; s=arc-20240605;
        b=MtJk/gQQ7oE8f7N8r484+/aLixh6Sk32ip/1trZ7j1w9LtRRT8Js3GdzJ8QOiHGnFW
         tmnA7VfGfPjrqFeljw9NXfezuWrCVUJP4lWFtuAfOyDq/KVUauzQBYFdJa/IE4fCyqOe
         1x6Oi7NMkevpQOmujLpsNameThropjdrstieueyO//Tu4LBipirl8rVPuFTlGssvVdeM
         ScaAPW/RQ+az2B/lPZJMj+h8YWphLYrw0KGy/DxL2t5KXLBGVs8U1MPGYKwho2LplPFr
         RAL0CJmaEpWY+1dnRi/459vxSRvcPMhn2ww84qCYma2ED5mt0fQ0SjDFouQHv8wCLXrw
         X/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=;
        fh=ckXEQXBgPK1NRMDf8JivKEyXsUig3U25jf/MQd75Q9I=;
        b=KDpGeRzq5vgYpKn3dxcByITdkpWmOHcWZPQaOYf25fsux9vnsQoQ0I/hGlBEWum3mk
         t6XRQLt62YhcIb7N4vGGhfnlNS5iPsoIeP0vQ6pM5zoa8Zoa/4jnkc1YNi9V6vDW0f0O
         lruRdmYe7kFaZHSVC7LBoaq5SMLTmnip/NWlxl665vorSazjm/Ac57wK6q4wLrXX/9Xq
         2rHPUiCdbkIln9rDucgHouOIFAiuuNQpWYPtwenHvwidaw2DIcLWoorzc3pI7MDKB30Z
         HQA41rFGZIc86mw2XvX6JoAhKGlIazAPfR3kodK45lOmTYHVb0rLF4wW+s23Nx98Rp2Z
         9pIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974448; x=1768579248; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=;
        b=wi5gfPUhs8bPqIJq1SJqc51UXSvYNLmc/L2vj5lEJ8N6+o3ecZ43ENFOAg7XrAI0EI
         5dJ9EiC8T7soWRfvyHfPMpP4GkpWDckzY27pyYBMMS/dBJPPMtjFQEXvxXJ1KUblv8kI
         8eWfsfnbLHZ4MEtOSblidQDk6tZ8apBtnUhKRsrQExo6IFm1ioQC0gIT4Q4z/8UWc99j
         +PU1wkXwwB+F+wOFz13s/8qP1OiJ2dYq1UqiIQmOq/bwdLBwBLE4b4H4PAdV3Ql2IIPG
         zKoTCEhXU+uG+exPEYCN0YStoYXhNi4fHci87aLcdQRex5akKIKpHIlv7dELDeomWsrb
         SRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974448; x=1768579248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7VtbjVgRK26yiEqOOgv/l78iDPH0hDYbqMKU+cHyxE=;
        b=Mlnn+p+uD0ti4NNjTEGPyrNHdwOdwcp6ADCumIOBA/VGaERG6KDiVyxg7mN1xLk64M
         cODiBGHWIGhspUOPpOYb2904kvzApfAU9l+ol13rWb3ssQ8n5jQmVzznJ3Io+vz9fwB7
         UIT3dhNvWzDxnhX7oitBgqYTB95b+QLhonM9EMi8PtGDfReui/WcuDOSyJU7qcBCJw2p
         3iUYWO8L+zkeNzk54BFa57VCkhRiX0ftShI+Z978RYwMeyIS1oLW+61wbCOgJsQzuyJF
         aq2mhBu48UkEl1TrNga92T6phdQ1EsWuJPLM1tdb6WMZrP1BCqd3q6wZlIExU18DbSdJ
         K6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWHIt49xdrvq7iMBXEYXwY1hL75WFpOjsd2HSvEZKkE8YrlabU15DaI4JlRxgPpymtgbnFRsUViGWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYentlnQD5rRLdAqc8+3yrsSj7Za7vZsY/HGnHC6gmjVpmSmgd
	JdaenHRZRUle95NfjMjY6t58IsBQF2rcjqUy1CdhkWLpGFn4EN/sFjaq4D+sogoXpOseTwBIG6q
	ovvY0Z56pkAE0AYhlL7fRuoq//8DLRsZCGIEUn1VE
X-Gm-Gg: AY/fxX6DVO4eHUnNyZ8ErOssdfZvxW3kaGcHJEL7jjuZMVvJcceeZNcbfbfIqMQSM1X
	lE2xesjm4KrG02KxD2ENFRIWD1AwZpW397pDBzgfT3mfLLKB7tEVUYjP0grwFdLMZsttsqMxwbF
	8cDydpRVUCZ9OTtwwWpzQe0ukd2x6xiwVUdaUFaw820JVPkvRANA9RXDourEm2HOuEs+AXAORMa
	BUIlW6yw+J5bU+3aIJWOQhpQP0qDv5cAPHCCzqzZsCn2ajtvtBWA3ytQOAu+FYH4pT3TFz1
X-Received: by 2002:ac8:5fc5:0:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-4ffcb1e49dbmr10419571cf.7.1767974445761; Fri, 09 Jan 2026
 08:00:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-14-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:59:00 +0000
X-Gm-Features: AZwV_QjAJH2K5qg87J2uUGDkra1sJbu4XzFdX96_aa60XR7lg7WJ3FZ7haLvZNk
Message-ID: <CA+EHjTw-6-BFcr60+tgDzOE-OfcetD7yQtbNMkqr7BgiMXfeJA@mail.gmail.com>
Subject: Re: [PATCH v9 14/30] KVM: arm64: Implement SME vector length configuration
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
> SME implements a vector length which architecturally looks very similar
> to that for SVE, configured in a very similar manner.  This controls the
> vector length used for the ZA matrix register, and for the SVE vector
> and predicate registers when in streaming mode.  The only substantial
> difference is that unlike SVE the architecture does not guarantee that
> any particular vector length will be implemented.
>
> Configuration for SME vector lengths is done using a virtual register as
> for SVE, hook up the implementation for the virtual register.  Since we
> do not yet have support for any of the new SME registers stub register
> access functions are provided that only allow VL configuration.  These
> will be extended as the SME specific registers, as for SVE.
>
> Since vq_available() is currently only defined for CONFIG_SVE add a stub
> for builds where that is disabled.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h   |  1 +
>  arch/arm64/include/asm/kvm_host.h | 24 ++++++++++--
>  arch/arm64/include/uapi/asm/kvm.h |  9 +++++
>  arch/arm64/kvm/guest.c            | 82 +++++++++++++++++++++++++++++++--------
>  4 files changed, 96 insertions(+), 20 deletions(-)
>
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index 146c1af55e22..8b0840bd7e14 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -340,6 +340,7 @@ static inline int sve_max_vl(void)
>         return -EINVAL;
>  }
>
> +static inline bool vq_available(enum vec_type type, unsigned int vq) { return false; }
>  static inline bool sve_vq_available(unsigned int vq) { return false; }
>
>  static inline void sve_user_disable(void) { BUILD_BUG(); }
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3a3330b2a6a9..b41700df3ce9 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -810,8 +810,15 @@ struct kvm_vcpu_arch {
>          * low 128 bits of the SVE Z registers.  When the core
>          * floating point code saves the register state of a task it
>          * records which view it saved in fp_type.
> +        *
> +        * If SME support is also present then it provides an
> +        * alternative view of the SVE registers accessed as for the Z
> +        * registers when PSTATE.SM is 1, plus an additional set of
> +        * SME specific state in the matrix register ZA and LUT
> +        * register ZT0.
>          */
>         void *sve_state;
> +       void *sme_state;
>         enum fp_type fp_type;
>         unsigned int max_vl[ARM64_VEC_MAX];
>
> @@ -1098,14 +1105,23 @@ struct kvm_vcpu_arch {
>
>  #define vcpu_gp_regs(v)                (&(v)->arch.ctxt.regs)
>
> -/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> -#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> -                            sve_ffr_offset((vcpu)->arch.max_vl[ARM64_VEC_SVE]))
> -
>  #define vcpu_vec_max_vq(vcpu, type) sve_vq_from_vl((vcpu)->arch.max_vl[type])
>
>  #define vcpu_sve_max_vq(vcpu)  vcpu_vec_max_vq(vcpu, ARM64_VEC_SVE)
> +#define vcpu_sme_max_vq(vcpu)  vcpu_vec_max_vq(vcpu, ARM64_VEC_SME)
> +
> +#define vcpu_sve_max_vl(vcpu)  ((vcpu)->arch.max_vl[ARM64_VEC_SVE])
> +#define vcpu_sme_max_vl(vcpu)  ((vcpu)->arch.max_vl[ARM64_VEC_SME])
>
> +#define vcpu_max_vl(vcpu) max(vcpu_sve_max_vl(vcpu), vcpu_sme_max_vl(vcpu))
> +#define vcpu_max_vq(vcpu) sve_vq_from_vl(vcpu_max_vl(vcpu))
> +
> +#define vcpu_cur_sve_vl(vcpu) (vcpu_in_streaming_mode(vcpu) ? \
> +                              vcpu_sme_max_vl(vcpu) : vcpu_sve_max_vl(vcpu))

nit: This isn't really the current VL, but the current max VL. That
said, I don't think 'cur_max` is a better name. Maybe a comment or
something?

> +/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> +#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> +                            sve_ffr_offset(vcpu_cur_sve_vl(vcpu)))
>
>  #define vcpu_sve_zcr_elx(vcpu)                                         \
>         (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index c67564f02981..498a49a61487 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -354,6 +354,15 @@ struct kvm_arm_counter_offset {
>  #define KVM_ARM64_SVE_VLS_WORDS        \
>         ((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)
>
> +/* SME registers */
> +#define KVM_REG_ARM64_SME              (0x17 << KVM_REG_ARM_COPROC_SHIFT)
> +
> +/* Vector lengths pseudo-register: */
> +#define KVM_REG_ARM64_SME_VLS          (KVM_REG_ARM64 | KVM_REG_ARM64_SME | \
> +                                        KVM_REG_SIZE_U512 | 0xfffe)
> +#define KVM_ARM64_SME_VLS_WORDS        \
> +       ((KVM_ARM64_SVE_VQ_MAX - KVM_ARM64_SVE_VQ_MIN) / 64 + 1)
> +
>  /* Bitmap feature firmware registers */
>  #define KVM_REG_ARM_FW_FEAT_BMAP               (0x0016 << KVM_REG_ARM_COPROC_SHIFT)
>  #define KVM_REG_ARM_FW_FEAT_BMAP_REG(r)                (KVM_REG_ARM64 | KVM_REG_SIZE_U64 | \
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 456ef61b6ed5..2a1fdcb0ec49 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -310,22 +310,20 @@ static int set_core_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  #define vq_mask(vq) ((u64)1 << ((vq) - SVE_VQ_MIN) % 64)
>  #define vq_present(vqs, vq) (!!((vqs)[vq_word(vq)] & vq_mask(vq)))
>
> -static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +static int get_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
> +                     const struct kvm_one_reg *reg)
>  {
>         unsigned int max_vq, vq;
>         u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
>
> -       if (!vcpu_has_sve(vcpu))
> -               return -ENOENT;
> -
> -       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[ARM64_VEC_SVE])))
> +       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
>                 return -EINVAL;
>
>         memset(vqs, 0, sizeof(vqs));
>
> -       max_vq = vcpu_sve_max_vq(vcpu);
> +       max_vq = vcpu_vec_max_vq(vcpu, vec_type);
>         for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
> -               if (sve_vq_available(vq))
> +               if (vq_available(vec_type, vq))
>                         vqs[vq_word(vq)] |= vq_mask(vq);
>
>         if (copy_to_user((void __user *)reg->addr, vqs, sizeof(vqs)))
> @@ -334,40 +332,41 @@ static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         return 0;
>  }
>
> -static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +static int set_vec_vls(enum vec_type vec_type, struct kvm_vcpu *vcpu,
> +                      const struct kvm_one_reg *reg)
>  {
>         unsigned int max_vq, vq;
>         u64 vqs[KVM_ARM64_SVE_VLS_WORDS];
>
> -       if (!vcpu_has_sve(vcpu))
> -               return -ENOENT;
> -
>         if (kvm_arm_vcpu_vec_finalized(vcpu))
>                 return -EPERM; /* too late! */
>
> -       if (WARN_ON(vcpu->arch.sve_state))
> +       if (WARN_ON(!sve_vl_valid(vcpu->arch.max_vl[vec_type])))
>                 return -EINVAL;
>
>         if (copy_from_user(vqs, (const void __user *)reg->addr, sizeof(vqs)))
>                 return -EFAULT;
>
> +       if (WARN_ON(vcpu->arch.sve_state || vcpu->arch.sme_state))
> +               return -EINVAL;
> +

Can this ever happen? kvm_arm_vcpu_vec_finalized() is checked above,
and vcpu->arch.{sve,sme}_state are only assigned in
kvm_vcpu_finalize_vec() immediately before setting the finalized flag.

Cheers,
/fuad



>         max_vq = 0;
>         for (vq = SVE_VQ_MIN; vq <= SVE_VQ_MAX; ++vq)
>                 if (vq_present(vqs, vq))
>                         max_vq = vq;
>
> -       if (max_vq > sve_vq_from_vl(kvm_max_vl[ARM64_VEC_SVE]))
> +       if (max_vq > sve_vq_from_vl(kvm_max_vl[vec_type]))
>                 return -EINVAL;
>
>         /*
>          * Vector lengths supported by the host can't currently be
>          * hidden from the guest individually: instead we can only set a
> -        * maximum via ZCR_EL2.LEN.  So, make sure the available vector
> +        * maximum via xCR_EL2.LEN.  So, make sure the available vector
>          * lengths match the set requested exactly up to the requested
>          * maximum:
>          */
>         for (vq = SVE_VQ_MIN; vq <= max_vq; ++vq)
> -               if (vq_present(vqs, vq) != sve_vq_available(vq))
> +               if (vq_present(vqs, vq) != vq_available(vec_type, vq))
>                         return -EINVAL;
>
>         /* Can't run with no vector lengths at all: */
> @@ -375,11 +374,27 @@ static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>                 return -EINVAL;
>
>         /* vcpu->arch.sve_state will be alloc'd by kvm_vcpu_finalize_sve() */
> -       vcpu->arch.max_vl[ARM64_VEC_SVE] = sve_vl_from_vq(max_vq);
> +       vcpu->arch.max_vl[vec_type] = sve_vl_from_vq(max_vq);
>
>         return 0;
>  }
>
> +static int get_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sve(vcpu))
> +               return -ENOENT;
> +
> +       return get_vec_vls(ARM64_VEC_SVE, vcpu, reg);
> +}
> +
> +static int set_sve_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sve(vcpu))
> +               return -ENOENT;
> +
> +       return set_vec_vls(ARM64_VEC_SVE, vcpu, reg);
> +}
> +
>  #define SVE_REG_SLICE_SHIFT    0
>  #define SVE_REG_SLICE_BITS     5
>  #define SVE_REG_ID_SHIFT       (SVE_REG_SLICE_SHIFT + SVE_REG_SLICE_BITS)
> @@ -533,6 +548,39 @@ static int set_sve_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         return 0;
>  }
>
> +static int get_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sme(vcpu))
> +               return -ENOENT;
> +
> +       return get_vec_vls(ARM64_VEC_SME, vcpu, reg);
> +}
> +
> +static int set_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       if (!vcpu_has_sme(vcpu))
> +               return -ENOENT;
> +
> +       return set_vec_vls(ARM64_VEC_SME, vcpu, reg);
> +}
> +
> +static int get_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
> +       if (reg->id == KVM_REG_ARM64_SME_VLS)
> +               return get_sme_vls(vcpu, reg);
> +
> +       return -EINVAL;
> +}
> +
> +static int set_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
> +{
> +       /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
> +       if (reg->id == KVM_REG_ARM64_SME_VLS)
> +               return set_sme_vls(vcpu, reg);
> +
> +       return -EINVAL;
> +}
>  int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>  {
>         return -EINVAL;
> @@ -711,6 +759,7 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         case KVM_REG_ARM_FW_FEAT_BMAP:
>                 return kvm_arm_get_fw_reg(vcpu, reg);
>         case KVM_REG_ARM64_SVE: return get_sve_reg(vcpu, reg);
> +       case KVM_REG_ARM64_SME: return get_sme_reg(vcpu, reg);
>         }
>
>         return kvm_arm_sys_reg_get_reg(vcpu, reg);
> @@ -728,6 +777,7 @@ int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         case KVM_REG_ARM_FW_FEAT_BMAP:
>                 return kvm_arm_set_fw_reg(vcpu, reg);
>         case KVM_REG_ARM64_SVE: return set_sve_reg(vcpu, reg);
> +       case KVM_REG_ARM64_SME: return set_sme_reg(vcpu, reg);
>         }
>
>         return kvm_arm_sys_reg_set_reg(vcpu, reg);
>
> --
> 2.47.3
>
