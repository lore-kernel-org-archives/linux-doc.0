Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2045.outbound.protection.outlook.com [40.107.212.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7276217727;
	Wed, 22 Jan 2025 20:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577389; cv=fail; b=Q8CbtgRj/AmHmqYcCjRYf+twHV3gcEZc7WGp+roH45HY9UrXFauI6Bo2u6+zRxFboiZJsCHEb9SvdYzFXm5FMTjSOFDoou4bzVCRwpuRAS60TXF5DMmW1h8FqkZCri1ipvwII9qRdhBIrCG/R50cMr+vwzlLB/k+9WaMLtfH288=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577389; c=relaxed/simple;
	bh=MJxlBahNn2vM3v4D1DGDck1K3HTDV0yhnHKOiw1pltM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jqvaN3piZhjjpE/HO14X+2v+PUoqi6NqjemvQLWVBmr5QVQOWFx8HuOJH++k3sZDC4fTs34DXmFf0BfLOaOs8f3R5gHUq+qF3ShACRUo/JiYOL8Mg5rtszZS4/tajMC5J3naAd45gKNF5gzCK0Mjq/31tQeDAY78uhrki2PnTig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NLhM2rKO; arc=fail smtp.client-ip=40.107.212.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NLhM2rKO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EV4gHOG3jhl2u3EZmW9ZQF7UkBDondrfUCgw5M9oJqdCEntUPuS3jLsX0OntUdSm1cMv9SchJODEhAdpUpKqTSJ4CeTXWsQPuKjmuCYVlBxziHZWuAhOKV5/aF6oeoCl5VP3EBSOtx/QnAKzMX8aAvFnq0a+pWPOO5FSV2j8dmQoqzFKT4j0S1pEjSjO2R3PwPyPQC9vGLlwVNE1LXP0hAF9ftQ1/M7OLX2D5yMBGFCLSpZ5aUH9SArd6Ea2PMJHiY2xfK6NDIGiL5KQDmDbugKNlnYZG1C9Op0fYxN3Nm8mY/qS8cF571t3rUEfGfbec+OE7O/mp2ZrvMRipzmJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qq8pDWkleqlwmfJqRtiEOnHYflH26TbxvDwKjimXhUA=;
 b=fvjzJfdc3Jw5WBFm/N3WYCRVq3Ez9p8a56Bo/ar2txzKiiVM0OTAzfv5zheJV8fM60gzUKS1XNj6GgL/fhLZx8XG0nsHjPknIm+clHP+WlQzxA+MNOGLiHfUuV+Yq/SaJC3Av5WXmxUTWn/XfKkMdIgibzKUYdqS/3O/t75pLqyJnh2h84r9GqC7YeCaFRUuj7x814cbNcds4GuiUTNgdysNOdtacBANLweO3vVdCGH4dE0erZe9ZRIKiZIh+VRiCKzQSAfnBf9QleTZ4ubrNJV5C8hHWhQMnrTPJVSsOOpDx80bEXq99eMMSKrvXx4tSVIUEXQZdDqTxdPUAWslCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qq8pDWkleqlwmfJqRtiEOnHYflH26TbxvDwKjimXhUA=;
 b=NLhM2rKO4lN/Ohd2ZF/DjZT6K/hSa/RCRYVhI5WVqNoCqykE7qylWIpNsuLUOvQInAWeMkdzNnIjk6JY9VdpFnR0KHJ0qXmAUTcDQuxVL/54c0Fz79Df1BjK9HX95AY45pW+vkBbHa6nAbxYOCJQyOw3iRRESE1HsiBGbpnoz58=
Received: from CH0PR03CA0427.namprd03.prod.outlook.com (2603:10b6:610:10e::30)
 by DM4PR12MB6064.namprd12.prod.outlook.com (2603:10b6:8:af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:22:59 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::fe) by CH0PR03CA0427.outlook.office365.com
 (2603:10b6:610:10e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:22:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:58 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:56 -0600
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
Subject: [PATCH v11 16/23] x86/resctrl: Add the functionality to unassigm MBM events
Date: Wed, 22 Jan 2025 14:20:24 -0600
Message-ID: <36262057667c27acad777836cc1497b19cb7c06d.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|DM4PR12MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: b420810e-be71-47e2-1046-08dd3b229029
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0rja95xLL82JDeQ0fPaYgStFJNB54UGqB8uweW1uoW7ehhUOMr4jU8SJJ3se?=
 =?us-ascii?Q?zwlvbXGe5FddUisXX0VXQwpsXJY4ByGaY2W12EMdhE2oMMKb++JASupNz+fU?=
 =?us-ascii?Q?f859MqsoJR4ay78M315/0FIYBMj4goZFAafUSn9I8C/QD5u6UyIK+UFggFG3?=
 =?us-ascii?Q?kvIoPCL0sockV/NQIyEpei1PWpxowoY6MpPk4G4YZhnY6lyzUwp17IbOOBk3?=
 =?us-ascii?Q?lYYZlS88cRHiJzud662oTn0pLQ8B/rPvHJVaQ/aQEI2JYt+bcCdlp1zRDYLs?=
 =?us-ascii?Q?yZ8BaMoK9OvTw6KhcTkvlHa01cOB/N8e8wWHJZUXeVwh7hsy6rf5pek7jI91?=
 =?us-ascii?Q?jylwfTeu6vNrDi5+r1BOmXYXC7QlVchjZiufcQQrjHCgpmWX3bjrxTKpZFLd?=
 =?us-ascii?Q?t26LHoJ4lbTQtlRXLKWTfSIMxCpIJhl5evktDVGDEv9n4q2X1U/XvQ9GjudH?=
 =?us-ascii?Q?3kYd/SFkOcic+rOS02ZKuIzw5YhH2smYm44vDfNgL06klTi5QX+Z7HfAJpZO?=
 =?us-ascii?Q?CHDAqn5oJo6SZuw4722kbSwZItF9pYzYOy4E2rWGfEDIaDqB2co9jrZPJ8BG?=
 =?us-ascii?Q?H7DW7HD6UjSoAb8jEn8YbqoHPwXIKTOIx9Y2IvEh+vGHvG7Xi1OtxwHb3Ye3?=
 =?us-ascii?Q?BHwIxy+sBjhtqKECrzjnUThAZ2vLru4kvTABEnFJgkWJvXO0O9dFaUoouoUo?=
 =?us-ascii?Q?aQYx63/FQwh671EjFDoU8Bh+z01fSNqhLfMgCoHr98xTZ/svQ2jNYp3xnBzw?=
 =?us-ascii?Q?Huk955m0aiEdL/xB3yIfjTimSbl7aNVo4yBtrtfGKXTRdEVPNHZQx/nCO9sv?=
 =?us-ascii?Q?3ScAzp0dqpzZH1k971RnVcJIJJc12MI/5n+ck66XC6rTVRI5y/BdfisdT+0w?=
 =?us-ascii?Q?phNnyRs++0FFyDxbRcZH8FHJEFjOSQiryE6n8ytAMxZPefFrZ2H/0q9qVjSG?=
 =?us-ascii?Q?auEwCIKt6sp3ZZGhoVy4bLETq5wT9IBvt+XJ+XTC+oE+58qfEMBIAqRNE6Ta?=
 =?us-ascii?Q?+ULcYLAMnUo4QpzK+JatsC7frCKpAndrTiLXPaSDtUvZRBpjAC9jcvxRQg1f?=
 =?us-ascii?Q?TOLojvjYcPh1if91fTXFDfb1Q9BDR0wN7qsMogTUzeNgPUNbd+hatOZLuOaq?=
 =?us-ascii?Q?5I+wTblHzEmOY1k4Fsc7JNyHyvJust24vM6tXMcyUe3KH1uDxEbRm3LzIrX1?=
 =?us-ascii?Q?8SgNCRioS+6r5kKiJH6PrA1YLkQeIiDsRME1nr5b3HBim5ppiWROxQR3gJJO?=
 =?us-ascii?Q?iX7rAXD6e7XqLiWQ+sPc/EGg82gzgnXuU0rUJ7fkKsxnIapp3Xd6af5nVfor?=
 =?us-ascii?Q?SeOL/xiIL7uUrl9we9OW0/Bfb1BFUZGo7bkCJOR7qLYTyRYId4JhD7lR9grb?=
 =?us-ascii?Q?KjXYDmdGAsK6qqfRLZDNWWuutMRs53I7a/+qu2HsqWWjbFF9Jqq6XsIUYVgH?=
 =?us-ascii?Q?IvXmArUovrXfpF+XjJUYlk0ZZu2WtLh/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:58.9235
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b420810e-be71-47e2-1046-08dd3b229029
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6064

The mbm_cntr_assign mode provides a limited number of hardware counters
that can be assigned to an RMID, event pair to monitor bandwidth while
assigned. If all counters are in use, the kernel will show an error
message: "Out of MBM assignable counters" when a new assignment is
requested. To make space for a new assignment, users must unassign an
already assigned counter and retry the assignment again..

Add the functionality to unassign and free the counters in the domain.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Moved the functions to monitor.c.
     Renamed rdtgroup_unassign_cntr_event() to resctrl_unassign_cntr_event().
     Refactored the resctrl_unassign_cntr_event().
     Updated commit message and code comments.

v10: Patch changed again.
     Counters are managed at the domain based on the discussion.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     commit message update.

v9: Changes related to addition of new function resctrl_config_cntr().
    The removed rdtgroup_mbm_cntr_is_assigned() as it was introduced
    already.
    Text changes to take care comments.

v8: Renamed rdtgroup_mbm_cntr_is_assigned to mbm_cntr_assigned_to_domain
    Added return error handling in resctrl_arch_config_cntr().

v7: Merged rdtgroup_unassign_cntr and rdtgroup_free_cntr functions.
    Renamed rdtgroup_mbm_cntr_test() to rdtgroup_mbm_cntr_is_assigned().
    Reworded the commit log little bit.

v6: Removed mbm_cntr_free from this patch.
    Added counter test in all the domains and free if it is not assigned to
    any domains.

v5: Few name changes to match cntr_id.
    Changed the function names to rdtgroup_unassign_cntr
    More comments on commit log.

v4: Added domain specific unassign feature.
    Few name changes.

v3: Removed the static from the prototype of rdtgroup_unassign_abmc.
    The function is not called directly from user anymore. These
    changes are related to global assignment interface.

v2: No changes.
---
 arch/x86/kernel/cpu/resctrl/internal.h |  2 ++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 39 ++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 547d8a4c8aba..a5b8eadc7f5c 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -729,4 +729,6 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 			     u32 cntr_id, bool assign);
 int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 127c4000a81a..b6d188d0f9b7 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1518,3 +1518,42 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	return ret;
 }
+
+/*
+ * Unassign and free the counter if assigned else return success.
+ */
+static int resctrl_free_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				    struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id, ret = 0;
+
+	cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
+	if (cntr_id != -ENOENT) {
+		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
+					  rdtgrp->closid, cntr_id, false);
+		if (!ret)
+			mbm_cntr_free(d, cntr_id);
+	}
+
+	return ret;
+}
+
+/*
+ * Unassign a hardware counter associated with @evtid from the domain and
+ * the group. Unassign the counters from all the domains if @d is NULL else
+ * unassign from @d.
+ */
+int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int ret = 0;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list)
+			ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
+	} else {
+		ret = resctrl_free_config_cntr(r, d, rdtgrp, evtid);
+	}
+
+	return ret;
+}
-- 
2.34.1

