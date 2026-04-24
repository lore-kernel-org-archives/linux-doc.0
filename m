Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010022.outbound.protection.outlook.com [52.101.46.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0512620DE;
	Fri, 24 Apr 2026 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994985; cv=fail; b=Arkan2qkYAsK2djT4MpDRSAaWxlpDJTStzbcn0YJqbH+cDnc7AdGxkQzP1AZ56gGpSoT4RJQAbqHgs74ZOk/Tacq8f1MSC+AvMgdkh0IAaJRKTAFuFLlH2lxjBnfW59QjT3FEuij5xRshmcW9EaL/uT5Pyx4DmRAQGrJ40yhQNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994985; c=relaxed/simple;
	bh=2h06wYPw/v4g54WXbe0ZsdfH+DVcX31+DwM9Awza4lg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aH7WpwZ/dJt5SmHyAAPA25dTL+QbjAt89cxaR5f0XHbD902jqDlSdqDrrgOHYRemCTA/XyEgvfuMBLKDPi08yLlJIFFdMVQNZ8MkQjM5+gPrzpA4UcKlaXocRG4NGrj+I4x/m3lJ/Q98so3djmSuqRQ8eJyecGtKaYw6OHT7UHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zc6uTUD6; arc=fail smtp.client-ip=52.101.46.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zc6uTUD6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vn44OCfMEl9yNUsX9HlA+86pZwNdXT6vdj9fy+mux35KP59PYciUBBXU+29AWnx7D0/rWX3gAvJkG6EvuN93Il4oaxTGiouohK76oazVYWMweEUQ1gI2TLcQCow0KXJ2p0DLhz4NZMcnylpug7dvTk8tKQoSlEks7bH2vq1YQ9fmbTmvPkj76zKOU9+ehEIgaPJALnCiUnejIyVcAbPD/C1Xey4PAHuwJJl7qiPfa1EJau/sBkFE4yXyYuiS0CMnQUK4tovvm1fIyBbiTOLPTEFGlmiwyrh257E7KIV3bVQllYV3Gy3TUkRfd5OQjXvoGaxWinC8dLrmJYcI/8xpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2AA2WKk2ygBR8ak7M/3W2KwF9JzFYvjLfxVuNQviao=;
 b=W3bOag4Hn40TE429ke4t98mveJ/v+85K35WIEK8pUVt4iamF5ct4KUBk/Q7VJd+Yp22genJf7zOW0pKKqCmOuKdZsgKAre1r245nmF7CT/QnxOPSfYXZgAYxFn8H1IHbV4ypLiTNorfUmCX44TpHcPHwj7b8/jAXcpD+7TlXT9ZakKTpPd64brkqbkPFyz+CgNEBDdmCTztgklTe3WiPAyk+87AbBfJXkImSegRvySVgHhmuSaUqUqHNk7J/hwIRAXSWbtiL6TUFqpir+FoA4SgE5z3vLmu/pKNjlux2inHZwhBr0FjVVK87r6aEfY8fBS86KfF9+TZt+z2CqltZ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2AA2WKk2ygBR8ak7M/3W2KwF9JzFYvjLfxVuNQviao=;
 b=zc6uTUD6aYKR4uVTg3qGzHKlDnGCNUvrPUzkGQKCeCTq7DigR7iBj6An96g7OPhTB38U0ylNEg0E4TciR0xxFv25xRTzqcoaBVwJbhgQgaEHWufAcibW5vklEF7MdGU11r0enGgjgZvGvCeuuWr9qbGKbSvrrc6axe3p2JlYEg4=
Received: from MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23)
 by IA4PR12MB9763.namprd12.prod.outlook.com (2603:10b6:208:55a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:42:54 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::cf) by MW4PR04CA0078.outlook.office365.com
 (2603:10b6:303:6b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Fri,
 24 Apr 2026 01:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:52 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:43 -0500
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
Subject: [PATCH v2 7/8] x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth Allocation
Date: Fri, 24 Apr 2026 01:41:37 +0000
Message-ID: <f77bf89eb5f8765b7d01d05a1ea7bd4e299fdf12.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|IA4PR12MB9763:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec04213-3559-41a4-8dad-08dea1a2cd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|22082099003|18002099003|56012099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	QVej2HrbHD+3QNjUPQSMLuSuSIVPHtZQcNc0pHtGl5zvvyhuO+/iAW1oe7Krvs1p4vMbgST1IwE8ca/ut9/uaJRIIZJ2H3YLMEgFLxdREtzFInGbbX30s12pJ4H/2KsT+Nn8ng8Qk4/LPye8rbV39BlIJk5mFFJcN9IJXK4OkLTvJ8FJVIqVIMOOISY7eMvRk+x6nUSvOPzUSrTSpG9TTgNrJOrWSJMjI+kgEkCNVdSuIsgZFzFtQD9dVo3i7Mpz2S6G54iBymEnR19gYHoSW6BORA/ZbG/o2CqOPcO5FJVUSscwiqao0btfY688UsX2yaIoOVVB1hIG68qHQXNMmsjC6An/lPosNBcrUTxVr5nCYg+CMTegPa/k51LBLOxNsiAYDlHW2d38dSyVRPJNdJi6mjxRc2Pi9Iu87fIJYZgqjZsxrcAF4RVUMLDkgO+kWAdS/Pon/t1g86GfUFvGubHXTjsQBSlw6x75wC4azBeatk0PX+KJKWmN4xzu4ArGsYQpBrAvwf6CfUAPwCvm40MlTE8bWf9agTqPnDPdurb2iHRyBurSQnKZ64ZL65s/HQnSOMWtIGNOyM8HbBndIT8sKd0GK+o7L3DTELjmN8xxuFvK9CVl9OacXdMo5jEezCTctg+4g4AIjyISEobT0nnWTeclicJ0BvSFGmdZzg2Ph8CvelRHVJdIQwSoufCN7n+/4Sz9wQlWPL9IS9XZ1/x6Cl7nFeVTWCYKg/FrOYreYEeWHYOQ1HkuKU0X2pe9Fh3Ox+GJaMcPCD/+B9ISVw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(22082099003)(18002099003)(56012099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aoFrZWL3OUVXkMNScGLZ76lLv/zzo5WDkqNfO4XYdoHshjR2nxA7FcpeFU2c0mciaZ4SdYSorvNWomOrHFayyX4iHTbrMQmFPGSPHKNfIvk+3wexxFIXvZ5QjBzeY6QIYzviSqtN9SbU6FUz6r7N5ZZ4VY8sa8jy+0s7OaYVMVcnt4uh2M43KrusTkV+c4B4vy56yNNaJ/YGUnybv2KpiwE3EVw90DrybQN+M/rHACUhnqZN9cV+jcHHFSgRO3hdIh1k6kAj+DKlhexvY5X2NbLtKkzcUGNFsVpKjxImVZO4lx/QPE0VB+vhIVYke2VskRGS6/Hj1k9m0LKDIvNJFYD0RRyeXbC87JSit+/rI7euz+Yo15jH554M+dY7h0kWeEj8/aqomT+I27cWhlbLw5PUgQ/+e2j6d99w9cyGnmh3pO5Fm2qOHBRYC6L4ow3H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:52.9939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec04213-3559-41a4-8dad-08dea1a2cd16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9763

AMD PQoS Global Slow Memory Bandwidth Enforcement (GLSBE) lets software
specify slow-memory (CXL.memory) bandwidth limits for groups of threads
inside a GLBE control domain. A GLBE control domain is a set of QoS (L3)
domains that are grouped together for global bandwidth allocation; GLSBE
reuses those same control domains.

Add the resource definition for GLSBE in the resctrl filesystem so
administrators can configure and manage slow-memory bandwidth at GLSBE
control domain granularity:

The GLSBE control domain is aligned to the system's NPS (Nodes Per Socket)
configuration. Because RDT_RESOURCE_GSMBA uses the RESCTRL_NPS_NODE scope,
updates routed through resctrl_arch_update_domains() already flow into
resctrl_arch_update_nps(), which programs MSR_IA32_GSMBA_BW_BASE on one CPU
per L3 within the domain.

The schemata identifier is named GSMBA (Global Slow Memory Bandwidth
Allocation) to mirror SMBA; the architecturally documented name GLSBE is
used only in CPUID references.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Rewrite commit log to describe GSMBA and NPS scope.
---
 arch/x86/include/asm/msr-index.h   |  1 +
 arch/x86/kernel/cpu/resctrl/core.c | 31 ++++++++++++++++++++++++++++++
 fs/resctrl/ctrlmondata.c           |  4 ++--
 fs/resctrl/rdtgroup.c              | 16 +++++++++++----
 include/linux/resctrl.h            |  1 +
 5 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index f3ff11ca03f2..83e042caa080 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1294,6 +1294,7 @@
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 #define MSR_IA32_GMBA_BW_BASE		0xc0000600
+#define MSR_IA32_GSMBA_BW_BASE		0xc0000680
 
 /* AMD-V MSRs */
 #define MSR_VM_CR                       0xc0010114
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 667ff3eb57f5..9a78a59f1929 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -109,6 +109,15 @@ struct rdt_hw_resource rdt_resources_all[RDT_NUM_RESOURCES] = {
 			.schema_fmt		= RESCTRL_SCHEMA_RANGE,
 		},
 	},
+	[RDT_RESOURCE_GSMBA] =
+	{
+		.r_resctrl = {
+			.name			= "GSMBA",
+			.ctrl_scope		= RESCTRL_NPS_NODE,
+			.ctrl_domains		= ctrl_domain_init(RDT_RESOURCE_GSMBA),
+			.schema_fmt		= RESCTRL_SCHEMA_RANGE,
+		},
+	},
 	[RDT_RESOURCE_PERF_PKG] =
 	{
 		.r_resctrl = {
@@ -261,6 +270,9 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	case RDT_RESOURCE_GMBA:
 		subleaf = 7;
 		break;
+	case RDT_RESOURCE_GSMBA:
+		subleaf = 8;
+		break;
 	default:
 		return false;
 	}
@@ -979,6 +991,19 @@ static __init bool get_slow_mem_config(void)
 	return false;
 }
 
+static __init bool get_gslow_mem_config(void)
+{
+	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_GSMBA];
+
+	if (!rdt_cpu_has(X86_FEATURE_GSMBA))
+		return false;
+
+	if (boot_cpu_data.x86_vendor == X86_VENDOR_AMD)
+		return __rdt_get_mem_config_amd(&hw_res->r_resctrl);
+
+	return false;
+}
+
 static __init bool get_rdt_alloc_resources(void)
 {
 	struct rdt_resource *r;
@@ -1017,6 +1042,9 @@ static __init bool get_rdt_alloc_resources(void)
 	if (get_slow_mem_config())
 		ret = true;
 
+	if (get_gslow_mem_config())
+		ret = true;
+
 	return ret;
 }
 
