Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A2F24A060
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892686; cv=none; b=a7MIknwqWIHVOB0nNpjsyFaHqkmZO9W5Hfkf6kR000Nj6IFMsRTZDjg9v3XTukd1gLqe9SVIxB311yJXGr5+nUkAnZtBPpmt8RyqhBHW4q4z5t8Ks9xmAazlUXzOvpAPSXS2lSWLA/tlszQU8M6agPiBX4ZGloJT+1kHumFcWjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892686; c=relaxed/simple;
	bh=rbdsRD0AuDfdqVGoo+Md0aUA1Wflf8NIwMFM/Sb6wIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtKaNtsw+a94/m1DGXs3JRwnT++mrJU4sdN4C6xfFJEG2dsFbmHc50Ectd35a6vYcqMhpVs81X6AY5D4uKodh/1utW/o9f01kHWVFTHG+Db1Xp5bOxnhCz3UdrB+CfJHx5xgSj9g+mJ2PSFRIF8aqgCBJ1tUuIP0kZ0wtsj7ZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=XAbYuEv6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="XAbYuEv6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b433so7452775ad.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892684; x=1745497484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZffLnUvyDxY5lnr7nm4ZxhnqMm5pHoMLqJFCY6yvcnE=;
        b=XAbYuEv6VwYQ4ypK/XHXKi+ezIXrA5F/9jh+DBA5vjpeP7eUKLO7jmNLUMC/Tnqe6H
         XZUnXfCGY8QdDAYBkxL2Ir0msIfRcmgj4ZKqXi9o8jUucH2sHBP6PRleVVMKXEsqvFGJ
         3wZLYwjpPGQ7LTxKbOp+MEnXXmeje/aiydcoxyXQ34Xmu9IL7h2hdW274QbjGIAUI9uM
         70zKbaTYbqueWlORefbNKdmuOBAKCCJFLeqYIPRbtQYCs/JZWwBntf4mD52Y5FhCwpgu
         PwdPmi2mzG/qrSINDh9rQPor8mzNo4/+dd+tFECPuBRoneapMbddCmVHZhx6g0yClGyP
         ynLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892684; x=1745497484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZffLnUvyDxY5lnr7nm4ZxhnqMm5pHoMLqJFCY6yvcnE=;
        b=DURSTLmCuDxTKpenxXZEKQZnMR6Uzg+qj8PILNHjtT7DoDJ2k2xXuuW3v/kdvRkG8I
         ny6FR8grtuyQmL1yRrp7ImpJBTwdmWvpK+e4MZTeAs4zb2MuBhZ/KVw78b3K1svwPPvt
         UdH9nGQ134SrESDoOaRsAN1m6UM1gxIb80QsmHTVwrInAgb1ZXL8j/0BK4RaEpXrkGEl
         +SDFsi5fyWaCkZD8GWxUa0+ZynKIY7lT8hFyOAi6xn3Rz3NgA5osKpWcQJ+CdxmvWQaP
         xTJi2AVHg+cQrZ4t/NOaHPEKKnbRr7TQNaD+IOYVP18oIoVwxKBYy8Y9P/1cArllHsW1
         1itw==
X-Forwarded-Encrypted: i=1; AJvYcCXL0r7hGYHiSDBTIJ+Xx+CZJd1mRY5JrHSq8mVwUN0hBlYCAef2CId1D4KCddX2XWoV9qy5v5IsviI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK1WMmhgnIyIhjlt9Pg2uRom+IOOCRXxX4MhwP6qZ5RXUAjH1A
	LRq6QfdtX+OZnM1pu7o95lCkS2ZfSmzw2XfRvOKqN4D5ociwribSu8e6mRW8ykc=
X-Gm-Gg: ASbGncuyQQibhbiijJEJDwxa4OWX8opyj8GZhOi3Z1AooAoEguhr5TvHG1dwa5oE4OL
	16WIlrgSf9HSWfXiAwFf6LpLX0nt/IHHJAj1FVMh9TIQBHcreQ3ywVYk7lAN0EFTm/Q0kBZ5NEY
	vopD5GWvjEqmZR0sSqFAZ2ShkD5wVo2ui01mSIDXNwhJZd3ljpB7qoNlmj80wZ26asIM2Vrs1aX
	CkCxgJKi3ZgElCXzRqFZwCiTAnYMXBuFU9HJ5yTrE+7BOFLE/MNyAN/rAOQw/MWOxW01C2AvEqW
	YnX4acb/S9od0hpx6pUr5GgkAEjrTKK+1yDuvuEQGg==
