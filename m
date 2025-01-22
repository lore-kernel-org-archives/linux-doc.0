Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC5217650;
	Wed, 22 Jan 2025 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577367; cv=fail; b=hYCZpDhR6gD37mVJ+XG7R4UOxXnY4gKn0gAKWBx5lHAvujzPWwmgPvYuYMOBaWPvRJ3QRB2m8DiUcoaBF79V13JkkIH1EeO68oUBN812ylx849nC6FppHLqbaELZYdrQOBRipzZss5WYTCpmUQkr0CLz6f60Q2bEtJF2Yl64Z98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577367; c=relaxed/simple;
	bh=gDf5ctQu9T03Zw1e/1xUxcxP7tvtyDM8agu2isvkt5I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kib+cHzpRRWTOUplcQK5qRTVUKfHgrOfZyFc7NAK6K5gqunqiqQNScySPgI2el5NflF5OmHbKPd3kGCRBknp0qQhl6oRFckmiYuzVXLLltKkFq2rVdYllLwXM+5WSDz4dV3eelfk/JagFKmq8OhtPN4WLycZgW7m9DOyzTaOpcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Rm+HqhGm; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Rm+HqhGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=se10gngT1QAD3nAEYGA1zWBBqkbkOtV4XglwSdAi6EOW/X2IW5DL0CRiBBe3b83zo5gYhMSQlsPARwzJSZLwFKIjHarrNCgkHjy1Is1Dusug+zdQklHx4MZowpPNg6ArqmAuA8rNWnkPnS+L8vq81MfHMmz7SoE1fWc+6qJT/JnbE5V6llLAKpkk2+iWgaRXYEmp8MPebJwa2xReuxyoFdHcFx1F3YhzcCZbVqzcI5MjV5PwA3vLcqm0ZmFE+RjCh/GmLhsBjduOE4KY5nXd7i4NVx/1yQvzHv+q2Pz6BM0ivYvJgl8liDoBhkwiECL1kdW2qHu0Nj7gQCM+oJmFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NldGWrSe+l/6V6uxIG10ecigrz2lLAJmP6Zb5xBW8C4=;
 b=Ri1GDPbhKNJxHxBLfwsoA4vaxELmQa460dlgq1WjZBd0P1/7UMRtue9sn3rTJyZMN3ZRlrXhlWFCtBDiSaSSto6yiwrrjI00LXdTlIzjCM0g7Bg+NSVq73sJvwYObXyxMxZVwukrE2z8U3R0wEgSak/11NYmVy4+hbMskqXBZ57Baix7RdauZf5ELZfDHMZiV5tfMyQZ+J5SnWaWno+m7J9MIRBddlmffMvJ9eBrVzhK+VveziDi6TDtqEgbO+EpG2VGq4x7y63jK2tj2g5mF216bTDZ3MlLnhQ3o1c3Bg5HvBfsqUCe0NqOOi92j1c1B6ZIkIJZi8OBc4qZmRo/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NldGWrSe+l/6V6uxIG10ecigrz2lLAJmP6Zb5xBW8C4=;
 b=Rm+HqhGmkyHcJzEBLjUTkTBdQqP0lHFNDGe98CykGsQIjOgk/jG6qm/zXLkMv1K1HJyvs+pgPAbuD+H2Kaq6SHTMxcm/SolobfoRa8bQZBHnxNHDhh/IEBuPpJDN8Fx4iBS4la6+Nbpm/hgI01sYyE26MJp4efnuoJ03IwWBEPA=
