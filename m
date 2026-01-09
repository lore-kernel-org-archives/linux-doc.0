Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E235A939
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767977854; cv=pass; b=bpO4wwuKGPz9Xwtno43mEZRKm5tlPmqH50h5reaP4ExWnUFL4e6Uu8HQm2+t3HuocWSsiXt4oMJzvLH/3Z1MH6wCtydUNNkSMVffcZm5hkDunf8xZyPeeSEvM55SJ4ZDhpaeCEtwCZaZ9cG2ePBJnbkdL/D7uVsdnh7dF8rlUMM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767977854; c=relaxed/simple;
	bh=SkjHGF8FR8F2ZPGg4e/H1IK+TJO92/b+hbarPM46pt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kgpgr6G8KY8CBoF7H3bkFVg4ha7ofE6AAgGiw29k8A7ruq6vWeuuOiNbR7AZcGT2aGgdzcPl4v7gJjr8g75fgzMVa9+ukCDjqj/PqSa17EytgHFBExHq4dkTrLNFZHCDsmXXojQbWvNlCwAQjwMTxhQ9zzKu/lnpqYONI/s2MWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1MwnqwsA; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1MwnqwsA"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ffbaaafac4so7151cf.0
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 08:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767977851; cv=none;
        d=google.com; s=arc-20240605;
        b=PjAtCfVwgAuscSqcWKJlI1LuEZk8hw73D4gmvzHo2S5EUGUb5dxUYvok8sKJj0LQ3I
         el4Mv8MTbPGblOBqpUXfTaxnDMXVMmxAbQNvfgvkVdmUzUX7wCI59mnWu54aruoHxIpy
         vUlDtQ8Bie5gsXoS83PV7nGcXpY1ukeK7RI63769zBpZNwvruB6XjrxIYvM1WERE1Ogc
         F4EX7sCt+QreAVCrGXMh1rET0Xdhao1LAbusf0Pau+niRrqmgp+Z3CJLhxV+A1os+8Ef
         KsqDiUDUxU2HuXpcW2R7nYpIEhszJZMPT82N1X+Kk9KFAZC4/NeJZOMM4GfIT0LJxDgD
         lCmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=;
        fh=SPhYHVQOb+VzeM7T5BroNV91OD+YTBnX571XIsyNzMw=;
        b=P3x9R8eYyb6kjPw6n90dj7OhoUJhtoBe+Q1+tAbTv4luXh0USsJZ3XpLwsl4uZ6n6m
         s6+lfpPCx9Ck2aLkA8zp76BHjHxzLNEAtbdqtT/Q7Z8Fy20jA5MnX6EbaVdW+G4WmRu0
         snlhFI+F/YfxHSnbswyMabT/GChfdgCRnmJG3/CTJ7sVCxLbm1EXF3N0iA5t6MiGCSaw
         ud6Z+zQ5ieUIJ9xkpcz5LenGyATt4OmPT5g3xP6cy2WT0yaIemrDMm9D3Cg5qRwUV4j4
         xPcbca/UavoMkN7kbYIBmY0mCgixiDSghMV4UJiXmWvlpkPPLsmn3QEGw0Gs7pSPdPOs
         Z7bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767977851; x=1768582651; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=;
        b=1MwnqwsA56nPfeMq/y0NAzhBtPXZtuG+jenGXdhITh3WJ0bs686hgm+uz1VQbtAw92
         TILHKrK3s4MDEwKMcWyWMHGLQUhqJEbWgiANkchDVj9ajkdbAak9B6m+LBQI9asPtn4m
         Uo2ckqThpv7ixB/7aZzhUYz5e6CWwJ1nYvo0gdCanSSBXKNjOLdMqhL2xf+BsELr1AF3
         t9QAzrTEqk6cWBDjaUsJEoI1x5iP2ZFlhm/WAtzTMuKb8J5YTLStQJ9b527ZraSR/z7j
         YUNzdCFhs9i3osWszSz8pAmjxkwduZB+L7nIg4Ca/LKmRoS7wzTLyoyCIcx85ypwapiR
         Wwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767977851; x=1768582651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpztCWy9ipsSXHs0mL6YjlVmfult44YS26X504J/dJw=;
        b=cw4n4qTSTVkjb2z7SoFr5ShJHOMuinVCEHHDqDrfl+lTkjVIA+MoIwqLxLVLBVgL9l
         S89TJI6Sltn0/Ij2KU0zI4H6BnlgiE7BGZQlWJfimB0JNJaoWTxm/RNkuqG6YensKurA
         VQl/mxz5/WuogA+NgrRuaSh6kYETiWB/AO8G0aa8KO74odL0HcYLhJqZrqlN33diuA2S
         l2hGwd0FVMX918kopqmKWXoPfwsHVFrn5NUTwGkurdk7LwfTkJd68aRLj93PwGdbjbFS
         KdMkGR//tXac2n8wgu9MwMV7Ld9YPQy8YKb0dmUrQxU9wkTosQOXrQXsmjTfaMKuWJAu
         Ka6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQU1KWOmGAn03uqnDKYT6lPw3ohUuirHSP8o31v7IGNNK9cGuHPyBhjJP4m8F7pjNI4FAlwOWL2Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfaisK9Mwx5NcLwG4a+j8npvznGc4hKfRJhyqRE1ZD9Q6EF/P
	VLzDAyuNO7+IwdbjVRBXbVdmpkRDAMFoeCf8FkcEsl8kQOeBpTmCYe91o+BkGMIrhhqPMFPGyVO
	p9hh1I/YXkCZFe83o6La3Y4e9IT1qAZLPHp4xFWma
