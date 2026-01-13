Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816892BE639
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314611; cv=pass; b=k3j6pAjjZrgYB539KWxl85MH3/6ZfcQ/OF4jVpjdVKuV3/D7NGl1n5qJQ06R7o8PCJoYHmReV4i0tIyIE/gppA/sgAVtzwBCECf91oDrCGG+FkoB8oXibfC/AQiXWRPQtFR5hWXiqshgoomSGVJ6s+HfzpUwNBULtH/QkZRu6Ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314611; c=relaxed/simple;
	bh=G5FodbqLvXK9tpyH66xlaj/l47vKj19iBm8mD+95DeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tbz66KWCsjwCKC9NS5ZrJ2/Nkc4smgyrHvg+bWRGst+Zt8EJaZ0wQPQAmejQDsQEn3tCsGBAeXPbcWbW3N22ROOnH8hyzMscDljFM/NXd3tta28r9FsyGqoABsknuXl632+Je7TTzlKJOuV97pQOLbCWwel3uYvM1PRhKTtD/IQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B+wyn6gB; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B+wyn6gB"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4edb8d6e98aso424991cf.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 06:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768314607; cv=none;
        d=google.com; s=arc-20240605;
        b=hAUKW6mwlMWtQvyl77/2n8evd0Dp+CkNxoBdfHChnxs/rGv42RPviuolOAGfB6maAe
         rRUV4VSgNMWfDGcMj7j+evTxjGcq0aVGdwQrYiLPjjcPQLKnQCn1bEXqUMEh/VIa9B+L
         m4HWxDIotaTB7hPJwwNpT4J6p7FLzGx2NEPukKFPb5aB58aab6xod+kp/a5BbLLAMr0S
         fcRLaUXV7tCNWW4oFvJQni/Gd4AtDfv1hH6cUlAv799hQoQyOmbcoeHFd0plQgDMRC2k
         vdmEfT/pFg/Uquewqu+ND1sMgxRXy4mo8zbY4OpJWsdtpMQkohJvSLhjba/hWYTW8k3J
         A+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=;
        fh=pMdb54Ef+1U36SimoJvWpBlY2iwDA0NmGX6DKZKIYE8=;
        b=J5+lHICoWYrrR7H2XuSGZandTn3dGID3rJNdC5LahpRXnrIaM9d6UkAkxXsE/vfgr4
         EDOcDyIFWlmR0t/lEvOGJa2U+9Sz1bKhLIp6rllrRupI2NCCo89obUZO8F/s8R/tcPPK
         0bPkbs26hBEko6pPWA0+Yb713VOzDGV4YgAK3Q002lsOVyKbegq8Kx0IcoJPdaTnu3hp
         WoZOlrRpQqhDHaR8y2JX5oNHXgbgSAgy6Ok8H96ql1NlyyWK45s1Gj/RIvgDNE+7zwSy
         deb1K6ReYzcfp5+BbaPQaWeOXuwdxDEs+yFwYqpJ0DvMIZ0U48PUTc8mgn8PUY8WXMJC
         4tPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768314607; x=1768919407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=;
        b=B+wyn6gBeRVxtZ/U6WcHc9YOm2TCL+0bcnT/ZIa0YIUM6Ce/cG4R0gIuofmBsVwzfq
         mjKU5Vk3WK7lFJlUQ6pJJATqiXTeienDpdkviDulL25OjuyFu9WhpJw/ynaE11ekXc1y
         oYefzbYHfpwoP82mOQ/pmDHtwqZ8CgRmYeQeSUOimfOWQ+iV21cHE9iSXmckvv6Hf5Y0
         l23XQ+uQidUY3cfGHQGe68NE2QFAuT5GQXxrrmKMig5gTJeoivKRSkaYMyIJDbEvR8Cd
         gtC+2Qt2PoaJjwDY/oq0n+lgC/BlsEc+WfHq82GYlo+FPRXNSNdR/EaIIpBklTmeBiUR
         DSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314607; x=1768919407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b091E81/2unB3PJIE3JLMImmryguifLfk5JsrT4l5/A=;
        b=kpqsgmfbtQdpuE5X077H79NCiD0ILB/fIqXU8f/j/TNQhyNNlNRYssFz/W3Omu4guu
         k3H9dAGa5DNtWLY8a0j2mO1h9VYTEgzW54hG7yGrk/RwQmUUAdVyz82yqs8otGLCTmSC
         yeopocDKdVcIiQ5r65CT5gFVjW3OwOXSWHmqda+sVxJx9soSbd/rwbxUNHvCwwHvtNXV
         URmfp1HLM6K7lLk9D3/ZM/G0vanS+LhMHfuEKorFCjIqq8MdzB/KcQNh6bHz+wcA4R2U
         2Lk9uMUgE8hMv0NplAk8545cXnrpTldot1kIxOiM3JpmiJXRvV7flPSG6SN8LdjyXfEM
         R8AA==
