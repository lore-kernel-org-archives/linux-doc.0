Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F57B275AF5;
	Fri, 24 Apr 2026 01:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994978; cv=fail; b=NvV/k8/nCpwpV9rQL3OsEN8GYWjBt+ahli2iwTMJobsoNGWSh1PCstqcfeg+2Ivh9DKkPKMvzX216pUmb+Sj0UKmEV3ZUuQwVhQ6v288NIa+krZQrQrrZCD/YeXMU24UzPhFwjJ8yzj9ElLxghClJtsv0SxmjRCrfuO1Xa3wUpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994978; c=relaxed/simple;
	bh=Gj5oRpiD816M1tOTcRDCqJSaQFxyzgcV/lw8MZPWdTU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R926AZKNb/DkkPcMsBCV+SSVLwdnZGVGpStjueQGOfE+NKoKS20k0w5Plunj0gR7F50/E32smLcwKnLW2iCszGRqxk2AxFPW76czIZ9RIkeroADkp8wU7M8OM9hznyJbaYeg/jI08xXVwfDVYPEGZnDHGBsXtWQd5vyL3L6lZZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kkm3XfDf; arc=fail smtp.client-ip=40.107.208.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kkm3XfDf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQbgbuWqwTZvjZeLbJB5Kv3VXFpIFwnv355u3OkesDM9TBg+oCiLzWTHzuTvODoEyzAhoQzC8PVAUDKxjvgVJj1X/H0hUUFHaPq9l2U3KMq67PY9O0eBfnzvV3RD1l3Cf7C/+T9avjM85uk4lUjvK7Vn+wOqrbIzRVHUSPp4qQRIWYJNH7OkcpvXVElmXGjDM03i6qzDVCXDb5qt6JGCU8Fpgs9jjTCg9XfTAqcAUGIoYn687AgdUQzekh7iox+PDCy6slHSajPW/xQL9et/3VEJ3uxHtsyPIz2GpgrMtgY2umBa+xg/i8vbSM1H+X2FomGpzGEBV5ORTQlEub7YYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2p0xJ1NFRSJ/j5SJuEgKgGcF8fpQ8bmZIhLIbph9CV4=;
 b=pxAf3vbMj2wDPX5knLJRr9/M6G/AZ9vJUZkwbut4NZpjrd5eLuWh/Ie09rMkHSfLFmaSN0i8u6wXGq9YaGrJSDysQPNr/dHBGduWv7GcxEQILu3bMQ31hKuhMKKmOMTljLwZ7yebjzk0L61pRQbgOh8b7w40aX2TEhGxAxUXF0mbgslufDwTSkf9in+pSGb4li5zG3dN4gC7fGFhS+Y3FyxP+Vuopm+33FVwtmJJb8jFRp44uWHvgZGSw2Ln6eEZ4WUdeyBHqbxmpPu1I40NhY7PyDg+xNHYXv/p/RHv2WzqSnjPsonK9kgBb1RpBzV6D/j+zcq8DPjRz+FOOY3kIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2p0xJ1NFRSJ/j5SJuEgKgGcF8fpQ8bmZIhLIbph9CV4=;
 b=Kkm3XfDfa8ThSKK6SnP8AsrtGo0MrlzPDlN7gn8cMlEMarUhQnT4UUmmGuRYKL63g3zxLLJCKrmPGaMrk1+cLN7JTWIQmApo6ykgKWmabPV5WrFb3InEPU1olJqMMUp26+sQM7etxd67JfMg59lvRKSk0tDPeBnN0uJNJL5gUjo=
