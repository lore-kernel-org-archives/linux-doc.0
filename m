Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF5468C22
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785352533; cv=none; b=Y8MLhLbbcHAnqkj1euDfB3ss4QagwQ75enKWPqcII9Bnf33VO1jYZ8d4tmvztSsQycI+T59aPwvINEu3Jw6J5accaOFBFKn1ayeohGfwVKwPjZ7gSh9ZMcIC0OvnBm2OdpmuMF+byvWd+n9J/EnrWhuvaZSjQpoOj6XFrZWrQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785352533; c=relaxed/simple;
	bh=CRlbOvhwmMk34+IkB30q2D3hlJgnmxjlopMJW5gz+qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uvlzf/b4Mf7kjDX4Ik+7W0Do3Kmj6kmSbgHJk9TzpsAMMlS88sBOtWP+Gr6yH8qOBU7/24h+MJ8b6u5OEtsyRd4OxsiAJY0J9nl76r61lMf5bpLh+5us+ZkFImvANrCwCBxUvpsGlg6EoqkU7XMnFm9hBCuqeayamZ6z+F+dyHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GDwxy/d4; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GDwxy/d4"
X-Forwarded-Encrypted: i=1; AHgh+RoGG4xloKjzObPhA2pGvGienQdX3yyvhD8lbWfUnHcLetyYO5UpwLuxdjiPy/1kvl7FMSBrVi2cASk=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785352528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6RdMoQ7TRONjplxch2Jr2tfEGLhzUYaVY+oPPESaChU=;
	b=GDwxy/d4fZ5HxqLujj8kdefAhRZ6/TQqcziMqXP+eZtPbIhdlteXIC4qk2XelJdzKFKuOB
	11f6XtU0pNNuPcqPF9YhNMUPcjrnJdJmibDCNuMwD1yvkQHwbOC2IddN6SZefbpa4ofsIC
	kf1IgBdnBW1fNs1B1kmZlW4X+02AU9g=
X-Gm-Message-State: AOJu0Yz5vv9uiqytkpqKE4AXyo6T4kxaX09U3CMWn20cv3oU8gtmq03g
	Ew8oM+RuE1OADq5tviC6LT5o7wGknaJnuWzltr7zCpTXbjxfBaNo+BrTW0iNUJz9BVnzj6Dpndf
	NzcsqYay8b0+xgxx3Zwzp0WJn4vuFPiSqPrU6dtH5
X-Received: by 2002:ac8:6106:0:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-52b3784b752mr459921cf.7.1785352511041; Wed, 29 Jul 2026
 12:15:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-15-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-15-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 20:14:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwfUjVtXwj52Oe0Gbt7n99S0OmUmQmPm2zHf59V-ii-Ww@mail.gmail.com>
X-Gm-Features: AUfX_mzAWeAj1VZbwdEOyYlhWbcnTGqxChe8dN2ESb6R_ooem2wymLvHTc4GB94
Message-ID: <CA+EHjTwfUjVtXwj52Oe0Gbt7n99S0OmUmQmPm2zHf59V-ii-Ww@mail.gmail.com>
Subject: Re: [PATCH v9 15/16] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Migadu-Flow: FLOW_OUT

On Mon, 20 Jul 2026 at 06:39, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Introduce the KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY attribute to
> create a "fixed-counters-only" PMU.
>
> Much like KVM_ARM_VCPU_PMU_V3_IRQ and other read-write attributes, this
> attribute provides a getter that facilitates kernel and userspace
> debugging/testing.
>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