Received: from CH2PR07CA0001.namprd07.prod.outlook.com (2603:10b6:610:20::14)
 by PH7PR12MB7281.namprd12.prod.outlook.com (2603:10b6:510:208::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:22:42 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::ee) by CH2PR07CA0001.outlook.office365.com
 (2603:10b6:610:20::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:22:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:40 -0600
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
Subject: [PATCH v11 14/23] x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter with ABMC
Date: Wed, 22 Jan 2025 14:20:22 -0600
Message-ID: <d0bc17f3f5be4175df34011a366136cddc8df6e2.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|PH7PR12MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: bef3080e-1c17-4d95-8078-08dd3b22862e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ej7P/tqOIT+qfn3ZRzSlEuIsghes+jvKDg2rYHmEZueUvM1+FLHWwwdaceTK?=
 =?us-ascii?Q?ALqbu2F1IhKb5c3L3h0EKlxtFgMv9PRWtVGg++LP7DquhukApnPSfHjXYWy3?=
 =?us-ascii?Q?NaR2ytH2Vp8c6G6zkOw8sFVWn9nEgq69j5eo6I2WCIccEIPjo4k/tvaqeIOK?=
 =?us-ascii?Q?EzXfuE8B9hviXBn/j//X7ID16DjtGZzU4Qe8zqbwS6m/V5OobPWxiGYw1UdL?=
 =?us-ascii?Q?pSPlWaQckMQnbC1Lg+nYdRrSZcgpIdRJ7AElq7nAYbCoLccOqGGtOEsRBuh9?=
 =?us-ascii?Q?Y+BxnxfqdNMBajHBb/WrwACgotnZBloGAasqODESYVfR2VZv1CpiVNLiDVUP?=
 =?us-ascii?Q?EAzuEPe03MvVBQQN+L/bLaJAyizSwEeGsF0JQNOl9i4H9wKcOYY3//SF6CuK?=
 =?us-ascii?Q?TbeAjjIBejOagnM37EISALl3ujmIWxCCGy1UQIs+W9tHTQQUyV6dJq1Xify/?=
 =?us-ascii?Q?OdjY1jcmMGDCUGp+oxua/P3KJFQ1BzXlhy0uPh35+xGsEGLMbZgbBqTpahwX?=
 =?us-ascii?Q?1qiQcMfdk+7VH1Uv1GGtJqsq+nAXqnJ6zBJugt0T+InM9NGxzA7vKrfOUnJA?=
 =?us-ascii?Q?Q55+wupPnPgQgC3q8uH5YNMh0mlsvOtDpLYYe3LJe9lt5AjnjNfTD7FU3pvB?=
 =?us-ascii?Q?vkO13LBBAUBjTHlwBLEiXZ6c/0gJ4tNDfP/h4Ap7n2qOEf2hwEc8MA0uuiWd?=
 =?us-ascii?Q?Bv+K763moNkIcFFwfNwBB2uMFMGQ2m1+ghGxiwwQQm2EkczujBV6a0eJFu1Y?=
 =?us-ascii?Q?dW/58JHrl9lANHBXH+4TlmSLyOWkwwSt0LTcICvMsBZB25S7nMV/SmBR7ISu?=
 =?us-ascii?Q?1YWuDnGiD+M8oMrDZXT/00mrBk+SasIMn06SZ7CS5Y6NdqE5VyA3bVYbh7z/?=
 =?us-ascii?Q?9T7GSODK4h0xCTTjjsGtanytH068djWn5l1JDiVx+JKsTOF65nxtdY5PBs1l?=
 =?us-ascii?Q?rlbiSNBnQvgg/5v6C2PWl7R+PM1geEFzOG1QMc9vuu8TF2sHCcXMKW7+7QRz?=
 =?us-ascii?Q?L/Jej+kx1/OB3NZHbvLJkBjKPeSHk9VwX8TdUvZ+ofegIKNKlWdsDe3DsLXm?=
 =?us-ascii?Q?tBMBA8KbsUZ/PVIQd7rhW8uMOhoFvjfYMR3HxEyZh4I/D1MAZh70dm0fqxFE?=
 =?us-ascii?Q?VlIiqT95TLa1ROUdc53HGp2YjkPt57IR+svetJ2m6iKRl5JgtFpGPA77R4Oe?=
 =?us-ascii?Q?N0Xe+9g9/tRzEZhGMzypH3rUKmBZPJqbZuDF8TVfBwbbDLoQqvJ5Is4ug4I2?=
 =?us-ascii?Q?zmZIssT00ISkOCsb6A9vl4id4csCWpchR8AeE2Daf1lVtdOWtBs+8ixCDv2n?=
 =?us-ascii?Q?Z4uyvfWFPF5pW6mObe02l1cH0MajiwBOjebMtMGgHU+9XcLl76+FYaMiMK58?=
 =?us-ascii?Q?fRUVjdOc3UiOHgflJKlq1ijJ6w/EadaNX8yxHI2qBMNilb/uIsMsvqnReAWT?=
 =?us-ascii?Q?SuW91/gwWbcnt56mH1YrL0w3LRaMXHVP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:42.1818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bef3080e-1c17-4d95-8078-08dd3b22862e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7281

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it
is assigned. The assigned RMID will be tracked by the hardware until the
user unassigns it manually.

Implement an architecture-specific handler to assign and unassign the
counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
specifying the counter ID, bandwidth source (RMID), and event
configuration.

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
    Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
    Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Moved resctrl_arch_assign_cntr() and resctrl_abmc_config_one_amd() to
     monitor.c.
     Added the code to reset the arch state in resctrl_arch_assign_cntr().
     Also removed resctrl_arch_reset_rmid() inside IPI as the counters are
     reset from the callers.
     Re-wrote commit message.

v10: Added call resctrl_arch_reset_rmid() to reset the RMID in the domain
     inside IPI call.
     SMP and non-SMP call support is not required in resctrl_arch_config_cntr
     with new domain specific assign approach/data structure.
     Commit message update.

v9: Removed the code to reset the architectural state. It will done
    in another patch.

v8: Rename resctrl_arch_assign_cntr to resctrl_arch_config_cntr.

v7: Separated arch and fs functions. This patch only has arch implementation.
    Added struct rdt_resource to the interface resctrl_arch_assign_cntr.
    Rename rdtgroup_abmc_cfg() to resctrl_abmc_config_one_amd().

v6: Removed mbm_cntr_alloc() from this patch to keep fs and arch code
    separate.
    Added code to update the counter assignment at domain level.

v5: Few name changes to match cntr_id.
    Changed the function names to
      rdtgroup_assign_cntr
      resctr_arch_assign_cntr
      More comments on commit log.
      Added function summary.

v4: Commit message update.
      User bitmap APIs where applicable.
      Changed the interfaces considering MPAM(arm).
      Added domain specific assignment.

v3: Removed the static from the prototype of rdtgroup_assign_abmc.
      The function is not called directly from user anymore. These
      changes are related to global assignment interface.

v2: Minor text changes in commit message.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  3 ++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 42 ++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index acac7972cea4..161d3feb567c 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -724,4 +724,7 @@ unsigned int mon_event_config_index_get(u32 evtid);
 void resctrl_arch_mon_event_config_set(void *info);
 u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
 				      enum resctrl_event_id eventid);
