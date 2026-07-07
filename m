Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011011.outbound.protection.outlook.com [40.107.208.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F156747F2FA;
	Tue,  7 Jul 2026 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461052; cv=fail; b=WtgRg2UfIprHhpTRmS6ffoU8miOJBWkiDu+7FSLYAff0QuJ+XNU9IS6ox6kcGYFvlUChTyvtqRNqnNMTrKEh7YhF4KanP6lvfOF16MM8vqPpoHuY6W58mTWGOefr7GJQn78g6LPoULOs2eABLfLM5H4g5VqMvXylomXs6xM9a98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461052; c=relaxed/simple;
	bh=6c2y005j5y0CZd6/ERpyTpOxtyZUIxwyaavkncnY6K0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OobjscrNeOcfQC57safCvnLx9YH6jbuMxb+WAvkJNjABK1F2RB7tcKg1xlcOGVPoBLsSsvLnBUkDOg+k2PWDV0tNO+dX6iKtW2scL308qQeuJkF1cSAikWIFcSslo2oKpsxhPryzGFnU5IeIyn2tCQcdD2W6kyV3AOxf9QFxT0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=n545hQY6; arc=fail smtp.client-ip=40.107.208.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n545hQY6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mC9jaJZo+CrM6dcjbmPqxz776M8CSgS/cbZOr5hkYTuOfos+vttr4YFKMf/8HpH9wCUtoQZlzV+4njdHuDFoJwITYT7J376DJK0e0sp8HD0jIN+/m5KyVgw50XBCIPT643J+YzWhxUvN3/Ymf6k5nJAsIK2L97GQZxSfTnLGpZoStAb/DY0mjpmiuB7PgvChwQW9cw4Q7ADgY8HRWroo4zoOgXcbyMHUT0R6CI+knjLjfHio1rkok/USuXqOsNfuLV7PpsDvlqklXRbB4i3XXoueENtYvGfnAkNW36f0sq1yy1dzMwIncj04/Fs8CDES5aqEr7+JDbRdUnXK8WxJFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk1fECA26yWsi+XNfTEDXviwdC2S11iWdYu0uuQaERk=;
 b=epPcYP/hGpNC9oVETx9PdUh/OgGx3dlCSJ/H3RV1O6g8OP1PUrBQqtM2VVDvJQ+bkobkjwewrLORZdPMLKi/TmeJLVswk2fyTboBG0fB5Y4J8GLkfnxcECfnaR2y0kRNfNTYGprBrOq0UvDoLcXoWP+H93hzcCEqnSFVYDvBJHp2bQUdtZpcPnD/wBwrMIzqy5wzoqNLBeTvVVafBneo0U6GFAqygkMD5EKLEbLYb0H96OdnXV8j5WQgw4Rdv6CgL8gscPVEdiaUWuixUl3cBsLl9SzrgyMZpWSZgI49wlisOZzVtXTzyjGvJtKaahLESnGvWbvBqCnKiauwgvMYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk1fECA26yWsi+XNfTEDXviwdC2S11iWdYu0uuQaERk=;
 b=n545hQY6/KyF2KgDf3tbeVSX+sebRxp+PE6eKiJfS4kIzW31eUZyJ7qvUQPq4AGTpA9PfG1luqJFiD7Wv1+DlKsjhpSQeCDuabby2phx0DLT0aES+Li7CnecvF06oftJfRz/CSSUAJTbLVPOiY1P22AT/IVrMVXOK4eHu95A9EU=
Received: from BN0PR04CA0172.namprd04.prod.outlook.com (2603:10b6:408:eb::27)
 by LV5PR12MB9777.namprd12.prod.outlook.com (2603:10b6:408:2b7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:50:45 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::a4) by BN0PR04CA0172.outlook.office365.com
 (2603:10b6:408:eb::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:50:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:50:45 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:50:42 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
Subject: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level Zero Association (PLZA)
Date: Tue, 7 Jul 2026 16:50:02 -0500
Message-ID: <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783461016.git.babu.moger@amd.com>
References: <cover.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV5PR12MB9777:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db11c8c-6eb9-4928-fd78-08dedc71cc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|7416014|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	9JdLDlIImY92GBezAIwFlSs74kQ8XSWBlu/pPIowgjoOxfIX5Jz3r0YsXdZ7l9F9l5b5W+m2Sb6IGCi9nRW+O1hueLkPnZSw+HQm6LOVGVXW0VPk+Fs6X0R75iIgJ1VqEIVc+apZATqRAoffhmihNmYQJ+1XG3SoPLCHx8y33gPsd6UnSiMuXP15aC2s5YK2QnELwkiYAIr0CjgdKIRapuQUB8HVj87MHqFlIW3OEG9eVKWQWA17jI9Bgvig4LDJU+E1FIVn1YuUiFcdKB453//a1s9aX/lmlBMqJ3go9SCnZbHMuGIK1n9/kZRhbV8nJu1whHcrp0h2Oc+I+aJO6Ly+saOec0tMTLHlfkKndvXnPafkOlKNGGPlrZ+9D19Xj3of8moyhdA/o8at1oEcByDOD60zL9gAsyF5m7Jv/tzGXzzcUOPzRoaVrs+fAP5haEhlYIyPAvhsY3IArCYSwlDWVavG3wNw8MD+RIa/8VfFI9+mdmh9I9tJEVMS4C0jN2phE119HxYqYaNJpoaRbKcD+ZiC8gOwuoh4uqNAJ8jiOnGMGifyIoAix0ZVapCM8ZXg/42Q+OC7Rv8gIjwYUDtG/bjQZPWHkh6DhWTmPmBQ2NR3TfQNtLkARWkrRDYR1hthGmNeUwXGob4+1TlfCzHyXjdzJ6LVxBTnJ7q2KdgU48n7xCqmWMeKoYMV50s5scTXKkz9ccZ6f8vcL/6J/Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0WCwJM5aIfCSu4XpI/1GS1G1osBInOTMbnePvQgHAnWGdVtpbjiRpk5R4J5mLRgZ+CqUDTFi6CZSX6lvLnE3qEZKUWgGbQzemlNmzeVeaD6emHlyxsQ5RAfVPgAUyT8bx3fshIA7980PDKV/yt34s+Urg3+fUumtbnYZHPycxZCOoc/wT7iaq3AZ8jZYopF8Vm65VXFSC05vbXPqh4XFVX6tdxz3fDfD8gWoAvjglS1wcVwvnam0BwCTAlwqQjDyEf5FdrkGZSYHmmFZRgRoFVAqY2+9wpAtz4szmkYvEOeQUPquM0jeQ+Wr0cKYe7BqLUXP+jkf21eZahR2OhR0s0LWjfd5BHiIrW1CJox8g/9sPv86Bsww1feKfczXAGrTgQOxTJlDN6QSwPaSY3XFJvf3QFnI/bZuucG/qohY9QZu6Rll4Twt+3vPb6461qJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:50:45.1150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db11c8c-6eb9-4928-fd78-08dedc71cc61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9777

Customers have identified an issue while using the QoS resource control
feature. If memory bandwidth associated with a CLOSID is aggressively
throttled, and a task with that CLOSID moves into kernel mode, the kernel
operations are also aggressively throttled. This can stall forward progress
and eventually degrade overall system performance.

AMD hardware supports a feature Privilege Level Zero Association (PLZA),
which allows the CPU's CLOSID association to be changed during the
transition from user mode to kernel mode. This allows the kernel to run
using a different CLOSID than user space, which can improve system
performance in certain scenarios.

The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]:
Privilege Level Zero Association (PLZA).

The PLZA feature details are documented in [1] available from [2].

[1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
    Publication # 69193 Revision: 1.00, Issue Date: March 2026

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Split the patch into 2. This patch only handles x86 changes.
    Re-wrote the changelog along the ABMC changes.

v3: Code did not change. Patch order changed.
    Added documentation link.

v2: Rebased on top of the latest tip.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/scattered.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 1b4a48bff18f..bf6fc71f87fa 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -517,6 +517,7 @@
 						      * and purposes if CLEAR_CPU_BUF_VM is set).
 						      */
 #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
+#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 937129ce6a96..1fa4d5aef17e 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -61,6 +61,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
 	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
+	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
 	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
 	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
-- 
2.43.0

