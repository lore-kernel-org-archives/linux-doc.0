Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B625F7A5;
	Fri, 24 Apr 2026 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994953; cv=fail; b=oHWsJjOoCbhOeZ4JWyApbuLDf+QreFnFsnJ2pCyL+7PfkV64uTWnbJ2IrRUzQy3+89xp6xDB1dvHhdpqDBEFgqYqmeKL8brt7lLCMG1uDfmmufQV71HN5JB8UVyiu55W4lPj1s2nGrEjmvijlQNzCE/PLT+MsvgOUuJK2dP+YK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994953; c=relaxed/simple;
	bh=Yxe6fdLDQ+YkTLjygeZhlSBIy4neMxDMfpqrmyXFXuA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CSxuhiZmfXsVJD3KnpxiooDYdNx4eELqwfChBVyKLVkK2LKC58hI+SaQ7C+++R67Q6/w6RvHOBwvaRLF4dYI9Osxw4nddyz+Iu3JjK1x3q8JY+bm4qGmlTli/wlRufBWotussxfTUnodqMgtPx8AWnHpJZXJWyvgzl3ARiWw1z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bFld5Sv/; arc=fail smtp.client-ip=52.101.201.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bFld5Sv/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg22btjerXV0Cnc7OVmjUSgxMbQ4uEB/gH4McXK2+Gba7FS6NbI9zIcYYBppAXVlle8v8KkuWFgkBGIR4+bqso95CmxZ5zsK1qQhoxYNRQyMBkYhfKwY9VI27gfx1sUzCUp9JBvaVs1IDABmG6m9yQ0OIdzh0vUNomiVasTgIkteJjqhv5zKAs8FdmM8ArqfHm12+aptJFQiBiNJNp9+qDbvzG+JtUOlLfwcl3PxW8DjA2mmWuWLvHSUqUpTvnhYCGCfcgSVKY2GbqkHPMm+Voj2NoFtSgFrs309qiA3AUzKE2bDLlto/mLia0Ugdx9IDak/wfLCzWCF18eYEH3+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IH24Rl0Q8+dFuKEx1ymjJEp3QXeeN9DLPhUKj8pIkEQ=;
 b=L6iG0I4WrSAl5MxISpPSdo7D8reOjpSs5b1AwisqnmJFGpQDbbAKSS5zM72Npc9LB/go/QM5Aw0q0YbiJWn/trAxIEF+011/8MoU67ckgyX2PsdUOZOI4g1CJvj0FgltFZQaKVy2+OERDJ/ynIVPqWtg8JBV5NmMBClWIpG/R3170Lfmas9aBGDQAFHaS7QSg0XmzeQhtkB1iRCxNX4xUJ+pRraM8q7sqsoYPjQwLOaKgP+bg5PK0pAraOpKUCDNL2p9J/Cp4LC1ru9bkzEjehEN4XK04OG54BGXvgVn87uyb9fJP7fpYpY8LJ5B7OuqcD99zQV2CX9qgzHcxAiXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IH24Rl0Q8+dFuKEx1ymjJEp3QXeeN9DLPhUKj8pIkEQ=;
 b=bFld5Sv/46Ug9XAgzlxaa7smoVSJZdHsCNJB1MpTmwjtwONS/WivmJ1++ySdFfP8o9fMd6j7v0E8xKRXThUym/+1po0oPSd2GBzw/FILuc+uLUia/YqT0skNFddKfU9FhhFgbcQGqQm7QOQDGNTzqfSves6eH/pZ/KPcVWyPxcg=
