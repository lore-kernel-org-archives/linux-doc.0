Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7238E11F
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313254; cv=pass; b=tipnkanvhCGp6C3BHsiE2neCxmMjI/oMl84eZxNAZMdCagZ6bnMgNeWUr7qoQiYLXSUO5khQ73ehKI0u2lDd8mcv1PC9J81UGEn75TpnpRCXBuaIFXVYwECKbzPxmrvnkwk85z2miTheC/JRj+XuEUdM8ZLxHedx/aojNUIDZmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313254; c=relaxed/simple;
	bh=W1BKHG2W0/GlQ7ZY8QiX4cI5B6CXeKtQHFJwinuKji4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oads0wvCyicSSJ6GVSZo/QCN4tuC5Xjzx+uZF84lt6skkc8L6Vw9kvhumYwxFkFIEVoKkdCT1bUAQdQi8LG7T6ayhYPLGqPN4gO/RELDZfJ8b3Pq6C5qCYKvzaJ95FDREgtiXrUhB7VKTQbQgow4DgK1FLQvauMLMFofK3m8Dzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SobcE576; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SobcE576"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4ee147baf7bso311221cf.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 06:07:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768313251; cv=none;
        d=google.com; s=arc-20240605;
        b=Wy1tH00JjWPpshcZoLQHUqnOqf32pa9lqTBjL/hS7iTNSBiw6ZfXpfZkI2rbbM3lfB
         kVUgO556UrRSX6UA+Q26e/OchtkrDczPhdMosPk+sMBybqCR/8V56UgzHk3zxBurUABs
         ck7i2RcfMgh7VZvjRfQND9b1I0Yqp9azYQxAYB7PhTda5UPDY0jr/cBQIeCJU7ymsZXx
         Kl1hZ/ng8y3A4bcptRf+2oTpMO5/H/gwV3WBPVfIhf4hekyrW7xq9DmJC5E1ZykJ01hH
         4mZTESDHuUr74LIHbjjX7t2zFmpczZQG2rWUmTuIVZEuk8wTrJfW7AOvXESATZGdAlXN
         PmjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=;
        fh=3KN9rAHsOLAyAyaWHzeVRT0Xvnt/U4R3wb6UnYbPRvA=;
        b=VPZa3k1RMSIpWa2vXQWxmhctRgIm3R2vuRAXdifLt9ofXnGxBK+aFXp/lrWsvjm279
         HOOBduCK22NWP8HFRqe+iM4yR4ZefhdLTKJ1a4EHCmhPeZgkWY0qA7cLtQyVmb4dqIv6
         h+XnYl/Hf0aRwfWxHEmiYVuz/v/KfLyIvzWVF4Ag0qSgMgfPV1PM6vcnGRiiB5E3G+J+
         6Cwwb3Vz6wDPEUy74Ggpk6P2lV9okjhk9RKfjrDrp78TnkVz+jpTHzsGTrd/AwRgNXSi
         O9fqsiFq7tIZ/5NexV+WVxH+CwgJwiu+WCFdYXh4zWCfzzlUFCSzmuOQJtL7EbDgL2k2
         2JdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768313251; x=1768918051; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=;
        b=SobcE576zDEqGAcmGUh8o3DcbjdHyAZcKGyX8n1P4KnMa8QIfvpcyUkM6XWZjW5yRw
         STaeoH12VgokhnW/qvJHJVjhNr/A63Jy027h06oulLP+iaBDs6S6enzCV8O43ckoRHy/
         lrceBaoI+3JBfEoX/RDimHtJ67T5qjIYyZwR9f0YdxUXhgji4v46vtRP/ZnUcR2Uwu7Z
         hKPjodRR0AEUVw+WKETTdVFx5ouw0/vQrst+T7Uxo9leBYnNvsJc/gGQTEuTY4hyY0Vb
         b3hTumts18t6JvvOK1fWE/beh46d7EQowgjQg4j8aA5VKbY723glU2itDxsG/d77Nkkd
         a6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768313251; x=1768918051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGNeqZdCFRkUH8pVy9i0xdJ5BW3N5lXnZA/HlFDK8XQ=;
        b=rJkpCg7gn7aE6EiIylL4Ch48gE3iwks/J8QjCo7grRvN4jIC4eysBUqRzN2WcKVP7e
         pePlPlbsfMLUhKI7VFXWhvtI6hWh16If80XpYNfINdOC7x39YdheblBD29lx8WCtl7Yg
         ko18Sj0I/MmhCkX/oQSYzphq0LMetgxuP3IVjSwYBipaKpt9wkcFa0QApuaiZImj44jR
         AU6o82dH4XpTNZibEPElUkkal+smbczw0MWqd62kJ/BJQbO2s9Ps9tRZTMVtAOEResfL
         iODaJf2fOqFSlB0dty+3hZeiYkGXpazMQ+A/4z8h8vwPwQbMiZIlyBO1grsHACM07D7B
         jzhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVclqRrZfhGKPiN7OCNR7S47GxyBshOXovrepWCX18isudnY14acscUm9fFZhuF6b4YZklqUytAklg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWreOUuW3R+0yxq542IDDs1yglPajpYkJF0p3vAzr4vK8eM0NW
	ifoDnZdNOp5SDvg+P7eKQZplFr2EqoigkUDzuRFr402dNa+yy4xxTYyl8Gru/l8dW331yRZFIgl
	Pxxic+HvU7rR6i2UG1c2yMwWe1fNZOIj0bejElVBD
