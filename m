Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BDB184;
	Thu, 30 Apr 2026 23:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591608; cv=fail; b=pN1UZON3haxmeYewMTaGgkLOtTpx7gtS1QOLSo+xuRCLgB6OEoBMsPwiH84QEQIyni9qODG0rMncbnOC6P7o/rlsZiJ7m151RgPx9vnmTePIL8Pg+9ceddGLp6GYQ6SIt5sRUJdj7z17zmVU4cSt3nBrVfYkGb2UInhxldJcu0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591608; c=relaxed/simple;
	bh=P8YJNUfWbUeesvB0AityU1i3s4fF3p9jUbd83cI1pvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P63Xy8egZ4Mriw4BTOMy7a5EGAAvgSFk6i6BGHCRaq5k8b7zTgmEpVCe2aaEnOs8qQkDGnbazBTS6yJP8xAYljTI9W+iHXbvjHMqDzcfHv9c4Uop8jrr40tgSo0JlKPwuo6AWOj8ON2Z2GbmHQa2O3y7mvpgugtJY6oZykcaQu0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=CZVqAwu2; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="CZVqAwu2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC0xqI+ZYLN7gvScrrwdBRjO6hDJ+MWoskoETdfLQJ4VFQ1O8tgpM7kofzvTRNmH/F/PWfO8wQxvMk55MNYY7y9MCS2Vf/7ETw7N85NVJh2CTxwwFPr5Xap7SO3tzs1dSol6j1ih/BLZ+EBIeHKZYA5JCgL1uTQ5qESgre9UqEn+HNCA5Qi/jHyRanTagyLqdOWnwn6Zi3blkAXuEezPQsbLUqfYRjhxWlOOV6PTpIXBSzzyyEczjJD39Aw/XifxYiEL3cLBKNUSD5OCfRY6gZXQy5eBOSY9B9c5930T9q3gV5iLlQ5DzeSHEItmEKGooLe8h7HsQQ7jcmejF4THvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imulT87fMdq5YhOQlVEhwCcg+DzEpam9kdvK28pduw8=;
 b=M1gVSm7NtnusxjfJBGR62TIP4+Fbz24aUFMZAX+23hEv3kVPlCa7kcwpN7guaQAFzDleLjSSaMYVY07gUroNObO+YnsIv4n+TryW2BKPoD76tRtIppTNtNTNB7ekF1IBL9jhuz7AdZpFEm+dh3/GaAkJcbWx6uY8xd/jgJr4oUuISjB4oJu/7fg9AaZ1CJcCv/VVtlsGZdebue8JTDYdSu89DA0cZaxGfMkrhVkyC5tznMXpg222ocyaEGXubfyQ5z/auNK1/4F0RLGCz6CzjdRjuPzRoWaHGkb5FETPJerIVlUdUpZKdw4YS0pk6bE2xX9TLrmhpHUjn6p1ZAbK5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imulT87fMdq5YhOQlVEhwCcg+DzEpam9kdvK28pduw8=;
 b=CZVqAwu2xymJAcHqupGuQbxSXMG3n559j7M8rwoPbRcbW2IGCzNFq3k9Qj3vnRes8AxlmlxTFqIPnuatB5cfENFujwyrl090yowjv+KO2sBbHFXDcbQfPFMbVfpQ6eHbrLBwuoJk630+Sm29rC+3SUA/aKVhuf7WQNAGcxU2Tzs=
