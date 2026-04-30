Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EB536E467;
	Thu, 30 Apr 2026 23:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591550; cv=fail; b=SsXVlLZ84oOujF8h2nVBaYPUXLnHnuOF7IBwtg5DX9yvvN2RnxWPYEhP+fMHL3IcbnWyB9y4N3QuOoSDUCpkxdYHCiBhYQOPiQgpscnKNt+4YwUj6hKKoCb8wfBkZjAFw9KSZXFtoaSijRXkKBJtzsWPHETxoWwq91tkPfeOVyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591550; c=relaxed/simple;
	bh=+fzAWGDdSk3iFIjEm7QRiE6VwjLzVmC4qdvhuIC6IXw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BZIT1m3eP+nNhiOGMgWvXj7BY5roqklmTcYMMiGDtvS/If7WRDoWRR8SVi/BMjGtjKG7L0hpJ5dVRrwJ/s2CD0cF4eVQvofVuogiiUxBAo8Ef2g3zkUsyonj1avZCAk78h4szh2xwR69O5ykVAE/geuLj+VR67HvGa6HPIIXflU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=omacdObf; arc=fail smtp.client-ip=52.101.61.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="omacdObf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXE6L1LNvNLWz0+EEku7pkASTK340rS4TCPOlanyZQmjPlXRkAteSBml4SFf3GBPSF6GuZO8WdfNPRjmXJ6TSwTaOkX//4PihSnk4hlhpQj1vUVv48v1k0hIi9NGzrU6MGMSZkeIHa6dTlWjGcSOvwiiNANyMDUMo1h3r3NFQ4nxW16Hb0EHKUmZ9EQfoV0UtBuHbC467agBj6EDOwvqKbmqbjNbVJIGYck6UbhzqCHRF9P2dUR5g2N9NORojxFmM7IyIl40HOtn/ikgsAYMvdfWQSeMLCaSlU52PDoBXvfEbmpg+S9vI+CThfXwbKfCegycPYIXo2Qn1eWVxJXC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgshtW5NfQgVlTX1TujJF7IAC2HfmaRzgd0bkFEIJbA=;
 b=qxFaNQY/x0hpJIQKGxO6y6S4uf0wPLaCcq3P07xqTT5o9WQ7KfsxZjgEKSPL1pSYOX5UgZdgwXwXG2WwIGHCVWMFSIwLCQGsBex3qQwRqUXItEqp6qftzEtLxyV3Oz2o3oAQPm8IVRp+tMSJxubKBESSNDYuCppIooko7QvlOX+HwFTizuxJtMP2qgaX2cnb7ou8tRWlzE1SAwDroWhCRhqkCt/R4QA/f8CmVgDvStnG4N/qv+4bP6cn8I3W97RZxY4ARCHIcTRNV3prlSUW5LZlBq3Skh1JqTliUFxRMa7+diw33LvSPNONkQXu9p2MTYTn8knQZ+uvfcT+M8fxnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgshtW5NfQgVlTX1TujJF7IAC2HfmaRzgd0bkFEIJbA=;
 b=omacdObfJmRlldgoUOfv2j9Es8v4nudBmuRstfeiKl+KUfMS8csR1VRi+6CcPM9rlP5nzbebmz+N9LjFIrTgwSlp5C1sLw8XFP4wo7bLAekBn74YbbUPKziz9gvdOnQ9OdaMkH9OQEij9Gbc/uMIxB8lInIfpwys31orCTrcdls=
