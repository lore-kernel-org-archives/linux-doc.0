Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F642D5C6F
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753102456; cv=none; b=hB0Psj5uRob31O6uW5e1MhfG2sFJ3+QJUwe3ig7EiGO53p6jq7qU5VuiCCIeqUjtCfmP46Q8UAacmjAz+2aFWF0ZDs6ED7ogrAIn+yW287HQRerDvVu1UzhbscgKroyEOgxxnszrPJKfvjbZ7Ltp+e/wPzj2xHOWXMY+t0WqX1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753102456; c=relaxed/simple;
	bh=9AqTDlFlnYNqwgH8WgsUNUI/wAUjnT2DTHCTcxBObsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W3gAa6j/GxznyMR4kkbxn9G0wAi2ESDYe/hnavq/y8Y+d3nIBF8+qThQQcgf/ho9YCpcKX3aiDrNAMEoyjAfrBNX7S64D4Ql6ZaHljxWXtiQAbnHOKAIQLbo5+MuPNDmw8grz2nCDpj5z1IgHHyxdRG3yIMD8M8juNvJ8bOo354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwCyRYwC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwCyRYwC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso33125135e9.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102452; x=1753707252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qXkvCvtwQUgO1rzNPbi1g5SXwSvNrlBklFVwiaO7B+s=;
        b=NwCyRYwC5Sd1RIo5qRa/Hg+l2W7RcWI9WhBn93/i1JV+fhD23NwRLRaU0eGqDIOB3P
         wm6K8QJAvuBdRgGm0bH4hepuPrCMIel1+PBbSgOtDez1HDvPkJ7j5WSDAbHWmeRvJ5a5
         DZlGyGYHa8Q92az4H8IN/fL47Icycg7sDq4IMwua+7R9LW8liVfuj4TDVhjuKPmaMkvq
         a/MRzYpEQSNgv/AM+it+07ejJREJrS2YG4L42LkGH5NuY2eLxWmwYzHwDceSZOhCBZjr
         RNCk4WsEcyhtJVWapJG5Sds9DILcScoUFYXA+0C5yx+yzdmWh7dLNSjCIohQUvElnN4/
         2FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102453; x=1753707253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qXkvCvtwQUgO1rzNPbi1g5SXwSvNrlBklFVwiaO7B+s=;
        b=qrUf66nz7nZ4OcQFw2e7GefHCI/YcAo1cbCX1TEIVfiO5OI/MFESujFKH2Ryp2LnWu
         a/Z0msVIeWZjEGOHEVksFH6JOORWLW2bIVAW4cpmlSNAAoNIsV9fFJ8q0FgfEiGaVlFo
         WqsZXirX2o4Wy0SwPvLSV850BJ2vMNyak4XJfA0ikhs766glkLbNmAaT5gvPsCkAtYt4
         Xdpnb5P5B9PWXx/nmGilaUyTjuGlLNi/9GMQZ7xsc66j46z9tTNVLhWFeg1TomT3zncB
         hx7vz2HE2waSyWg2N/pmDwI1g5AsEr99K/kS4VJIG2vP+r/44eTEnDjzA6sZcYwvQcic
         t7sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrSqbQa5jAKpjaJ5d+KWG0ru6Xe53QJxUUY3E46Q4s23Crv8fIfH5bhGlgdks9smu2edmKjw0ngV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuiVacQNn4uYoNwGUW8kgieIz4iklG0/E6Hj4rBJ9EUwvpinIF
	ipBbb1yP6eDFH0prJw4iyYwclhOqY4lYy5vFejp6Bj+xq7SjEuHaBH8GVkQT3S9fmS8TJCNg7oW
	UplrOt1o=
X-Gm-Gg: ASbGncuyH1tsgDTo45TmfwJkUhPihcjQUueuTZwn6Hs1arltqpj1+lKeDtL0xTR56AM
	OCsInwQ0o3f7Y0LPXiynmLXpHmc84dw+yU73f9szmb8VqIcAz/mUaf/IWaRvxHh7ztHn3JHEcTC
	Gy5dqWDBi85OZeK3rYb0DpupyCyU+KfyXvVuHnJPv4ALTXVa9fS2IsIJgROjoi5t26WCDhp7rQU
	rCrws/vsK5PpytiL6gbtzZa/vm0y6V7hdfzK8wR8LD/EiRYi9ncm0t9qSJSTLZteD1gveEMSufw
	HpMUwGAqWyIzgN7pk13bI+9JnP1PZHhr83QyYLP0qzGm9ObBKeAmGoINEIOtgr9dnmJO9CgZV7M
	GJ1rwN3y+CCiuCRw+BlBDEUZM+l/wg9I=
X-Google-Smtp-Source: AGHT+IHpaWh2ac5SYmY2ltrgXpysP6sDtQYkPcfWwMUoh63zg4xaji/VnwZ2IITaD9sW48Svnh7IDA==
X-Received: by 2002:a05:600c:348c:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-4564ab4fe8cmr29393885e9.28.1753102452582;
        Mon, 21 Jul 2025 05:54:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:33 +0100
Subject: [PATCH v4 02/12] perf: arm_spe: Support FEAT_SPEv1p4 filters
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-2-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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

FEAT_SPEv1p4 (optional from Armv8.8) adds some new filter bits and also
makes some previously available bits unavailable again e.g:

  E[30], bit [30]
  When FEAT_SPEv1p4 is _not_ implemented ...

