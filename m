Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8603254B8
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918225; cv=none; b=aWSUrspFz1qPFZOusEeOmzWrFbpBxcttq4zofUkmTh9osfricbejZ3giqLoM0n7Vangwe/JlT+1jvNvc3QkZZkz1JEH9bk5XR75RlkAnBsev4+nV+cnxEH+w1fo2Ov7F3gk3bTbKsuPsUNT5cG42/Jdc+SL2184al/xACKmtz48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918225; c=relaxed/simple;
	bh=fYsgjhWpFNwZzsz6XTdwqVjO9ZYYSzPKvxGF6PdzAU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAxGBKeTFVIv9ZcdElRQY8cMQQ3/42ExrNv+3k5EWaN6MnyNAmlyY9vOMMDukHyDMn+B9X8SzXuqTqvsWIi2j4fY9H790GQDQfnPWzHgKEtAZPOZeTJvA8VI/9rH5ladvyhrlp/kFKuNxG+fdaCTh7JdZS+OvGhMWD4Z7xbK+e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Zl2dsnjg; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Zl2dsnjg"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43bf9548df4so412058fac.0
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784918220; x=1785523020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5WtDtOqfytDOFAEVKix6l6cYHk5EHuSsJD2nF6LYPo=;
        b=Zl2dsnjgVDSmkTYnzwo75UiQ2oPN33jxLQyDqqu7mGWc86p1NnuiJLlygUEdMt3Id9
         4dq0w0qkY3fOK2CBtKmYWEk3zN02NfTnMapazWtBad/5WR1Brx7ZSGAK/5DVvdvq9IDl
         xLIYrFi3w4qwHsnFALXLwGxUNwXEH/Q/FiDbH2QPFUih0pDlMpMgm/7DWwdSt/c6B3BB
         1pI5eOFiLDKkqJd9/q7AZJQcjUuuGUD5MtLO6DDR5nQ5APKJixZg+Ugoem2qw/h/05ck
         uVWc1evSrVNoaMGq2qQas2ZmT+ntoOeOopiqNU09oxx+/PdC1qx32+qxL08XjeHvkdMu
         HAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918220; x=1785523020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5WtDtOqfytDOFAEVKix6l6cYHk5EHuSsJD2nF6LYPo=;
        b=X3cmoKZ2ynB0jO5pmIA0TbO80UvHusgiIfjP3UEJMCGeCy+rJFNZ+BRQpUm8Zys3Oc
         BeNpxD2kD726mrjc/9RQimBqxsMu3l/NsyBuF17cEl4Df/WgxpC16N+jwE6rD46cQMqA
         noP0xRraxuqbzN5/vlnIz6Y89O4yZIsqKf/7nl+Y7s5idSoQcF8GEw7ipolJm5iGOSE4
         rU1sw10cYB5oU7MDOaQncm5l1gzWkCO/bxbMLlyPmTSo5Hvo67cjZqhJS/HAgfnxZUku
         A++/nPrVMMFb5BUFdND+QBPFyKlpgwnYQg/HbsV9JyWwQtxxOkiLsL9E8VspZHhoKA8m
         sLVQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDAg4fZvFBsCi+qi5fFGlW5WM84s86P0CkR+gCdg8U8mu600xDn6BUV9Kx9j0NmL8mtfJA2lUqVGk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlpijr/NGXxHFYnJhtWPyOGGPeU8k+HaiFjExYcXrsh+7t51Ra
	zpZNVj0742IVgSEMNlojWDUyoVIf/Ns+rpL28P0l9jpoWw+JtmeFHgh6qD2htreuc2Q=
X-Gm-Gg: AR+sD113ftB9IXntPoZ2lskTbkfK9xmE9wR22yLNlePM0Nby42EFGKkH+t0z/a/Nizz
	mZpWKY+Efl3JdK20Y9Ae1p7gslQOYeeoctyyWRcorD7VNhtQmLz8+cNxZ/d1f2BMBKD0t/vg9AA
	0Rj53BsgcUOp27iali7eX4FHZ/MciTbYgHWxS27etE91GW0W8azBO97UMJ+Gd+64+uRRhuw8Fj8
	60DXkDboir6aMrVIf9hzU8J7BMTW/kK6JTs9seXlX8gsNCWlY7MSe184erG7pNC3hy4sTgozi/n
	4bhj590yI9jVFH4EnUMlMms4DbY8GIXFmGVSfc9tMkydHvFyn2JsiQ0Y/1TDzn/tf3O8EKmvvLM
	3zfHbBflFxEIRD6AtXkYFvSIYAqqlIWya8rYQhkqDts8ZXU/FybAxJjn2mAIS8mMM7PTWdHxGrZ
	Pw0AI+Kx6J3T7MCYVYb/dEHKAU+pRmfkfFBBs=
