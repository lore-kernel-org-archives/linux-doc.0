Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2066.outbound.protection.outlook.com [40.107.102.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7921772F;
	Wed, 22 Jan 2025 20:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577394; cv=fail; b=EqeFVY65RnPUTsCTSxPsDcz0T1BrRqeBNH+Ny95quZJ5bkC2bOmjFtzUVNqANHRxUV9vDdgU9TOwYx4UnmG/8zNEwLSSe5s6k76YCRCXxIKUXWtuhg7UY4sa0pCGwzyUyfkAvdFKK7iAK8aq68TukDOvllaDc055HJp1vVpywrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577394; c=relaxed/simple;
	bh=POYrs28rFVCWKlTPH0O/ZRWb6AbbZnImZv8hAXu2uzQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r40iM+oBJa/eZTSaitdX0sOfg20kKSmPYvf3gBSzTGgTKIn+lo0tfYZkPXwtm7WBnfci+cSgGjo4pJdyj+LZpbBllI5vrUIax7dMHqVh+SLRAcE/T6UoG4bkLose2aIwCnAxRx2ml+l4ec9szC3jsXnlDmBLqaoWpNc6vRogMwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FqgMw6aj; arc=fail smtp.client-ip=40.107.102.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FqgMw6aj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LxmZMNfTFjLt0OSlGo/dLccfWST9c2mMBeo1rd1gHzjFi7iRYE5SMFEh099TptBIcLcryKsyrigV8keW1DX6PbDwJ+ScRN4IRhoIjz93OKeDBcA4fxJIC9356bL6FlY3r72Ss32ZPN4vNfEC5WkcDu69Ptm7pfw+VtL1jJW4mcSMuoYn59a79h6aJPI+wJ04yjTEA2onwGUWG/gAaMl37xpKSUnmfF+ibvM83LV6AeV+zBnC3fLBDdi9eOTeGx2OEy19Fn1M+lgnHyXhJCddL/vK8BSJTVracygjMbZBmh1FwkGsnqzYclWWFJzKdXlgoF8Ixv4GBcX9ykSv/pFfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS8ZpQdC+Xm62bHOkFdGffsgccGq15V9zKuRtXXI0LE=;
 b=DPT4xRdctFaAGWbFvfOxtKGuWcwOpMkgeOA/hTh565ym3ohKOlZ1SLNxtTDOPKK2g2QCdyJcpSp2WRqCCNWvBGzVxrTjVjijI6MGcaurx0Oho+K5HrIVpIuAnwbxdeoPr1Uczisr2VfzpGjMyCLUDha8tT52L8eB9BOqsI9hr0OdDX8ANql28EBFjXGCRpD8PhW3tFtM4LcOQFiKh9+oHjYTrXmY1pueOjXaQZUzp10WerRHeMNsJ640XvV6NzeBbAzndSSVdQVKYwEHElnajmEuoBouOYUGq8oYrZwoN6D9BDHYK8MF8A9oA1ynbD2GhIVTuJnQBIyau+OajoiOlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS8ZpQdC+Xm62bHOkFdGffsgccGq15V9zKuRtXXI0LE=;
 b=FqgMw6ajBNM2+Qf5S83JBHW1PT+Ofp7tIP0DDeGDPmB1/dfdlUOnY+44+LbCoaMRXZCGUeJ0cPKf3k7BIoO76KiqH5UtrXkNWlZUCwSCO6kkqCFb8cb1+6yRBvGsm0aCc6d6rSyoFpo8+kdZS0NdgNrnxF4pmrH7X4qfFc0yF3I=
Received: from CH0PR03CA0301.namprd03.prod.outlook.com (2603:10b6:610:118::11)
 by CY5PR12MB6132.namprd12.prod.outlook.com (2603:10b6:930:24::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Wed, 22 Jan
 2025 20:23:07 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::ca) by CH0PR03CA0301.outlook.office365.com
 (2603:10b6:610:118::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 20:23:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:05 -0600
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <reinette.chatre@intel.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<babu.moger@amd.com>, <xin3.li@intel.com>, <andrew.cooper3@citrix.com>,
	<ebiggers@google.com>, <mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
Subject: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when mbm_cntr_assign is enabled
Date: Wed, 22 Jan 2025 14:20:25 -0600
Message-ID: <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1737577229.git.babu.moger@amd.com>
References: <cover.1737577229.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CY5PR12MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cd1ba2e-8cb1-4e48-79ac-08dd3b229506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?v7rRudAvMw/HkzHeeEkHbEhEHXZVW6CmRFto9uPm92TYiWZDsv4OjV9OGyQM?=
 =?us-ascii?Q?voSobCIyFx7Ml1UjAYiK0K3WYtmiLg1Ts5WohleAJli2zHfqy8ITAipZVAc5?=
 =?us-ascii?Q?KtGIKJIVWIxS5xI6qmQhmJjxQfYoqyFrpC75IkfMZk1ti/pAPJea9FIQpw0O?=
 =?us-ascii?Q?UnZWGLthV6ztFKc+HEJwWL9RKNQddGx6+CZnjSGEnnJxdvOzML4r8VmiGncs?=
 =?us-ascii?Q?OAQik48TlGrvaA+G2S2O27FQTw6zj9UILIs13QLhTb5L3DsuGbBTvSMbQCch?=
 =?us-ascii?Q?bIQnfWtM3uWx0o15MKR23NPqJpY08Nbn87nVvXlXpuAgxdqCd+UfHoOiShy/?=
 =?us-ascii?Q?bAHcAikvej0iroyV2DgWPw4tDTHgPR2p/RYNpg+XYf89pP2iXvfSQZreZFSy?=
 =?us-ascii?Q?QffJfShg4Eu13ndSxR8lP0lp55ANKLQwA2aEfl+8l8uXoXR+UUln3J2dRQ2m?=
 =?us-ascii?Q?JCnAlP2j0dL0ws2UfJjzcBZL3KeBFk8+3pDK5AiHctQLopbc/iXYu97tYSPf?=
 =?us-ascii?Q?JvZ5OFEZYs4U0j843Yq6SfVJ+o1vu9g7JqnUfVHP8HLmT6aZXI/Mmb3ocr+l?=
 =?us-ascii?Q?iO62PYYGcqI7Kq8GZzZJJNUTxP0JxATd3YjVEMAVxWCbmGfvlcbJqe1UiYRs?=
 =?us-ascii?Q?vvNRmjnyOFzSRh0BnTr2d+9XQNvlVNr4VYzGFEGNvd7n+JeWCA5S62gtoYHo?=
 =?us-ascii?Q?zhPQxIG5ESKrx+Lg+3MnFsQ2+b7IyMVjZPpuXGgsp/zaMywkSxgc29LU4zev?=
 =?us-ascii?Q?AIxMoj2mPbGD72QBcFazA/W31IYZ1lJ3J4aiwGHZJudkxabkYpmGS/Kb8uC2?=
 =?us-ascii?Q?J79tfVarApkLZQKqiHAxm489e0OvtsvfH0VLGFMgl62RYj2UdzRSNRugCnuA?=
 =?us-ascii?Q?teTIPfQ1yxgJFw+t+fzydogkXCXTsHDTEcacIkKwfrhL5+M3sPRLbGQIawEE?=
 =?us-ascii?Q?QmOR7PwjnmX2Xkecdh3HH+cMRBsZM9o0v3TNGn7BlY5WoCyCLqn8wU101oqU?=
 =?us-ascii?Q?HaoZ2OOzejHSn9/g/s5bv88tKJbNht7V5/yCmiPMgnaS0vj+AFzfFKrSRyiH?=
 =?us-ascii?Q?8eiJuZoB3DeaVDBWOdDjVc0pA0bu/M62FBHV2574gaPIR2x3ddAu8nVcKUc5?=
 =?us-ascii?Q?Jg8+0gjcL+i8uR/gs1kumoodpbUqzsb1GJeh3u15ftojZNtiRhSBuUi+7mXx?=
 =?us-ascii?Q?Myw86k1e45BnZAIL+kNxMzPjSydz0KITJzSONALLBBAjNoXiHM1INOSo+yZB?=
 =?us-ascii?Q?OQ+w02wN3fiMtPw9xuY7RqaA15sMYAa4abhU7HD/JdML9Lg0+8p6K1/aa8uf?=
 =?us-ascii?Q?gP6uiT7ToJdM881UWUfto8WZIMxN+itoJCQ/Fd3l1EwrxC5xzU4UD5pWSDCI?=
 =?us-ascii?Q?sA+HDUvG6j+xOyYo0Jd6HpAJotV1uKIcXAYC8KfBznDnyNVJ5CPVwMrWDRw0?=
 =?us-ascii?Q?sFJLsw1wyrAcA1x6Ftqip5jici/nYPPtDZ23uULTYjZqRyrIgnWN1ZyiXMYO?=
 =?us-ascii?Q?QBMcSVCpkLG1Byo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:07.0697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd1ba2e-8cb1-4e48-79ac-08dd3b229506
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6132

Assign/unassign counters on resctrl group creation/deletion. Two counters
are required per group, one for MBM total event and one for MBM local
event.

There are a limited number of counters available for assignment. If these
counters are exhausted, the kernel will display the error message: "Out of
MBM assignable counters". However, it is not necessary to fail the
creation of a group due to assignment failures. Users have the flexibility
to modify the assignments at a later time.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Moved mbm_cntr_reset() to monitor.c.
     Added code reset non-architectural state in mbm_cntr_reset().
     Added missing rdtgroup_unassign_cntrs() calls on failure path.

v10: Assigned the counter before exposing the event files.
    Moved the call rdtgroup_assign_cntrs() inside mkdir_rdt_prepare_rmid_alloc().
    This is called both CNTR_MON and MON group creation.
    Call mbm_cntr_reset() when unmounted to clear all the assignments.
    Taken care of few other feedback comments.

v9: Changed rdtgroup_assign_cntrs() and rdtgroup_unassign_cntrs() to return void.
    Updated couple of rdtgroup_unassign_cntrs() calls properly.
    Updated function comments.

v8: Renamed rdtgroup_assign_grp to rdtgroup_assign_cntrs.
    Renamed rdtgroup_unassign_grp to rdtgroup_unassign_cntrs.
    Fixed the problem with unassigning the child MON groups of CTRL_MON group.

v7: Reworded the commit message.
    Removed the reference of ABMC with mbm_cntr_assign.
    Renamed the function rdtgroup_assign_cntrs to rdtgroup_assign_grp.

v6: Removed the redundant comments on all the calls of
    rdtgroup_assign_cntrs. Updated the commit message.
    Dropped printing error message on every call of rdtgroup_assign_cntrs.

v5: Removed the code to enable/disable ABMC during the mount.
    That will be another patch.
    Added arch callers to get the arch specific data.
    Renamed fuctions to match the other abmc function.
    Added code comments for assignment failures.

v4: Few name changes based on the upstream discussion.
    Commit message update.

v3: This is a new patch. Patch addresses the upstream comment to enable
    ABMC feature by default if the feature is available.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  1 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 27 +++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 63 +++++++++++++++++++++++++-
 3 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index a5b8eadc7f5c..c979abb3d3b0 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -731,4 +731,5 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+void mbm_cntr_reset(struct rdt_resource *r);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index b6d188d0f9b7..118b39fbb01e 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1557,3 +1557,30 @@ int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d
 
 	return ret;
 }
+
+void mbm_cntr_reset(struct rdt_resource *r)
+{
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
+	struct rdt_mon_domain *dom;
+
+	/*
+	 * Reset the domain counter configuration. Hardware counters
+	 * will reset after switching the monitor mode. So, reset the
+	 * architectural amd non-architectural state so that reading
+	 * of hardware counter is not considered as an overflow in the
+	 * next update.
+	 */
+	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
+		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+			memset(dom->cntr_cfg, 0,
+			       sizeof(*dom->cntr_cfg) * r->mon.num_mbm_cntrs);
+			if (is_mbm_total_enabled())
+				memset(dom->mbm_total, 0,
+				       sizeof(struct mbm_state) * idx_limit);
+			if (is_mbm_local_enabled())
+				memset(dom->mbm_local, 0,
+				       sizeof(struct mbm_state) * idx_limit);
+			resctrl_arch_reset_rmid_all(r, dom);
+		}
+	}
+}
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 2b86124c336b..f61f0cd032ef 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -2687,6 +2687,46 @@ static void schemata_list_destroy(void)
 	}
 }
 
