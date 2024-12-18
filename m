Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D151FCD0C;
	Wed, 18 Dec 2024 21:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557922; cv=fail; b=HYlm3+cBNnnzWtqaUxvft85GKPmWMlv4hGffMYb9R09TNEoU8/3+2jwbKScsVwhImha2sEwo9XjuwgGDoNTEm1OhzPIrsbEINKctbzRV8MOJASmvOCtQvgeYyjPav197xaQ7dKo0g60f/IshXqtWrOJoSXSsTPdNVhJR8TunI0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557922; c=relaxed/simple;
	bh=sN1KSOmKWXxU8ou6PRwXV8izqcG2QHgaO4K+u028FXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOQ7twS2sJLEOC5lY1v1LHstr9YAfa8PFt4MO3DWgku5foLHi6EnP8ncPdB/mgC/yprt1R9ZEcJY6GjpYFpNbcnfThLiiZkLS/Kx6P05cQymDcbet9xxgRXCFTzALq1UAtNURipMmBlQBKYGWyHfolxIE3J0wZDs8VxYpq/joLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2eWUZyoY; arc=fail smtp.client-ip=40.107.220.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2eWUZyoY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnFAgCbRICYCikDYTUl20+xLvrTwOmQj0N9A1AG09VKeG9IWKvM2xmmlcfmi4jhSb5yF7Ut44iDvsgTX0ueSR4rXTZdZl0elCU6fCl8tM48aszNpc1M28NkQrLOx0H7Op/E6sA3YSuCrjnQkl5gqEGG/c1kViC1agxXVjcYoCFHfiGVgOl0TdmpZFHMjVPhoxtc3ehwVHA0GnswtlrG7wswp/28RnK5eDMhVAzDSF6ik2a+RDgRRqjyzWvYrRo7BDkDy85Sffff/mpAgV0/mkh/JLV59PVHVukr7dyOdnSqM7elcGyZPZ9Nyl11rNoWsV/vzjgNYkdEMwq+PmikEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UtVpmE/KcG1Bk7BqJTIcyQOj7946+X7rPMpmdsqOrc=;
 b=sd9CTf6FCHIyQyZcmohQkGFqqZK1qJudGpsQ+qA8kV5iJIccQNaFW3qC5AMDjstYLOD6SrkaKjXZCE3t0dzZqncCX4cAcBPg7hgp5kv4QIXYLZTB1xdy2rUHn0YgWpkusRLkmxeJtF6+p8TTEPDJAc+1Zk7+WIqz8dCugwYpBiJA7aPfcju4ABNkZt0l4wOUHRKH6uSHbO9vMqfMKCI5hNiJuW+0JPTQp4+URVKviT1kU7J78QFgPDVs2Ivt2sBNi7R6ZSTT1OAb8kR/uzDND3PdLF6A0raE6ICsU2o3ZPoMyQxVO+Wr7W6UZvGdoIlJZuun7OQBFagZQAnVeO/2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UtVpmE/KcG1Bk7BqJTIcyQOj7946+X7rPMpmdsqOrc=;
 b=2eWUZyoYWfZShK/fdnxAQUXyOFF3gqS8s1EA2aSW7uTwm6B60678+oYLUpILX1A+WnzRgypBWokn980auZ0Balhtd8NAJSogz3NKBoLN4/qWAfuZLAsDmzpqy4ejvSiTAaVc48aA7yJgYpwJ27JuCzvXrzUUz6Bksxs0qpbt9w4=