X-Received: by 2002:a05:6871:358e:b0:456:b12c:660d with SMTP id 586e51a60fabf-457a0fc4236mr5852247fac.24.1784918220059;
        Fri, 24 Jul 2026 11:37:00 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45767488299sm8221863fac.16.2026.07.24.11.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:36:59 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: bergner@tenstorrent.com,
	kito.cheng@sifive.com,
	Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Guodong Xu <docular.xu@gmail.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Jingwei Wang <wangjingwei@iscas.ac.cn>,
	Yao Zihong <zihong.plct@isrc.iscas.ac.cn>,
	Deepak Gupta <debug@rivosinc.com>,
	Mark Harris <mark.hsj@gmail.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Subject: [PATCH v2 1/2] riscv: hwprobe: export the availability of vector to user
Date: Fri, 24 Jul 2026 13:36:27 -0500
Message-ID: <20260724183646.2363114-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724183646.2363114-1-tchiu@tenstorrent.com>
References: <20260724183646.2363114-1-tchiu@tenstorrent.com>
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
Changelog v2:
 - rebase on top of latest for-next
 - add test_avail to sifive's vector depending extensions
---
 Documentation/arch/riscv/hwprobe.rst          | 27 ++++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  2 +-
 .../asm/vendor_extensions/sifive_hwprobe.h    |  6 ++--
 .../asm/vendor_extensions/thead_hwprobe.h     |  6 ++--
 arch/riscv/include/uapi/asm/hwprobe.h         |  2 ++
 arch/riscv/kernel/sys_hwprobe.c               | 36 +++++++++++++------
 arch/riscv/kernel/vdso/hwprobe.c              | 25 +++++++++----
 .../kernel/vendor_extensions/sifive_hwprobe.c | 16 ++++++---
 .../kernel/vendor_extensions/thead_hwprobe.c  |  9 +++--
 9 files changed, 100 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641deb9..b9b3cf23c212 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,30 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit 302a2d45c243
     ("Update build-pdf.yml") of riscv-cfi.
+
+ * :c:macro:`RISCV_HWPROBE_KEY_EXT_ENABLED`: A modifier key. It reports no
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
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
index 90a61abd033c..c961c78a7927 100644
--- a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
+++ b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
@@ -7,10 +7,12 @@
 #include <uapi/asm/hwprobe.h>
 
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
-void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
+				     const struct cpumask *cpus, bool test_avail);
 #else
 static inline void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
-						   const struct cpumask *cpus)
+						   const struct cpumask *cpus,
+						   bool test_avail)
 {
 	pair->value = 0;
 }
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
index caf6762427c8..c3be2253de88 100644
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
@@ -352,11 +354,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
-		hwprobe_isa_vendor_ext_sifive_0(pair, cpus);
+		hwprobe_isa_vendor_ext_sifive_0(pair, cpus, test_avail);
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
 
@@ -477,6 +484,10 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 			if (ret)
 				return -EFAULT;
 		}
+		if (pair.key == RISCV_HWPROBE_KEY_EXT_ENABLED) {
+			test_avail = true;
+			continue;
+		}
 
 		if (clear_all)
 			continue;
@@ -486,7 +497,7 @@ static int hwprobe_get_cpus(struct riscv_hwprobe __user *pairs,
 		for_each_cpu(cpu, &cpus) {
 			cpumask_set_cpu(cpu, &one_cpu);
 
-			hwprobe_one_pair(&tmp, &one_cpu);
+			hwprobe_one_pair(&tmp, &one_cpu, test_avail);
 
 			if (!riscv_hwprobe_pair_cmp(&tmp, &pair))
 				cpumask_clear_cpu(cpu, &cpus);
@@ -536,8 +547,11 @@ static int complete_hwprobe_vdso_data(void)
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
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
index 1f77f6309763..379ea16bd89f 100644
--- a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -6,17 +6,23 @@
 
 #include <linux/cpumask.h>
 #include <linux/types.h>
+#include <asm/vector.h>
 
 #include <uapi/asm/hwprobe.h>
 #include <uapi/asm/vendor/sifive.h>
 
-void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus,
+				     bool test_avail)
 {
+	bool report_v = test_avail ? riscv_v_vstate_ctrl_user_allowed() : true;
+
 	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
 				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
-		VENDOR_EXT_KEY(XSFVQMACCDOD);
-		VENDOR_EXT_KEY(XSFVQMACCQOQ);
-		VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
-		VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+		if (report_v) {
+			VENDOR_EXT_KEY(XSFVQMACCDOD);
+			VENDOR_EXT_KEY(XSFVQMACCQOQ);
+			VENDOR_EXT_KEY(XSFVFNRCLIPXFQF);
+			VENDOR_EXT_KEY(XSFVFWMACCQQQ);
+		}
 	});
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

