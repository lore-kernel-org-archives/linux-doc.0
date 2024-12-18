Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708A11FC7DF;
	Wed, 18 Dec 2024 21:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557952; cv=fail; b=Lh9f5vNzU4bi7fPElqwme/1dlzv8o8z3y/OUacJ/BnATaKbXDYIrU0Oz5kDdfZk34MlInkBwp9R1ADyrFGO4xwojdDAsSMMXGksXfBpEngAaAe1v7zzees0a8N74I3PJunGY0nDo0YPHS6EinsHZHRaNHdA4ypqwrwiPllSpBdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557952; c=relaxed/simple;
	bh=t5ZIm1hyBwUqgdy2H+zGDTfIGijIWhWiOEe9k5rgmIQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EvDKI0Y9a16nsg61GJtMG0MOF1x5JmbVYGWX3jOy8GXmLlh4rHtIt7vnx+EnBJx1yjuk06tTU1bOKjrfGPoKdVMsVljnX/hdMYnAe+bH8Ymgi8mkh29Q/uX2lT05cIwhBqWOr3cqlnstGq47HTVwQWVLmDUhhxVBHRNfEm9jrKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mbrq2J07; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mbrq2J07"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFtLJbJGOdl9qxKJBsi21GtoFRJg5oZl66JYOg7lcN22RhTEkzIOAexC1SxJXxwSaK4gZ7VOBCE5Bw4vQPC4UvqGZHZJ3ddQAA9/4YePT6mijYWq33C5kcFGfaagGd1YgVk9ebKBK4DTSVtplF1pQn5ODlZaS2tBaD0YfQ6x3k6LHVI1pJm4jmXrX5acEO3XBxyJXbpBG1To65kItnfLY/bafkGAn+KgFYu9RULsBZU1mnDa9DCyfPtx3/H0u4v/MN9yKeJ+ixqChQbTubUoDxaqEkdVE+WOMhwBGdUDm8A/1pEGIdcNS00fufhZsTyKJzv7jce0SlTCAvM22KVMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvEgbq7+TbbxfA+LUuKUvCMWCjoBC4BJrexk1fWqbs8=;
 b=BagHt/K7zGURHqCCguCpchkqUMCPqqmsa8+ZkHtu0P5gK2L9OyejxsnPfwn/XiUMZj0w9NLHcMN4M6TGwu1DKweQc9ellAW8RVpoufVMiWFkNeHtJli63rNVMEFrLiCUwLf/kshHscHt5znmGenJOwiuCJb5P45jLjTz9cfSRSSKud8Rfud32fv3cfleofFrUa1XzpK02Y2EsGOhPK4WePLFkotyKaTIP0hXCfEaulZqWza6hDcLNx4r3dWfnampSqJM/vGZvGsRDzyFhgnuW8ayUqqlCMAUpwTFGCh49prbYPrwHgN8WjI0UZOV24tNAPPF5jiSdibA4MWBGU6DJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvEgbq7+TbbxfA+LUuKUvCMWCjoBC4BJrexk1fWqbs8=;
 b=Mbrq2J07qB9NNTO/uw+EbchYylxTfSf+wVoI+uvGY02V9Dmpf93B3i9W6VCjOWG4Id749rVxNVqmSCo7qGIKGuD033DXuJr3+kTQ6Lt7s5dZFyliamnH9TPWTSuW1NDA+gjOWvxpNOEOIs5eslUYA6czUUZwBFpUt49C3k8COJM=
Received: from DS7PR06CA0022.namprd06.prod.outlook.com (2603:10b6:8:2a::10) by
 DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.13; Wed, 18 Dec 2024 21:39:06 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::a9) by DS7PR06CA0022.outlook.office365.com
 (2603:10b6:8:2a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 21:39:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:39:06 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:39:03 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v2 7/7] x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks
