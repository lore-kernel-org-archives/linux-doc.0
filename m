Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9E2163B0;
	Wed, 22 Jan 2025 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577287; cv=fail; b=ulMU4y6J+kkCA4KoUXFA5W8JRHyESMll4tABZnaL2WvBpImYOYmD5KhMr1UO82OGkAYwHY2WWjQW4dJEb9xO6icIARmm6rbNQSjopNORXpPnuVfhJqOHS2AHt+CSd1gsy1t7/Sni5eBFZqTCSuM+kedNiW5p6trnQpTgnyhAVmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577287; c=relaxed/simple;
	bh=gPcfWCASFm+z0iO5oiEajbiliUh05GbU1w97pKUggqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8qLJNdx6jQBz0UZ34VAGuo8MH/xQYOQLWZRWeLwU3cxLXlhFxXDnlDSQ79vW3xKuXkyxRcWP1KveuAIb6rY6lxC11PvHXopoNnKDgBIhXcMUQrknQmsUJpv7QzQq9BUR4D8AZOd5etubev+QWaaVDr00AZW+zia26OglVSn/dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xJG/l0jz; arc=fail smtp.client-ip=40.107.244.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xJG/l0jz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0dE4Xi96Ftdmz8Hnoa1+ZJdEdb7jrPReIbbZE217EncixcwZ1E+O9RftltccAS0uKMUc4S2VlOnklxLxMOOXEhszvnyBaR9FVk/nt/g/P7J7l1wOlvinh5DfEmuyNxlgNYD9mybt4kPIpiMt95XU/RnlkfP3RXhY1xjfTDVpT0WzmcrguL4nivWJIAfnrzwrdbsEXCzNGpXeEgjIKcJpdZkCDuwCfDHn/1Oinm80c82LQAurxGP1hyV/aunUCR6gvytRAUBZg1Fntv3Sp6SvSOjD+uaYhNvJRJRPodEsaPTZmxAJ1Ad1cROhYvmeBLJng04Y6Haer8YrE88jc8hzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNhlxFEOdSMGP5MRfIGoRpoaBahr4HOKt83Sx7+SOmU=;
 b=qfPtlIXAyW/DEjb5B9t/ac7DcSQKhxEE2t+KQv4dIj+JSwiId7Lu3Pj4xIaIXGmttI0d305TFCtL/Q2aUIfS8irgkDUjhZpC+NsnWrXuulZXTZGDqXGD2ocHbRCmxBCznN9Jt6+fYETYQqQjKw9yiYLT+gtTZr0SVc2NrPFdQPQ8vI16k9ZdV2MtP14GHbDpGCqvktLIjv1kZG/8Uiz0xwFuLJNHZCK5KjG9+Z1zdKfjBUQSdwcbYVZ1O+9OjIqvkL1wClNOxub67ZbAdEMsHdRNfsUdWWNds8CHKqzNOt4GjdqBYN7PCYgPtdDCBesyW3piuXpa2+bAA2I8BqMcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNhlxFEOdSMGP5MRfIGoRpoaBahr4HOKt83Sx7+SOmU=;
 b=xJG/l0jzqOGZf48SPkLZAMqxlv/nIF7zompRzq7n/PlmcLCVAhy3Qb3hQI+5R1n5c5uHORFi7HjddXCgxW1bvV+0gfuMg0pZqphHfQ8ysijFL3zo8gOoohBl5nLtOvXkmlP34X3dM5BPgk2gwQvqh2j3gpa9yg+0mFmE50MBTuI=
