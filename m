Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2065.outbound.protection.outlook.com [40.107.96.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1728A1FCCE1;
	Wed, 18 Dec 2024 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557904; cv=fail; b=UaivfHTHOMdMPmT5ZWR5uKb1JpYfzj63u+8xacxAMJBThI1X0SPXJroOmkqCywmrKcS7lLzULxEZRXM0RkATYCpDzzKLHRgaRK9TygWvSalxQQu05xWQb91W1tfMrRBKB7he3A7E+TJPuLwlaK4D7Icuc+snu00FgyOKDIzW+88=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557904; c=relaxed/simple;
	bh=pCIKZ6kRB8yLHbc9/C5z7Qi6b+vJoxXR4EfEVfPf+Fc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XfeGYKHKz/NDB+FReQBtvf8nJiU42CXBvRZ81kpXrLwx0/xf1LwmcCdAETqh4xYD9VKlh9yYXrD3MAhbwZBDHRWRPtyFSw1tlE6f//Y81x26mzegZdZvqksNBOXDKRy7OrKWWUdrs7yvURAo4MNnkydNCCXqait5yy5BnZx6DKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2Fh/LV9E; arc=fail smtp.client-ip=40.107.96.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2Fh/LV9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFLdklP4P2kEUSOp/bBhnQLmdW4i0CFVBZy0uc02yKCsdT5XXdndf23FrT71M0HzZTbHOQNu9ASxjNGe888u8JvnR1ZdUDrXdR8509slVSqtNpkWDac2liB0eqXSh6A681/Qu5M1t5B8lo6LJJRCz2G4/CIqZ10ZWqggBOfF0Cr/F8PWiP93FTCqCmNPbs5vmkI40xvBdfOATG1y9MRQWlAdLU86wQ0ivohHMOgl1dn5wm42H52AKPLkff0WfVJ0XD16FpgC6T+jaGNb+BmfYqT8o/4bUr3Foq6k7rpoLxX0/lRAdn+dMczF72cWJEsYb4aTUcWIl7C1mTXsJyRJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvzR/26Nl3BX7A3sOo0m0X37Qq4+k9xMqIuvPSvlhZc=;
 b=agvCUoFNdlLR/Mi4Xk3JLhMLM9jz5mB74TYUh6tvC4+t+559cN+436hjry3inC84Bkg/uH7nDTGccT1btd4HtxJdsoHkJit+hFailK+Z7GxEwA59OKbC1CJHjCgqvrJGCdJMdPYMK0YwwisDSLdOr8mdhQo8efk8b+ONm7iFBTtxADEZHlHV6Zx7j/QDY57FgIS5mebP+wcQn4aJRUmcjCrZFEiO9LzvZNBYl9yKFu+F7eqqsMaIX6XgVslJX84Q1TDqNLpuqM75rQsspRED54itoc9pa9xANVqbKiw06vHeEy4VA1lA8U++2oBfPqjZ0AgodWYI+mHDbppH+OqUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvzR/26Nl3BX7A3sOo0m0X37Qq4+k9xMqIuvPSvlhZc=;
 b=2Fh/LV9ELdRdi3CxaJzqi6CF5VREzDpnKDzyTutuQuYyHeM4Pdx5QIjNMptgRjL7u056NUnkwiFiKfx5H8pfcQH2d85VtaDeohOoFajTWPbUrQAsUG8RyrTFBGRfY5COMi/T5EnZdtZhc8KLBsBzUx6MMujIqZCezHNNnX0VivY=
Received: from DS7PR06CA0013.namprd06.prod.outlook.com (2603:10b6:8:2a::13) by
 SA3PR12MB7831.namprd12.prod.outlook.com (2603:10b6:806:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 21:38:19 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::1f) by DS7PR06CA0013.outlook.office365.com
 (2603:10b6:8:2a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 21:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:19 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:17 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v2 1/7] x86/cpufeatures: Add support for L3 Smart Data Cache Injection Allocation Enforcement
Date: Wed, 18 Dec 2024 15:37:57 -0600
Message-ID: <f913337074960312c7d910e1f99a9869a1592882.1734556832.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734556832.git.babu.moger@amd.com>
References: <cover.1734556832.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|SA3PR12MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d197d87-b8fe-4849-a6fb-08dd1fac4a0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o907CyrDBYY6ikR/uL3gd99Ex/Q+PzAmZT5HJYVB06HM8dSiqLmc8NlWkSUf?=
 =?us-ascii?Q?row+wqsf++D5hL4Cn1YFc1RlwZFg7P0K0jdqQxkHTINkO3pdQAeNs/zOkshi?=
 =?us-ascii?Q?nR0VYhIQkv1qhe7A45aICJdnjZA6dxyhvjx3xWxga/2EM0LFuZulP27jH9j2?=
 =?us-ascii?Q?vAwTEw5MEWGs/rfQhH3HltmT+B0uoEBxA/AWUdfvl0eM7O+A7AEMZpdNHjy9?=
 =?us-ascii?Q?joVOnI8B+SREhZm3v1/Nfktw9BtLIBH9WzYvHqnIfEtSQhcplOznxYgoVq3j?=
 =?us-ascii?Q?sHUSHJPt1SYY5kUubdKedUT3abknh1hio0ZrHs54tp5+cT6QMmqDU7EADHW1?=
 =?us-ascii?Q?VHPPMw6t8GgN6UJxx6H9Isyw6PfTyHU9GUJgx7k2+nbjZBV2jvFSBuNEGtAX?=
 =?us-ascii?Q?e1iYw7S6jiP9qWL8bbkX26JRaO6XRSYzl6S7bRW7QPb/+rDJjFB6391wooFf?=
 =?us-ascii?Q?kxWPs7d25KzNnlkNtiSDY/HnOtBWFKUP2MAdY1FUcIkMil+K4T1DqYAJS3nC?=
 =?us-ascii?Q?PL60DhKYQqqDeasJUuKDZhb8uO9y7IpaOdUWgixSxKLOy08ijFJ8+QG2sdiV?=
 =?us-ascii?Q?19tL4ke+xBahl+Ede6g9PG1wbpfmpdX2tjLn0Zc9nFOJzTaRTktdIQma+WOr?=
 =?us-ascii?Q?oZuETnVdiRZvwTWo42APWyMRUGGtIoUU65cZpLD1FUBCZ9ylTO7kLgx0Q8FW?=
 =?us-ascii?Q?azhuZdBrt6res1LazpvNbgxR4n2Ycd5iv+0fqk9NfnD9p9/fiPnSz7OcxheJ?=
 =?us-ascii?Q?GAfzfSm4m+cEhjlqLEMWg1ub40Cd+SpjOyZ5wMvAohJJbBc7cmP4HsjP8jrT?=
 =?us-ascii?Q?MlxzHuSktyTSPsi7dBh1xQcldu8bd3/XTYZT6VXwnyU3zcakRzPIXbuDG8u9?=
 =?us-ascii?Q?wAvgAeLw59QHGbHP/qlwkM4sYqMBO4NGVU80Vb9Y4REaxZS+2wnNLw6VcldI?=
 =?us-ascii?Q?H3645y+amXw6+O7zSrJ7Jvy58Y3dLk5rg0KQtiqC8KukcBhXcZgX/cOP+OpG?=
 =?us-ascii?Q?mIVFNcUZrLHGO0MjJVbSfL1LZf4ynk8IZEJcr/fSZvT+MiRMPdYE9Mr/plMm?=
 =?us-ascii?Q?FfSjPwhi0tp7mXfOziibhY3JwrRKiCg4gx1oaJ8dThtbxbTxqkcIFMh9UPss?=
 =?us-ascii?Q?vTDnoUbOe5f7W7HxZ6fuSlnxIJ0DhBI6SG37YgPWPJMkFArW8hSZD9P2iRyp?=
 =?us-ascii?Q?YDW4Ce5P6nEmzbFfx2Wp/W3wULUQKlHj1ZjnPVoiw+0aGzQ+X8CFK1YtxdLt?=
 =?us-ascii?Q?Y7FraYA03G9zYCCR4tuduX3CR8Hpp1URhu5aH1estAbsShf9tQL8NNFo0tae?=
 =?us-ascii?Q?Ib5raUCfS9KJEUvDuYcYss5sn8gjOSFeH9yif+wK7eqWMT5fYEPO5G8tvBsh?=
 =?us-ascii?Q?XqIbLY6ZBlot8/L+oC/UOwbhFVW8sr08IIENEV2OnuY8sJC+7X5oOqqd4OZa?=
 =?us-ascii?Q?3PV9GGPN9jY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:19.1807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d197d87-b8fe-4849-a6fb-08dd1fac4a0a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7831

Smart Data Cache Injection (SDCI) is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache. By directly caching
data from I/O devices rather than first storing the I/O data in DRAM,
SDCI reduces demands on DRAM bandwidth and reduces latency to the processor
consuming the I/O data.

The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
to control the portion of the L3 cache used for SDCI.

When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
partitions identified by the highest-supported L3_MASK_n register, where n
is the maximum supported CLOSID.

Add CPUID feature bit that can be used to configure SDCIAE.

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Added dependancy on X86_FEATURE_CAT_L3
    Removed the "" in CPU feature definition.
    Minor text changes.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 935d44cc4db8..57aa3c26fe4b 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -481,6 +481,7 @@
 #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
+#define X86_FEATURE_SDCIAE		(21*32 + 8) /* L3 Smart Data Cache Injection Allocation Enforcement */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 8bd84114c2d9..8185521ce854 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -70,6 +70,7 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_SDCIAE,			X86_FEATURE_CAT_L3    },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..d18a7ce16388 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