In terms of the UAPI policy, I have no strong opinion. In terms of the
implementation, it looks correct to me. FILTER/SET_PMU and
FIXED_COUNTERS_ONLY are mutually exclusive both ways, and the EXPLICIT
flag keeps that from blocking the default-PMU path.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  Documentation/virt/kvm/devices/vcpu.rst | 30 ++++++++++++++++++++++++++----
>  arch/arm64/include/uapi/asm/kvm.h       |  1 +
>  arch/arm64/kvm/pmu-emul.c               | 30 +++++++++++++++++++++++++++---
>  tools/arch/arm64/include/uapi/asm/kvm.h |  1 +
>  4 files changed, 55 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
> index 66e714f2fcfa..1d592e70bdea 100644
> --- a/Documentation/virt/kvm/devices/vcpu.rst
> +++ b/Documentation/virt/kvm/devices/vcpu.rst
> @@ -74,7 +74,8 @@ irqchip.
>          -ENODEV  PMUv3 not supported or GIC not initialized
>          -ENXIO   PMUv3 not properly configured or in-kernel irqchip not
>                   configured as required prior to calling this attribute
> -        -EBUSY   PMUv3 already initialized or a VCPU has already run
> +        -EBUSY   PMUv3 already initialized, a VCPU has already run or
> +                 FIXED_COUNTERS_ONLY has already been set
>          -EINVAL  Invalid filter range
>          =======  ======================================================
>
> @@ -116,14 +117,14 @@ using event 0x11 (CPU_CYCLES).
>
>  :Returns:
>
> -        =======  ====================================================
> +        =======  ===========================================================
>          -EBUSY   PMUv3 already initialized, a VCPU has already run or
> -                  an event filter has already been set
> +                  an event filter or FIXED_COUNTERS_ONLY has already been set
>          -EFAULT  Error accessing the PMU identifier
>          -ENXIO   PMU not found
>          -ENODEV  PMUv3 not supported or GIC not initialized
>          -ENOMEM  Could not allocate memory
> -        =======  ====================================================
> +        =======  ===========================================================
>
>  Request that the VCPU uses the specified hardware PMU when creating guest events
>  for the purpose of PMU emulation. The PMU identifier can be read from the "type"
> @@ -165,6 +166,27 @@ explicitly selected, or the number of counters is out of range for the
>  selected PMU. Selecting a new PMU cancels the effect of setting this
>  attribute.
>
> +1.6 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
> +------------------------------------------------------
> +
> +:Parameters: no additional parameter in kvm_device_attr.addr
> +
> +:Returns:
> +
> +        =======  ==================================================
> +        -EBUSY   PMUv3 already initialized, a VCPU has already run,
> +                 an event filter has already been set or
> +                 a hardware PMU has already been specified
> +        -ENXIO   Attempted to get before setting
> +        -ENODEV  Attempted to set while PMUv3 not supported
> +        =======  ==================================================
> +
> +If set, KVM emulates PMUv3 without programmable event counters.
> +
> +When this attribute is enabled, the vCPU can run on any physical CPU
> +that has a PMU, regardless of the underlying implementation. This
> +attribute is VM-scoped.
> +
>  2. GROUP: KVM_ARM_VCPU_TIMER_CTRL
>  =================================
>
> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
> index 1c13bfa2d38a..39a1a1e412e6 100644
> --- a/arch/arm64/include/uapi/asm/kvm.h
> +++ b/arch/arm64/include/uapi/asm/kvm.h
> @@ -437,6 +437,7 @@ enum {
>  #define   KVM_ARM_VCPU_PMU_V3_FILTER           2
>  #define   KVM_ARM_VCPU_PMU_V3_SET_PMU          3
>  #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS  4
> +#define   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY      5
>  #define KVM_ARM_VCPU_TIMER_CTRL                1
>  #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER                0
>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER                1
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 1ec09ef28467..ff5d5f66a9c0 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -1118,8 +1118,8 @@ int kvm_arm_set_default_pmu(struct kvm *kvm)
>          * affines the VMM to a particular cluster of cores.
>          *
>          * In any case, userspace should just do the sane thing and use the UAPI
> -        * to select a PMU type directly. But, be wary of the baggage being
> -        * carried here.
> +        * to select a PMU type directly, or request fixed-counters-only
> +        * emulation. But, be wary of the baggage being carried here.
>          */
>         struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu(raw_smp_processor_id());
>
> @@ -1144,11 +1144,13 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>                 arm_pmu = entry->arm_pmu;
>                 if (arm_pmu->pmu.type == pmu_id) {
>                         if (kvm_vm_has_ran_once(kvm) ||
> +                           kvm_pmu_fixed_counters_only(kvm) ||
>                             (kvm->arch.pmu_filter && kvm->arch.arm_pmu != arm_pmu)) {
>                                 ret = -EBUSY;
>                                 break;
>                         }
>
> +                       set_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags);
>                         kvm_arm_set_pmu(kvm, arm_pmu);
>                         cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
>                         ret = 0;
> @@ -1159,6 +1161,22 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>         return ret;
>  }
>
> +static int kvm_arm_pmu_v3_set_pmu_fixed_counters_only(struct kvm_vcpu *vcpu)
> +{
> +       struct kvm *kvm = vcpu->kvm;
> +
> +       lockdep_assert_held(&kvm->arch.config_lock);
> +
> +       if (kvm_vm_has_ran_once(kvm) || kvm->arch.pmu_filter ||
> +           test_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags))
> +               return -EBUSY;
> +
> +       set_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags);
> +       kvm->arch.nr_pmu_counters = 0;
> +
> +       return 0;
> +}
> +
>  static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>  {
>         struct kvm *kvm = vcpu->kvm;
> @@ -1236,7 +1254,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>                      filter.action != KVM_PMU_EVENT_DENY))
>                         return -EINVAL;
>
> -               if (kvm_vm_has_ran_once(kvm))
> +               if (kvm_vm_has_ran_once(kvm) || kvm_pmu_fixed_counters_only(kvm))
>                         return -EBUSY;
>
>                 if (!kvm->arch.pmu_filter) {
> @@ -1281,6 +1299,8 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>
>                 return kvm_arm_pmu_v3_set_nr_counters(vcpu, n);
>         }
> +       case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
> +               return kvm_arm_pmu_v3_set_pmu_fixed_counters_only(vcpu);
>         case KVM_ARM_VCPU_PMU_V3_INIT:
>                 return kvm_arm_pmu_v3_init(vcpu);
>         }
> @@ -1307,6 +1327,9 @@ int kvm_arm_pmu_v3_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>                 irq = vcpu->arch.pmu.irq_num;
>                 return put_user(irq, uaddr);
>         }
> +       case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
> +               if (kvm_pmu_fixed_counters_only(vcpu->kvm))
> +                       return 0;
>         }
>
>         return -ENXIO;
> @@ -1320,6 +1343,7 @@ int kvm_arm_pmu_v3_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>         case KVM_ARM_VCPU_PMU_V3_FILTER:
>         case KVM_ARM_VCPU_PMU_V3_SET_PMU:
>         case KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS:
> +       case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
>                 if (kvm_vcpu_has_pmu(vcpu))
>                         return 0;
>         }
> diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
> index 1c13bfa2d38a..39a1a1e412e6 100644
> --- a/tools/arch/arm64/include/uapi/asm/kvm.h
> +++ b/tools/arch/arm64/include/uapi/asm/kvm.h
> @@ -437,6 +437,7 @@ enum {
>  #define   KVM_ARM_VCPU_PMU_V3_FILTER           2
>  #define   KVM_ARM_VCPU_PMU_V3_SET_PMU          3
>  #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS  4
> +#define   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY      5
>  #define KVM_ARM_VCPU_TIMER_CTRL                1
>  #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER                0
>  #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER                1
>
> --
> 2.55.0
>
>