Received: from PH3PEPF00004099.namprd05.prod.outlook.com (2603:10b6:518:1::45)
 by BY5PR12MB4274.namprd12.prod.outlook.com (2603:10b6:a03:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Wed, 18 Dec
 2024 21:38:36 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2a01:111:f403:f912::2) by PH3PEPF00004099.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Wed,
 18 Dec 2024 21:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:35 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:32 -0600
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
Subject: [PATCH v2 3/7] x86/resctrl: Detect Smart Data Cache Injection Allocation Enforcement
Date: Wed, 18 Dec 2024 15:37:59 -0600
Message-ID: <ffcbf189201c4b79b91a2f94cfe219acdab807d5.1734556832.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|BY5PR12MB4274:EE_
X-MS-Office365-Filtering-Correlation-Id: 858bf4d1-4cbc-48f8-e4af-08dd1fac53e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3fXHHw2um5a3QAk4+Ov1olBru6xSsVMbxHSOdK0jx5tyxEVYICJgO8JPyFF6?=
 =?us-ascii?Q?hwmnsdxoPvlLmjk+KUI/2xsxXk4odKDCw5MB60JApEUEtUx9zed0V6Wx/tYn?=
 =?us-ascii?Q?zCBpiC9/X6QzkL7tk/alem7juV7BzzEUbzdPBK4TxKWw/HKkEN9HpC57HTgd?=
 =?us-ascii?Q?mB8NmGp2Q5rQiPFAt747/ogWLgaIlVLRmDypwhuAh6PSYWrXs24XQAZxYgu8?=
 =?us-ascii?Q?YXMxqCe9vGgCds409AfkAJz/5cvM3aTK6odqcEX1xlzNp+w7N1Uu353KSoCX?=
 =?us-ascii?Q?1+Y8iaOm9lOt3sqEsR1YpcIQ767+Vzr4hR/QoBS0V4WFkN/JRRG7ccE5Isui?=
 =?us-ascii?Q?2GWHGhHq+6w4P/ShHhpbqm7Vq2HMLJxZPvUdLtYBAY/admmw5n3SUHpVHUoR?=
 =?us-ascii?Q?ZJcHmC0l7VLQjWpDmbygZ9fpbpyQHMPct0LPlrwxfq9axSbmrYgLlYJPHTnm?=
 =?us-ascii?Q?OahMDZxhlbBrjcbD7+eCgRmH+xEOIxgd1TaKIA/OTXbrCgcYT3i5jH5UdbXu?=
 =?us-ascii?Q?piAEsbC8+PlJA81WLHg1Unuv3LwAsy/7xctCkvYVWZ+pPuIEAlPqfpIsIkZH?=
 =?us-ascii?Q?P3wTFYFIXl6b2V5XFhDLxAw8HMrFvDV6CZuslY1jxyE2Av72r0Kj3mmb1NS2?=
 =?us-ascii?Q?OjC920890EWcaOc8EF0WVsHrIYva4yw8dOJE2rrRr0RRpeJy4rp4Ey4RKVQx?=
 =?us-ascii?Q?bEW1IS7lPm1ztd23JC3CiNwwQ/G7DhhcXq0RwSdM/UmAyN9l26dmQ4Phjvq8?=
 =?us-ascii?Q?lhK0izCq8tSIcRnpK/nRF72FUOz5JYPmiYLpGFZZQm9SkhdqeXQVBwkb+BHd?=
 =?us-ascii?Q?eEWO3emPZuyxMvyEzUTB+kUVu7BS6gmHUGkcAg+8nfa6RTTWbJeb10eU+Ylc?=
 =?us-ascii?Q?Onq3+eNF/FOHD8767r6AargJz0rgWiQXQfBUFFZ043Q1d+PbagnaziDVT9WF?=
 =?us-ascii?Q?3r3s6w4yhvfZwKCERGdZrEkS8KMn7q8xbR+7ozaKNHPcbR+Z29B6nW7pvWwf?=
 =?us-ascii?Q?VzVOj7k0Yo3BkkrdlIggFJL4XnNsezTZ5qGFUgyqO1hJu7Gea+JGSwHwcQyu?=
 =?us-ascii?Q?ieUEMJR+5WZ736FWNHTjZ9gzKyzh4lL8fIRPvubHeIXL5OIi1rV86s5bKh8O?=
 =?us-ascii?Q?bYn2GNBF7paIHeMCp1mpg+59BqByiTs2Oso1lshT/vCPuaGWWDnT4iuJ9ut+?=
 =?us-ascii?Q?yJcL4WCAQhavS0Gipv2DccgMXsndZKZWIX0v0vjrUrlv3Yl/wr3BQ/kkPCbG?=
 =?us-ascii?Q?76H53BHiJfXv6Bj0as2n6PFT30l5MxBZqjdryQccdXBOo2FQ0WmBP15j43Ph?=
 =?us-ascii?Q?NsbcUCCeLJrYfP0FbVrG+0s8eEOkGALdKYi7Mtw8ICHwYvfSw8SamcQhR3DJ?=
 =?us-ascii?Q?cL/FasIb6RUVDFHc6SGQzxzAyA8mcHoDAksyTtKOVs4QjczbXMOg1gamimnR?=
 =?us-ascii?Q?bsDV490fb+a9xpZbhiJY7gCXXf+fAIZvd7zGVoaP82KlCIAXCcHGBj54V/dO?=
 =?us-ascii?Q?3wyxrisudBvDrqM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:35.7367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 858bf4d1-4cbc-48f8-e4af-08dd1fac53e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4274

Introduce io_alloc_capable in struct resctrl_cache to detect SDCIAE
(L3 Smart Data Cache Injection Allocation Enforcement) feature.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
    Also moved the io_alloc_capable in struct resctrl_cache.
---
 arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
 include/linux/resctrl.h            | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index c2450cd52511..39e110033d96 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -306,6 +306,11 @@ static void rdt_get_cdp_config(int level)
 	rdt_resources_all[level].r_resctrl.cdp_capable = true;
 }
 
+static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
+{
+	r->cache.io_alloc_capable = true;
+}
+
 static void rdt_get_cdp_l3_config(void)
 {
 	rdt_get_cdp_config(RDT_RESOURCE_L3);
@@ -931,6 +936,8 @@ static __init bool get_rdt_alloc_resources(void)
 		rdt_get_cache_alloc_cfg(1, r);
 		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
 			rdt_get_cdp_l3_config();
+		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
+			rdt_get_sdciae_alloc_cfg(r);
 		ret = true;
 	}
 	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index d94abba1c716..5837acff7442 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -129,6 +129,8 @@ struct rdt_mon_domain {
  * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
  * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
  *				level has CPU scope.
+ * @io_alloc_capable:	Smart Data Cache Injection Allocation Enforcement
+ *			capable (SDCIAE).
  */
 struct resctrl_cache {
 	unsigned int	cbm_len;
@@ -136,6 +138,7 @@ struct resctrl_cache {
 	unsigned int	shareable_bits;
 	bool		arch_has_sparse_bitmasks;
 	bool		arch_has_per_cpu_cfg;
+	bool		io_alloc_capable;
 };
 
 /**
@@ -202,6 +205,7 @@ enum resctrl_scope {
  * @evt_list:		List of monitoring events
  * @fflags:		flags to choose base and info files
  * @cdp_capable:	Is the CDP feature available on this resource
+ * @sdciae_capable:	Is SDCIAE feature available on this resource
  */
 struct rdt_resource {
 	int			rid;
-- 
2.34.1

