Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5E1DC463
	for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724102787; cv=none; b=gWCLlk71olOUzB5HJCGHOAoyqkh0nPoF9/x3UrwiEwEb5idrdPNMOb7nxeQztJUUnzQiF32DiSwGA8o6nMidZdH6dShcIqawZwrDOwX1a1sdZlxI9se/i/jmTl0Ifp+Wi3LBQPZP/VxqhyeSYcGhRaRgPw+hIdZGFMaIQ88Ukmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724102787; c=relaxed/simple;
	bh=BjmIFSn7iaZIopa2DEnAzPPB5C6Jk3AUGqE6j7jnLyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pk4/zVdrL8OTl+KU1rB/nw/CWqCD8KgfycoCmzk8fuKbRGBi4gSbtD3RXX2p7YIBlEU6JRdypbUkcGY+DgbCHNNCX03I00FTbtM//fMIMgL0eRlX9OnBbehtuJRMMD6RkrZ8/g3/nNnPBYZQ4EmLfMfVZ+xp8lK0+k7KVn+nqrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=CWyK6ZmB; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="CWyK6ZmB"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3dc16d00ba6so2916222b6e.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Aug 2024 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724102784; x=1724707584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UcyC2KzgUuAPbEMyY4Gh9cCZwpRTc2lPZw0dHSPf2s=;
        b=CWyK6ZmBcqx3ovyHHkK1uLSOO7gzv+CQfKChRCAXxCxUU3P6BHlm9BS/Ye+JSa3IiJ
         IAKoo51jDWulJdLaTP3GS2JxXTTaRUTHjCCSXSWZKxqJ/XPt0eroscaN119QTa62TT0e
         BiO8QtoYNY89a7pktnC5A/UFB0bsQH0YmcdIwkU1e3vlfLSfNqrF0xPHNiZyEmcqNDfX
         lA9pjBJdl3e/T8SevOdsF0NB2Ofm6Z6XDwbie+90ZShMfjCZsvduBef0Y082XRJ+XTgE
         JmrKkTtSTJdiLRiHvBnpGDmGVKrzge7oD7s7otgJwQGKVVUaOn2/OpShhUqDHTF2yCcT
         Llcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724102784; x=1724707584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UcyC2KzgUuAPbEMyY4Gh9cCZwpRTc2lPZw0dHSPf2s=;
        b=utBQvUucwOuzQm2n+VCGlAOEPwIgxcs0Ildq2+A6EtEnCkPPB7XmhFF+HHy69bNZaA
         qwBmfUxHTz6v+YrASuooiqYOIQ9w6kK3rNVnNZs2Tl9uL4HMrd60Ziu9VmizJUky1DGu
         im/XG8eownkjQA5632JViEQSG0oKP80KzT3g+XSPQlklt+T8TvmhnL8Edf3qKkSodz9P
         LYnvWvGQJa7Nkv9jOLl/anah93rsYd2QgyTtHamWfqU4SCOqVFEqwsb9InfvUP/Ez+Sf
         /bwcKOZEl1W66XjsR29esa5q7a0NXSUTQkM5t4vO4SkpnQhao8q58CMFMCX0Q4PNTJiE
         j06g==
X-Forwarded-Encrypted: i=1; AJvYcCXLVrfE/1Bz3eDJnBIdo6CNwpXgs4rE/A4wxLGIX4sXB6GsO2Qye5hpnfjvJDiFO0NeUsrvLiDG3ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSVVEDVsuouc8AdLHTEJ1ifRHa1XBXciEvkb/3HQTOJ+BJ05ia
	PojBcu3yzM15OJAaEH4Sh1N6l1BFckKa7tYzOD988bsNSvQaaurEs9LGqFup1+8=
X-Google-Smtp-Source: AGHT+IHIgcEsiy8Ch+EqdrZZobOJVRRKWVWIl2/Rix/gPJ3aa1O92NM9XG1o3nNsPb+Mw6ZC2nMd2Q==
X-Received: by 2002:a05:6808:179a:b0:3d9:2751:a207 with SMTP id 5614622812f47-3dd3ae1a4ecmr14774539b6e.44.1724102784159;
        Mon, 19 Aug 2024 14:26:24 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b61e7bd1sm7004694a12.53.2024.08.19.14.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 14:26:23 -0700 (PDT)
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
Subject: [PATCH v8 3/6] RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
Date: Mon, 19 Aug 2024 17:26:02 -0400
Message-ID: <20240819212605.1837175-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240819212605.1837175-1-jesse@rivosinc.com>
References: <20240819212605.1837175-1-jesse@rivosinc.com>
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
Reviewed-by: Evan Green <evan@rivosinc.com>
---
V2 -> V3:
 - New patch
V3 -> V4:
 - No changes
V4 -> V5:
 - No changes
V5 -> V6:
 - fix accidental moving of check_unaligned_access_emulated_all_cpus out of the #ifdef
V6 -> V7:
 - No changes
V7 -> V8:
 - Rebase onto fixes
---
 arch/riscv/Kconfig                    | 6 +++---
 arch/riscv/include/asm/cpufeature.h   | 2 +-
 arch/riscv/include/asm/entry-common.h | 2 +-
 arch/riscv/kernel/Makefile            | 4 ++--
 arch/riscv/kernel/fpu.S               | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..e9295a56b3a5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -765,7 +765,7 @@ config THREAD_SIZE_ORDER
 	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
 	  affects irq stack size, which is equal to thread stack size.
 
-config RISCV_MISALIGNED
+config RISCV_SCALAR_MISALIGNED
 	bool
 	select SYSCTL_ARCH_UNALIGN_ALLOW
 	help
@@ -782,7 +782,7 @@ choice
 
 config RISCV_PROBE_UNALIGNED_ACCESS
 	bool "Probe for hardware unaligned access support"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  During boot, the kernel will run a series of tests to determine the
 	  speed of unaligned accesses. This probing will dynamically determine
@@ -793,7 +793,7 @@ config RISCV_PROBE_UNALIGNED_ACCESS
 
 config RISCV_EMULATED_UNALIGNED_ACCESS
 	bool "Emulate unaligned access where system support is missing"
-	select RISCV_MISALIGNED
+	select RISCV_SCALAR_MISALIGNED
 	help
 	  If unaligned memory accesses trap into the kernel as they are not
 	  supported by the system, the kernel will emulate the unaligned
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index dfa5cdddd367..ccc6cf141c20 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -59,7 +59,7 @@ void riscv_user_isa_enable(void);
 #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
 	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
 
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
index 06d407f1b30b..71442b22efc8 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -64,8 +64,8 @@ obj-y	+= probes/
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

