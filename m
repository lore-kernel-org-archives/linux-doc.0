Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A993216616;
	Wed, 22 Jan 2025 20:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577429; cv=fail; b=ITfUNnEdSOQd+/8K24WZps0qKbmBmufgg4eZlNm0j5kgWDNznJlrGL6gAk2KFZ1n64xPtcBLiPn2/OO4P5CgU7vVsZFetDSQJc2vvTiCdJT7pMnlsrPQP2fj5SgSlu1YFSFRgyZaabN56rTM/h5z9WipTzAR/EerVQ1fJvcaOJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577429; c=relaxed/simple;
	bh=keDPBKNst0F23XKBEzDIfKMDXMzXaQoOEXHRTSG2sSQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hk5hH9uLpChus4z9J5SdSlE9PhVGavGRC6fnfWgQC383eQDJSV+54qxB2X6JNtwNi/ELJNvEwc9SgZLJF6ZG6AwI6hMHLTmP3GObIMKWW9iPrx1zNg/Or5Ey1O+Ppu4+7f/PYpHpbiJF9jucYnfc9o6p62SOciLKBdAX8B6Ceak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jT+3kEon; arc=fail smtp.client-ip=40.107.223.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jT+3kEon"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC57iajExzZm2sgspkhk/yKNOx8Gkhw3WOsKllu63ZDrko5ws77bLDdcpncIopbkWUQKXk81YJtOnZhRNTsNxmXSPjLiLr21XDDl8ETrNwsoAO81CFRORPkShP8VIjyBQOvdzOuk7J+FUTo+XvvxgwPF63zaKjeyEwVsPNQS7adHZRrkkrNnVi3iJF5+Il/zWCcbu6xJVqAZvXuBqQAKZSWf1pV9JUtfpPio5Xyj8qVq4SINXDHW7QQug9iyhP/3or7GE6FJvIhPsGjf9z/Pu73eXCprDaBVN+/JTTB8dhZuiybjuaIbnhajxFNjG+rOYEUU3o/+3H9MkDdgFZDViw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qz9kYfrUCZvSIiUDxuhgdCq78Ufjp2mIBWDWMlVk0x8=;
 b=PuI+1zu2mAQi98DggxgEL72CGbYwLyefFPBpq8XeIKQD6tY8HneJ3r5i892BlDl58q6Ys//GH90fuznhUw+c2gV2IgIUZqreZ0qxQlIkaAt2dC81ADLF2yPC31kgANNqLWt2aEvPoSwRALiIRtq/3UaDSwdIVbIovCWrsSGgia17cqWy89fbAsyHY/fKv1/aBBCbJwusntbPtivFlhmJQwHrUEcTd/kfpyJe/jk/LMc4AcOnZHdoZq2loJyHXMBQNWGWeUr+h9gmVazE3C3w5olHofrXZxZPCa/rPJNPHVGPfDW4RpTD+dIEAlT9fpVAYiUnmYLXYAt/N8k96LKyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qz9kYfrUCZvSIiUDxuhgdCq78Ufjp2mIBWDWMlVk0x8=;
 b=jT+3kEonAooJtTsJAtI+SQEPSSep7Lw8kGUqaF2rd3RP8QVkGs9MubImbH2uqLADgMv6e2fhLqtxz9ze9511k3gHN2v58z14qtI9KAw0YOrnnsA7Dqobsx6IYjVbl9iAHa4LnHdFa6HxzU3FIqJpkBT+LpVQ166O2EASFc1AaIs=
