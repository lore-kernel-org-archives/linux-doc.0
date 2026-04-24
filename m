Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C332621CA13;
	Fri, 24 Apr 2026 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994927; cv=fail; b=iebeDCh9CiaZFfpo6eFNoHPZYnhcmyivGjgFUkUyKVlUJ+b0QnTFkfPKo0nqokVPmB2PfCSLT1CNmfIUlhARAx3fxbw/XuDo7JEmU6Q7aYKWN6hpSCHf6ERsA5BWKJXvEZ1gyblE1ztlhz1ticBau2N2AWacBSmpavHNtExOTBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994927; c=relaxed/simple;
	bh=W/yon1B2dGcVmFtEYzNYLVY9IkaPFkca929U0oi02YU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aDRmpH6p/GJXS/DkpTFlFHFz0hcXpdft5xJWJkFBaGYysSBHHvGrMlXmd3aD1wTI3VKSmv34+0uK4A2eXzY91uudOtddrTn5nUnTQ2f1RzVNVQ36WIbIx2Ckabj/m2VvX4vIhTTr394voBeXwu0l3QM/IZD1jaL/zuZcRVeRSHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yh5xsE15; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yh5xsE15"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKCaFwKMESoJh97fQplSTuZtnVZbAcV8lxSnys7/OU8rTcDL4YbTZxzIm1FAnl1/XlvW1wrbrhlNBmcOX4wc5hVICddnDPUKmeFJUs9hOTK9jtZdVawk4343ZJNFSKjP1Zh4b2rK3zvOL2LHf/kL7qIZRxTUlomDIeHMP+cJZyDncnQcp4FHkgY0b893O7V0c944D7YyhkhIC5AoXrccokmr8nUjytvAp73/CxzjinG0SVlVw+DhOLV7ALthbnuUFwzSmedZKP5SkXz9fnKqkVsgis1lCtGICJLN4HeXN25knHMiZaCOAc93MShgvlFdkwNgNB91I2BDuyo7KtlRiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOpKVyiLQY0SaFWJg+xtMVyX2l2P4FF3XU+VfAL9mYM=;
 b=Hfon24YRGJDW8cj/sCvtF88rHCfKYwB7yUw2NJP2y2nS8cGKnEhmiSgFyiZG3Uuc+teb4yuVwy4kAt0IsEWXlvcQPWkT+uw0cz+b6cFTzNjcp0MJmZTe2LIGnHc8AMFY3ks3lR5cKbDpiTdrzMFmLe6nDADhh10MHfYTM6r7uxu1RPR1rKxau/c5T3QAB5uyZr5FDQZP+Pbj62ua1ObFPmmnDzf5zd28wkn3dOyuLrDXFxsND179dgzKoOPXoM//F+gd8KRW0bdUlUO4TXnXGjawVpmwM5Jhto2eRmurl1zAG3f72TXOWmeJDevGQcKR9vMq/1b5eRiV0252H5ACbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOpKVyiLQY0SaFWJg+xtMVyX2l2P4FF3XU+VfAL9mYM=;
 b=Yh5xsE15HxgLZV/cFruvRETIZ4zxR56KwF7/5UpzVpW77pB+QpBZiBdxsLOUPJ2gg85FmuJWzGIMzerigUO/LtbNM5mePUdr2wZ3G7b7NjN24k+aP+KS8QwerNbOq++6mTMVkhtebZ83HMA9MUVOg+EcijVDC8T2DnYx61A8G1M=
Received: from SJ0PR05CA0052.namprd05.prod.outlook.com (2603:10b6:a03:33f::27)
 by IA1PR12MB8311.namprd12.prod.outlook.com (2603:10b6:208:3fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 01:41:56 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::be) by SJ0PR05CA0052.outlook.office365.com
 (2603:10b6:a03:33f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 01:41:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:41:55 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:41:52 -0500
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
Subject: [PATCH v2 1/8] x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)
Date: Fri, 24 Apr 2026 01:41:31 +0000
Message-ID: <be504233d697c0e9a09eb798088467f0bad665fe.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|IA1PR12MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d6f99c-dbeb-488a-abf7-08dea1a2aac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Gae/G+s4QVnBMz1o7c61yWdh3+Wh8Ny1krrx9eSObklEjpWyUY0+UVq+imVFghkNKWCfer1GiIoky9+v8OF8wh0W9ZZd2umEL2BZIYRpSXrVlTsTJx3Of2ynJJjc0kbP95L/AU/fqxzVpL+lcgd0FRFm94GiOVUSBFM7XiEWCv8QKPd/gH6g95MhrZPHv1Ok4kujk6BfzJs87HlCTokwdUbmmsimcBe/J39DDGZalQIb3U/dye/xQuj0z0jNc4rPOtHesTWxYXZgKFPjPW4pAfnjG03aed9DAqBBNlS4h4Rr9Cn1EMZtHlq67qyVZQ+zpRWKNPkbVlFQWRJ2UWBjATm/Dyln+/1TFSVFBx6O7fzLtUNo2nFytY2xsatvPkZq8yfK7rzNAaNADsvgpYYC0MiXwyIFUtLPafD9U3Sb6s5NHnUTA2NC3QCzhXRGP/HBe+5YuWSF6kRfLqaWXANXgwl/jyaUfqOEHEh75R0pf9lma64O23Hl+A36Y2LQtu3mF8C0/qmAp1eQYphbrMMWM5hLo9g4ahEs6XbsURwPjkYJ/XThBTk6UexFMVSJRBz2vgHGzAXPvYHnS8mbcsyE/046sRdHKmDEgUTM18tjsM7Q/eb1oJMfPz8GX4HHb7jg9HTEATFRloVM0PtcngpWkYP6WtvmLSEybUGZwl+c5cPlyPkFoSPO0FjYzQv1eaunrakjMIKmM8PadYP578pWYa9pVrVpbgs6yvRpFaznLKOgxaxXXgLslhDj6T1D0kNbK0d/AfFA+Hv7goIRmGVBtw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pd6OAaJRdymymuGlgK0KLuwUSeu9WrFbm8L1r4JaAqFwZqfWU4tRFR0H74SY0OfcJx3a8o1ruptqsXI4qpKGQI3e+Gn58C+MYbaiXnpdiaQF9cCV3N1BeJcrgSLb2nh+G4A0A1m2v84iyNggDFnj/MGN5BnYmM++eeFsQQqYKtixLJqCHE4zdaV8rrWwn9OkJux24BToEEXk6c5eJI9yq/K3nj7neKSE9BnvmREKsfAFLY2n35WYBaTtMinLlv980XhnmkgYs7BCuWYlPqSv8b/G/QQH5wfNR4MG7jlpxVRbSdZSUOJzO2mihi3WUk4qMwDsQIrqF4yFAuaXbbWwjCX25WDujFlQSXF+aeuiLfDA8nTpxyErJwIHlKb9j1Q6mZBYijrEZMKZT4TT5jz9V7wW/5WPRs5zzwo9Jc62pM2pUVrGyWXsOdShwbT0oW8O
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:41:55.3573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d6f99c-dbeb-488a-abf7-08dea1a2aac3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8311

