Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFC3193097
	for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2024 15:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724167477; cv=none; b=GX/HQ9vTfh/LH90Gsx8YwlNFIWnGo2FZ8CvY2gn1v3cdJfU6CKYsq7ZQLT8iRQIe1VYdS/W/EFrIOjL/4cI+X6oAwE3VUy2cK7qRSu8YlyqPZEyWFI4uu8ZbG34kJGkghx5eUEeU8boahhkl1F5aJYcCvvFSkcrcmL0swtFad5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724167477; c=relaxed/simple;
	bh=eAta5sI3YfIDzmAhM8a/NQDHd/CVyWeV0xGX51ip71g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIlN9/VubGqxTPjkEGJb6Io53Pqp1GwaqvwONfd/OekQCcNUuLYE6ODG3q5skqIDH+5mBnQQFWSo+wgOZQzXhnWYcyVJHm/R7Ofj33VX+KI8OcL3ZJcPyeAXzmC8NGy+OQUzLqMRWfK4YEOE6P/+YrbCBQBEyIaUO4iVbGflfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=mGAWdLob; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="mGAWdLob"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20219a0fe4dso28504925ad.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Aug 2024 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724167474; x=1724772274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2IZDhIIluWTl5Gv1nsT36X2FhV2tW66iYvT1Y/MHGQ=;
        b=mGAWdLobiuhgaHQiUapDOER8VtN3lI9TkOXra0Q9oexhHnVwfiA87zxGxmvJCFF0Uh
         9Xny3IwChkRBgCcOOHISaRo4OfuvL/+a681J3z8fJ6VpSBFEDZ1tqP6z6XGr8qAvElKi
         Arco2bPKZP4C/Y5v+AulOBYFRxvTqRyy+x34PQ0Z6m74/yau2kfRbSqdnMN74FcaLthr
         O32UpYPngqTvi0x9KusLoGQLH54BzxCoputUXwrEAKVTmQO+M/PuhBZ5zZ/cDknaEfQl
         Vb/5sCenjEPAXza09+VLw+IRgeAr4gDeeWqRPC7GFHz7WAdBxA+LdKcI4Zc5dT7NwrRN
         TPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724167474; x=1724772274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2IZDhIIluWTl5Gv1nsT36X2FhV2tW66iYvT1Y/MHGQ=;
        b=e153gzXw84SBteN+5JTaxZ7YWsDyOhSGNBFbLhBeI2Yhnid4etiJq+vkBIVWZ3PQhJ
         rUgmvEJQk1l/Uje5SJsmzTEffUCWyuLvHB6q/r7TMSehX8lSmtj/dVQ9MkYbyXlpkPtc
         pCprJSlbsSRNHeL/fuFvt92Ug23cvf94gondBjFx+uGfauLJWJ2DegkHlU2m5W8FVUxr
         5VGRHzrUSSQQSk+b55uGrzSgtXXY3eeSYI3DZnpcadm8VWHa863lOsqWfWKUYAI8qtIa
         OvPLYqrnOgGsTu3f8zrH3SS+L9rLlpBCue0crkXzare7jdBrTSbE4DUWeZZupBfaWjwH
         j4nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLR9yT25VEBp3bQPkbZL+VJgL8vtDJqSD6Sj7fO2hlE6ySbJ0Nm4pp6H8SRl3inJpVIb4jhgeYdknLowX4nvR3sHQZ3R7KXF2z
X-Gm-Message-State: AOJu0Yziti3T4YoRTMrbHeVll47NUxVwHGy0VqBZMOZ/ny9GFXeMImk1
	YixM+Pq9Utc3zxNM0//I0M5xjJAn0c9fDyphm9dNieNRUXdJw2ECDRfHe2cLC3Q=
X-Google-Smtp-Source: AGHT+IFsrRGrirP49Nv3Fw0WBLsW834HqqZUUD2gt3If73tNPml67l6zbySpa0AxpE2qC16p0ViYLg==
X-Received: by 2002:a17:90a:b108:b0:2c9:90f5:cfca with SMTP id 98e67ed59e1d1-2d5c0ef60e9mr2639905a91.42.1724167474424;
        Tue, 20 Aug 2024 08:24:34 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d40bea7cb3sm7258157a91.25.2024.08.20.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 08:24:34 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v9 1/6] RISC-V: Check scalar unaligned access on all CPUs
Date: Tue, 20 Aug 2024 11:24:19 -0400
Message-ID: <20240820152424.1973078-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240820152424.1973078-1-jesse@rivosinc.com>
References: <20240820152424.1973078-1-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Originally, the check_unaligned_access_emulated_all_cpus function
only checked the boot hart. This fixes the function to check all
harts.

Fixes: 71c54b3d169d ("riscv: report misaligned accesses emulation to hwprobe")
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Cc: stable@vger.kernel.org
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Split patch
V3 -> V4:
 - Re-add check for a system where a heterogeneous
    CPU is hotplugged into a previously homogenous
    system.
V4 -> V5:
 - Change work_struct *unused to work_struct *work __always_unused
V5 -> V6:
 - Change check_unaligned_access_emulated to extern
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
V8 -> V9:
 - No changes
---
 arch/riscv/include/asm/cpufeature.h  |  2 ++
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 45f9c1171a48..dfa5cdddd367 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/jump_label.h>
+#include <linux/workqueue.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/errno.h>
@@ -60,6 +61,7 @@ void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
+void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 192cd5603e95..1ad981b2c7a3 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -526,11 +526,11 @@ int handle_misaligned_store(struct pt_regs *regs)
 	return 0;
 }
 
-static bool check_unaligned_access_emulated(int cpu)
+void check_unaligned_access_emulated(struct work_struct *work __always_unused)
 {
+	int cpu = smp_processor_id();
 	long *mas_ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
 	unsigned long tmp_var, tmp_val;
-	bool misaligned_emu_detected;
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_SCALAR_UNKNOWN;
 
@@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
 	 * when hotplugging the new cpu, this is something we don't handle.
 	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
+	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED))) {
 		pr_crit("CPU misaligned accesses non homogeneous (expected all emulated)\n");
 		while (true)
 			cpu_relax();
 	}
-
-	return misaligned_emu_detected;
 }
 
 bool check_unaligned_access_emulated_all_cpus(void)
@@ -562,8 +559,11 @@ bool check_unaligned_access_emulated_all_cpus(void)
 	 * accesses emulated since tasks requesting such control can run on any
 	 * CPU.
 	 */
+	schedule_on_each_cpu(check_unaligned_access_emulated);
+
 	for_each_online_cpu(cpu)
-		if (!check_unaligned_access_emulated(cpu))
+		if (per_cpu(misaligned_access_speed, cpu)
+		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
-- 
2.45.2

