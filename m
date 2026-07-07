Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011047.outbound.protection.outlook.com [52.101.57.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00880480346;
	Tue,  7 Jul 2026 21:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461164; cv=fail; b=aeo9fI1KF3ByJkvDxM5rulTsR3HAmAcIQrRLF08ANnLWyXzVnuTm7RT5XSE0AO2XOLAzRQES894hzclQTTO5WAuUl3sUGiVm3G2o5Gxt/C0FYBDD6XJHsbbeIWDjC+NZvt12F5D0XZiFlh5fGRMm6ZJ9vIyj/PnaSrOEhchPiLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461164; c=relaxed/simple;
	bh=7hHe2T5nS/hOdWxul4oRU7RUBCcwXRE7jsbmHooAFSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sr2AcTV2QeNPKLlhIrXofOKt7I7a0GWwnB+CvMbwukIFT+U7Mrim5bhnrCz1RbVF+HeCenQJmXUDesFStaVbZCLcxCKa0/OIP4059F7PT4bBy8ZQV/JW2e1mEfbhkdtKjwSYQpvrTdjWhbRDsjI/FjIdn2YFIV2qCvIEvS9z1w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bjDLBrZM; arc=fail smtp.client-ip=52.101.57.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bjDLBrZM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEqP2ZLkd8KQm8A/B+ke87cX8EYbIFOz+hCIJDmIo3G+k5xzZB1c7DZXTyrcjx/+gZSyAH0FphBcMLgziGJ1/Ndl0fnZ3m5Whbv5ZVuvRvwv8nzPAqwMKaSYjnKuJcHFkrA3tHrFUKZofuzXRSYARpCTdcjMIcIjskv3cBTe835TBY92azoyRTUXEyZaLsr/741+ET30TkdWbVnZ1cz5XvD6/CujhCwgfqAV9En0oQD8FjPOXlm2TTUTpHek7WwCjMT6dbUv1axyKSmkjARiBluYEL8XynrPd0aSt38XO78HK3YZMUNeef1m3+rJ6Dnn5CszROUBiexDLyEOWZQ2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30VtlACGiYiTlUIS+jRIdEHIHfZAFJaxyi/2Vy9sjJs=;
 b=rZwDBbhUL6OPTAsg+JDusFWMX6SgEZXP1afGQhw9t1Q+WesWJfYtkr9pttpXDQbSegEpVR/aBaNOrkxIfUYfqhvn1Rod17haVoLE34L0IWXHLPd0GaNsCK1bMG7nsLBFPMj5/eVCtuBHteOXx35dJL+/dxjn7dz/5/mHXVOjzrquv8nmlpAlO9AGGPJSai45vsikmBq/E8drkT/yBfgtlz7IO4BPU2QGZCZ6XP46Vexuw135JVWywKUzFtG9YeqMilAQrU99UgMfbksH2TOMcTJZ1/w4kBy7wao0M7SgjzGaCm+OF6oyZuLHIHmhgtdFQ6ZkXeGslSLG+CuAEF2vzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30VtlACGiYiTlUIS+jRIdEHIHfZAFJaxyi/2Vy9sjJs=;
 b=bjDLBrZMD91Ob4ST1IQEbObSFYUe96zAMfZJ3heMCpz02VK7Peigq8ZryuAM+mAZMCslHGwmhN7KmBORJCalsqAgTmRH0J97wCpuiBAXwe8v6vvOL2bFMhtSBwbDhqDLaQxGqkBbo0MiP2GV5gvSpuU2+z80G4ZqMKHe58o/F8s=
Received: from MN2PR08CA0005.namprd08.prod.outlook.com (2603:10b6:208:239::10)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 21:52:34 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::31) by MN2PR08CA0005.outlook.office365.com
 (2603:10b6:208:239::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:52:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:52:34 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:52:32 -0500
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
Subject: [RESEND PATCH v4 12/15] fs/resctrl: Hide kmode_cpus[_list] on groups not bound to kernel-mode
Date: Tue, 7 Jul 2026 16:50:13 -0500
Message-ID: <8cfc12d1f79cf649633de01c5878ce5ab777a58b.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 617cc4ba-b057-493b-6309-08dedc720d63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|82310400026|23010399003|376014|18002099003|22082099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	ZTykcat+gYxXTv7P/5avbfLoDnrY7WO9lJwjHZPFoXfpvNFUzMVR5orbmJgxWkjTs2X6xKMWrHBNsVxW82JP5xYzIpATnqTP5NOZOR5c7+wfswQEbQNbrmZdUH9ZB3PQ6ymi6Lhzve0Fx2lthpupYfJPHXTf1v2fmFQnUyhGsCXGMgHWKnnVi5GcGkN1f1xyENPGj+lDFBSj6MmN0zkLKWG3R67y1stpVLws+qynVdOFsNtvC2IyLbI53fXyIT1trfYO9Bx9YCEcgyk1dXXilZW0cv9Sc+g3TB9ZeG8tgeR8iLD16w6+AhZYjiBBblr7Kx8Uj8p8xbtDXbH/lDxF1XXZKLmNUx/w76mEd7DVFniCH690SNYfVjz6FOubpa0DmFUsgdG8Hd1G58Qd8tU1nKPg/GTPlGL2QstmJlG7X8v/dCnNM+AsjoFYO6N+4lewG1uwGzPXxOrHfdGLUO1Sdd/OZ3ONuVj06sfHdln1a5PfbxTJcIQMVVX+I4C0i5A2iqdnm3v8CjRxJmh3s3kZQHX3fsrR4Nt278+hUoIsVLsWuW5t4OWIda9F/1uvb/AnSuIWQkSoka9y//AhsqMajSwdn5xCcnbPPEWQ7B4xJLEGjzZwBxsK9NZCzfsyk8BPe3CjY5Pqf5sI70XLdU2uDGE0ejM67mEteH2Z5XlIlJxdNL3P937KRq7U8k9vJp7kfKxYJrN3mIXi9AKaHR5phQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CGMYqP4FL6ZLK1qh1pOd4RCaT6Glf7s9xnGZUHgLx+CEWpiWHhp3D9IG6xNSmE1IRVzGwHNxV4TM98K0B9Ibqw+hJ9t0DpB9Zc/CeEcE6yml4CDxVbhQXfSWuWE0miNbbXU0lDnQcpqEXzlMpoLnCuocWPsB3MSfFki6dqX/Oo4qu38/ZAFcWSnlEW1A8Mc9E2BgF9bteF3zh17QAlchxzGVn5ATmyVXtVP9S1Vn6R6d0RJW76N62/TayZrA5BkKFR1pp2BPCQ/5+av+qqEUG0jOpOuqr9xQXhw2T4EDC8VL7ziPk9A2BxC/qqIGPemQ5O2nUySdUQyB86ck2TF+Sjj7Uki1Tvq+qIvhs5RsLzuqWzYBRROiochcYMrj0avTXLAcHF2yyUUT7vaUUYJW/9aI2o9wo52K2Gt8vjcaW3uVNnXuGqGYujgsNNeCBdBw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:52:34.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 617cc4ba-b057-493b-6309-08dedc720d63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589

kmode_cpus and kmode_cpus_list describe the CPU scope for the rdtgroup that
owns the active kernel-mode binding. They are meaningful only for
resctrl_kcfg.k_rdtgrp.

On groups that do not own the kernel-mode binding, they appear as inactive
stubs and can let user space inspect or update state that does not apply to
that group.

Hide kmode_cpus and kmode_cpus_list on groups that are not bound to
kernel-mode. Keep the files hidden when groups are created, show them when
rdtgroup_config_kmode() binds the group, and hide them again when the
binding is released.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Updated the changelog and code comments.

v3: New patch to hide/show "kmode_cpus" and "kmode_cpus_list" when kernel
    modes binding changes.
---
 fs/resctrl/rdtgroup.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 413d3ff14546..c537846d9264 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1127,6 +1127,35 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * resctrl_kmode_files_set_visible() - Toggle visibility of the per-group
+ *		kernel-mode CPU files under @rdtgrp.
+ * @rdtgrp:	Resctrl group whose "kmode_cpus" / "kmode_cpus_list" files
+ *		should be hidden or shown.
+ * @visible:	%true to expose the files, %false to hide them via
+ *		kernfs_show().
+ *
+ * Each file is resolved independently as a sibling under @rdtgrp->kn.
+ * Failures from kernfs_find_and_get() are deliberately ignored, allowing
+ * callers to invoke this before activation, during group creation, or when
+ * the kernel-mode binding is updated.
+ */
+static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visible)
+{
+	/* Keep in sync with res_common_files[] entries for these files. */
+	static const char * const files[] = { "kmode_cpus", "kmode_cpus_list" };
+	struct kernfs_node *kn;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(files); i++) {
+		kn = kernfs_find_and_get(rdtgrp->kn, files[i]);
+		if (!kn)
+			continue;
+		kernfs_show(kn, visible);
+		kernfs_put(kn);
+	}
+}
+
 /**
  * rdtgroup_config_kmode_reset() - Tear down the kernel-mode binding on @rdtgrp
  * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
@@ -1155,6 +1184,7 @@ static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
 
 out_clear:
 	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+	resctrl_kmode_files_set_visible(rdtgrp, false);
 	rdtgrp->kmode = false;
 }
 
@@ -3068,6 +3098,7 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (ret)
 		goto out_closid_exit;
 
+	resctrl_kmode_files_set_visible(&rdtgroup_default, false);
 	kernfs_activate(rdtgroup_default.kn);
 
 	ret = rdtgroup_create_info_dir(rdtgroup_default.kn);
@@ -4098,6 +4129,7 @@ static int rdtgroup_mkdir_mon(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}
 
+	resctrl_kmode_files_set_visible(rdtgrp, false);
 	kernfs_activate(rdtgrp->kn);
 
 	/*
@@ -4142,6 +4174,7 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_node *parent_kn,
 	if (ret)
 		goto out_closid_free;
 
+	resctrl_kmode_files_set_visible(rdtgrp, false);
 	kernfs_activate(rdtgrp->kn);
 
 	ret = rdtgroup_init_alloc(rdtgrp);
-- 
2.43.0

