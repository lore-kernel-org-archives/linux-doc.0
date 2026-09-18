Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5632135201B
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 21:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789768444; cv=none; b=ksfKa5mNSKOelLoGLvlBc1G0hxrcLqKgcSOfLBln2ohIJZij6FyETUtTnsSa+E5uUmZXz0fMqpg4Ch8rupQHmeQTHBTSVdZKMj5Pitih70QNR45iau69uMx8Xc7hZ47meEtPb3mdHI2UBz9EjgG7oPt/JyDT5yAz8+OtLdSxPuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789768444; c=relaxed/simple;
	bh=Cphod2Bd6qtbpEjTNWVYnmh4eAHWodeSZ/AFGMz3754=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnQGCcqbvNE3tD092KlT0AIIPAFjBM52MThpuvKBHR6JvfvS6qynnzZuJ4b8cNJojF0ZtrPt7Wn4YpLh7P/dnZpQK70oikjDlmfq0KbgZe9b4K/MawX/eDu2EIPY2kQ5/8HamMeuAbr3BvvMj7QWzTpXCDoXVyk0HS69F7LcQtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=CdsTks64; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="CdsTks64"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-8659af7454eso13108157b3.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1789768441; x=1790373241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oD/MlcX/QYjDVcdYmRV+KU1dYTn+oF/u+TXErdbiLr0=;
        b=CdsTks64YSiJdjpDrq/NpAsTgajgEHU7mKOMWnBG6konuED+zCQHrkC6nPGp/OpLtM
         jl6W1o4uB+uklJ+sXg/nECRrv6jOROYY0YCuI1KHdyUVKq+GIV4yhjoMDwrkZ+MlKXTf
         HisDDGntD75z/l0mpFps7s0fV4ufE3gaZSJW2jNMT1pf8rzvaAZrRZf1zlgcpjWRLJLT
         4rXT34bUmhhV+pHSG0afP65ycozr16Gq0oddkjI3CyvgxLUZskAkKGqxKdcv1EO9Q3oY
         ES5NHvv5Rcw1/ei/cuNgRt5Ee8qkNrGo/Plbo5mnw+AlvCL4LmPZtR3VdxwhPwGQFBeZ
         T+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789768441; x=1790373241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oD/MlcX/QYjDVcdYmRV+KU1dYTn+oF/u+TXErdbiLr0=;
        b=AT+nyBtyBX7Sxn/u2As/chR806Lx47tYqsTQqzliPMPVGJCaYSnh2mWpT2cHrMvn25
         34nL697WEvm+KZo4d5TIvoAql1rzIy5nRoHZ8t5kawf/vbyK6TbSqwntGTCYb1pBSbaF
         BMqPeunQ4o60R20T4U2wA9TE7goNQQcU8lAQQBZ5UtsESdF+emF6Yw9bg+L+tiRPJOSq
         SrGcmcu6egKGgJQ3RJP8TPXNhPfBmHv70ojWwt4vthu41/CWf0zkNPTyvv9++iHXpPJ+
         hyT979FAfbGVBjUprx3XfnFsb7hR64r4b9nu9x1YpctqbpdOod5Woc7Ja7RUlvO6vsdm
         WdEg==
X-Forwarded-Encrypted: i=1; AKwUvBwpOb+WwWuLMAJgAkA8kYwc3gtLL7h7ecToT3kPiFCgRlyFd6b6sS7774akYADGJ/hSlXvZo9nFOVE=@vger.kernel.org
X-Gm-Message-State: AFuF++liv2xzAxiWFipDGNpFdMs3OM4DueiSCugq+Yq6vcD3G7cy2YY6
	2+wh07msAXmT+hONi8iOKXfviBlyGbIOkgSZwCfgVDhGIpXdIAO+MTIV4j7+oiS15Tw=
