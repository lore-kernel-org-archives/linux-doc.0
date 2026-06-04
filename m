Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010020.outbound.protection.outlook.com [52.101.46.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4033C2BD59C;
	Thu,  4 Jun 2026 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780614807; cv=fail; b=G9KP2oi8hjp5S4n779mFH+8Omb6nz2ENkZUWPNV700DfO02jj8WTQAeyYhJjc6kvwbcPmO1f4Gp1hI74wOnbz9WYJHRCSh3NJ7FkCZSK1CQNPoii3TjKqIP3VSTzjVHi979/brWGhyi6eq2jRXgJYUvy9+Bu9r4xuEFrlHSZ1pI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780614807; c=relaxed/simple;
	bh=lO4dWF4VDxitj+Iby3wStcyrrRs+Xsz93ArI5nRqsOY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MUFUB2uHKaXfJsXVxYI/hO0rAys2dpnovRxfGUMmccAM+6fnaCkPaJDRQrZfxpR/kDc7dGYfQSJzgh1yku8CL5ZGD8GiHDlUQtpWuCV3YJ1H5eEs2VVuUbEBhn40lRyTquK9E6NQloUkOZbLnmd35lK4/fq1prMw187E1qoHR3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HZulaCwi; arc=fail smtp.client-ip=52.101.46.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HZulaCwi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HplMoZgnILWQxJKkLyllZeijbNsG6IYRxORO2jUXezrrl1IwjgGTzSBjCraiU32abmye7Cod6DxVnPRX7Ip7eRObQVnmZHmIwhv+FUo+obT/pi6RVexyHIKp9NZCK761cDFpO32ijww/+VaeQ6nP/GtpY3vhpsNDl6DhIF3xFGYZ1Cvf6NYxlur11OdwlVD1lKD/CNQUe2otS/ftoMAUxaMqviXNXn9q6yiBIoqWs1fNc5TionyCzjytyZkijpAXzfIVf+Ad2R7vFnvTCUSbK7lfMYAvc3h8NWyIadXU+xQKHVoHMm+VA6awyqSImy8wMSjvo5CN7971RghLfzjx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVPWW/rTErEHg8JlbCNZWkInNB0GqJH6pwjsFz1ahGU=;
 b=lhxO5R/Q9vVv1UHFHiRvplxHRwGPCmVSfo+4/PPskAJRYseBJzmgUqU7jYzZIkrer2xLsM3nMRYX8JijXeCE4nfhZmCH1p6kR0T5BrFpn/Cffybycst0KTXupmhkBjQutWwBZ0hgtHFenh/fJrA1KzrTawWBjqtnwUn6aK7Ffr+/qwmBvzsvvRScXW0dghCRXAcJ64YHYtZt1q5iIuFsTopHXQ0NvtA6+eUrlEeqY8GW5VXczJJNAFDVBR5KHurJ5hxOsBuRS7CThoEfoFEseIdRi1/vY2GuW2P2q0R/csv6Fu/5LygSc52bl3oKWbtxuClLTETnO43iNzDeaZ4fJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVPWW/rTErEHg8JlbCNZWkInNB0GqJH6pwjsFz1ahGU=;
 b=HZulaCwiQAaYkCTu6YHrwsE/lMU9MYN2XPP1aec+hVSegehSYwjLw8lwayjK7SCsRXtXssWJnsmk7iasT80II//QO/t2wXLq59RdpXH6/N6ayT9l44+lWZMdJK+z4Xrm8b9prOQNZeCtvFolIjj/g3m6yygJGbuOqA/kw+unltE9/GaEborqdwtZQKHnufa/9Ve5ZRHO5A/dM5/VZ3r4DVvu/RvjihCVBQT6m1fgJ28CEoRDewTh5vjbmF7FfjbG0GLXKgDHwz8/L/3rvFVc8ay/2zM8qutPDtOHWs8Y6LI3H/3d2FxkOxGFDWKrjE09zJXoiUNa5NLNKJVbwWK7eg==
Received: from CH0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:610:11a::27)
 by PH8PR12MB7207.namprd12.prod.outlook.com (2603:10b6:510:225::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 23:13:18 +0000
Received: from CH2PEPF00000099.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::36) by CH0PR03CA0337.outlook.office365.com
 (2603:10b6:610:11a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 23:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH2PEPF00000099.mail.protection.outlook.com (10.167.244.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 23:13:17 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 16:12:59 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 4 Jun 2026 16:12:58 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Jun 2026 16:12:58 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: Mark Rutland <mark.rutland@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
Subject: [PATCH v1] arm64: errata: Workaround NVIDIA Olympus device store/load ordering erratum
Date: Thu, 4 Jun 2026 18:12:54 -0500
Message-ID: <20260604231254.1904988-1-sdonthineni@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000099:EE_|PH8PR12MB7207:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a67796d-9efb-4ec4-23f6-08dec28edccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099006|6133799003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fuYEq/M2ttIJZ2PgOHXE63pHrZrhDVgn3wXbclPmXiQ+nL1Qm/8emHro0L+aKDDZcUVx7/MMk5ZyWRb7cWfIeQfU927DV0LGLG0s5tWCZWBRgpSMlYKw6Cm3wBON97vC8BlWW3jCozrkYCMktCA1iUMcji0nBQ7OmNYuWdNFAQEwYaSN4ghODlCdTeFXV1nmliWHJNM0jn0EgwRewCcTkN7aFSGs91/Zv8ofwWMszIgikNRS8iZu4rrolog6u1Wea77J79g4PnYUx3Gg4K14bZXRtQlaNhZy7wYkxhVYRLb0Zdvi9BpWtEqPonXV7TyDgYjH7zGQJ3Tdnb1pjeacwEiJw5VGFInO0EIkI+yEyBISTw3vb7wuJm4pFcfVctbuqxiVkrL2qpqbHFiRpQsQ3axr9nDxBgyJbu+bSc0/L4RAi1+7rR3aBhaJ0ZEGT9YSmtgiTnp3stO8zq0NWnaL0CmmmQg7NHVAdrP47/pIKFX80KaN2CgQBeJq3A5eD2iK55oYn7aWOGWKEXP2rgKQ/f9gdS3VPk1ZaZ5LJks0irsY3pgg0N6NK/if1++bblT1PVaV1paUSXeTtT80Go8R0WsC/zexFtDbVl39iABEH2kh5SiKQss/5hVCyPaULOuYk4VR8GQS9dW96yPsF0RAwpEU34SBR+46cP4qKPM3kFg7g8ZhLi+S+LLVyudhRd7hdl7dv98IMJEYETKz/qugfn5R0TF9skqJHvJx4vDuP/4=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099006)(6133799003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Tx3rofMK4144mbKcZGE62roQtJi8VdvgZS+5U/11TWmeF0ywr+I/3mGqLrYdoAL8kNkThNIIPJit4JzdmPUnlAguLgLp1kXeauKfYDgOix6vPoKWNm9MsUfJJRK2j3+bWHTsvnDi5mn6Mu9PGOwtxHdx2hloNjDXXVqAS133yJwn8roJvmXedMbp+H85FyKIe8nNqJueVhuIMxtcTZxpE8S39ZuO7zkcs5sej5F8t+aun5QU87u165z4eIEKpyGgUzCDu1VpwnUorMIybHHdApLIRIvoWKJsTVcR9qsQE/c69ErgXiOyIY/TH+3EbXgzM6vwGlhODW3BWKTsMZdGG55v7WG9ISFzxP1ZUabGTI/BVnrSgq2dT6owJevkPZ8iq5EjU3fohx446ID83t9zdFFhBalWZtDxn/6u+ANtyK9k975o82mQtFbbvf4LDxe5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 23:13:17.7024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a67796d-9efb-4ec4-23f6-08dec28edccf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000099.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7207

On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
observed by a peripheral before an older, non-overlapping Device-nGnR*
store to the same peripheral. This breaks the program-order guarantee
that software expects for Device-nGnR* accesses and can leave a
peripheral in an incorrect state, as a load is observed before an
earlier store takes effect.

The erratum can occur only when all of the following apply:

  - A PE executes a Device-nGnR* store followed by a younger
    Device-nGnR* load.
  - The store is not a store-release.
  - The accesses target the same peripheral and do not overlap in bytes.
  - There is at most one intervening Device-nGnR* store in program
    order, and there are no intervening Device-nGnR* loads.
  - There is no DSB, and no DMB that orders loads, between the store and
    the load.
  - Specific micro-architectural and timing conditions occur.

Two ways to restore ordering: insert a barrier (any DSB, or a DMB that
orders loads) between the store and the load, or make the store a
store-release. A load-acquire on the load side would not help, because
acquire semantics do not prevent a load from being observed ahead of an
older store; only the store side (release or a barrier) closes the
window.

Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
to stlr* (Store-Release), which removes the "store is not a
store-release" condition for every device write the kernel issues.
Because writel() and writel_relaxed() are both built on __raw_writel()
in asm-generic/io.h, patching the raw variants covers both the
non-relaxed and relaxed APIs without touching the higher layers. Note
that writel()'s own barrier sits before the store, so it does not order
the store against a subsequent readl(); the store-release promotion is
what provides that ordering.

Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
the plain str* sequence.

Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 23 ++++++++++++++++++++
 arch/arm64/include/asm/io.h                 | 24 ++++++++++++++-------
 arch/arm64/kernel/cpu_errata.c              |  8 +++++++
 arch/arm64/tools/cpucaps                    |  1 +
 5 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 211119ce7adc..899bed3908bb 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -256,6 +256,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
++----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fe60738e5943..a6bac84b05a1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
 
 	  If unsure, say Y.
 
+config NVIDIA_OLYMPUS_1027_ERRATUM
+	bool "NVIDIA Olympus: device store/load ordering erratum"
+	default y
+	help
+	  This option adds an alternative code sequence to work around an
+	  NVIDIA Olympus core erratum where a Device-nGnR* store can be
+	  observed by a peripheral after a younger Device-nGnR* load to the
+	  same peripheral. This breaks the program order that drivers rely
+	  on for MMIO and can leave a device in an incorrect state.
+
+	  The workaround promotes the raw MMIO store helpers
+	  (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
+	  required ordering. Because writel() and writel_relaxed() are built
+	  on __raw_writel(), both are covered without changes to the higher
+	  layers.
+
+	  The fix is applied through the alternatives framework, so enabling
+	  this option does not by itself activate the workaround: it is
+	  patched in only when an affected CPU is detected, and is a no-op on
+	  unaffected CPUs.
+
+	  If unsure, say Y.
+
 config ARM64_ERRATUM_834220
 	bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
 	depends on KVM
diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 8cbd1e96fd50..b6d7966e9c19 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -25,29 +25,37 @@
 #define __raw_writeb __raw_writeb
 static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
 {
-	volatile u8 __iomem *ptr = addr;
-	asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("strb %w0, [%1]",
+				 "stlrb %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writew __raw_writew
 static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
 {
-	volatile u16 __iomem *ptr = addr;
-	asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("strh %w0, [%1]",
+				 "stlrh %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writel __raw_writel
 static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
 {
-	volatile u32 __iomem *ptr = addr;
-	asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("str %w0, [%1]",
+				 "stlr %w0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_writeq __raw_writeq
 static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
 {
-	volatile u64 __iomem *ptr = addr;
-	asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
+	asm volatile(ALTERNATIVE("str %x0, [%1]",
+				 "stlr %x0, [%1]",
+				 ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+		     : : "rZ" (val), "r" (addr));
 }
 
 #define __raw_readb __raw_readb
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 5377e4c2eba2..958d7f16bfeb 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -809,6 +809,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
 	},
 #endif
+#ifdef CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM
+	{
+		/* NVIDIA Olympus core */
+		.desc = "NVIDIA Olympus device load/store ordering erratum",
+		.capability = ARM64_WORKAROUND_DEVICE_STORE_RELEASE,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_TRBE_OVERWRITE_FILL_MODE
 	{
 		/*
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 811c2479e82d..d367257bf770 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -120,6 +120,7 @@ WORKAROUND_CAVIUM_TX2_219_PRFM
 WORKAROUND_CAVIUM_TX2_219_TVM
 WORKAROUND_CLEAN_CACHE
 WORKAROUND_DEVICE_LOAD_ACQUIRE
+WORKAROUND_DEVICE_STORE_RELEASE
 WORKAROUND_NVIDIA_CARMEL_CNP
 WORKAROUND_PMUV3_IMPDEF_TRAPS
 WORKAROUND_QCOM_FALKOR_E1003
-- 
2.43.0

