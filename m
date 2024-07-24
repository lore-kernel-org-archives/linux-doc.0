Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D38116EBF4
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846198; cv=none; b=dcCPh9TKy4Pawe2yJ+wtu710mUSLG7tGAak1HZllxWTOta8vXTeGq10Q0k3KnPqE2v55O0JEQFd3RKzuOyOfg6grdGYx24HZme6vzWNjMDwP8dJ6as8bhZgsH4ewtIpO7inTR4juFPjwY3DUKrrCF24Qz1Ul5Ry8IYy1cV6selo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846198; c=relaxed/simple;
	bh=8wWeNjD80bzoJN1KNJLELvYWGlP7cAiox8PNDTItUVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UQJR33r55+mY+PA/5XKkb8xlzO9p5DXtuzwhRsExB6tdbYj8ZvS9cozkQe28ilnY74PAYudEPCJVKEMV6yvOb4cHkXbDqXyAFsd0MqWfjMfYhYznCRlvE6EbH+nqWjFdyZPhAz+kvYegY4uHB1bUYd0W2hXkIRyuxngH0RYl0AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QAPll1cQ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QAPll1cQ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cb5e0b020eso108833a91.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846196; x=1722450996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bIT/SyjOrwwhUE168bGd+cO99xR1CvX1jCiic1zUyk=;
        b=QAPll1cQg0N6g3dHFVOT3ul1gvBqPqDlDp/uEP4NNMM0EgIjqDdgOAMzcXBsCCGGRD
         CN6z3sDAt5fxBa7kAk3fCaRrZdFSe4UCgn//pghv89xQpmnY026sxzgj/Ldet0by8re+
         WcXV73nevXMhBat/MCo6uw7/dkhREiMKeUJ+iV+h7LecgKWhLJLXr+kFCAbqSvj5p9M/
         7TNtSwR3MkOsb9HrVCzQb1EOrS9c+eRLRl23k7+ruUzyZ8o3ELKoRPpLagBATIqSSZ5D
         EY4MefWbAvOB6lfD9s1PPlfT/nHATi+KoUoesCQXlXC+76oPZCOAtavUzxk0cis6XdTg
         RBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846196; x=1722450996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bIT/SyjOrwwhUE168bGd+cO99xR1CvX1jCiic1zUyk=;
        b=DVP1j3I6hAiiImoDUMJnh4+8ExmQH7MwgSxBIvvPjLaBsfeAnTLzNJvdG4yL99NIjA
         AfkJ4otDyUbBFNfFnhOcIgVu4r3zX9yJ45ngJ/tlabYsFVrdI4TAOer14Qi8QN7pDT/L
         k8V2wATRMTJ8JgQguDTmbZexxk1kJSKeb7CKyCQipKpKWbtOdg1DIaZWAIWcBnC/SNq6
         OZNWJxiLGUZdp4GfpdOzlq59/SAVnzpQrAzqddrNYWhMaLCPpbZ46VhQKk5Y2YC9fbyo
         Cf5Nj+v4vkE8sK7u5psEbHjwDGSWl+MnNvQxpugWeEmcoUAlULR/czZtdkGbCMID1g3y
         rY/w==
X-Forwarded-Encrypted: i=1; AJvYcCW3AbWDdzMf00Pssk+M0kgFv2LIhUd4bnedPxuBE6XI7rf0PqRl7sFQY3VDMKxO9b7som0xZ3oWXXcNbYEtL/VYNXWaYxTAp5rS
X-Gm-Message-State: AOJu0YyNfhNY2aqsRhuln4bbXPNcG21Io3UggaoQYasi9sIsjjSbNXEC
	hlbzxd9WjjGpuMnOymBiQifCL4KFYiJLoaSHDSuMdoLQbAvzCwRJC/of9P+Uzxk=
