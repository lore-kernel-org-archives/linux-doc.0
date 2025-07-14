Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3091289806
	for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 22:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752533986; cv=none; b=TmZ/Hp7PKeQTRNdzvBFnrvBSMtMZI4I3OYHfLnIwyBe/XJvUi0ymo27hIlGcHneBI5YhRL0omBcyoAraOsRN/3jAhD3YsA1+vJlBbDWPEImehIFzlza7GKfMzz/RrYetyTemfYSzg/LUnXtaN7noTPjrdm3kyWvLeWKGnOc2C1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752533986; c=relaxed/simple;
	bh=1oRYKgyodAIezFvFunmY4ZgugzoQY527IXPevx8VDmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tFJT7P2I1ik1dM3Tc9FgZ43E8Bq7tAbR+9oKz8IHpacvCTGmrAdUvwjuLLcjBbtJmqcgukJs7iCn8+tXOGnsyUEHwEGpXxgs7stNPUntRA603r7uMPnroP9Z2+qsS0ml2Znf8+oKrTuneFYfnZfHIKvghjiXZjGXxdKttRlym7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fiwBTgsO; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fiwBTgsO"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-86cff1087deso975157339f.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Jul 2025 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752533981; x=1753138781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwV3+W7/ehj+b6ug0rN7nGCOEi4xiU5YZ2CQkSQ6/UA=;
        b=fiwBTgsOP2dUbPoCv5EqMcnQyXxubiZ0MqB0K31VGMKV5RCdk3iijhD8h2QYdCs4tt
         qn8O8iZs3lHXwbKjozwPRAMhzT2BbpsBi1Nyv/xJazBDVA9Zuklt0/0nPE8FjcWsuFyP
         BmL81OfpaWBWhkOVEZFiSAl2pYhYBj6vbdDCNZztFdy8pVLgwDqpVEZqs3gfNISst22t
         g6MCAi7Q2AehQyx471hCeizzYi6Nb6rVf7ZU1w5qOxWHqc719Hxt2KQiMJkBbzLBdEk2
         HlbGTv2T7xO9xJYnbcajc9xE45wCPyxeXRFDOBOwa3YyPiQW5nvn77z+0Vh/55MID166
         r4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752533981; x=1753138781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwV3+W7/ehj+b6ug0rN7nGCOEi4xiU5YZ2CQkSQ6/UA=;
        b=aax11+y/KyzQSx5FZt0K9tneb0wI6keDgvh/jjv6V8LM3Dl4z02AFife6gkyjgms7i
         7ORWPpzELiWCmqClHlgu8XPmjxbZyT+MAQdqpGODa6IiX4126ZIwWIZQ/cftYzD2VaxH
         7Mkrkw0GCIEEfZnjOH5Oru9VFSaDJAtFb9iZmcdA37I5K/AhygKjs9GYXqsZ0VElan22
         hcmE4LaOSD8QwOZmC1v8JaGrAKvh2DAtDh5io9HGjTSHcz8QmU7UGnrfXvvJXQTNF7YE
         J5uUcVBIzf7wpwp4H8JlkcDOcFDPkATl3+bg6ACvi075PoAPO/vfBkywXoLKMY8PFfvT
         fAdA==
X-Forwarded-Encrypted: i=1; AJvYcCXKqx4Fvn0VoxcTeCA0LnYaeC5VSAJB3/zMup7Tbxy+nvFbBrkpUqMUpmXf940JtI6JPxS+DlYRyUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySdSoyFL/ZRyFeD09S16zfC/ngE4uAzD7ol1kpHD/vMKTiWqgz
	jXm/TE9t5AL/AtrRaeMKav4XCCKeLxIM5TXEHcoM7q9496zJ4vExk+pUGCwRqr8ciSYhR1Pkuj6
	tBnqNmdkRxtqJnGTBacfB7nhLVA==
X-Google-Smtp-Source: AGHT+IG6/Fx4XUt6OiaJ27GEFxRfFyj/zm2cocalWyZGbwfyqaLHqaZuCwZo40dqJJR4NG/NpTcvClqhKJzVbklHQw==
X-Received: from ioge24.prod.google.com ([2002:a6b:f118:0:b0:867:188d:7f6c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6602:2c95:b0:861:d8ca:3587 with SMTP id ca18e2360f4ac-87977f7198dmr1861411639f.4.1752533981283;
 Mon, 14 Jul 2025 15:59:41 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:59:05 +0000
In-Reply-To: <20250714225917.1396543-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714225917.1396543-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714225917.1396543-12-coltonlewis@google.com>
Subject: [PATCH v4 11/23] KVM: arm64: Use physical PMSELR for PMXEVTYPER if partitioned
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

Because PMXEVTYPER is trapped and PMSELR is not, it is not appropriate
to use the virtual PMSELR register when it could be outdated and lead
to an invalid write. Use the physical register.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/include/asm/arm_pmuv3.h | 7 ++++++-
 arch/arm64/kvm/sys_regs.c          | 9 +++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/arm_pmuv3.h b/arch/arm64/include/asm/arm_pmuv3.h
index 27c4d6d47da3..60600f04b590 100644
--- a/arch/arm64/include/asm/arm_pmuv3.h
+++ b/arch/arm64/include/asm/arm_pmuv3.h
@@ -70,11 +70,16 @@ static inline u64 read_pmcr(void)
 	return read_sysreg(pmcr_el0);
 }
 
-static inline void write_pmselr(u32 val)
+static inline void write_pmselr(u64 val)
 {
 	write_sysreg(val, pmselr_el0);
 }
 
+static inline u64 read_pmselr(void)
+{
+	return read_sysreg(pmselr_el0);
+}
+
 static inline void write_pmccntr(u64 val)
 {
 	write_sysreg(val, pmccntr_el0);
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 704e5d45ce52..e761538e1e17 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1063,14 +1063,19 @@ static bool writethrough_pmevtyper(struct kvm_vcpu *vcpu, struct sys_reg_params
 static bool access_pmu_evtyper(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			       const struct sys_reg_desc *r)
 {
-	u64 idx, reg;
+	u64 idx, reg, pmselr;
 
 	if (pmu_access_el0_disabled(vcpu))
 		return false;
 
 	if (r->CRn == 9 && r->CRm == 13 && r->Op2 == 1) {
 		/* PMXEVTYPER_EL0 */
-		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, __vcpu_sys_reg(vcpu, PMSELR_EL0));
+		if (kvm_vcpu_pmu_is_partitioned(vcpu))
+			pmselr = read_pmselr();
+		else
+			pmselr = __vcpu_sys_reg(vcpu, PMSELR_EL0);
+
+		idx = SYS_FIELD_GET(PMSELR_EL0, SEL, pmselr);
 		reg = PMEVTYPER0_EL0 + idx;
 	} else if (r->CRn == 14 && (r->CRm & 12) == 12) {
 		idx = ((r->CRm & 3) << 3) | (r->Op2 & 7);
-- 
2.50.0.727.gbf7dc18ff4-goog