Received: from SN6PR05CA0002.namprd05.prod.outlook.com (2603:10b6:805:de::15)
 by DM4PR12MB7573.namprd12.prod.outlook.com (2603:10b6:8:10f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 23:25:31 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::ba) by SN6PR05CA0002.outlook.office365.com
 (2603:10b6:805:de::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.20 via Frontend Transport; Thu,
 30 Apr 2026 23:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:25:30 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:25:28 -0500
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
Subject: [PATCH v3 03/12] fs/resctrl: Add kernel mode (kmode) data structures and arch hook
Date: Thu, 30 Apr 2026 18:24:48 -0500
Message-ID: <3996883c2d1d47e094f97bab2a2e74df3f8c55e7.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DM4PR12MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: ec576fc8-c67f-43c8-f3f5-08dea70fc545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	wJm/CiOagfxnKR6QPrWgB3BapZBFWKV29Lfgt9UtczfhY/4x2hxr/o64kmtFBuIhNEGqjE2OYiQqnanOKTof5LzfCl82aEmjGMWvEbJdKP+uLeghY+B1IgI3TtxPt0zvHeH9miyfgEEzrtBL9DE8ookk/olCH9AvllWos3ph+M9g8k7revphMKsxiMJUt79AWdF9SmYSAm97knh2rpj+eVKDq2OOTn7Cwag6uNC363hdrxvACTX3wQ1UNjCm9UHglf3FTZImJPLxduUkxKg6Id40XlGp0YXSvWx2T28pXBst5iKNdfCYOFrmhKvD5wp87zdNxjknFPMgTWOG9lLEGPbqIgwWjTLRDYexq/sDVPMdGYzWYg7qAyzLaPTlVXE3o0nH/O8eZlorKoNYcA9/l6sZLeR6cPY/ptqB5mAiFh/qGut21Bxd9KDKsZywKB/51wQ03sMUw7gQ8C7yUPEfOkLZ6GyCnTUNGP8WLNyuOTg8R/CzbruAxFxoW2g4BSYOnz5Euthhy6aHnoGblyZpWBeaWtZuNJfyWMblBlX1Wz+hM/0sb27z5wddCi8NjYU2d1MOa9C0KTTNQS4PaSmhCMacJunFY48LaVk7YRzVK+v5dTDBU+5a/NuiG1j5Y05Z1q5/Gf/862Ui86J55DLWnJTyj5/w3Ux4Owexj5REAeV4mL8QEP4ldFWyCKeVTR7h
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2VXsnR6sC+GA+MpdRwLCdDIeo5a4UVck7J20FPYb6zD1MQx8l33thoiBiwZgudNKZfkfVKd5Y8NYKmCnFTMy5grRRkN3W+soorhS6ZqmE1GzgJHtlzORn6hqKLSoK6epcjBQD2okQDi7lSbRv0piOOcc0rnAps2iH+fZo8Cy7Fwn70IAF3t28gGBvb0kS5jiz88nBtzndPnjElQ+4DiN29NuZkRYiDxZIRjqqaXj+fQ5BMWj41L0lhiJiu2Vk6tKCnppE9yQWq+O3RwiBu1gegG7TBhdMdkqw3ynnyf1mPJUtCqnNFEaYqyV14ECKB+aIoPWvZjPMPymWiaRDBVsDnjvIE18ncF2mGIIEjcmvxSbUfVauRheipvOUEeDVP6DgElhbou86neaweCILhmmHYf+LQIIhNqpT9J8qioxU0TOToPzp522tC1T1MegDCu+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:25:30.8617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec576fc8-c67f-43c8-f3f5-08dea70fc545
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7573

Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
and/or RMID associated with execution in Privilege-Level Zero. Introduce a
generic enumeration so that architecture and generic code can agree on the
available policies.

Introduce enum resctrl_kernel_modes with the following values:

  - INHERIT_CTRL_AND_MON: kernel and user tasks share the same CLOSID and
    RMID.  This is the default and matches today's resctrl behaviour.

  - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: a CLOSID is assigned for kernel
    work while the RMID used for monitoring is inherited from the running
    user task.  The default scope is all online CPUs and may be narrowed to
    a subset via the resctrl group interface.  A CTRL_MON group can be
    bound to this mode.

  - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: both CLOSID and RMID are
    assigned to kernel work.  The default scope is all online CPUs and may
    be narrowed per CPU via the resctrl group interface.  A CTRL_MON group
    can be bound to this mode.

  - RESCTRL_KMODE_LAST: highest enumerator naming a policy mode.

  - RESCTRL_NUM_KERNEL_MODES: number of policy modes; use this to size
    static tables indexed by mode.

Also add struct resctrl_kmode_cfg (the snapshot architecture code returns)
in include/linux/resctrl_types.h, and declare
resctrl_arch_get_kmode_support() in include/linux/resctrl.h so architecture
code can advertise the supported modes.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Removed resctrl_kmode definition.
    Changed the kernel mode definitions to enum resctrl_kernel_modes.
    Used BIT() to set/test the features.
    Added details to changelog.

v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
    https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
---
 include/linux/resctrl.h       | 13 ++++++++++
 include/linux/resctrl_types.h | 46 +++++++++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 006e57fd7ca5..ce28418df00f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -699,6 +699,19 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
  */
 bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 
+/**
+ * resctrl_arch_get_kmode_support() - Advertise kernel-mode capabilities
+ * @kcfg:	Architecture ORs BIT() flags into @kcfg->kmode for each supported
+ *		&enum resctrl_kernel_modes value (see &struct resctrl_kmode_cfg).
+ *
+ * Used for optional features (for example PLZA on x86) that can assign CLOSID
+ * and/or RMID to kernel work separately from user tasks.  Generic code compares
+ * @kcfg->kmode with the effective @kcfg->kmode_cur; when a global-assign mode is
+ * active, @kcfg->k_rdtgrp identifies the active &struct rdtgroup. The default mode
+ * is INHERIT_CTRL_AND_MON and group is default group.
+ */
+void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
diff --git a/include/linux/resctrl_types.h b/include/linux/resctrl_types.h
index a5f56faa18d2..3aba07764b99 100644
--- a/include/linux/resctrl_types.h
+++ b/include/linux/resctrl_types.h
@@ -68,4 +68,50 @@ enum resctrl_event_id {
 #define QOS_NUM_L3_MBM_EVENTS	(QOS_L3_MBM_LOCAL_EVENT_ID - QOS_L3_MBM_TOTAL_EVENT_ID + 1)
 #define MBM_STATE_IDX(evt)	((evt) - QOS_L3_MBM_TOTAL_EVENT_ID)
 
+/**
+ * enum resctrl_kernel_modes - Kernel versus user CLOSID/RMID policy
+ *
+ * Enumeration values are contiguous indices from 0 through
+ * @RESCTRL_KMODE_LAST inclusive. Global-assign modes treat all online CPUs as
+ * in scope by default; a subset of CPUs may be selected by using resctrl
+ * group's interface.
+ *
+ * @INHERIT_CTRL_AND_MON:
+ *	User and kernel tasks use the same CLOSID and RMID.
+ * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
+ *	A CLOSID may be assigned for kernel work while RMID selection for
+ *	monitoring follows the same inheritance rules as for user contexts.
+ *	Default scope is all online CPUs: subset of CPUs may be selected by
+ *	using resctrl group's interface.
+ * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
+ *	A single resource group (CLOSID and RMID together) may be assigned to
+ *	kernel work. Default scope is all online CPUs: subset of CPUs may be
+ *	selected by using resctrl group's interface.
+ * @RESCTRL_KMODE_LAST:
+ *	Highest enumerator that names a policy mode. Use RESCTRL_NUM_KERNEL_MODES
+ *	to size static tables indexed by mode.
+ */
+enum resctrl_kernel_modes {
+	INHERIT_CTRL_AND_MON,
+	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
+	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
+	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
+};
+
+#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
+
+/**
+ * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture
+ * @kmode:	Hardware- or policy-supported modes: each enumerator from
+ *		&enum resctrl_kernel_modes is represented by BIT(mode index).
+ * @kmode_cur:	Effective mode(s) in the same BIT(index) form as @kmode.
+ * @k_rdtgrp:	Resource group backing global-assign modes when applicable;
+ *		initialized to the default group at boot.
+ */
+struct resctrl_kmode_cfg {
+	u32 kmode;
+	u32 kmode_cur;
+	struct rdtgroup *k_rdtgrp;
+};
+
 #endif /* __LINUX_RESCTRL_TYPES_H */
-- 
2.43.0