X-Forwarded-Encrypted: i=1; AJvYcCVTzWURBEOf0TiOuXe1MkpTfkC6Nzum8ZAhJOWCO3bjboXFxPr97yTvfqal1CtQenUI8P1N+AgNXz4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm1q6g7k5b2PtjpCqAXwwnKWFZ//9OcstI5t3sd0h8uYzibw5r
	CuglxrCQb/BI0SuYBgGgqjOjEys1JiekfNU3GiwfTpvJ4OMBRvZRZd0CVoOXoHMhx3u3DHXYN2g
	SBLCXTh9tFNcJPTW9HOsetybRNU+bTu3Sifrj6MWs
X-Gm-Gg: AY/fxX6PbCqvsOMfsXy0xOpgw0IrHPvvuV9MJ+7/G4N2d82c+KPq7DxOyMrwv8Kv9xT
	DEvrwfHIJwCZK1Vddi+hsWp788/4lLyeO1vHTz29mQbX9JUCMdXpbXAQpb3PVu2mV+XMcwV7s16
	JlVT+dARHU6alWZEUTx2kEqs05BrjKi07vW0dJyx39fXoXiXV0Sit+2dkeOMrLmkQsWwvwq2IGT
	1NU2QALYFG1kMqEvrj5uoGCniNPVpXKYk7gYgnkPUDPqcF9wmYhdCQyaX7LDnpwXHluCiAN+h36
	z0FpZ6yrmOLe7fpj7IeQx02dJQ==
X-Received: by 2002:ac8:5ad4:0:b0:4f1:83e4:73be with SMTP id
 d75a77b69052e-5013b23e77amr10218591cf.15.1768314606872; Tue, 13 Jan 2026
 06:30:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-24-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-24-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:29:30 +0000
X-Gm-Features: AZwV_Qi1BQ7vCKiwPSasBf7ZnHIRAUGyzNDOshXruUEpESYhIak7mxGtl8xsYqo
Message-ID: <CA+EHjTyL5gFQ8osKHaXQHa6327-HBJ4wvn6G2isDY3og4tCBKw@mail.gmail.com>
Subject: Re: [PATCH v9 24/30] KVM: arm64: Handle SME exceptions
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

