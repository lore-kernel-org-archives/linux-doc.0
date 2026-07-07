Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013057.outbound.protection.outlook.com [40.93.201.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E784B344D92;
	Tue,  7 Jul 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459089; cv=fail; b=t89aFQHX6C2z2LuKOLXFHphHXqAprbN4f90kxULZF+WiIrrOflEr22yagCmy+XL7k57swGGfuXl6EfuHw42HxIH66elaiEmg1wfr5oRAkVLGotpKSbmYSlU7IapV0mfCXfn8xNpEDb6DQ3xv5GLHP6/uJPTP9U6+9TqnRO1gTtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459089; c=relaxed/simple;
	bh=VYjOFaWBYvRbPsUIQTMMR8mb9i8L4jNeFRHPFYe8340=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=owR9mxxFfzQeaJESVa4gRxJX8kjRhSbFffwwuzpownoWrmTXe/lWBchdNDHUqtpzkY7GvsFGDc9QVo2qiTVJieSs0HnIlf8jK6uqncM+881Na+EhDNP8xR3jXLsINOAVjM5TjEMsfIlf36NlfXZs3frZ42S3ak+d+gYc0d1aAPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oGghV5pP; arc=fail smtp.client-ip=40.93.201.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oGghV5pP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKQwO/i9UgIjVduQpCP0aZ2PbWCuKY71savUShdapwjnl/w9HqIvd+tozSO/veQlahw+QykmQE1kU/lOiwzitQrGrMcYhGef7TzKH3F78wtaZ/MsJFoHam3CUHYUjdEIB8lo/wofAkOge80bQwWAwibyIBrkgmkGipZpNo9cRDC9Sza36aiEtYaDjasEkGQaTOi/Bdzay49Imw8xQl+5x0AXip0k0kP1pKGRRQLulW+M1GT2V+Ak8jV1hdzsseJyJPFnealmTGU8+AUp1EHXd402DSOAGQA9TDUf88Aybx1GVVWeSWCQsFc2nnUcoHm7TgmcGSXI9Oohf6vOfdLBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/DbEge/052qDT+6k7SSTEYL8swnRJz3s1jNTvXZoJg=;
 b=Q2MP9g8ABV0mJLTWR2I82ZOxSow7gilhZKHX4pcj83szMxJRcMgmhKCpAqKwM9TbC/75R63c6Zz2cERNwK2RoAyVXVIinz0AVlHEs/bhu7S2pgSxiBWsqPRX4OEdbSid7ce4ndC5uboMIMcPiZB1BTNM+vX9yc94bA8H5edsb6kCW1bCQeMM8ShTTjfY8B8G4cAEVFszVWPg85iAwtgrIpuXoIRd+S4z4IBBW6wV0QA7IMfbF4740FXAM7+uAz6D1IPeGdVidR1aRgA27onrR3FP8u9Z8sZ94ramt8yCj1eWj6Xnvbh/phwYSkrBAKSZmecX5sE3x5Ns0rmMxpPTAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/DbEge/052qDT+6k7SSTEYL8swnRJz3s1jNTvXZoJg=;
 b=oGghV5pPgbWAZIsMoBtTNPLjt4mtDSrooWQ/pI4kLbOCxTpYudi5/tR/ddckMieBvT91FNFEbKAhfAWvpTySJ+jB5VX0ZTzTCUUUifrIH4F9lOMjETXJtqdDPXZlEwnpPVv4AWn5WVi4hHCZRP/Ws6TWU5i56Pn8IAqLdvxWDaY=
Received: from SA0PR11CA0059.namprd11.prod.outlook.com (2603:10b6:806:d0::34)
 by DS0PR12MB8367.namprd12.prod.outlook.com (2603:10b6:8:fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:17:56 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:d0:cafe::a5) by SA0PR11CA0059.outlook.office365.com
 (2603:10b6:806:d0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:17:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:17:56 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:17:54 -0500
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
Subject: [PATCH v4 05/15] x86,fs/resctrl: Introduce architecture hooks to program kernel-mode
Date: Tue, 7 Jul 2026 16:16:53 -0500
Message-ID: <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783459023.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|DS0PR12MB8367:EE_
X-MS-Office365-Filtering-Correlation-Id: 0313b1bf-f318-4a30-a506-08dedc6d371e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|11063799006|5023799004|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MbG9sstf7UXFU7uxv68gLHRRDRi5pXqVIZuf97b9hSc7UiJJDSsroXWoi/hTWMClbJT8CKbaxyMjHWtZGZPNPdWL3s5+HAmpdlYrxJ5cBhpeuAJkzIpZQymivRN8fhzGIbj6dzQW9op2TrDh/LrBr6bmu5zKCMjOdQ9oFHtQkJrtS4AV8v17S+pOqXPeiue96X1nLwrFD7FA2CgRMF1U0Oq8NXNCLHe+U+M55S0YNQmCK7JZ0drN2KJKZaryfjpK0gkZddC5lNA+69511wBiySYVhTUIZvwDotPj72r49bsHSBQMgv0kTHCo5Mav1vCSElzaDGNcwk7UuVZkyW7dxJgUYMTtWdASwK8HSWeawRmlVbb/g94NnO3tnmyJBsgBELPJECcQ/QSlQw55rhxbybTlhSWnmqAOyT+UZJwfJflGNt63pGN+DtKcT4ijcCuFncG9DWqXj9fwWv1D7Es8WYEpMghpGu/aSHwcvSVH7tK2Fau3g7mHQo8yXtsG1LRDt1QUFfaIe0x6AG2lQs/00drYcaC2/uwEsO5ziwEeHLsVAY/cGsDoU9dSb+yyCpckyp8M650ECRxVUbNQ9qz9des9Rw+c/KACMu7lEjpz9EokiXpIlrIl0L/8bMT2SPNqpxFU7Sj0d5CeJuQWWF2nSzjvenYN1nqz/GYWOpmXUY+yo7f20uBmDkw1Crdkfdc077WPlamhU3ZczhbLc9mwxQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(11063799006)(5023799004)(56012099006)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X0xmLKDxpchsTsoIOVt/g3gufh5WM2q033oK9v+Hkt+dDxTZWxPXxr55n8r9hXFh1ReiXoNOiTVXs/5z7WmR3Eaqr5tmqwP04j2fGdtdw6Mus6xvP7LV2MZ0B9ytJkA8egH42GtmrHcwOnmQpyRwLwDqQZM67aP85UUyQ4K93DMzHdHw/wCU8sz5asZqVVBDC++ruXCuQV165Hm43alHDv8XE1JbHnpzVhjzIDemanPMUskVjoIE1qp94ILR4H7K+TkgNv0KlhKGbTft4XXEJyUEN8SIq8Wymv72rPD2SZF6liV09V9+oEHHr2/lGuMVgE5UEUk5flpvzr5MrEP/K0/NGuxACtf4RF937BDld7XGY2zPNRTytE2lG433Kmy+xsarbayDRmFnQDSeO+zKvqDqwOu/1Oa2XItWUEN/YJVRNWl4OM3LF7sEKqeIhXxb
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:17:56.6832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0313b1bf-f318-4a30-a506-08dedc6d371e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8367

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