Received: from SJ0PR03CA0187.namprd03.prod.outlook.com (2603:10b6:a03:2ef::12)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 01:42:20 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f4) by SJ0PR03CA0187.outlook.office365.com
 (2603:10b6:a03:2ef::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Fri,
 24 Apr 2026 01:42:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:19 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:09 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<seanjc@google.com>, <pawan.kumar.gupta@linux.intel.com>, <nikunj@amd.com>,
	<yazen.ghannam@amd.com>, <peterz@infradead.org>, <chang.seok.bae@intel.com>,
	<kim.phillips@amd.com>, <thomas.lendacky@amd.com>, <naveen@kernel.org>,
	<elena.reshetova@intel.com>, <xin@zytor.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>,
	<peternewman@google.com>
Subject: [PATCH v2 3/8] x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
Date: Fri, 24 Apr 2026 01:41:33 +0000
Message-ID: <a2a06bd290e68f902be9e7cc3ad35f0a2211b950.1776980182.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776980182.git.babu.moger@amd.com>
References: <cover.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|PH8PR12MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 778bb074-4134-4b00-4b7f-08dea1a2b962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|36860700016|7416014|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	D8Hx63AnvrePTL/gkerWIvwDBTSV2p/bXGalBa4HmP9R7zkoqI8zcii2VtGUJL1X2Dtdz489hxA3jhqysRh25CROwnMFIAQmiE7yc8OpuF4Qnc0By4FcDG6qZj8jo5jSIF9zkIYdPhxBLoU9MYIcTpY2JP3nUBxFr2gfkhElGftIIr266OeVco88BH+6NL0wOrkk729sRNf44t3Q/TLIibtL75r1qroxvOw+wVK4AgJXlK8UvNJXDVCE6YzB0wXm776ciE4gVNg/zKgQjp/5qiHeokuGYT6AHComD+7wKzDYX7s+Foe9Ll9LKcJMdLczmMY8MLEVosl0DNv32OM6LhpVn5J3ypNgSRMQqwiEW9v2AlMkJHkLlldpm2MCPE6DmXS6/xE8laK1z/3CI9eYLH88PbfzLHblULHtwsy32msl08RYS9FNrpElOnKNM3XyEhJVnOdTLOkR4y0IrGPJTmCEB6tbC7+cg6gMQ+kwN2J6VQbQzF06cZM48EZjvfXxTy/3pV8AqMc40Thz2MOMmJ4fk+glTMiHZaAMCPgA2EEG6WWCqVU0XLIxxpyRTiPnzY/e5UA+c2k62rXmQ/49amOX7qZ8pS+GmKwmTJPJaseB31Sq9qSQXyqccKT4O+LaQYWKDf8lgbtSCjVBkpk2PwdqpWJfkjQ9BoVHdpzH2hS7o8lWJ3m0DAu5SNFExA0uLTnsrQdjFWsuceAAr37QfAp2y2fOFhe7GTx3Es90CEkBVYbyMCKxaUs95SoLXhpRD7FtoCZ5gsIFpt7BqdJXHA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bzR/Vmgf+kkZAffWnEG4IlACGqkmZXI0vRVWkwIUeTl1hs/8daK7Y9fVyZ04+j9YnNBkdJ/ixpvcEQgAPvzAIIc3/QCwE+pwiRbbUtLnNlMw54kM95Qk/AZ6bcPwQFQgDeKXi3sfkdptIc1tng+W91fKuyk7kicXT9Z++Nvvn25bCwxydh3weXYtRcsa9yrHIAUrxzAb8hhNLYlZ9UEMNzmVaBCC/CKPLogL13LiKOfkaJxvphI5SP4+m9jJTyfUNwR99YDyVHRsiPhyR+L5IvzW0eHxYZzGiyRuIw5d+64AUY/TW7uphG05jTQ7AlD03SUFgpIPfxkFUtqkTj6S//B8vlURqzWC1ziyF+BwnMcBu+tJqj9m04Z6ObcZ9aayzSMPSmioK9liltc/Rp3dpZK73B5fw5hno3rFptKB1W2BCJjfb5Je4i7ZHHvDoS6p
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:19.8854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778bb074-4134-4b00-4b7f-08dea1a2b962
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325

AMD Global Memory Bandwidth Allocation (GMBA) uses the new
RESCTRL_NPS_NODE ctrl_scope. On these CPUs the control MSRs are
implemented per L3 complex, so a single resctrl control domain can span
several L3s and every L3 in the domain must have its MSRs programmed.

For non-NPS scopes this is already handled: resctrl_arch_update_domains()
and resctrl_arch_reset_all_ctrls() use smp_call_function_any() on the
domain CPU mask, which is sufficient because one CPU per domain is enough
to program the MSRs. That is not sufficient for RESCTRL_NPS_NODE, where
rdt_ctrl_update() must run on one CPU per distinct L3 within the domain.

Add two helpers in ctrlmondata.c:

  - resctrl_get_l3_mask() builds a cpumask containing exactly one CPU per
    unique L3 cacheinfo id observed in the domain mask.

  - resctrl_arch_update_nps() allocates the scratch masks, calls
    resctrl_get_l3_mask() and issues rdt_ctrl_update() via
    smp_call_function_many() on the per-L3 mask. If the scratch cpumask
    or L3-id bitmap allocation fails, or the per-L3 mask ends up empty,
    it falls back to smp_call_function_many() on the full domain mask.
    This is conservative (more IPIs than strictly needed) but guarantees
    every L3 in the domain is covered.

Route resctrl_arch_update_domains() and resctrl_arch_reset_all_ctrls()
through resctrl_arch_update_nps() when ctrl_scope == RESCTRL_NPS_NODE,
and keep the existing smp_call_function_any() path for every other
scope. Existing L3/MBA/SMBA resources therefore see no functional
change.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: New patch to handle NPS-scoped MSR Update.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 90 ++++++++++++++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h    |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 15 +++-
 3 files changed, 100 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index b20e705606b8..afa6e78ca61b 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -41,6 +41,86 @@ int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	return 0;
 }
 