+/*
+ * Called when a new group is created. If "mbm_cntr_assign" mode is enabled,
+ * counters are automatically assigned. Each group can accommodate two counters:
+ * one for the total event and one for the local event. Assignments may fail
+ * due to the limited number of counters. However, it is not necessary to fail
+ * the group creation and thus no failure is returned. Users have the option
+ * to modify the counter assignments after the group has been created.
+ */
+static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	if (is_mbm_total_enabled())
+		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+
+	if (is_mbm_local_enabled())
+		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+}
+
+/*
+ * Called when a group is deleted. Counters are unassigned if it was in
+ * assigned state.
+ */
+static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
+{
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
+		return;
+
+	if (is_mbm_total_enabled())
+		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+
+	if (is_mbm_local_enabled())
+		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+}
+
 static int rdt_get_tree(struct fs_context *fc)
 {
 	struct rdt_fs_context *ctx = rdt_fc2context(fc);
@@ -2741,6 +2781,8 @@ static int rdt_get_tree(struct fs_context *fc)
 		if (ret < 0)
 			goto out_info;
 
+		rdtgroup_assign_cntrs(&rdtgroup_default);
+
 		ret = mkdir_mondata_all(rdtgroup_default.kn,
 					&rdtgroup_default, &kn_mondata);
 		if (ret < 0)
@@ -2779,8 +2821,10 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (resctrl_arch_mon_capable())
 		kernfs_remove(kn_mondata);
 out_mongrp:
-	if (resctrl_arch_mon_capable())
+	if (resctrl_arch_mon_capable()) {
+		rdtgroup_unassign_cntrs(&rdtgroup_default);
 		kernfs_remove(kn_mongrp);
+	}
 out_info:
 	kernfs_remove(kn_info);
 out_schemata_free:
@@ -2956,6 +3000,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
 
 	head = &rdtgrp->mon.crdtgrp_list;
 	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
+		rdtgroup_unassign_cntrs(sentry);
 		free_rmid(sentry->closid, sentry->mon.rmid);
 		list_del(&sentry->mon.crdtgrp_list);
 
@@ -2996,6 +3041,8 @@ static void rmdir_all_sub(void)
 		cpumask_or(&rdtgroup_default.cpu_mask,
 			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
 
+		rdtgroup_unassign_cntrs(rdtgrp);
+
 		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 		kernfs_remove(rdtgrp->kn);
@@ -3027,6 +3074,8 @@ static void rdt_kill_sb(struct super_block *sb)
 	for_each_alloc_capable_rdt_resource(r)
 		reset_all_ctrls(r);
 	rmdir_all_sub();
+	rdtgroup_unassign_cntrs(&rdtgroup_default);
+	mbm_cntr_reset(&rdt_resources_all[RDT_RESOURCE_L3].r_resctrl);
 	rdt_pseudo_lock_release();
 	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
 	schemata_list_destroy();
@@ -3490,9 +3539,12 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 	}
 	rdtgrp->mon.rmid = ret;
 
+	rdtgroup_assign_cntrs(rdtgrp);
+
 	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
 	if (ret) {
 		rdt_last_cmd_puts("kernfs subdir error\n");
+		rdtgroup_unassign_cntrs(rdtgrp);
 		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 		return ret;
 	}
@@ -3502,8 +3554,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
 
 static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
 {
-	if (resctrl_arch_mon_capable())
+	if (resctrl_arch_mon_capable()) {
+		rdtgroup_unassign_cntrs(rgrp);
 		free_rmid(rgrp->closid, rgrp->mon.rmid);
+	}
 }
 
 static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
@@ -3764,6 +3818,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	update_closid_rmid(tmpmask, NULL);
 
 	rdtgrp->flags = RDT_DELETED;
+
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 
 	/*
@@ -3810,6 +3867,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
 	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
 	update_closid_rmid(tmpmask, NULL);
 
+	rdtgroup_unassign_cntrs(rdtgrp);
+
 	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
 	closid_free(rdtgrp->closid);
 
-- 
2.34.1

