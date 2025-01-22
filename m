Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298C721765F;
	Wed, 22 Jan 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577375; cv=fail; b=YIVx5RO8r2Nq2wZ7WT2kJ++EM3+QQxPbq9X3j0W794IWUlcwfw3o1I1VEp7khxATkvAete4sZQnXUlsfQ/jhuOFxTewTEjgOQPEadMJCT2jlCOjKIIdLyit4pK5V6g/bBo4/8vBY1ewxrD+yeE3cJMpbgTCUF88GJg26laJDduo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577375; c=relaxed/simple;
	bh=9R6Ekz2ZrAjjVlQNo5RNEP9K6XAt5BJ95esM7mMsxn4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lGlBHODx83kWRFVvWQ1fkGGlCH6rP9iKO37U5+TBoroaVPWrS02xrLzvjSBGBAyqRcsdYXH+Wtx5zfto4lhAaPtb5ztUBdot6Kk6mI7zcwMvPsxLJPB5HuyMqS8/DyMdWPIBABiJUEWgmthWGLCXun15Vqmi/5MnZ2BeR0sIpz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wsPJvLpr; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wsPJvLpr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+e2c4JX8OQU3aUb408uYH0aQDgdM4cU20RLPoWYomXEv3f+eIx0td3SWPm0VCpTxHWc0ysePFPczAVcFKEdsu3Ck0Ceoe72MP3YhdBfj6myTk7mNZbWtOjUUScVEeWy4ZxdSXrvFShQThKbEi6tn/eu4v1IbnKdA6r0dkIBSt1f287mWJP9eYhwPoFnhKuLEljs1y6SstYENJXXAE10TyvNbio6/KbJwW0mDtBDivkoHRUBxiKnboYCJQkdXqqOPO6FL4tgQCpB3VswVoV8rMvBjBhU0D7SSC9q1wDU6IfsiW36kpob3fA/qgllCZHN53cUm6/RutB9SsLsSYao4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiAPZcQJ8g2SCBdeGvdHCAE5ygxsvP303rLpVgDEQPo=;
 b=JyN5od1uH936ctvNyja/oJBa906kIKD2XCUjFS3uYes9rlS9PE+8sSU8OL208JnCmnEISy8AVi2H8XpTS8dvvvJiPGXTq7o6uPIEvY3/FOrWDKwkxryUkpH+Uzemh4JAIiAA1gkTA0bF/C7574AXJGilm5OmLCRj55zm82gfeUYsujgste8r3btbcL5IDPdWP7xWKoMqscKiyAOId04wXYZG4bijtngOSLn5t5h+M4rSrBlU9PrCQRTmSlf4MaXzHVrA4kGozaJPYM8NRfM6mhO4P+lPZby4ARoqObIiW/BM9vxILhR4wBfI/+dBVmTgHvozsYD2p7AgV3UnNp2y3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiAPZcQJ8g2SCBdeGvdHCAE5ygxsvP303rLpVgDEQPo=;
 b=wsPJvLprEUPCwR7pfXhA4rvlX+ns7qxkF2eNOauYt7yvmtRg5VBts2SvjFWBUoFToUvaZQYbQoWVdRUBfoARI0kT4AnorUM46ViVCpFhEmCFbQ2xMVrb0WQ5DHLFZ8QzrGaXxkihax6ZvNb5dLVl9y/L+4OHWT6Zn6oTreZR5t8=