+int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			     u32 cntr_id, bool assign);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index f2bf5b13465d..ef836bb69b9b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1371,3 +1371,45 @@ void resctrl_arch_mon_event_config_set(void *info)
 		break;
 	}
 }
+
+static void resctrl_abmc_config_one_amd(void *info)
+{
+	union l3_qos_abmc_cfg *abmc_cfg = info;
+
+	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
+}
+
+/*
+ * Send an IPI to the domain to assign the counter to RMID, event pair.
+ */
+int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			     u32 cntr_id, bool assign)
+{
+	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
+	union l3_qos_abmc_cfg abmc_cfg = { 0 };
+	struct arch_mbm_state *am;
+
+	abmc_cfg.split.cfg_en = 1;
+	abmc_cfg.split.cntr_en = assign ? 1 : 0;
+	abmc_cfg.split.cntr_id = cntr_id;
+	abmc_cfg.split.bw_src = rmid;
+
+	/* Update the event configuration from the domain */
+	if (evtid == QOS_L3_MBM_TOTAL_EVENT_ID)
+		abmc_cfg.split.bw_type = hw_dom->mbm_total_cfg;
+	else
+		abmc_cfg.split.bw_type = hw_dom->mbm_local_cfg;
+
+	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
+
+	/*
+	 * Reset the architectural state so that reading of hardware
+	 * counter is not considered as an overflow in next update.
+	 */
+	am = get_arch_mbm_state(hw_dom, rmid, evtid);
+	if (am)
+		memset(am, 0, sizeof(*am));
+
+	return 0;
+}
-- 
2.34.1

