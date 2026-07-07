Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012025.outbound.protection.outlook.com [52.101.48.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E117480948;
	Tue,  7 Jul 2026 21:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461085; cv=fail; b=HsfwfVnPZtV7l7pPCXHSIS1d6bOBnZJHSCgnIpKaUWneZbfRQAa4vAnG+Kw+3J68hErox02HC3ZxWJnWxFQ5h3Mu8Sz9gjll8/6YHuJDoVpHsif0Wq58AQ808djMArk8ZP96MWxbgjv4+SxDFaITOlVHy6PwSD4GSf1Fte2h6nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461085; c=relaxed/simple;
	bh=AQyTb5a2XiUJ3p7axALYy1iFbcvPTF/9FY3csCDz5Uo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mfxo5Ngda6J0auLm5X3YKyTf03NkUVf39W5FR7OA3P18ZdMqEKcWQnk6NxEyaGJLc9Ctee7Op+ni/np+hcs6KffXm2Tbky5ToUXonRCWN7XPPUMyLCiLHdvhzxO683wtfvC4TuykslypR1mh3ueDn0b/2u7pCpoZSOY3U6r4/ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MAu6i125; arc=fail smtp.client-ip=52.101.48.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MAu6i125"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRHrkdSgHnz05YoXK4W6EDoKSalHJIBB8fXu00SbN9z3bFZK5IaDXz/3OXIGwKg/9glDhKwLwxa4iHBS6ADwWQoCiBPMXfhztD3fKVrzq84Fv6UvGR9hJ/8C3lgPVIhcK83f2BO9E6cmfDkmcelaK+r8WQ4bazNlvVeQJCE+BcZU3rE5ku4EkSsswDciKVn7b5i9Nm0fmpwiyAOAALt+ly8YRVZRkhljAGsWMs+OLdIESgNM+E2+H9ZxrjTNax8pJOXt0XAU7XEZKcSDr27TtsKZSTyUygC4tczFIZierJb4E7mtbcAvaP3heEe6tnyXUNnwuoRsIns51MV3uAV4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6Ql8tbi4nmu04AHMyOCwGDeOFhGCQcurB/1FEKdz48=;
 b=eq4rF6VT2V9pHlUIdHF11dSfGg+P9mVO6Tupv4IDMT5BhvXSWaZwqgy1gKIGP0n7j2xH0nMnr/JTyznVDKuvsW1f9r8jWuB2ZY1nHNdOOEbYfRPp3FRQdKaTosesxo9mEVJxIfhkHSwtgP/QHYZ2UCtbtGeCBnVCsXmnvRbuDmp9aaUEpuhAxWGjUVmVMC6gaMzNdgWlr91xdeISqcbfCnMdDrA3xoEq1BoO7p8CEm5IsuPg9dw+KSVsi+mFMDvbmTv1gSeq7HjvkGj3Z/twf0a3Ye2e99/j71fc2jcLXgvxlE6yvHOkFqR6J0DuaFob+VmFtxyBpADI88+bji8VPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6Ql8tbi4nmu04AHMyOCwGDeOFhGCQcurB/1FEKdz48=;
 b=MAu6i125wC3oAxALp5YuZ4iPKgsU05gItKqOq4Fm0DNN2qzPHegHEFGTJMUJiX02hcEJ/o+D3O8NCbIjnPdl10eta1b4Fj7H2j+LYb1S1TQV0HlueMzOWfzHhcyDQFaNSHK9GP6/y4Obk/HnEXGUTALWMNkHhGmRbYOvYu7PEFE=
Received: from BN9PR03CA0263.namprd03.prod.outlook.com (2603:10b6:408:ff::28)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 21:51:17 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::80) by BN9PR03CA0263.outlook.office365.com
 (2603:10b6:408:ff::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:51:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:51:16 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:51:13 -0500
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
Subject: [RESEND PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode) data structures
Date: Tue, 7 Jul 2026 16:50:05 -0500
Message-ID: <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c6024a-bf1f-4e3a-c211-08dedc71df39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|7416014|23010399003|18002099003|56012099006|22082099003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info:
	jKyV8U0ObhFaaVV1qWun4EwR+2cImYbMZRAIrJ8xNpM1tXud4pAonloTDldvaWJMI7RSAYB4HibpuKIU5lvbmFGPN02jxctqLveAcX12baHw7HZg9jdGXqi1NOyrYz+KZgFFSnorNe1j70EE6tCXZGI2bwlM2MrGgmAik+BNBkmQwhSF4nULkMVO20V9T0vARYd1mY4j6ZyX2vmprdyOo+Ru6Xjl3bcov+ymvCZATHR90xHhPj8Rq6xBCFanZpngC3Gzu8mr6FXTe12k84Pk3foo4wg/y6llpKS6iR2iqQb22z56OfT++Jp2Wn9hx0417H2zgqjQlQqL/TRRowSAHLoy77ds2iI+f/7vEPCsXuqcod6HZFvcBMJn7160jlXkAiyy+zwF0tMdow38hSLLo0rc2fiBxaq/33Jx9vt1a7hW4juLUYUo21e+/IMEHwHhOX27LmzgRkuKpt353NNqPlVoq247EXjqwRB2fIcK/SiU9gGMq9sy35rCp1WlZyYeGjBnITCG75LExqi24mePU42trVwYaod8iztAWUOu0QjKTTJFFDw68AFwwRiuqYnXS0Nwk0LcXJY3N9gY3PG9DwMiFiKBhm3vDOZ47JEGOFUw9pPab5R9ecW8zi3RtdjuKWZedZx3z2zRP3bX/shO2pEr/C23BHlsH4aTzhROzGXm9lewRxXIw9v0lT+zXs+Wdpkbai2avpmjUwXSusPMRw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(7416014)(23010399003)(18002099003)(56012099006)(22082099003)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NoyEto2xaEppNGyWMbeQ0tyZnRdzTjDMg0ZNxMCMsyYP5XtOHR/FXnq1WopMHH1MZ+uUt7Hugm8+tPT1MyB+sYT+NRSnC35mKtcOhREYMClQN5pt3aGFvzxk2/YupTZ78Z3W1Hl/PHFSUKJPlN38i8L53HcPGl7D8zwTXH1z67GIYzXhozg7wbQJ1h+WDIGFDeUggIOTbAkDvnIPgJjdDJopn/3ft4lWE8xqveQcQR6A9c63Fco7kLllj2lzeoaKOFB3gcntTUulfu469jdskzon18+41Xp44aIXLwBGvpq5jnYfvazwKeE1hPW9sBszWSGABpgzkW/G4BisxEnxAgiimG3w67cDY2yFHC+TkpAMvvCnXKLdXJsLCi3YqPt60jIwrKEnUO5YxJvLUoQhvxW1oTwnjUS9jkdYtRh2QMo5IvxQKARYMxVgFbKp5jKR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:51:16.7263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c6024a-bf1f-4e3a-c211-08dedc71df39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132

Kernel-mode traffic can use a different allocation and monitoring context
than the originating user task. On x86, Privilege Level Zero Association
(PLZA) enables the kernel to switch to a different CLOSID (and optionally
RMID) when entering kernel mode.

Architectures need a common way to name kernel-mode policies before resctrl
can report what is active or what the platform supports.

Introduce enum resctrl_kernel_mode:
  - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
    from the user task (current behavior).
  - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assign allocation for kernel
    work; inherit monitoring from the user task.
  - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assign a dedicated allocation
    and monitoring for kernel work.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Updated the changelog to be generic as possible.
    Moved the enum resctrl_kernel_mode to include/linux/resctrl.h.
    Updated the code comments to be generic.
    Removed resctrl_kmode_cfg from the code. This definition can be fs
    specific only and architectures dont need to know.
    Changed enum name to resctrl_kernel_mode from resctrl_kernel_modes.

v3: Removed resctrl_kmode definition.
    Changed the kernel mode definitions to enum resctrl_kernel_modes.
    Used BIT() to set/test the features.
    Added details to changelog.

v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
    https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
---
 include/linux/resctrl.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 73ff522448a0..c7abed51cd5f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -703,6 +703,37 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
  */
 bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 
+/**
+ * enum resctrl_kernel_mode - Kernel-mode control and monitor association
+ *			      policy.
+ *
+ * @INHERIT_CTRL_AND_MON:
+ *	Kernel work inherits the allocation and monitoring from the user space
+ *	task. On x86 this means that kernel work shares the same CLOSID and
+ *	RMID as the user space task. This matches today's resctrl behavior.
+ *
+ * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
+ *	Kernel work uses a globally assigned allocation while monitoring is
+ *	inherited from the user space task. On x86 this means a CLOSID is
+ *	assigned for kernel work and the RMID is inherited from the user space
+ *	task. Default scope is all online CPUs; a subset may be selected via
+ *	the resctrl group interface. A CTRL_MON group is bound to this mode.
+ *
+ * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
+ *	Kernel work uses globally assigned allocation and monitoring. On x86
+ *	this means both CLOSID and RMID are assigned for kernel work. Default
+ *	scope is all online CPUs; a subset may be selected via the resctrl
+ *	group interface. A CTRL_MON or MON group is bound to this mode.
+ */
+enum resctrl_kernel_mode {
+	INHERIT_CTRL_AND_MON,
+	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
+	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
+	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
+};
+
+#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

