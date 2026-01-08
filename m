Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5C4ABFC1
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767881430; cv=pass; b=hGcQ0lEKS/XioCo+oAtdC16rgFaEj+p2xFaAILwx+GzmE/Dh2oUBS9kXFwCnj6ZLEek4YvoXwme4HKHYGgJ4M9HIFM7jXGKtXigFMas12ycFhT6Pu7fqTlyHjyUV6dfqfOYCGKlQVJ0/e1w057+WS6MV0lCuBRew4a57siQ9ygQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767881430; c=relaxed/simple;
	bh=6s+1Fa+lgma2W6VO//e9W/EKZ99EnAtWNWD0KjYryo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3ciWbqh15rNN13VHpeMQQLub0ntbmVFQB/4q6qnTDW7ikmhdV1rFRMZ0IdrXuBPwfcvplNp274OCVCCQqpUoPp8td6vD3cHrQF1o3+lXDqeP1OSza1lXLh3Q3p7E4eWoIfnAYBFL4K+8pvlKzHdk/K4vQGMgCqOd8Fo5juhdw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hh+edRsd; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hh+edRsd"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee243b98caso845981cf.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 06:10:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767881427; cv=none;
        d=google.com; s=arc-20240605;
        b=MNosMD5dTy3ZGWw6640SEaGiFDTRJfWAa5kic0hfRDZ9lEDmNysZ0PZ09O8U2zHups
         r9VcIdDePUg6nZbTPemF0FRQtJXhkUdy7hHoZvceKbSLvej9dUs7xiTbLpzf1kLuw8q/
         Xk9xA8dIi12UtrnWyv/CHOcnwHAj94MRD+Z0gIM8/EacPwfE4q01fJhniG8d+SM6Bl9Q
         HahUt4BGnExSoGfUMdVFRZbNtinr+ZdhEi2c5unuwTBqvNHqTTG4DEbYTfIfB2AymTzY
         8/bKFu69l5ED6jgcOD+fKdfwOhpJWM2/z0LX7/hAOMLrX/M58wUYVnW3aolU4Bb9KfHy
         2pOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=;
        fh=FPLLiiM0U5MFHlzteGfBswE+69vjqbeDcJuMcuQSyac=;
        b=EXW1uLPciF/El0GEi4i+HWjKTgF9ppKaEmH593AmRS7cWS0udD/sHW++JxCdA5VSyj
         16R41aOjD8wj3rK3I1orhTKdDh4HYVKj4TYEYmk7noERPubqAClCBARzTAO/kJ5QCYrj
         2WPlhukhkOTzKwLTCJQ7+9X3ILAZAmTEED18iCHaDLkSOqo+Kc7mY/gIMKXiPBVRuoi/
         wA0Xdla48WGK78TtWS1emoCZ909XrECgFY1vSfQyCz1Yw4S9ZRhaEiv+dkPw4JMUWg0o
         5scXuCj2cXOB7UE2Mg44JpJ/LQR8KHfu2193sit/3iZ2tCLWk+zM+YcBduvb2qXPZwhS
         IsqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767881427; x=1768486227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=;
        b=hh+edRsdP3j8FirfLiyEGrzOOXApW88U+v02QYWE5AV+tspa/pUm0oPm2EnxRQ+E6h
         QW4ucjynddmBipIgLDIXu4/CCUKDoFB8gHMsOdRYtT2bXy3+Ri3CAL/hxf9XMsLTiBr6
         OWbmMXnkdmF1TbddIf52CIftJ7VwuHOaAVmxCNMeDbXyVXD0kL1+XVOBNSHF6rjjz9bX
         LLo59wasQtkhD0QQqjeG96GJGVlL/eV26LzzQ/lTwj4kY5K6FYYYImicoyoyWwB/PmNU
         ECV8p92C0RDkSBloU3DBjN9PdlfKTticCX+3dLI/mlCHj4+SB6nT25+0Ir6ara6oI98s
         mTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767881427; x=1768486227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkFBVVF2FUVuKrFgmcHW8CUldvJtVwVqevSTZGxcxL0=;
        b=TT6wWvcdUyIs22fx8r+q1l5ZpeqvqA8tKBeTwHQSpxhC1b7cgihmxQM8AXenFSCWZb
         Gr3p2WGbUcSDads0eScXcLioNHleVv5E3E6fiYatC1nBSM4Ohw8uVWf76KC3GM5KhfM4
         tu1YQD4GTUQCQitgDrOpUxQIN9/ec74z8sm7raPFT7Jb8yaooXiXdEfAxaWyZEWVdoZr
         clhFAO5yh/VrHUWWgQlqdHx88HZzsTRbAwqxDHazw8zNqWX03TGW64eYwLroMqS8HW94
         X1wAb1BAHLy2H+1KpTeA7iwxDp5laysC4SHCHs6AF8Z1lgwazfYt2QyufvVbNocb69P1
         zY8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBNBwr3rWVqJ0/085QvleTEndhYULt2cwqG2fi80fWUUyFOxqoMBOJ4rnGcjHEmZa43TYI3c59h/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhn8JIqb48tzToUmeuGfOnafKg4NWK7bGwSzsPNmsEKuvQUiTY
	c997y3DAQIpBjSBnccXpsGduJ/WJlw3pGbeCZUPv9qN4donUCpC+l66dMBcJlWui1ELPnCqaJbV
	buO25mY7V4Rk5J2/fxwWkVZvq6KPGGPochcXa/9Cp
