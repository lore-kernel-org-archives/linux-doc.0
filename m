Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0E42D0617;
	Thu, 30 Apr 2026 23:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591520; cv=fail; b=UGLQjsxxnBnpo1mHN6LOZCQ0NRXgnWQqH6HzHuT41qNqsPnxYSGHDShb6kaZetpKznqJuNaG9XCVB6ZK4rXOBe4rQO6k8yFd4Qxsnyxz3kbfh6h8og4vyly5TtJyOijrRXjEUKUoQIolhRlKs+nJuMbeMIRy340ARz/LCulyk0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591520; c=relaxed/simple;
	bh=+xw9SWA5Bd7tDAFIEUCXhrowKElBsbxO096+cO62HvE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipE5PrFQGRazmnjjaYgfl/OluK5O9bZO/lpRl01CjmyliuTumAEjV/b7COX0Jsmj3kCiSc9XpF3+7uAaCxjW9mxwmuqcvvBSoSTdN4/QrZerGrZZpytla3EJSx7oAAqv5QNPOb42mxEgp+MTvZwGDIub0XPj0z4zO+tP6VOrtS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vvSVY/EP; arc=fail smtp.client-ip=52.101.46.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vvSVY/EP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roP3cJqpSsu/ABKlMOCNvJLvwO9vS0PA/XrrVS6w30fVvjPB5iFB91K4uM6j2kswlk3/XT4GaJIB50j+FP3PZ5VXbgp7HxaSF2Sf5twR5bcAqEATxi7QxTvW8W1jIW1IPbhVGtX0bsLe6Xs3vuWD6iU4MLemm4hf6TUf0AR8gAzb2YSKaDfnWpm8OMB6B/WyKmp1Yik7XFj5YDWrbWjvX8GO6CHi63gooYTHqV+PCdzLlzvo6BmX8fQlNweveV3hXamNnb/o81jUfXIvv/NCvZFMXvJJ+h2xBoYmZ4oTxmsUOMd/ShZZc5kQjfMH+EwefkFpLQbtVlWa5PGR7BXxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqpyVQx2rwOKF12fTA7qNmbA84nCvVHAtwIgWLeNFBc=;
 b=aj0J5lpTwloRytPi1VKwZiQcLcNEHzsIzsEBJfoZCoti7MnUsNR1Z2a5oqwGosZMoOpO+FHNgO4gydGhixq+/YF31AncWuGW9fNIIGa2B9pvfdcX6ApGJAxtsCZDPaQ/RpPyUUmgBeiSJ7BmfgErHdmh3F6PVLo3Jn54BGeazbmC+vpPHaip45/zSy63rnV3TxZpFy9fBAfKv6h36UisH9jG5b8poW/ax1rj/6GvaHUJrk8mKYy51T2Y7Raczn6p2jzyMDxcIH18/CJNARPMjkpdQFJLAZjMkuYl1JFAatQQMCgjzf1WI2uVJXmUjuT/2IyR6oSfUcREBA9nsW5dyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqpyVQx2rwOKF12fTA7qNmbA84nCvVHAtwIgWLeNFBc=;
 b=vvSVY/EPnyDcIfntfUOYBzvAW5KsMp/BUnFGs8jGNGZBnFbwNz1lJOgU5jPYrE1qzCxPhU2zf/Jn/VNSZAPzcUpGH3inYuR9FYvu/aIPweTKaJ2kNn0RkbI+B3CWifXvgRuVmGb0N/iqi/iLpNVcX1UzG+bsX9kXa2MnVZ7nXTc=
