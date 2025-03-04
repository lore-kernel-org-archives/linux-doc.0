Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15421FF601
	for <linux-doc@vger.kernel.org>; Tue,  4 Mar 2025 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741089620; cv=none; b=hAmqzElDRLcAOS6LHtE41g0jO5Hy5q0BJPtORTs8qgpvwB0Krm/tuWSidssiBeJVrClENA5aqCrxkjgP2oVWdyXAdQbXLiYSk4kz1W4xQ5kln2xm40x4hzykblXGo0cdto2dfWmOa4j8MlnArY70rBawtKDQ7zkYyyMTpyufiV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741089620; c=relaxed/simple;
	bh=0KlxLzFd1lxQd/8YpnPnCCibjWag2I74cCn43Ti2Suw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVnsarhc3s+3ZmtaEQay4rcbwcY1hr04KGf1pFHSBpwvp3zuKp6CoiIczXYEQIKe1njDFhNeeiqmygmrUlkFeBchb8fZJbFZ7Y8GQGy/jzyPq/GomlkYwfYM/QhmaRujIElkvvN/fvggYyGX2AM+ADeJ87jEuZAdXNuv6G+VZ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=eCMDZPz2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="eCMDZPz2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bcb1a9890so4688495e9.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Mar 2025 04:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089617; x=1741694417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=;
        b=eCMDZPz2p8uZ8EosEibvpmqnk/dp5MbBhBQXJgRy9JuzWuBAHYWoVGz6gwEBUSpJpA
         /JQ+eQ1jTRWLaXlyzS96p4nIhNESDzMMROxafvMlEVQka6g6IDdv+3E+Oqi7wUZOPTyr
         qOcpakguqLnOtd84xGvITidNlCRr/k7xuXusbLgt7HZGt5iQiL2vvNH84QwSBKpxZE8q
         g5hR2jdOULC7l8I2AUx5QSDOkA+xDxXY5udfqbQkJlU+/NSR+PGDsiwxb/JiohBx1+W9
         xknP4fJg+PfAdQrUKRLErpK7X8XhE4ZO9F++0I4KCdvpjUB/M7VT6zd7LkadXwdY2iAW
         WUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089617; x=1741694417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=;
        b=vcwsqrPRDj1adfqIc+JfVk7trrWF1irT9lboIh5u3cUHI0pO7ADnT3fduq3agAJCfc
         FyUkPYzHbvMz0bqKgzVZEWNE8dqjrb47g3uDueQjUokGdW2KCX/evwYhh7UPlWrgQ3IK
         7Th9WWG8tFrDYFrkpQo0XPaNGMfdyVis2FLsxw8lB7nKf3E+otiyvme4BZh4QSTQpim3
         Q0eqkXgr/lUB738GGEFBlhRJXAOst0bIoDb96t1/ziRVq4TI1QPpZZDVkk4h5yPEjFtg
         3/jIsCMEP1O2bXcvELAeywBLvVSOef9Jp7e4aEAVHKODuf0s/8CjADBFxgfKbASCNj0s
         UrkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx0+iqtBed/fQ/4NUytqePKoWk8GGRL6UwftobzqS236wgCnXGMyx+/5dJKeijJG0cdZMm8H4nOHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTI8yUkFOQFG25n5wkunXYBWop1wy7fn55lwcZQ8o5QpkQKc6x
	uK7sxWh6Y5CA8noNQx6CKT6icD96cWYX9fmYD41tjznQrppclgEpYGzmcIc1Rr9Qys2wHoxXjwJ
	2
X-Gm-Gg: ASbGnctm/6NRbpZcAVPt54QEBzRAPjcovtFpIDP+hHqQJZC/qcQ8TFMk2vOXtuBTDuv
	o37OqVhlTrsc5I2yY9w366O7X683pxlfrsBrruJLHAnpNoFWRNq7Z7Ur798w5arVI0awFxPzcT6
	hdUvF/kuSKe0K4RFLZB3G1ewFRWG4RkXpYOq6tshfboQmmzdqDShzjNDhymeMIuI+FA+RzGNV4i
	JXuMIMW64oqlJQQvLt/eQDthAZOCKkrD/sW8OW0GtB8wfgbIVza+zWAO4dM5MFinTYucA1pfjcl
	1eqcI3IoLjZGWvfv5qwR2el2qlc/wfzm
