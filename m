Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114361;
	b=0nbZdbhewXDKpObCOtgsgSHlelJLomOIqhdQp33BaJN5wrHjqBB1W7nyY8bCAl0nXD59
	 53YGJPy2PcAHMTbq6g1ep5yQPrSpPb3yzeW1VxElm7jCv6vIrP6L9080RTFvX630m5NMy
	 yj0/ujUF0p1WjeEMKzkhCtRovnyWtkASfBSXSMpp65WnabCBf0Z5bm1uOzbItmqDDup0y
	 5z+vZanadULpQzxA87ytbaRD5szhTgbHJCa0VMOn95rNxAL7l5RiIbw7X9V5Rvv7Lmi5v
	 qYPHT7vDkBhxuHi7MAzz6Ym1sh4nymlwX9X1t1sROTkDESVMMfJVkhf8o8/5CVJrUMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Vf5cuVhzqNxbLoI4CPxDBEoH18FVa00DCFt8jqQWCmY=;
	b=lw0KjEvA3m0fmSd4OjIplgthZukq1cxVKk4shACTVFvItMLGdrSLgWBT/XnNjr32u/RG
	 oyJlPKXQyuky74qdAIvPwLnIzRll+Kq3vIfdQrl8xtVkQyyWv7QKPnxduk66o2yIBLH3Z
	 U1M08qCyCw/fhWdvM+u8Kw0eFEHOvzskMCzBgkBF3B/UPv5rbBpb2lfFOEAdPpIlCFiZO
	 GjgTReS2jsy2n3PtH17SVQWelanNfWvhy0uilXkb1bstUvRH4HUTA4yLD/gt+4wHmwJbH
	 0QGDMkJIOO3z68a0JVL9qflpND83Zwk4SolL/m9x+KBjwfjuWarZjaJBFPjTj8/zMLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCb6wY5v;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B86606F417
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 18:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B86606F417
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gCb6wY5v
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-851f720d7afso83681a34.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 10:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795114359; x=1795719159; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vf5cuVhzqNxbLoI4CPxDBEoH18FVa00DCFt8jqQWCmY=;
        b=gCb6wY5v01ahDhhp3Z8FaEvtuz7RnqEkRfAGbxJUSqEq8aCQeZMNk2rduyKsmYHjdG
         4vVOIbuZxPOZh1kHYK1QmUAe9y73sM7roLcm4O2Xj4f/KujVKTrFbPzBCJ82B0QbJqWS
         k9i/5isUfAYd3rGXIrVaEWmDanzVwJSw2rZWss2rjSFihxqIr7/3/oZ37UHpWmKl4zDI
         2+SBqE9LGVuCL3gW2VKk/hx51/aQAbDTBd+883BNPGKiDeoGipKh7N7wXZwIGTvlxZyx
         INarQRKYf4GbFtAj2nsfLBOon62Bs+fsjxn959MDI4/o3f0V51VTT/jDPHFuIy7rfBdO
         OP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114359; x=1795719159;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vf5cuVhzqNxbLoI4CPxDBEoH18FVa00DCFt8jqQWCmY=;
        b=0FpZc/PtPKbE78kWP3PRyAoTsaG/VwvlEC4zPVEKQTjOr0E8kBjZbTy3Fm51Dlh94a
         n4Ebyv3VusUhR39NS0Nw219OR4B2ie7zImzqa89L33IF89cuSP+JvNH63mxefG170g5g
         3YUwxOiw+SXTfzD1z5/kbytdCp0xgDB8zRdsqwavVdQcjFtVRQqtu0rdQ7wEcsXIx7od
         x2/kZiinFFIByq/9qLETZuW5buJL1u/WEyRvdAcuRmRRCyBK8uNYiL+EEmlkFNF2sXhA
         1XqjKjON5Jys24uZeXWNaTUIGvLmPUFgT8Myv1+NGIlEyS2Ji2Cz6T/2oiImPRngT5Ic
         Dw3g==
X-Forwarded-Encrypted: i=1; AL+hErFFCrP+PBMszeG0PWstd+JZJt21OZn2NFoP2bRktphcmTJrWH+TuFJj0wCf/4/FnAHwVL0gyBJ7oa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MF515X40FFc3oKVr0LR/3iNQsJSaqoHIdSlIgaQDOfZ+pFgCW
	vwsEkzDay4ltMH8u17Y0AIzd26XjGsRNUwwivLu2kpWKOioWBV1hHMmy1I1ZiT8lOBMo73MTl/0
	UfFfan2UgVRpfj+n+5m4ns5hFNQ==