X-Gm-Gg: AY/fxX7mWwoMycGhqhx113LTfV43uaQ/xEJoBWpcOmXez67QNHxloV2sfklbZu9WU98
	+YjH2sEj1G7hm9A9PWwNqbQDYkNyNmLJXpFIviNMkClZUpRD1C1SHOMuzG64S+z9xJ7gJihofUS
	iQysRrv87FiWrZdZkTsKdD315c47ZMwoCulTOnXJzUTRlCca8LdsVhftUp34yQzFupcLbIf8bVF
	qMtqj6f97oPl4v7KHYh0IlDpKo+YZAQwiI8uHdEx5gk315tljwifxP62Qt4T0GAUHnyAjqc
X-Received: by 2002:a05:622a:198e:b0:4e8:aa24:80ec with SMTP id
 d75a77b69052e-4ffca38a667mr12955411cf.14.1767977851098; Fri, 09 Jan 2026
 08:57:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-16-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-16-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 9 Jan 2026 16:57:00 +0000
X-Gm-Features: AZwV_QiwST85CNc25KZYMBDJwxaQzBlftzyvIde5n_9dAYz2SEbvmx43n1faTzI
Message-ID: <CA+EHjTwTmjNEV+4w8w=LXfR0g_v7yHk1pQD+Oos8V3vFfEVdMw@mail.gmail.com>
Subject: Re: [PATCH v9 16/30] KVM: arm64: Support TPIDR2_EL0
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
> SME adds a new thread ID register, TPIDR2_EL0. This is used in userspace
> for delayed saving of the ZA state but in terms of the architecture is
> not really connected to SME other than being part of FEAT_SME. It has an
> independent fine grained trap and the runtime connection with the rest
> of SME is purely software defined.
>
> Expose the register as a system register if the guest supports SME,
> context switching it along with the other EL0 TPIDRs.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/include/asm/kvm_host.h          |  1 +
>  arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h | 15 +++++++++++++++
>  arch/arm64/kvm/sys_regs.c                  |  3 ++-
>  3 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index f24441244a68..825b74f752d6 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -448,6 +448,7 @@ enum vcpu_sysreg {
>         CSSELR_EL1,     /* Cache Size Selection Register */
>         TPIDR_EL0,      /* Thread ID, User R/W */
>         TPIDRRO_EL0,    /* Thread ID, User R/O */
> +       TPIDR2_EL0,     /* Thread ID, Register 2 */
>         TPIDR_EL1,      /* Thread ID, Privileged */
>         CNTKCTL_EL1,    /* Timer Control Register (EL1) */
>         PAR_EL1,        /* Physical Address Register */
> diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> index 5624fd705ae3..8c3b3d6df99f 100644
> --- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> +++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
> @@ -88,6 +88,17 @@ static inline bool ctxt_has_sctlr2(struct kvm_cpu_context *ctxt)
>         return kvm_has_sctlr2(kern_hyp_va(vcpu->kvm));
>  }
>
> +static inline bool ctxt_has_sme(struct kvm_cpu_context *ctxt)
> +{
> +       struct kvm_vcpu *vcpu;
> +
> +       if (!system_supports_sme())
> +               return false;
> +
> +       vcpu = ctxt_to_vcpu(ctxt);
> +       return kvm_has_sme(kern_hyp_va(vcpu->kvm));
> +}
> +
>  static inline bool ctxt_is_guest(struct kvm_cpu_context *ctxt)
>  {
>         return host_data_ptr(host_ctxt) != ctxt;
> @@ -127,6 +138,8 @@ static inline void __sysreg_save_user_state(struct kvm_cpu_context *ctxt)
>  {
>         ctxt_sys_reg(ctxt, TPIDR_EL0)   = read_sysreg(tpidr_el0);
>         ctxt_sys_reg(ctxt, TPIDRRO_EL0) = read_sysreg(tpidrro_el0);
> +       if (ctxt_has_sme(ctxt))
> +               ctxt_sys_reg(ctxt, TPIDR2_EL0)  = read_sysreg_s(SYS_TPIDR2_EL0);
>  }
>
>  static inline void __sysreg_save_el1_state(struct kvm_cpu_context *ctxt)
> @@ -204,6 +217,8 @@ static inline void __sysreg_restore_user_state(struct kvm_cpu_context *ctxt)
>  {
>         write_sysreg(ctxt_sys_reg(ctxt, TPIDR_EL0),     tpidr_el0);
>         write_sysreg(ctxt_sys_reg(ctxt, TPIDRRO_EL0),   tpidrro_el0);
> +       if (ctxt_has_sme(ctxt))
> +               write_sysreg_s(ctxt_sys_reg(ctxt, TPIDR2_EL0), SYS_TPIDR2_EL0);
>  }
>
>  static inline void __sysreg_restore_el1_state(struct kvm_cpu_context *ctxt,
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 5c912139d264..7e550f045f4d 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3504,7 +3504,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>           .visibility = s1poe_visibility },
>         { SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
>         { SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
> -       { SYS_DESC(SYS_TPIDR2_EL0), undef_access },
> +       { SYS_DESC(SYS_TPIDR2_EL0), NULL, reset_unknown, TPIDR2_EL0,
> +         .visibility = sme_visibility},
>
>         { SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
>
>
> --
> 2.47.3
>
