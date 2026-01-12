Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA7528D83F
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 12:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219204; cv=pass; b=VY741dWozCIWu9ckHibfRaojFA1UhDuUx3vwxMybfFuM4nNPRlCJLpAlj61pZMbe2t2H+GqmXVtbwP+obMfakKNfxWdQ0y3RtlEpCk9PZc/JqI/lKiFdkIJp1vEGbkuxyoDVGKdP4QH3+F+ja/dm4+GcsQFcbxqoOhaFc83Y2vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219204; c=relaxed/simple;
	bh=M1jG2cxx4p2/zCe7hGXotN8Edhf4Ww+MYu2JyhVnpu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OAn1S4oc5wAuxClpWP8nGq+2EGoq/GWv0xbnEn/I+iw9ViCdfHT+A6BSyUpa4rucRh4MaZoB+fPkM6vNNaLVdtguAHgqnKx0royV4NKSJI/HlpZ2fYY1gGCIKIGMMQExgXxU9Inl9GC/IT/gzoy205gHQRcIe0dkgv+UiDzNr1U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=11e86b3Q; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="11e86b3Q"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ffbaaafac4so898211cf.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 04:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768219200; cv=none;
        d=google.com; s=arc-20240605;
        b=bkKC/sWLbZ9swZ2uNjMlTb3er7NfgJ4gcT6Dr2N5CGH+IxYqKYiF/AYEr34g5IqzhQ
         NJ+5Nuz3iDhv0ZxiBxiAkKk6b5jKGEqBbO0x7kAIqCelp+wZ0WTWYw8h7Bc4C9BahC5N
         dinKmfVxo7Rv0LRn0IfrR1HAQIzIWIkTYECeZngNCUK+5IuqF9yRj7G2CSnZzTUHB2wJ
         LtgtvFP+VXrqje24+9XzD6XcXqaoN4s8/qoOcMxO0+4nlw9x0Og8HyLMe0IjWjC8YTJ6
         0+xEWRitg5jVxh5gguqJYeuQ/YiP1+/D/sBDs/imCqFQymkDLTovzkLNAIc3P2W+h81u
         BM3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=;
        fh=Bky8R3FhYL728hw38FAP+1/wddrgLHmhL3f2d7b5kKc=;
        b=UDvFumQMMoVutmFgdfM99IXQyP0wcMxtzpQ/mTS8IofrSiRxtg+XYczPnI3/2IF9UW
         FfWf6Ic3we1JdBEl3VF9s5/AwzDezn279Wv/kJgQAs0BvXYetX1DeXbxj48bUhE+2Xuf
         amou6jgUvBwFQa/KgN9IY/joG4HFLsa3rwzsyP+dB6csigmgJg2/pWEfvdAirzAS9f6t
         XK4WlyEup+V3DFnLw8cNEd4Dv6BPlATRrWe8l3AcwOxW5koFVs0/ABOT56+ywUjZiFNf
         YsfszHmcErExe4inqs+G/9MCXKUvbdiYPvxbUlGETLDPJMZw5ZmoenwbIIX4uQmgNrx6
         h0fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768219200; x=1768824000; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=;
        b=11e86b3QirQAm41SBurW1OKLLPaCXpxVX7VvUMfIbItpcbi1tp57XTLiZx8rS3SSPh
         yDK5igT+AO5VgcWVL1K57dQDLq9RIMMCK8ej36gQ5a6ul319bmdmUz94z+bOjSLN2GLp
         9RZ1zeVIlBMYh+A5pTJhySFtVfm2aeW6c5tI+E5wX0AvyZQxzJzOis35KSdnAbP7UStv
         fy+/f1EiCMFw6dzFpkcxMlrj3t5C1s5c9IhykeRPLw0eMt0+s8ZV0iWVfRFy+31hoy4p
         NOpRHapAWPClp/Zkpo7kcFQBQt9GC659KiLLYSnu/P/LKpSKE8p3HIB4QDNJAeaTkrJn
         qE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219200; x=1768824000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhverceljAAUxMEU3GTIMI93Myxn5CKaFJOdFr79HIY=;
        b=LaaeM3XOdH9wxetCjtVgC9HvGTLcr2BHnnPB5ZdUuchL+Jq52Jq1W3nJosr13PJGPN
         wjGMOwfXyofFrcDGsTpqq5vTW1hERD2omZc+6OwPD+bymz0OOMMnhMs/ryEyLwp8NB3F
         sghZpDUtLNp4n3xuH2CMrU1ypwrtXHOM0m9WpeDK0Y0zeoI/kXWpSuUC8getGZnIYx/8
         NqUUCQlvJkjekypWNktA9kpRbnUdQhG8laeBg+SdhcjPvZQek01aTI7my5hwU9qTLiXo
         on+DGDatTt46wCUcP6/DACKo5ezfcZlqFwefJ6lC12RB6L4i6I4yYT4KNB/G75HPFRjh
         s/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXH8VjUi7mIJr62d2mRf3MMlQDlCpHgbIjCT+lhlCLdyBBSLUkoqRhGI4tz+wN2pKHPvdSCHcBBmZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfKQ97jMY+iP7C+eIvEOWwdCviKV1J2Qzg6aDPOynkSQooRZx
	BFC6ock0Vc+9RP1gMTN2wg229n4s5y+d+KQn4+CgL8bIz7Kv/wuVcx2r8JX3+QviLlT/ZvCGee/
	Zhi39H1EGcf/i40vjfFFZuHeL3Fie7ZSpkmOosXig