Received: from CH0PR03CA0426.namprd03.prod.outlook.com (2603:10b6:610:10e::10)
 by IA0PR12MB8981.namprd12.prod.outlook.com (2603:10b6:208:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 20:21:21 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::1c) by CH0PR03CA0426.outlook.office365.com
 (2603:10b6:610:10e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:21:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:21 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:19 -0600
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
Subject: [PATCH v11 04/23] x86/resctrl: Consolidate monitoring related data from rdt_resource
Date: Wed, 22 Jan 2025 14:20:12 -0600
Message-ID: <823ba5e1632d136359a6edc864bde68b46a13fe2.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|IA0PR12MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 84f7b143-0f63-4bb5-df8c-08dd3b225631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJK0Hp7p2Cxn9NHRVe8rFlorcmFfvEDMBIi261r13xsDhgPTU7LFNNNengNg?=
 =?us-ascii?Q?f7B3nVezmWyQRAkcodrtq9hFRBmfcZfI7/pYAtBHCXhHqUqnVXqOym2cdi6s?=
 =?us-ascii?Q?l84AwThRWvvP5uG2AjW0miwMPFMLVcdVLrPka2VJk/qHDxU0ryZtpolxKIMn?=
 =?us-ascii?Q?qCkyXWJkpmOo3awaMrfpQelKFWH8qrzxRBDuABWFrXyTGvhrH4+8tAwHASV1?=
 =?us-ascii?Q?hRZ3rh8TXl4bhQFa32LuPFxllZY97KfKXZDd7zaHfLcR3Sf6gm30QkHVVsJs?=
 =?us-ascii?Q?SKtEPL1n+JT28L9ceG17xe2ppdBq7D37ZGish/YyCyeOFxzxmu0Lw5I3egUE?=
 =?us-ascii?Q?IvBebezgPcCeA4FHGqRtLnV12I573LRQept8I31ofHgmjKopeirWjBm+aAzl?=
 =?us-ascii?Q?OaFq38gpS1Egu1bc7DwqSDXKkb4Xt5ovwFI4/wrgbqvTXEfxgTAdPsr0CfG/?=
 =?us-ascii?Q?QUilLu/qGr8IK89YVgpTcMnY06C4HpzSjCaNdm+oqWWjHsr75NBu//Sgtukw?=
 =?us-ascii?Q?uSdHNRSE1OxtR72tzA/+86qxdL41yCGwrb9Lv7Hc6zx6dlMnTWcsPUN8GYmC?=
 =?us-ascii?Q?P7BB0/vApkBlbj6tx0kyQD+x8iEhWDRjoy8PkteYTs3OSfd+/m9+ZwLEs5KM?=
 =?us-ascii?Q?NOZl5R6CxJ3MsOOdF/DSrvadhAam9YISchDj5l8iQcXtrDRCe8xovOPDTHDH?=
 =?us-ascii?Q?L1ATPTIdDonZNpXq2QsFUDu31KaIcc74ZNmOQDboOFZsqKoIeElmvOYtXVZj?=
 =?us-ascii?Q?QseZYZUUzuo9cywg9vOCPxXABqZ4rIytZXFdJbqoKFAGKA/5a06aaColki2W?=
 =?us-ascii?Q?I/TjoHX0EfQnqc9/WzYiYLCd0Jca6K1EsOmYnm7nrN66ImBZzN0Xue5peQli?=
 =?us-ascii?Q?KpGbUKGnE7VTSH8hoGZ2CSFXwNFA+HMEhqngvCPVPOPMJu3X7DsMQWGOujfW?=
 =?us-ascii?Q?JGUCJSFd1JN9CckCNiQ8KGXluVr7gdI77sRZHxcLSY8ifz7/rQjQYiFEQfA3?=
 =?us-ascii?Q?9Outgpm7cchmVkkThM9k8bx7tHQV1qkVfbYWkDqpmtBmG95yGy500fm8STW5?=
 =?us-ascii?Q?cFGGYBDH+V3zTwoMuysheac1bCxLyhCvO1PJH1eQSQlvr50rjSbbLERJOI8q?=
 =?us-ascii?Q?B4tZjJahrYyLUpW6PsdtSPhAn6SRKyUbr8l01xHdYaslNP6fT9qKXWpVq1eL?=
 =?us-ascii?Q?xGgrB1Tf1Xdc4tdjiZYNiVmX2FZG0HOlh63XASLgHQoK86FYnMWWznYNX3tZ?=
 =?us-ascii?Q?bLNtyU60y7Tc3vQRa3hbLPOm0LXrg+dHocHnq3Wy+K2D/QWl9Cpv67VasvYh?=
 =?us-ascii?Q?r1w8kiDkfc2EG8XdvOgaCM6MO9QWwnltnEIg3scj1975v24Z2SvvkRCrO0M0?=
 =?us-ascii?Q?6HPaJ8hb+Jw3xycdbou18kCN0WE8DBlUQKB1j6EMQp4YxXbMmwoSfwhuQe0j?=
 =?us-ascii?Q?LQLSa4N/AT4rOBqnt5/ACEddwVh+jISUZRAu5eXcSBQsma2tMywOe17NgPIS?=
 =?us-ascii?Q?H9H8N5wRAjeW6s0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:21.5639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84f7b143-0f63-4bb5-df8c-08dd3b225631
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8981

The cache allocation and memory bandwidth allocation feature properties
are consolidated into struct resctrl_cache and struct resctrl_membw
respectively.

In preparation for more monitoring properties that will clobber the
existing resource struct more, re-organize the monitoring specific
properties to also be in a separate structure.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v11: No changes.

v10: No changes.

v9: No changes.

v8: Added Reviewed-by from Reinette. No other changes.

v7: Added kernel doc for data structure. Minor text update.

v6: Update commit message and update kernel doc for rdt_resource.

v5: Commit message update.
    Also changes related to data structure updates does to SNC support.

v4: New patch.
---
 arch/x86/kernel/cpu/resctrl/core.c     |  4 ++--
 arch/x86/kernel/cpu/resctrl/monitor.c  | 18 +++++++++---------
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  8 ++++----
 include/linux/resctrl.h                | 16 ++++++++++++----
 4 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 97511cc132d6..cb7feb7c990f 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -124,7 +124,7 @@ u32 resctrl_arch_system_num_rmid_idx(void)
 	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
 
 	/* RMID are independent numbers for x86. num_rmid_idx == num_rmid */
-	return r->num_rmid;
+	return r->mon.num_rmid;
 }
 
 /*
@@ -627,7 +627,7 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 
 	arch_mon_domain_online(r, d);
 
-	if (arch_domain_mbm_alloc(r->num_rmid, hw_dom)) {
+	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
 		mon_domain_free(hw_dom);
 		return;
 	}
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 1c7b574bf0cd..0c481501b8c5 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -222,7 +222,7 @@ static int logical_rmid_to_physical_rmid(int cpu, int lrmid)
 	if (snc_nodes_per_l3_cache == 1)
 		return lrmid;
 
-	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->num_rmid;
+	return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->mon.num_rmid;
 }
 
 static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
@@ -297,11 +297,11 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
 
 	if (is_mbm_total_enabled())
 		memset(hw_dom->arch_mbm_total, 0,
-		       sizeof(*hw_dom->arch_mbm_total) * r->num_rmid);
+		       sizeof(*hw_dom->arch_mbm_total) * r->mon.num_rmid);
 
 	if (is_mbm_local_enabled())
 		memset(hw_dom->arch_mbm_local, 0,
-		       sizeof(*hw_dom->arch_mbm_local) * r->num_rmid);
+		       sizeof(*hw_dom->arch_mbm_local) * r->mon.num_rmid);
 }
 
 static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
@@ -1079,14 +1079,14 @@ static struct mon_evt mbm_local_event = {
  */
 static __init void l3_mon_evt_init(struct rdt_resource *r)
 {
-	INIT_LIST_HEAD(&r->evt_list);
+	INIT_LIST_HEAD(&r->mon.evt_list);
 
 	if (is_llc_occupancy_enabled())
-		list_add_tail(&llc_occupancy_event.list, &r->evt_list);
+		list_add_tail(&llc_occupancy_event.list, &r->mon.evt_list);
 	if (is_mbm_total_enabled())
-		list_add_tail(&mbm_total_event.list, &r->evt_list);
+		list_add_tail(&mbm_total_event.list, &r->mon.evt_list);
 	if (is_mbm_local_enabled())
-		list_add_tail(&mbm_local_event.list, &r->evt_list);
+		list_add_tail(&mbm_local_event.list, &r->mon.evt_list);
 }
 
 /*
@@ -1183,7 +1183,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 
 	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
 	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
-	r->num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
+	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
 	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
 
 	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)
@@ -1198,7 +1198,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	 *
 	 * For a 35MB LLC and 56 RMIDs, this is ~1.8% of the LLC.
 	 */
