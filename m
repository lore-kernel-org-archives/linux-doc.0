Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD05248F4A
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750457930; cv=none; b=RFRwuudjHTMiRAPISHag6VlQmahqe/jRJI1+ogLZfGHIUiiky9W4GZNIBxI5PYNS+jkV+7s7GpwfkUT0iyXik+D5zgB9IksppBbyzdiV6ZQRWWh6wtn5hwOpCU6OZav+2NJNZC7rAR19T2kzxP7kM+pXFH6MvW53pgdBiPQ5LqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750457930; c=relaxed/simple;
	bh=V5QuFFtEFS1le6XC0EQ62amHSr4v2C/GQj21LgKvsUg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ApeWqCdg/PZz7Ie7g/v6neV555ilVACX1tovbn1VM1uTMwZrbSDSxbolVb6XOcTs1b5WOtrBRThcLsXTmMwDKhmZAB5phptAWYTGbWbsgFf9DBnSnm6DuWwLupHbNDrVnH5/M62gTC7zBwTdEz9RZTExlKyPPCkwIVT2epI8lok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wniEzoqL; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wniEzoqL"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddcf82bb53so19920285ab.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 15:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457925; x=1751062725; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8bfLeP3qqrBDCFJ2FU2DOZ6I9ab7gAt7xxGlDeoSjE=;
        b=wniEzoqLkzjVmhqPOdR35nwUfXJy9g54aG6iKAdadN7hJOMEJ/qdcHYByQYRURzZKd
         5WL2bFAl/6wceCPnoyyzXEzYtPZ05QLtOnS4CWPnZJAwTHrOxGdqNgxXMHA8UROnFlLL
         D0o4nJ9+VQXME1U17Y5T3Cqv9szlqpEy+jB6gR0Nz10LCvorLCm8E9gKstZ2jr7vpgtb
         cHqf+gO/Y792ks1jEy5dEQdjkiSie+SxyY3UsQTjh7Z2hUfC3TW/848vzPuBmo9uD4R5
         kWjyyxlcrWOIKynCMgTTt+nY4HlvIyxsDP19ACbBvkp4ICAogxyUACpWAgPxiOyJVmuF
         QRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457925; x=1751062725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8bfLeP3qqrBDCFJ2FU2DOZ6I9ab7gAt7xxGlDeoSjE=;
        b=SZw56N87rx5yN2v8EciqDohDI0F67e7aqbcjL9EybOKFM/VRCY95c4sHga4I4E48Z5
         2GO2Q52XJy1P5tymRE5tbY9w39XU4R/q2KUvRsyao2xuj45YLs2qMIcmOjejWdYIDHSn
         KKPOCTxEEQ1C04n5L2fAItONN01PQ5jKdEw0yOjlbctHJK6TnkUjCR21ATWb4xCPHS6M
         sRuBzzrjHOn4d0IzJNqe3XgBqGlK3nNqRorcv2TkNuVUd/VxuM1bnLIXWcjyZ+qIEtGL
         Ibe0lWYkWRFrnYGRbdaY3re/7RjPNPg+98Bi8/uFpXsCHESzhfusyh8B14DQzd4b98y2
         w/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAF9AizVoXXxwRT7mwKZZFabEWcW/F88nmJf2qI+3i55xWqkzz/5fRWRquWr5jEyoLmC6IWTWyGwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTbV9AaHCE9eGNAefKdyasX87GFiGt8VUuHJpCBwwHSeXpdcPv
	5/wIytxCU+SuhG3IVbN3wsr5eLDLjLo/LpdUj+dBWW4jx3zwJ19eFIZIHV/ZMcnS0Gu6UB89uw+
	1HRwJWvAK7hjDMx2Amy1Gzz4qOg==
X-Google-Smtp-Source: AGHT+IFNu9JHRQIB7XTy2Ob9SNBqkVdGcONXmzfrAwfGHzD/c/g9AEFFIMXAac8kpjhLkSQL3RhwV1XbrB993VdGhQ==
X-Received: from ilbeb7.prod.google.com ([2002:a05:6e02:4607:b0:3dd:f56e:32fc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1b07:b0:3dd:f745:1c1a with SMTP id e9e14a558f8ab-3de38c1572dmr55614125ab.4.1750457925391;
 Fri, 20 Jun 2025 15:18:45 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:09 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-10-coltonlewis@google.com>
Subject: [PATCH v2 08/23] perf: arm_pmuv3: Generalize counter bitmasks
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

The OVSR bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 26230cd4175c..e47f5953928a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -518,7 +518,7 @@ static u64 armv8pmu_pmcr_n_read(void)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -754,7 +754,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..fd2a34b4a64d 100644
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
-- 
2.50.0.714.g196bf9f422-goog

