Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666C1D86FF;
	Fri, 24 Apr 2026 01:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994937; cv=fail; b=bcWdoSObz95wRV+dAryHuti/rMfPLpaYtMsBgokx0ux9IVxPZMZwIpgGx6P7y9IFTqwzDaYFQGtEolChEdw/jILsi0FuzgkOEW2+LYrkwv8+TxNAev/UHNs9BxDtvKSUxEh8AkQYa0xu4jdBeodD7P8yMVvCnTZIGYyjxMFq8hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994937; c=relaxed/simple;
	bh=T+ZiUJoM0+ngOJzV3rbOC5rMFpgL75RpevA+xHQXCro=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W8GtFxw3kxmgbR/plXyTsuKUkhN5Vk9wCNN9cTcfYzeHVRi5rlDKbj3XXvwVOgX+grTSPllUTJI8NzbUjbBWkqvTccg5txyaljX3koxv8xL70ly5wkmRj9zTJ0ThrKHrb7tVXcijJvTIoqjYavAqrCUGbIX1yemRnz+HzLhplRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GaI0FvLj; arc=fail smtp.client-ip=52.101.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GaI0FvLj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLMu7QEtzKYsbtzWjd6UEQqkvOujwB0t/NbkfQftRhlnJzz2oT1nZwghG5niAerxs6EGB9agAYqiNuo3k//tAdfF/vtbiOqRvnXsC/Lezto+xJjR/yqxO48cbVipxqfnRIs6xzvUCkbuwRp1Sg4kWk35+AL89WWksTx/s7fCCzcxJDUm4EtG2wl+fEjlOsqcngKn6DnRa/r9oxLqF2PTNGOG4Bbf/WiA1TAFO9CGu6ypQtYxawcN324Ox8TpObumrCObcPmTytdDhNAsbDEGD0K2F9FiC9ef6YWbG8SCx/byqhJdu2oz3AzwV1hw9cOeWGYUV9Z6ZGfDb3NOpUNEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCPsdeexRSPJ6E7zimW0JYdo9XJ2cRTKKvAyNjFB4Ds=;
 b=PHcO7XVRkFf3/FoPcL1xg/+skSkLxcHEuwkVwmlO4CW1jYapHvGtBtrct9t+ksqMS7OtD+4RhCImIYveGr5m6PX4Lu/nz1sRT4jI/iRWIQcHOQrdxJP4ay6PfYSbngmMzbKW/FPSYZBlXDL2hIfmOXm7tJBGmcsQcXFBFgxeMxyIPXDv6ICrdDjMbjIDdcE8T1EvoWqbcV/P5EgFt+tIDNoX0oWZMnImcvQEQrP1CA/pwizlXfc7gscUu63Gn5Iwdq2N4MFRNB8dQc5qXe6b1dWLpsLYKlLxRIfTLTndvP54vio2RH38dkDnik1PJGvrHKEi73EHgLwYoCZwqchB4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCPsdeexRSPJ6E7zimW0JYdo9XJ2cRTKKvAyNjFB4Ds=;
 b=GaI0FvLjeJGL2aOZfKPIiz/dqQpW9oVrHsoEQUEwyxP6TjzlSqrQ1fCzQQWMHAK7IfCOXK4NfIZscdSAc7tVnyHfdiLYJ/a+ZGhgswqkOwlflKZQH+P5dBEkx64rUMHlu9UCt6aAWwrzLykXgyJZQO2Wcnv3jStalAvsiRYALok=
