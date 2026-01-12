Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36491311C33
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 19:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244964; cv=pass; b=BVvUZnoVONQRNYI4M2v1e+6a6+a9VJnZQVOWInPXo1PXa02SDj8pVUM+DGzTGS1hvm+JR22Sivr7CZSGVqaKoWH/LvJsB/BxFB95wUegnWdZZThQvoBy4KGdlf4boAfrW8G0Rtc6swDe7K2mJP7u10LUSuAkCEvf2jRFs+Bg1jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244964; c=relaxed/simple;
	bh=xheA9QOjQXvJoAbTTZVMmFI6y8wl+wMqp+t7iExkGCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hDj+IK8n6aQmG61lbkYBEpmTQELfYnOVbnnpp8wfwNDs9MWVyb4E+6CU+4UBQdXWrK0odauddwP/AfgaUaiOTzb9oKrX4rjPy8q4ojvowjj0mqs3AWgo0NgxWNZ7ngqfl2nyTFVEAZVdciboQ1VW5w/cKipaKX61qV3hFuFcS0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U1TkGW3R; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U1TkGW3R"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ee147baf7bso30171cf.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 11:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768244962; cv=none;
        d=google.com; s=arc-20240605;
        b=GtBWFpqC+TpRBg+USx6fP92amzaBR9ApcXLXZIqdzfbc450gF1q+36CbX76bIZ2K1s
         JFQYCUZC87MFSt9LWCpfD3m/Jo43bZv7VoiNfMvmhw8iIVj0Ls1zPuVeAF9+F8UBo2jF
         yFV5Lr5vLwIkBws800bXIJGxZ1vu/C1Rw1cVrbrXCZsz4ppMOgyC/W0mcs+/+QJdOTdR
         n9cXQAJm74qEsEzs3bscMrGsR1Kt2Ufkl8rcNe9E19/iIu7+jX30cQ0X6Y1ArvuC2Xtp
         52cBVxmsnoCy3GX1Q0/EYe04/AcDcQZchPqDegc3FmoJYLJfZ7wjISSKavNn8H9HTpMD
         H/8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=;
        fh=eCUdMhaicW3Gi/UGtNkuoEMFk/EfSClYU33KhpRtx+s=;
        b=NZmH1ByF7W19fTXDJnzdoq60NNQTcBbYMtnTUcc79fb6VBm4nI+WPpHvdSKjm51gsE
         I/5j386yZIfwNVvQaDShpKTW71bGlEHUfgDjxA8l4XNFEagyG3ueq6xbt/9ZBlNI2Ubs
         3HOK1kXBy8pHAjkmBxsOFpxw/y3B7NXkeYACpgoWcO6UTN+MDxjRHMqVzCC/gGzrCaAk
         ufk00gukjuEMtXtLUqIAoGcNXJCaO3SHVrF6etvDO7aTLBwd3UFRMJo8w0Zrw+jsfvvT
         RmvYvoBjyVhtWwxmlSB+M0VaVZMVP24ee+ZAkVFQqdwAjBCXRIrWak6VE0leGmprxgpM
         soNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768244962; x=1768849762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=;
        b=U1TkGW3R2x+Jm1Pqun+QQoL77XNSM9nOE+Fz+CrfJ93zk0CE7+AJwyG98eqiZmyiej
         L9KNXhyjWHI5cayiwuTkfCGdFUg7mDGoQcKiKKbskcsjbhY+r10zKCoFmkWjT8DMWPlS
         rPlU+ORQYeoGommPU8tNnoL6uPjteH3Uz3B3Mj/57WWR6/CNrBfp6hHXQ9P+EFdlAAV6
         WcsBWaiDdpwin02CD4Zq50j4qZU7/M+QfcguzRufpcImsoCsqAyOSnl9z9OY825EtGaO
         bb1MwRlr5G2xLxwYbJgx5t61IdQwipA+NrmEfZvfyvIM66HgJRffSjO3mkPBAu0M8zgh
         vmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768244962; x=1768849762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI3Qkkbb89cv5bbaE9HcvbYXyBW2GfCAOd3nwRVqS/M=;
        b=GGHpv9UexbfHQLEvGSiUVrXX61W/qpSLyF4YyTlXmxHlBVNyI3lz/WV6eojp05OJjH
         nDgiBjhW8ci9MoCKrLFt8F8wuc9vPEnfBCq7DEHTPllkYbroYK/FrZJiSViLFzlISmi8
         cmZduoF5GcrgVBcwJRHxQ3k1PtOBAvgJSnyVqLJnzm00hn23KXA5TC5jo57oHDXV5M0+
         VgzONVk1tJcAoQQ5YASRGCO5prX8JAUhTD//L8wRw2jiOa1E4NfWNk+n4X9wo+vixwKG
         pi78/5+85JPYdw2bgJfx55foGQJpOPCd81Gax6EBsbbmqr/tw0k216zjexUbhrabYc0w
         +pNA==