Received: from CH0PR03CA0409.namprd03.prod.outlook.com (2603:10b6:610:11b::17)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Wed, 22 Jan
 2025 20:23:40 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::16) by CH0PR03CA0409.outlook.office365.com
 (2603:10b6:610:11b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:23:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:39 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:38 -0600
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
Subject: [PATCH v11 21/23] x86/resctrl: Update assignments on event configuration changes
Date: Wed, 22 Jan 2025 14:20:29 -0600
Message-ID: <ae151a469334c3789edbe9f456155dc722565e17.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: 916cd659-c3e3-4828-b663-08dd3b22a885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7n+tm6Ayy2GwIRogrWhTp8Hodcq5vVC7mmgs/Xdn3xj90Au0LKmIMWBgGl8K?=
 =?us-ascii?Q?D7VC93QIA7YhVdJ9mOa3cDXz0//lBXcI8/l4rxESjpUSpxefbFpZ67PwpQrU?=
 =?us-ascii?Q?ZtxigIksjbnTlARZgq7JvCoZ/ThErjfALrxB3AAulP3DbxG3uYYgREkNw69j?=
 =?us-ascii?Q?6/QP6QbBEGF9TQOkluDNLuubKPpseKyBZCifOmsruYFh0U5tQ22slh5wAKfp?=
 =?us-ascii?Q?cYB6qq+VMtMiO3u3WRG//fPze3r8rIlQxTgeHYmM2fvEyS5tpKcdmwpS3k3u?=
 =?us-ascii?Q?GSDzf1f5F0//6FMkWgdLKo8SILp9qG+xjSpjMxqWhgGuzFIwYF2qozxFa81J?=
 =?us-ascii?Q?xaF8n+qgqwuL8Vnud3WI4JKQaetQacof2dv6bkjj3tjaxil0i+YTyRee77Qn?=
 =?us-ascii?Q?RD3J8MgqCRd1HupfbCBV3nsW/QbsiNH+WUYYD12zCxWifJoZDduo7lAbaiRJ?=
 =?us-ascii?Q?lTfGY3joiemq333bSX+B76warYeb/Q5ZGCNDU2eyCDqZPLxlOjhTRJdBEZsH?=
 =?us-ascii?Q?Q8/CBI01VjFRT1KQr8mS8w2ZOSwvt9F3Zi+on1VsiYyDuvO/xYV8gG5kUm7N?=
 =?us-ascii?Q?ZauVanddljyrcnvHP0tY+qCkgd4FsGodc9Fsq9cCsKu8yjFlZo6iHY10wJRK?=
 =?us-ascii?Q?lHBwroMlC0Q0mC2/o4AZYTg94Y5+kJPlNbCXKiOZ0UbP+rOl7QliXA8IMqsF?=
 =?us-ascii?Q?kQY+Rq6we2rvP5X02KLGq0AGY4kwpubP0kx/JMRS+fZFm90+R/zdlrIVnP/C?=
 =?us-ascii?Q?X/hzztNkGkGijv7ZRvqZB5dA2uGV+DS1cHnY2GFI+GxMNqGbqZx6/eeWu8gw?=
 =?us-ascii?Q?DAZ6kBl1/2v6x1WRIIxqpeHVFflOXhdWlg8W8lqWoNiaD85ZatLIEaRdu4wx?=
 =?us-ascii?Q?mXCmZ6r8lExEDQ6lN21GbRSMwmW2kFp+JfomwociaWk6WGB/9TnvXLH+vVtX?=
 =?us-ascii?Q?vyxMSgmd3UzLZpoCinvpW8+Ff55sJO2eWeyS67D2e5SAJRJ5XTTKY7pDpjUY?=
 =?us-ascii?Q?GY//yXEtAslPE8AVNyEs96PGfweRzVlz+RUUw50BLtV3oCg5gF+zrsGHPY6Q?=
 =?us-ascii?Q?h5MkFIZs2aD8cXjm96MwL/MqIfDpGkaQFYbIqLy992V3Nj5fnsANBB/36q2+?=
 =?us-ascii?Q?fC8T4W1NCF0fEpbpEgMinfXjycUvTaPrxYvIYmDXbqQxFnt8N7rusg5/JU1q?=
 =?us-ascii?Q?CA9agW1DaUhVmeCFtnzws+4Er9Nz/6V1E4mep4Z9jhr8O9vOelQDc0F/JyqT?=
 =?us-ascii?Q?E7GW+bxzcmW3EZw4OlwWFCkSwzfvB1cn87cXDE4eICPidWKSVJ1c2BBSWCIR?=
 =?us-ascii?Q?JBL13LYCnh0/R5FWTaP8rDm2otnUBY1U+VX4EJf8gkNFnYZlm3dpnsgfib49?=
 =?us-ascii?Q?zmuP1zWU3Iowwf3LhpZYEtEDrts5oOxnsj/i+gEQtRnCQvMF2qR0GkJE98Jh?=
 =?us-ascii?Q?+fhftA4qql0Iae1CTFZ5MpOuwciSJdhndtKhIUqm5faF09BH22GUSeceJSUj?=
 =?us-ascii?Q?7SXUORbESC13EDcR/YaKACRLB5DZF2XKYesW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:39.7959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 916cd659-c3e3-4828-b663-08dd3b22a885
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561

When BMEC (Bandwidth Monitoring Event Configuration) is supported,
resctrl provides option to configure events by writing to the interfaces
/sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config or
/sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config.

Update MBM event assignments for all monitor groups in the affected domains
whenever the event configuration is changed.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11:
   Added non-arch RMID reset code in mbm_config_write_domain() which was missing.
   Removed resctrl_arch_reset_rmid() call in resctrl_abmc_config_one_amd().
   Not required as reset of arch and non-arch rmid counters done from the callers.
   It simplies the IPI code.
   Updated the code comments with Reinette's feedback.
   Updated the commit message in imperative mode.

v10: Code changed completely with domain specific counter assignment.
     Rewrite the commit message.
     Added few more code comments.

v9: Again patch changed completely based on the comment.
    https://lore.kernel.org/lkml/03b278b5-6c15-4d09-9ab7-3317e84a409e@intel.com/
    Introduced resctrl_mon_event_config_set to handle IPI.
    But sending another IPI inside IPI causes problem. Kernel reports SMP
    warning. So, introduced resctrl_arch_update_cntr() to send the command directly.

v8: Patch changed completely.
    Updated the assignment on same IPI as the event is updated.
    Could not do the way we discussed in the thread.
    https://lore.kernel.org/lkml/f77737ac-d3f6-3e4b-3565-564f79c86ca8@amd.com/
    Needed to figure out event type to update the configuration.

v7: New patch to update the assignments. Missed it earlier.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  4 +-
 arch/x86/kernel/cpu/resctrl/monitor.c  | 58 ++++++++++++++++++++++----
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 10 ++++-
 3 files changed, 61 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 2480698b643d..aec564fa2833 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -607,11 +607,13 @@ union cpuid_0x10_x_edx {
 
 /**
  * struct mon_config_info - Monitoring event configuratiin details
+ * @r:			Resource for monitoring
  * @d:			Domain for the event
  * @evtid:		Event type
  * @mon_config:		Event configuration value
  */
 struct mon_config_info {
+	struct rdt_resource *r;
 	struct rdt_mon_domain *d;
 	enum resctrl_event_id evtid;
 	u32 mon_config;
@@ -721,12 +723,12 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
 void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
 unsigned int mon_event_config_index_get(u32 evtid);
-void resctrl_arch_mon_event_config_set(void *info);
 u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
 				      enum resctrl_event_id eventid);
 int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
 			     u32 cntr_id, bool assign);
+void resctrl_mon_event_config_set(void *info);
 int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a9a5dc626a1e..024aabbecbb5 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1354,26 +1354,26 @@ u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
 	return INVALID_CONFIG_VALUE;
 }
 
