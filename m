Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3223C46F
	for <linux-doc@vger.kernel.org>; Sat, 17 Feb 2024 00:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708131550; cv=none; b=kZ67EcYmrDGBVvwIllW0ZT2o+rzIr81ON5lwxoG1LcL9P7jNiVb2paDX6Pa8NgGX4QMIX9G1jeXDj67CgOWSIfn2BAuNmlbQZ9QWBrcae2oRcs7Itf8UD79LGJM5/V/9Fm8DVDHALYKGTvmzNvupbk/RZ1QLthBbIE3l/pl6aJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708131550; c=relaxed/simple;
	bh=osmo9iVSqMNbUFvao8pXhJqFdDiZLR1ciOsr86k36JI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bwDgwrKlnigJ/gEwRkq51SGM4pQ+ZEL17LMaq3/yn1QQ0Y7Qs+3C7oJgqGIsVvmnuV31b+DIG9tYmx7v/X5gYvm321Zp6Hkvthoj93SzXF2gkmSTD+swC7NXTqFSa4b3bQ89Yasp0BeyZJPlW6RZznU/5QjmdkTpN5h0pmDmNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0ERtyIzF; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0ERtyIzF"
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bc332d3a8cso138022439f.2
        for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131546; x=1708736346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lkx6F3sDxrDVxzkfg/gwx98H53iZQ+xAtDorLNCTdGY=;
        b=0ERtyIzFowQI/dqyFP48mX8Em31tjyRQilNnwthZnKVNBW5mdFHRbsqs2A7Hy8NxLF
         PFhY/0fzaKLikY1tDpg24eiGYWHI37XE+BFuZQTFvNjw4BaCDjG1wKlZu0R8ljsHVWg8
         rXw2v092r5WtQ5iVP9F0yccNVhtDkIxef62dRmY7O7VfEL8ZnyzCb+KtfqqSqLEtEHsa
         X10ILu2ropeNaiOOyarjWBQqKiRsJsLvjGysWKeYLkf7qylVYvukl67+hO9jW6pRXbMo
         E1dLqmL6a8c8G+w1KVtIDWzH1BWNwmYtHNpjIJU8wxJoTnXjgfY3LWy+9ZEOp16ISWG0
         V1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131546; x=1708736346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lkx6F3sDxrDVxzkfg/gwx98H53iZQ+xAtDorLNCTdGY=;
        b=cAcHf+KO+9BcHhsBDZLVeMCEdOAAzwAWRcWHPeIDgfs+OjFekwWoRG4tGWmILI3w5k
         jmNLxyoGJ4FwAxA3ztdoF+L7cErjfUNYIod61GbeO3TfaNIyQ89r8Yv82MFHFjYBYaeu
         KG+DXc6uKO6M6lj2s5ISh96oOnwX5h75jnkMYilvkDevvdhc8wHfi66XIKBnZ0gHRWCo
         6hc7itDuAYH4GtymWTIgrtEml/G3CwGwQIwFtj1k/lufCf0p3d58lJUxQWztN5YUdSj8
         4wHWJxZ1SgmX1EHDJ/TLEt9QMst3ikTsArW93KwVUkFybK6nmauD9//ULinINN8mZ2Ap
         vbDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI+gH9vm/am9A2GJWNcUfMA87IKfc53X7lflHGMm2NI6vbea3QHDpLhIqpiG8lta6vitmT3H59A+EMaPHbIdHB5oNAeX73krYL
X-Gm-Message-State: AOJu0YzYLjTQb1ksNOo53gIDWyeDZ2Rgv9NOwqsBGdmSMbCixqQLd0i+
	omXwITt2kPupQUvG4XkAUSSWi+Pv4HgUHO+IiaCU2/ThGhHc/X4tgr1kepqRTpo=
