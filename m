Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D5142CAEE;
	Tue,  7 Jul 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461104; cv=fail; b=kZYpKHIvQ78w1FLfAkzSURajDyGe/cISn/fKrO+nrAGUKP5XcEyHgLDkGQJtURbQESF4KQzGRVvKzbG3ZmYEM9reb9/ruzXqx32hSy9D/A5yGt0c6bGooReo79V07MfhP1ZH654AQCShNtxiwOEsvr5/EnoYNP3VSxLWestakV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461104; c=relaxed/simple;
	bh=VYjOFaWBYvRbPsUIQTMMR8mb9i8L4jNeFRHPFYe8340=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BlUBJ5wWcJ0AX4s4Q32ZCJjtB9AotWTKiw7+yBlIUsOcX+d4zD7V521ReCeTE0U3E3qkXMTZWaE02mfo1ydjC8+ahgaMqS36xiKYYuo0jwf26N4qUH7d4Bp4l4aJdRz3u1Ovdxvu85OHVboTXZLeGJMq3pM2+KpaMZOZ06N0Eak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uLBUzAFa; arc=fail smtp.client-ip=52.101.48.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uLBUzAFa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL727gs+u+9ozwEh8WMJ5Ke/0Ki4SuJSa9/M3QCDy87Ra026yjkFiW/1ZX1D6Rr5C+G8GB8c1UuUvJ86fPGevFmnCTvjZFxyLdZR+wFHi1MEywHhsYv6mpU9GYgVFjHjZhMPncLpMeoYjxUuLLtoxTb3AqIOiycwRe3rf/wIqURa2dSMGWoUZC/JfvipnEWir1oL5z1IpXUzsd5Sxynn7UMp0KXLXu9wW175jaEZUvuwRCrrE2rzo8xWCYoRxH/SqXiFy7ABJFZzrMJO93uUArgyt6njiWFzNEVR63m58iBk0EQ11u/PQ/QSx/Gk5+xthjZ8wqBRNsG4c6W5MDSUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/DbEge/052qDT+6k7SSTEYL8swnRJz3s1jNTvXZoJg=;
 b=X46lKCcYn1za5js4jRkLEBySDai36mHgjjYGjAWnTlx/xidouju51OQSxUJHfvgydl+RBPYKyxO7C28QFVAMSE/olB8WGDnDcWvuuZBdeFbavVoBtecmNvze7tvTIG7D5gqjjVo8v2ROsGUSIwAVJnm6UG0ZluBAScqItHaMPE9OZ/jxJDYXU6/SFVdTDbqxYuQj2GL4/FAtR6hlHdELDUQyrREfw0/Ky16OYWJhs9n5DjEg24loBURGsuP0j1vSjKk9YUEhcG31aXkRm6H7goAWX65DrVuarr7l1z9aE9jL3IwW+wMpRnprTNNt3d8mUTKUFK6igy5MvrTMVNFcdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/DbEge/052qDT+6k7SSTEYL8swnRJz3s1jNTvXZoJg=;
 b=uLBUzAFa/T94wCsq8wL0J8Jx3z1+Q2e0fQRPExeunPFgqxxzZ9/Cahu8EjsdxAD15yEOYomcYT+mDpeLYz27ti/O9uYBHeaWGCbTwlKvuqDZzLlAPjyoBTIvCbHDZP7SbF8YN39JlumZLqLTPh5/OPQlHxDScTnlLYfQ9Iz47XQ=
