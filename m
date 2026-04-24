Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B583F274B58;
	Fri, 24 Apr 2026 01:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994957; cv=fail; b=isSdMZpWjRYDyMset9OUbiXWSIp7/75JQ5emn+XdjXzts2CqO6apJRx0cEGV89wh/jFhZuGLnrUYeJA8ZFN5jhcvoXflQQSXkKqzzvb/cRxhYYHi8qnxqHnLvkFR6zyExEJbKd8eXlxoHj74iheYvNYHAa9jUbUWOsUQuXaAytE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994957; c=relaxed/simple;
	bh=ruWC6Pn4qgEAB94ZEmsi/kK3xrYQz5XXJ8iyI6XPe+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IFGwqdwluCxTe0jGZcu1S6zKTQwHMpgCnth3Empd2MW9kn6OHQK+WNpb5wH2AMO6DdnPzvkhBEXRcaEM/xWvuhF/+5mWmm9/eWhwOJY4H5q7UpkyCN28IzVfjYdhLppDY2rWSFLIez5DVVmaV7ozdZzlgm0owmXxb7aWuxjJHnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cS7UXTV2; arc=fail smtp.client-ip=52.101.53.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cS7UXTV2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b11ULlSaouqOW7sO9wmFA0NsVDpRqamWvYHIUPrYcGXO42N/cbXAxxlzzeCgCjvn5ejX5jdARQM0Mr6N7UbVxUkmHSPpGCYRD/DnLtLJxOO/n3ATVIjCXbQvTcSFjGRalzmistu872ff6HCRhKWXINu+o8hZWYrkuyFHiBT/y6O8gA7VwaW4C+mLMagHE0uKCC78BPvfb0iHW9OLtaoFOPSmBjgG2vKDF6mqFy1X9RYBsHVMLt0Wuzio5JJz7jFbaZYs3tOiYTXWvFiRj2sEXTXodgfW/guc4BwBqAk/25Gs6q7iPt5g4vKl5bGQMDWOi1Vd6CjROQ/q1W/2RLQSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejvnQvDIpTuYVyMCiPsMzXppBNr8B9F0wfQQjMGE2Ls=;
 b=a3P1TjtxUKoFIVy6Akl5HHswm9T0AQ5Q1vJiQGcLCNKslA7fnAzbm9gG12aJeQlb7npHjQZbxyfTdKVtM/b/ms8/QVQH/Gdtf3N9vG88oBna2aUBI2Sr5RJ2QGb6SS/vminwZCNWz/VTDJZVEkOeDSARsfN1xrWe0CPMC5WzfD0ejCpX42ePJUoqrgU7gWp9bNreuv1W1buy0ySESGr+uxNNDSuB+3HwoJ5aACAWCD/Cg5E3hbv1quP97InSHVp9LYYgOjeRg81021pWIR0s6Qvr30bRNaTXN0UxSMwQ7FIXbXe6vxWDp/q0MfKKZx+a9THk9SMuE5FOV+9ExHZrqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejvnQvDIpTuYVyMCiPsMzXppBNr8B9F0wfQQjMGE2Ls=;
 b=cS7UXTV2FWbaPYX1vLafcGfSKmSZ+2T9GY+GSbKn5Zw8sU+l1Rhf7cVFcb3rj0OD659eW/LxXOE/MO8QcbGO20Y835hjrh597VBZSUUyWHbKZBdjHql+PISmNejbNGuI+dCEP9pWt6OEQG2vqnHeYf0BHxEmvoUqEfgPrfxwtPE=
