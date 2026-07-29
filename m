Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6824119EC
	for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 15:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338616; cv=pass; b=kxmLSyl34De69E1L8A+0alfpB19wyL3A6VY4CGE1sQG3ljG5UJYgzx/dIMYNuZllYqvqclx9wmfI5wCI8ZtYHYVFSeU00oMF0UrEWnTVX8JHWcqNd3Vee3mI6L/aF6Pz8F4n8mDFZFtgujqn+gCILH+wC9ojEy/ChgLiF3HV+2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338616; c=relaxed/simple;
	bh=LVBzsbGMtEvkKYlB4ymkqikHz0oYkp14Iw5Po3+7C0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDC3vtHkXRwjBmbqKc0mQJSxF/foMl1p6Pv45KjSFsAI4lp8L8FZkoypxPQhHFWpRTWK6+EkClj1YYHlQVDEu5kVvk/5hMgJo/8TZkfD5g+WB67msAmGNjVxViPa5kTrGQjBZTbpT/v97ESocTRosNxwDh3R+Sbby7+gsa7bHFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hpAZf/sk; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hpAZf/sk"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c15a5b265so357011cf.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jul 2026 08:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785338614; cv=none;
        d=google.com; s=arc-20260327;
        b=ILuN5g7xqCKEsREHlVCT03Sp9a6C9/vz8qgR9EdTKVvECZiLUiIySenuYJ7gwJw/TO
         Ink4CEg9VkmKHvr+o7eGr6VHiH07D+j1GhOr/1I7V+DbTN26t931TgOC9pJSFteX3BG0
         VTj6i1RdbX5yu2VsA7VTH2S7L3TKB4O7zAY1e7xzKfvuHE5WW/D5x0FA7D6vChh8Rxsb
         VPbFlfTcDaQKbZvlV2hUjLu1IrDhSeAFlYXgJ2UQ9UaomE3C8N5TwgJc8Huy9PXYChcZ
         LqSHnJveNJTKmAyqnFzuHv+nQusRBMSPwSspui8INRhEvLF/FN5CA/xErJN3UjnGLt49
         30yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        fh=t1fEq7NSVXa2fDaa/3S+y6hQyP9RHTTVOxiV4QpMZNg=;
        b=J6/hVZyqYvrikIC3Wma+6xp6TH2Rh4wHKb3f29SjIctDt6rH3LUcSLzlQ0jJODSmz8
         CxW24g6zLpDBZFkx1/Kdq2SD7jFANxQ5Py0NgAcF3Mk0ZP43+NeLNidHDMO8v3SBflHx
         ijFlECYOwQbkzc/6h7llFDSwCdXfxdJBeDcsKzJnsVCo0cAamZ5/65NnouyHukYDiiKV
         +0KT0qJB2/xW72/X+yEie1ZCgTycpM9GO7StHeEzgZEAuUN1BlFqPsiNXBUMKlXxtQ1s
         WfaPZC/AOLIzEY8fzslKdh6ZH9M8LeU9d27HmuLo0rqWz7HBLSufV378lAmnh11vjjxI
         WX1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785338614; x=1785943414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        b=hpAZf/skIH1ereMEsG3kAteSYVLVafyjPYXLBPDXBkOFY6Bz9nW2UUVfkQkLiPi2rU
         6mElyq1uolGG1fWsCISwUU3kdbrONt+LGdAuttlgEqMNXFcgswVPVAOvmQaOfC+zRMlD
         8uKE3LWCkwnIsJlRvGxwY7tuxnKMkyarrPssE3AH5sH7yC2Ty5gItM4H8V/DG3QRW+iO
         5w97EgvIkcBo2PmbgKLqSFIwWL1GlYOXaqH18o2Px1ohMYrf9HmrM7si1hOsxacaFDp/
         asWrx0XPccr5M/AlrNQetOjYuRdoooyRlo5HjGZtVG/gvo8W/wdiDbBgPSsaMdIeNNc0
         WBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338614; x=1785943414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EYpYlO78zITH6UjIoefobo5Po8cUwvLKaBgMucaKFtQ=;
        b=lvl5QhNvQpoGqC+EL6QPcA37kJrw7Fc4PsZ82d3hWER8SPpP3V/0CENKaKbUFCKrri
         2VqCn2q52fOhIr/OReNo0CnBo2I6kZJLOTth5AfERBN0gw80Iwxzd95qGLATyZshFqlz
         ceUIKw3sc2SkBY+O9NruoUeiZCOkk/ju/35fTDoHLk+X5i6oSaZ0WUzKQsqf6qYG7RM/
         sFXFKGxONq8Tm7OLl//uwCUDbVx195VLbjuhY0SLqzm61yKJ+M4sNMtFW+/EoW/qIC63
         +sGvYtURZV2VSRzW0aIjUianp/TPVJxSQGTx0p9adhmVHAIOcSDzQU5nERRBd3m4a0mm
         C/dg==
