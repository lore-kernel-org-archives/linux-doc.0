Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7B03A9DA3;
	Fri, 17 Jul 2026 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322860; cv=fail; b=LXLa/FSKSblJxZIakB0bxYdoZ+suvB9DpzYR/5vq8hGZyInalXav7meRdGrSPx1VpCSiUb0qjLfjngqjOoTVZDLo4cFWMO45atQncPurcKtnNJHmUaFYlBXBap3FKod97DbitoIJkLy5Oy/ZUOre8kVDEynU+GFetES/J1hb6E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322860; c=relaxed/simple;
	bh=J+yuMNnqOoKc4nMF6K0k6BniVY89UrFm9x577XQCR+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dctrZFkt7w7WuDISnRtjDrnb1DQlI47UT3/PkQohaY1cng3KjXnceGyWrSs83qlkTrZ288UHwbPeXXwJqhujmR4cz6/2nMgFk62aQY3Kt80aUjia+yFeoJE7jxO3bJf/t0zMEDOTCZGK0gQCqGmhYtfgRKclp4etP5WCBx2I0OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iJK9nchS; arc=fail smtp.client-ip=52.101.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iJK9nchS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiAZRouSFPHFi+5QyzTslUAqqbPD08CAgM3OvhSq15q8T3gq+GxCsq4p0y7WAw7MbKwvQyjs/yLBwQkhTT7GFEy1M8XBzyYoTbViAxLy1y7MCQFzGFqRgp9RsgxaUol/NJ8zKL+cv+wAeRe0aoK0oBaEBSlIDix+v6qz9ni7BER87dvKIrz5Qn6/sh8SHVc4nTFdClJJQOtImYCi4btP7mP9O6WMBRU0KA6YbImR78oQXEpDw+051jYpupuPDBNc4U8LQ1mvk++JyQ4FAGAQeh3/9a+898QTwdSiCQqU0TFbT7Hux2mvsDJrPO1Tyg2hD3g+l/tO1uxKwp5RavAnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jITz6iZhx5MajKuSPgllddeSp4/HvP3KXT4grjVCozg=;
 b=a6Y47LMl1B/EwkvVM18ijNPc1xxqkUd9fLmtlKNmnwsqcIC8YVOqXggI692pCrp3txfRpH87OMLBD6iJ3AKVKHmmdW3pnFJkmo92n3497hbuCmLOQtgEJJAEdY+zGRwOpyaBD9xx4IOchr+aLrYOMk5SY7N5Rg7yWRwbA2id0foU2frpgOwWadMjuwVxy5I5S1MuLpqhqfxq1a98DWGU2YM56fOLEdbs38ZPyMEkX3V8gI3CN8EhOydQ+9iQhrR+mr+qeWroLmracAdPtCzHQxlPSEsP1bCPUMvSbBePsIC99XVppmyb6ygFrHLtU/lobKAWgQYYwFWsmIkwjamh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jITz6iZhx5MajKuSPgllddeSp4/HvP3KXT4grjVCozg=;
 b=iJK9nchSoDszmdvKTIha882bIH09cXSSHtzzZFrXFKy5SRLtP1eoxkf9vCQm0QyWwoXQpJ2i9T4hylhAv6MbqrOpmOzqVo5+oJfZiFfa4edSCOIAZOSwPknlXRGPq08jpTpoAOx9ZGZCuF3s2uNaehECmuZcygEw0jmu9D1jS88=