Continuing to hard code the valid filter bits for each version isn't
scalable, and it also doesn't work for filter bits that aren't related
to SPE version. For example most bits have a further condition:

  E[15], bit [15]
  When ... and filtering on event 15 is supported:

Whether "filtering on event 15" is implemented or not is only
discoverable from the TRM of that specific CPU or by probing
PMSEVFR_EL1.

Instead of hard coding them, write all 1s to the PMSEVFR_EL1 register
and read it back to discover the RES0 bits. Unsupported bits are RAZ/WI
so should read as 0s.

For any hardware that doesn't strictly follow RAZ/WI for unsupported
filters: Any bits that should have been supported in a specific SPE
version but now incorrectly appear to be RES0 wouldn't have worked
anyway, so it's better to fail to open events that request them rather
than behaving unexpectedly. Bits that aren't implemented but also aren't
RAZ/WI will be incorrectly reported as supported, but allowing them to
be used is harmless.

Testing on N1SDP shows the probed RES0 bits to be the same as the hard
coded ones. The FVP with SPEv1p4 shows only additional new RES0 bits,
i.e. no previously hard coded RES0 bits are missing.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h |  9 ---------
 drivers/perf/arm_spe_pmu.c      | 23 +++++++----------------
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index f1bb0d10c39a..e80207572786 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -350,15 +350,6 @@
 #define SYS_PAR_EL1_ATTR		GENMASK_ULL(63, 56)
 #define SYS_PAR_EL1_F0_RES0		(GENMASK_ULL(6, 1) | GENMASK_ULL(55, 52))
 
-/*** Statistical Profiling Extension ***/
-#define PMSEVFR_EL1_RES0_IMP	\
-	(GENMASK_ULL(47, 32) | GENMASK_ULL(23, 16) | GENMASK_ULL(11, 8) |\
-	 BIT_ULL(6) | BIT_ULL(4) | BIT_ULL(2) | BIT_ULL(0))
-#define PMSEVFR_EL1_RES0_V1P1	\
-	(PMSEVFR_EL1_RES0_IMP & ~(BIT_ULL(18) | BIT_ULL(17) | BIT_ULL(11)))
-#define PMSEVFR_EL1_RES0_V1P2	\
-	(PMSEVFR_EL1_RES0_V1P1 & ~BIT_ULL(6))
-
 /* Buffer error reporting */
 #define PMBSR_EL1_FAULT_FSC_SHIFT	PMBSR_EL1_MSS_SHIFT
 #define PMBSR_EL1_FAULT_FSC_MASK	PMBSR_EL1_MSS_MASK
diff --git a/drivers/perf/arm_spe_pmu.c b/drivers/perf/arm_spe_pmu.c
index 3efed8839a4e..051ec885318d 100644
--- a/drivers/perf/arm_spe_pmu.c
+++ b/drivers/perf/arm_spe_pmu.c
@@ -89,6 +89,7 @@ struct arm_spe_pmu {
 #define SPE_PMU_FEAT_DEV_PROBED			(1UL << 63)
 	u64					features;
 
+	u64					pmsevfr_res0;
 	u16					max_record_sz;
 	u16					align;
 	struct perf_output_handle __percpu	*handle;
@@ -693,20 +694,6 @@ static irqreturn_t arm_spe_pmu_irq_handler(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static u64 arm_spe_pmsevfr_res0(u16 pmsver)
-{
-	switch (pmsver) {
-	case ID_AA64DFR0_EL1_PMSVer_IMP:
-		return PMSEVFR_EL1_RES0_IMP;
-	case ID_AA64DFR0_EL1_PMSVer_V1P1:
-		return PMSEVFR_EL1_RES0_V1P1;
-	case ID_AA64DFR0_EL1_PMSVer_V1P2:
-	/* Return the highest version we support in default */
-	default:
-		return PMSEVFR_EL1_RES0_V1P2;
-	}
-}
-
 /* Perf callbacks */
 static int arm_spe_pmu_event_init(struct perf_event *event)
 {
@@ -722,10 +709,10 @@ static int arm_spe_pmu_event_init(struct perf_event *event)
 	    !cpumask_test_cpu(event->cpu, &spe_pmu->supported_cpus))
 		return -ENOENT;
 
-	if (arm_spe_event_to_pmsevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
+	if (arm_spe_event_to_pmsevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
-	if (arm_spe_event_to_pmsnevfr(event) & arm_spe_pmsevfr_res0(spe_pmu->pmsver))
+	if (arm_spe_event_to_pmsnevfr(event) & spe_pmu->pmsevfr_res0)
 		return -EOPNOTSUPP;
 
 	if (attr->exclude_idle)
@@ -1103,6 +1090,10 @@ static void __arm_spe_pmu_dev_probe(void *info)
 		spe_pmu->counter_sz = 16;
 	}
 
+	/* Write all 1s and then read back. Unsupported filter bits are RAZ/WI. */
+	write_sysreg_s(U64_MAX, SYS_PMSEVFR_EL1);
+	spe_pmu->pmsevfr_res0 = ~read_sysreg_s(SYS_PMSEVFR_EL1);
+
 	dev_info(dev,
 		 "probed SPEv1.%d for CPUs %*pbl [max_record_sz %u, align %u, features 0x%llx]\n",
 		 spe_pmu->pmsver - 1, cpumask_pr_args(&spe_pmu->supported_cpus),

-- 
2.34.1