X-Gm-Gg: AYBFou2b5X3xaSpG8wnUzeiQHVycfDnkM+42DQnfN1WaAvUBKp3LaCiZgy8Hq6hxEDm
	xOaCkBb6Is9T4W5uDvcZmEKjG2U5GXQ40/Xe+iuJREOqmnXnPg90L6vnb8Xa0lLWcAlgbzMvnGv
	HEvM3bm+EesqrnrBGZXXRSSiwwWkO7mLG76a9ubwY9aIYbINdK2wihgHFgqnZR3y3UwOTBhfiHJ
	UpiRDZDn3LGPKGWie4GB1BlxMo1Hrfoo3LD0fPnTYkQOGj8vwWQr5mjPY5zJ6DIMEySptdkw6Qv
	ozIPVyWFGnIRPgBJOLb2THFA4BFKgbQRwI3cuD3RlMctiAzKgTTcBm86n8eBSnCIIIHIsVgJfkn
	XeOcBDHi9aSSccA+wSoHD+SZqmczI3Uq9dZGzANsE121oTxTu7whQYfV0CDdhfE/pGx3l5WmuuY
	n2YOVxlo6ABJCHPcVXveIj/wNhpNJGU2RRSYq7LyDZp0d+JVo4Rp0j4Gpg9jOLDsebpP0+qcY4t
	36UVjcg/sv4C3NdSI6vLYtscHmCueke3nK/
X-Received: by 2002:a05:690c:e1dc:10b0:893:ff7e:8242 with SMTP id 00721157ae682-8973227c6cdmr10542027b3.8.1789768441108;
        Fri, 18 Sep 2026 14:54:01 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a45d8fb3csm4017757b3.13.2026.09.18.14.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:54:00 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: andybnac@gmail.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Jeff Layton <jlayton@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	daichengrong <daichengrong@iscas.ac.cn>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Guodong Xu <guodong@riscstar.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Atish Patra <atishp@rivosinc.com>,
	Hui Wang <hui.wang@canonical.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Zong Li <zong.li@sifive.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Rui Qi <qirui.001@bytedance.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH v6 8/8] riscv: vector: optimize vstate operations
Date: Fri, 18 Sep 2026 16:51:22 -0500
Message-ID: <20260918215154.2481482-9-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918215154.2481482-1-tchiu@tenstorrent.com>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the riscv_novstateopt to control the optimization of vector
state operations in the kernel space.

The optimization enables vector in kernel mode and bypasses vector
register nulling for user space on the syscall fast path when the boot
argument "riscv_novstateopt" is not set

Enabling this optimization yields the following performance benefits:
 - Cut 80 cycles latency for getpid on Ascalon.
 - Up to 2.9% request throughput improvement on an nginx workload on a
   four-core Ascalon-S.
      86B      1KB      2KB      4KB      8KB     16KB     32KB
    +0.33%*  -0.23%   +2.88%*  +2.19%*  +1.02%   +1.14%   +1.40%*

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v6:
 - upgrade it to use alternative and change default to enable the
   optimization
 - refresh the nginx numbers for the alternative-based implementation
Changelog v5:
 - new patch since v5
---
 .../admin-guide/kernel-parameters.txt         | 13 +++++++++++++
 arch/riscv/include/asm/alternative-macros.h   |  6 ++++++
 arch/riscv/include/asm/alternative.h          |  3 ---
 arch/riscv/include/asm/cpufeature-macros.h    | 12 ++++++++----
 arch/riscv/include/asm/vector.h               | 19 ++++++++++++++++++-
 arch/riscv/kernel/cpufeature.c                | 19 +++++++++++++++++++
 arch/riscv/kernel/entry.S                     | 15 +++++++++++++--
 arch/riscv/kernel/process.c                   |  3 +++
 arch/riscv/kernel/vector.c                    | 17 +++++++++++++++--
 9 files changed, 95 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4a12805a50ba..798175c902eb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6700,6 +6700,19 @@ Kernel parameters
 		fcfi	Disable user forward CFI ABI to userspace even if the
 			landing pad extension is available.
 
+	riscv_novstateopt [RISCV,EARLY]
+			Disable the vector state optimization. By default the
+			kernel keeps Vector enabled while running in kernel
+			space, rather than toggling sstatus.VS on every use of
+			the kernel-mode vector, and skips nulling the vector
+			registers for user space. Pass this option to restore the
+			conservative behavior, which catches illegal use of
+			Vector in kernel code. The optimization roughly cuts
+			30 ns of getpid() latency on a Blackhole x280 and gives
+			a 2.9% request throughput improvement for an nginx
+			workload serving a 2KB web page on a four-core
+			Ascalon-S.
+
 	ro		[KNL] Mount root device read-only on boot
 
 	rodata=		[KNL,EARLY]
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 9619bd5c8eba..f6997c77e29a 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -2,6 +2,12 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
+#include <linux/wordpart.h>
+#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
+#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
+
+#define RISCV_CPUFEAT_VSTATEOPT	0x1
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 
 #ifdef __ASSEMBLER__
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 8407d1d535b8..4a50a8601985 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -18,9 +18,6 @@
 #include <linux/stddef.h>
 #include <asm/hwcap.h>
 
