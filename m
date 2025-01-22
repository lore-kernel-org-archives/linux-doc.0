Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92AB2165F3;
	Wed, 22 Jan 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577352; cv=fail; b=Y+cQ3rXkjt0lSPwYOcJpZEObREwiMjC1WzJ7am2clhDW4wrzoRmQcLSxFsmXeE+YND7vpPX4U7O4uIktG1KIz1HH6Iyw4mTQruxf+KwBe8vD00MOhw0bPjENcGg075uorwIQD+IwQejYpk60dhddwwsD/771mwxTZksqwfRRYJo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577352; c=relaxed/simple;
	bh=Ypy+C6yBYbJAnwgjbwpyCFNLRyTySB9SF8HzvcuG4yw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MsejubKw7+cH1FWD1FhvMjJPTuQNpUrZWo40riWsmpxq2kFKGYkn5Pzi8dM9aa/4ffrrN2kwviZr/XxPkwoSBaQUc/rStPNzHk+ILFqB8r0TrAjgVjMhFxL7S2AbcONTmS5LLtAWJvEu7QghZHUmLUINoQPdZA2K8jIMr0I4SgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kVhR4oIR; arc=fail smtp.client-ip=40.107.94.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kVhR4oIR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIB6UGcR4JKi8VOri1Zp5sq95qQ9ak7TYnAq6NtdTmlg+A2kBY1B7bDiLzZjDmQCrhUnVdXVXbIwkXrvEuPr6KbaroghGIKdZf+27J/crOxPH/hIHVyDHDBi8ZnabMgiWOgmnfXTdV8Zba+I7a58aFENO0V/4qtoSUmpnXKJlw9oz4tHXxD1KJfvtBbhtrucAfAGLVR0IbKdng28NVoWjHGgC8JojhaqEDCYB8wCkoEfcx4wsmRfUtBDsGZRzW60Wg27BcZStSTY3g5TpD0q54qiX/kcrGCxExjoMAyMVI9yrHV11IzsBcTd4EbWIzv1pqwMdBFdyso8ILoMMLSmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrVoTaYv6/n0OQiZR3sz21BPT7zAIdu6p7ctNSXXouQ=;
 b=Lbrq009QJMcckAHlZql67Ieo6A6vYVNdTLRUPBYQm4kX3+OS2gj6pOyN9hjGv5rbj/C6idnwIXTw1GlXz3qdpHr3dJvNoO+CkhQRdf4YP39KXku0Snec5DjSJ10VD1n9dLaM6ltKuewI/z/s3pajmFSMFLVt3iImR9IduNuVF1dlns0osymOAb2kgZASSUI4u+hnNjQY3KiDKuBp0o/0HabJ71k3PD0zim3JVMYHFfTpwWxnajtpAnnTeqLrSwyK53a8Pd/fl+rJFXlKQrMoo/V9EBPp20d4mSlXePrhrNlhVPqDcclzzGV+0TWFMcpZdvPonnHlyMzP85QEuffwpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrVoTaYv6/n0OQiZR3sz21BPT7zAIdu6p7ctNSXXouQ=;
 b=kVhR4oIRMSTN6dLtR+qQc6x6jI4KqiTSz7QaOrEMZZNvSd3TVIWD21PGXrPBAkIivabFtYMZICECVP4gXxO1LqZFnZyakYw+k6a3cxQQCu/m0UoGjooEdRbjMbHHqxPHMP2TC+g+LJ5VYPoI+vA1Xlf9AZ7hjhoSAWbEBaiY41U=
