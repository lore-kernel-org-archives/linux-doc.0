Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C748A2B6
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910429; cv=none; b=Tw271CtrHjZ7DyKTC39hXgqAqVpP5TXBf1oMiLa0qY6RX6C7WeofZRFerO0i/lK8npsPerccIdtR+21LXZTBBnITumxYwON4U/PJo50OvtjAjaUmNtk3EvegX1DyO5uc6+9Ztdgy9hUBf9Nsl6PCbPHGP25Y8HkfvFmJrvNtUo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910429; c=relaxed/simple;
	bh=T9CmM6/kAB+Q30y5fFGczpGpTL17R/Ge4YYOCWj1kNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AU+pYgT7P5l96+cmlaKs8HZlVvdX73G1wxXfHwEJGvKov+maR9w3nMy+1B0nf/6rVilcDQzRvGlpCZbNxZj5uxV/vCCQWadrdr62FtchSJmnNk5stOj23xPrmMidZF3ycgfPqvqoKj2bGmkVsCFsX4/h3TFBr+CGK+fxJbtGsNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cezyO+YH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cezyO+YH"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84592b55832so286941b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910427; x=1783515227; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rhFree8++pTI9ZAZ54v8+CwrfYiao4iARzoIIc8yLM=;
        b=cezyO+YHUn4XrijOK+Zbl1CAh2YCp+IrdJ6RyFYQ6hDQU6Hm2iOeR37RYM2QjMWBj6
         YBiovPQmOwYhaAE412POK/+l1tfYOqjtyi+d3+fXAfZ20IuVsWnQwNRs0CaGm8YgCP6K
         BoZV/N2cnV9tFLRXf5HqWIC/X3byvTUTSPNQbJ8EEVRjOuecYQ8mN2kvhWhe3N2dzgYp
         B2x5MuePUAIbMVbg9I722aaaFjKmcE/LgR5tmKrJ9yNaizrPj+7dQqsmDWN20NNT5u+x
         +wmdhaTHTUx+tBK+hElPzTaH74ZyR2WTKnQn2fBv+wHrlRRwdlmSD4FzT4Y9s+1BUL7m
         biqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910427; x=1783515227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8rhFree8++pTI9ZAZ54v8+CwrfYiao4iARzoIIc8yLM=;
        b=nBJjEo+UCYuX/KTjbMgCDKQNpxbFeriBzs7beZbfN1AL3I0Kw8QVpGjfQoJSfaLE+S
         xetfLndw4vueNBlcveoLS5jvuMmKV+Lxjfa04WW6PU/G/5UK6Y9ClaKC1NdZqsFOiOqU
         aEBesjwzJCJxG/s3e4qSqdLdsWRDuA3FUMEj2MLfmyt91RfP1X7jjXvkzk6zn2ZwWKmN
         WfoxLASDSQutMbh3ShhwA8ZhRgOeqJsHokl1xTFgLabftbzvwHQTK6ishcCs/UipYbP9
         MF4SBvakrGeGYUymxxtaMgetsn0QhlF6TmaDuNEkbo+1XYff0C/2EdBxxF4Xyus4TFNt
         hX3g==
X-Gm-Message-State: AOJu0YwwfQSmBk23MNcUnHA0XXVWIqosx5Gi7vM7usMYdwgOy9tvHEja
	4XxYlfM4+57HDXL8NjoQT1w8DYS2TkBoRh4uVG7Isovu7089OgZ0Pp+k
X-Gm-Gg: AfdE7cmMfpDovlKGRaFOCasVE/D3YljW5kbt2bGLrRMpsHKGpl+Kvew/iNWiok4NHIK
	TiM1iT4Do1bfryBxfvEYPe3+nfpWiQ9GA7B949ix4D5z0rOLiwLxUpDKekoBebINw34nlLAuIek
	grBn1qjIksSWqtKyk2aD/QMmQ0w8ffdfQTxAQCAjuc5j+enX/pTjqMUN9SOCt2odi9JVK/58mxP
	Dh4WiENqPU1T64zSbq0s+SSpGfsnTsGveyadJqhwp8MPontQLLNnVCis1orLj11+mgzX92Nr9Rl
	Uqxgb2OorHFUott8s0qgiIVOJWeHts6uA1eUGSlZK1wlu6l4MX31NZ33+OsXRnCfURhIG2/Dlbu
	adhas1b3DTU26ojWep7dDk4tWV+VhGw22n1x1ELfkiKzAty4AUKyaIYYLd/tpp85ppVy7hYhp4Y
	U8MB2a6uadEXqY+B8u8A3J
X-Received: by 2002:a05:6a00:21d2:b0:847:88eb:1e08 with SMTP id d2e1a72fcca58-847c090a2d8mr1295877b3a.53.1782910426858;
        Wed, 01 Jul 2026 05:53:46 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:46 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:20 -0400
Subject: [PATCH v5 07/17] riscv: Add B to hwcap and hwprobe
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-7-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5474; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=lcHI3FDXvXfc0zgjs6SBtBX/h2NdWeA6Wcv2wvsihEs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3hYlN6mrp50XX35xyUVU8VL9ccbMg0/sN++t23PIt
 eJ13y3+jlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZjITD1Ghq5TRQs3fzx3YJPs
 256HwYJOn15rLAoWPbz1X/8yvmXTTuUy/GLOmvowq27Zb8uOzE7OoxP0lonorH0ocG/L6W4z0/a
 pzzkB
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Collected Reviewed-by from Conor Dooley.
v4: No change.
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 893e1a1215d23..fc68dea397aae 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0acb7a01ecc0f..58523b3a1998a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe9..96b7cf854e090 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 58d1e86e47ae7..430dc49a82863 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -121,6 +121,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
+#define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d76ce21d4a18a..9eee53b264de1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -450,6 +450,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -497,6 +503,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1115,6 +1122,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b15ac9adf7920..dcc102bf8f183 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -210,6 +210,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