X-Google-Smtp-Source: AGHT+IEe3ejDyxspMJxarQru2mpOZGVU3gTQalogFZ4IV/qmTtJpwp0XG9IR02+mun9kkUrwLV3/Rw==
X-Received: by 2002:a05:6602:2766:b0:7c4:9618:5fcb with SMTP id l6-20020a056602276600b007c496185fcbmr7195778ioe.8.1708131546705;
        Fri, 16 Feb 2024 16:59:06 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:59:06 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 20/20] tools/perf: Detect if platform supports counter delegation
Date: Fri, 16 Feb 2024 16:57:38 -0800
Message-Id: <20240217005738.3744121-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The perf tool currently remap the standard events to the encoding
specified by the platform in the json file. We need that only if
the counter delegation extension is present. Otherwise, SBI PMU
interface is used which defines the encoding for all standard
events.

The hwprobe mechanism can be used to detect the presence of these
extensions and remap the encoding space only in that case.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/arch/riscv/util/Build    |  1 +
 tools/perf/arch/riscv/util/evlist.c |  3 ++-
 tools/perf/arch/riscv/util/pmu.c    | 41 +++++++++++++++++++++++++++++
 tools/perf/arch/riscv/util/pmu.h    | 11 ++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/arch/riscv/util/pmu.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index b581fb3d8677..2358f0666e8d 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,6 +1,7 @@
 perf-y += perf_regs.o
 perf-y += header.o
 perf-y += evlist.o
+perf-y += pmu.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/evlist.c b/tools/perf/arch/riscv/util/evlist.c
index 9ad287c6f396..aa7eef7280ca 100644
--- a/tools/perf/arch/riscv/util/evlist.c
+++ b/tools/perf/arch/riscv/util/evlist.c
@@ -6,6 +6,7 @@
 #include "util/parse-events.h"
 #include "util/event.h"
 #include "evsel.h"
+#include "pmu.h"
 
 static int pmu_update_cpu_stdevents_callback(const struct pmu_event *pe,
 					     const struct pmu_events_table *table __maybe_unused,
@@ -41,7 +42,7 @@ int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_n
 							  "iTLB-load-misses"};
 	unsigned int i, len = sizeof(overriden_event_arr) / sizeof(char *);
 
-	if (!pmu)
+	if (!pmu || !perf_pmu_riscv_cdeleg_present())
 		return 0;
 
 	for (i = 0; i < len; i++) {
diff --git a/tools/perf/arch/riscv/util/pmu.c b/tools/perf/arch/riscv/util/pmu.c
new file mode 100644
index 000000000000..79f0974e27f8
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright Rivos Inc 2024
+ * Author(s): Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <string.h>
+#include <stdio.h>
+#include <asm/hwprobe.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "pmu.h"
+
+static bool counter_deleg_present;
+
+bool perf_pmu_riscv_cdeleg_present(void)
+{
+	return counter_deleg_present;
+}
+
+void perf_pmu__arch_init(struct perf_pmu *pmu __maybe_unused)
+{
+	struct riscv_hwprobe isa_ext;
+	int ret;
+
+	isa_ext.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+
+	ret = syscall(__NR_riscv_hwprobe, &isa_ext, 1, 0, NULL, 0);
+	if (ret)
+		return;
+
+	if (isa_ext.key < 0)
+		return;
+
+	if ((isa_ext.value & RISCV_HWPROBE_EXT_SSCSRIND) &&
+	    (isa_ext.value & RISCV_HWPROBE_EXT_SMCDELEG) &&
+	    (isa_ext.value & RISCV_HWPROBE_EXT_SSCCFG))
+		counter_deleg_present = true;
+}
diff --git a/tools/perf/arch/riscv/util/pmu.h b/tools/perf/arch/riscv/util/pmu.h
new file mode 100644
index 000000000000..21f33f7d323d
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __RISCV_UTIL_PMU_H
+#define __RISCV_UTIL_PMU_H
+
+#include "../../../util/pmu.h"
+
+
+bool perf_pmu_riscv_cdeleg_present(void);
+
+#endif
-- 
2.34.1

