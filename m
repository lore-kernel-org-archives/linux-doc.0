Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C77F326923;
	Tue,  7 Jul 2026 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459049; cv=fail; b=lLd1jhM9dCAg/AYQMYtQkPfzGK/CUeZPAKEA8gmMtW4RB13A+z1FKcuCZsNXbqLX248+sEUZ/Rb+rQZFta85z1DLZNPM8vtckeZ8uF9vOnmzBSE2/KNYmUdn3EiD8G7HT0dqw7qzQ7TRuCFOi6EqSiF4YB8CB0eDGDSYOJFDHVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459049; c=relaxed/simple;
	bh=6c2y005j5y0CZd6/ERpyTpOxtyZUIxwyaavkncnY6K0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWk9lVypsaIYByzh4+PDSMyH6ODvZ6tQC5rl+3Nvl+uuhdQ/7ZZ+zJnuTT4QKpYWFXNCsYv02aBzAZykhq32QOlITclScJKBsUGsuALLmD+IDJkiQLNRZT1FSovGL5gfIStPBrZIoKBNNWpyyV/F+nIlkVLYaFzVRWppL3ZlOvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=nSQHMTUJ; arc=fail smtp.client-ip=52.101.46.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nSQHMTUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxmzX+mIPAdkmOQItpR81/K8tMTjG1QHHTmMm676BufI42u+5iYzig7Ddhlve+nDb1VeGVvEEglDtOhfsP1PU27UtwLDkXr0YCw1I6jPAJB0SHLSAIWBP7DIG7rH9f45qQq0msg6qi5jFtSINar0vbknoeS7/xTEqkziz4x3Us1ZqBcKWybwRysh8Hms89Jt1XYVYOr0pgLBoBQRKTMEe42oZRs4w/I6mSs0fT/NbZMn1zKqYkdnlj5GtgFqp2/SCHAEAV+xHeG3yGolQHGQPOy+T2td8qlo2lF2P+3NIBV40DisRPObJaXBiGiHwVx+OKXX5wVkxmlZm2h3qFQukQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk1fECA26yWsi+XNfTEDXviwdC2S11iWdYu0uuQaERk=;
 b=IUxriL/SiqBjW0vnRGRe2zW+1G/0t4NfrvtjAnao1ZoGWuKDpxFydW0KPyIFVPO9/vr9mcWxFwB6dNtXeODXJGQb3USOYfRtVDiuxAsvTfck4Q+cSVRMhdgVyuQ1RvWIy+OMSzgiLWBjbPtxHTXc+9OMZrvqsigKby9zj/vU2AerHl84I8k5NoDx/mihrQURjzbpNjdyblpfgOPooJQCE/Z1qNpwcug7y7xKUubKwOs/ClfBFY+rhXv704/P+VENsYwKfLlNvxF07p40+lRPvlsXfVKeN8iGCxupDam26MNM8vRROTPL4IVKx3vL2D97vdml80/BjSyYBYmUephBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk1fECA26yWsi+XNfTEDXviwdC2S11iWdYu0uuQaERk=;
 b=nSQHMTUJ/fiVU9X2igy88shsPFBRfcp3WqQ7CcirpA3oWsUMZoBgJr8cQwr3XS3434n0RMC7/4can0JY3JuKGttnIaVht3pONkjld7BrBkREdnxEnzsS5rp+Tqv2/p13hffdm8nZl+d7idIJEvU4iZtTR+vw5cZGMbYGqcZ5oTI=
Received: from SA0PR11CA0047.namprd11.prod.outlook.com (2603:10b6:806:d0::22)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 21:17:20 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::45) by SA0PR11CA0047.outlook.office365.com
 (2603:10b6:806:d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:17:19 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:17:17 -0500
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
Subject: [PATCH v4 01/15] x86/resctrl: Support Privilege Level Zero Association (PLZA)
Date: Tue, 7 Jul 2026 16:16:49 -0500
Message-ID: <d462f5c3d3a4413d4271384f914d1895436f06ac.1783459023.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783459023.git.babu.moger@amd.com>
References: <cover.1783459023.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: b186755d-dc15-4ff6-dc3e-08dedc6d20de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|7416014|22082099003|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	xpkPC1gs3GeZAr0ON1AQuZxRIQTUYCcozMWPec/1ZJFf7jYIMz8THkxSjgwF4vLXQn0KAgJvxXRfgaV66cGPARyDql6vbe1rO8Q0a3DRBm8++s13oXDJP5eNKw284dlhBo3Jj7kSBknmdJzjlvlQaUvR+BgBNvyyLfsea1qJfqhXqncA+4vqit9gb9nmxpov8pIrmIWQRhh1uLGj0K77hTbF7xdd6hqqCgbQ2PE9F8ysqk9NwlYBK9Ugp61+QOQBfsdFdcorR82QInXfYBJMqzg2n24NdjsRJFhd0DUlEvMynV5Kf0TiIYbdDn8fVOgtubVuHfQb6Is7hB2yIISkPXEtJF20VdhGUUqXDpo7tIusule4XQ176jhMdPfdv+MAhpiUwdDrv16dezF98rILqB36wqQPnb37EeYeCfGVNo6t+rhrcsa1jkBCzm21Km0g36WFqXdDnwz2PhRoQGqEv2hkeW2kKptrRXtzCP+idncSA88krfFWcGFEw6KaPRoh2HELNitRSu5piiNw0V2MwrwDSIqXtebCRHeNspp3t3ahBNRhCOActfK4nClzcRbBTz4Aef2pMHhYkYSrhqAHWp7FinVF/DM3D91aBZsJck89hW75a2jUlIWsEH6QLj/owxlsiyLJcgRNYnwBYQRfeWI5ac/9IMDhHVBlb/+RsZIRFNllccS2uskNNFZraSaqWILpUmfLT56C58c3eaVBhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3MscsIpYnLTEVrLcNNwjqUi9dnl7Rsvv6t0c7ef4+hu3Rrv5PTGYjYpnWrM2lJpKp0MuAjf5wS80GrD9cncEqNIgQqNfsr35IOhXewf8I5ayFdKvn43LRxJ+OgOCgeKVv1aauppKruh+8HyQ10S9mQctcQ1wthgTstqJ4io7SRTwJlb6MTKHPP5RyafN87yR16R7T4bLkk31hgO6fwYkMrXQufPZDrUqxeGpouckz6bxzIhqiGZJXvWKqRZtU8Z7giyaNIYP9LMmE0tnc2v0kiV3P1pKQoKl7Q+FGeX/n01SiRFXSAW/+yM/8NgoZs4COPCAy3S8dn3bDNeM2WQjbyRH/m2CUT3o9w5JZ6LYSMwmKOOpGWhczCm2hFpY9SoDtykzKzONy0SzRpVdvP2Zc3yHReFtjcfdzG5hm7vP5hwrgPsoNNxlwuXyCIJZVMAw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:17:19.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b186755d-dc15-4ff6-dc3e-08dedc6d20de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177

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