Received: from BY3PR10CA0029.namprd10.prod.outlook.com (2603:10b6:a03:255::34)
 by DS0PR12MB6607.namprd12.prod.outlook.com (2603:10b6:8:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 21:14:11 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:a03:255:cafe::90) by BY3PR10CA0029.outlook.office365.com
 (2603:10b6:a03:255::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 21:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 21:14:10 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 16:14:09 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
Subject: [PATCH 2/2] x86/resctrl: Fix ABMC counter programming for extended counter ranges
Date: Fri, 17 Jul 2026 16:13:56 -0500
Message-ID: <980f39d3a0e0d9f73925e362f835aeef070a1bc5.1784322818.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|DS0PR12MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: 26630fd5-9c1e-427a-35c0-08dee44858b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|3023799007|11063799006|6133799003|10067099003|56012099006|22082099003|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	sdw3sLKdnPNBgd4HwlLIhf3+b/ElKvh57HYVNLEMhSC2pVtyH7fR/q4DlOcQGO0Azbd+17i1rFIhMvnsisO+iY2yxWTL6U/tJcp8IxVphtg1E9XuAmU1XnLPWv5M5waIm4Jpk5Y5cxKl6wCgEj3pXOBt5mvPz4etV8J1C4PIEAOKdXyGG2NEgRB6rj17eCJzWc5hR/Jx+9w/guRr8qygJX/pcFJEl/DrMjLSKy7S7/KQ9k7AB8xOJwIb+njxsYKH1ng+E/bwo7YQJD02I/BOKHzD4UFzSJI3jMtmzJkWkfLA7U4kjTbq4UFP5bNRIxhnU6bZ9x7/+Md+m9DQN2R8j2mRyA9VTpqdnDVIy4QIn5CK3yxKtr3MBtZ/nEjRuGhDiRGg8wzYvawQ0f9pxi5pdBKJHThWF+9FJGd8CEu0jKO19rQigaEf+n+cSWXW98Sf5AqPdx38VG7qrrTf0t/5URstu3D3loVnOW7CIl7523NE24ZxmbMpU2cL8YRvHV+jf2R3Vdt0n+UFrT/J+xI2YutqlruXhDPqYLJ1mdl5R+BBdep6i0ImHdC8PN7sx2JG7FpEnxwMCYN5GFXnjMNXBi5u6R7B7yyuWZCL8xH4Tj21VL56mXzb2J0ghmjF3ggi/OM9YNZdo/aw+3v+x2N+eU6yYmiUU1fIn1MD418dUhlpb/kNQwTd7nZpdXiFhr+jGeP559jD8dJzYFL0WPkg7w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(3023799007)(11063799006)(6133799003)(10067099003)(56012099006)(22082099003)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GjcLjP9hpQC5nJAKZeKgLfar+wjJxWh2hBk4Bdfm2GDtlhSkHO7BzpmSpJQ7iQByW3JgS7TcthxIg4nDbrQzYCwCSH7azqLOu71JHHySnMzdJPzgPrqJcT45X0TOkbG7MLD51JawuKt7Cxync1sbhmBZXHcYTTAV7iPkbMcT+AA4y0iv1mnMuAV/UHf8lYMXegneTMyr8Atj/JAdlP25bKMxzDz0641fcsrjFB/gYZU3M5lB96bEM/JZ/Ieg1iHp5O6TWhK+kg2K3dFUbR06PfRZfKAdplIGKvvkES3Yvfl5sG0F1QQ4e1Nb3fJUKsg8dy5uWAceu2hfrVzi/X9pZE4UIkRCK6xHmB7c+naqjiP7p2kDxW/6n5RJjXZaRRBk9ejiwhp9ezBZrKGtSwULtlyPckWiNp7A1gMPTa1+GfZ/yO2/TEnZFRjdX0Lij4ov
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:14:10.8634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26630fd5-9c1e-427a-35c0-08dee44858b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6607

Memory Bandwidth Monitoring (MBM) can report incorrect values when ABMC is
enabled on systems supporting more than 32 ABMC counters. As the number of
active monitoring groups increases beyond the range supported by the
existing counter ID encoding, programming an ABMC counter may inadvertently
affect a different counter, resulting in unexpected counter resets and
abnormally large MBM readings.

The issue originates from the ABMC counter programming interface in the
L3_QOS_ABMC_CFG MSR. The counter ID field is currently defined as 5 bits,
which limits the addressable counter range to 32 counters. On systems
implementing more than 32 ABMC counters, counter IDs above 31 cannot be
encoded correctly. Consequently, programming a counter ID beyond the
supported range may target an unintended counter and reset bandwidth
statistics associated with another monitoring group.

While updating this logic, it was also observed that the bw_src field,
which encodes the RMID, is currently at its 12-bit limit with support for
4096 RMIDs. This field also needs to be updated for future expansion.

Also found one more pre-existing issue. This union structure can truncate
data on 32-bit x86 systems when unsigned long is used.

Fix the issues with the following changes:

1. Update the cntr_id field handling to support the full hardware ABMC
counter range and ensure that counter programming does not interfere with
unrelated counters.

2. Expand the bw_src field to 15 bits.

3. Change "unsigned long" to u64 to fix truncation on 32-bit x86.

The AMD64 Architecture Programmer's Manual [1] available at [2] will be
updated accordingly in a future revision to document the expanded cntr_id
and bw_src field definitions.

[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming,
    Publication #24593, Revision 3.41, Section 19.3.3.3 "Assignable
    Bandwidth Monitoring (ABMC)"

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Fixes: 84ecefb76674 ("x86/resctrl: Add data structures and definitions for ABMC assignment")
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
 arch/x86/kernel/cpu/resctrl/internal.h | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..b3d780eda8a7 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -192,7 +192,6 @@ union cpuid_0x10_x_edx {
  * @bw_type		: Event configuration that represents the memory
  *			  transactions being tracked by the @cntr_id.
  * @bw_src		: Bandwidth source (RMID or CLOSID).
- * @reserved1		: Reserved.
  * @is_clos		: @bw_src field is a CLOSID (not an RMID).
  * @cntr_id		: Counter identifier.
  * @reserved		: Reserved.
@@ -210,16 +209,15 @@ union cpuid_0x10_x_edx {
  */
 union l3_qos_abmc_cfg {
 	struct {
-		unsigned long bw_type  :32,
-			      bw_src   :12,
-			      reserved1: 3,
-			      is_clos  : 1,
-			      cntr_id  : 5,
-			      reserved : 9,
-			      cntr_en  : 1,
-			      cfg_en   : 1;
+		u64	bw_type  :32,
+			bw_src   :15,
+			is_clos  : 1,
+			cntr_id  :12,
+			reserved : 2,
+			cntr_en  : 1,
+			cfg_en   : 1;
 	} split;
-	unsigned long full;
+	u64	full;
 };
 
 void rdt_ctrl_update(void *arg);
-- 
2.43.0