Date: Wed, 18 Dec 2024 15:38:03 -0600
Message-ID: <2bb9ce3e4ac57c6709f1cd37d8571373c6e3c024.1734556832.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734556832.git.babu.moger@amd.com>
References: <cover.1734556832.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d69d2e-9933-41e3-915a-08dd1fac65fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W8FJV2GH+zES7wrK7q/FZzws3M2drEnLQ1/q1AIBkfONJ4TNfmg9qS5bSLjc?=
 =?us-ascii?Q?omPpsRDBbZexOppL3gbROCgytVG67yN4ZRKo1QRxI3ZDW5thcgcy1aI+dpEA?=
 =?us-ascii?Q?350mlAzzoHdWi3qvR148UY59oFEy4vahENgtOswe5Kf9zkZ/PP18+HnkPN5w?=
 =?us-ascii?Q?X0yfuzx7kKC4ndmTWTJoPd5SJrPDcsJ+oF5bNxTNmrTGyicTV6WM5eecNUOs?=
 =?us-ascii?Q?G9LDk6rA12lgQm5Na5xETpiE7KgnbGWrC2cpuRlySa2ArAjF2HmQucwTf0js?=
 =?us-ascii?Q?MMiZYzJjlHbwfrrLpNM97I7rNiCmgXF/17U4J3th+Gchd29BtVoORjG/MAT+?=
 =?us-ascii?Q?rR8DJ9uvxWxmHgnyZb6TBBWEeTBPhpDM/7iCrz1T9W7yR92XeAUQbbBvfWs0?=
 =?us-ascii?Q?oBLV57kwMcXkNTlaeU4fhWrIyNQD5p/u2YlppA5ihBHJcGxJ4z84IwmA9jRh?=
 =?us-ascii?Q?E95IsbTLTm8AiGT6aYk8edSY/3UjrK41wCzGw3ccyb5sZstxb35m/XCSk2cN?=
 =?us-ascii?Q?ol0BpL1KLQ++PKHi4nXhbttV3hgvbDXfe5YYmxY2VLVgs9+wistruhNzzncQ?=
 =?us-ascii?Q?YgOar/l4NHcm9HeG5EbtMEHJgyF/SBDRc9LE7Gw5IK7GbMgu9eeHdeX/+iae?=
 =?us-ascii?Q?RYb07PQaYyEwZRn138tFTviNLb/GdLxsXs6lpPuNszFuwyiAwHpb/1e5UNsT?=
 =?us-ascii?Q?0z8L4efPpyu+pvivzTHvj+05hktv8avxI0lbsM4JkphhAYcwHtmzCcGYBcwT?=
 =?us-ascii?Q?Aftn+wuuelHjMsz3KG2rsMKbLZZKhLulIBuwg18rzqp+Ofcj9mI+zIf90gtn?=
 =?us-ascii?Q?cxq0KD9cMuhQJoDvbQ3b8TpnOCOElYAPk5D8aF1oB/n0yzhGaYlz9ryb89Rg?=
 =?us-ascii?Q?YXgpYw+RRlHVTnOqN0qGMWO0zzBH3/8+8FTESHeV2eL1uDWfMCl8yzwmwMQS?=
 =?us-ascii?Q?z0IPigd8DO12swi5y6E3HByoPzheswI0xTYB1z/IsFHg5FVS+PpuTQrUZLEf?=
 =?us-ascii?Q?FScsLuriO/e7DipNX+vyzz0N+Vzw7fFR9yDO8YK6tj4/PL6zV0a5pO72NO3W?=
 =?us-ascii?Q?KPO/GIzqMnCVd/Uv0A3McR+zAJbEIAfPpMBb3EboVa6tTxRttfHhdeWbUiVv?=
 =?us-ascii?Q?vXun2OvRW84+ZayN9N8FV9H82ybnwrs/q1oVnkTiNjUDzD7ziVEF2eZQt2Ko?=
 =?us-ascii?Q?u4w6FyOqHj/COSUzUOwl/bMMAMLUgipxHHzMqQW74qsRZqUhIOaV205vwjOd?=
 =?us-ascii?Q?ZE46ost49ncYuTwzk4Ny2YMrvCS7SvQrAUxpx/bg7fGxN054wII1P+rAb1KH?=
 =?us-ascii?Q?usK3gjQy7zVmz7iL50zIiWrL+OYYYM4450M90+rq6MxLq49Vfy7obRnU8QiL?=
 =?us-ascii?Q?T8wM9l6anaEzC1W3e8dkty5Jhr+iww5W/l2XUCrq1ZcgrBGgFZdx/V+MOyNa?=
 =?us-ascii?Q?zqpRpXYUpC9o7dqxxFh0NApMJoVkD1TkfAmh0rjJFmoNoW8xy1B7v6tddcr3?=
 =?us-ascii?Q?r3onEXWJTtfqwxw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:39:06.0868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d69d2e-9933-41e3-915a-08dd1fac65fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772

"io_alloc" feature is a mechanism that enables direct insertion of data
from I/O devices into the L3 cache. By directly caching data from I/O
devices rather than first storing the I/O data in DRAM, SDCI reduces
demands on DRAM bandwidth and reduces latency to the processor consuming
the I/O data.

