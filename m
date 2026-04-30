Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562B13C552B;
	Thu, 30 Apr 2026 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591591; cv=fail; b=TSUS598tY379kauQDrVTL2Ta+RbiN7QPmdOFNFkbrzRKiUSA2M0T3hiHgXZ/OJr5eNHphdnsXUuafD4QOaSUR+KWvdvHKKfPTDw1OveheESwbpJ6ShwU58OsBZQi+mbao2q1EUkTHkH4QhcKAForVK/mwBFvhPlo9/TXvGBNmbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591591; c=relaxed/simple;
	bh=k5KjxTZnM5kjAkqw51MLazrBGp4RofSaP1WJOMKPJd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/cCl2dJKhnQQ9nB8Mv0T85fyAu0VS43PgHmwKfIbEh/cXsvM3Puk4fObR5LIuZGnmZxreyhreTkv1duly2bAnjb/xFflqMpyFxBCMjfupirtsQNveqlyIY4QFFr6FgSKeqTtXzfqjCvZod6efFNyltOU2f1IXNQslwBd89chr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xHSWsFvs; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xHSWsFvs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqezkgiYua3FqFZtWCOVoDNM+hHGpAwNH1sQBYRPo7rSNj7RMbvlfHERHpuAconJkVMuz9eh+cIqO8qUE41G3neNN8YVIl3cBwSrNM2DuniA7I1X7WcWDOQnzSNuemqdgyA+Rm/55d/AVG9UMGEFo1xL/FQEUVpGEdqC0AkCs/0Ckx5ceGWBWPUmLALWRMdtSVE4A2umejCT2XTnhu/ciuwnPIcq7kAlmKilKUMZTj2bvP3CAayIDrcQ9YNOgwz+6oeZuK7/1RLnr4bkNflATFZnFY259GVpzw6vbeZ7A+ubMGh6zIMYi+4w2gAlf8f6bVHk+JnNBwtQ9E6ucLAbrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCc7eVPivfhPvvviLvPaGT/T1TXDJFOlq2BfjKE3WjY=;
 b=yc6zOmJ1yrB8kzHsLzAjeZWm+fN5zIv5fltb++w3WOl6RlB0NB+7+iiVhRWOuI1iQC8GAi+lngmmGcMrTkl3gr18NHWUDa+smiq6lbUSeiW5QwbuDMo7pvZBLwgn5+gxgJ9JNbx7gU/WQqZBxl32VOiejbzaQFXNL5FVFRNia/bhBpUQWuCLfsM5l4wWws4NLRe07Hbm54UDv1Eau9+ovYt5/1+IJkxfpHteYJx5823ZUH9AGkth5D6Jnv8491AtrpKfPsrhYHXQRR+zlTNCs8oqeoyPfjr0Gaz/mH2VBOUVSNQAB7MM+Xf4nuefPscYMGpUs1TPQdbIfscCTg7oSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCc7eVPivfhPvvviLvPaGT/T1TXDJFOlq2BfjKE3WjY=;
 b=xHSWsFvsxev8k+4JimUHtW0KC9i7Ur/emNqFTHMAFyyHTml+FPB7X4LqNnnKW3lsLrsLd+7CTBu2XD8Hw9z8uJkzGlRS3IDjZ1jKVHrzkjSdOneboPOhsIS7oPazgUOCT6m5cvdXHb943ZmbkJSuSWfwRtYZcFNhng1EHv3htLM=