-#define PATCH_ID_CPUFEATURE_ID(p)		lower_16_bits(p)
-#define PATCH_ID_CPUFEATURE_VALUE(p)		upper_16_bits(p)
-
 #define RISCV_ALTERNATIVES_BOOT		0 /* alternatives applied during regular boot */
 #define RISCV_ALTERNATIVES_MODULE	1 /* alternatives applied during module-init */
 #define RISCV_ALTERNATIVES_EARLY_BOOT	2 /* alternatives applied before mmu start */
diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
index a8103edbf51f..46ef64932a1c 100644
--- a/arch/riscv/include/asm/cpufeature-macros.h
+++ b/arch/riscv/include/asm/cpufeature-macros.h
@@ -45,22 +45,26 @@ static __always_inline bool __riscv_has_extension_unlikely(const unsigned long v
 
 static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+	int realext = PATCH_ID_CPUFEATURE_ID(ext);
+
+	compiletime_assert(realext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
 	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
 		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
 
-	return __riscv_isa_extension_available(NULL, ext);
+	return __riscv_isa_extension_available(NULL, realext);
 }
 
 static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
+	int realext = PATCH_ID_CPUFEATURE_ID(ext);
+
+	compiletime_assert(realext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
 	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
 		return __riscv_has_extension_likely(STANDARD_EXT, ext);
 
-	return __riscv_isa_extension_available(NULL, ext);
+	return __riscv_isa_extension_available(NULL, realext);
 }
 
 #endif /* _ASM_CPUFEATURE_MACROS_H */
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 1cc37d40cf79..b227a8252fa9 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -49,6 +49,7 @@
 	_res;								\
 })
 
+extern bool riscv_v_vstate_opt;
 extern unsigned long riscv_v_vsize;
 int riscv_v_setup_vsize(void);
 bool insn_is_vector(u32 insn_buf);
@@ -78,6 +79,14 @@ static __always_inline bool has_vector(void)
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
 }
 
+static __always_inline bool has_vstate_opt(void)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return riscv_has_extension_likely((RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X);
+	else
+		return false;
+}
+
 static __always_inline bool has_xtheadvector_no_alternatives(void)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_XTHEADVECTOR))
