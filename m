Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001D30DEDE
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 20:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765313577; cv=none; b=qHERwB5fdqdN59xkqw9yjpMTyUIrLl7i2Q3S/afiWaOTu9Jb62kRmDFW6yEzxF8cTbNUq3fcBiwbg9TRsJ2+u7L63d0eY5HtcqoZDy/qRDuKh9v1hD5j3HRY0MMyROOkfy65bEveVOHnTOWgnHqZHfkMiUoy9+8PmYQrvW7GcYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765313577; c=relaxed/simple;
	bh=vXep3cSR5+RW3ZaGAs8EaICvp+PDXlXKTrV3Sz3Arf0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bpC9nOwclh3BKNS6ggT3DcWY+lnc9On461wWqYAExIfnvcJjJEbStirAZm02xBkdyvePo7uMDGDl2LjrF3IPkHCNzco0xsz2FG+GDpHKnC2T2x90/C7TnYDvyvobFdnQZW4v6dNFHwwZO4P4m3sQbXSUcu8KW+m/bhgjwSbGoFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UJW7uWDB; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UJW7uWDB"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7c7599a6f1fso11824764a34.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 12:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313566; x=1765918366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3C+EgXBZrnvYKUsePQFPeWA6+JM50EPdZ7QjJ5U3nk=;
        b=UJW7uWDB/q+u1O0dzb6pn1hiAyGvferoZeQawIWhWDMW7xnVcTDcqzs4sXHB/KDSny
         04wVi/yvZm3AhjvruaQWt6V+Nfbui+xggqXNGvZWEZzOQCnUyGCgbTdbFw9mWBQ2cn7m
         wshbekOLEClxTYGi9KsbubntcVjaAV27sVJWhXeshugfDQ1htG5gBp3BYWf+9F1AmYNH
         HAqU9Xy50KLMWHWds3uoGdxWmTP9O7GeKAeRsdcN2w7iCL4UD3gnWi5p9bNVl8QapSmE
         j00xIyoaiqmlT2XtSPlEyqjBXls1vcFsnHw9BSd2X5SEuYSTl1R/B9aq+gy4LXIC3Ij1
         Bm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313566; x=1765918366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3C+EgXBZrnvYKUsePQFPeWA6+JM50EPdZ7QjJ5U3nk=;
        b=SKvDWveum50XzfWEiJry+0LrOiU4lQ/pb9ljX7q6JM5Twyg+nv69SrSYpCKH1y25Mi
         zXTOPuLrZgCFAWtdC544CHoMSSD+d9CsO0fCuQTYEyjBIwcMcz2iwUyU0Btgb/oQLvn6
         +mbdHlMI/DUT4na7yZyh/CiuBlaaeShI5KLNnCOhP3h7HRpgvhsc3zfsmIpZjTmeQ3+R
         Yn6DNl5gj0eYL7TtwDWd9mGO0Pky5KdxkE4vdMyBsXQnE/xsI0S0dkBu1K6OBx0ztZgK
         8alRI8N8krnn/Q6opV6BwnOODu7eLzpLmIdPNSuQLFtyHa7AM9k9Au2FCfxb4zBB16eh
         2p2A==
X-Forwarded-Encrypted: i=1; AJvYcCUQBdwbpRC3i/NBdBrexlJ6cIyU+v3ZXT1qenF/H9wX5p2rTlLqxCuTUY2PEhGV273M91S+i9loyl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YylhZuRKKCxNPVdQEahK0F/fwSOpCqimgk1sKD3QS7JVqF+hXyI
	wesLanWzIYdcipUSO2EizFRGUn+HSGQlpFVrdgoUyB9l6PrKhVdUR6JukqMEGwZWQ5zJ+9HnE0R
	KueIbwcG2m4Vfv7O0TTccrQijSw==