Received: from PH8PR15CA0024.namprd15.prod.outlook.com (2603:10b6:510:2d2::9)
 by MN0PR12MB6174.namprd12.prod.outlook.com (2603:10b6:208:3c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 23:26:22 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::e6) by PH8PR15CA0024.outlook.office365.com
 (2603:10b6:510:2d2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 23:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:26:21 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:19 -0500
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
Subject: [PATCH v3 08/12] fs/resctrl: Make info/kernel_mode writable and identify the bound group
Date: Thu, 30 Apr 2026 18:24:53 -0500
Message-ID: <768d4b603542f3202ece4294c808dbbf1a8e3008.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|MN0PR12MB6174:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1c802d-e5c3-4bb5-1427-08dea70fe34f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|18002099003|56012099003|22082099003|8126099003;
X-Microsoft-Antispam-Message-Info:
	gPMxUA9Yqfs1cgFTpbL9kBuSNGledmhc1wDNixg6To167Y8s8SsjmAC+lfDkujXateeIoOpnGn0tzv5/WwQrk/JHf0liBOB5vvxyr7iLTFIVdercCpgT0mzHurDKGlOv5GrB9N/L7KMqipDMXxahFRHZfti+swt/RG3wFhJ2q4QEjLxLHXE88Pui9fpU8cGJaQ2JJIAB/iznGXEh+bGRZAX+mtgHPDuYUkyzikANGCa71rcdUiI1YHMuZsg2BeuGJn+y35EYVWuDV1DJRJPAwLiSqPnuHiaM+62/Rahu3bjnnJl8GVsTiuc+WeBObYi/WskIMRzxqwTYpczt3KB7KnbcH23VuJltQdBoRQmPhDZW9PP8/+CtZQXAax1lxcjAR20roY9Bv721C2eEQiTxU3Bx/IkYQ9WI0cG27TJR8oJxFaM21GRD3uDh3e0hoEWC25WvL5al0jVA+yAxNIwf4I7Y2szE7snUBndkrt7Nk/Ml9Xh4dRsH4koQ6H7vciTK1FHe6kJwFV+h8LyTpylOZqdrCpO4Q/oNtpyOKplthcIyqVMhAwtgrxozRghXhqdkqD74ZfhAw5B8BFcnVZrj2VAexLr9RpQ9SUbmWt0EqnDUZeIA4w0TsmP2N6Xc/DmnCM3tlOdPYGWaEOYDCFksbp9YathrV9kDxsuyT9Ln2eAePX6m2Zza2HtNHaehr5RAW4wuzMUodueZVANTD16lGGKN9tf76S3VQzRJWH+ODeQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003)(8126099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3KvbCy5JrYByQgcuUpI5Ar2g6eS8kNTPgDb9WgpElRGq1x0a8pxaLHWKF87it0afIAfNfbVfeapXS5D0W8qq3AY1xFW/txdLVzWAIBA5FV1OfP0M4ISwojnmX2CZ0NksgjC46IBp7RN2voRbrLF1krvZ/fI6m914bpsPjs92W5MakVIPTW7PWAGULPxcFoAKib++zOz+IaVVi0rTos/9ag6tttYIb8t2QtSnHlGQ9yPdSjD4kqBlnsxbHdMS3Mp/5ehkOpEmrO7ReQ8RpjusJdjH7C/1BE74iDNCVfFMYJv1z/2b1vxf6l85HDEAmDGlpw2LmJMu5030pSQEACABzL0U2RgJV8FvNbB3+F5YNi2+UGB3Fmf7C9oi8juqpA1X5c90TeLlnU9oGzmmiF+NGf6988m+OkyxzMM4FI/koeFLDU6MjP7nMLii5K/lol/5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:21.2509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1c802d-e5c3-4bb5-1427-08dea70fe34f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6174

info/kernel_mode lists the kernel-mode CLOSID/RMID policies the kernel
supports and the one currently active, but user space has no way to
switch policies or rebind to a different rdtgroup, and the file does
not name the group that owns the kernel CLOSID/RMID.

Make info/kernel_mode writable.  The format used by both read and
write is one line per mode:

  inherit_ctrl_and_mon:group=none
  [global_assign_ctrl_inherit_mon_per_cpu:group=g1//]
  global_assign_ctrl_assign_mon_per_cpu:group=none

The active mode is wrapped in "[...]" and ":group=<ctrl>/<mon>/" names
the bound rdtgroup ("//" for the default control group).  Inactive
modes report ":group=none".  Documented in
Documentation/filesystems/resctrl.rst.

The write path strims input, strips the optional "[...]", validates
the mode against resctrl_kcfg.kmode, and resolves the optional
":group=" suffix via the new helper rdtgroup_by_kmode_path().  An
omitted suffix or an INHERIT-mode write binds to the default group.
On success, rdtgroup_config_kmode_clear() tears down the previous
binding and rdtgroup_config_kmode() programs the new one before
resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur are updated under
rdtgroup_mutex.  Allocation failures in the helpers are propagated so
the write fails atomically.

Add struct rdtgroup fields kmode and kmode_cpu_mask to track the
per-group binding.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to handle the changed interface file info/kernel_mode.
---
 Documentation/filesystems/resctrl.rst |  51 ++++
 fs/resctrl/internal.h                 |   6 +
 fs/resctrl/rdtgroup.c                 | 375 +++++++++++++++++++++++++-
 3 files changed, 431 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b003bed339fd..89fbf8b4fb2a 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -522,6 +522,57 @@ conveyed in the error returns from file operations. E.g.
 	# cat info/last_cmd_status
 	mask f7 has non-consecutive 1-bits
 
+"kernel_mode":
+	In the top level of the "info" directory, "kernel_mode" controls how
+	resource allocation and monitoring work in kernel mode. This is used on
+	some platforms to assign a dedicated CLOSID and/or RMID to kernel threads.
+
+	Reading the file lists supported kernel modes, one per line.  Each line
+	carries a ":group=<spec>" suffix that identifies the resctrl group that
+	owns the kernel CLOSID/RMID for that mode.  The currently active mode is
+	wrapped in square brackets and reports the bound group as
+	"<ctrl>/<mon>/", with empty components when they do not apply (a control
+	group emits "<ctrl>//", a monitor group under the default control group
+	emits "/<mon>/").  Other supported modes are shown without brackets and
+	report "none" because no group is bound to them.  Example::
+
+	  # cat info/kernel_mode
+	  [inherit_ctrl_and_mon:group=//]
+	  global_assign_ctrl_inherit_mon_per_cpu:group=none
+	  global_assign_ctrl_assign_mon_per_cpu:group=none
+
+	Writing one line (terminated by a newline) selects the active mode and
+	binds it to a resctrl group.  The line uses the same format that the
+	read path emits, "<mode>[:group=<ctrl>/<mon>/]", and a surrounding
+	"[...]" pair (as printed for the active line) is accepted and stripped.
+	The ":group=<spec>" suffix is optional; when omitted the default group
+	is used.  The mode must match one of the supported names exactly,
+	and modes not advertised by the platform cannot be set.  The display-only
+	"group=none" form is rejected.  Errors are reported in
+	"info/last_cmd_status".  Example::
+
+	  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl/mon1/" \
+	         > info/kernel_mode
+	  # cat info/kernel_mode
+	  inherit_ctrl_and_mon:group=none
+	  global_assign_ctrl_inherit_mon_per_cpu:group=none
+	  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/]
+
+	  # echo "inherit_ctrl_and_mon" > info/kernel_mode
+	  # cat info/kernel_mode
+	  [inherit_ctrl_and_mon:group=//]
+	  global_assign_ctrl_inherit_mon_per_cpu:group=none
+	  global_assign_ctrl_assign_mon_per_cpu:group=none
+
+	Modes:
+
+	- "inherit_ctrl_and_mon": Kernel uses the same CLOSID and RMID as the
+	  current user-space task (default).
+	- "global_assign_ctrl_inherit_mon_per_cpu": One CLOSID is assigned for all
+	  kernel work; RMID is still inherited from user space.
+	- "global_assign_ctrl_assign_mon_per_cpu": One resource group (CLOSID and RMID)
+	  is assigned for all kernel work.
+
 Resource alloc and monitor groups
 =================================
 
diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 1a9b29119f88..9435ce663f54 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -216,6 +216,10 @@ struct mongroup {
  * @mon:			mongroup related data
  * @mode:			mode of resource group
  * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
+ * @kmode:			true if this group is currently bound as the kernel-mode
+ *				CLOSID/RMID owner (resctrl_kcfg.k_rdtgrp)
+ * @kmode_cpu_mask:		CPUs scoped for this group's kernel-mode binding;
+ *				when empty, all online CPUs are used
  * @plr:			pseudo-locked region
  */
 struct rdtgroup {
@@ -229,6 +233,8 @@ struct rdtgroup {
 	struct mongroup			mon;
 	enum rdtgrp_mode		mode;
 	enum resctrl_event_id		mba_mbps_event;
+	bool				kmode;
+	struct cpumask			kmode_cpu_mask;
 	struct pseudo_lock_region	*plr;
 };
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 9cdcfa64c4a2..5383b4eb23ed 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1055,6 +1055,378 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/**
+ * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
+ * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
+ *
+ * Derives CLOSID/RMID from @rdtgrp->type:
+ *   - RDTMON_GROUP: parent control group's CLOSID with the monitor group's RMID.
+ *   - RDTCTRL_GROUP: the control group's own CLOSID and default RMID.
+ *
+ * Calls resctrl_arch_configure_kmode() with the kernel-mode binding enabled
+ * on the online subset of @rdtgrp->kmode_cpu_mask (or all online CPUs when
+ * that mask is empty), and disabled on the complementary online CPUs so
+ * stale enable bits from a previously bound group are cleared in the same
+ * reprogram step.  The caller (resctrl_kernel_mode_write()) is responsible
+ * for validating that the (kmode, group type) pair is permitted before
+ * invoking this helper.
+ *
+ * Context: Caller must hold rdtgroup_mutex.
+ *
+ * Return: 0 on success, -EINVAL for a pseudo-locked group, -ENOMEM if
+ * cpumask allocation fails.
+ */
+static int rdtgroup_config_kmode(struct rdtgroup *rdtgrp)
+{
+	cpumask_var_t enable_mask, disable_mask;
+	u32 closid, rmid;
+	bool need_disable;
+
+	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
+		rdt_last_cmd_puts("Resource group is pseudo-locked\n");
+		return -EINVAL;
+	}
+
+	if (!zalloc_cpumask_var(&enable_mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	need_disable = !cpumask_empty(&rdtgrp->kmode_cpu_mask);
+	if (need_disable && !zalloc_cpumask_var(&disable_mask, GFP_KERNEL)) {
+		free_cpumask_var(enable_mask);
+		return -ENOMEM;
+	}
+
+	if (rdtgrp->type == RDTMON_GROUP) {
+		closid = rdtgrp->mon.parent->closid;
+		rmid = rdtgrp->mon.rmid;
+	} else {
+		closid = rdtgrp->closid;
+		rmid = rdtgrp->mon.rmid;
+	}
+
+	/*
+	 * Empty kmode_cpu_mask: enable on every online CPU.  Otherwise enable
+	 * only CPUs in the group mask and explicitly clear on other online CPUs
+	 * so a previously bound group's enable bits don't linger.
+	 */
+	if (!need_disable) {
+		cpumask_copy(enable_mask, cpu_online_mask);
+	} else {
+		cpumask_copy(enable_mask, &rdtgrp->kmode_cpu_mask);
+		cpumask_andnot(disable_mask, cpu_online_mask, &rdtgrp->kmode_cpu_mask);
+	}
+
+	if (!cpumask_empty(enable_mask))
+		resctrl_arch_configure_kmode(enable_mask, closid, rmid, true);
+
+	if (need_disable && !cpumask_empty(disable_mask))
+		resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
+
+	rdtgrp->kmode = true;
+
+	free_cpumask_var(enable_mask);
+	if (need_disable)
+		free_cpumask_var(disable_mask);
+
+	return 0;
+}
+
+/**
+ * rdtgroup_config_kmode_clear() - Tear down the kernel-mode binding on @rdtgrp
+ * @rdtgrp:	Resctrl group whose kernel-mode binding is being released.
+ *		May be %NULL when no group is currently bound, in which case
+ *		this is a no-op.
+ * @kmode:	Kernel-mode policy currently active on @rdtgrp, as a
+ *		BIT(&enum resctrl_kernel_modes) value.  When this is
+ *		BIT(INHERIT_CTRL_AND_MON) the hardware tear-down is skipped
+ *		because no MSR was previously programmed.
+ *
+ * Disables the kernel-mode binding on the CPUs @rdtgrp covers (its
+ * @kmode_cpu_mask, or all online CPUs when that mask is empty) and resets
+ * the per-group bookkeeping (@kmode and @kmode_cpu_mask).  This is the
+ * disable counterpart of rdtgroup_config_kmode() and exists so that a write
+ * that transitions the active mode to BIT(INHERIT_CTRL_AND_MON) -- which
+ * skips rdtgroup_config_kmode() entirely -- still tears down the previously
+ * bound group instead of leaving stale enable bits behind.
+ *
+ * On allocation failure the function returns -ENOMEM and leaves both the
+ * hardware state and @rdtgrp's bookkeeping unchanged so the caller can fail
+ * the operation atomically and last_cmd_status reflects reality.
+ *
+ * Context: Caller must hold rdtgroup_mutex.
+ *
+ * Return: 0 on success (including the @rdtgrp == %NULL and INHERIT cases),
+ * -ENOMEM if cpumask allocation fails.
+ */
+static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
+{
+	cpumask_var_t disable_mask;
+	u32 closid, rmid;
+
+	if (!rdtgrp)
+		return 0;
+
+	if (kmode == BIT(INHERIT_CTRL_AND_MON))
+		goto out_clear;
+
+	if (!zalloc_cpumask_var(&disable_mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	if (rdtgrp->type == RDTMON_GROUP) {
+		closid = rdtgrp->mon.parent->closid;
+		rmid = rdtgrp->mon.rmid;
+	} else {
+		closid = rdtgrp->closid;
+		rmid = rdtgrp->mon.rmid;
+	}
+
+	if (cpumask_empty(&rdtgrp->kmode_cpu_mask))
+		cpumask_copy(disable_mask, cpu_online_mask);
+	else
+		cpumask_copy(disable_mask, &rdtgrp->kmode_cpu_mask);
+
+	resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
+	free_cpumask_var(disable_mask);
+
+out_clear:
+	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+	rdtgrp->kmode = false;
+	return 0;
+}
+
+/**
+ * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
+ * @ctrl_name:	Control-group name, or "" for the default control group.
+ * @mon_name:	Monitor-group name, or "" to select the control group itself.
+ *
+ * Matches the path syntax emitted by resctrl_kernel_mode_show():
+ *   "//"            - the default control group
+ *   "<ctrl>//"      - control group @ctrl_name
+ *   "/<mon>/"       - monitor group @mon_name under the default control group
+ *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
+ *
+ * Context: Caller must hold rdtgroup_mutex.
+ *
+ * Return: Pointer to the matching rdtgroup, &rdtgroup_default when both
+ * names are empty (the show form "//"), or NULL if no such group exists.
+ */
+static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
+					       const char *mon_name)
+{
+	struct rdtgroup *rdtg, *parent = NULL, *crg;
+
+	/* Show emits "//" for the default control group; round-trip it here. */
+	if (!*ctrl_name && !*mon_name)
+		return &rdtgroup_default;
+
+	/* Control-group-only form: "<ctrl>//". */
+	if (!*mon_name) {
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+			if (rdtg->type != RDTCTRL_GROUP)
+				continue;
+			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name))
+				return rdtg;
+		}
+		return NULL;
+	}
+
+	/* Monitor-group form: locate the parent control group first. */
+	if (!*ctrl_name) {
+		parent = &rdtgroup_default;
+	} else {
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+			if (rdtg->type != RDTCTRL_GROUP)
+				continue;
+			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
+				parent = rdtg;
+				break;
+			}
+		}
+		if (!parent)
+			return NULL;
+	}
+
+	list_for_each_entry(crg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
+		if (!strcmp(rdt_kn_name(crg->kn), mon_name))
+			return crg;
+	return NULL;
+}
+
+/**
+ * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
+ * @of:		kernfs file handle.
+ * @buf:	One line in the same format emitted by resctrl_kernel_mode_show(),
+ *		i.e. "<mode>[:group=<ctrl>/<mon>/]" with an optional surrounding
+ *		"[...]"; must end with a newline.  The ":group=<spec>" suffix is
+ *		optional -- when omitted the default control group
+ *		(&rdtgroup_default) is used.
+ * @nbytes:	Length of @buf.
+ * @off:	File offset (unused).
+ *
+ * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
+ * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
+ * an existing rdtgroup (or picks &rdtgroup_default if no group was specified
+ * or if the new mode is INHERIT), clears any previous binding via
+ * rdtgroup_config_kmode_clear(), programs hardware via
+ * rdtgroup_config_kmode() when @kmode is not BIT(INHERIT_CTRL_AND_MON), and
+ * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur.  The
+ * display-only "group=none" form produced by show for inactive modes is
+ * rejected.  Errors are reported in last_cmd_status.
+ *
+ * Return: @nbytes on success, negative errno with last_cmd_status set on error.
+ */
+static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	char *mode_str, *group_str, *slash;
+	const char *ctrl_name, *mon_name;
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+	size_t len;
+	u32 kmode;
+	int i;
+
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+	buf[nbytes - 1] = '\0';
+
+	/* Tolerate surrounding whitespace before the bracket/mode parsing. */
+	buf = strim(buf);
+	len = strlen(buf);
+
+	/* Strip the optional "[...]" that show uses to mark the active line. */
+	if (len >= 2 && buf[0] == '[' && buf[len - 1] == ']') {
+		buf[len - 1] = '\0';
+		buf++;
+		len -= 2;
+	}
+
+	/*
+	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
+	 * and when omitted the default control group (&rdtgroup_default) is used.
+	 */
+	group_str = strstr(buf, ":group=");
+	if (group_str) {
+		*group_str = '\0';
+		group_str += strlen(":group=");
+	}
+	mode_str = buf;
+
+	mutex_lock(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++)
+		if (!strcmp(mode_str, resctrl_mode_str[i]))
+			break;
+	if (i == RESCTRL_NUM_KERNEL_MODES) {
+		rdt_last_cmd_puts("Unknown kernel mode\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (!(resctrl_kcfg.kmode & BIT(i))) {
+		rdt_last_cmd_puts("Kernel mode not available\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	kmode = BIT(i);
+
+	if (!group_str) {
+		/* No ":group=" suffix: fall back to the default control group. */
+		rdtgrp = &rdtgroup_default;
+	} else if (!strcmp(group_str, "none")) {
+		/* Display-only placeholder emitted by show; not selectable. */
+		rdt_last_cmd_puts("Cannot bind to 'none' group\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	} else {
+		/* Require exactly "<ctrl>/<mon>/" - two '/' with the second terminating. */
+		slash = strchr(group_str, '/');
+		if (!slash) {
+			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		*slash = '\0';
+		ctrl_name = group_str;
+		mon_name = slash + 1;
+		slash = strchr(mon_name, '/');
+		if (!slash || slash[1] != '\0') {
+			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		*slash = '\0';
+
+		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
+		if (!rdtgrp) {
+			rdt_last_cmd_puts("Group not found\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+	}
+
+	/*
+	 * INHERIT mode binds nothing; force the bound group to the default so
+	 * round-trips with show (which prints "group=//") are stable and any
+	 * user-supplied :group= suffix is silently normalised.
+	 */
+	if (kmode == BIT(INHERIT_CTRL_AND_MON))
+		rdtgrp = &rdtgroup_default;
+
+	/* No-op if the same mode is already active on the same group. */
+	if (resctrl_kcfg.kmode_cur == kmode && resctrl_kcfg.k_rdtgrp == rdtgrp)
+		goto out_unlock;
+
+	/*
+	 * global_assign_ctrl_assign_mon_per_cpu binds one CLOSID and RMID for
+	 * all kernel work (Documentation/filesystems/resctrl.rst uses
+	 * "<ctrl>/<mon>/", i.e. an RDTMON_GROUP).
+	 *
+	 * global_assign_ctrl_inherit_mon_per_cpu assigns one CLOSID globally
+	 * while leaving RMID inheritance to user contexts; that uses the
+	 * control group's CLOSID slot only, i.e. an RDTCTRL_GROUP.
+	 */
+	if (kmode == BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU) &&
+	    rdtgrp->type != RDTMON_GROUP) {
+		rdt_last_cmd_puts("global_assign_ctrl_assign_mon_per_cpu requires a monitor group\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+	if (kmode == BIT(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU) &&
+	    rdtgrp->type != RDTCTRL_GROUP) {
+		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* Switching to a different group: release the old binding first. */
+	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
+		ret = rdtgroup_config_kmode_clear(resctrl_kcfg.k_rdtgrp,
+						  resctrl_kcfg.kmode_cur);
+		if (ret) {
+			rdt_last_cmd_puts("Failed to release previous kernel-mode binding\n");
+			goto out_unlock;
+		}
+	}
+
+	if (kmode != BIT(INHERIT_CTRL_AND_MON)) {
+		ret = rdtgroup_config_kmode(rdtgrp);
+		if (ret) {
+			rdt_last_cmd_puts("Kernel mode change failed\n");
+			goto out_unlock;
+		}
+	}
+
+	resctrl_kcfg.k_rdtgrp = rdtgrp;
+	resctrl_kcfg.kmode_cur = kmode;
+
+out_unlock:
+	mutex_unlock(&rdtgroup_mutex);
+	return ret ?: nbytes;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -1960,9 +2332,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "kernel_mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_kernel_mode_show,
+		.write		= resctrl_kernel_mode_write,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
 	{
-- 
2.43.0

