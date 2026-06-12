Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228E13ACA5E
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 19:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292557; cv=none; b=O+VDzeM7SzCSdkTq6CasK9suxFBM8oGbZ5rGpQ4mS0aQb2TFIDUdj8dBOHXi83tg64+/Z8NL8i5Z1LlwD3/LMFgzo1ME6YFF3azGFA9nlJj9tgRZplAFnWkTgJ1m1WlJlDI0XDSL0+vj2T219DccD1B3ZPQAIUl4qTa3G6RgelA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292557; c=relaxed/simple;
	bh=y194xz2pw7UR4oVxuISv6WLw/M9JjuDpUxu6e6ZXbf0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qaBOBn1p/WXoRQpIirKVJunmGzpyK5QLjV0lKoSncCOWCNFBGGLLUAvi9tX1XNIOk4upms+HZfEVtrEIkhst2rI1zbXa/RVSj8wKhinmsem4X3l62FA+mznpAoMxlOWkx0pixmTHWUUhT3sT/DVUnxBQOwdLg0CnmhD7xaxAAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=at0OOUpz; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="at0OOUpz"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-486a24852ddso2047971b6e.1
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 12:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781292554; x=1781897354; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEOgMIo61tN5cbwnLn9iRecU9xGHnAGtn6LC63IksYY=;
        b=at0OOUpzxqo+WNrMVoZsCPDa707Xl6mqhh8Net9xYX4O4JXyM7EftJQotFkivGRz7P
         meJbayUduodbJC/Q0rkRwUN3zN8OMYCz/3aoqRVA46RN2lPzsszBi7+VQjJ/xinPOFEV
         vrDQK5MRfLUc++pV61kigGakyCe8IkcdY2MMbP1x+pTetJ9xrmjd5jfhbN5S4Bpqkw5V
         s55NFtlobZ6bq7IhSHSbQXAzIu4SmfDYJqatwFd0ua6fM0IRVIZx7MBr/BzyS5PxgJHg
         YrNOHrtOAf/ZnVLKd8tFutI9ljZwgQryEwarTD+NARtF1gGgZaBReuRS0BFcPoUZ6mOq
         hGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781292554; x=1781897354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aEOgMIo61tN5cbwnLn9iRecU9xGHnAGtn6LC63IksYY=;
        b=DYCidpBrWvcQFepJi7H8PCjMzhwyh/qX5UQxR0RvRRfgR1WYleAGv/Kq0f8/USjpOs
         bFOfOd6EhaIcG0ffarx1K3+z9UrNr9tWUw+MzM/B3w4ijBNwJvUkvvx6DQU6Kg9tRnbW
         FER4wo7X/BQMs8O9L2jut14am6uFY8egQQKndgfx9z03YsS9xAVQdiIkuRTbhccuFKu/
         2+59mxGdljabQpZ40JUzVHVeMsJi2FR4bSFhvDLwuWZxAF8v0i/j9gHEkZze7RS3rFht
         i/hifd+efU+vPAyforHsYQEE79yL8wjOaOzb2yMEXOa8MOkfqPSGIYQL+S082nChvVW+
         CAvA==
X-Forwarded-Encrypted: i=1; AFNElJ/8BI75FGmhTvKyem3p4IhHkkJXPD2sR7XknGtW7bTYAekRQ5wNqBJ7KCUEWgECSGu/oC/TOioUXD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0JicworEt/uc7DTvvlkUED63z0BP2qzPlh419n6tgX40EdU3B
	idT7+tKUmbEliAAcQUDJD6crxP45TfeeWykXh89rhDomAHPNoNxa6TNU2RkgkRq8e/Tig9aeJWp
	xjYijuaS6uQXMrbyTxHGkRS2XlA==
X-Received: from ilbeo3-n2.prod.google.com ([2002:a05:6e02:2903:20b0:502:1132:3da5])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6809:d2:20b0:487:4624:71c3 with SMTP id 5614622812f47-48746249e89mr25208b6e.5.1781292553983;
 Fri, 12 Jun 2026 12:29:13 -0700 (PDT)
Date: Fri, 12 Jun 2026 19:28:52 +0000
In-Reply-To: <20260612192909.1153907-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260612192909.1153907-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612192909.1153907-5-coltonlewis@google.com>
Subject: [PATCH 04/21] perf: arm_pmuv3: Generalize counter bitmasks
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

The OVSR bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 tools/include/perf/arm_pmuv3.h | 12 +++++++-----
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 8d3b832cd633a..1cceb1f614515 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -534,7 +534,7 @@ static void armv8pmu_pmcr_write(u64 val)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -770,7 +770,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a27..fd2a34b4a64d1 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -224,14 +224,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
-					ARMV8_PMU_OVSR_F)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
diff --git a/tools/include/perf/arm_pmuv3.h b/tools/include/perf/arm_pmuv3.h
index 1e397d55384ed..d045b0f3b93fe 100644
--- a/tools/include/perf/arm_pmuv3.h
+++ b/tools/include/perf/arm_pmuv3.h
@@ -226,12 +226,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
-- 
2.54.0.1136.gdb2ca164c4-goog

