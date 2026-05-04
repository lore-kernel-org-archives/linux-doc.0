Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9B421880
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 21:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929537; cv=none; b=GOaMQ7eUkveUf4TCqbtZtRnMagP0Utg9lQMluW8z6wWww6vFoOrN3yLqWYGPN9lHOnmsrVYEIYsr/3DyMxC+8t+V67MqEKAvqbt8B0EEqzbNlOEVXrjWUcXc0/2zJgMXmbluUSTAV2/Naa1QFRm8R3XkHq5wVSp3peNtTLE5Ik0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929537; c=relaxed/simple;
	bh=Pg+yMKRnt3P95Z9SLp911SYb+lsalrBcQHJk+/HhrK8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B6TNw1jXjCj4fRBb8aw0I8T/HYq+cZpnvcwzfxRDbJAT2RxJyt/s7NxSc0bWzhtfLQj5A9jtAbNI6AffZd3vr2Z3bLkeyjoq366zJJB2K+lvNI8OYkCAeSl+8fghvYex+y/vkObvRRhF+HzfWin9fD4SXqDRWnEJVqPSrCjRubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EKLMdcZd; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EKLMdcZd"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-7e0632c733aso2118118a34.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929529; x=1778534329; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4eEXyvRG46atk1NeuxPuyTaL3r+WKmiAuf7G/PMx4+I=;
        b=EKLMdcZdLtlwmqzjgzN+QZf3zDniAwF1wYs6LIdklSQCzIqjiGbkwRKRk+y4g46NoE
         nzKHaxB6FJcQ8rrGPYTXcET8x5pV9+1w2wb10itZS06qWjCMBerzrrv4MclfX1znr8ow
         ZSOvywYgHvZUDdHybGXz0Ey/gs/U3SZAbCkxGuEtawpjgxirKX2KrfERVieSYehCHH+A
         bgRHEVeBXpjkUan3T5giIW04t5lotMJyWDH8HLzKY0jOCK0tLtlLReUaf7pyF7C1dKM9
         38rLdACDIK+sqbb74cCEctH8n78eWjSrpudRlENftrczseTATUZCxnjwK/M5CNwv5tDt
         7VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929529; x=1778534329;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4eEXyvRG46atk1NeuxPuyTaL3r+WKmiAuf7G/PMx4+I=;
        b=H+BKfFzNR+MF1VxF3/IAhUT/MX1TEOXDa5+/8oqHYwEK17d0cp2MM37TAyL/aB8jPB
         smGFOX6nWiKOLwsXdLETAtGqpvtrig9lUOi4aarp2ztvWYIuhPdg/wZ778itZoO99JAn
         /gFZJx6zu44qD8M9A9tKtYElGQIA3mUWjKOV3VWhkAfmxVH07z9gLEdVZZh7Ymk1M7C9
         DFMg/pGN9RQAvy1w6olGLgRbjvXshGXQsF7FSxvZo8f75j9OoLul56yTSGaLkeC8ToJ6
         W8uHAt2WSYPaSwT4ESBbbZNWLPhH9sR9U85+tEY8S88/B2Y7i5+kOIe79O2+D8cZUBCI
         kzIg==
X-Forwarded-Encrypted: i=1; AFNElJ+JEpisnzkLI+otqItIit167UF9Djmp1nENTgSG3jLz0I1ttcRXUqn8rBkSqiXkCdFfCaosbl82xyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlayd/0xUd0YOyahikI4BwzC7Rd4d2ExoMAVYBgldvfzTXCWqR
	eQMhs1pYQR53M+WHD67hut33auf4BGiLxWlroPvbaAjlgh3o66fbbFB8rv2bAKRkagOILOp0vtf
	jVIYood0SCPE76v/3v7VK/HjCjg==
X-Received: from ilmv4.prod.google.com ([2002:a92:c6c4:0:b0:4fe:8f7d:8d00])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:20c:b0:696:1f6b:b3b0 with SMTP id 006d021491bc7-69697c50c9dmr5805746eaf.33.1777929529289;
 Mon, 04 May 2026 14:18:49 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:09 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-17-coltonlewis@google.com>