X-Gm-Gg: AY/fxX48hlumoKOU1aeVGIx5iajBSSeKyUpHTot+Www6lpn1TQGVyQ6KHa0vJ8pU8ut
	NuiTNNTJ5RXtpeUzLbD6+7S1YgeWHThoUlMKGq7tZuqxJ7jEy+kUu3N6aRZDUH/HxRpkeeBmry9
	1Xuxm/3ABWS+HA0TW0aenG7RkZUhePL+4FyxAgAaclXgcRC8VHoHoLqeO2X5jE86nkfZf3swh5I
	DArbgbDn1aCkhGqP56ZD7jpAfqIzbXgehl13YDtGBFpQvXQFAx79QeixDFw/U43F1yxUv6KkTQd
	CjkK9gSaIS35m+s8S5hWe/6rXA==
X-Received: by 2002:ac8:7fc1:0:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-5013af6a711mr9755261cf.1.1768313250350; Tue, 13 Jan 2026
 06:07:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-22-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-22-8be3867cb883@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 13 Jan 2026 14:06:53 +0000
X-Gm-Features: AZwV_QhU40Lwhaq_0NHueSMC3WoVnp6Uc6Xt-liPmw7nnlV9MFwsJtQrpboZVDo
Message-ID: <CA+EHjTwMy1crsZLqfy8_Y56NFPJZ7vGyN-egc433GhxB_n=7aA@mail.gmail.com>
Subject: Re: [PATCH v9 22/30] KVM: arm64: Expose SME specific state to userspace
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
> SME introduces two new registers, the ZA matrix register and the ZT0 LUT
> register.  Both of these registers are only accessible when PSTATE.ZA is
> set and ZT0 is only present if SME2 is enabled for the guest. Provide
> support for configuring these from VMMs.
>
> The ZA matrix is a single SVL*SVL register which is available when
> PSTATE.ZA is set. We follow the pattern established by the architecture
> itself and expose this to userspace as a series of horizontal SVE vectors
> with the streaming mode vector length, using the format already established
> for the SVE vectors themselves.
>
> ZT0 is a single register with a refreshingly fixed size 512 bit register
> which is like ZA accessible only when PSTATE.ZA is set. Add support for it
> to the userspace API, as with ZA we allow the register to be read or written
> regardless of the state of PSTATE.ZA in order to simplify userspace usage.
> The value will be reset to 0 whenever PSTATE.ZA changes from 0 to 1,
> userspace can read stale values but these are not observable by the guest
> without manipulation of PSTATE.ZA by userspace.
>
> While there is currently only one ZT register the naming as ZT0 and the
> instruction encoding clearly leave room for future extensions adding more
> ZT registers. This encoding can readily support such an extension if one is
> introduced.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/uapi/asm/kvm.h |  17 ++++++
>  arch/arm64/kvm/guest.c            | 114 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 129 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 498a49a61487..9a19cc58d227 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -357,6 +357,23 @@ struct kvm_arm_counter_offset {
>  /* SME registers */
>  #define KVM_REG_ARM64_SME              (0x17 << KVM_REG_ARM_COPROC_SHIFT)
>
> +#define KVM_ARM64_SME_VQ_MIN __SVE_VQ_MIN
> +#define KVM_ARM64_SME_VQ_MAX __SVE_VQ_MAX
> +
> +/* ZA and ZTn occupy blocks at the following offsets within this range: */
> +#define KVM_REG_ARM64_SME_ZA_BASE      0
> +#define KVM_REG_ARM64_SME_ZT_BASE      0x600
> +
> +#define KVM_ARM64_SME_MAX_ZAHREG       (__SVE_VQ_BYTES * KVM_ARM64_SME_VQ_MAX)
> +
> +#define KVM_REG_ARM64_SME_ZAHREG(n, i)                                 \
> +       (KVM_REG_ARM64 | KVM_REG_ARM64_SME | KVM_REG_ARM64_SME_ZA_BASE | \
> +        KVM_REG_SIZE_U2048 |                                           \
> +        (((n) & (KVM_ARM64_SME_MAX_ZAHREG - 1)) << 5) |                \
> +        ((i) & (KVM_ARM64_SVE_MAX_SLICES - 1)))
> +
> +#define KVM_REG_ARM64_SME_ZTREG_SIZE   (512 / 8)
> +
>  /* Vector lengths pseudo-register: */
>  #define KVM_REG_ARM64_SME_VLS          (KVM_REG_ARM64 | KVM_REG_ARM64_SME | \
>                                          KVM_REG_SIZE_U512 | 0xfffe)
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 90dcacb35f01..d4e30eb57a9c 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -594,23 +594,133 @@ static int set_sme_vls(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>         return set_vec_vls(ARM64_VEC_SME, vcpu, reg);
>  }
>
> +/*
> + * Validate SVE register ID and get sanitised bounds for user/kernel SVE
> + * register copy
> + */
> +static int sme_reg_to_region(struct vec_state_reg_region *region,
> +                            struct kvm_vcpu *vcpu,
> +                            const struct kvm_one_reg *reg)
> +{
> +       /* reg ID ranges for ZA.H[n] registers */
> +       unsigned int vq = vcpu_sme_max_vq(vcpu) - 1;
> +       const u64 za_h_max = vq * __SVE_VQ_BYTES;
> +       const u64 zah_id_min = KVM_REG_ARM64_SME_ZAHREG(0, 0);
> +       const u64 zah_id_max = KVM_REG_ARM64_SME_ZAHREG(za_h_max - 1,
> +                                                      SVE_NUM_SLICES - 1);
> +       unsigned int reg_num;
> +
> +       unsigned int reqoffset, reqlen; /* User-requested offset and length */
> +       unsigned int maxlen; /* Maximum permitted length */
> +
> +       size_t sme_state_size;
> +
> +       reg_num = (reg->id & SVE_REG_ID_MASK) >> SVE_REG_ID_SHIFT;

You use array_index_nospec() below for koffset, but it might be worth
using it for intermediate values, such as this one.

> +
> +       if (reg->id >= zah_id_min && reg->id <= zah_id_max) {
> +               if (!vcpu_has_sme(vcpu) || (reg->id & SVE_REG_SLICE_MASK) > 0)
> +                       return -ENOENT;
> +
> +               /* ZA is exposed as SVE vectors ZA.H[n] */
> +               reqoffset = ZA_SIG_ZAV_OFFSET(vq, reg_num) -
> +                       ZA_SIG_REGS_OFFSET;
> +               reqlen = KVM_SVE_ZREG_SIZE;
> +               maxlen = SVE_SIG_ZREG_SIZE(vq);
> +       } else if (reg->id == KVM_REG_ARM64_SME_ZT_BASE) {
> +               /* ZA is exposed as SVE vectors ZA.H[n] */
> +               if (!kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, SME, SME2) ||
> +                   (reg->id & SVE_REG_SLICE_MASK) > 0 ||
> +                   reg_num > 0)
> +                       return -ENOENT;
> +
> +               /* ZT0 is stored after ZA */
> +               reqlen = KVM_REG_ARM64_SME_ZTREG_SIZE;
> +               maxlen = KVM_REG_ARM64_SME_ZTREG_SIZE;
> +       } else {
> +               return -EINVAL;
> +       }
> +
> +       sme_state_size = vcpu_sme_state_size(vcpu);

