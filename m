Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8B4320CAD;
	Tue,  9 Jun 2026 23:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781048565; cv=fail; b=Hcc1iZCY+52pRS9IH7wiV7QCG0luA+u5CYPtmoidyWZw4nb9iRn2yf+V+Wjvz+MT2D4ATPM3x3+kXhuVuMYzlNx9HW+V31d978X5jctDdFEv/JHI1fb/7O5gwEEGkotRN/ieE5rlV0gBfWqCFcOdPHXd17QRRqPJ/IBvWWBvK9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781048565; c=relaxed/simple;
	bh=43btWodr7p+mAGMPwiO2pHk+hgtdU6G8SOWnaPCFiQU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=H89gvSD+0BiOhiAffvP44roSzZI78DW6eZX2b8QnVMl/eIV4Vz2DfRVZK64cQOX767QarTE3bCstvNefHB4Wd7WetbyrT7pJ2f4Kd/ASYWWf8wJQ0JvBbjwnILB6FZaQ+CZgLU+QfCDDKk+MjBk7SO10Om5wDuOZWsVYLfcOtdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RoAJShWH; arc=fail smtp.client-ip=52.101.57.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RoAJShWH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHQqpZOaKwX3WSwWBUQwhwrzfe2ulnOMYbQNzhFxIETxP1SaIp5R6nly88RpL1q0bZ5UTQQey+ENzh9U7kg7TOwlIXmWgDULWaSdZZ3vMPO9bvb46dSiUbKNwc3o2hXTAGhSWxByqu22KBzdKGK3GtfQnByJw94rpr8d1f1+J8ESzhjaqrBHWWOWdnhwhGJJPWTmzSaQ0/JYP83dZao67py7hC/c8s+6Mabbn4W58uM7qALuvpi80Ha/jezxL1j9W4DJucYVrGfwlGywFivIRtVJL4NLxsUR7qssyjM2Y8csat7cHcht8eZTO1qzbETsa5/hMifPjSEWufRA7OcKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zofyvuanNtU7rvhrOWQ/U6Dpwf7zRWxjdAcD9akXNkM=;
 b=avLQJbDlg12eO+V+teymozGlq93sITkFyTTCWG6cTw8wtzeM+0H98FTqr4joRwFbXWFjBDapdWx1zgQx32jeM0c3ZO4klgIwgFzhJc0jHkd6isa0ePQ8c1eMg+xpcp2q5ieKslm33LvFTHcyWfrx6rUZ0FM4INm0BTDLGhmSda+2YlCOgzovczp2G3hta9HbF0quKChakhfbcg+8q9ECxAlwSvKk7RMsOwg2yledoqi67OPwCZSA6VxNQXcBhXdfGKxBFPt1dkoMtWWYIsxd/2bTPLw2p98hjyDouTR7cwGFsaU6p9cAtViQ5wU1TENvwTbrQxCdDtfHWE7s8JvhEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zofyvuanNtU7rvhrOWQ/U6Dpwf7zRWxjdAcD9akXNkM=;
 b=RoAJShWHheA7uGlGSrRJqmjdwq+p+sru90wwc7pJPXvjwjW46elXw2Cf14IdX9188TDw9bn3kkjXcaIq9xmhkqaW3Ouc8aPTjTooRpdlQvjCdVgVWYNquuTJMbkIO+1/XQpyyiKGGJcIhQfb/lOocH4y45R41EKerssAA58j29rnne7zIXsrFNDc/si01HBjv62+A7lHXgVvAv0sAH86XwDY+Svge2V1OO0XvX/14RfGnCHnyPxK5WLj9tk7iq7iJ7LmV+pDSZPUreZztQoN3GvIhBJ7nUSDWpxGeg61Tkfy7nDxkJRcW8mME7yk76l1SvvVTjSjWEGKiM9JSLrplA==