X-Gm-Gg: AY/fxX7qh3fnIrUXpilBhiidhtvGHjU3BOk0EZBqdQ1KX/mVokFynhpIM94Mp3JBkO1
	TlDiKj/Ud29+6G/1NfN5elnyI5QQySj3QIBfs6l+geq00tBqzHsNHQuC48hM/gQ9+E82I282DEq
	3kZQpij9N39bzNkrU5FLap3neGyx6ai+aEWDmptZcsgydjbOIR3RmW2oPjLmaJMVJ5M5GFzE70z
	RPZhqSA1GjNRXgQ+GkSx39ecPocJDb4FqHfQakRXbzevunrOzsSjYsCrr6yUNcou+iA4XlB
X-Received: by 2002:ac8:5891:0:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-5011979b086mr17248321cf.15.1768219199451; Mon, 12 Jan 2026
 03:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-18-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-18-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 11:59:22 +0000
X-Gm-Features: AZwV_QjlL10TIxuJSo-17cIhu7wpBka538OyBuaIYcHbCwZvW100GJwAVVv1kGY
Message-ID: <CA+EHjTwxc=+1TodVR7X96fnKu-mykivdFxMbB5nUrw_h4MGKHg@mail.gmail.com>
Subject: Re: [PATCH v9 18/30] KVM: arm64: Support SME priority registers
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
> SME has optional support for configuring the relative priorities of PEs
> in systems where they share a single SME hardware block, known as a
> SMCU. Currently we do not have any support for this in Linux and will
> also hide it from KVM guests, pending experience with practical
> implementations. The interface for configuring priority support is via
> two new system registers, these registers are always defined when SME is
> available.
>
> The register SMPRI_EL1 allows control of SME execution priorities. Since
> we disable SME priority support for guests this register is RES0, define
> it as such and enable fine grained traps for SMPRI_EL1 to ensure that
> guests can't write to it even if the hardware supports priorites.  Since

nit: priorites -> priorities

> the register should be readable with fixed contents we only trap writes,
> not reads. Since there is no host support for using priorities the
> register currently left with a value of 0 by the host so we do not need
> to update the value for guests.
>
> There is also an EL2 register SMPRIMAP_EL2 for virtualisation of
> priorities, this is RES0 when priority configuration is not supported
> but has no specific traps available.  When saving state from a nested
> guest we overwite any value the guest stored.

nit: overwite -> overwrite

>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/kvm_host.h     |  1 +
>  arch/arm64/include/asm/vncr_mapping.h |  1 +
>  arch/arm64/kvm/config.c               |  3 +++
>  arch/arm64/kvm/hyp/vhe/sysreg-sr.c    |  7 +++++++
>  arch/arm64/kvm/sys_regs.c             | 30 +++++++++++++++++++++++++++++-
>  5 files changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index fead6988f47c..44595a789a97 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -546,6 +546,7 @@ enum vcpu_sysreg {
>         VNCR(CPACR_EL1),/* Coprocessor Access Control */
>         VNCR(ZCR_EL1),  /* SVE Control */
>         VNCR(SMCR_EL1), /* SME Control */
> +       VNCR(SMPRIMAP_EL2),     /* Streaming Mode Priority Mapping Register */
>         VNCR(TTBR0_EL1),/* Translation Table Base Register 0 */
>         VNCR(TTBR1_EL1),/* Translation Table Base Register 1 */
>         VNCR(TCR_EL1),  /* Translation Control Register */
> diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
> index 44b12565321b..a2a84af6585b 100644
> --- a/arch/arm64/include/asm/vncr_mapping.h
> +++ b/arch/arm64/include/asm/vncr_mapping.h
> @@ -45,6 +45,7 @@
>  #define VNCR_ZCR_EL1            0x1E0
>  #define VNCR_HAFGRTR_EL2       0x1E8
>  #define VNCR_SMCR_EL1          0x1F0
> +#define VNCR_SMPRIMAP_EL2      0x1F0

This should be 0x1F8.

>  #define VNCR_TTBR0_EL1          0x200
>  #define VNCR_TTBR1_EL1          0x210
>  #define VNCR_FAR_EL1            0x220
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 7e26991b2df1..0088635a95bd 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1481,6 +1481,9 @@ static void __compute_hfgwtr(struct kvm_vcpu *vcpu)
>
>         if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
>                 *vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_TCR_EL1;
> +
> +       if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, IMP))
> +               *vcpu_fgt(vcpu, HFGWTR_EL2) |= HFGWTR_EL2_nSMPRI_EL1;

