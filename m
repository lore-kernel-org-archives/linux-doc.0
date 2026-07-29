Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73DA3ABDA4
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347954; cv=none; b=a+RMyx6uQ24VynpsHDl/bBhB1ydu8i+m/NefOtMEMeKZmiwy6OL3d/nItKoOZeLaGR/D12X2zdGnySiNXTqaM3NZdi8PTB2omB31pqLcwzanRQog5jlXU8+ZlLqPMdSs591TrTSK7MjoDPdyfiQJb8tJx7VvWDKr7vTsQ89Vaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347954; c=relaxed/simple;
	bh=B20dbkBhewR9N5jqjB77bXHLofpTwdnRjIDZU++jZdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSufvykW8f0oxx00usQVYgeLcnVBTxvCifOVXfyAPqht2Fz9RcYg1kSlF08d7uzWXQVAk/u9VXhO3Fx9UeCwYMDwSry5G6Ks9Ejl9IXROOdL3/VMGhLs/gjD0tfAvCDhOOtfDAoQ0uMysMJrmnyvikd7C+Y1E1XoYnyNcVui0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=u9Nc2NJf; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="u9Nc2NJf"
X-Forwarded-Encrypted: i=1; AHgh+RrNARCusnp99+8ZUDsWmRZPgU9clNcHf3EFizlDk/r1resIBIDjUIJAopmhEGzwce7obOKKViqYiDc=@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785347945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sHNGtvXmI1lmcYGaqQf2LJdsupyf9eDfU/t8/RKu5uQ=;
	b=u9Nc2NJf6+WPY8IrMB5KDvxUwMVV0AlQGEKIH/Rr6MpVUBNHILZL5JUThwUz/tEqxvFpUo
	X6sreeEx1o3lBMowe/JpSpm5BZkEiQ62iEH7OY+Nc8mV+UGfdfCKitJokmW6OV3rZR2w8J
	Wxd7qjjjg3CCEdJNRqPjWd2y0JSa2SY=
X-Gm-Message-State: AOJu0YzatD9ZQsAFYTRlL1qKVw9dnc8h3BGZjJKyuq3FvN8po4/vQ84T
	ZUWylsK9zQYPblHI40ztouVtaIZa58fe7ScmaR8PofXA5BB6GytPZdf+QZNiwSoHOYSTB1qhntY
	Sn7LCN9baP17BQ0+WCcr7Cu8hudMIrbVNZXxZjhR0
X-Received: by 2002:ac8:7fc7:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-52b34cf718bmr4279531cf.0.1785347937591; Wed, 29 Jul 2026
 10:58:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-13-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-13-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 29 Jul 2026 18:58:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyBNtRHMGp9LvGfrEHC+WggA_B5hQq+Yf35+zNBfNxG1A@mail.gmail.com>