Received: from CH5PR05CA0019.namprd05.prod.outlook.com (2603:10b6:610:1f0::27)
 by MW6PR12MB8661.namprd12.prod.outlook.com (2603:10b6:303:23f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Wed, 22 Jan
 2025 20:22:51 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::d2) by CH5PR05CA0019.outlook.office365.com
 (2603:10b6:610:1f0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.13 via Frontend Transport; Wed,
 22 Jan 2025 20:22:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:50 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:48 -0600
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
Subject: [PATCH v11 15/23] x86/resctrl: Add the functionality to assigm MBM events
Date: Wed, 22 Jan 2025 14:20:23 -0600
Message-ID: <c6f275566395ffb528f1bd254335c13274567c7f.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|MW6PR12MB8661:EE_
X-MS-Office365-Filtering-Correlation-Id: cec54b71-170d-4813-5289-08dd3b228b37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7KmvaVv9mUlevyoy6by3MIRR1qCizNsoDZBV0mtNcvjBlkYNiXJzpPknzTXe?=
 =?us-ascii?Q?4mldeKlmM21EiHU7KteHLIKZ/ghfL3MVdFbGwnmp5LTMqbpxQRRNE9AqZul2?=
 =?us-ascii?Q?fAZO8B0l9cZoRqh9pIcowWIcA3cCK3TOqXGTCZLINakmu9lCyBDnXmjOMSbP?=
 =?us-ascii?Q?kzqurFIBcjyfWzr5jOGlgpMtvoIcBYNNHt0TvWz5JmXLclXk7mVpApGAB6lw?=
 =?us-ascii?Q?NvhNyR1IOwsKD8Bocn/xY3wI1CfUIRGTlLlblK9ZsOJSYb8SNbCK9v1yIotb?=
 =?us-ascii?Q?um68aV8/XE52/8FoItIOV4af8FA+oVyAj0j3MRqUye38d9aLY6V0Eddi1oRB?=
 =?us-ascii?Q?4vm6ZGn8od+ENCJiXg2++FeWiteFQRYtHsKb/bM/X8OJ8IjFt+VolX7psXH7?=
 =?us-ascii?Q?mIQzT06avYWE/OpurA0R1sclmvssrdczh8GIWjPBaEtAjqtPuwRxfOqtf7Ek?=
 =?us-ascii?Q?W8oMO2CbWN6c26KZB+C8LaPv4OmbH4EY8B4IGZQHYb01cfdMV31/4c02Zfbn?=
 =?us-ascii?Q?Yb16e1oA24eIHgRA9LCRE130C4NhKLZYKi6o7gDUETJdHrOWW2UYfH/+RL9v?=
 =?us-ascii?Q?9cnzfx+wwa7cdBjCsP+AF87uIETM7EXAm2MGnyB+W16Wds9f0/MfmXlc4Q+i?=
 =?us-ascii?Q?oBwzedaRn1vogcpnoJ3AFLUp6AhNe4bL2gqxmo6MW7jrc04QNM8ZgUqjN7SE?=
 =?us-ascii?Q?qKo4KzTP7V/6F5ktFTBLaI2/4Bjf16UhL5Aj09YuUeERh4H7l08D1FHGXSR3?=
 =?us-ascii?Q?oQ7P2+Wa9UwClQHPJOiOyv8u5dTeIySR1rp2iL7K9XOMIMgoqR3Qzzx+qhjb?=
 =?us-ascii?Q?yFViMi7wMnQ07Fdkt8B6JyF3B6laniM21oN1hbS1rFh9WDD4twkmnY+x1IFz?=
 =?us-ascii?Q?CQmqp+wx1eetxq/vLqrKBg2CekPyu6rKpegG/W7DBO0ygsNbh+WKWlgRoe07?=
 =?us-ascii?Q?qG+96tNgFDrKIdyqA0sn8NUMIjPjYdEfOfk6p4+ulnqqV/Lm/rfSrJ3APBur?=
 =?us-ascii?Q?6gpA/WkQMxsZTH6oBqn3O9JjfKnDSuTQQ8zj++804qw8EcU8p/T5Q0nxOcqy?=
 =?us-ascii?Q?auMhGHSLaGxdyJ7829Uqkz9g1ga1/X8xYgPJh9lvyyGXygI/UYJWq2NGCUR+?=
 =?us-ascii?Q?49Vmv4DZvdX4EYAYUNC98Eklqyf8kR1HJZWWfNiAVR3Qcmn0vXUeCYg5HFb3?=
 =?us-ascii?Q?3GT9o2ZV1z6ajD3n87CF4uly9s9Bxx0fccfM1+3Xc1tmtowZd3QBJywu2T+G?=
 =?us-ascii?Q?nfN1AWqS/VqI1EgissWHhb7VoUnVCdAJdxMw6NGrvsMF8j5H8WoegrVajntB?=
 =?us-ascii?Q?4y02T3KO/Ckh394BGJX7EM+9TlLFaUJbamVWnq4DhlNDpAvFn2TZT2LlFDt4?=
 =?us-ascii?Q?3ImPIsszDJdxLA+crP7d3l0YblvSnsxpx/1SZfg9VV7xLTulXmfY2cINVKKR?=
 =?us-ascii?Q?4+iW0A5G6bY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:50.6282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cec54b71-170d-4813-5289-08dd3b228b37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8661

The mbm_cntr_assign mode offers several counters that can be assigned
to an RMID, event pair and monitor the bandwidth as long as it is
assigned.

Add the functionality to allocate and assign the counters to RMID, event
pair in the domain.

If all counters are in use, the kernel will show an error message: "Out
of MBM assignable counters" when a new assignment is requested. Exit on
the first failure when assigning counters across all the domains.
Report the error in /sys/fs/resctrl/info/last_cmd_status.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Patch changed again quite a bit.
     Moved the functions to monitor.c.
     Renamed rdtgroup_assign_cntr_event() to resctrl_assign_cntr_event().
     Refactored the resctrl_assign_cntr_event().
     Added functionality to exit on the first error during assignment.
     Simplified mbm_cntr_free().
     Removed the function mbm_cntr_assigned(). Will be using mbm_cntr_get() to
     figure out if the counter is assigned or not.
     Updated commit message and code comments.

v10: Patch changed completely.
     Counters are managed at the domain based on the discussion.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     Reset non-architectural MBM state.
     Commit message update.

v9: Introduced new function resctrl_config_cntr to assign the counter, update
    the bitmap and reset the architectural state.
    Taken care of error handling(freeing the counter) when assignment fails.
    Moved mbm_cntr_assigned_to_domain here as it used in this patch.
    Minor text changes.

v8: Renamed rdtgroup_assign_cntr() to rdtgroup_assign_cntr_event().
    Added the code to return the error if rdtgroup_assign_cntr_event fails.
    Moved definition of MBM_EVENT_ARRAY_INDEX to resctrl/internal.h.
    Updated typo in the comments.

v7: New patch. Moved all the FS code here.
    Merged rdtgroup_assign_cntr and rdtgroup_alloc_cntr.
    Adde new #define MBM_EVENT_ARRAY_INDEX.
---
 arch/x86/kernel/cpu/resctrl/internal.h |   2 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 105 +++++++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 161d3feb567c..547d8a4c8aba 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -727,4 +727,6 @@ u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
 int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
 			     u32 cntr_id, bool assign);
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index ef836bb69b9b..127c4000a81a 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1413,3 +1413,108 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 
 	return 0;
 }