-void resctrl_arch_mon_event_config_set(void *info)
+static void resctrl_arch_mon_event_config_set(struct rdt_mon_domain *d,
+					      enum resctrl_event_id eventid, u32 val)
 {
-	struct mon_config_info *mon_info = info;
 	struct rdt_hw_mon_domain *hw_dom;
 	unsigned int index;
 
-	index = mon_event_config_index_get(mon_info->evtid);
+	index = mon_event_config_index_get(eventid);
 	if (index == INVALID_CONFIG_INDEX)
 		return;
 
-	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
+	wrmsr(MSR_IA32_EVT_CFG_BASE + index, val, 0);
 
-	hw_dom = resctrl_to_arch_mon_dom(mon_info->d);
+	hw_dom = resctrl_to_arch_mon_dom(d);
 
-	switch (mon_info->evtid) {
+	switch (eventid) {
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
-		hw_dom->mbm_total_cfg = mon_info->mon_config;
+		hw_dom->mbm_total_cfg = val;
 		break;
 	case QOS_L3_MBM_LOCAL_EVENT_ID:
-		hw_dom->mbm_local_cfg = mon_info->mon_config;
+		hw_dom->mbm_local_cfg = val;
 		break;
 	default:
 		break;
@@ -1592,3 +1592,45 @@ void mbm_cntr_reset(struct rdt_resource *r)
 		}
 	}
 }