Is it worth caching this value and storing it in arch, since the state
size doesn't change after finalization?

> +       if (WARN_ON(!sme_state_size))
> +               return -EINVAL;
> +
> +       region->koffset = array_index_nospec(reqoffset, sme_state_size);
> +       region->klen = min(maxlen, reqlen);
> +       region->upad = reqlen - region->klen;
> +
> +       return 0;
> +}
> +
> +/*
> + * ZA is exposed as an array of horizontal vectors with the same
> + * format as SVE, mirroring the architecture's LDR ZA[Wv, offs], [Xn]
> + * instruction.
> + */
> +
>  static int get_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
> +       int ret;
> +       struct vec_state_reg_region region;
> +       char __user *uptr = (char __user *)reg->addr;
> +
>         /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
>         if (reg->id == KVM_REG_ARM64_SME_VLS)
>                 return get_sme_vls(vcpu, reg);
>
> -       return -EINVAL;
> +       /* Try to interpret reg ID as an architectural SME register... */
> +       ret = sme_reg_to_region(&region, vcpu, reg);
> +       if (ret)
> +               return ret;
> +
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu))
> +               return -EPERM;
> +
> +       /*
> +        * None of the SME specific registers are accessible unless
> +        * PSTATE.ZA is set.
> +        */
> +       if (!vcpu_za_enabled(vcpu))
> +               return -EINVAL;