-	threshold = resctrl_rmid_realloc_limit / r->num_rmid;
+	threshold = resctrl_rmid_realloc_limit / r->mon.num_rmid;
 
 	/*
 	 * Because num_rmid may not be a power of two, round the value
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6419e04d8a7b..f91fe605766f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1106,7 +1106,7 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
 {
 	struct rdt_resource *r = of->kn->parent->priv;
 
-	seq_printf(seq, "%d\n", r->num_rmid);
+	seq_printf(seq, "%d\n", r->mon.num_rmid);
 
 	return 0;
 }
@@ -1117,7 +1117,7 @@ static int rdt_mon_features_show(struct kernfs_open_file *of,
 	struct rdt_resource *r = of->kn->parent->priv;
 	struct mon_evt *mevt;
 
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		seq_printf(seq, "%s\n", mevt->name);
 		if (mevt->configurable)
 			seq_printf(seq, "%s_config\n", mevt->name);
@@ -3068,13 +3068,13 @@ static int mon_add_all_files(struct kernfs_node *kn, struct rdt_mon_domain *d,
 	struct mon_evt *mevt;
 	int ret;
 
-	if (WARN_ON(list_empty(&r->evt_list)))
+	if (WARN_ON(list_empty(&r->mon.evt_list)))
 		return -EPERM;
 
 	priv.u.rid = r->rid;
 	priv.u.domid = do_sum ? d->ci->id : d->hdr.id;
 	priv.u.sum = do_sum;
-	list_for_each_entry(mevt, &r->evt_list, list) {
+	list_for_each_entry(mevt, &r->mon.evt_list, list) {
 		priv.u.evtid = mevt->evtid;
 		ret = mon_addfile(kn, mevt->name, priv.priv);
 		if (ret)
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index d94abba1c716..3c2307c7c106 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -182,16 +182,26 @@ enum resctrl_scope {
 	RESCTRL_L3_NODE,
 };
 
+/**
+ * struct resctrl_mon - Monitoring related data of a resctrl resource
+ * @num_rmid:		Number of RMIDs available
+ * @evt_list:		List of monitoring events
+ */
+struct resctrl_mon {
+	int			num_rmid;
+	struct list_head	evt_list;
+};
+
 /**
  * struct rdt_resource - attributes of a resctrl resource
  * @rid:		The index of the resource
  * @alloc_capable:	Is allocation available on this machine
  * @mon_capable:	Is monitor feature available on this machine
- * @num_rmid:		Number of RMIDs available
  * @ctrl_scope:		Scope of this resource for control functions
  * @mon_scope:		Scope of this resource for monitor functions
  * @cache:		Cache allocation related data
  * @membw:		If the component has bandwidth controls, their properties.
+ * @mon:		Monitoring related data.
  * @ctrl_domains:	RCU list of all control domains for this resource
  * @mon_domains:	RCU list of all monitor domains for this resource
  * @name:		Name to use in "schemata" file.
@@ -199,7 +209,6 @@ enum resctrl_scope {
  * @default_ctrl:	Specifies default cache cbm or memory B/W percent.
  * @format_str:		Per resource format string to show domain value
  * @parse_ctrlval:	Per resource function pointer to parse control values
- * @evt_list:		List of monitoring events
  * @fflags:		flags to choose base and info files
  * @cdp_capable:	Is the CDP feature available on this resource
  */
@@ -207,11 +216,11 @@ struct rdt_resource {
 	int			rid;
 	bool			alloc_capable;
 	bool			mon_capable;
-	int			num_rmid;
 	enum resctrl_scope	ctrl_scope;
 	enum resctrl_scope	mon_scope;
 	struct resctrl_cache	cache;
 	struct resctrl_membw	membw;
+	struct resctrl_mon	mon;
 	struct list_head	ctrl_domains;
 	struct list_head	mon_domains;
 	char			*name;
@@ -221,7 +230,6 @@ struct rdt_resource {
 	int			(*parse_ctrlval)(struct rdt_parse_data *data,
 						 struct resctrl_schema *s,
 						 struct rdt_ctrl_domain *d);
-	struct list_head	evt_list;
 	unsigned long		fflags;
 	bool			cdp_capable;
 };
-- 
2.34.1