@@ -122,6 +131,9 @@ static inline bool riscv_v_vstate_query(struct pt_regs *regs)
 
 static __always_inline void riscv_v_enable(void)
 {
+	if (has_vstate_opt())
+		return;
+
 	if (has_xtheadvector())
 		csr_set(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -130,6 +142,9 @@ static __always_inline void riscv_v_enable(void)
 
 static __always_inline void riscv_v_disable(void)
 {
+	if (has_vstate_opt())
+		return;
+
 	if (has_xtheadvector())
 		csr_clear(CSR_SSTATUS, SR_VS_THEAD);
 	else
@@ -335,7 +350,8 @@ static inline void riscv_v_vstate_set_restore(struct task_struct *task,
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check_gt(regs->status, INITIAL)) {
-		riscv_v_vstate_set_restore(current, regs);
+		if (!has_vstate_opt())
+			riscv_v_vstate_set_restore(current, regs);
 		riscv_v_vstate_init(regs);
 	}
 }
@@ -421,6 +437,7 @@ struct pt_regs;
 
 static inline int riscv_v_setup_vsize(void) { return -EOPNOTSUPP; }
 static __always_inline bool has_vector(void) { return false; }
+static __always_inline bool has_vstate_opt(void) { return false; }
 static __always_inline bool insn_is_vector(u32 insn_buf) { return false; }
 static __always_inline bool has_xtheadvector_no_alternatives(void) { return false; }
 static __always_inline bool has_xtheadvector(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec96843456..90a0b745611e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1217,6 +1217,20 @@ void __init riscv_user_isa_enable(void)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
+/*
+ * Leaving Vector enabled while in the kernel requires the vstate alternatives
+ * to be patched in, so the optimization is only available when alternatives
+ * are built. It can be turned off on the command line to catch illegal use of
+ * Vector in kernel code.
+ */
+bool riscv_v_vstate_opt = IS_ENABLED(CONFIG_RISCV_ALTERNATIVE);
+static int __init riscv_novstateopt_setup(char *__unused)
+{
+	riscv_v_vstate_opt = false;
+	return 0;
+}
+early_param("riscv_novstateopt", riscv_novstateopt_setup);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
@@ -1246,6 +1260,11 @@ static bool riscv_cpufeature_patch_check(u16 id, u16 value)
 		 * then the alternative cannot be applied.
 		 */
 		return riscv_cboz_block_size <= (1U << value);
+	case RISCV_ISA_EXT_ZVE32X:
+		if (value == RISCV_CPUFEAT_VSTATEOPT)
+			return riscv_v_vstate_opt;
+
+		return true;
 	}
 
 	return false;
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d799c4e56f80..d9d6b4f87670 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -6,6 +6,7 @@
 
 #include <linux/init.h>
 #include <linux/linkage.h>
+#include <linux/stringify.h>
 
 #include <asm/alternative-macros.h>
 #include <asm/asm.h>
@@ -175,10 +176,13 @@ SYM_CODE_START(handle_exception)
 	 * Disable user-mode memory access as it should only be set in the
 	 * actual user copy routines.
 	 *
-	 * Disable the FPU/Vector to detect illegal usage of floating point
+	 * Disable the FPU to detect illegal usage of floating point
 	 * or vector in kernel space.
 	 */
-	li t0, SR_SUM | SR_FS_VS
+	li t0, SR_SUM | SR_FS
+	ALTERNATIVE(__stringify(ori t0, t0, SR_VS), "nop", 0,
+		    (RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X,
+		    CONFIG_RISCV_ISA_V)
 #ifdef CONFIG_64BIT
 	li t1, SR_ELP
 	or t0, t0, t1
@@ -186,6 +190,13 @@ SYM_CODE_START(handle_exception)
 
 	REG_L s0, TASK_TI_USER_SP(tp)
 	csrrc s1, CSR_STATUS, t0
+	ALTERNATIVE("j .Lskip_v_enable", __stringify(andi t0, s1, SR_VS), 0,
+		    (RISCV_CPUFEAT_VSTATEOPT << 16) | RISCV_ISA_EXT_ZVE32X,
+		    CONFIG_RISCV_ISA_V)
+	bnez t0, .Lskip_v_enable
+	li a0, SR_VS_INITIAL
+	csrs CSR_STATUS, a0
+.Lskip_v_enable:
 	save_userssp s2, s1
 	csrr s2, CSR_EPC
 	csrr s3, CSR_TVAL
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a..5c127855be54 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -258,6 +258,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		/* Supervisor/Machine, irqs on: */
 		childregs->status = SR_PP | SR_PIE;
 
+		if (has_vstate_opt())
+			riscv_v_vstate_init(childregs);
+
 		p->thread.s[0] = (unsigned long)args->fn;
 		p->thread.s[1] = (unsigned long)args->fn_arg;
 		p->thread.ra = (unsigned long)ret_from_fork_kernel_asm;
diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
index 6fd541f5d5cb..eec9deff8da7 100644
--- a/arch/riscv/kernel/vector.c
+++ b/arch/riscv/kernel/vector.c
@@ -12,6 +12,7 @@
 #include <linux/prctl.h>
 
 #include <asm/thread_info.h>
+#include <asm/cpufeature.h>
 #include <asm/processor.h>
 #include <asm/insn.h>
 #include <asm/vector.h>
@@ -69,6 +70,16 @@ void riscv_v_ucontext_save(struct task_struct *tsk)
 int riscv_v_setup_vsize(void)
 {
 	unsigned long this_vsize;
+	bool v_always_on = false;
+
+	/*
+	 * has_vstate_opt() cannot be used here if called from riscv_fill_hwcap(), before
+	 * apply_boot_alternatives(),
+	 */
+	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZVE32X) && riscv_v_vstate_opt) {
+		v_always_on = true;
+		csr_set(CSR_SSTATUS, SR_VS_INITIAL);
+	}
 
 	/*
 	 * There are 32 vector registers with vlenb length.
@@ -81,9 +92,11 @@ int riscv_v_setup_vsize(void)
 		return 0;
 	}
 
-	riscv_v_enable();
+	if (!v_always_on)
+		riscv_v_enable();
 	this_vsize = csr_read(CSR_VLENB) * 32;
-	riscv_v_disable();
+	if (!v_always_on)
+		riscv_v_disable();
 
 	if (!riscv_v_vsize) {
 		riscv_v_vsize = this_vsize;
-- 
2.43.0