Received: from SA0PR11CA0147.namprd11.prod.outlook.com (2603:10b6:806:131::32)
 by SA3PR12MB9089.namprd12.prod.outlook.com (2603:10b6:806:39f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 23:26:38 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::b8) by SA0PR11CA0147.outlook.office365.com
 (2603:10b6:806:131::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 23:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:26:34 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:32 -0500
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
Subject: [PATCH v3 09/12] fs/resctrl: Reset kernel-mode binding when its rdtgroup goes away
Date: Thu, 30 Apr 2026 18:24:54 -0500
Message-ID: <280912ae2d2ee068fe5ec94aaf7e6e3f4e1c68b6.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA3PR12MB9089:EE_
X-MS-Office365-Filtering-Correlation-Id: b6976780-2417-46cb-9157-08dea70feb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	lVdz/E0/dFHNimEMzkyireW556FExWbgMVXGUErNd6BFW2mR9GvmqKUZ1C2P9zqO7usyy+MeL7irvlfaMqOOKzHWgF+DhvMMNyFkBNSd9cQdfgZaOwrageV+ezbvYXDQcZSlSs3k5CNO5fMtW/38wvcsEcUEGgfX2Du+bxW9bRLGo7XAvsiFElv+MrAekvB8VO2KTwXukoQVlvdgeh7JuDecV+zxdvk3V6Y646U5FtPpjxoLAaD3z/xO7mZWHXYiUnwaEBjpRL9MMiitkCM+Av9kSF7Jlu3LvxjPqE3oVy3E+b0ijOs/UB1Icr3DBMVtJhsCtwg7qwu7/T1UEPAs86/T57CUuBMu/A5CnwfzaswraDdKVPtld2uqYVsb0KBiHib6+GWtUsYICcGlDjNxrBEMxdeAwLro0kQ5lClccB7RZuj0vnmTGX7uCgYq/YPg8SO2Dln5h7Vt+of1cQ2I4jQigkfnRDSBArONMvuExBSTwP4TRunl86EQeDbCLe0EZG41I4u8vSgEsw3SSEB0JLx7UAnszgW6dzLgYTNfmAUzC/e7s0r180ulGeWh1oVrPaVMYktq0o9aNYmw2EaRUbimApxsXhLywcMDZK7+Dk1iDPREIejKRFs+Zerkesf2XCGZadADE5jMkGt9Apez1aDBUmHhyRseviuudF/a9w71bX0ZrdLL8rfVitTVH0dC72VORdtzV96M9VWOobH7/WWDVzItFg2ZAJNVO7abxdU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	09GJuZODEEMwMRnIQnjXPHdrTfSvUR71iNBtNM6vTWgZHjT/ny9udG/OPwfCROGMeBoPKCG8MwEE365m391kVjKKTHtngp/6Zv3Q6vbfXz0AOWUApumq+mS6s3fjYS7Mr186Qrthzfv9w0VP5tOKQTy/eLRyhcqsS+cat/IbJIwXtu+3drq4ScYu+Le3gTa1SfnM7CfHM+7UZU0uYez5mMHpEj5SWGykX5JUoUyFNMVug8c9cG7Rtg1DgCcvFldcjvDp3iD1i9OldzHa6ZNYkCOvEI1PpvcAo9YmK1iMdS66vw4gu8KOR375qFDjA8HqsAKXaCk2wcqJUqMqe7ivHaYhbNNC1x7A4rIkBHuUoqzyTZ/YD8IWukG8P/3WMpEB/E1YlRJpIygpYuhbh0Izl9Tk7tAAh2VEn57AoCT6oc3WWJ4c0tVyNzYvPwpjutOY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:34.3603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6976780-2417-46cb-9157-08dea70feb1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9089

resctrl_kcfg.k_rdtgrp records which rdtgroup currently owns the kernel
CLOSID/RMID, but nothing cleared that snapshot when the group was
removed.  rmdir of a control or monitor group, or unmount of the
resctrl filesystem, left kernel mode enabled on the CPUs the group
covered and left k_rdtgrp pointing at freed memory; the next read or write of
info/kernel_mode would dereference a stale rdtgroup under rdtgroup_mutex.

Add rdtgroup_config_kmode_delete() as the disable counterpart of
rdtgroup_config_kmode().  It clears the kernel-mode binding on the
group's kmode_cpu_mask (or all online CPUs when that mask is empty),
drops the per-group kmode/kmode_cpu_mask bookkeeping, and if
@rdtgrp was the bound, resets resctrl_kcfg to &rdtgroup_default,
BIT(INHERIT_CTRL_AND_MON)) so subsequent sysfs operations resolve
to a live group.

Call it from rdtgroup_rmdir_mon(), rdtgroup_rmdir_ctrl(), and
resctrl_fs_teardown(); each call site is gated on rdtgrp->kmode so
groups that never participated in kernel mode pay nothing.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to handle the kernel_mode clean up.
---
 fs/resctrl/rdtgroup.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5383b4eb23ed..faf390893109 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1194,6 +1194,40 @@ static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
 	return 0;
 }
 
+/**
+ * rdtgroup_config_kmode_delete() - Drop @rdtgrp's kernel-mode binding
+ * @rdtgrp:	Resctrl group whose kernel-mode binding is being removed (e.g.
+ *		because the group is about to be rmdir'd or the filesystem is
+ *		being torn down).  No-op when %NULL or when @rdtgrp never
+ *		carried a kernel-mode binding.
+ *
+ * Wraps rdtgroup_config_kmode_clear() to disable the hardware programming
+ * and reset the per-group bookkeeping.  When @rdtgrp is the group currently
+ * bound in @resctrl_kcfg, the snapshot is also reset to
+ * (&rdtgroup_default, BIT(INHERIT_CTRL_AND_MON)) so subsequent show/write
+ * paths do not dereference @rdtgrp after the caller frees it.
+ *
+ * If the underlying tear-down fails (cpumask allocation), the snapshot is
+ * still reset because @rdtgrp is about to disappear; stale enable bits on
+ * those CPUs are reported via pr_warn() and will be cleared by the next
+ * non-INHERIT reprogram.
+ *
+ * Context: Caller must hold rdtgroup_mutex.
+ */
+static void rdtgroup_config_kmode_delete(struct rdtgroup *rdtgrp)
+{
+	if (!rdtgrp || !rdtgrp->kmode)
+		return;
+
+	if (rdtgroup_config_kmode_clear(rdtgrp, resctrl_kcfg.kmode_cur))
+		pr_warn("resctrl: kernel-mode disable failed; stale enable bits may persist\n");
+
+	if (resctrl_kcfg.k_rdtgrp == rdtgrp) {
+		resctrl_kcfg.k_rdtgrp = &rdtgroup_default;
+		resctrl_kcfg.kmode_cur = BIT(INHERIT_CTRL_AND_MON);
+	}
+}
+
 /**
  * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
  * @ctrl_name:	Control-group name, or "" for the default control group.
@@ -3635,6 +3669,7 @@ static void resctrl_fs_teardown(void)
 	mon_put_kn_priv();
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
+	rdtgroup_config_kmode_delete(&rdtgroup_default);
 	closid_exit();
 	schemata_list_destroy();
 	rdtgroup_destroy_root();
@@ -4432,6 +4467,8 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_config_kmode_delete(rdtgrp);
+
 	/* Give any tasks back to the parent group */
 	rdt_move_group_tasks(rdtgrp, prdtgrp, tmpmask);
 
@@ -4482,6 +4519,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	u32 closid, rmid;
 	int cpu;
 
+	rdtgroup_config_kmode_delete(rdtgrp);
+
 	/* Give any tasks back to the default group */
 	rdt_move_group_tasks(rdtgrp, &rdtgroup_default, tmpmask);
 
-- 
2.43.0