On AMD systems, the existing MBA feature allows the user to set a bandwidth
limit for each QoS domain. However, multiple QoS domains share system
memory bandwidth as a resource. In order to ensure that system memory
bandwidth is not over-utilized, the user must statically partition the
available system bandwidth between the active QoS domains. Active domains
are those that have at least one thread running in them. If a QoS domain is
not active, its bandwidth allocation is not used by any thread and is
effectively wasted. On the other hand, if a QoS domain is active but its
bandwidth allocation is too low, threads running in that domain may not be
able to utilize the full potential of the system memory bandwidth. This
typically results in system memory being under-utilized since not all QoS
domains are using their full bandwidth allocation.

AMD PQoS Global Bandwidth Enforcement (GLBE) provides a mechanism for
software to specify bandwidth limits for groups of threads that span
multiple QoS domains. This collection of QoS domains is referred to as a
GLBE control domain. The GLBE ceiling sets a maximum limit on memory
bandwidth in GLBE control domain. Bandwidth is shared by all threads in a
Class of Service (COS) across every QoS domain managed by the GLBE control
domain. The GLBE control domain is configurable using the BIOS setup
utility.

By default the GLBE control domain is aligned to system NPS (Nodes Per
Socket) configuration. NPS is a BIOS-level setting on AMD processors
that determines how many NUMA (Non Uniform Memory Access) nodes each CPU
socket is divided into. NPS allows administrators to tune memory locality,
bandwidth, and latency for different workloads.

GLBE support is reported through CPUID.8000_0020_EBX_x0[GLBE] (bit 7). When
this bit is set to 1, the platform supports GLBE.

Since the AMD Memory Bandwidth Enforcement feature is represented as MBA,
the Global Bandwidth Enforcement feature will be shown as GMBA to maintain
consistent naming.

Add GMBA support to resctrl and introduce a kernel parameter that allows
enabling or disabling the feature at boot time.

The GLBE feature details are documented in:

  AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
  Publication # 69193 Revision: 1.00, Issue Date: March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Updated the commit message to include more details about active QoS domains.
    Updated the commit message to clarify that the GLBE control domain is
    configurable using the BIOS setup utility is aligned to NPS.
    Added link to the PQOS spec.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/include/asm/cpufeatures.h              | 2 +-
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 arch/x86/kernel/cpu/scattered.c                 | 1 +
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cf3807641d89..f23cad453f17 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6452,7 +6452,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, gmba, smba, bmec, abmc, sdciae, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 1d506e5d6f46..356f7a11d47c 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -508,7 +508,6 @@
 #define X86_FEATURE_ABMC		(21*32+15) /* Assignable Bandwidth Monitoring Counters */
 #define X86_FEATURE_MSR_IMM		(21*32+16) /* MSR immediate form instructions */
 #define X86_FEATURE_SGX_EUPDATESVN	(21*32+17) /* Support for ENCLS[EUPDATESVN] instruction */
-
 #define X86_FEATURE_SDCIAE		(21*32+18) /* L3 Smart Data Cache Injection Allocation Enforcement */
 #define X86_FEATURE_CLEAR_CPU_BUF_VM_MMIO (21*32+19) /*
 						      * Clear CPU buffers before VM-Enter if the vCPU
@@ -516,6 +515,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_GMBA		(21*32+21) /* Global Memory Bandwidth Allocation */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7667cf7c4e94..269265d98ad7 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -795,6 +795,7 @@ enum {
 	RDT_FLAG_L2_CAT,
 	RDT_FLAG_L2_CDP,
 	RDT_FLAG_MBA,
+	RDT_FLAG_GMBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
@@ -822,6 +823,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_L2_CAT,    "l2cat",	X86_FEATURE_CAT_L2),
 	RDT_OPT(RDT_FLAG_L2_CDP,    "l2cdp",	X86_FEATURE_CDP_L2),
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
+	RDT_OPT(RDT_FLAG_GMBA,	    "gmba",	X86_FEATURE_GMBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 837d6a4b0c28..077cf452c257 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -60,6 +60,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
 	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
+	{ X86_FEATURE_GMBA,			CPUID_EBX,  7, 0x80000020, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
-- 
2.43.0

