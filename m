Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63628F947
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518400; cv=none; b=bKUwIXgwnYiUCJZEw7mnJsQN6LaaTq7xZdCLMeH3SuW73S1UI+sz5LqgdwGNKhPvYW1x6x9NaiPpZA95KxDQtod3Q0psZoOxkgkDxanRKseQKSQmr6Pq/ZIV6GtAzP1uH9oWZBXdkpqn9sR35vW3eOe2gacOLcpBN/wuL8CkP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518400; c=relaxed/simple;
	bh=3Nke7IrlZt1dIQrrtJZ35wZYJcBpZtgeyy0gHEfYDMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojilvbmegevuNEgJsJc9ZgmEB8iMkBBd1RdiXzonewcsL3hZaIqecIL9HG4YpiRWty11IG9cynktRi5JmLIvcd+Q0dxePn8ssJDjbk8jXWBQ7friDA9UliEW4e1zEieg01PwfS/dlRSMQ7lucJOk6rm5MA58AblrhY/fTUr5vKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KnaaY6Tj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KnaaY6Tj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so6608185e9.1
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 04:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518397; x=1749123197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=;
        b=KnaaY6TjR4AICoV2JJrqWG1W0pSC7v+0G8uQtLOhKzoHGidv8xYyDbaIE3NV6ecKIJ
         PIShn1HZ3xXuN5wcngBBy1IqHnBfgyh5iLEpHgz7s/rt5l2Ee3un8kdFSWP7B8R94b8G
         6bkChmSgAgI2Bjzc2/vIOLFvuVcezzx4q4ROlhLkPoWMdxABPA3cMi8f//BXKidjVbmS
         6ciRDuKwzqGkzpDfYKaAGpS0FggZw0jZKAEsE83h/fyyJSrsY+P9xFTC0DRBZgRjIth+
         CfLrKQeyGFHjf45N+X0BkbjHFuvxIZSD6vEBo8XyQ24CGgdUk4ciBpUbWmf+Qv+62Id4
         /69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518397; x=1749123197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Nc8ucW60XE4Jn3cBqaPeV8SZm/My/nwOffHN5F4rVM=;
        b=lodA3jBBO3EF6Y9UtJXqpWyMj+dh+hVAZQ0VnxJPTYa8z2nerE1O8NaiB4dye3zVf8
         W4MBYRRHJKL+4JptcxtyY29X+bF3SAeYg9EF6+kCSdgVJhxhX0/xfkYNqHsKjqp4jGAK
         GAszIG2iwlzEz/YN50Ju8qmB1UP1jEvW69f5wzVLmzo4xDn/n0P8Ax0N4q7lMahSTY32
         zlvXhM2e/kYYSQ9oc3vKyrmQ9+lJIDPGAdfv5OyHrJ+FV28ZCbVvN80ByBpxdNuUI1yN
         ASH967MQKKbiBQgVczHl4+EthPai+30yH+Aj4vvNaPc+TGYsWXh7e1TyGJyVFri1u/pJ
         wB6w==
X-Forwarded-Encrypted: i=1; AJvYcCU3dWyDIncfGH8rcEm8u504EspfD1vLzWTrZJnIBk6yDF0D/OPnREiZ/WWlj1nsxnRm24/obVnUQpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPBJ9QwD42EnNady+MaJ/eqA/0rn65uVcsF8M1LN80eoY7iZdd
	4cQerj2B8MdmCTFOtec3H6CdZ5oYm+wcLk7znWVQ7zBcifv1vH/Ni7vxJ4qLb98Jfy8=
X-Gm-Gg: ASbGncumqNNZmGn3tuaUANbHTqsW75+cClyHxG2MaSDMlCslv56YzJ8eGX4W9J527oe
	l9CP5yc1wV2TWOfaoXG754LpPWlvl+lVgZ3byQ4o88Ml3k5og5k/W/HqvUTW7d5KhPJ4s0zxfdh
	eJ6eSMrhvwehs/9ZugauOYCvxBx3hEzyk0jK7PKvHs09uSbCfiF84eX05/Ae79DacqX6NDQHTPM
	rLpIAJrlBoWuI+8bwJ5BAqWuyP4CKVRyzS6pxPRICsL9SV9ZB47+7oIr7x0p+6FkSpy8XEMorZh
	0mLmaayV+lv+RIpQ4zhvU9YXqKfy4vANTnBfz+xQ1YQBpS3f02+jLaP7zbyB
X-Google-Smtp-Source: AGHT+IEKUlq+VjysuU7OFlzmN9WWwVOAQRlwZk1C8MZ05ufCqPWjkB/S4hXmEcNWVtw0X6JufGjbcw==
X-Received: by 2002:a05:600c:621b:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-44fafbf883dmr95464645e9.19.1748518396915;
        Thu, 29 May 2025 04:33:16 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:16 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:27 +0100
Subject: [PATCH v2 06/11] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-6-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f9..05d3e6b93ae9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 5dde9285afc8..9f544ac7b5a6 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2956,6 +2956,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