X-Received: from iobi29-n2.prod.google.com ([2002:a05:6602:c69d:20b0:9c7:67b2:21c8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4f4f:b0:56a:dc07:f218 with SMTP id 5614622812f47-57a0a10c801mr992845b6e.20.1795114359282;
 Thu, 19 Nov 2026 10:52:39 -0800 (PST)
Date: Thu, 19 Nov 2026 18:52:06 +0000
In-Reply-To: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119185215.632334-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119185215.632334-25-coltonlewis@google.com>
Subject: [PATCH v10 24/33] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Russell King <linux@armlinux.org.uk>, Jonathan Corbet <corbet@lwn.net>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, James Clark <james.clark@linaro.org>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Mingwei Zhang <mizhang@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Because ARM hardware does not directly inject PMU PPIs into guests,
overflows on partitioned guest counters raise physical PMU interrupts
that enter the host's armv8pmu_handle_irq() handler.

Update armv8pmu_handle_irq() to read PMOVSCLR_EL0 without blindly
clearing guest overflow bits:
- Pass pmovsr to kvm_pmu_handle_guest_irq(), which clears guest-reserved
  overflow bits in hardware and latches them into the running vCPU's
  shadow PMOVSSET_EL0 register.
- Mask out guest-reserved counter bits before clearing and processing
  host perf overflows, returning IRQ_HANDLED early when only guest
  counters overflowed or no host events are active.

Also add kvm_pmu_host_start() and kvm_pmu_host_stop() so
armv8pmu_start() and armv8pmu_stop() toggle MDCR_EL2.HPME rather than
PMCR_EL0.E while a partitioned guest's PMU state is loaded on the CPU
(leaving guest counters 0..HPMN-1 and PMCCNTR_EL0 under guest PMCR_EL0.E
control), guarding local_daif_save() with !in_nmi() for GICv3 pseudo-NMI
interrupt handlers.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h   |   8 +++
 arch/arm64/include/asm/arm_pmuv3.h |   5 ++
 arch/arm64/kvm/pmu-direct.c        | 102 +++++++++++++++++++++++++++++
 drivers/perf/arm_pmuv3.c           |  34 +++++-----
 include/kvm/arm_pmu.h              |   7 ++
 5 files changed, 141 insertions(+), 15 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 71cf03ab58cbb..d8051ea261481 100644
--- a/arch/arm/include/asm/arm_pmuv3.h
+++ b/arch/arm/include/asm/arm_pmuv3.h
@@ -180,6 +180,11 @@ static inline void write_pmintenset(u32 val)
 	write_sysreg(val, PMINTENSET);
 }
 
+static inline u32 read_pmintenset(void)
+{
+	return read_sysreg(PMINTENSET);
+}
+
 static inline void write_pmintenclr(u32 val)
 {
 	write_sysreg(val, PMINTENCLR);
@@ -231,6 +236,9 @@ static inline u64 kvm_pmu_guest_counter_mask(void)
 {
 	return 0;
 }
+static inline void kvm_pmu_handle_guest_irq(u64 pmovsr) {}
+static inline bool kvm_pmu_host_start(void) { return false; }
+static inline bool kvm_pmu_host_stop(void) { return false; }
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index cf2b2212e00a2..9037a28365951 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -110,6 +110,11 @@ static inline void write_pmintenset(u64 val)
 	write_sysreg(val, pmintenset_el1);
 }
 
+static inline u64 read_pmintenset(void)
+{
+	return read_sysreg(pmintenset_el1);
+}
+
 static inline void write_pmintenclr(u64 val)
 {
 	write_sysreg(val, pmintenclr_el1);
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index c2ea1ce5efe74..21357decce214 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -800,3 +800,105 @@ static void kvm_pmu_set_guest_owned(struct kvm_vcpu *vcpu)
 		__kvm_pmu_load(vcpu, true);
 	}
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @pmovsr: Overflow flags reported by driver
+ *
+ * Set overflow flags in guest-reserved counters in the VCPU register
+ * for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 pmovsr)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	u64 mask = kvm_pmu_guest_counter_mask();
+	u64 govf = pmovsr & mask;
+
+	if (!govf)
+		return;
+
+	write_pmovsclr(govf);
+
+	if (!vcpu || !vcpu->arch.pmu.loaded_on_cpu)
+		return;
+
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
+
+/**
+ * kvm_pmu_host_start() - Enable host PMU counters while guest owns PMU
+ *
+ * When a partitioned guest owns the PMU, host counters (HPMN..N-1) are
+ * gated by MDCR_EL2.HPME rather than PMCR_EL0.E.
+ *
+ * Return: True if handled via MDCR_EL2.HPME, false if caller should use PMCR_EL0.E
+ */
+bool kvm_pmu_host_start(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	unsigned long daif = 0;
+	bool nmi;
+	u64 mdcr;
+
+	if (!vcpu || !kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
+		return false;
+
+	nmi = in_nmi();
+	if (!nmi)
+		daif = local_daif_save();
+
+	if (!vcpu->arch.pmu.loaded_on_cpu) {
+		if (!nmi)
+			local_daif_restore(daif);
+		return false;
+	}
+
+	mdcr = READ_ONCE(vcpu->arch.mdcr_el2) | MDCR_EL2_HPME;
+	WRITE_ONCE(vcpu->arch.mdcr_el2, mdcr);
+	if (has_vhe())
+		write_sysreg(mdcr, mdcr_el2);
+	isb();
+	if (!nmi)
+		local_daif_restore(daif);
+	return true;
+}
+
+/**
+ * kvm_pmu_host_stop() - Disable host PMU counters while guest owns PMU
+ *
+ * When a partitioned guest owns the PMU, host counters (HPMN..N-1) are
+ * gated by MDCR_EL2.HPME rather than PMCR_EL0.E.
+ *
+ * Return: True if handled via MDCR_EL2.HPME, false if caller should use PMCR_EL0.E
+ */
+bool kvm_pmu_host_stop(void)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+	unsigned long daif = 0;
+	bool nmi;
+	u64 mdcr;
+
+	if (!vcpu || !kvm_pmu_is_partitioned(vcpu->kvm) ||
+	    !vcpu->arch.pmu.loaded_on_cpu)
+		return false;
+
+	nmi = in_nmi();
+	if (!nmi)
+		daif = local_daif_save();
+
+	if (!vcpu->arch.pmu.loaded_on_cpu) {
+		if (!nmi)
+			local_daif_restore(daif);
+		return false;
+	}
+
+	mdcr = READ_ONCE(vcpu->arch.mdcr_el2) & ~MDCR_EL2_HPME;
+	WRITE_ONCE(vcpu->arch.mdcr_el2, mdcr);
+	if (has_vhe())
+		write_sysreg(mdcr, mdcr_el2);
+	isb();
+	if (!nmi)
+		local_daif_restore(daif);
+	return true;
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 1676f13cc7c38..440f77cf0a2fc 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -777,18 +777,9 @@ static void armv8pmu_disable_event_irq(struct perf_event *event)
 	armv8pmu_disable_intens(BIT(event->hw.idx));
 }
 