+
+/*
+ * Update hardware counter configuration after event configuration change.
+ * Walk the hardware counters of domain @d to reconfigure all assigned
+ * counters that are monitoring @evtid with the event's new configuration
+ * value.
+ * This is run on a CPU belonging to domain @d so call
+ * resctrl_abmc_config_one_amd() directly.
+ */
+static void resctrl_arch_update_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				     enum resctrl_event_id evtid, u32 val)
+{
+	union l3_qos_abmc_cfg abmc_cfg = { 0 };
+	struct rdtgroup *rdtgrp;
+	u32 cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		rdtgrp = d->cntr_cfg[cntr_id].rdtgrp;
+		if (rdtgrp && d->cntr_cfg[cntr_id].evtid == evtid) {
+			abmc_cfg.split.cfg_en = 1;
+			abmc_cfg.split.cntr_en = 1;
+			abmc_cfg.split.cntr_id = cntr_id;
+			abmc_cfg.split.bw_src = rdtgrp->mon.rmid;
+			abmc_cfg.split.bw_type = val;
+			resctrl_abmc_config_one_amd(&abmc_cfg);
+		}
+	}
+}
+
+void resctrl_mon_event_config_set(void *info)
+{
+	struct mon_config_info *mon_info = info;
+	struct rdt_mon_domain *d = mon_info->d;
+	struct rdt_resource *r = mon_info->r;
+
+	resctrl_arch_mon_event_config_set(d, mon_info->evtid, mon_info->mon_config);
+
+	/* Check if assignments needs to be updated */
+	if (resctrl_arch_mbm_cntr_assign_enabled(r))
+		resctrl_arch_update_cntr(r, d, mon_info->evtid,
+					 mon_info->mon_config);
+}
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 515969c5f64f..5d305d0ac053 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1740,10 +1740,10 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
 	return 0;
 }
 
-
 static void mbm_config_write_domain(struct rdt_resource *r,
 				    struct rdt_mon_domain *d, u32 evtid, u32 val)
 {
+	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	struct mon_config_info mon_info = {0};
 	u32 config_val;
 
@@ -1755,6 +1755,7 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	if (config_val == INVALID_CONFIG_VALUE || config_val == val)
 		return;
 
+	mon_info.r = r;
 	mon_info.d = d;
 	mon_info.evtid = evtid;
 	mon_info.mon_config = val;
@@ -1766,7 +1767,7 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
 	smp_call_function_any(&d->hdr.cpu_mask,
-			      resctrl_arch_mon_event_config_set,
+			      resctrl_mon_event_config_set,
 			      &mon_info, 1);
 
 	/*
@@ -1779,6 +1780,11 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	 * mbm_local and mbm_total counts for all the RMIDs.
 	 */
 	resctrl_arch_reset_rmid_all(r, d);
+
+	if (is_mbm_total_enabled())
+		memset(d->mbm_total, 0, sizeof(struct mbm_state) * idx_limit);
+	if (is_mbm_local_enabled())
+		memset(d->mbm_local, 0, sizeof(struct mbm_state) * idx_limit);
 }
 
 static int mon_config_write(struct rdt_resource *r, char *tok, u32 evtid)
-- 
2.34.1