X-Forwarded-Encrypted: i=1; AJvYcCUaTf+R0OLeoDWG54RoYt4hvRQ5vggQl83pZoCUuiWQ503eVvWkUV7fJWFjh2wkDSYNZgCQui/KqVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC6+g6djs2nP87QIxGO31ZXXRZxaTDzjc2Nldie7zugIM37iPH
	LQkUEScv/QiK+nEr0aPqfdroUYIAgxaCnTzvZPpu9pBUXVbxLhhj6sKzfgojqapJLN13u7Ae502
	vRptP7rm4bJUKijShCb3xPqWcm0xZ/ZPBIACxUHSK
X-Gm-Gg: AY/fxX7L8+2GwK7m2e15JAJwnEjbw5TZehYWu5TqsxJNIlBazq7QE9iXX5DeNYsIE4w
	UJeI3ueS9StLVH5RHCuEHfBBTdwWztNESG8QvSF1Y+PqrYdG4Oggc3I2BCElG3N+eJw51/9oXm9
	aMTAjU3wot04NW6IFBqAwn/qcrJ+e+SytEuDUPhnYl0AV+QuyodMp2fffCpfG/HDrk1sSZdRWWA
	Kqd99uyfUHApDDo514MtBmBQwb4dSe9a9bWEn9wbaRoYKhFmuwRVNKxR0+MxJF5Tp5QUYq8
X-Received: by 2002:ac8:5d42:0:b0:4f1:9c6e:cf1c with SMTP id
 d75a77b69052e-5013a41792cmr752671cf.17.1768244961509; Mon, 12 Jan 2026
 11:09:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-21-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-21-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 19:08:00 +0000
X-Gm-Features: AZwV_Qjgu-sXQZIHm3TAlOW62aUWk-t7wcra038ZJt2_3BJ_d28PSVA3xv4zVCM
Message-ID: <CA+EHjTz4vDFdhbZMz6mNacdzSJLFfVbQKMGmSo=Vt9bSB4ho0Q@mail.gmail.com>
Subject: Re: [PATCH v9 21/30] KVM: arm64: Flush register state on writes to
 SVCR.SM and SVCR.ZA
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
> Writes to the physical SVCR.SM and SVCR.ZA change the state of PSTATE.SM
> and PSTATE.ZA, causing other floating point state to reset. Emulate this
> behaviour for writes done via the KVM userspace ABI.
>
> Setting PSTATE.ZA to 1 causes ZA and ZT0 to be reset to 0, these are stored
> in sme_state. Setting PSTATE.ZA to 0 causes ZA and ZT0 to become inaccesible
> so no reset is needed.

nit: inaccesible -> inaccessible