X-Google-Smtp-Source: AGHT+IGh/BYwkefJ9AAON/g15uIjE6Ad6rojhY99Eh6G81EOlK8D2lFOXm78WPt4vUtVQfXYtoHamQ==
X-Received: by 2002:a17:903:2f83:b0:21f:2a2:3c8b with SMTP id d9443c01a7336-22c358c5d8fmr81179515ad.11.1744892683747;
        Thu, 17 Apr 2025 05:24:43 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:24:43 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 05/13] riscv: misaligned: request misaligned exception from SBI
Date: Thu, 17 Apr 2025 14:19:52 +0200
Message-ID: <20250417122337.547969-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the kernel can handle misaligned accesses in S-mode, request
misaligned access exception delegation from SBI. This uses the FWFT SBI
extension defined in SBI version 3.0.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/cpufeature.h        |  3 +-
 arch/riscv/kernel/traps_misaligned.c       | 71 +++++++++++++++++++++-
 arch/riscv/kernel/unaligned_access_speed.c |  8 ++-
 3 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index f56b409361fb..dbe5970d4fe6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -67,8 +67,9 @@ void __init riscv_user_isa_enable(void);
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
 bool __init check_unaligned_access_emulated_all_cpus(void);
+void unaligned_access_init(void);
+int cpu_online_unaligned_access_init(unsigned int cpu);
 #if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
-void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 97c674d7d34f..058a69c30181 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -16,6 +16,7 @@
 #include <asm/entry-common.h>
 #include <asm/hwprobe.h>
 #include <asm/cpufeature.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #define INSN_MATCH_LB			0x3
@@ -629,7 +630,7 @@ bool __init check_vector_unaligned_access_emulated_all_cpus(void)
 
 static bool unaligned_ctl __read_mostly;
 
-void check_unaligned_access_emulated(struct work_struct *work __always_unused)
+static void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
 	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
@@ -640,6 +641,13 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	__asm__ __volatile__ (
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
+}
+
+static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
+{
+	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
+
+	check_unaligned_access_emulated(NULL);
 
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
@@ -648,9 +656,10 @@ void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 	 */
 	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
-		while (true)
-			cpu_relax();
+		return -EINVAL;
 	}
+
+	return 0;
 }
 
 bool __init check_unaligned_access_emulated_all_cpus(void)
@@ -682,4 +691,60 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 {
 	return false;
 }
+static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
+{
+	return 0;
+}
+#endif
+
+#ifdef CONFIG_RISCV_SBI
+
+static bool misaligned_traps_delegated;
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu)
+{
+	if (sbi_fwft_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0) &&
+	    misaligned_traps_delegated) {
+		pr_crit("Misaligned trap delegation non homogeneous (expected delegated)");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+void unaligned_access_init(void)
+{
+	int ret;
+
+	ret = sbi_fwft_local_set(SBI_FWFT_MISALIGNED_EXC_DELEG, 1, 0);
+	if (ret)
+		return;
+
+	misaligned_traps_delegated = true;
+	pr_info("SBI misaligned access exception delegation ok\n");
+	/*
+	 * Note that we don't have to take any specific action here, if
+	 * the delegation is successful, then
+	 * check_unaligned_access_emulated() will verify that indeed the
+	 * platform traps on misaligned accesses.
+	 */
+}
+#else
+void unaligned_access_init(void) {}
+
+static int cpu_online_sbi_unaligned_setup(unsigned int cpu __always_unused)
+{
+	return 0;
+}
 #endif
+
+int cpu_online_unaligned_access_init(unsigned int cpu)
+{
+	int ret;
+
+	ret = cpu_online_sbi_unaligned_setup(cpu);
+	if (ret)
+		return ret;
+
+	return cpu_online_check_unaligned_access_emulated(cpu);
+}
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 585d2dcf2dab..a64d51a8da47 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -236,6 +236,11 @@ arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
 static int riscv_online_cpu(unsigned int cpu)
 {
+	int ret = cpu_online_unaligned_access_init(cpu);
+
+	if (ret)
+		return ret;
+
 	/* We are already set since the last check */
 	if (per_cpu(misaligned_access_speed, cpu) != RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN) {
 		goto exit;
@@ -248,7 +253,6 @@ static int riscv_online_cpu(unsigned int cpu)
 	{
 		static struct page *buf;
 
-		check_unaligned_access_emulated(NULL);
 		buf = alloc_pages(GFP_KERNEL, MISALIGNED_BUFFER_ORDER);
 		if (!buf) {
 			pr_warn("Allocation failure, not measuring misaligned performance\n");
@@ -439,6 +443,8 @@ static int __init check_unaligned_access_all_cpus(void)
 {
 	int cpu;
 
+	unaligned_access_init();
+
 	if (unaligned_scalar_speed_param == RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN &&
 	    !check_unaligned_access_emulated_all_cpus()) {
 		check_unaligned_access_speed_all_cpus();
-- 
2.49.0