X-Google-Smtp-Source: AGHT+IE+Q1bxOP7O2hdAR+5uvGwSUyrHQRsNxJJcZ41BmbQLJOhfNhTF9IlZ3TTqoSNqarccK80mXi5fG/4ler8rFA==
X-Received: from otbaz24.prod.google.com ([2002:a05:6830:4598:b0:7c7:307:1f8c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:7198:b0:7c9:59a5:dd04 with SMTP id 46e09a7af769-7cacec5716bmr83284a34.37.1765313566430;
 Tue, 09 Dec 2025 12:52:46 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:17 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-21-coltonlewis@google.com>
Subject: [PATCH v5 20/24] perf: arm_pmuv3: Handle IRQs for Partitioned PMU
 guest counters
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Because ARM hardware is not yet capable of direct interrupt injection
into guests, guest counters will still trigger interrupts that need to
be handled by the host PMU interrupt handler. Clear the overflow flags
in hardware to handle the interrupt as normal, but record which guest
overflow flags were set in the virtual overflow register for later
injecting the interrupt into the guest.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm/include/asm/arm_pmuv3.h |  6 ++++++
 arch/arm64/include/asm/kvm_pmu.h |  2 ++
 arch/arm64/kvm/pmu-direct.c      | 17 +++++++++++++++++
 drivers/perf/arm_pmuv3.c         |  9 +++++++++
 4 files changed, 34 insertions(+)

diff --git a/arch/arm/include/asm/arm_pmuv3.h b/arch/arm/include/asm/arm_pmuv3.h
index 3ea5741d213d8..485d2f08ac113 100644
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
@@ -249,6 +254,7 @@ static inline u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu)
 	return ~0;
 }
 
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 /* PMU Version in DFR Register */
 #define ARMV8_PMU_DFR_VER_NI        0
diff --git a/arch/arm64/include/asm/kvm_pmu.h b/arch/arm64/include/asm/kvm_pmu.h
index 43aa334dce517..e4cbab0fd09cf 100644
--- a/arch/arm64/include/asm/kvm_pmu.h
+++ b/arch/arm64/include/asm/kvm_pmu.h
@@ -101,6 +101,7 @@ u64 kvm_pmu_host_counter_mask(struct arm_pmu *pmu);
 u64 kvm_pmu_guest_counter_mask(struct arm_pmu *pmu);
 void kvm_pmu_host_counters_enable(void);
 void kvm_pmu_host_counters_disable(void);
+void kvm_pmu_handle_guest_irq(u64 govf);
 
 u8 kvm_pmu_guest_num_counters(struct kvm_vcpu *vcpu);
 u8 kvm_pmu_hpmn(struct kvm_vcpu *vcpu);
@@ -322,6 +323,7 @@ static inline u64 kvm_pmu_guest_counter_mask(void *pmu)
 
 static inline void kvm_pmu_host_counters_enable(void) {}
 static inline void kvm_pmu_host_counters_disable(void) {}
+static inline void kvm_pmu_handle_guest_irq(u64 govf) {}
 
 #endif
 
diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index c5767e2ebc651..76d8ed24c8646 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -396,3 +396,20 @@ void kvm_pmu_put(struct kvm_vcpu *vcpu)
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
+	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
+}
diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 2bed99ba992d7..3c1a69f88b284 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -783,6 +783,8 @@ static u64 armv8pmu_getreset_flags(void)
 
 	/* Write to clear flags */
 	value &= ARMV8_PMU_CNT_MASK_ALL;
+	/* Only reset interrupt enabled counters. */
+	value &= read_pmintenset();
 	write_pmovsclr(value);
 
 	return value;
@@ -904,6 +906,7 @@ static void read_branch_records(struct pmu_hw_events *cpuc,
 static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
 {
 	u64 pmovsr;
+	u64 govf;
 	struct perf_sample_data data;
 	struct pmu_hw_events *cpuc = this_cpu_ptr(cpu_pmu->hw_events);
 	struct pt_regs *regs;
@@ -961,6 +964,12 @@ static irqreturn_t armv8pmu_handle_irq(struct arm_pmu *cpu_pmu)
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
2.52.0.239.gd5f0c6e74e-goog