>
> Any change in PSTATE.SM causes the V, Z, P, FFR and FPMR registers to be
> reset to 0 and FPSR to be reset to 0x800009f.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h | 24 ++++++++++++++++++++++++
>  arch/arm64/kvm/sys_regs.c         | 29 ++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 44595a789a97..bd7a9a4efbc3 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1147,6 +1147,30 @@ struct kvm_vcpu_arch {
>
>  #define vcpu_sve_state_size(vcpu) sve_state_size_from_vl((vcpu)->arch.max_vl[ARM64_VEC_SVE])
>
> +#define vcpu_sme_state(vcpu) (kern_hyp_va((vcpu)->arch.sme_state))
> +
> +#define sme_state_size_from_vl(vl, sme2) ({                            \
> +       size_t __size_ret;                                              \
> +       unsigned int __vq;                                              \
> +                                                                       \
> +       if (WARN_ON(!sve_vl_valid(vl))) {                               \
> +               __size_ret = 0;                                         \
> +       } else {                                                        \
> +               __vq = sve_vq_from_vl(vl);                              \
> +               __size_ret = ZA_SIG_REGS_SIZE(__vq);                    \
> +               if (sme2)                                               \
> +                       __size_ret += ZT_SIG_REG_SIZE;                  \
> +       }                                                               \
> +                                                                       \
> +       __size_ret;                                                     \
> +})
> +
> +#define vcpu_sme_state_size(vcpu) ({                                   \
> +       unsigned long __vl;                                             \
> +       __vl = (vcpu)->arch.max_vl[ARM64_VEC_SME];                      \
> +       sme_state_size_from_vl(__vl, vcpu_has_sme2(vcpu));              \
> +})
> +
>  /*
>   * Only use __vcpu_sys_reg/ctxt_sys_reg if you know you want the
>   * memory backed version of a register, and not the one most recently
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 51f175bbe8d1..4ecfcb0af24c 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -927,6 +927,33 @@ static unsigned int hidden_visibility(const struct kvm_vcpu *vcpu,
>         return REG_HIDDEN;
>  }
>
> +static int set_svcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +                   u64 val)
> +{
> +       u64 old = __vcpu_sys_reg(vcpu, rd->reg);
> +
> +       if (val & SVCR_RES0)
> +               return -EINVAL;
> +
> +       if ((val & SVCR_ZA) && !(old & SVCR_ZA) && vcpu->arch.sme_state)
> +               memset(vcpu->arch.sme_state, 0, vcpu_sme_state_size(vcpu));
> +
> +       if ((val & SVCR_SM) != (old & SVCR_SM)) {
> +               memset(vcpu->arch.ctxt.fp_regs.vregs, 0,
> +                      sizeof(vcpu->arch.ctxt.fp_regs.vregs));
> +
> +               if (vcpu->arch.sve_state)
> +                       memset(vcpu->arch.sve_state, 0,
> +                              vcpu_sve_state_size(vcpu));

If sve_state isn't allocated, this means that we've gotten here before
finalization. Is it better to return an error rather than silently
skipping this?

> +
> +               __vcpu_assign_sys_reg(vcpu, FPMR, 0);
> +               vcpu->arch.ctxt.fp_regs.fpsr = 0x800009f;

This matches the Arm Arm, but can we use a define or construct it,
rather than using a magic number?

Cheers,
/fuad


> +       }
> +
> +       __vcpu_assign_sys_reg(vcpu, rd->reg, val);
> +       return 0;
> +}
> +
>  static unsigned int pmu_visibility(const struct kvm_vcpu *vcpu,
>                                    const struct sys_reg_desc *r)
>  {
> @@ -3512,7 +3539,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>                     CTR_EL0_DminLine_MASK |
>                     CTR_EL0_L1Ip_MASK |
>                     CTR_EL0_IminLine_MASK),
> -       { SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility  },
> +       { SYS_DESC(SYS_SVCR), undef_access, reset_val, SVCR, 0, .visibility = sme_visibility, .set_user = set_svcr },
>         { SYS_DESC(SYS_FPMR), undef_access, reset_val, FPMR, 0, .visibility = fp8_visibility },
>
>         { PMU_SYS_REG(PMCR_EL0), .access = access_pmcr, .reset = reset_pmcr,
>
> --
> 2.47.3
>
