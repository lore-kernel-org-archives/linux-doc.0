Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358422DAFDF
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 15:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767974178; cv=pass; b=r7x4QmJrrEzxKURxJijeGinJNP5shA99WQjFxv/xuRGtutZ848YZRaIxKqZNvv93SpcNQHX+pwctyEu3+gO8CeA1yl3RKLxkO3jqoitbIqgHdlJhVgvNM1UXZjjCdkg0r0XYZI3BKKgW9nYxiDMdmSe4aqbP/aJ/+5euyEKCKmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767974178; c=relaxed/simple;
	bh=iK5AUYKKnG1GCt/80DpdeQQfwbtmqro71Xoh6GzOc/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1hjEUYNXD4HmwanZz661Evo7xmlcslN1Zg07m8aWmkZLxx7NBhxVuuoN2Pp4Ordk3YkVYcuIXD9vYw5EEKFwAJEeFCAImPr82Zn7B7YezNGJJrOzezmfinMjY1wL9h1AmKVYWgeJkly26awwnmCsxwMbItwuvX4F2c0TMo2aB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bc40ye1x; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bc40ye1x"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ee243b98caso353661cf.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 07:56:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767974174; cv=none;
        d=google.com; s=arc-20240605;
        b=g3gSF290p4r1b/GsHZY4xIXr1sct+9NO/RGWZqObbUyTlNOSJqCVwPHT7TjHR7skxn
         9k8CeJDigoHV9MSvqV3+DYjHhd3XEqZpgi3d84nzvMieN+58i4+96dma26CeBR1Ml18h
         BOX/g6o4OGRdylEU00ahghYCYHri4JRfK3SNDtytw/X6Pe8RCAmcdDZ+U59NaJA7T0yV
         FbUDMNuv9OirLDIfUcHfdttqUaUZ4lkKO7MekXB+v1h6rl8WM7aB1gQQxLiRzEj1cHP7
         PhZhJDTYORZWyOGBfZVQcQx92XY+ynXQTLmvw0LIk4+SQnVZzTvvn1B135GBtvX4MRXr
         fDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=;
        fh=/zsOw0ltjX19iy2DccoAVvqFZU9wSePBQQfVxqwHi0U=;
        b=XnrU3I75D/+0jDz8f4QFLba3VPvbDK2x/f0kzmrygKxLeGOZ93eM4T7X0rkvPoTEv4
         UkhOGsbT+mggK5lG19ND1mmX4bTUrusuRYemZyJ/9gzdjEEeC5QjK2mYvz/tfozfsjJo
         cXHXqkf03Tvbp4tydp4HtpVIww7AGRXR7+aSQjmKRaTlLrhKb2Mrdi01IAI+xJYyAaYb
         FX3bLkYAIwrKvSyBb13Mfu2m4VTT5DJB7ORfyzidWPjDt4C6vN5kRh+AhkxLAN2GH5Hm
         5W7n0LgXas1G19Zw0s6xyNo6DpDm188QECKrNEyZIq45mB9dPi7OaxWZY6ALGIylvuQe
         I9QA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767974174; x=1768578974; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=;
        b=bc40ye1xcX2mE+ZkSnFA8u+EZ1OrY+ZQImu6xQ9OAG6AFN4lOG3lexGowS+tL9XfJz
         B690N/tCOz5nweQgH7lePbyGUMN4Iy14FXXqjfxdM2kj+wxWJKJedAtAqzVAfUXvqWLr
         dsSk6AZGJcEqbIS/6P8I5nGRo3J5uWYLxlCNINU7izUrD3y45aYx97DQJ5nNXfTf48/c
         rMxuoqVhOD8xd6+WYHiPZyt5EdIA6iUX0EzTbnL17LMCE1lHTR6GjIbm/86ImShWvjya
         qvOBUG6r9CVbcdus+VGbH0s8ZGRvqq2B0brYJZbyvMRnI6EGjo4Vp3mKk2G7eYpd3wte
         HkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974174; x=1768578974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8I+9Z/SzReDIbFo3xnWDAd13nvsAbuR5scsRwJQ9D4=;
        b=Vt4Cg2QNWGMu3Lmglp4T1u6GznePdkGikK4RPRjFZxGKroMe9yEs8dZ369pdS3GtgX
         p9Uuk9o96HchUZ+JT8TTsqgTDHHdfNb/+CHMoBeIlmf99bzlZJJ+uoov0OfTie9UMIqk
         M4gJ+7HHyYA7wsZnfcYjMs/r6cmb7r/o08D5zKe86yxUVowXbpxF761fyveWaJDRbd5F
         iHMZ6WGpQ+2+h6Zz3Slhr+73GwYuREIdxlJEj4FMljftm/Z5DOEZJ3hSZXbb7xMVcqVu
         QhYJrg7AkJrGb9wNzBepg3FNUi0YbZev5w+h6OXoyEePbL/geu6lTZzNqhD+ZIlPKTrD
         mKpA==
X-Forwarded-Encrypted: i=1; AJvYcCVlUozwm0jFF5CygjlGzdft8iQgZTgUTHaRw9oKA16PUin3GTgx6EXZWIeJ8gsKuGI2e4xQRNwy28M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbtJou52oX1AZ76I6ETUZonOciblmEnE5RJNyBGRcym6O5A4fR
	bbi5ar6CcK9GxiR52E8h+JQIl+Zwpj/sKj+7pGMk/ikV3vJ/d7vD27kICvxGZvgq2JjWS6evgyU
	pPquTwg5GKc4RxvfU5iMbwMTbyNqpZO9QG/quMzXf