Received: from CH2PR07CA0016.namprd07.prod.outlook.com (2603:10b6:610:20::29)
 by IA1PR12MB7520.namprd12.prod.outlook.com (2603:10b6:208:42f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 20:22:26 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::39) by CH2PR07CA0016.outlook.office365.com
 (2603:10b6:610:20::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 20:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:25 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:23 -0600
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
Subject: [PATCH v11 12/23] x86/resctrl: Introduce interface to display number of free counters
Date: Wed, 22 Jan 2025 14:20:20 -0600
Message-ID: <f60eced8c7b81267b0067b0c41a4ddbc263ded5b.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA1PR12MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: 1742ceeb-a660-4e8d-91a7-08dd3b227c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1eAl/X5z0g+8kSaZipaoMfYr7xexIDX0LvITPkemegGmXhMXiLFB3pHTzFP5?=
 =?us-ascii?Q?PPmbbtolLZi9suDiCtGHc+zcGB+nQWOZlYNz/3yzO+RnOfpRV73UJ6282YE3?=
 =?us-ascii?Q?6tNA6cmG11KV+P0T+59i7oQV6ckriuRbdZo8MoEaonmv6rMyOwLGj48D3Xk1?=
 =?us-ascii?Q?mIwj7G1pwFAMMQDvg0ypaNPHjtRhmgurFSkP2ABLieemS+2XhZAzhLlCYO8v?=
 =?us-ascii?Q?61275VLhiaw5NdOcteYSG4pknhAfnQEncOxn8o24giw4YO+L0Eb6QFfZnuFN?=
 =?us-ascii?Q?4qY1FpjADgBz8NggrCilbMWNLn8S4nPhvlzSlnxIimgaNt/w5ILleXCjBk5W?=
 =?us-ascii?Q?AG6n4dmwOXYcGrpIMrcOq5C3olmyUUnRCV47TMXLPW3GDwrcaMOfRSoE5Hq1?=
 =?us-ascii?Q?3FvgNiVFgQUUbPPspvhlSUEAB47ghCdRcKPv5rziLe/pljH276bOQlIN6bs2?=
 =?us-ascii?Q?EudjQJdhFLtFAviBNKgWGxpYn6AoXWZdkwn8oKSVxAKAomsglyvCqiJcMh/Y?=
 =?us-ascii?Q?701k3R/FGvRgf4sRzCRlyIG9Bx1myanGfNT+KKFMB+r7+LsQKTmVXDD0OCuj?=
 =?us-ascii?Q?6PT1O2g7CxsITsX4DQuuUYZTsrXdy3eeuYjO9438WS3Vrta8VGvDbOxHP6c2?=
 =?us-ascii?Q?DWdwcU3SduiGCZJhd+swzPZnSoy3Mh81WRn0SxpzqlcDjjAgpxoWf4+xiNuu?=
 =?us-ascii?Q?RP8XyYz+F7BuQIkz7eNq5Wkn+A8xyHKqcZ7PEroAmtkjF20MEPJwr294+fy2?=
 =?us-ascii?Q?PKI2ECr9T1hGF7ApPy2JC02IQYQmQVXGhVb3U4vgEXKyq0W4IMR4NWfAKkye?=
 =?us-ascii?Q?QETGslhCkPUpQMEUwApWy0QBxGsqU/G5jJrrPnN+Tf7UDGXmv9uBRhkDoReu?=
 =?us-ascii?Q?5x9rAmoDglT8ZV9WwCv8dfjItNRGYBITDMp1sdGW1+zLyuetsJB9ppl22LGY?=
 =?us-ascii?Q?kehJdVU2QB6jJzuUObGdP5129KI7AKrLlemLNTbLv2vcHN7D/hIkcyI/bSeS?=
 =?us-ascii?Q?WXVFFwd6volCZWE8I0iXYWFiIQlz/y2oKzoeXkG+A+U53wCCz4Q3B44u+OYc?=
 =?us-ascii?Q?vay068wLMnMlnKCSEhfPbnG5OXw1+wF/i904p0QJLLSj3Xrc3vhLksUiUdtN?=
 =?us-ascii?Q?4H1XJr/IYan5WaujGrQ6VsZ+A83G14U2ONarggjNAV1Bx/ZZM8L9xHY2/rDi?=
 =?us-ascii?Q?dc4Y08mNq8cvvjlU4HXR49mOQmujTMUWnNJ0+JW4YN/CBRGrwugwAp/+OATQ?=
 =?us-ascii?Q?f8fRF4v6v01KLxP1pALtvF8Y8mSYx0Iz3RhSSDTt1SsS7I4YNX+WsZ8nT7lD?=
 =?us-ascii?Q?OzvqSmbmGhaTAV0O3j/qL+nDfW1rpLy3UZWzIrOBecv8UBH9G3+OwLo0Wh/G?=
 =?us-ascii?Q?TOjzVMzfBkzDTh8XESXTL/9X54K2Tst5fxJrseBbeJXM6/qeKPITvSXaQeZn?=
 =?us-ascii?Q?GlkyquRmeQoCzDVBxVIfiaVx02G/oz+f?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:25.9006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1742ceeb-a660-4e8d-91a7-08dd3b227c7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7520

Provide the interface to display the number of monitoring counters
available for assignment in each domain when mbm_cntr_assign is enabled.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Rename rdtgroup_available_mbm_cntrs_show() to resctrl_available_mbm_cntrs_show().
     Few minor text changes.

v10: Patch changed to handle the counters at domain level.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     So, display logic also changed now.

v9: New patch
---
 Documentation/arch/x86/resctrl.rst     |  8 +++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 46 ++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 31ff764deeeb..99cae75559b0 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -299,6 +299,14 @@ with the following files:
 	memory bandwidth tracking to a single memory bandwidth event per
 	monitoring group.
 
+"available_mbm_cntrs":
+	The number of monitoring counters available for assignment in each
+	domain when mbm_cntr_assign mode is enabled on the system.
+	::
+
+	 # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
+	 0=30;1=30
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 6fe9e610e9a0..f2bf5b13465d 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1234,6 +1234,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
 			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
+			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
 		}
 	}
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 75a3b56996ca..2b86124c336b 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -888,6 +888,46 @@ static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
+					    struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	struct rdt_mon_domain *dom;
+	bool sep = false;
+	u32 cntrs, i;
+	int ret = 0;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		ret = -EINVAL;
+		goto unlock_cntrs_show;
+	}
+
+	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+		if (sep)
+			seq_puts(s, ";");
+
+		cntrs = 0;
+		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
+			if (!dom->cntr_cfg[i].rdtgrp)
+				cntrs++;
+		}
+
+		seq_printf(s, "%d=%d", dom->hdr.id, cntrs);
+		sep = true;
+	}
+	seq_puts(s, "\n");
+
+unlock_cntrs_show:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1916,6 +1956,12 @@ static struct rftype res_common_files[] = {
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_num_mbm_cntrs_show,
 	},
+	{
+		.name		= "available_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_available_mbm_cntrs_show,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