X-Google-Smtp-Source: AGHT+IECfHiFy38gha1RPWBkUkJ/cBaqyBrQ75UKhHI6kn6D02tcuSjuI48ENjJB8WBykFfxa9sN6Q==
X-Received: by 2002:a17:90b:1a86:b0:2c9:8891:e12a with SMTP id 98e67ed59e1d1-2cf237daf1cmr470905a91.23.1721846196292;
        Wed, 24 Jul 2024 11:36:36 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:36 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 5/8] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
Date: Wed, 24 Jul 2024 14:36:02 -0400
Message-ID: <20240724183605.4038597-6-jesse@rivosinc.com>
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

Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED to allow
for the addition of RISCV_VECTOR_MISALIGNED in a later patch.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
V2 -> V3:
 - New patch
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
V5 -> V6:
 - fix accidental moving of check_unaligned_access_emulated_all_cpus out of the #ifdef
---
 arch/riscv/Kconfig                    | 6 +++---
 arch/riscv/include/asm/cpufeature.h   | 2 +-
 arch/riscv/include/asm/entry-common.h | 2 +-
 arch/riscv/kernel/Makefile            | 4 ++--
 arch/riscv/kernel/fpu.S               | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b94176e25be1..34d24242e37a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -717,7 +717,7 @@ config THREAD_SIZE_ORDER
 	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
 	  affects irq stack size, which is equal to thread stack size.
 
-config RISCV_MISALIGNED
+config RISCV_SCALAR_MISALIGNED
 	bool
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	help
@@ -734,7 +734,7 @@ choice
 
 config RISCV_PROBE_UNALIGNED_ACCESS
 	bool "Probe for hardware unaligned access support"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  During boot, the kernel will run a series of tests to determine the
 	  speed of unaligned accesses. This probing will dynamically determine
@@ -745,7 +745,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
 
 config RISCV_EMULATED_UNALIGNED_ACCESS
 	bool "Emulate unaligned access where system support is missing"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  If unaligned memory accesses trap into the kernel as they are not
 	  supported by the system, the kernel will emulate the unaligned
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 3b24342c7d2a..4ade9f87fc55 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -34,7 +34,7 @@ extern struct riscv_isainfo hart_isa[NR_CPUS];
 
 void riscv_user_isa_enable(void);
 
-#if defined(CONFIG_RISCV_MISALIGNED)
+#if defined(CONFIG_RISCV_SCALAR_MISALIGNED)
 bool check_unaligned_access_emulated_all_cpus(void);
 void check_unaligned_access_emulated(struct work_struct *work __always_unused);
 void unaligned_emulation_finish(void);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index 2293e535f865..0a4e3544c877 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -25,7 +25,7 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
 void handle_page_fault(struct pt_regs *regs);
 void handle_break(struct pt_regs *regs);
 
-#ifdef CONFIG_RISCV_MISALIGNED
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 int handle_misaligned_load(struct pt_regs *regs);
 int handle_misaligned_store(struct pt_regs *regs);
 #else
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 5b243d46f4b1..8d4e7d40e42f 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -62,8 +62,8 @@ obj-y	+= probes/
 obj-y	+= tests/
 obj-$(CONFIG_MMU) += vdso.o vdso/
 
-obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
-obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
+obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= traps_misaligned.o
+obj-$(CONFIG_RISCV_SCALAR_MISALIGNED)	+= unaligned_access_speed.o
 obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)	+= copy-unaligned.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
index 327cf527dd7e..f74f6b60e347 100644
--- a/arch/riscv/kernel/fpu.S
+++ b/arch/riscv/kernel/fpu.S
@@ -170,7 +170,7 @@ SYM_FUNC_END(__fstate_restore)
 	__access_func(f31)
 
 
-#ifdef CONFIG_RISCV_MISALIGNED
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 
 /*
  * Disable compressed instructions set to keep a constant offset between FP
@@ -224,4 +224,4 @@ SYM_FUNC_START(get_f64_reg)
 	fp_access_epilogue
 SYM_FUNC_END(get_f64_reg)
 
-#endif /* CONFIG_RISCV_MISALIGNED */
+#endif /* CONFIG_RISCV_SCALAR_MISALIGNED */
-- 
2.45.2

