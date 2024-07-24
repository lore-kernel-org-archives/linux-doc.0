Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF816B739
	for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721846181; cv=none; b=J134Qg8k7GRjX77OdcQxYhaC+gUo7iYwQ46UddMau8zXcoXqWmv+dp3d9EWXAX1TZrqLqdZ3M1KcBi3j14pTWtPAAbEuReoTuU8C9IzE0IshYaU74HJyTInM9cewE3Wm+AJFmBW0nWFmKNrlMmpQz2Mtwyjg0hJS2d78hi4c9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721846181; c=relaxed/simple;
	bh=WXm9/HAXk5Lab1ONciXViU9JUFRbDlVwDeuyb8DjUoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u7JSRIEQnyl3bQtKBA4kgJycgBg0tp96kHg0mnBW7szPx3rghOWsbdaIQOVbTnP0fwzv90x6tXsgDMWVeujAa9JaNY4ZtnYZzyrhcKcsMXii/ikpPYwJDb6nkwPDs33IgsQXyoKp5A+K7hXdbnsTgFptOXjQ/f6o8AtHIeGzbII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=C9xAwUhj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="C9xAwUhj"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2cd1661174cso118927a91.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 11:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721846178; x=1722450978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FV9ltTuKAXhQPitmW4cZ8QxbMM7L9R/Whun6TjodNdQ=;
        b=C9xAwUhjmAAlf42Z2UyxU4lmJzhZL9A3rYwnnk+OI9QvK3w0LfFlHWa1rP1kMPTu16
         Pajk+376M08EZTO0ru+K8Jf7nS4of0OJoKmYyp1odec3BbE50/5g309Vem2lgMZniNKa
         mswLNctnzsPtnfErP2IzedUlBT7uYkGCUSyFPiGOg82p5gbwXr5E2skFDxdKyKz00Knu
         eGMiRWHQpj5T8F4GARcq1L8AmbP1TOgvrP40Q7HCfAaZeQD947SFgWuHpEllGdQ8Om4N
         OcKFKrutCUXNiqjrq70eewJn5kSnzTgkiQ6dA9Y24J53/eTQjjoLnfiLcjq0lXNvQPR6
         XOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721846178; x=1722450978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV9ltTuKAXhQPitmW4cZ8QxbMM7L9R/Whun6TjodNdQ=;
        b=dD4P4gTxOHfi+BR5I42Cjz0B6Qx+t63PfK9gMDaur0qppZxfqjvah4YXh2/mGr428H
         qqibi2Dyr8X22L523N1xE+KaZtp7y7MniwUQS63HHNagB+4uHX+rNbBMmbQrMc8FEtKe
         of7e9Me0XqLCipEi0fZcb166AmigvIpyv7rgJOA1ZAr88d9kza5Ogdn300lmM8NSKjXN
         MMLsz3hSOfLU4QIemgUAPbhHmsDuL6l9OKcg5TVQKrwn2AW/UP8eaPyJxdRJmkhZSt0Y
         S0IS3ytnO7lo9Snl811clZr1A8UKB3+i/L6LLIkzDwFfUSnBQOFbVDup89GLkNanUDUN
         YCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd/cuuGDRA+UIsZmS7qCaatntBP51oI0PvVML/wi3sEzd4YaFeWRxpY0I+bq3qAC2WIygArBM+0geTTOKZbiEcC2FUPD3UH8zk
X-Gm-Message-State: AOJu0YzBN99i9r5NGy2t/gq91WizoGG2wVDy2vQ15kVMgRa/SxW3fg+1
	Xs4aNYwo62QpEk2BWw5Rd7GinmBw7p7AHqwyVrJg2/CWe6Ik+e/nX7khXgI8CTk=
X-Google-Smtp-Source: AGHT+IHmzUi2TbBtme0odSfDU1TC2+t3uPVPFTob3sN4R2Cp/DWp8mmBV15oKa0Od4D/Mb6R0eVJaA==
X-Received: by 2002:a17:90b:388c:b0:2cb:4b08:1bbe with SMTP id 98e67ed59e1d1-2cf238cc96cmr388061a91.30.1721846178260;
        Wed, 24 Jul 2024 11:36:18 -0700 (PDT)
Received: from jesse-desktop.ba.rivosinc.com (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73a189esm1997830a91.2.2024.07.24.11.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:36:17 -0700 (PDT)
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
Subject: [PATCH v6 1/8] RISC-V: Add Zicclsm to cpufeature and hwprobe
Date: Wed, 24 Jul 2024 14:35:58 -0400
Message-ID: <20240724183605.4038597-2-jesse@rivosinc.com>
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

> Zicclsm Misaligned loads and stores to main memory regions with both
> the cacheability and coherence PMAs must be supported.
> Note:
> This introduces a new extension name for this feature.
> This requires misaligned support for all regular load and store
> instructions (including scalar and vector) but not AMOs or other
> specialized forms of memory access. Even though mandated, misaligned
> loads and stores might execute extremely slowly. Standard software
> distributions should assume their existence only for correctness,
> not for performance.

Detecing zicclsm allows the kernel to report if the
hardware supports misaligned accesses even if support wasn't probed.

This is useful for usermode to know if vector misaligned accesses are
supported.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
---
V1 -> V2:
 - Add documentation for Zicclsm
 - Move Zicclsm to correct location
V2 -> V3:
 - No changes
V3 -> V4:
 - Add definitions to hwprobe.rst
V4 -> V5:
 - No changes
V5 -> V6:
 - No changes
---
 Documentation/arch/riscv/hwprobe.rst  | 5 +++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 9 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index df5045103e73..78acd37b6477 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -207,6 +207,11 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`:  The Zicclsm extension is supported as
+        defined in the RISC-V RVA Profiles Specification. Misaligned support for
+        all regular load and store instructions (including scalar and vector) but
+        not AMOs or other specialized forms of memory access.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated. Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_PERF`, but the key was mistakenly
      classified as a bitmask rather than a value.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f64d4e98e67c..0b3bd8885a2b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,7 @@
 #define RISCV_ISA_EXT_ZVE64X		77
 #define RISCV_ISA_EXT_ZVE64F		78
 #define RISCV_ISA_EXT_ZVE64D		79
+#define RISCV_ISA_EXT_ZICCLSM		80
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 2fb8a8185e7a..023b7771d1b7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -65,6 +65,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 39)
 #define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 40)
 #define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 41)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 42)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1d6e4fda00f8..83c5ae16ad5e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -283,6 +283,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
 	__RISCV_ISA_EXT_SUPERSET(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e4ec9166339f..e910e2971984 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -96,6 +96,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZBB);
 		EXT_KEY(ZBS);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICCLSM);
 		EXT_KEY(ZBC);
 
 		EXT_KEY(ZBKB);
-- 
2.45.2

