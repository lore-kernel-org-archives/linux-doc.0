Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D5C4908C5
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 22:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784845302; cv=none; b=DBuJa5D287eyFgBrKVnrfrhsBFyUXUngjRR8o7+bfTxFT8FwerRw5ICx5lsaoBE/CFr1PyJ9z3jzwDiKZLueQL9Dmikd1EstWc1MiWPRAbHJck4bJnNxeYtg+Z9aSEWUgkM6p2Qyyl9Dd5XHhsYncbIuEYVm1tSSxk6QnAlS7CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784845302; c=relaxed/simple;
	bh=ukF/00A5TBZnKLRI0bLcp18yxEsSycqfgX9ktFORsvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j8GawFJd1PowKTZCB9ee1GO/9j3toNPMdkpyXAxcL0Ea878tAMycR2qzL1PSOW3lZXi5Xo2+ctz/NR80rbHYlJ/5SeDwIrzDM415FJ5pxuuVDgxSXl4e6gGRmc4mnfOk68u+EeZdaDcbGHo6VU8v3NwcN6wX/fywXnxuRTYL48M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=CeCK+B+5; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="CeCK+B+5"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb545db3afso786205a34.0
        for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784845296; x=1785450096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPY3U7ZPdpvP8+yaUUL9eX3pD3n4CR1D4sLsbMUyiOw=;
        b=CeCK+B+5Y+zFyu0oulSOqZ3tN2wQBTEqZaGf65qxiK7hxWx01/jw81W1FforeOgmfg
         bIkbk3oKGmCwJzlp91pM8hPS4gHMaw3B49FXQQygJsVnoc2bQALw2zphzLyWtuBk5PUx
         OuVHe9Sqnns/ifmHwDg/PXsOE3AS/gPKFHsCDzu7d+QuFP23PiIBuYdm1DPH+TyNrv2c
         HQUe0ix6KUHgTFpIQ0CgJe6PphqwNgbWf+2qK22NCFB1UnHCCfZSG370d00wRYVObrUi
         DD9HiV2wtSW3VKZyDnEOiX6mu9UN6bKbI0moFomXwmvKx01sUqfWLVhxP+g2Z20xhgTu
         9brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784845296; x=1785450096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPY3U7ZPdpvP8+yaUUL9eX3pD3n4CR1D4sLsbMUyiOw=;
        b=Yqhx6pZkryFEWv8uDSkj0ggB5ZEk/vTfr4DFkmbIX90ERo1k6UyP3zYlXWVOOy4Au+
         jTbw9ZY8MS8mrOEK367PyadINojJjyQO4dKYst8l32bF1nhLLaT9LXc4JDO/+aBSYgZM
         aVdLvXmp7og70C6pVnDujrq0VLi3x9oZ/LHNEC8Z4a+ZKzr+KWFD/vdQ6V943UzQtk2J
         kUEhX+GzLzmMpuIK2tA/KFLI9opYaQDM0qlmNpn6kuACF44HYfQIf+ET2B/OFhox55V1
         cNle3JUugsScapx6aEedjolB2qGmSvnqlAYsn54XBxEYVICDtEVeawUHMPCnVENVtGCB
         awyA==
X-Forwarded-Encrypted: i=1; AHgh+Rqyi3tFuksypDcSFr6t25GFsv23w4D3Gh94hGQZS17Nb4TdsHiOD3nMeZXU2Bd5vIzvVT8B8j22fn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJLym8jOlvCvliLMyXRghs/D119v80AA5BbNuAZUHcCoMtGBeM
	KnEuq9MuePrcBfhjmxK0Aa7UwqCdrwt5c1oio9tWUlP2vVitAFWcoQ7S0LkL1fNUfyg=