Received: from MW4PR04CA0077.namprd04.prod.outlook.com (2603:10b6:303:6b::22)
 by DSWPR12MB999177.namprd12.prod.outlook.com (2603:10b6:8:36f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Fri, 24 Apr
 2026 01:42:51 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::11) by MW4PR04CA0077.outlook.office365.com
 (2603:10b6:303:6b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 01:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:50 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:35 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<seanjc@google.com>, <pawan.kumar.gupta@linux.intel.com>, <nikunj@amd.com>,
	<yazen.ghannam@amd.com>, <peterz@infradead.org>, <chang.seok.bae@intel.com>,
	<kim.phillips@amd.com>, <thomas.lendacky@amd.com>, <naveen@kernel.org>,
	<elena.reshetova@intel.com>, <xin@zytor.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>,
	<peternewman@google.com>
Subject: [PATCH v2 6/8] x86,fs/resctrl: Add support for Global Slow Memory Bandwidth Allocation
Date: Fri, 24 Apr 2026 01:41:36 +0000
Message-ID: <743d6ced9c35dd19f3eab5359c0ada6057873a0d.1776980182.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776980182.git.babu.moger@amd.com>
References: <cover.1776980182.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DSWPR12MB999177:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f7f3bf-2c92-4f9f-ea40-08dea1a2cbb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|20046099003|22082099003|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	l1x9hPPJDqazSS6TxsJKPvxCu9M5xcx0+Ihy2lOpVAQxecst9h+HCnNvEX8Eo8AK/3N0jz+g/Klk0Jdlxoi1nB7Z9MwinTIwxm5b1ryqRhsXOMLnPoyLvBvHYYN5vgWNG0DwkEjN0rl+gMdU7MUDzgRcMpD+07y4q+sJDy3E388Nq+rl/RuVyimYFB5FfrAlKKY8LwFFbyHxvwUterrjtmowdTBDVS3gvNqqZDQfLJYxmIpNnIPzNknFyf17W22PyAJD8z2WaPw1eA0gpyz/5Ce0+wW+4D36JfKA10EXBCRKyJ2wXrDtR9ymqneQmQzXs1OuwmXqESMS19TF5WVcTsFGKsbkOsT9Ka1Xet+m1TQIbpJ21MXYH2T3rVs0B+BbkokhR/hrKA+I5rgLL2iOJq1XXRub0dTx1tFoB61ZxFPgqf3bB4DB0+dIUKf8X08PXfcGMTyVQRbvqCC9FiQtokCHPICEo9/VtqPMr2btHJ1xWNCCENyvG1BOKXFZ01dGXYyoFoHDmW4h4MvSXSQRL7QeYa2K+4bUAF/4hjejokA5vLwCF/pA7AI3tcZylrrCC9jG48oNzN6wDOlLQqQkz93uycNNc+mavg8BhrLYmgCTD2EJL3ghrZAs04xB/5ilr5kFGg/Fxx21rX2p7Bd+EMyvXg1lVfk/Sn5l8/Xull/me95F9cz/XYOv2Dnirf7iiQ5UQkoX9mtp+Hs2rk2Uw8Cst0aa2MDBKNGNabX04mKqngNaQxBWbFfB4FOWBfs/WsCODLkvAmuUwSu6NuLzbA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(20046099003)(22082099003)(13003099007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ge6AvUMhUYIs1x/yNEft6ymjMtNCxg4wIvWAgcVV62wdzDokfTbDDcGVj3GP8BZlXWnw+2Mt/Wnq5zCE+CWwj9r/FEtToXoh+jZRvF8zRWYMDcIyMLnALTWkDoh5RRDAXjwXdd5TAPhA04h+Ak190pbeS7gFxt9U6XHzZ0ls5g1qIz8HH/lijSnikYgJWquEcZOpFiUdWVWp9HUR+dGuHEIz9JfiFpAxTPQQ3x1E2o8uIwd5XWH8gQjKwnCnGmr6FJ3Cy6V4uFYt0SUMSbR5s3E3Gfq21UHKkMjatKuDocTtbj8DC8GT1xy+TSpLhnQdNiflBsbpixfxwVaT17t8X8RgbqCQPQHT9fz/vtXp9CGdmuyIxbRVVACwW/JtHpRgBfN5bhagZs/hpF/3Sk89ZyM4ysVwnWExvRVspkz7HlQU7KdlcvcTsADYdy6IuUWA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:50.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f7f3bf-2c92-4f9f-ea40-08dea1a2cbb5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999177

AMD PQoS Global Slow Memory Bandwidth Enforcement (GLSBE) is an extension
to GLBE that lets software specify slow-memory bandwidth limits for groups
of threads that span multiple QoS domains. GLSBE operates within the same
GLBE control domains defined by GLBE.

Like GLBE, the GLSBE control domain is by default aligned to the system's
NPS (Nodes Per Socket) configuration, a BIOS-level setting on AMD
processors that determines how many NUMA (Non-Uniform Memory Access) nodes
each CPU socket is divided into.

Support for GLSBE is indicated by CPUID leaf 0x80000020, ECX=0, EBX bit 8.
When this bit is set to 1, the platform supports GLSBE.

Because AMD Slow Memory Bandwidth Enforcement is exposed to resctrl as
SMBA, Global Slow Memory Bandwidth Enforcement is exposed as GSMBA to keep
the naming consistent.

Add following changes to support GLSBE:

  - Add X86_FEATURE_GSMBA and its scattered-CPUID entry
    (0x80000020 EBX[8]).
  - Add RDT_FLAG_GSMBA and the corresponding rdt_options entry so the
    existing rdt= kernel parameter accepts "gsmba".

The GLSBE feature is documented in:

  AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
  Publication # 69193 Revision 1.00, Issue Date March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Clarify that the GLSBE control domain is aligned to NPS and that NPS
    is configured via the BIOS setup utility.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/include/asm/cpufeatures.h              | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 arch/x86/kernel/cpu/scattered.c                 | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f23cad453f17..03c89f90da84 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6452,7 +6452,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, gmba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, gmba, smba, gsmba, bmec, abmc, sdciae, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 356f7a11d47c..947935fee7c5 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -516,6 +516,7 @@
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
 #define X86_FEATURE_GMBA		(21*32+21) /* Global Memory Bandwidth Allocation */
+#define X86_FEATURE_GSMBA		(21*32+22) /* Global Slow Memory Bandwidth Enforcement */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 22114ff84bfa..667ff3eb57f5 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -838,6 +838,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_GMBA,
 	RDT_FLAG_SMBA,
+	RDT_FLAG_GSMBA,
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
 	RDT_FLAG_SDCIAE,
@@ -866,6 +867,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_GMBA,	    "gmba",	X86_FEATURE_GMBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
+	RDT_OPT(RDT_FLAG_GSMBA,	    "gsmba",	X86_FEATURE_GSMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 077cf452c257..7a57453a3dcb 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -61,6 +61,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
 	{ X86_FEATURE_GMBA,			CPUID_EBX,  7, 0x80000020, 0 },
+	{ X86_FEATURE_GSMBA,			CPUID_EBX,  8, 0x80000020, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
-- 
2.43.0