@@ -1120,6 +1148,9 @@ static __init void rdt_init_res_defs_amd(void)
 		} else if (r->rid == RDT_RESOURCE_SMBA) {
 			hw_res->msr_base = MSR_IA32_SMBA_BW_BASE;
 			hw_res->msr_update = mba_wrmsr_amd;
+		} else if (r->rid == RDT_RESOURCE_GSMBA) {
+			hw_res->msr_base = MSR_IA32_GSMBA_BW_BASE;
+			hw_res->msr_update = mba_wrmsr_amd;
 		}
 	}
 }
diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 22bbc5fa520d..217055aaf5c7 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -247,8 +247,8 @@ static int parse_line(char *line, struct resctrl_schema *s,
 
 	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP &&
 	    (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_GMBA ||
-	     r->rid == RDT_RESOURCE_SMBA)) {
-		rdt_last_cmd_puts("Cannot pseudo-lock MBA/SMBA/GMBA resource\n");
+	     r->rid == RDT_RESOURCE_SMBA || r->rid == RDT_RESOURCE_GSMBA)) {
+		rdt_last_cmd_puts("Cannot pseudo-lock MBA/SMBA/GMBA/GSMBA resource\n");
 		return -EINVAL;
 	}
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc14c04314fe..761cc9cff4db 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1413,7 +1413,7 @@ static bool rdtgroup_mode_test_exclusive(struct rdtgroup *rdtgrp)
 	list_for_each_entry(s, &resctrl_schema_all, list) {
 		r = s->res;
 		if (r->rid == RDT_RESOURCE_MBA || r->rid == RDT_RESOURCE_GMBA ||
-		    r->rid == RDT_RESOURCE_SMBA)
+		    r->rid == RDT_RESOURCE_SMBA || r->rid == RDT_RESOURCE_GSMBA)
 			continue;
 		has_cache = true;
 		list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