On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> The access control for SME follows the same structure as for the base FP
> and SVE extensions, with control being via CPACR_ELx.SMEN and CPTR_EL2.TSM
> mirroring the equivalent FPSIMD and SVE controls in those registers. Add
> handling for these controls and exceptions mirroring the existing handling
> for FPSIMD and SVE.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/kvm/handle_exit.c            | 14 ++++++++++++++
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 11 ++++++-----
>  arch/arm64/kvm/hyp/nvhe/switch.c        |  4 +++-
>  arch/arm64/kvm/hyp/vhe/switch.c         | 17 ++++++++++++-----
>  4 files changed, 35 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
> index cc7d5d1709cb..1e54d5d722e4 100644
> --- a/arch/arm64/kvm/handle_exit.c
> +++ b/arch/arm64/kvm/handle_exit.c
> @@ -237,6 +237,19 @@ static int handle_sve(struct kvm_vcpu *vcpu)
>         return 1;
>  }
>
> +/*
> + * Guest access to SME registers should be routed to this handler only
> + * when the system doesn't support SME.
> + */
> +static int handle_sme(struct kvm_vcpu *vcpu)
> +{
> +       if (guest_hyp_sme_traps_enabled(vcpu))
> +               return kvm_inject_nested_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +
> +       kvm_inject_undefined(vcpu);
> +       return 1;
> +}
> +
>  /*
>   * Two possibilities to handle a trapping ptrauth instruction:
>   *
> @@ -390,6 +403,7 @@ static exit_handle_fn arm_exit_handlers[] = {
>         [ESR_ELx_EC_SVC64]      = handle_svc,
>         [ESR_ELx_EC_SYS64]      = kvm_handle_sys_reg,
>         [ESR_ELx_EC_SVE]        = handle_sve,
> +       [ESR_ELx_EC_SME]        = handle_sme,
>         [ESR_ELx_EC_ERET]       = kvm_handle_eret,
>         [ESR_ELx_EC_IABT_LOW]   = kvm_handle_guest_abort,
>         [ESR_ELx_EC_DABT_LOW]   = kvm_handle_guest_abort,
> diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
> index 5bcc72ae48ff..ad88cc7bd5d3 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> @@ -69,11 +69,8 @@ static inline void __activate_cptr_traps_nvhe(struct kvm_vcpu *vcpu)
>  {
>         u64 val = CPTR_NVHE_EL2_RES1 | CPTR_EL2_TAM | CPTR_EL2_TTA;
>
> -       /*
> -        * Always trap SME since it's not supported in KVM.
> -        * TSM is RES1 if SME isn't implemented.
> -        */
> -       val |= CPTR_EL2_TSM;
> +       if (!vcpu_has_sme(vcpu) || !guest_owns_fp_regs())
> +               val |= CPTR_EL2_TSM;
>
>         if (!vcpu_has_sve(vcpu) || !guest_owns_fp_regs())
>                 val |= CPTR_EL2_TZ;
> @@ -101,6 +98,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
>                 val |= CPACR_EL1_FPEN;
>                 if (vcpu_has_sve(vcpu))
>                         val |= CPACR_EL1_ZEN;
> +               if (vcpu_has_sme(vcpu))
> +                       val |= CPACR_EL1_SMEN;
>         }
>
>         if (!vcpu_has_nv(vcpu))
> @@ -142,6 +141,8 @@ static inline void __activate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
>                 val &= ~CPACR_EL1_FPEN;
>         if (!(SYS_FIELD_GET(CPACR_EL1, ZEN, cptr) & BIT(0)))
>                 val &= ~CPACR_EL1_ZEN;
> +       if (!(SYS_FIELD_GET(CPACR_EL1, SMEN, cptr) & BIT(0)))
> +               val &= ~CPACR_EL1_SMEN;
>
>         if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR3_EL1, S2POE, IMP))
>                 val |= cptr & CPACR_EL1_E0POE;
> diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
> index d3b9ec8a7c28..b2cba7c92b0f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/switch.c
> +++ b/arch/arm64/kvm/hyp/nvhe/switch.c
> @@ -181,6 +181,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
>         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg,
>         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
> +       [ESR_ELx_EC_SME]                = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
>         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
> @@ -192,7 +193,8 @@ static const exit_handler_fn pvm_exit_handlers[] = {
>         [0 ... ESR_ELx_EC_MAX]          = NULL,
>         [ESR_ELx_EC_SYS64]              = kvm_handle_pvm_sys64,
>         [ESR_ELx_EC_SVE]                = kvm_handle_pvm_restricted,
> -       [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
> +       [ESR_ELx_EC_SME]                = kvm_handle_pvm_restricted,
> +       [ESR_ELx_EC_FP_ASIMD]           = kvm_handle_pvm_restricted,
>         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
>         [ESR_ELx_EC_DABT_LOW]           = kvm_hyp_handle_dabt_low,
>         [ESR_ELx_EC_WATCHPT_LOW]        = kvm_hyp_handle_watchpt_low,
> diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
> index 9984c492305a..8449004bc24e 100644
> --- a/arch/arm64/kvm/hyp/vhe/switch.c
> +++ b/arch/arm64/kvm/hyp/vhe/switch.c
> @@ -458,22 +458,28 @@ static bool kvm_hyp_handle_cpacr_el1(struct kvm_vcpu *vcpu, u64 *exit_code)
>         return true;
>  }
>
> -static bool kvm_hyp_handle_zcr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
> +static bool kvm_hyp_handle_vec_cr_el2(struct kvm_vcpu *vcpu, u64 *exit_code)
>  {
>         u32 sysreg = esr_sys64_to_sysreg(kvm_vcpu_get_esr(vcpu));
>
>         if (!vcpu_has_nv(vcpu))
>                 return false;
>
> -       if (sysreg != SYS_ZCR_EL2)
> +       switch (sysreg) {
> +       case SYS_ZCR_EL2:
> +       case SYS_SMCR_EL2:
> +               break;
> +       default:
>                 return false;
> +       }
>
>         if (guest_owns_fp_regs())
>                 return false;
>
>         /*
> -        * ZCR_EL2 traps are handled in the slow path, with the expectation
> -        * that the guest's FP context has already been loaded onto the CPU.
> +        * ZCR_EL2 and SMCR_EL2 traps are handled in the slow path,
> +        * with the expectation that the guest's FP context has
> +        * already been loaded onto the CPU.
>          *
>          * Load the guest's FP context and unconditionally forward to the
>          * slow path for handling (i.e. return false).
> @@ -493,7 +499,7 @@ static bool kvm_hyp_handle_sysreg_vhe(struct kvm_vcpu *vcpu, u64 *exit_code)
>         if (kvm_hyp_handle_cpacr_el1(vcpu, exit_code))
>                 return true;
>
> -       if (kvm_hyp_handle_zcr_el2(vcpu, exit_code))
> +       if (kvm_hyp_handle_vec_cr_el2(vcpu, exit_code))
>                 return true;
>
>         return kvm_hyp_handle_sysreg(vcpu, exit_code);
> @@ -522,6 +528,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
>         [0 ... ESR_ELx_EC_MAX]          = NULL,
>         [ESR_ELx_EC_CP15_32]            = kvm_hyp_handle_cp15_32,
>         [ESR_ELx_EC_SYS64]              = kvm_hyp_handle_sysreg_vhe,
> +       [ESR_ELx_EC_SME]                = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_SVE]                = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
>         [ESR_ELx_EC_IABT_LOW]           = kvm_hyp_handle_iabt_low,
>
> --
> 2.47.3
>