Received: from SA0PR11CA0130.namprd11.prod.outlook.com (2603:10b6:806:131::15)
 by PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 23:25:13 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::d8) by SA0PR11CA0130.outlook.office365.com
 (2603:10b6:806:131::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 23:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:25:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:25:11 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <lirongqing@baidu.com>,
	<paulmck@kernel.org>, <bhelgaas@google.com>, <seanjc@google.com>,
	<alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
Subject: [PATCH v3 01/12] x86/resctrl: Support Privilege-Level Zero Association (PLZA)
Date: Thu, 30 Apr 2026 18:24:46 -0500
Message-ID: <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777591496.git.babu.moger@amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|PH8PR12MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f2c3bc-f7d9-48e9-90db-08dea70fbaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|13003099007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7qsGH5Rw+kprzNewzwq8S8dC52ENLv0AFXsD2P/02QP+S/UiH/VkAZyE59G0fKEbismTMb5+0CAyHzzzczU+KRHU6nFIpvXLkKeP/pmyZYNOIfwDfLhS1Pl1dYV6pWU9LL62+buESa0SgkbKEDGm6PPiQ7mWcQ9pxYpDL7nOxZa75eWntGX4kr/dgfraeKLXIZjTC25V08kX079lc5tMaQOyXqRGEuT8coS+j876bAJzRxbsWOnmCSU8lCzQ6EM+V4DfRKtge6++dioVFPQdgOSwXXTeP4sl3YcJ/THTSVOGTiL0w8XIagzt+n42bC3FgwhuTqnBlX9F+XJN+8nKDnqGr0ibmzU54TUhQfGT46Q8FwsZ8kd7ZrmJknREq7z+stj/MdrRKUe0dbuyhtZAA6lupxDeaoDnjuA/LF9W7HDCqAfH2ZgywHhWNFI4+oa/Wo4udMlS6zPYUVZyjS9OvFHWy0heA25yyg5uXm2pM1JqYaNbXM16vHmyEMSo1QDBUOTmCRJLf/Dh2ExK0V2YIYvQ1Bbi3aH0VSvo+rW+dN8XZMcrvhUUdAhyon7MJcEjGPDSdFPkQtjGgNEqleKnXKdenjVZwdoy4sSY3kbcDUZmpCfQUWjucc7N9RXbbwBQCdwGpeL2yPXxUwarTDrItLFW+E/qulFgQSMQPYCoqfTH0VPZ0ge/UO7qwU+u1+K6HFGxewIhRapVhgWA6lvFTMe+l34O3NoKfoR3xLDcDd4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(13003099007)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3kjhstvzYlsnsvYq4IRFQBdVPjuMRzBC+JlVNbku4MIsk1xJ7p13EfAIsYHOxJQ683panxnDMr9XKQkQuGbfIrPm8w9zRtC6mgfl6ykXVnhPLwaj888NT3jVn1wLoEjWgGQQCSEDgbLSa2UyqRDB8x0k402YdvbZDqMYKTVS+ZyQV1Eks+cYjltCeE1lJwETCELJxXzEc65NzBlyy8IXZ+ReXeK34q/8WwcCtuRTHpEct2RRLt4fmVtqU1hw/5t6APv9Aaj/CuOT4nMMRviNALWnWmaR9Hd2wNnBfFGvIheXwnkZzPb6VmrS4vK0UsQKJNX49Rv4iNz8X9Vv8kJ/j3VNIOeXTrRrB7ro5YfHKEMQJazlguHeApwl2uQLlef66Vine7L0Ey7xv/BHocdQByQffXwD5FSZIAyQIf86fZrnBsnsEC86O7siW80PU4KG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:25:13.1670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f2c3bc-f7d9-48e9-90db-08dea70fbaba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7279

Customers have identified an issue while using the QoS resource Control
feature. If a memory bandwidth associated with a CLOSID is aggressively
throttled, and it moves into Kernel mode, the Kernel operations are also
aggressively throttled. This can stall forward progress and eventually
degrade overall system performance. AMD hardware supports a feature
Privilege-Level Zero Association (PLZA) to change the association of the
thread as soon as it begins executing.

Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
and/or RMID associated with execution in Privilege-Level Zero. When enabled
on a HW thread, when the thread enters Privilege-Level Zero, transactions
associated with that thread will be associated with the PLZA CLOSID and/or
RMID. Otherwise, the HW thread will be associated with the CLOSID and RMID
identified by PQR_ASSOC.

Add PLZA support to resctrl and introduce a kernel parameter that allows
enabling or disabling the feature at boot time.

The GLBE feature details are documented in:

  AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
  Publication # 69193 Revision: 1.00, Issue Date: March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Code did not change. Patch order cahnged.
    Added documentation link.

v2: Rebased on top of the latest tip.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/include/asm/cpufeatures.h              | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 arch/x86/kernel/cpu/scattered.c                 | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index f2ce1f4975c1..3021c920f3e1 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6463,7 +6463,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, smba, bmec, abmc, sdciae, plza, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 86d17b195e79..5739281bd4c7 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -515,6 +515,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_PLZA		(21*32+21) /* Privilege-Level Zero Association */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 7667cf7c4e94..4a8717157e3e 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -799,6 +799,7 @@ enum {
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
 	RDT_FLAG_SDCIAE,
+	RDT_FLAG_PLZA,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -826,6 +827,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
+	RDT_OPT(RDT_FLAG_PLZA,	    "plza",	X86_FEATURE_PLZA),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 837d6a4b0c28..630afb233194 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -60,6 +60,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
 	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
+	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
-- 
2.43.0