X-Forwarded-Encrypted: i=1; AHgh+Rqo2tJHtDmEmA9byNLyXvD1NlNJwLegaz6LrYYK4U4+r5RVmF5pB5Tl+oKjIE6dixjCHiZuSMbeznE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzriSr38XhnvlRUaNv9CYxyZz2x3L0niVMmSZyUC7VPDVHYZsjG
	wBzV54qrvUAYbiItrLeyvz989lKL918Z5YI9VprFyS/KD6SiOveoCCqRCCMgyfPUvvaBKYMYRtF
	4hlJ1hR7Rw5mezJ7LuuDIUOUMshIIIGfssMxFvjCb
X-Gm-Gg: AR+sD11XFV+99aNryJUyGRrvzbRwDfIOBhkkyX6iPMvyKGmMs+eGp8zOvktnqhuGyzb
	ZyvEqv6WuC/Z2se4RSJOKbA2hk9yWLowmwZPylEXbn9L5QJI6mpDyvmLASrZHtP5AuJ+3PfWpa0
	GwiMJ2ZntRSIP05eNLlRZd+TRQvXxqijyUl8vnhKGredLnwUxBF7Jav4Oo/Y9As16rGrq/fGg38
	dkAvQqTZTCrKRxfiZwYtSZSOb1EkQ1k6tZFMqm80zB8YUY+IwIvY+A6MhcGt17shTaYGSWrgDRH
	I8/mVtNKl0rvCsHU2P65w9VFsVHSxbcTrEeu+3CHXfpk553zQytGkUzADqGrW5MnKhJ5CZ0w41g
	iv15ln5JBJQ==
X-Received: by 2002:ac8:7c56:0:b0:527:f08f:56a2 with SMTP id
 d75a77b69052e-52b35089837mr565631cf.8.1785338608520; Wed, 29 Jul 2026
 08:23:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-hybrid-v9-0-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp> <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260720-hybrid-v9-4-2b713ca1b5dc@rsg.ci.i.u-tokyo.ac.jp>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 29 Jul 2026 16:22:51 +0100
X-Gm-Features: AUfX_mwUs9MTXlZgLAxa7rxOqn4AEWfpGlzGWJmBR-6Vw5CXw5g4z3qo-EMbdA0
Message-ID: <CA+EHjTzwDrP=3a7f38e2H_H1YPV0igRryhfuNCigZQUFy02tng@mail.gmail.com>
Subject: Re: [PATCH v9 04/16] KVM: arm64: selftests: Test SET_NR_COUNTERS
 after first run
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

On Mon, 20 Jul 2026 at 06:44, Akihiko Odaki
<odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>
> Add a regression test that runs one vCPU and then tries to change the
> VM-scoped PMU counter count through an idle sibling. Verify that
> SET_NR_COUNTERS fails with EBUSY once any vCPU has run.
>
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  .../selftests/kvm/arm64/vpmu_counter_access.c      | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> index 22223395969e..3b5bb421f401 100644
> --- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> +++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
> @@ -461,6 +461,11 @@ static void run_vcpu(struct kvm_vcpu *vcpu, u64 pmcr_n)
>         }
>  }
>
> +static void guest_code_done(void)
> +{
> +       GUEST_DONE();
> +}
> +
>  static void test_create_vpmu_vm_with_nr_counters(unsigned int nr_counters, bool expect_fail)
>  {
>         struct kvm_vcpu *vcpu;
> @@ -622,6 +627,37 @@ static bool kvm_supports_nr_counters_attr(void)
>         return supported;
>  }
>
> +static void test_set_nr_counters_after_vcpu_run(void)
> +{
> +       struct kvm_vcpu *running_vcpu, *stopped_vcpu;
> +       unsigned int nr_counters = 0;
> +       struct kvm_vcpu_init init;
> +       struct kvm_vm *vm;
> +       int ret;
> +       u64 irq = 23;
> +
> +       vm = vm_create(2);
> +       vm_ioctl(vm, KVM_ARM_PREFERRED_TARGET, &init);
> +       init.features[0] |= BIT(KVM_ARM_VCPU_PMU_V3);
> +       running_vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code_done);
> +       stopped_vcpu = aarch64_vcpu_add(vm, 1, &init, guest_code_done);
> +       kvm_arch_vm_finalize_vcpus(vm);
> +
> +       vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_IRQ, &irq);
> +       vcpu_device_attr_set(running_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                            KVM_ARM_VCPU_PMU_V3_INIT, NULL);
> +       vcpu_run(running_vcpu);
> +
> +       ret = __vcpu_device_attr_set(stopped_vcpu, KVM_ARM_VCPU_PMU_V3_CTRL,
> +                                    KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS,
> +                                    &nr_counters);
> +       TEST_ASSERT(ret == -1 && errno == EBUSY,
> +                   KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
> +
> +       kvm_vm_free(vm);
> +}
> +
>  int main(void)
>  {
>         u64 i, pmcr_n;
> @@ -630,6 +666,8 @@ int main(void)
>         TEST_REQUIRE(kvm_supports_vgic_v3());
>         TEST_REQUIRE(kvm_supports_nr_counters_attr());
>
> +       test_set_nr_counters_after_vcpu_run();
> +
>         pmcr_n = get_pmcr_n_limit();
>         for (i = 0; i <= pmcr_n; i++) {
>                 run_access_test(i);
>
> --
> 2.55.0
>
>