Is the intention to _disable_ the trap in this case? I think you
wanted to enable them.

>  }
>
>  static void __compute_hdfgwtr(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> index f28c6cf4fe1b..07aa4378c58a 100644
> --- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> +++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
> @@ -80,6 +80,13 @@ static void __sysreg_save_vel2_state(struct kvm_vcpu *vcpu)
>
>         if (ctxt_has_sctlr2(&vcpu->arch.ctxt))
>                 __vcpu_assign_sys_reg(vcpu, SCTLR2_EL2, read_sysreg_el1(SYS_SCTLR2));
> +
> +       /*
> +        * We block SME priorities so SMPRIMAP_EL2 is RES0, however we
> +        * do not have traps to block access so the guest might have
> +        * updated the state, overwrite anything there.

nit: overwrite -> overwriting

Cheers,
/fuad

> +        */
> +       __vcpu_assign_sys_reg(vcpu, SMPRIMAP_EL2, 0);
>  }
>
>  static void __sysreg_restore_vel2_state(struct kvm_vcpu *vcpu)
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a7ab02822023..51f175bbe8d1 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -691,6 +691,15 @@ static bool trap_raz_wi(struct kvm_vcpu *vcpu,
>                 return read_zero(vcpu, p);
>  }
>
> +static int set_res0(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +                   u64 val)
> +{
> +       if (val)
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
>  /*
>   * ARMv8.1 mandates at least a trivial LORegion implementation, where all the
>   * RW registers are RES0 (which we can implement as RAZ/WI). On an ARMv8.0
> @@ -1979,6 +1988,15 @@ static unsigned int fp8_visibility(const struct kvm_vcpu *vcpu,
>         return REG_HIDDEN;
>  }
>
> +static unsigned int sme_raz_visibility(const struct kvm_vcpu *vcpu,
> +                                      const struct sys_reg_desc *rd)
> +{
> +       if (vcpu_has_sme(vcpu))
> +               return REG_RAZ;
> +
> +       return REG_HIDDEN;
> +}
> +
>  static u64 sanitise_id_aa64pfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>  {
>         if (!vcpu_has_sve(vcpu))
> @@ -3349,7 +3367,14 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>
>         { SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
>         { SYS_DESC(SYS_TRFCR_EL1), undef_access },
> -       { SYS_DESC(SYS_SMPRI_EL1), undef_access },
> +
> +       /*
> +        * SMPRI_EL1 is UNDEF when SME is disabled, the UNDEF is
> +        * handled via FGU which is handled without consulting this
> +        * table.
> +        */
> +       { SYS_DESC(SYS_SMPRI_EL1), trap_raz_wi, .visibility = sme_raz_visibility },
> +
>         { SYS_DESC(SYS_SMCR_EL1), NULL, reset_val, SMCR_EL1, 0, .visibility = sme_visibility },
>         { SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
>         { SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
> @@ -3719,6 +3744,9 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>
>         EL2_REG_VNCR(HCRX_EL2, reset_val, 0),
>
> +       { SYS_DESC(SYS_SMPRIMAP_EL2), .reg = SMPRIMAP_EL2,
> +         .access = trap_raz_wi, .set_user = set_res0, .reset = reset_val,
> +         .val = 0, .visibility = sme_el2_visibility },
>         EL2_REG_FILTERED(SMCR_EL2, access_smcr_el2, reset_val, 0,
>                          sme_el2_visibility),
>
>
> --
> 2.47.3
>