-static u64 armv8pmu_getreset_flags(void)
+static u64 armv8pmu_getovf_flags(void)
 {
-	u64 value;
-
-	/* Read */
-	value = read_pmovsclr();
-
-	/* Write to clear flags */
-	value &= ARMV8_PMU_CNT_MASK_ALL;
-	write_pmovsclr(value);
-
-	return value;
+	return read_pmovsclr() & ARMV8_PMU_CNT_MASK_ALL;
 }
 
 static void update_pmuserenr(u64 val)
@@ -878,7 +869,8 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 		brbe_enable(cpu_pmu);
 
 	/* Enable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
+	if (!kvm_pmu_host_start())
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
 }
 
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
@@ -889,7 +881,8 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 		brbe_disable();
 
 	/* Disable all counters */
-	armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
+	if (!kvm_pmu_host_stop())
+		armv8pmu_pmcr_write(armv8pmu_pmcr_read() & ~ARMV8_PMU_PMCR_E);
 }
 
 static void read_branch_records(struct pmu_hw_events *cpuc,
@@ -911,9 +904,9 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	int idx;
 
 	/*
-	 * Get and reset the IRQ flags
+	 * Get the IRQ flags
 	 */
-	pmovsr = armv8pmu_getreset_flags();
+	pmovsr = armv8pmu_getovf_flags();
 
 	/*
 	 * Did an overflow occur?
@@ -921,6 +914,17 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	if (!armv8pmu_has_overflowed(pmovsr))
 		return IRQ_NONE;
 
+	kvm_pmu_handle_guest_irq(pmovsr);
+
+	pmovsr &= ~kvm_pmu_guest_counter_mask();
+	if (!pmovsr)
+		return IRQ_HANDLED;
+
+	write_pmovsclr(pmovsr);
+
+	if (bitmap_empty(cpuc->used_mask, ARMPMU_MAX_HWEVENTS))
+		return IRQ_HANDLED;
+
 	/*
 	 * Handle the counter(s) overflow(s)
 	 */
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index e3f5b9a1a4817..9800514019630 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -108,6 +108,9 @@ void kvm_pmu_reload_part(struct kvm_vcpu *vcpu);
 u64 kvm_pmu_guest_counter_mask(void);
 void kvm_pmu_load(struct kvm_vcpu *vcpu);
 void kvm_pmu_put(struct kvm_vcpu *vcpu);
+void kvm_pmu_handle_guest_irq(u64 pmovsr);
+bool kvm_pmu_host_start(void);
+bool kvm_pmu_host_stop(void);
 
 #define kvm_pmu_get_access(vcpu)	((vcpu)->arch.pmu.access)
 #define kvm_pmu_reset_access(vcpu)	((vcpu)->arch.pmu.access = VCPU_PMU_ACCESS_FREE)
@@ -277,6 +280,10 @@ static inline u64 kvm_pmu_guest_counter_mask(void)
 	return 0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 pmovsr) {}
+static inline bool kvm_pmu_host_start(void) { return false; }
+static inline bool kvm_pmu_host_stop(void) { return false; }
+
 static inline bool has_kvm_pmu_partition_support(void)
 {
 	return false;
-- 
2.56.1.708.g77570a6a1d-goog

