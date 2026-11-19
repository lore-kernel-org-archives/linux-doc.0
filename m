Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111395;
	b=kXvv+DK2qwJxZ4TUsHgEH4NtS8UvtIHcpB07Nd/08fO8MUj0StFOJ6+3NuU8SE/E9qeR
	 pAQy2P6s1BsCPLUi/Fv7dS5NRWVtKAr7bNrLdDL6uO9VCJmAz2Svxanx3yNpHcn5JKhmz
	 tHQdKDRjxJUWlkaegy0bv7H0M2QEnYYTu2CddC6JWKbZBdYdVe2Ina4EGjRSbh81XVynt
	 b/YtEmnJYerORkSRckh25ImkXTxMd7+GexKgUFDn91KlBXSYoIT5q4Zwm1E+z2zCrD7wR
	 cFotbU9zcvGue3mfaRLCjLhJIF139RguZ59csZ2nzKx99q6lVz6nwG7bglRrHQGrSmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111395;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=zy0Ws79dxKVLu+oOsUhRzSOdBCdq9d/+etUVYgpVtf0=;
	b=b0kgP4Fm1q1Ag6tpzuyDtMbT/ezbozjlUUENSVqq98/S9trFApMVh8qTBYcmW8zxokt8
	 YZoQ5T3XWKn/bKluFq/6Pk5Tdti1Lm/NBj6yFWvU8ZEDItNcVpP5jC3y7EtXypkoHJXsb
	 w+cNM6Rw2ykdV32Xt0peYtOL/gFZhfx3IL4azj7Hx6QdKy+MbmuWa1vqyFDYuxO6K9xp2
	 +ZbLsX/oefGI74+9jj5lZ8tNqNL4GpHXu4flbEoNRZ8wGSs2H7bbjqpVOdL0EXy12jIpS
	 4mpbYl0bEHSok7/Yh1+2EYYunkqOSkLpjUVQdeE3WASbgUTQk6WrSXtnayrq6La2+Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s9tCjLmN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9873360A2601;
	Thu, 19 Nov 2026 18:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9873360A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s9tCjLmN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DF3C19F0;
	Thu, 19 Nov 2026 10:03:11 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFC5B3F882;
	Thu, 19 Nov 2026 10:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795111394; bh=qQB0PKLS9Fat8jxA8iFULnpkX3TEytdBpFjp0NGDpMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s9tCjLmNvYXAYEH8yIzfsE5r+cavY9ScoFR8zpjFNXBJjantdzyIYDJUFcmkFkqLt
	 MRdOwcJpRlcO/iaeg7JAKh1AnHsPshkWWddX2MhjwC+pgxj6Q6w1Hm9J9dicB+bgPF
	 fFjytxyedj6SzsrGVA1wp1VwQxHuTk8Ak/sUOTbQ=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 19 Nov 2026 18:02:42 +0000
Subject: [PATCH 1/2] docs: arm64: Fix RST formatting in booting.rst
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-poe_booting_rst-v1-1-bbae0ab68498@arm.com>
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
In-Reply-To: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795111391; l=12568;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=qQB0PKLS9Fat8jxA8iFULnpkX3TEytdBpFjp0NGDpMk=;
 b=m/BLlfpJws35oreBLMrJRU9EdbfDYGhlTvs6KhqfnAqXhWoDxFxdH/+uVfcnoph7EWKlRAsGJ
 XgvvykfEKBUC567if+oeG8cWg+qCaP0vR98QXG0tg8lps+fDjxw9GuH
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=

Inconsistent indentation and missing blank lines in booting.rst
generate unintended blockquotes and nesting under earlier entries.