Subject: [PATCH v7 16/20] KVM: arm64: Detect overflows for the Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When we re-enter the VM after handling a PMU interrupt, calculate
whether it was any of the guest counters that overflowed and inject an
interrupt into the guest if so.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-direct.c | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/pmu-emul.c   |  4 ++--
 arch/arm64/kvm/pmu.c        |  6 +++++-
 include/kvm/arm_pmu.h       |  2 ++
 4 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/pmu-direct.c b/arch/arm64/kvm/pmu-direct.c
index 535b4c492ff80..9693d9eb69daa 100644
--- a/arch/arm64/kvm/pmu-direct.c
+++ b/arch/arm64/kvm/pmu-direct.c
@@ -433,3 +433,33 @@ void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr)
 
 	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, |=, govf);
 }
+
+/**
+ * kvm_pmu_part_overflow_status() - Determine if any guest counters have overflowed
+ * @vcpu: Pointer to struct kvm_vcpu
+ *
+ * Determine if any guest counters have overflowed and therefore an
+ * IRQ needs to be injected into the guest. If access is still free,
+ * then the guest hasn't accessed the PMU yet so we know the guest
+ * context is not loaded onto the pCPU and an overflow is impossible.
+ *
+ * Return: True if there was an overflow, false otherwise
+ */
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu)
+{
+	struct arm_pmu *pmu;
+	u64 mask, pmovs, pmint, pmcr;
+	bool overflow;
+
+	if (vcpu->arch.pmu.access == VCPU_PMU_ACCESS_FREE)
+		return false;
+
+	pmu = vcpu->kvm->arch.arm_pmu;
+	mask = kvm_pmu_guest_counter_mask(pmu);
+	pmovs = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
+	pmint = read_pmintenset();
+	pmcr = read_pmcr();
+	overflow = (pmcr & ARMV8_PMU_PMCR_E) && (mask & pmovs & pmint);
+
+	return overflow;
+}
diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index a40db0d5120ff..c5438de3e5a74 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -268,7 +268,7 @@ void kvm_pmu_reprogram_counter_mask(struct kvm_vcpu *vcpu, u64 val)
  * counter where the values of the global enable control, PMOVSSET_EL0[n], and
  * PMINTENSET_EL1[n] are all 1.
  */
-bool kvm_pmu_overflow_status(struct kvm_vcpu *vcpu)
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu)
 {
 	u64 reg = __vcpu_sys_reg(vcpu, PMOVSSET_EL0);
 
@@ -405,7 +405,7 @@ static void kvm_pmu_perf_overflow(struct perf_event *perf_event,
 		kvm_pmu_counter_increment(vcpu, BIT(idx + 1),
 					  ARMV8_PMUV3_PERFCTR_CHAIN);
 
-	if (kvm_pmu_overflow_status(vcpu)) {
+	if (kvm_pmu_emul_overflow_status(vcpu)) {
 		kvm_make_request(KVM_REQ_IRQ_PENDING, vcpu);
 
 		if (!in_nmi())
diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 8c10ad05661bc..f1c66ce678840 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -408,7 +408,11 @@ static void kvm_pmu_update_state(struct kvm_vcpu *vcpu)
 	struct kvm_pmu *pmu = &vcpu->arch.pmu;
 	bool overflow;
 
-	overflow = kvm_pmu_overflow_status(vcpu);
+	if (kvm_vcpu_pmu_is_partitioned(vcpu))
+		overflow = kvm_pmu_part_overflow_status(vcpu);
+	else
+		overflow = kvm_pmu_emul_overflow_status(vcpu);
+
 	if (pmu->irq_level == overflow)
 		return;
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index de058a5347d18..4af8abf2dde0f 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -90,6 +90,8 @@ bool kvm_set_pmuserenr(u64 val);
 void kvm_vcpu_pmu_restore_guest(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_restore_host(struct kvm_vcpu *vcpu);
 void kvm_vcpu_pmu_resync_el0(void);
+bool kvm_pmu_emul_overflow_status(struct kvm_vcpu *vcpu);
+bool kvm_pmu_part_overflow_status(struct kvm_vcpu *vcpu);
 
 #define kvm_vcpu_has_pmu(vcpu)					\
 	(vcpu_has_feature(vcpu, KVM_ARM_VCPU_PMU_V3))
-- 
2.54.0.545.g6539524ca2-goog

