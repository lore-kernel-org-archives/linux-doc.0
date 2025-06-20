Received: from mail-il1-f201.google.com (mail-il1-f201.google.com [209.85.166.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D29259CAF
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 22:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457942; cv=none; b=IrF6lHO+6gMztWcysfzZMSCrlVsMg9YoJziE6RjIgoEZA2V0iGTTe9HUP6yLSUjnixgG/JBGWhKKYCPVtw6p/epiujSNSUMJ7YumDQZSEbw6xDUTKPL/TURkYZ/Myv5GcaSKekhALdPIXdwymAuh5xTa9/p+7usrhxEL4t7qYBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457942; c=relaxed/simple;
	bh=Lyz6rv8md1KGVT7ne6PPM15rAwSQJ5K6f0sp89R8EHo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=H63qsdWGubBYKYcUIKG23zVYyZTeiRZUeOhXcQKw7865WkFpNXnPsjAAlgKSp7p7PvZVWsvLqO4WUrCI7jTNUefHcO91i/cVG3oD/+6mbEviK/5D+x4kNg5WBxkadC0PmZVnCXxEPm27qLezcWxgI7n3DDVSMDX6mcYjZa8ALf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G0Sq1SQw; arc=none smtp.client-ip=209.85.166.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G0Sq1SQw"
Received: by mail-il1-f201.google.com with SMTP id e9e14a558f8ab-3de0dc57859so22298615ab.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 15:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457938; x=1751062738; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVwS6Fh5z64OnGR4LBlPfMlx26sURPRLP7n6w+E8rl4=;
        b=G0Sq1SQwAtlcog+dgN5R3UPYLZ0VFV+CkG0rhcDXg4oDQyajhSktC7hLUt1h0IlvTo
         iYuNtNfP4RuR5FMSkEIckGZDnLltjw9sGvyf2G3wtyy2tN82Kv8VlsdN614MqO95P4G2
         QEmEcvOeMSuf2Kva6sREqN75ZT4SA55ZrMR9g+Xq7ICFZq9roRKBMGyjotXpMGv3dQsG
         WJjdqD2Iz5FzGKgqab4SIfHgxuQbWQWKMMYTla8eRbZugltc2swF19zuy9S7sVRzivO/
         6eE836Z/UHvP3TaQkDpi1fe49JqaJBxZhXFndYodHGcungW3v4spmmE3kBsD3c+Lr70q
         YF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457938; x=1751062738;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVwS6Fh5z64OnGR4LBlPfMlx26sURPRLP7n6w+E8rl4=;
        b=VJtz3Lm2syazp7adZedH3NIc5j+7KrcQb0z0l+eWvQFU7HYeNshHGx/+qr024qzznW
         zCO5GXPfxly9fUeksuh/ANDyJHNJu1ePCqVcBJm+unutlfIRMceoNBzoYY7WSBIwWSYX
         FKFpcT3VhYlrOMenm6aLKTbCK8k8i2pEhlvQyFjxu/Ylaa+C0Rz8/Uan8mUXSQTx2GwO
         fIdr15M8XLp5Q1Y8R4sA1/fyAow/jUq2pl4yThcoQmkNryYDaJ3hkG/rn2KWVKFbxI7S
         2ua6yxZTMKLWU03zUMAQC5cvO+5Vb98NnWH6wXW35uGnseBZN0+VdcqzxIm5ku4vG9OQ
         62rA==
X-Forwarded-Encrypted: i=1; AJvYcCXYrPMw+1gre8dmMVrsqCczwox/oBYlGW3Vcgp6M2zwgT9lEyxRPm50gO6a7FvgdtvPon8k1jKfjGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx87gtmZRXt81v2HB8pjjw+AS/CogS7oqY+ZEDvfGbLHPfC+afK
	fdpU9VSlTa7OyW/1s5Lwqmras+uFUgchQFJaUczLmlsIintABV+T3y9rt3si7SyvVL6bHYnED+C
	Wr6Cyi7WgPD/gzyWfxaRdyupajg==
X-Google-Smtp-Source: AGHT+IGWbUKlCjaeeL5Jq6/oP99y0P2KGUXK+3DxJmW+tayqMBP0Qp74h4SC7OmyoZXB0QBoHnf6jvg7xpoTOjee1g==
X-Received: from ilbbs18.prod.google.com ([2002:a05:6e02:2412:b0:3de:deaf:795f])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2404:b0:3dc:8746:962b with SMTP id e9e14a558f8ab-3de38cb0971mr54757195ab.15.1750457938508;
 Fri, 20 Jun 2025 15:18:58 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:21 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-22-coltonlewis@google.com>
Subject: [PATCH v2 20/23] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Guest counters will still trigger interrupts that need to be handled
by the host PMU interrupt handler. Clear the overflow flags in
hardware to handle the interrupt as normal, but record which guest
overflow flags were set in the virtual overflow register for later
injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h |  6 ++++++
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-part.c        | 17 +++++++++++++++++
 drivers/perf/arm_pmuv3.c         | 15 +++++++++++----
 4 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 59c471c33c77..b5caedaef594 100644
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
@@ -245,6 +250,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return ~0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 static inline bool has_vhe(void)
 {
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 208893485027..e1c8d8fc27bd 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -93,6 +93,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
@@ -252,6 +253,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-part.c b/arch/arm64/kvm/pmu-part.c
index fd19a1dd7901..8c35447ef103 100644
--- a/arch/arm64/kvm/pmu-part.c
+++ b/arch/arm64/kvm/pmu-part.c
@@ -319,3 +319,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
 	val = read_pmintenset();
 	__vcpu_assign_sys_reg(vcpu, PMINTENSET_EL1, val & mask);
 }
+
+/**
+ * kvm_pmu_handle_guest_irq() - Record IRQs in guest counters
+ * @govf: Bitmask of guest overflowed counters
+ *
+ * Record IRQs from overflows in guest-reserved counters in the VCPU
+ * register for the guest to clear later.
+ */
+void kvm_pmu_handle_guest_irq(u64 govf)
+{
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
+
+	if (!vcpu)
+		return;
+
+	__vcpu_sys_reg(vcpu, PMOVSSET_EL0) |= govf;
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 48ff8c65de68..52c9a79bea74 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -755,6 +755,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -857,6 +859,7 @@ static void armv8pmu_stop(struct arm_pmu *cpu_pmu)
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -883,19 +886,17 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 	 * to prevent skews in group events.
 	 */
 	armv8pmu_stop(cpu_pmu);
+
 	for_each_set_bit(idx, cpu_pmu->cntr_mask, ARMPMU_MAX_HWEVENTS) {
 		struct perf_event *event = cpuc->events[idx];
 		struct hw_perf_event *hwc;
 
 		/* Ignore if we don't have an event. */
-		if (!event)
-			continue;
-
 		/*
 		 * We have a single interrupt for all counters. Check that
 		 * each counter has overflowed before we process it.
 		 */
-		if (!armv8pmu_counter_has_overflowed(pmovsr, idx))
+		if (!event || !armv8pmu_counter_has_overflowed(pmovsr, idx))
 			continue;
 
 		hwc = &event->hw;
@@ -911,6 +912,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 		 */
 		perf_event_overflow(event, &data, regs);
 	}
+
+	govf = pmovsr & kvm_pmu_guest_counter_mask(cpu_pmu);
+
+	if (kvm_pmu_is_partitioned(cpu_pmu) && govf)
+		kvm_pmu_handle_guest_irq(govf);
+
 	armv8pmu_start(cpu_pmu);
 
 	return IRQ_HANDLED;
-- 
2.50.0.714.g196bf9f422-goog