Received: from CH2PR16CA0027.namprd16.prod.outlook.com (2603:10b6:610:50::37)
 by SN7PR12MB6713.namprd12.prod.outlook.com (2603:10b6:806:273::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 23:42:37 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::65) by CH2PR16CA0027.outlook.office365.com
 (2603:10b6:610:50::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Tue, 9
 Jun 2026 23:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 23:42:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Jun
 2026 16:42:20 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Jun
 2026 16:42:20 -0700
Received: from sdonthineni01.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Jun 2026 16:42:19 -0700
From: Shanker Donthineni <sdonthineni@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Shanker
 Donthineni" <sdonthineni@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>,
	"Jason Sequeira" <jsequeira@nvidia.com>, Alok Mooley <amooley@nvidia.com>,
	Rich Wiley <rwiley@nvidia.com>
Subject: [PATCH v1] arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU
Date: Tue, 9 Jun 2026 18:40:44 -0500
Message-ID: <20260609234044.3945938-1-sdonthineni@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|SN7PR12MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ba13fe-6f9e-4adb-dd8d-08dec680c98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|13003099007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	fGpgwPY891hDbpCH4UEiXQ5dDcIuLpiadmdJTtRf9yjwxoHPyi2NrCti4ydVIEbO0fN12zCFE423nmlxZ+x0tsmZYQD6JsscnG/P/BJrrpglc6nB7q8GG3u6uPDvkM5mIKWZcXQRnAiWk8/FiMcI6bvMh5hSaM85lvztt0YrrLESvV5NF4GfnWi6rmLrXgtR9dwNxyOyPGOVVm/ChItcRRK/je1DHbWR2Eri4lqRK8EEGSz13oyOKZqjkfZSe942ClE4SQHo+CGfbOOn0cgT+jNgK10k21dMqxfSJDu69eyezgqMWo0LVlACQi32g3bzofsxSwp7sA/1iLvHHBnlPDawgM7W0hrO5gxju8k1fSY27SGyTPfN5EqR/4SdfSHViB7J65II8KKofOfE5z5XzCXUS2Uv1Hov7pqkbwe9URu4t6wTVIQNM9WrGu+gV+JJo+k93kcxto0U/PztyXmVJmuZCX/FswSyh9f11Ri8OmxTnrNCvDmd0Gqy3uT99By2fk5LnuI5nA9Us0CjMcOtEo2blHyFLvzEnLWBOFpXzvJa3YOu1/HZvimRJPxGST0q0CL+or2v3BEqEjgjIKrpgGNsGfAIwUSIKHuVX7khrENGy+qce4M1OpZbnzXoKxsUlJyKJZ1z9HpQAxszn2r1hWf3I1efc0+bieRPUfCnCxT2f86GCxIMjhoxh2y2gavF7on8lbgFpTll6M6h9t2bLzMZNsj5GpeCS+eEfDHV+zxRFf4m7HaM3Ruo8Oud87un
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(13003099007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lHQtqpUu8t8eEO7gOr8Y6QQ9IETcyaEwqfLWkVFHbte9m1Aovuik+EO8X7DizyQP44Z02HcUZjHM2dFDF1LCQXrnk1jHDY7/LR6S+oL9XTYDcaccaiEJk1HESJikdVjVGpM34otLuAs5HwaFArwlSChEBkIM0FTXlcNwBNSRylr9Vp9xfsbc0EZWd/vMMp3bwQAa6RGPFmrE74V+BT7XwVvdSNPKQixwX6N7Csax343QsdYZAVhNEMWcd+AL3Bqj4oXCrVL617kGa2q82cWeO3gC4KFax49bV48vKiYaS5Wue/vlANdOpl077I+8Nr5I5Fa/nw1p0V/sq38gHRNs921GO9ck4nR2IVnhywZWKA6vXTpmbLQ3onqnf4oKLu6I7W7jyEA3NkmEWXYy+d4OKEHA0Nsxxh6kIvsgppsdpmqOg8hYZpEbYzka9gFWPHiE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 23:42:37.1536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ba13fe-6f9e-4adb-dd8d-08dec680c98d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6713

NVIDIA Olympus cores are affected by the TLBI completion issue tracked as
CVE-2025-10263. The existing ARM64_ERRATUM_4118414 handling already uses
ARM64_WORKAROUND_REPEAT_TLBI to issue an additional broadcast TLBI;DSB
sequence and ensure affected memory write effects are globally observed.

Add MIDR_NVIDIA_OLYMPUS to the repeat-TLBI match list so the same
mitigation is enabled on affected Olympus systems. Also document the
NVIDIA Olympus erratum in the arm64 silicon errata table and list it in
the Kconfig help text.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
---
Note: This patch depends on the following series as a prerequisite:
https://lore.kernel.org/all/20260609101203.1512409-1-mark.rutland@arm.com/

 Documentation/arch/arm64/silicon-errata.rst | 2 ++
 arch/arm64/Kconfig                          | 3 ++-
 arch/arm64/kernel/cpu_errata.c              | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index a01e916ede17..ad09bbb10da8 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -298,6 +298,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
++----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 | NVIDIA         | T241 MPAM       | T241-MPAM-1     | N/A                         |
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 48233b54c482..c65cef81be86 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1155,7 +1155,7 @@ config ARM64_ERRATUM_4193714
 	  If unsure, say Y.
 
 config ARM64_ERRATUM_4118414
-	bool "Cortex-*/Neoverse-*/C1-*: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"
+	bool "Cortex-*/Neoverse-*/C1-*/Olympus: Completion of affected memory accesses might not be guaranteed by completion of a TLBI"
 	default y
 	select ARM64_WORKAROUND_REPEAT_TLBI
 	help
@@ -1182,6 +1182,7 @@ config ARM64_ERRATUM_4118414
 	  * ARM Neoverse-V2 erratum 4193787
 	  * ARM Neoverse-V3 erratum 4193784
 	  * ARM Neoverse-V3AE erratum 4193784
+	  * NVIDIA Olympus erratum T410-OLY-1029
 
 	  On affected cores, some memory accesses might not be completed by
 	  broadcast TLB invalidation.
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index fe6fe5de495b..d597896b0f7f 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -364,6 +364,7 @@ static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V2),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V3AE),
+			MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
 			{}
 		})),
 	},
-- 
2.43.0