+/**
+ * resctrl_get_l3_mask() - One CPU per distinct L3 within a resctrl domain
+ * @domain_mask: Full domain CPU mask (typically &d->hdr.cpu_mask).
+ * @l3_mask:	 Output mask. Cleared on entry, then populated with exactly
+ *		 one CPU per unique L3 cacheinfo id observed in @domain_mask.
+ *		 Always a subset of @domain_mask; may end up empty if no CPU
+ *		 in @domain_mask has a valid L3 id.
+ *
+ * For %RESCTRL_NPS_NODE controls (e.g. AMD GMBA) the control MSRs are
+ * instantiated per L3 complex, so a single IPI per resctrl domain is not
+ * sufficient. Callers are expected to run rdt_ctrl_update() on each CPU in
+ * @l3_mask to cover every L3 that participates in the domain
+ * (see resctrl_arch_update_nps()).
+ *
+ * Return: @l3_mask on success, %NULL if the scratch L3-id bitmap could not
+ *	   be allocated (in which case @l3_mask is left cleared).
+ */
+static struct cpumask *resctrl_get_l3_mask(const struct cpumask *domain_mask,
+					   struct cpumask *l3_mask)
+{
+	unsigned long *l3_dom_id;
+	int cpu, id;
+
+	cpumask_clear(l3_mask);
+	l3_dom_id = bitmap_zalloc(nr_cpu_ids, GFP_KERNEL);
+	if (!l3_dom_id)
+		return NULL;
+
+	for_each_cpu(cpu, domain_mask) {
+		id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
+		if (id < 0 || id >= nr_cpu_ids)
+			continue;
+		if (test_bit(id, l3_dom_id))
+			continue;
+		set_bit(id, l3_dom_id);
+		cpumask_set_cpu(cpu, l3_mask);
+	}
+
+	bitmap_free(l3_dom_id);
+	return l3_mask;
+}
+
+/**
+ * resctrl_arch_update_nps() - Apply staged ctrl MSRs for NPS-scoped resources
+ * @mp:	Parameters describing the MSR index range, resource and domain
+ *	passed through to rdt_ctrl_update().
+ * @d:	Control domain whose CPUs must see the MSR update.
+ *
+ * %RESCTRL_NPS_NODE resources program control MSRs per L3 complex, so one
+ * IPI per resctrl domain is not enough when the domain spans multiple L3s.
+ * Build a per-L3 representative mask with resctrl_get_l3_mask() and issue
+ * rdt_ctrl_update() via smp_call_function_many() on that mask.
+ *
+ * If the temporary cpumask or the scratch L3-id bitmap cannot be allocated,
+ * or the resulting per-L3 mask is empty, fall back to invoking
+ * smp_call_function_many() on the full domain CPU mask. This is
+ * conservative (more IPIs than strictly needed) but guarantees every L3 in
+ * the domain is covered.
+ */
+void resctrl_arch_update_nps(struct msr_param *mp, struct rdt_ctrl_domain *d)
+{
+	const struct cpumask *mask = &d->hdr.cpu_mask;
+	struct cpumask *new_mask;
+	cpumask_var_t l3_mask;
+	bool l3_alloc;
+
+	l3_alloc = zalloc_cpumask_var(&l3_mask, GFP_KERNEL);
+	if (l3_alloc) {
+		new_mask = resctrl_get_l3_mask(&d->hdr.cpu_mask, l3_mask);
+
+		if (new_mask && !cpumask_empty(new_mask))
+			mask = new_mask;
+	}
+
+	smp_call_function_many(mask, rdt_ctrl_update, mp, 1);
+
+	if (l3_alloc)
+		free_cpumask_var(l3_mask);
+}
+
 int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 {
 	struct resctrl_staged_config *cfg;
@@ -76,8 +156,14 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
 				msr_param.high = max(msr_param.high, idx + 1);
 			}
 		}