Received: from MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:51:25 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::6e) by MN2PR08CA0015.outlook.office365.com
 (2603:10b6:208:239::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:51:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:51:23 -0500
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
Subject: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce architecture hooks to program kernel-mode
Date: Tue, 7 Jul 2026 16:50:06 -0500
Message-ID: <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM4PR12MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: bbf79a7b-b969-49a3-3e4a-08dedc71e47e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|82310400026|376014|36860700016|11063799006|6133799003|18002099003|5023799004|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	znjxa1NLRerN9WAF8noe253CA9EgUnmT29CjYdwgi9lTwlhckVpVDh1pQ58+efrUmy1ycDVSQPpXyiIJbRDKw73M0epEa25goPw0IF3bWiN6Nm9vlbkgxG/s8tnK5rhQWv5YfPjOaKOnKWEbJmamtAX5VXH1UF92ke7jd9ThlJZJlkUpabDt7Q/AXTx1jIvyPOEFWP1DkqF6Kdt9xyk0alpTbI3/wHsPnEiy+ATMCh4CHilh5I6R2taN3AGgX9BU6PW0dCsUyQ8lz4OrwMwQSp36FePerCb1kbIsMMfdtbf8OXJtFVVehGQlcNKdESQAqY96p/KxdmcLyaGfXdh8yUWr92xDh/p2+AdGWTFqfU763f7DEXa/gKp9LISFJtLTUJm/7RAxtMNUkzHEE+vRjwed7aJe/Az4+eyw4bfh16GBsLHIlZse+xfuDiPUZuaxNxh1EYM1AuoMyYRhXJt2W8FtpAyz1tilu1iOiJSiBN3aOSKECptpnM2pcL2poBebeQm+n2lckpJFN48xcsdoHMeO/DFaLUVb85P2VQ0yRoNDNT3n3hA3I3/heFCvOm4ehykq5EsLPN0+NxN2TRdfDmEX/FmHQZR5Z0cvnBcMrY/7R1YMRZ622ZoTxkS8aQdy/6HTaVulhfKuYgR9qpkQ9Zu4I9Yant9vM8BlXQLtvCTV4rRF1oVtDmeqV6Y8PYFvr9uamW0FD7aSn9MIH9dhGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(6133799003)(18002099003)(5023799004)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CQMrBJJOOWhuc8zmAoNSLi615KO1Vf/0PYvI4Iouvr6YOMKPuf8DrwkUgWJxF0HvV1QrTRHqn2Sbfnjc6iBI6zjUmHIIyU2OTv+P3VFcy8qpqI7/IgJiot4kUQ8OKEAcQMFmg5GYUAiTKy6CavBH2zfAqtA+X1K4TGXQP++JIo2oufFAUEBAV9LOeiSr3x0LU9DdWLP0U/sxKdWFDFKHR18Vlu76L3xtQbGx4oYTFjVq1BPl4ivZPliERP7keq/7D6Fui67PXGxeGiY10pjbEcn0RaNh5Dok+Y/tcNpGw3MZS5ocpfhX/un4ceZLsaonFTOpsm6I2iQEty4Z0pyVp4iROTV8hKvvxQe6jjWgCkBou0SAcdNF7C7F/cqu91ulQVzjrGtc5PD6I9P4SbAICj0TT9370ZaFkICnV7bJr1nIkaLDxD9t5e8JUPJATdv+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:51:25.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf79a7b-b969-49a3-3e4a-08dedc71e47e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557

Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to
each affected CPU whenever a policy is selected or its scope changes.
Generic resctrl therefore requires an architecture-specific interface to
program allocation and monitoring associations in hardware across a given
CPU mask.

Introduce a helper, resctrl_arch_configure_kmode(),  to handle kernel-mode
programming. On x86/AMD systems, this helper programs the
MSR_IA32_PQR_PLZA_ASSOC register on all online CPUs in the specified mask
via on_each_cpu_mask(). Also provide a no-op stub for MPAM systems.

Generic resctrl does not invoke this hook yet; it will be used when user
space selects a kernel-mode policy or updates the associated CPU set.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Added assign_mon parameter in resctrl_arch_configure_kmode() to program the RMID
    as discussed in below.
    https://lore.kernel.org/lkml/20260605100642.1103628-1-qinyuntan@linux.alibaba.com/
    Changed cpumask type to "const struct cpumask *cpu_mask".
    Added MPAM stub to avoid any linking issues when resctrl_arch_configure_kmode()
    is called from FS layer. Thanks to Qinyun.
    Re-wrote the changelog to be generic.
    Updated code comments.

v3: Removed task based PLZA implementation so related changes are removed.
    Removed handling of rmid_en as it is not required. The group type assigned
    will be different so the monitoring part is already taken care.
    Updated the change log with details.
    Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
    It is FS which decided which mode to apply.

v2: Updated the commit message to include the sequence of steps to enable PLZA.
    Added mode code comments for clarity.
    Added kmode to functin names to be generic.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 36 +++++++++++++++++++++++
 drivers/resctrl/mpam_resctrl.c            |  5 ++++
 include/linux/resctrl.h                   | 15 ++++++++++
 3 files changed, 56 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index b20e705606b8..025f139434f2 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -131,3 +131,39 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 
 	return 0;
 }
+
+static void resctrl_kmode_set_one_amd(void *arg)
+{
+	union msr_pqr_plza_assoc *plza = arg;
+
+	wrmsrq(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
+}
+
+/*
+ * Program Privilege Level Zero Association (PLZA) on @cpu_mask.
+ *
+ * When @enable is true, CPL 0 allocation traffic on the targeted CPUs uses
+ * @closid from MSR_IA32_PQR_PLZA_ASSOC instead of the CLOSID from
+ * MSR_IA32_PQR_ASSOC. Monitoring is redirected to @rmid only when
+ * @assign_mon is true; otherwise kernel-mode monitoring continues to use the
+ * RMID associated with the current task.
+ *
+ * @cpu_mask:	CPUs whose PLZA MSR should be updated.
+ * @closid:	CLOSID to use for kernel-mode allocation when PLZA is enabled.
+ * @rmid:	RMID to use for kernel-mode monitoring when @assign_mon is true.
+ * @assign_mon:	Whether PLZA should provide the kernel-mode RMID.
+ * @enable:	Whether PLZA should provide the kernel-mode association.
+ */
+void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid, u32 rmid,
+				  bool assign_mon, bool enable)
+{
+	union msr_pqr_plza_assoc plza = { 0 };
+
+	plza.split.rmid = rmid;
+	plza.split.rmid_en = assign_mon;
+	plza.split.closid = closid;
+	plza.split.closid_en = 1;
+	plza.split.plza_en = enable;
+
+	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
+}
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 226ff6f532fa..630b6cfc0269 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -158,6 +158,11 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r)
 	return false;
 }
 
+void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid,
+				  u32 rmid, bool assign_mon, bool enable)
+{
+}
+
 void resctrl_arch_pre_mount(void)
 {
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index c7abed51cd5f..47db34dd167e 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -734,6 +734,21 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_arch_configure_kmode() - Program kernel-mode association on CPUs
+ * @cpu_mask:	CPUs to update; the architecture applies the change on the
+ *		online subset of this mask.
+ * @closid:	Allocation class for kernel-mode traffic. On x86 this is the
+ *		CLOSID programmed when allocation is assigned for kernel work.
+ * @rmid:	Monitoring context for kernel-mode traffic. On x86 this is the
+ *		RMID programmed when monitoring is assigned for kernel work.
+ * @assign_mon:	true to assign @rmid for kernel work; false to inherit
+ *		monitoring from the user task.
+ * @enable:	true to enable kernel-mode association on the targeted CPUs.
+ */
+void resctrl_arch_configure_kmode(const struct cpumask *cpu_mask, u32 closid, u32 rmid,
+				  bool assign_mon, bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