X-Gm-Gg: AR+sD134BISDEz1kskMbOHItejnDuxImkzFgSOMPOKeFrd/+3T5XORSxmR2db3STUyT
	kfNJ0x7ZhE3+mmMDcNqJvHrojNRGPq1PjPaRndQ5+RlgLryI/v4XVg1WkjPSb7Vy2uRrfJJzWG0
	0sdzP1YLG5wTK3Qduq4VTeIGo6pYoQE58SMkcNzK9F6L4vYyK7ICb0ePIt05WPWG8PsfHgyWGnE
	AaLezZE5szBkgIFnZOhds+cvsjrzbMgvWluRvIenyXuHcQVG5oK069L4/I0Vq6QbKr+OWdEyWuE
	2pyWCKqfgHwRyh4XN1J/lAiq1qtNRNmy9lRijRh99vD/tx+RjRxXwSnCuopJFDHMG3bzCZYdN9Q
	+EYtuNSp5dpGIQGeKiAJKhfp2hmjtSnnKcATMUxGbp83TjgiUK7UQ9epyqQzX1yfM+Lyn1YsTVA
	AwOzpUZpmKzqGX/8CoE7+lG0aqO4NhU629OSE=
X-Received: by 2002:a05:6820:1a04:b0:6a3:74c8:c057 with SMTP id 006d021491bc7-6aad4050d27mr2292473eaf.32.1784845296309;
        Thu, 23 Jul 2026 15:21:36 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaddc93c54sm1316877eaf.11.2026.07.23.15.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 15:21:35 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Zong Li <zong.li@sifive.com>,
	Deepak Gupta <debug@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH 1/2] riscv: hwprobe: export the availability of vector to user
Date: Thu, 23 Jul 2026 17:20:56 -0500
Message-ID: <20260723222109.2229089-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723222109.2229089-1-tchiu@tenstorrent.com>
References: <20260723222109.2229089-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Userland IFUNC resolvers use hwprobe to decide whether to dispatch to
vectorized routines. But RISCV_HWPROBE_KEY_IMA_EXT_0 only reports what
is present in hardware, not what the calling process may actually use:
when Vector is disabled for a process via
prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF), it is still
reported as present. A resolver that trusts this and runs a vector
instruction crashes with SIGILL.

Add RISCV_HWPROBE_KEY_EXT_ENABLED, a positional modifier key that carries
no value of its own. Within a single request, keys placed after it report
extensions that are both present and enabled for the calling process,
while keys before it keep reporting hardware presence. This masks out V
and its V-dependent sub-extensions when V is disabled for the process, and
lets userland obtain both views in one query:

      [ {IMA_EXT_0}, {EXT_ENABLED}, {IMA_EXT_0} ]
          present       modifier       enabled

The enabled view depends on per-process state, so it cannot be served from
the vDSO's process-independent cache; requests carrying the modifier are
deferred to the syscall. Unknown keys are still reported as -1, so the
feature is detectable and existing users are unaffected.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220795
Link: https://lore.kernel.org/all/20260107000609.63892-1-andybnac@gmail.com/
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
 Documentation/arch/riscv/hwprobe.rst          | 27 +++++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  2 +-
 .../asm/vendor_extensions/thead_hwprobe.h     |  6 ++--
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
 arch/riscv/kernel/sys_hwprobe.c               | 34 +++++++++++++------
 arch/riscv/kernel/vdso/hwprobe.c              | 25 ++++++++++----
 .../kernel/vendor_extensions/thead_hwprobe.c  |  9 +++--
 7 files changed, 84 insertions(+), 21 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index c420a8349bc6..b58b7c734c30 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -391,3 +391,30 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+* :c:macro:`RISCV_HWPROBE_KEY_EXT_ENABLED`: A modifier key. It reports no