I think this should be something other than -EINVAL, since the issue
isn't that the register isn't valid, but that it's inaccessible, as
the comment says. -EACCESS or something?

> +
> +       if (copy_from_user(vcpu->arch.sme_state + region.koffset, uptr,
> +                          region.klen))
> +               return -EFAULT;

This should be copy_to_user()

> +
> +       return 0;
>  }
>
>  static int set_sme_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>  {
> +       int ret;
> +       struct vec_state_reg_region region;
> +       char __user *uptr = (char __user *)reg->addr;
> +
>         /* Handle the KVM_REG_ARM64_SME_VLS pseudo-reg as a special case: */
>         if (reg->id == KVM_REG_ARM64_SME_VLS)
>                 return set_sme_vls(vcpu, reg);
>
> -       return -EINVAL;
> +       /* Try to interpret reg ID as an architectural SME register... */
> +       ret = sme_reg_to_region(&region, vcpu, reg);
> +       if (ret)
> +               return ret;
> +
> +       if (!kvm_arm_vcpu_vec_finalized(vcpu))
> +               return -EPERM;
> +
> +       /*
> +        * None of the SME specific registers are accessible unless
> +        * PSTATE.ZA is set.
> +        */
> +       if (!vcpu_za_enabled(vcpu))
> +               return -EINVAL;

Same as get_sme_reg().

Cheers,
/fuad



> +
> +       if (copy_from_user(vcpu->arch.sme_state + region.koffset, uptr,
> +                          region.klen))
> +               return -EFAULT;
> +
> +       return 0;
>  }
> +
>  int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs)
>  {
>         return -EINVAL;
>
> --
> 2.47.3
>