X-Gm-Gg: AY/fxX4s61oqBWmqpnVikrCSBEL6gmv64tCPf4zPwHasEJ3gSJjqhRlpcTOEKSW9n5v
	0VyWxM3Ir76FqjY4hhLMhW97WLA8h0giBB2SXpQ5i0aPHYFV0Ou7s4q6xfnt3Hzri/0BG3BOeyr
	dnrjmnpNbolHG5hPgKnVyhrH4d6fdQMh+f9kU58IQGblCdCGyg0+IPJN/jm3DTM3rSywxE2H2/z
	/h5C5NE8GNOKRH2DoQRj/3H8Dyvb1IZM6mTtvEnSVxi9E0YRziij0/BtdalALfGaOeerm4HbFcK
	8LttuQw=
X-Received: by 2002:a05:622a:54a:b0:4f4:bb86:504f with SMTP id
 d75a77b69052e-4ffc0a70687mr8479691cf.16.1767881426893; Thu, 08 Jan 2026
 06:10:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-8-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-8-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 8 Jan 2026 14:09:50 +0000
X-Gm-Features: AQt7F2q2Xuj85YtjC8aNYrYefXO_WXhklsHw1E8DTYu1HFx1qzlPPDyk9yC5egA
Message-ID: <CA+EHjTx8hu=WEu54Bt82PtcsOdQHaVkw9ivQSSC9=SV7bf1Zvg@mail.gmail.com>
Subject: Re: [PATCH v9 08/30] KVM: arm64: Move SVE state access macros after
 feature test macros
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
> In preparation for SME support move the macros used to access SVE state
> after the feature test macros, we will need to test for SME subfeatures to
> determine the size of the SME state.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad



> ---
>  arch/arm64/include/asm/kvm_host.h | 50 +++++++++++++++++++--------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ac7f970c7883..e6d25db10a6b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1048,31 +1048,6 @@ struct kvm_vcpu_arch {
>  #define NESTED_SERROR_PENDING  __vcpu_single_flag(sflags, BIT(8))
>
>
> -/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> -#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> -                            sve_ffr_offset((vcpu)->arch.sve_max_vl))
> -
> -#define vcpu_sve_max_vq(vcpu)  sve_vq_from_vl((vcpu)->arch.sve_max_vl)
> -
> -#define vcpu_sve_zcr_elx(vcpu)                                         \
> -       (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> -
> -#define sve_state_size_from_vl(sve_max_vl) ({                          \
> -       size_t __size_ret;                                              \
> -       unsigned int __vq;                                              \
> -                                                                       \
> -       if (WARN_ON(!sve_vl_valid(sve_max_vl))) {                       \
> -               __size_ret = 0;                                         \
> -       } else {                                                        \
> -               __vq = sve_vq_from_vl(sve_max_vl);                      \
> -               __size_ret = SVE_SIG_REGS_SIZE(__vq);                   \
> -       }                                                               \
> -                                                                       \
> -       __size_ret;                                                     \
> -})
> -
> -#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
> -
>  #define KVM_GUESTDBG_VALID_MASK (KVM_GUESTDBG_ENABLE | \
>                                  KVM_GUESTDBG_USE_SW_BP | \
>                                  KVM_GUESTDBG_USE_HW | \
> @@ -1108,6 +1083,31 @@ struct kvm_vcpu_arch {
>
>  #define vcpu_gp_regs(v)                (&(v)->arch.ctxt.regs)
>
> +/* Pointer to the vcpu's SVE FFR for sve_{save,load}_state() */
> +#define vcpu_sve_pffr(vcpu) (kern_hyp_va((vcpu)->arch.sve_state) +     \
> +                            sve_ffr_offset((vcpu)->arch.sve_max_vl))
> +
> +#define vcpu_sve_max_vq(vcpu)  sve_vq_from_vl((vcpu)->arch.sve_max_vl)
> +
> +#define vcpu_sve_zcr_elx(vcpu)                                         \
> +       (unlikely(is_hyp_ctxt(vcpu)) ? ZCR_EL2 : ZCR_EL1)
> +
> +#define sve_state_size_from_vl(sve_max_vl) ({                          \
> +       size_t __size_ret;                                              \
> +       unsigned int __vq;                                              \
> +                                                                       \
> +       if (WARN_ON(!sve_vl_valid(sve_max_vl))) {                       \
> +               __size_ret = 0;                                         \
> +       } else {                                                        \
> +               __vq = sve_vq_from_vl(sve_max_vl);                      \
> +               __size_ret = SVE_SIG_REGS_SIZE(__vq);                   \
> +       }                                                               \
> +                                                                       \
> +       __size_ret;                                                     \
> +})
> +
> +#define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.sve_max_vl)
> +
>  /*
>   * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
>   * memory backed version of a register, and not the one most recently
>
> --
> 2.47.3
>