X-Google-Smtp-Source: AGHT+IHfvp/euog7c3Gu4POXjA8Lq4HBzrln9LMIjOKJFZe5dI3SCeWKlW6YsuSzufoq3FjOtkj5Fg==
X-Received: by 2002:a5d:59af:0:b0:388:c61d:4415 with SMTP id ffacd0b85a97d-3911560f325mr2216933f8f.18.1741089617020;
        Tue, 04 Mar 2025 04:00:17 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4844ac6sm17312025f8f.71.2025.03.04.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:16 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 1/8] riscv: Annotate unaligned access init functions
Date: Tue,  4 Mar 2025 13:00:16 +0100
Message-ID: <20250304120014.143628-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several functions used in unaligned access probing are only run at
init time. Annotate them appropriately.

Fixes: f413aae96cda ("riscv: Set unaligned access speed at compile time")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h        |  4 ++--
 arch/riscv/kernel/traps_misaligned.c       |  8 ++++----
 arch/riscv/kernel/unaligned_access_speed.c | 14 +++++++-------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 569140d6e639..19defdc2002d 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -63,7 +63,7 @@ void __init riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
-bool check_unaligned_access_emulated_all_cpus(void);
+bool __init check_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
@@ -76,7 +76,7 @@ static inline bool unaligned_ctl_available(void)
 }
 #endif
 
-bool check_vector_unaligned_access_emulated_all_cpus(void);
+bool __init check_vector_unaligned_access_emulated_all_cpus(void);
 #if defined(CONFIG_RISCV_VECTOR_MISALIGNED)
 void check_vector_unaligned_access_emulated(struct work_struct *work __always_unused);
 DECLARE_PER_CPU(long, vector_misaligned_access);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 7cc108aed74e..aacbd9d7196e 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -605,7 +605,7 @@ void check_vector_unaligned_access_emulated(struct work_struct *work __always_un
 	kernel_vector_end();
 }
 
-bool check_vector_unaligned_access_emulated_all_cpus(void)
+bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -625,7 +625,7 @@ bool check_vector_unaligned_access_emulated_all_cpus(void)
 	return true;
 }
 #else
-bool check_vector_unaligned_access_emulated_all_cpus(void)
+bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
@@ -659,7 +659,7 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	}
 }
 
-bool check_unaligned_access_emulated_all_cpus(void)
+bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	int cpu;
 
@@ -684,7 +684,7 @@ bool unaligned_ctl_available(void)
 	return unaligned_ctl;
 }
 #else
-bool check_unaligned_access_emulated_all_cpus(void)
+bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 91f189cf1611..b7a8ff7ba6df 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -121,7 +121,7 @@ static int check_unaligned_access(void *param)
 	return 0;
 }
 
-static void check_unaligned_access_nonboot_cpu(void *param)
+static void __init check_unaligned_access_nonboot_cpu(void *param)
 {
 	unsigned int cpu = smp_processor_id();
 	struct page **pages = param;
@@ -175,7 +175,7 @@ static void set_unaligned_access_static_branches(void)
 	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
 }
 
-static int lock_and_set_unaligned_access_static_branch(void)
+static int __init lock_and_set_unaligned_access_static_branch(void)
 {
 	cpus_read_lock();
 	set_unaligned_access_static_branches();
@@ -218,7 +218,7 @@ static int riscv_offline_cpu(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int check_unaligned_access_speed_all_cpus(void)
+static int __init check_unaligned_access_speed_all_cpus(void)
 {
 	unsigned int cpu;
 	unsigned int cpu_count = num_possible_cpus();
@@ -264,7 +264,7 @@ static int check_unaligned_access_speed_all_cpus(void)
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_UNALIGNED_ACCESS */
-static int check_unaligned_access_speed_all_cpus(void)
+static int __init check_unaligned_access_speed_all_cpus(void)
 {
 	return 0;
 }
@@ -379,7 +379,7 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
 
@@ -393,13 +393,13 @@ static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unuse
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	return 0;
 }
 #endif
 
-static int check_unaligned_access_all_cpus(void)
+static int __init check_unaligned_access_all_cpus(void)
 {
 	bool all_cpus_emulated, all_cpus_vec_unsupported;
 
-- 
2.48.1