+  value of its own (its value is always 0) and instead changes how the
+  extension-bitmask keys that follow it in the same request are reported.
+  Keys placed before it report the extensions that are present in hardware,
+  as usual. Keys placed after it additionally require each reported extension
+  to be enabled for the calling process, i.e. usable without receiving a
+  SIGILL.
+
+  Currently this applies to Vector. When V has been disabled for the process
+  with ``prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_OFF)``,
+  :c:macro:`RISCV_HWPROBE_IMA_V` and the V-dependent sub-extensions are
+  cleared from any :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_0` that follows the
+  modifier, and :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XTHEADVECTOR` is cleared
+  from any :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0` that follows it,
+  while a preceding key still reports them as present. A single request can
+  therefore return both the hardware-present set and the process-usable
+  set::
+
+      struct riscv_hwprobe pairs[3] = {
+          { .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },   /* present in hardware */
+          { .key = RISCV_HWPROBE_KEY_EXT_ENABLED, }, /* modifier            */
+          { .key = RISCV_HWPROBE_KEY_IMA_EXT_0, },   /* present and enabled */
+      };
+
+  The effect is positional: reordering the pairs changes which keys have the
+  enablement filter applied.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 8b9f5e1cf4cb..e8364a3eaeef 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY		16
+#define RISCV_HWPROBE_MAX_KEY		17
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
index 65a9c5612466..3e1c4271383f 100644
--- a/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
+++ b/arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
@@ -7,10 +7,12 @@
 #include <uapi/asm/hwprobe.h>
 
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
-void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
+				    const struct cpumask *cpus, bool test_avail);
 #else
 static inline void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair,
-						  const struct cpumask *cpus)
+						  const struct cpumask *cpus,
+						  bool test_avail)
 {
 	pair->value = 0;
 }
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aec..561483172ce5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,8 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+/* Modifier key working as a signal to the kernel to gather enablement status */
+#define RISCV_HWPROBE_KEY_EXT_ENABLED	17
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288..64d598d1a05d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -79,8 +79,9 @@ static void hwprobe_arch_id(struct riscv_hwprobe *pair,
 }
 
 static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
-			     const struct cpumask *cpus)
+			     const struct cpumask *cpus, bool report_avail)
 {
+	bool report_v;
 	int cpu;
 	u64 missing = 0;
 
@@ -91,7 +92,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (riscv_isa_extension_available(NULL, c))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector() && riscv_isa_extension_available(NULL, v))
+	report_v = report_avail ? riscv_v_vstate_ctrl_user_allowed() : true;
+	if (has_vector() && riscv_isa_extension_available(NULL, v) && report_v)
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
@@ -146,7 +148,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		 * All the following extensions must depend on the kernel
 		 * support of V.
 		 */
-		if (has_vector()) {
+		if (has_vector() && report_v) {
 			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
 			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
@@ -215,7 +217,7 @@ static bool hwprobe_ext0_has(const struct cpumask *cpus, u64 ext)
 {
 	struct riscv_hwprobe pair;
 
-	hwprobe_isa_ext0(&pair, cpus);
+	hwprobe_isa_ext0(&pair, cpus, false);
 	return (pair.value & ext);
 }
 
@@ -293,7 +295,7 @@ static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 #endif
 
 static void hwprobe_one_pair(struct riscv_hwprobe *pair,
-			     const struct cpumask *cpus)
+			     const struct cpumask *cpus, bool test_avail)
 {
 	switch (pair->key) {
 	case RISCV_HWPROBE_KEY_MVENDORID:
@@ -312,7 +314,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
-		hwprobe_isa_ext0(pair, cpus);
+		hwprobe_isa_ext0(pair, cpus, test_avail);
 		break;
 
 	case RISCV_HWPROBE_KEY_IMA_EXT_1:
@@ -356,7 +358,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
-		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
+		hwprobe_isa_vendor_ext_thead_0(pair, cpus, test_avail);
 		break;
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
@@ -379,6 +381,7 @@ static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
 			      unsigned long __user *cpus_user,
 			      unsigned int flags)
 {
+	bool test_avail = false;
 	size_t out;
 	int ret;
 	cpumask_t cpus;
@@ -419,7 +422,10 @@ static int hwprobe_get_values(struct riscv_hwprobe __user *pairs,
 			return -EFAULT;
 
 		pair.value = 0;
-		hwprobe_one_pair(&pair, &cpus);
+		if (pair.key == RISCV_HWPROBE_KEY_EXT_ENABLED)
+			test_avail = true;
+		else
+			hwprobe_one_pair(&pair, &cpus, test_avail);
 		ret = put_user(pair.key, &pairs->key);
 		if (ret == 0)
 			ret = put_user(pair.value, &pairs->value);
@@ -438,6 +444,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 {
 	cpumask_t cpus, one_cpu;
 	bool clear_all = false;
+	bool test_avail = false;
 	size_t i;
 	int ret;
 
@@ -476,6 +483,10 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 			if (ret)
 				return -EFAULT;
 		}
+		if (pair.key == RISCV_HWPROBE_KEY_EXT_ENABLED) {
+			test_avail = true;
+			continue;
+		}
 
 		if (clear_all)
 			continue;
@@ -485,7 +496,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 		for_each_cpu(cpu, &cpus) {
 			cpumask_set_cpu(cpu, &one_cpu);
 
-			hwprobe_one_pair(&tmp, &one_cpu);
+			hwprobe_one_pair(&tmp, &one_cpu, test_avail);
 
 			if (!riscv_hwprobe_pair_cmp(&tmp, &pair))
 				cpumask_clear_cpu(cpu, &cpus);
@@ -535,8 +546,11 @@ static int complete_hwprobe_vdso_data(void)
 	 * save a syscall in the common case.
 	 */
 	for (key = 0; key <= RISCV_HWPROBE_MAX_KEY; key++) {
+		if (key == RISCV_HWPROBE_KEY_EXT_ENABLED)
+			continue;
+
 		pair.key = key;
-		hwprobe_one_pair(&pair, cpu_online_mask);
+		hwprobe_one_pair(&pair, cpu_online_mask, false);
 
 		WARN_ON_ONCE(pair.key < 0);
 
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 8f45500d0a6e..f40c21e44ef9 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -14,7 +14,7 @@ extern int riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 
 static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 				 size_t cpusetsize, unsigned long *cpus,
-				 unsigned int flags)
+				 unsigned int flags, bool avail_test)
 {
 	const struct vdso_arch_data *avd = &vdso_u_arch_data;
 	bool all_cpus = !cpusetsize && !cpus;
@@ -27,7 +27,8 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 	 * homogeneous, then this function can handle requests for arbitrary
 	 * masks.
 	 */
-	if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) || unlikely(!avd->ready))
+	if (flags != 0 || (!all_cpus && !avd->homogeneous_cpus) ||
+	    unlikely(!avd->ready) || avail_test)
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	/* This is something we can handle, fill out the pairs. */
@@ -48,7 +49,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 
 static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 			       size_t cpusetsize, unsigned long *cpus,
-			       unsigned int flags)
+			       unsigned int flags, bool avail_test)
 {
 	const struct vdso_arch_data *avd = &vdso_u_arch_data;
 	struct riscv_hwprobe *p = pairs;
@@ -68,7 +69,8 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 		}
 	}
 
-	if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS || !avd->homogeneous_cpus)
+	if (empty_cpus || flags != RISCV_HWPROBE_WHICH_CPUS ||
+	    !avd->homogeneous_cpus || avail_test)
 		return riscv_hwprobe(pairs, pair_count, cpusetsize, cpus, flags);
 
 	while (p < end) {
@@ -105,10 +107,21 @@ int __vdso_riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
 			 size_t cpusetsize, unsigned long *cpus,
 			 unsigned int flags)
 {
+	struct riscv_hwprobe *p = pairs;
+	bool avail_test = false;
+	size_t i;
+
+	for (i = 0; i < pair_count; i++) {
+		if (p[i].key == RISCV_HWPROBE_KEY_EXT_ENABLED) {
+			avail_test = true;
+			break;
+		}
+	}
+
 	if (flags & RISCV_HWPROBE_WHICH_CPUS)
 		return riscv_vdso_get_cpus(pairs, pair_count, cpusetsize,
-					   cpus, flags);
+					   cpus, flags, avail_test);
 
 	return riscv_vdso_get_values(pairs, pair_count, cpusetsize,
-				     cpus, flags);
+				     cpus, flags, avail_test);
 }
diff --git a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
index 2eba34011786..28c58a7123d5 100644
--- a/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
@@ -6,14 +6,19 @@
 
 #include <linux/cpumask.h>
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #include <uapi/asm/hwprobe.h>
 #include <uapi/asm/vendor/thead.h>
 
-void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+void hwprobe_isa_vendor_ext_thead_0(struct riscv_hwprobe *pair, const struct cpumask *cpus,
+				    bool test_avail)
 {
+	bool report_v = test_avail ? riscv_v_vstate_ctrl_user_allowed() : true;
+
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_thead.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XTHEADVECTOR);
+		if (report_v)
+			VENDOR_EXT_KEY(XTHEADVECTOR);
 	});
 }
-- 
2.43.0