-		if (msr_param.res)
-			smp_call_function_any(&d->hdr.cpu_mask, rdt_ctrl_update, &msr_param, 1);
+
+		if (msr_param.res) {
+			if (msr_param.res->ctrl_scope == RESCTRL_NPS_NODE)
+				resctrl_arch_update_nps(&msr_param, d);
+			else
+				smp_call_function_any(&d->hdr.cpu_mask,
+						      rdt_ctrl_update, &msr_param, 1);
+		}
 	}
 
 	return 0;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index e3cfa0c10e92..902b98ce713d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -223,6 +223,7 @@ union l3_qos_abmc_cfg {
 };
 
 void rdt_ctrl_update(void *arg);
+void resctrl_arch_update_nps(struct msr_param *mp, struct rdt_ctrl_domain *d);
 
 int rdt_get_l3_mon_config(struct rdt_resource *r);
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 885026468440..e29ab06cbe70 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -245,9 +245,12 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 	msr_param.high = hw_res->num_closid;
 
 	/*
-	 * Disable resource control for this resource by setting all
-	 * CBMs in all ctrl_domains to the maximum mask value. Pick one CPU
-	 * from each domain to update the MSRs below.
+	 * Disable resource control for this resource by setting all CBMs in
+	 * all ctrl_domains to the maximum mask value. For non-NPS scopes pick
+	 * one CPU from each domain to update the MSRs below; for
+	 * %RESCTRL_NPS_NODE the MSRs are per-L3, so defer to
+	 * resctrl_arch_update_nps() which issues the update on one CPU per
+	 * distinct L3 in the domain.
 	 */
 	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
 		hw_dom = resctrl_to_arch_ctrl_dom(d);
@@ -255,7 +258,11 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resource *r)
 		for (i = 0; i < hw_res->num_closid; i++)
 			hw_dom->ctrl_val[i] = resctrl_get_default_ctrl(r);
 		msr_param.dom = d;
-		smp_call_function_any(&d->hdr.cpu_mask, rdt_ctrl_update, &msr_param, 1);
+		if (msr_param.res->ctrl_scope == RESCTRL_NPS_NODE)
+			resctrl_arch_update_nps(&msr_param, d);
+		else
+			smp_call_function_any(&d->hdr.cpu_mask, rdt_ctrl_update,
+					      &msr_param, 1);
 	}
 
 	return;
-- 
2.43.0