The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system
software to limit the portion of the L3 cache used for SDCI.

Provide the interface to modify io_alloc CBMs (Capacity Bit Masks).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Added more generic text in documentation.
---
 Documentation/arch/x86/resctrl.rst        |   8 ++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |   2 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |   1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 128 +++++++++++++++++++++-
 4 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 52679175ee14..da74356adcc2 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -162,6 +162,14 @@ related to allocation:
 
 			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
 
+"io_alloc_cbm":
+		Capacity Bit Masks (CBMs) available to supported IO devices which
+		can directly insert cache lines in L3 which can help to reduce the
+		latency. CBM can be configured by writing to the interface in the
+		following format::
+
+			L3:<cache_id0>=<cbm>;<cache_id1>=<cbm>;...
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index d272dea43924..4dfee0436c1c 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -102,7 +102,7 @@ int parse_bw(struct rdt_parse_data *data, struct resctrl_schema *s,
  * requires at least two bits set.
  * AMD allows non-contiguous bitmasks.
  */
-static bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
+bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r)
 {
 	unsigned long first_bit, zero_bit, val;
 	unsigned int cbm_len = r->cache.cbm_len;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 1550cb468b8e..5f7236437cb5 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -669,4 +669,5 @@ void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
+bool cbm_validate(char *buf, u32 *data, struct rdt_resource *r);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 4d6b83d18790..c2b4221ea469 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1970,6 +1970,131 @@ static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/*
+ * Read the CBM and check the validity. Make sure CBM is not shared
+ * with any other exclusive resctrl groups.
+ */
+static int resctrl_io_alloc_parse_cbm(char *buf, struct resctrl_schema *s,
+				      struct rdt_ctrl_domain *d)
+{
+	struct resctrl_staged_config *cfg;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	u32 cbm_val;
+
+	cfg = &d->staged_config[s->conf_type];
+	if (cfg->have_new_ctrl) {
+		rdt_last_cmd_printf("Duplicate domain %d\n", d->hdr.id);
+		return -EINVAL;
+	}
+
+	if (!cbm_validate(buf, &cbm_val, r))
+		return -EINVAL;
+
+	/*
+	 * The CBM may not overlap with other exclusive group.
+	 */
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
+	if (rdtgroup_cbm_overlaps(s, d, cbm_val, io_alloc_closid, true)) {
+		rdt_last_cmd_puts("Overlaps with exclusive group\n");
+		return -EINVAL;
+	}
+
+	cfg->new_ctrl = cbm_val;
+	cfg->have_new_ctrl = true;
+
+	return 0;
+}
+
+static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
+				       struct resctrl_schema *s)
+{
+	struct rdt_ctrl_domain *d;
+	char *dom = NULL, *id;
+	unsigned long dom_id;
+
+next:
+	if (!line || line[0] == '\0')
+		return 0;
+
+	dom = strsep(&line, ";");
+	id = strsep(&dom, "=");
+	if (!dom || kstrtoul(id, 10, &dom_id)) {
+		rdt_last_cmd_puts("Missing '=' or non-numeric domain\n");
+		return -EINVAL;
+	}
+
+	dom = strim(dom);
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
+			if (resctrl_io_alloc_parse_cbm(dom, s, d))
+				return -EINVAL;
+			goto next;
+		}
+	}
+	return -EINVAL;
+}
+
+static ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_file *of,
+					  char *buf, size_t nbytes, loff_t off)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	char *resname;
+	int ret = 0;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+	rdt_staged_configs_clear();
+
+	if (!resctrl_arch_get_io_alloc_enabled(r->rid)) {
+		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	resname = strim(strsep(&buf, ":"));
+	if (!buf) {
+		rdt_last_cmd_puts("Missing ':'\n");
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	if (strcmp(resname, "L3")) {
+		rdt_last_cmd_printf("Unsupported resource name '%s'\n", resname);
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	if (buf[0] == '\0') {
+		rdt_last_cmd_printf("Missing '%s' value\n", resname);
+		ret = -EINVAL;
+		goto cbm_write_out;
+	}
+
+	ret = resctrl_io_alloc_parse_line(buf, r, s);
+	if (ret)
+		goto cbm_write_out;
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
+	ret = resctrl_arch_update_domains(r, io_alloc_closid);
+
+cbm_write_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2131,9 +2256,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "io_alloc_cbm",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_io_alloc_cbm_show,
+		.write		= resctrl_io_alloc_cbm_write,
 	},
 	{
 		.name		= "mba_MBps_event",
-- 
2.34.1