X-Gm-Features: AUfX_mxD75QzlQhuaQNGxQQP31Q-APsfSKiFOjN07yFBd2o-UYKBSVA4waq0SzE
Message-ID: <CA+EHjTyBNtRHMGp9LvGfrEHC+WggA_B5hQq+Yf35+zNBfNxG1A@mail.gmail.com>
Subject: Re: [PATCH v9 13/16] KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
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
> kvm_pmu_probe_armpmu() currently samples the current CPU internally,
> which ties the helper to default PMU selection.
>
> Move that policy to kvm_arm_set_default_pmu() by passing
> raw_smp_processor_id() from the caller, and make the helper search for
> the pPMU covering an explicit CPU. Move the helper above
> kvm_pmu_create_perf_event() so later code can reuse it when creating
> PMU events for a VCPU's current pCPU.
>
> This preserves the existing default PMU selection behavior while
> preparing fixed-counters-only mode to select a pPMU at runtime.
>
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/pmu-emul.c | 72 +++++++++++++++++++++++------------------------
>  1 file changed, 35 insertions(+), 37 deletions(-)
>
> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
> index 27db8877f96e..78611eaecca2 100644
> --- a/arch/arm64/kvm/pmu-emul.c
> +++ b/arch/arm64/kvm/pmu-emul.c
> @@ -682,6 +682,23 @@ static int kvm_map_pmu_event(struct arm_pmu *pmu, unsigned int eventsel)
>         return eventsel;
>  }
>
> +static struct arm_pmu *kvm_pmu_probe_armpmu(int cpu)
> +{
> +       struct arm_pmu_entry *entry;
> +       struct arm_pmu *pmu;
> +
> +       guard(rcu)();
> +
> +       list_for_each_entry_rcu(entry, &arm_pmus, entry) {
> +               pmu = entry->arm_pmu;
> +
> +               if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
> +                       return pmu;
> +       }
> +
> +       return NULL;
> +}
> +
>  /**
>   * kvm_pmu_create_perf_event - create a perf event for a counter
>   * @pmc: Counter context
> @@ -811,42 +828,6 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>         list_add_tail_rcu(&entry->entry, &arm_pmus);
>  }
>
> -static struct arm_pmu *kvm_pmu_probe_armpmu(void)
> -{
> -       struct arm_pmu_entry *entry;
> -       struct arm_pmu *pmu;
> -       int cpu;
> -
> -       guard(rcu)();
> -
> -       /*
> -        * It is safe to use a stale cpu to iterate the list of PMUs so long as
> -        * the same value is used for the entirety of the loop. Given this, and
> -        * the fact that no percpu data is used for the lookup there is no need
> -        * to disable preemption.
> -        *
> -        * It is still necessary to get a valid cpu, though, to probe for the
> -        * default PMU instance as userspace is not required to specify a PMU
> -        * type. In order to uphold the preexisting behavior KVM selects the
> -        * PMU instance for the core during vcpu init. A dependent use
> -        * case would be a user with disdain of all things big.LITTLE that
> -        * affines the VMM to a particular cluster of cores.
> -        *
> -        * In any case, userspace should just do the sane thing and use the UAPI
> -        * to select a PMU type directly. But, be wary of the baggage being
> -        * carried here.
> -        */
> -       cpu = raw_smp_processor_id();
> -       list_for_each_entry_rcu(entry, &arm_pmus, entry) {
> -               pmu = entry->arm_pmu;
> -
> -               if (cpumask_test_cpu(cpu, &pmu->supported_cpus))
> -                       return pmu;
> -       }
> -
> -       return NULL;
> -}
> -
>  static u64 __compute_pmceid(struct arm_pmu *pmu, bool pmceid1)
>  {
>         u32 hi[2], lo[2];
> @@ -1072,7 +1053,24 @@ static void kvm_arm_set_pmu(struct kvm *kvm, struct arm_pmu *arm_pmu)
>   */
>  int kvm_arm_set_default_pmu(struct kvm *kvm)
>  {
> -       struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu();
> +       /*
> +        * It is safe to use a stale cpu to iterate the list of PMUs so long as
> +        * the same value is used for the entirety of the loop. Given this, and
> +        * the fact that no percpu data is used for the lookup there is no need
> +        * to disable preemption.
> +        *
> +        * It is still necessary to get a valid cpu, though, to probe for the
> +        * default PMU instance as userspace is not required to specify a PMU
> +        * type. In order to uphold the preexisting behavior KVM selects the
> +        * PMU instance for the core during vcpu init. A dependent use
> +        * case would be a user with disdain of all things big.LITTLE that
> +        * affines the VMM to a particular cluster of cores.
> +        *
> +        * In any case, userspace should just do the sane thing and use the UAPI
> +        * to select a PMU type directly. But, be wary of the baggage being
> +        * carried here.
> +        */
> +       struct arm_pmu *arm_pmu = kvm_pmu_probe_armpmu(raw_smp_processor_id());
>
>         if (!arm_pmu)
>                 return -ENODEV;
>
> --
> 2.55.0
>
>
