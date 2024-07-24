Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBC116C68C
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846189; cv=none; b=EjxpRhN4kn3dDB0JrFH19lgQzE+MPpJ7U55IfUueXGKGDm+y8y4rk3mWx3UCiBCyLOzYORyCT7XheYWOCv6MOsKbC4xdIKHWFoeQkL5URmqqFWC4GRao1QIqjvA0Y59Zk6nbhB4c1PDTXT3AZtMrlVn7aXL7jGB9U4iLVCZtEDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846189; c=relaxed/simple;
	bh=BTGuRnJBK3Oigxg1jdb0UP186IwJIzg9BxFmK5k9rss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3JYKmC80CIxqBHXYiqqgKSOQLWu+O0uuOIbkCGBbtXCK8iYUcb6gJA2w784+ys7bLR9OniKSG6PvwaxuQFFiE7MNH8xltalwAOkPwcZ7c6BexMQEG2PTw5YzMrBSbBsGc6QEXbv8b2S4ucxcxWndaIqkIV1yK86DU4ECmuCLQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=houDJxLZ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="houDJxLZ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cd34c8c588so127987a91.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846188; x=1722450988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYP7xs8KQ8UlOorfc/c0GIJsDnh+9Fq8OTNkNhrnP8w=;
        b=houDJxLZzrSAC2a4tmWgBRQTNdfmOd5LSHNqhJcETW5tfbRush8YTN+qFvRR0tmyDo
         KSka3YTZcznrqs/Czm8Yt45dPocDplJxFkQeO59h/GBI5TfBKYU6dV7HHp3HG57KGuQC
         WMIznCeMGbhaplcgFwvkc0JNsMuMfYF2EWq4T0hB5RxSMDE9pLN45o8ns0Q0/e7gPL7X
         hoPBu96I2DWY2171FZNZKOAhvDah/aEOj9NaTJOF2KCeEMz1pr3gCZ+H85Q1PW+5rJb3
         F8M0zaxxgnlFOwEBRmXu5jA47g69bEHUBcj1D15csSV9QoQQC9hGBNpSpNBdUGn7Vcri
         FEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846188; x=1722450988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mYP7xs8KQ8UlOorfc/c0GIJsDnh+9Fq8OTNkNhrnP8w=;
        b=daP/f+VkQCHrxt2nkZxQyyKMRkR6YrRAQ+Aiq/CjIPLHr5FaB0zBNVA5NLAA6NMeL6
         cHFOBAP4hWvX9+eZW43WofoaC4oG+N3naq5EG7CeEmQKFrb22OoR0GkAZOX5DFHrSkM/
         f0prCUuNHM4GdlFn9DQNlPQNGPpfdvoteduExyHZ4Y9v64F8pssS9BXZJoN/9EOdwXbh
         hSpdZXdLol0Fmv82PDJ+ayX3gPaB5d8W/I5ZHhde132u+rpLrBJ/5M8/5jXaUAuudVA6
         qyT0tQJq2SPqVePfebEcfGJZ9kLW5JGs6U9PWCFRWAnnSMRmW9IGfpPhnGZTwW0EgI1K
         BdWA==
X-Forwarded-Encrypted: i=1; AJvYcCWw7yVYM4YJt1o7JtYnX43uazK1WticzodrAteTwa+UzMVH3z5duMgWCyzSRabDdDG+HZZHovcAU8SvDQm0eI0HKBa7fZqNEWSt
X-Gm-Message-State: AOJu0YxweChKvN+6Q8jQD6wIfY6UIyOXypF73QemMRwqZMPk8Wwu4I6w
	AB3WcRdNTGldlE4lhR5nKX0YqYb/HPBClFDXTm3JVAM8s4t1eRpTzTiBDt47gC8=
X-Google-Smtp-Source: AGHT+IFvJVIwefWPwY3LJ2hABodFiikz+9p5bBm+mCKKnjhELb3r4ifGsWvkDb/N6P75mqebfr/kVg==
X-Received: by 2002:a17:90b:4b0d:b0:2cb:1563:ccd1 with SMTP id 98e67ed59e1d1-2cf23a0308dmr400986a91.38.1721846187719;
        Wed, 24 Jul 2024 11:36:27 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:27 -0700 (PDT)
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
Subject: [PATCH v6 3/8] RISC-V: Check scalar unaligned access on all CPUs
Date: Wed, 24 Jul 2024 14:36:00 -0400
Message-ID: <20240724183605.4038597-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724183605.4038597-1-jesse@rivosinc.com>
References: <20240724183605.4038597-1-jesse@rivosinc.com>
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
---
 arch/riscv/include/asm/cpufeature.h  |  2 ++
 arch/riscv/kernel/traps_misaligned.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 347805446151..3b24342c7d2a 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -8,6 +8,7 @@
 
 #include <linux/bitmap.h>
 #include <linux/jump_label.h>
+#include <linux/workqueue.h>
 #include <asm/hwcap.h>
 #include <asm/alternative-macros.h>
 #include <asm/errno.h>
@@ -35,6 +36,7 @@ void riscv_user_isa_enable(void);
 
 #if defined(CONFIG_RISCV_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
+void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
 bool unaligned_ctl_available(void);
 DECLARE_PER_CPU(long, misaligned_access_speed);
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index b62d5a2f4541..bb09357778c5 100644
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
 
 	*mas_ptr = RISCV_HWPROBE_MISALIGNED_UNKNOWN;
 
@@ -538,19 +538,16 @@ static bool check_unaligned_access_emulated(int cpu)
 		"       "REG_L" %[tmp], 1(%[ptr])\n"
 		: [tmp] "=r" (tmp_val) : [ptr] "r" (&tmp_var) : "memory");
 
-	misaligned_emu_detected = (*mas_ptr == RISCV_HWPROBE_MISALIGNED_EMULATED);
 	/*
 	 * If unaligned_ctl is already set, this means that we detected that all
 	 * CPUS uses emulated misaligned access at boot time. If that changed
 	 * when hotplugging the new cpu, this is something we don't handle.
 	 */
-	if (unlikely(unaligned_ctl && !misaligned_emu_detected)) {
+	if (unlikely(unaligned_ctl && (*mas_ptr != RISCV_HWPROBE_MISALIGNED_EMULATED))) {
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
+		    != RISCV_HWPROBE_MISALIGNED_EMULATED)
 			return false;
 
 	unaligned_ctl = true;
-- 
2.45.2