Received: from SJ0PR03CA0199.namprd03.prod.outlook.com (2603:10b6:a03:2ef::24)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.12; Fri, 24 Apr
 2026 01:42:11 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::77) by SJ0PR03CA0199.outlook.office365.com
 (2603:10b6:a03:2ef::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Fri,
 24 Apr 2026 01:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:09 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:01 -0500
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
Subject: [PATCH v2 2/8] x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
Date: Fri, 24 Apr 2026 01:41:32 +0000
Message-ID: <8f77f498b1c77fa8fd8f5d5687f03ae598068544.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: d394eeea-4742-46b8-d0ac-08dea1a2b34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qsqsg7vUaDqAV+SjUsRRGY1YTzW1hqhOa+vBz74gboLV7mVNZBmivo6lU0G0mjiEGeh5N4g2oQUl1jFMrYDJiVSqMaXqF7LjHgxqdc5G5V11qnDKKIhxTAoojhiIJg9LqXll2rfzbfxG3/42KRyvT7zA/a6FQKTGhePHLPpdcsUTJc1wx3Lv5CMyPHtwRSsjsDNZKMtTXQ5Qk7Q7eDKfPBn5qtBnnkZiU640ZKxwDebdHIWSJY3vSW1Jj3RojhPMAEB8vWMNGbrCiw4+iTCI5oUEfc7MsFQurBTFVaeC6VhQu+20yrsehcy0niTZdVNajrsIS626vbYXa5sqgccxzNb+GWDZFsSSzCf6IcY5EsLoFPbBF8zu+kOe9hZzUWyVEDvSA/8DzC36fQfry31BUSE+6xOUZkmG9Q6FEf2ubY+rhQybREUKolpgQHH9/6fBt6Q7hu0pz8HnV4JGFuNakhT4nohEJbAY79reNnTmp8Hz7oRpXAG5rOSvZoXbbgVAiQRu4V/FZjsORixH6oaHhz7myr8/T6Lr2QvJryDL/tmxW2D8K+Jj/hPmYfucHjkbc2Axa4ojhdVdjIMqNVZGO1f6weGQ7/PXcmeJuvYDSM//MdW8i0j9KZGa0LL0tUgphaxrakFjW4ukLS6n8CHYwqipGDbHz8+RoAKyElwBERJ8kvV+fXYgiLjPTFyqmqa00Od6X8Ex/JVb1ifueYMwyRNzTIsEcJDsJL0qQME0MsAG4C4yX2GmMiZz5t5pDSZ1eCTsNGO8dJ6Ctb5+LwZ9hw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iwAWdfnI9APxQh4cINzvrf+q0w+9/TUVAZ13/OPrO0FuoXAM3RStRT46Wj9qg6xN0ftgQLZKFRdkQaDc/fCbgRM2uRnl0CZA19dl7+l8/BK1plHrtrffUnhXZsex5K7Do38YyxwXnhJNSqODO8zex0chiYVbasPrd/WiyKi609IwhsbjGEAfDcRWGCgBQ5yquxOx/Fdl5kSjllGd8+fu6NVVdrfP5RS17Egj91aJn31WzPTUyLLuKKFrfz3mw2wy28iuv3KjRpAYG0GpmhWml+brV/SYrPS5ypn9fVwM21hr1a9aMjtooTDJwkLb8s13R388YpTK9eRFtBDSiBO969hRnpj/qN8E43iBFCQusVtBlnP846fFFiVnoN6zii25FGGDWdgn6d3ABOJuGv6pr55jYdlvdwDHwkkFPW01402u+pavVpoHHbBJTQ8xWzzP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:09.6321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d394eeea-4742-46b8-d0ac-08dea1a2b34b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

Global Memory Bandwidth Allocation (GMBA) control domains on AMD follow the
Nodes Per Socket (NPS) configuration. With NPS 4 there is a single domain
per package; otherwise the domain aligns with the NUMA node.

By default, all QOS Domains in the system are included in a single GLBE
Control Domain. However, BIOS options may establish several GLBE Control
Domains within the system using NPS configuration. When configured, each
NUMA node functions as an individual GLBE domain, except when the system is
configured in NPS=4 mode in which case only a single GLBE domain exists
which contains all QOS Domains in the system.

Add RESCTRL_NPS_NODE to enum resctrl_scope and implement
get_domain_id_nps().

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Add RESCTRL_NPS_NODE scope to add support for NPS-aligned resource.
---
 arch/x86/kernel/cpu/resctrl/core.c | 20 ++++++++++++++++++++
 include/linux/resctrl.h            |  1 +
 2 files changed, 21 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 269265d98ad7..0f58f5e3b853 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -451,6 +451,24 @@ static int l3_mon_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_l3_mon_domain *hw
 	return -ENOMEM;
 }
 
+/**
+ * get_domain_id_nps() - Domain id for %RESCTRL_NPS_NODE (AMD NPS / GMBA)
+ * @cpu:	CPU to query.
+ *
+ * Global memory bandwidth allocation (GMBA) control domains on AMD follow
+ * the socket NPS layout. With NPS 4 there is a single control domain per
+ * package, so every CPU maps to domain id 0. For other NPS settings the
+ * domain matches the CPU's NUMA node.
+ *
+ * Return: 0 when NPS is 4, otherwise the NUMA node id for @cpu.
+ */
+static int get_domain_id_nps(int cpu)
+{
+	if (topology_num_nodes_per_package() == 4)
+		return 0;
+	return cpu_to_node(cpu);
+}
+
 static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
 {
 	switch (scope) {
@@ -459,6 +477,8 @@ static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
 		return get_cpu_cacheinfo_id(cpu, scope);
 	case RESCTRL_L3_NODE:
 		return cpu_to_node(cpu);
+	case RESCTRL_NPS_NODE:
+		return get_domain_id_nps(cpu);
 	case RESCTRL_PACKAGE:
 		return topology_physical_package_id(cpu);
 	default:
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 006e57fd7ca5..80290ded0b82 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -271,6 +271,7 @@ enum resctrl_scope {
 	RESCTRL_L2_CACHE = 2,
 	RESCTRL_L3_CACHE = 3,
 	RESCTRL_L3_NODE,
+	RESCTRL_NPS_NODE,
 	RESCTRL_PACKAGE,
 };
 
-- 
2.43.0

