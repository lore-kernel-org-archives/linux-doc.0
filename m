Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0497724DD04
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 22:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457932; cv=none; b=Y4HnzK21Fclqn+adse7kuJSmXr2WFsA7fH1fRg+VpriTGkIeTHRuZ0/iGvzEfeUfm7UWZfeG1qV014jE+l6MRmokz5tk/TrYRYVqSMM9dBQqX6LuucKR4dSe3WnxRb2ex716nuXsknVM/mlRGjRaHvAx5yH9J6YZa8Uq2UTe3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457932; c=relaxed/simple;
	bh=QZPsbtUaYametyX+rMN8NQzux/Frt4tHD8rtEMiJ9Sc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PU6W7FUxi84WnhmvkVsrRVQmYu6AyuTOLR8jdi8mkMiB0SdlfrI1w7eJcV6FvuMfOAEV7wXF7rxSvVepUfLXDHiA+5aCGKXfHoG3q9ZKI39+gJdHpHfsGGegsqdJA0k2uD+1/V5Ug7e/0Ka1eZLNd75V7c6xzzx0fvjMr68xLAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Z+cZGCf; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Z+cZGCf"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddd5cd020dso51294395ab.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 15:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457927; x=1751062727; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBxhIed3fkpmOQu/SLH3ienlsanfX2Wz3izzC9sfark=;
        b=3Z+cZGCfJ78sAjnnQ72+f3zHiwvuj5b/uXlIYL3THEqhtbdqTyH4shcij3/980B3Mn
         3XQ/BZCRacwGADPnTbY8217yPtpdCuBMr2PGkyQ1FhCyCyVvueVSO11Z1u274p71DKzm
         1nioFD5LH+WJankQC1S4IJo9sJ4ocWG4SyryHPE5c+v88Wu+yVcPmZoK5eFxE7/W5pLj
         hImWLkE3tC0bWIGZLpfPwAHK0zORXg3H0Jtm52vnXnCbS51le6znl1oz6+ONS6n6qQHq
         TEIj2LqBjO3Xqifh94dZjWpvsi9ALx0lCASLMYuSsQ/NzYv9jjVBRsBJRCByd32a7D5k
         Pzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457927; x=1751062727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBxhIed3fkpmOQu/SLH3ienlsanfX2Wz3izzC9sfark=;
        b=IPM8ldHPNI2lAW0Xe3nhxatktW6TY0Jpuw4l64N7AeNhiAz/S/IsdKATLJWXfPGIJM
         J+Uh5ZxLO5zSTYfE9gtdkzqraawZXcX5pa7J7Dy4n+xOE4f3d06jj0A0s341guEHIml8
         GlAqFuQfeH/BRdiFahI+UKuXxci5KI49uqWW4wcztEEiU7NUhikCQ2MBbqkN7Dn/dPVf
         6IXXECvlhy1L33XEy6kMr8chWc/1+tn4gAD9LyezbPnr2fjanIEKA4y4g6NFoCmAnKbB
         4LCNVfWfJxrvfcFQOQ1Ul1eJpCuGJ9lt6H4DwYJKAjQSULtktuQHD6My5D8fgoraGaYt
         V1gg==
X-Forwarded-Encrypted: i=1; AJvYcCWqJYNTovEadoeve9vUMac+A/WKZfszW7SkXrPWOOBF8hzDARI0/hplilJZ3h9Vfrtjr58DriXIvXM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJIginYkkivVPETmiWtn8YehXmTRy+IwxdkaIwlch4FD3yZPk
	FVaPutWEnUHo7kI13HUGIZbrN13aE6LwH4Ms3uJZ/JdURaE/vCHs5ByfIxLagCiowOSNpodemH7
	IfDdvpNz8pD43QOJIyQTdbI1vnQ==
X-Google-Smtp-Source: AGHT+IFTbBL04tu/5o1zgL0CZq/zWbduiqa+Y5YKeofcr7jFQYs86cUlPmuIGNSiiyk8Ax4cMVHcBUNCIBRZtQH70g==
X-Received: from ilbcp10.prod.google.com ([2002:a05:6e02:398a:b0:3dc:756a:e520])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:2488:b0:3dd:c40d:787e with SMTP id e9e14a558f8ab-3de38c1b8f3mr60278825ab.2.1750457927652;
 Fri, 20 Jun 2025 15:18:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:11 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-12-coltonlewis@google.com>
Subject: [PATCH v2 10/23] KVM: arm64: Correct kvm_arm_pmu_get_max_counters()
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

Since cntr_mask is modified when the PMU is partitioned to remove some
bits, make sure the missing counters are added back to get the right
total.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 79b7ea037153..67216451b8ce 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -533,6 +533,8 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int irq)
 u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 {
 	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
+	u8 counters;
+
 
 	/*
 	 * PMUv3 requires that all event counters are capable of counting any
@@ -545,7 +547,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
 	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
 	 * Ignore those and return only the general-purpose counters.
 	 */
-	return bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+	counters = bitmap_weight(arm_pmu->cntr_mask, ARMV8_PMU_MAX_GENERAL_COUNTERS);
+
+	if (kvm_pmu_is_partitioned(arm_pmu))
+		counters += arm_pmu->hpmn_max;
+
+	return counters;
 }
 
 static void kvm_arm_set_nr_counters(struct kvm *kvm, unsigned int nr)
-- 
2.50.0.714.g196bf9f422-goog

