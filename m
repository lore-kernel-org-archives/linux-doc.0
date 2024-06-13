Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A9130AC8
	for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 19:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718306212; cv=none; b=sSbQ90dlk3MJCPV96WbBxz7C/OjYjfYbiZJ/nCoDfF+gsoLdNjBVRT0gJ5BpwPo0v9LjXnCaWLBZZrtdSWsVezvKIRL1oh8iZXh/EEtVoqM3IvnnBGyAHFoz7U+uuVXXkqSV1nKE5SVLkfdUX92MV7dzGqnDg1YPHW4Ta8OZFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718306212; c=relaxed/simple;
	bh=8fU1mHwB9vYSLz5MPrnsBEqugzFF3wrR753n4UMKomU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awMYZfJDi9DxU2pT55QLgv5ebsHOUzyRPmtcdbjzAfE0Xsb4HQ2S/xchFVWl97mNuQ/y9Hgk4m6cecWT5Vvxiedo2x1pya/l0oWmyJTdcof5Wo6A+It9TeB3uFDEiStnJwp3RG51im9L1pgfoBoHiVOKXhqjTUCjKi+FzI3CzPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=FIDxqNrV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="FIDxqNrV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f6a837e9a3so9799925ad.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Jun 2024 12:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718306210; x=1718911010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG2srFmoIcbdvzr37LUHEYY5+MFhpHwRfzd3fbsl58g=;
        b=FIDxqNrVEYedrPu2WFE29XEvN7kNJP2zTBv0oJ7YskzX6v9gwERApbBl0VFu3fFIXg
         AV6jin8Eou/DdT2W43jQHjPdnDc3tJLyZSQVz3UfMaxcX4ZaLks8sD3q0TqaM6MyBZ5x
         07CtFN4ZiSsEYMitwuzuK75RM9Jwl3cq1tTGyO8e2L++qpffKUCwbZ1KTtB1VSGWriue
         20VarN5GAnD4oPHaq2pqvQ0bjwTvIRDzj++VjTT+ogj56EY/V32lfLJjEZJEI+5URpfj
         IEJeZRM0Snmc0Ck018H6Ku0IyWVdp+d3g/FrrC77LsaC2lUlFz2IVW+o/ggWncY31WdG
         3N2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718306210; x=1718911010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG2srFmoIcbdvzr37LUHEYY5+MFhpHwRfzd3fbsl58g=;
        b=JnqZLB5edSvVR+goZwKfXK2HrXbwwwCQvXyEhkLFuDRs4FX8e8yoSOvvxGwscG/uDX
         Wgyw19twJ+GmlT5mV1rxnTx8wD7JjNnrQpraYLXeaaaFGxFbFxEfozcR9KjMzii7W1Ru
         vy3ILChl1VqXtnGlf8yejO/qsdB5MwHdGfKaZ7i1/NC9ws/w14sef4rTZWnJoezRPwF6
         dufbDdel/RQ8UIaS7k2OL8rWycodBSok8twJEH7gG3I35lTAM8vl/vAvsi/vj1Nxduqv
         Wd8fG0t7F68YaY0GGLC/GxxJBRbG1sUK3ri/ilsyeKWpSZxnv6zpS6s4molGCftfARMI
         TIHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxp1nsd0s5+ggWMVJnY70i3pFuu9Ppko9HLiKjl3jwgSEyRjWiKbp6hiHuJUfxkvucbg1DdocOUC1c//edDdnAH1/EWU28HcaK
X-Gm-Message-State: AOJu0YxxeG3kj/kgFQfeXNkPHK94jtFCWlvKQQJe8H7HigdLHmIB6bpb
	qxGfrMeJP2K0yWiQoHcfDDCzEVs9ak0CO34odEPNOKvALkOvOvOQkfLgE1OSdJbgGcrO9FAOFgY
	t9ZU=
X-Google-Smtp-Source: AGHT+IGuN/l/5zfVYi7tKtQXsElXN0btBKGS7+gTuf5SnTUGY1GzvbrK3u85QYPF+7gnQUxWOLcnuQ==
X-Received: by 2002:a17:902:ea07:b0:1f3:266b:ea23 with SMTP id d9443c01a7336-1f8625c1641mr6730485ad.13.1718306209838;
        Thu, 13 Jun 2024 12:16:49 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855e7ca78sm17471015ad.106.2024.06.13.12.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 12:16:49 -0700 (PDT)
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
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/6] RISC-V: Add Zicclsm to cpufeature and hwprobe
Date: Thu, 13 Jun 2024 15:16:10 -0400
Message-ID: <20240613191616.2101821-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613191616.2101821-1-jesse@rivosinc.com>
References: <20240613191616.2101821-1-jesse@rivosinc.com>
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
---
V1 -> V2:
 - Add documentation for Zicclsm
 - Move Zicclsm to correct location
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 7 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index df5045103e73..7085a694b801 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -207,6 +207,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d is
     supported, as defined by version 1.0 of the RISC-V Vector extension manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported as
+       defined in the RISC-V RVA Profiles Specification.
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
2.43.0