Received: from BY5PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:1e0::19)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 01:42:22 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::78) by BY5PR03CA0009.outlook.office365.com
 (2603:10b6:a03:1e0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 01:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:21 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:18 -0500
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
Subject: [PATCH v2 4/8] x86,fs/resctrl: Add the resource for Global Bandwidth Allocation
Date: Fri, 24 Apr 2026 01:41:34 +0000
Message-ID: <f311ee8d3727d1a751e8edd32a2a906adf876ca2.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CYYPR12MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a612a9e-de48-460a-4492-08dea1a2ba98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cLkKu7u7EvN3ZCUDl2ez5WSKYLn7prean+F59V6wWaLlYgX8KJPnMmjj++klv874au8cXo/m/+MjN42fWl1c3Gip1EyVTV+5z7zURBBAY4qqTQmEqSLkg861fkP3terFvYoxBQOt/crNfoSmf7kgsxbKGoLzlUNYPXl4R51QUPdUE8o6z068yVcFYPHnznq0feDcdAriVfwtjsMYTx8Brw8c0DtSQXICXEf1+NVsuLsMqUW2JIsAD8gdAQimIDreEprw+wuSj3E4Ukwfx2leV7lPz56aFxBrZUlmdwTE8vdZDye0WY71zga6UmjOMxOP6bkO5zlI+DlRL+apSeds4NXqbsxDTCBb50Uqd+kDMSHvMN4V1HBFHzeEOjqwNIENa0GlB8GE2Noajqpxwqu45zfK2mQmxZ8bQB8nOJfLP0U/279cxsmKKoD0wCAPjYc21RlhdaVejXTOCLjfqfeI34Q1qT3OLspcUy1EUzyXytRGYWvWX/5cG7Htg7ECHjclrIt0BwcDpnybUwl1AQ9Q+1YhBgWJPvZRt5ymlXMv12+XHsf0sme69oIpcL+LXoBqozMgVSJgCgBWinimeZZ9mDlOT2RukiBoNkLa8eFA8lhiVPv1uWBrhawGmpByuZcKcD6u5PLsq3RyKv05R8/lNPTCrZICGTinBf2pDoCd7ay1ROMgpOHcTDfb8ruUK0sisbeVo13c3gYwaBd6+yUJb28D9noFxgQ029hIrfCgPbxu5LzungB3ysOreOJHH7uRYekXE+ifQdICyVf63oYlfA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xec72y3LwAARFJ0+NTd5+VLfqcRzhgojpeBlXg8fRavzt09asUq/eMwoMX5kiawPnFFE5y9smt4qeCA1BUcN3snjeKihFRo95PshcKaWfz07/pwZ9ERuCL+x/0LDjxZQCji3x5LhoYw78c1Ew1wk12V+tSTRxKb8SqiwEpbQ29pNQ/6FkTr0JDjzwI1GINvrL3LrWJrSqaPCfRpJHTRB2asDqeZ1ZJ9Q5vs95MsyeItobpAQpO6nPdzSEUPta5bFNtRmf2yNhFs/zVen/MovWmGshqTfOfF+jrGIU6nQknlvBk3ggSeDL2N7zSOb7LYHyrfP4xs8QpxTiYhOs6IreFAEKgeFn3stjPnHf9xMW9L7iStCzmniNA6D9npA4WzoqgMFK5HYzpNi3o85ONbmGWB/zV0BI5gKX94nWKyZMal4Japc4xCwqP05Iyk/dBTu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:21.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a612a9e-de48-460a-4492-08dea1a2ba98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961

AMD PQoS Global Bandwidth Enforcement (GLBE) feature provides a mechanism
for software to specify bandwidth limits for groups of threads inside a
GLBE control domain. GLBE control domain is a set of participating QoS
domains that are grouped together for global bandwidth allocation.

Add the resource definition for GLBE in resctrl filesystem. Resource allows
users to configure and manage the global memory bandwidth allocation
settings for GLBE control domain. GLBE control domain is a set of
participating QoS domains that are grouped together for global bandwidth
allocation.

By default the GLBE control domain is aligned to system NPS (Nodes Per
Socket) configuration. However, MSR_IA32_GMBA_BW_BASE must be programmed
in L3 domains.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Updated the change log about NPS scope.
---
 arch/x86/include/asm/msr-index.h   |  1 +
 arch/x86/kernel/cpu/resctrl/core.c | 46 ++++++++++++++++++++++++++++--
 fs/resctrl/ctrlmondata.c           |  5 ++--
 fs/resctrl/rdtgroup.c              | 13 +++++++--
 include/linux/resctrl.h            |  1 +
 5 files changed, 59 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index a14a0f43e04a..f3ff11ca03f2 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1293,6 +1293,7 @@
 #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
+#define MSR_IA32_GMBA_BW_BASE		0xc0000600
 
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 0f58f5e3b853..22114ff84bfa 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -91,6 +91,15 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.schema_fmt		= RESCTRL_SCHEMA_RANGE,
 		},
 	},
+	[RDT_RESOURCE_GMBA] =
+	{
+		.r_resctrl = {
+			.name			= "GMB",
+			.ctrl_scope		= RESCTRL_NPS_NODE,
+			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_GMBA),
+			.schema_fmt		= RESCTRL_SCHEMA_RANGE,
+		},
+	},
 	[RDT_RESOURCE_SMBA] =
 	{
 		.r_resctrl = {
@@ -239,10 +248,22 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	u32 eax, ebx, ecx, edx, subleaf;
 
 	/*
-	 * Query CPUID_Fn80000020_EDX_x01 for MBA and
-	 * CPUID_Fn80000020_EDX_x02 for SMBA
+	 * Query CPUID function 0x80000020 to obtain num_closid and max_bw values.
+	 * Use subleaf 1 for MBA, subleaf 2 for SMBA, and subleaf 7 for GMBA.
 	 */
-	subleaf = (r->rid == RDT_RESOURCE_SMBA) ? 2 :  1;
+	switch (r->rid) {
+	case RDT_RESOURCE_MBA:
+		subleaf = 1;
+		break;
+	case RDT_RESOURCE_SMBA:
+		subleaf = 2;
+		break;
+	case RDT_RESOURCE_GMBA:
+		subleaf = 7;
+		break;
+	default:
+		return false;
+	}
 
 	cpuid_count(0x80000020, subleaf, &eax, &ebx, &ecx, &edx);
 	hw_res->num_closid = edx + 1;
@@ -930,6 +951,19 @@ static __init bool get_mem_config(void)
 	return false;
 }
 
+static __init bool get_gmem_config(void)
+{
+	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_GMBA];
+
+	if (!rdt_cpu_has(X86_FEATURE_GMBA))
+		return false;
+
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+		return __rdt_get_mem_config_amd(&hw_res->r_resctrl);
+
+	return false;
+}
+
 static __init bool get_slow_mem_config(void)
 {
 	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_SMBA];