@@ -1619,7 +1619,8 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 								       type);
 				if (r->rid == RDT_RESOURCE_MBA ||
 				    r->rid == RDT_RESOURCE_GMBA ||
-				    r->rid == RDT_RESOURCE_SMBA)
+				    r->rid == RDT_RESOURCE_SMBA ||
+				    r->rid == RDT_RESOURCE_GSMBA)
 					size = ctrl;
 				else
 					size = rdtgroup_cbm_to_size(r, d, ctrl);
@@ -2172,7 +2173,7 @@ static struct rftype *rdtgroup_get_rftype_by_name(const char *name)
 static void thread_throttle_mode_init(void)
 {
 	enum membw_throttle_mode throttle_mode = THREAD_THROTTLE_UNDEFINED;
-	struct rdt_resource *r_mba, *r_gmba, *r_smba;
+	struct rdt_resource *r_mba, *r_gmba, *r_smba, *r_gsmba;
 
 	r_mba = resctrl_arch_get_resource(RDT_RESOURCE_MBA);
 	if (r_mba->alloc_capable &&
@@ -2189,6 +2190,11 @@ static void thread_throttle_mode_init(void)
 	    r_smba->membw.throttle_mode != THREAD_THROTTLE_UNDEFINED)
 		throttle_mode = r_smba->membw.throttle_mode;
 
+	r_gsmba = resctrl_arch_get_resource(RDT_RESOURCE_GSMBA);
+	if (r_gsmba->alloc_capable &&
+	    r_gsmba->membw.throttle_mode != THREAD_THROTTLE_UNDEFINED)
+		throttle_mode = r_gsmba->membw.throttle_mode;
+
 	if (throttle_mode == THREAD_THROTTLE_UNDEFINED)
 		return;
 
@@ -2405,6 +2411,7 @@ static unsigned long fflags_from_resource(struct rdt_resource *r)
 	case RDT_RESOURCE_MBA:
 	case RDT_RESOURCE_GMBA:
 	case RDT_RESOURCE_SMBA:
+	case RDT_RESOURCE_GSMBA:
 		return RFTYPE_RES_MB;
 	case RDT_RESOURCE_PERF_PKG:
 		return RFTYPE_RES_PERF_PKG;
@@ -3658,7 +3665,8 @@ static int rdtgroup_init_alloc(struct rdtgroup *rdtgrp)
 		r = s->res;
 		if (r->rid == RDT_RESOURCE_MBA ||
 		    r->rid == RDT_RESOURCE_GMBA ||
-		    r->rid == RDT_RESOURCE_SMBA) {
+		    r->rid == RDT_RESOURCE_SMBA ||
+		    r->rid == RDT_RESOURCE_GSMBA) {
 			rdtgroup_init_mba(r, rdtgrp->closid);
 			if (is_mba_sc(r))
 				continue;
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index ed09ed2e0477..cd374f0d31db 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -54,6 +54,7 @@ enum resctrl_res_level {
 	RDT_RESOURCE_MBA,
 	RDT_RESOURCE_GMBA,
 	RDT_RESOURCE_SMBA,
+	RDT_RESOURCE_GSMBA,
 	RDT_RESOURCE_PERF_PKG,
 
 	/* Must be the last */
-- 
2.43.0