Fix the lists indentation (use 2 spaces everywhere) and add missing
empty lines. Also make sure all feature introductions are standalone
paragraphs, and remove excess indentation from the flags field table
(which also generated a blockquote).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 Documentation/arch/arm64/booting.rst | 148 ++++++++++++++++++-----------------
 1 file changed, 75 insertions(+), 73 deletions(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dae5ff9fae26..8f22aa7b2c0b 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -113,20 +113,20 @@ Header notes:
   Bit 0		Kernel endianness.  1 if BE, 0 if LE.
   Bit 1-2	Kernel Page size.
 
-			* 0 - Unspecified.
-			* 1 - 4K
-			* 2 - 16K
-			* 3 - 64K
+		* 0 - Unspecified.
+		* 1 - 4K
+		* 2 - 16K
+		* 3 - 64K
   Bit 3		Kernel physical placement
 
-			0
-			  2MB aligned base should be as close as possible
-			  to the base of DRAM, since memory below it is not
-			  accessible via the linear mapping
-			1
-			  2MB aligned base such that all image_size bytes
-			  counted from the start of the image are within
-			  the 48-bit addressable range of physical memory
+		0
+		  2MB aligned base should be as close as possible
+		  to the base of DRAM, since memory below it is not
+		  accessible via the linear mapping
+		1
+		  2MB aligned base such that all image_size bytes
+		  counted from the start of the image are within
+		  the 48-bit addressable range of physical memory
   Bits 4-63	Reserved.
   ============= ===============================================================
 
@@ -162,10 +162,10 @@ Before jumping into the kernel, the following conditions must be met:
 
 - Primary CPU general-purpose register settings:
 
-    - x0 = physical address of device tree blob (dtb) in system RAM.
-    - x1 = 0 (reserved for future use)
-    - x2 = 0 (reserved for future use)
-    - x3 = 0 (reserved for future use)
+  - x0 = physical address of device tree blob (dtb) in system RAM.
+  - x1 = 0 (reserved for future use)
+  - x2 = 0 (reserved for future use)
+  - x3 = 0 (reserved for future use)
 
 - CPU mode
 
@@ -212,6 +212,7 @@ Before jumping into the kernel, the following conditions must be met:
   state.
 
   For all systems:
+
   - If EL3 is present:
 
     - SCR_EL3.FIQ must have the same value across all CPUs the kernel is
@@ -227,56 +228,57 @@ Before jumping into the kernel, the following conditions must be met:
 
   - If the kernel is entered at EL1 and EL2 is present:
 
-      - ICH_HFGRTR_EL2.ICC_PPI_ACTIVERn_EL1 (bit 20) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_PPI_PRIORITYRn_EL1 (bit 19) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_PPI_PENDRn_EL1 (bit 18) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_PPI_ENABLERn_EL1 (bit 17) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_PPI_HMRn_EL1 (bit 16) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_IAFFIDR_EL1 (bit 7) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_ICSR_EL1 (bit 6) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_PCR_EL1 (bit 5) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_HPPIR_EL1 (bit 4) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_HAPR_EL1 (bit 3) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_CR0_EL1 (bit 2) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_IDRn_EL1 (bit 1) must be initialised to 0b1.
-      - ICH_HFGRTR_EL2.ICC_APR_EL1 (bit 0) must be initialised to 0b1.
-
-      - ICH_HFGWTR_EL2.ICC_PPI_ACTIVERn_EL1 (bit 20) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_PPI_PRIORITYRn_EL1 (bit 19) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_PPI_PENDRn_EL1 (bit 18) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_PPI_ENABLERn_EL1 (bit 17) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_ICSR_EL1 (bit 6) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_PCR_EL1 (bit 5) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_CR0_EL1 (bit 2) must be initialised to 0b1.
-      - ICH_HFGWTR_EL2.ICC_APR_EL1 (bit 0) must be initialised to 0b1.
-
-      - ICH_HFGITR_EL2.GICRCDNMIA (bit 10) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICRCDIA (bit 9) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDDI (bit 8) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDEOI (bit 7) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDHM (bit 6) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDRCFG (bit 5) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDPEND (bit 4) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDAFF (bit 3) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDPRI (bit 2) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDDIS (bit 1) must be initialised to 0b1.
-      - ICH_HFGITR_EL2.GICCDEN (bit 0) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_PPI_ACTIVERn_EL1 (bit 20) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_PPI_PRIORITYRn_EL1 (bit 19) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_PPI_PENDRn_EL1 (bit 18) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_PPI_ENABLERn_EL1 (bit 17) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_PPI_HMRn_EL1 (bit 16) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_IAFFIDR_EL1 (bit 7) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_ICSR_EL1 (bit 6) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_PCR_EL1 (bit 5) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_HPPIR_EL1 (bit 4) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_HAPR_EL1 (bit 3) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_CR0_EL1 (bit 2) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_IDRn_EL1 (bit 1) must be initialised to 0b1.
+    - ICH_HFGRTR_EL2.ICC_APR_EL1 (bit 0) must be initialised to 0b1.
+
+    - ICH_HFGWTR_EL2.ICC_PPI_ACTIVERn_EL1 (bit 20) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_PPI_PRIORITYRn_EL1 (bit 19) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_PPI_PENDRn_EL1 (bit 18) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_PPI_ENABLERn_EL1 (bit 17) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_ICSR_EL1 (bit 6) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_PCR_EL1 (bit 5) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_CR0_EL1 (bit 2) must be initialised to 0b1.
+    - ICH_HFGWTR_EL2.ICC_APR_EL1 (bit 0) must be initialised to 0b1.
+
+    - ICH_HFGITR_EL2.GICRCDNMIA (bit 10) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICRCDIA (bit 9) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDDI (bit 8) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDEOI (bit 7) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDHM (bit 6) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDRCFG (bit 5) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDPEND (bit 4) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDAFF (bit 3) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDPRI (bit 2) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDDIS (bit 1) must be initialised to 0b1.
+    - ICH_HFGITR_EL2.GICCDEN (bit 0) must be initialised to 0b1.
 
   - The DT or ACPI tables must describe a GICv5 interrupt controller.
 
   For systems with a GICv3 interrupt controller to be used in v3 mode:
+
   - If EL3 is present:
 
-      - ICC_SRE_EL3.Enable (bit 3) must be initialised to 0b1.
-      - ICC_SRE_EL3.SRE (bit 0) must be initialised to 0b1.
-      - ICC_CTLR_EL3.PMHE (bit 6) must be set to the same value across
-        all CPUs the kernel is executing on, and must stay constant
-        for the lifetime of the kernel.
+    - ICC_SRE_EL3.Enable (bit 3) must be initialised to 0b1.
+    - ICC_SRE_EL3.SRE (bit 0) must be initialised to 0b1.
+    - ICC_CTLR_EL3.PMHE (bit 6) must be set to the same value across
+      all CPUs the kernel is executing on, and must stay constant
+      for the lifetime of the kernel.
 
   - If the kernel is entered at EL1:
 
-      - ICC_SRE_EL2.Enable (bit 3) must be initialised to 0b1
-      - ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b1.
+    - ICC_SRE_EL2.Enable (bit 3) must be initialised to 0b1
+    - ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b1.
 
   - The DT or ACPI tables must describe a GICv3 interrupt controller.
 
@@ -285,11 +287,11 @@ Before jumping into the kernel, the following conditions must be met:
 
   - If EL3 is present:
 
-      ICC_SRE_EL3.SRE (bit 0) must be initialised to 0b0.
+    - ICC_SRE_EL3.SRE (bit 0) must be initialised to 0b0.
 
   - If the kernel is entered at EL1:
 
-      ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b0.
+    - ICC_SRE_EL2.SRE (bit 0) must be initialised to 0b0.
 
   - The DT or ACPI tables must describe a GICv2 interrupt controller.
 
@@ -380,7 +382,7 @@ Before jumping into the kernel, the following conditions must be met:
     - SMCR_EL3.LEN must be initialised to the same value for all CPUs the
       kernel will execute on.
 
- - If the kernel is entered at EL1 and EL2 is present:
+  - If the kernel is entered at EL1 and EL2 is present:
 
     - CPTR_EL2.TSM (bit 12) must be initialised to 0b0.
 
@@ -405,7 +407,7 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SMCR_EL3.FA64 (bit 31) must be initialised to 0b1.
 
- - If the kernel is entered at EL1 and EL2 is present:
+  - If the kernel is entered at EL1 and EL2 is present:
 
     - SMCR_EL2.FA64 (bit 31) must be initialised to 0b1.
 
@@ -425,7 +427,7 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SMCR_EL3.EZT0 (bit 30) must be initialised to 0b1.
 
- - If the kernel is entered at EL1 and EL2 is present:
+  - If the kernel is entered at EL1 and EL2 is present:
 
     - SMCR_EL2.EZT0 (bit 30) must be initialised to 0b1.
 
@@ -452,11 +454,11 @@ Before jumping into the kernel, the following conditions must be met:
 
   For CPUs with the Performance Monitors Extension (FEAT_PMUv3p9):
 
- - If EL3 is present:
+  - If EL3 is present:
 
     - MDCR_EL3.EnPM2 (bit 7) must be initialised to 0b1.
 
- - If the kernel is entered at EL1 and EL2 is present:
+  - If the kernel is entered at EL1 and EL2 is present:
 
     - HDFGRTR2_EL2.nPMICNTR_EL0 (bit 2) must be initialised to 0b1.
     - HDFGRTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
@@ -493,7 +495,7 @@ Before jumping into the kernel, the following conditions must be met:
 
     - SCR_EL3.TCR2En (bit 43) must be initialised to 0b1.
 
- - If the kernel is entered at EL1 and EL2 is present:
+  - If the kernel is entered at EL1 and EL2 is present:
 
     - HCRX_EL2.TCR2En (bit 14) must be initialised to 0b1.
 
@@ -513,7 +515,7 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGRWR_EL2.nPIRE0_EL1 (bit 57) must be initialised to 0b1.
 
- - For CPUs with Guarded Control Stacks (FEAT_GCS):
+  For CPUs with Guarded Control Stacks (FEAT_GCS):
 
   - GCSCR_EL1 must be initialised to 0.
 
@@ -527,7 +529,7 @@ Before jumping into the kernel, the following conditions must be met:
 
     - GCSCR_EL2 must be initialised to 0.
 
- - If the kernel is entered at EL1 and EL2 is present:
+  - If the kernel is entered at EL1 and EL2 is present:
 
     - HCRX_EL2.GCSEn must be initialised to 0b1.
 
@@ -545,17 +547,17 @@ Before jumping into the kernel, the following conditions must be met:
 
     - HFGWTR_EL2.nGCS_EL0 (bit 52) must be initialised to 0b1.
 
- - For CPUs with debug architecture i.e FEAT_Debugv8pN (all versions):
+  For CPUs with debug architecture i.e FEAT_Debugv8pN (all versions):
 
- - If EL3 is present:
+  - If EL3 is present:
 
-   - MDCR_EL3.TDA (bit 9) must be initialized to 0b0
+    - MDCR_EL3.TDA (bit 9) must be initialized to 0b0
 
- - For CPUs with FEAT_PMUv3:
+  For CPUs with FEAT_PMUv3:
 
- - If EL3 is present:
+  - If EL3 is present:
 
-   - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
+    - MDCR_EL3.TPM (bit 6) must be initialized to 0b0
 
   For CPUs with support for 64-byte loads and stores without status (FEAT_LS64):
 

-- 
2.56.0