@@ -975,6 +1009,9 @@ static __init bool get_rdt_alloc_resources(void)
 	if (get_mem_config())
 		ret = true;
 
+	if (get_gmem_config())
+		ret = true;
+
 	if (get_slow_mem_config())
 		ret = true;
 
@@ -1075,6 +1112,9 @@ static __init void rdt_init_res_defs_amd(void)
 		} else if (r->rid == RDT_RESOURCE_MBA) {
 			hw_res->msr_base = MSR_IA32_MBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
+		} else if (r->rid == RDT_RESOURCE_GMBA) {
+			hw_res->msr_base = MSR_IA32_GMBA_BW_BASE;
+			hw_res->msr_update = mba_wrmsr_amd;
 		} else if (r->rid == RDT_RESOURCE_SMBA) {
 			hw_res->msr_base = MSR_IA32_SMBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 9a7dfc48cb2e..22bbc5fa520d 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -246,8 +246,9 @@ static int parse_line(char *line, struct resctrl_schema *s,
 		return -EINVAL;
 
 	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP &&
-	    (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_SMBA)) {
-		rdt_last_cmd_puts("Cannot pseudo-lock MBA resource\n");
+	    (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_GMBA ||
+	     r->rid == RDT_RESOURCE_SMBA)) {
+		rdt_last_cmd_puts("Cannot pseudo-lock MBA/SMBA/GMBA resource\n");
 		return -EINVAL;
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dfdaa6f9d8f..cc14c04314fe 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1412,7 +1412,8 @@ static bool rdtgroup_mode_test_exclusive(struct rdtgroup *rdtgrp)
 
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
-		if (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_SMBA)
+		if (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_GMBA ||
+		    r->rid == RDT_RESOURCE_SMBA)
 			continue;
 		has_cache = true;
 		list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
@@ -1617,6 +1618,7 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 								       closid,
 								       type);
 				if (r->rid == RDT_RESOURCE_MBA ||
+				    r->rid == RDT_RESOURCE_GMBA ||
 				    r->rid == RDT_RESOURCE_SMBA)
 					size = ctrl;
 				else
@@ -2170,13 +2172,18 @@ static struct rftype *rdtgroup_get_rftype_by_name(const char *name)
 static void thread_throttle_mode_init(void)
 {
 	enum membw_throttle_mode throttle_mode = THREAD_THROTTLE_UNDEFINED;
-	struct rdt_resource *r_mba, *r_smba;
+	struct rdt_resource *r_mba, *r_gmba, *r_smba;
 
 	r_mba = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 	if (r_mba->alloc_capable &&
 	    r_mba->membw.throttle_mode != THREAD_THROTTLE_UNDEFINED)
 		throttle_mode = r_mba->membw.throttle_mode;
 
+	r_gmba = resctrl_arch_get_resource(RDT_RESOURCE_GMBA);
+	if (r_gmba->alloc_capable &&
+	    r_gmba->membw.throttle_mode != THREAD_THROTTLE_UNDEFINED)
+		throttle_mode = r_gmba->membw.throttle_mode;
+
 	r_smba = resctrl_arch_get_resource(RDT_RESOURCE_SMBA);
 	if (r_smba->alloc_capable &&
 	    r_smba->membw.throttle_mode != THREAD_THROTTLE_UNDEFINED)
@@ -2396,6 +2403,7 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	case RDT_RESOURCE_L2:
 		return RFTYPE_RES_CACHE;
 	case RDT_RESOURCE_MBA:
+	case RDT_RESOURCE_GMBA:
 	case RDT_RESOURCE_SMBA:
 		return RFTYPE_RES_MB;
 	case RDT_RESOURCE_PERF_PKG:
@@ -3649,6 +3657,7 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
 		if (r->rid == RDT_RESOURCE_MBA ||
+		    r->rid == RDT_RESOURCE_GMBA ||
 		    r->rid == RDT_RESOURCE_SMBA) {
 			rdtgroup_init_mba(r, rdtgrp->closid);
 			if (is_mba_sc(r))
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 80290ded0b82..ed09ed2e0477 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -52,6 +52,7 @@ enum resctrl_res_level {
 	RDT_RESOURCE_L3,
 	RDT_RESOURCE_L2,
 	RDT_RESOURCE_MBA,
+	RDT_RESOURCE_GMBA,
 	RDT_RESOURCE_SMBA,
 	RDT_RESOURCE_PERF_PKG,
 
-- 
2.43.0

