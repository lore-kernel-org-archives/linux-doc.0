Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49FA2101A1
	for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740149846; cv=none; b=f4FzlUctvgUaIa5LhgFNvu4o8erzmTNbPlGtUhJLKSg8ZynB0rx9/bxPGHxA5wkFcNZ+WguErSK8eG7dFK0yxYvy1fT7VcGjX6LGuqBIVs1rQA+oMA6lLuxuPS9oyYBXWDoFb9Q+gKyBdgnPioEm4V6H8QKMmILpJbfqiaoyN9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740149846; c=relaxed/simple;
	bh=0KlxLzFd1lxQd/8YpnPnCCibjWag2I74cCn43Ti2Suw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxi0A8amXLZJ4lYhUrc3QQoZGX1Y5DYhEYnAGyIfElVvxOvnbMMAVm0v9j4Uj+C5kYPi4+vJFuM8b179ki2bdB3dWPcFmtYOgTRVqvDOxfnjsHs4yhSNyFQn4JMBPowjb/lepnW09Y64nSHADyi6hZVypN0s3xysx4inLam+vlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=BPfVNqF4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="BPfVNqF4"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f73e6ed7fso315141f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2025 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740149841; x=1740754641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=;
        b=BPfVNqF4Rfrgqh5NKpdDIGBmuAxXoP5qXp9EOZw6fE4JTFdOtcciPrDN6ei1jPUUHr
         JKqnRK6AaS249SktYwWo7tcIZVYc+N+GfMmQ/XCj6FF6NioRBWG7OkBIY3dTBfg908oO
         EyS4+B/3ns5kyOEBIBiZcsT3INAaeVcqDWvnK8PxzNXe0jD+aJLJVaD9iWOd+qgU9wt/
         QoecrBYiWrgG3kynubQgVbvyBoTyTsGt6qBEJ7jmCVoDjxRkmgdNiynm6itSLixRLoqD
         sbFOBvmf19J3oK1NTPKM86LZ7UBCBmZNotXaBh0u8X/y/pknPJutd+mtvV1cvKD12it4
         o/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740149841; x=1740754641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsOXXT+GJOZQxfHaJbyOnCfiUI8BUwrK26GnKW4Oj7U=;
        b=exU1XFSnE4I69H9GVBVpWW/Cj7la8fkN0+kCtvs56E31tzrM8rwwEfbNY2eey4hHn7
         5NJC6abhvXd8g+ht72Vg3xnLdulpEigekLlTS/7YmlhAEzEf4UhS1QrpHf1K+7Y6vbJ5
         7hNavEXVs43fnZ0Hl7L34OYImZAB0zPBMXGq+X3v47KtYztgJh3EiyfdhQpYpibbk0/v
         8u1NkxIYyp+eg2lmvE53Lz/TYSlTuNvCfrkAuwa5Whod0vRaV/q4ES5qMhHwZCcYjPKQ
         8OBhs/ketlQeSHSztfEinjfJI2vwIG26s7FVsNNZNjC0a4GwX8cJiRn4bhtuPGEyZv/U
         84DA==
X-Forwarded-Encrypted: i=1; AJvYcCXGEtI/hBKqzF4Z9BAQYik/CjReWS5yAzotT6VsvT6+3t8DECKgzsWg3/TtHvQcSROKSiUz7SLzj7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzEf3+vVQbDCLHkgDc14h0Y3im52/L6GOzRxtTjlRI/b9uVPp
	xEWM0puXdkZarT454rN1GOojruqhf8eGmNoImiyfd4uXIVpknyc0xPtOxYsPYtNFmYpajse72NA
	W
X-Gm-Gg: ASbGncv91Jf0gJf2ZVKx7eWo/dONmGYbls7lOU52xUrd1CZ0qA9Db2Gho3YLaLUG9k+
	ZTuAgweXXjDVX7tZmDvTD/yvZqPtvnf9AgkYSSjkD9CpQFl8LvN0wKihINJRm3SNLJWouaAlveM
	rh3q9b6GyUHld8faivRnP3I8iFw3CBRoxdjOsIucMvVCol9M0Z/8ayeEvyW9e86Fj3j4PjMLcjh
	Ig2s5WZwHaX044urwaM1ftPA6y3tzyfSoakmtqmBIznZ1LMu5XCl7YfbRo9V4SU2Jnx0sf9iykh
	+thqXUP9l6mDdA==
X-Google-Smtp-Source: AGHT+IEUliwq1ZDyhNRp6iD5CU1s2Dr/5eTi3CQW3MEFV44buTgl2XlBAKDpdOkuwjiNC2NjVPRKIA==
X-Received: by 2002:a5d:584f:0:b0:38f:1e87:cc6e with SMTP id ffacd0b85a97d-38f6e74f270mr3231891f8f.9.1740149840969;
        Fri, 21 Feb 2025 06:57:20 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f74817cbdsm1344912f8f.68.2025.02.21.06.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:57:20 -0800 (PST)
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
Subject: [PATCH v2 1/8] riscv: Annotate unaligned access init functions
Date: Fri, 21 Feb 2025 15:57:20 +0100
Message-ID: <20250221145718.115076-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221145718.115076-10-ajones@ventanamicro.com>
References: <20250221145718.115076-10-ajones@ventanamicro.com>
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