+
+/*
+ * Configure the counter for the event, RMID pair for the domain. Reset the
+ * non-architectural state to clear all the event counters.
+ */
+static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
+			       u32 cntr_id, bool assign)
+{
+	struct mbm_state *m;
+	int ret;
+
+	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
+	if (ret)
+		return ret;
+
+	m = get_mbm_state(d, closid, rmid, evtid);
+	if (m)
+		memset(m, 0, sizeof(struct mbm_state));
+
+	return ret;
+}
+
+static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
+		    d->cntr_cfg[cntr_id].evtid == evtid)
+			return cntr_id;
+	}
+
+	return -ENOENT;
+}
+
+static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
+			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id;
+
+	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
+		if (!d->cntr_cfg[cntr_id].rdtgrp) {
+			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
+			d->cntr_cfg[cntr_id].evtid = evtid;
+			return cntr_id;
+		}
+	}
+
+	return -ENOSPC;
+}
+
+static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
+{
+	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
+}
+
+/*
+ * Allocate a fresh counter and configure the event if not assigned already
+ * else return success.
+ */
+static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
+				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int cntr_id, ret = 0;
+
+	if (mbm_cntr_get(r, d, rdtgrp, evtid) == -ENOENT) {
+		cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
+		if (cntr_id <  0) {
+			rdt_last_cmd_printf("Domain %d is Out of MBM assignable counter\n",
+					    d->hdr.id);
+			return -ENOSPC;
+		}
+
+		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
+					  cntr_id, true);
+		if (ret) {
+			rdt_last_cmd_printf("Assignment failed on domain %d\n", d->hdr.id);
+			mbm_cntr_free(d, cntr_id);
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * Assign a hardware counter to event @evtid of group @rdtgrp.
+ * Counter will be assigned to all the domains if @d is NULL else
+ * the counter will be assigned to @d.
+ */
+int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
+			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+{
+	int ret = 0;
+
+	if (!d) {
+		list_for_each_entry(d, &r->mon_domains, hdr.list)
+			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
+	} else {
+		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
+	}
+
+	return ret;
+}
-- 
2.34.1