X-Gm-Gg: AY/fxX7Y5dlwTRhFHN2xAcfr2LvgiP0kxlzlvERXAv99FtQJ9tC3rUwsSMn9yXo6FE2
	LcZEuKalhEcwRXOpj20q7uO8YnDLAiPzSjlbBsazK3/zxQ4Me2AQIyZrqstG6OJz8JlMhdQJ02+
	zuqhXXSXETpUB+MfwL8QIwgfmiciZRS4gguRp5ZyuvqX8ox7Co4H39OUFPpmJKN2B689CAfxHBo
	A9Ool7F27cBh21q98H7jPKK08YgVbxA3xv5j2oxuEJmNDG55BIIgK/CBVF4c6Y8HYVdhL4O
X-Received: by 2002:a05:622a:206:b0:4ff:a96a:90fc with SMTP id
 d75a77b69052e-4ffca10c9e7mr11956941cf.0.1767974173794; Fri, 09 Jan 2026
 07:56:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-11-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-11-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 15:55:36 +0000
X-Gm-Features: AZwV_Qjl7-V6jtqPJiWFE-pNSysqHN43mjzymjYZ55x2bRwN0FRgaHUdOP2UPAs
Message-ID: <CA+EHjTznZj94NFVQGG8Bi0=kkQUMYA0omdGS++83jwLj-CDRNQ@mail.gmail.com>
Subject: Re: [PATCH v9 11/30] KVM: arm64: Define internal features for SME
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

Hi Mark,

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> In order to simplify interdependencies in the rest of the series define
> the feature detection for SME and it's subfeatures.  Due to the need for

nit: it's -> its

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> vector length configuration we define a flag for SME like for SVE.  We
> also have two subfeatures which add architectural state, FA64 and SME2,
> which are configured via the normal ID register scheme.
>
> Also provide helpers which check if the vCPU is in streaming mode or has
> ZA enabled.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>


> ---
>  arch/arm64/include/asm/kvm_host.h | 35 ++++++++++++++++++++++++++++++++++-
>  arch/arm64/kvm/sys_regs.c         |  2 +-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 0f3d26467bf0..0816180dc551 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -353,6 +353,8 @@ struct kvm_arch {
>  #define KVM_ARCH_FLAG_WRITABLE_IMP_ID_REGS             10
>         /* Unhandled SEAs are taken to userspace */
>  #define KVM_ARCH_FLAG_EXIT_SEA                         11
> +       /* SME exposed to guest */
> +#define KVM_ARCH_FLAG_GUEST_HAS_SME                    12
>         unsigned long flags;
>
>         /* VM-wide vCPU feature set */
> @@ -1062,7 +1064,16 @@ struct kvm_vcpu_arch {
>  #define vcpu_has_sve(vcpu)     kvm_has_sve((vcpu)->kvm)
>  #endif
>
> -#define vcpu_has_vec(vcpu) vcpu_has_sve(vcpu)
> +#define kvm_has_sme(kvm)       (system_supports_sme() &&               \
> +                                test_bit(KVM_ARCH_FLAG_GUEST_HAS_SME, &(kvm)->arch.flags))
> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define vcpu_has_sme(vcpu)     kvm_has_sme(kern_hyp_va((vcpu)->kvm))
> +#else
> +#define vcpu_has_sme(vcpu)     kvm_has_sme((vcpu)->kvm)
> +#endif
> +
> +#define vcpu_has_vec(vcpu) (vcpu_has_sve(vcpu) || vcpu_has_sme(vcpu))
>
>  #ifdef CONFIG_ARM64_PTR_AUTH
>  #define vcpu_has_ptrauth(vcpu)                                         \
> @@ -1602,6 +1613,28 @@ void kvm_set_vm_id_reg(struct kvm *kvm, u32 reg, u64 val);
>  #define kvm_has_sctlr2(k)                              \
>         (kvm_has_feat((k), ID_AA64MMFR3_EL1, SCTLRX, IMP))
>
> +#define kvm_has_fa64(k)                                        \
> +       (system_supports_fa64() &&                      \
> +        kvm_has_feat((k), ID_AA64SMFR0_EL1, FA64, IMP))
> +
> +#define kvm_has_sme2(k)                                        \
> +       (system_supports_sme2() &&                      \
> +        kvm_has_feat((k), ID_AA64PFR1_EL1, SME, SME2))
> +
> +#ifdef __KVM_NVHE_HYPERVISOR__
> +#define vcpu_has_sme2(vcpu)    kvm_has_sme2(kern_hyp_va((vcpu)->kvm))
> +#define vcpu_has_fa64(vcpu)    kvm_has_fa64(kern_hyp_va((vcpu)->kvm))
> +#else
> +#define vcpu_has_sme2(vcpu)    kvm_has_sme2((vcpu)->kvm)
> +#define vcpu_has_fa64(vcpu)    kvm_has_fa64((vcpu)->kvm)
> +#endif
> +
> +#define vcpu_in_streaming_mode(vcpu) \
> +       (__vcpu_sys_reg(vcpu, SVCR) & SVCR_SM_MASK)
> +
> +#define vcpu_za_enabled(vcpu) \
> +       (__vcpu_sys_reg(vcpu, SVCR) & SVCR_ZA_MASK)
> +
>  static inline bool kvm_arch_has_irq_bypass(void)
>  {
>         return true;
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index c8fd7c6a12a1..3576e69468db 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1945,7 +1945,7 @@ static unsigned int sve_visibility(const struct kvm_vcpu *vcpu,
>  static unsigned int sme_visibility(const struct kvm_vcpu *vcpu,
>                                    const struct sys_reg_desc *rd)
>  {
> -       if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
> +       if (vcpu_has_sme(vcpu))
>                 return 0;
>
>         return REG_HIDDEN;
>
> --
> 2.47.3
>
