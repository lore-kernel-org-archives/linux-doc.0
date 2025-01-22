Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516DF216E33;
	Wed, 22 Jan 2025 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577420; cv=fail; b=SNPanDKG+EpFASCLRxQArYJztb0qdpkgy0NshwdQp0p8qo0DtBtdHEKPfHotSkvOIN8oS1/vxjYl8KXcUYymGLpkAQGU4WEdf8T8qa9sQsZAPTgySn9aXqL3LOXMCKQDJN4foWJ0RHCMMPMBdpzzbn8cECsJOZo+JcORfwQLzRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577420; c=relaxed/simple;
	bh=YcwhqMYNzYtEtP16PsV+dPGp5rX88KSfMbzehLiZQAY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aMQQJ1JUmGk2RfJX6N6WMPZEB0qbZdhy79ppu4aTD8c30H/hkvkIwJthpJ586tZZ7FJFSqEfjfrwls5j+8jGAzBPY0Ov47jBgCDrMCZGsaRlTtCN4aJREZYfa0TjsohWisZGe1SZfZqKl6AcbQHj7K0YvfXE/yxPkOQ1UHhZx5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=uEUsArUF; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="uEUsArUF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBNRyVyhcSp1rjqfjqgRRZZHO9VyF++v1+4jO+xM8K5ccg+IxnTtdAAPOInJ6/Rmkv8NAjUdPvhpal1cgDCndS1Ub7Pj/9HMh4sill+xiUa5CI+J6/+hA4bzHcAFTDEQP8XkkN/BXCiVfh3R0Rn2HRrb0gQXQ7MXE91k5Hs4Fh+xwcIkSHdSKsqlhTdp92qNTCtfG1vlHxTX+R2DD264PhSMtAWMmQnnTFgzRnleCsvp1baRMpeJdR0mWYpnWMo6m9IgxfYiZCMy2Qlo20MhWf0Ceod3TP2Ndce0CiUQrmkUgMETM52HhdT+H8+nCVs3J7Tx5KUjAfg4L8AmyDs1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIjRqfzUuP6ECFL7hnA22Eu2QQcpdSck2GcM2+nfWBQ=;
 b=c8oLMaG3zMWRLJrl2b3OjTLnZJuJY2oAKime7Pv4gKBQGhqsv4vVJYuVBI1lm0QHu16S/1BsJixBpotJb/xziIWhwdz8T5PSVKclthK9ulcN+HmxNGyk4vYd5NLbh43ihu2KI8gTMgeuBsuduHvi6Zu5YkolQIYjtiMkrIrFCqwxk0uFyn/+GSgRYp5Cer5UP59DBIv6VVUzVkmd8hPSyDdhBt507SXLpFUyTlWM6mZHKSafkxM+9CMHaMSuDPvfzJ3yz3GUUyPoSoCy5p7Juz1KT9Ab77Ch50AWbjqwS+BMAQ1tHhwSqwPdx7AIk8fXPOJ4aL4vJzBUFz87z1ZY2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIjRqfzUuP6ECFL7hnA22Eu2QQcpdSck2GcM2+nfWBQ=;
 b=uEUsArUFequ430vqAI0DBgrZoaJ8P7fk3WNu7IZWNNA+6tpk/O78MkGWABOrPQZ3HZrtvUtRMmeqTfrQJEUea8TtpYdYuEDaVpo6TYhQS8u77lENZIUZCtBe6mf6aMe9hU96iGpY72pbrEXnN8P+EvbdWdbPxfFhyK11ks5FJSM=
Received: from CH2PR07CA0019.namprd07.prod.outlook.com (2603:10b6:610:20::32)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 20:23:32 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::34) by CH2PR07CA0019.outlook.office365.com
 (2603:10b6:610:20::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 20:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:31 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:29 -0600
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
Subject: [PATCH v11 20/23] x86/resctrl: Configure mbm_cntr_assign mode if supported
Date: Wed, 22 Jan 2025 14:20:28 -0600
Message-ID: <4a48aabf502897bec1e015305d7b0b826bb20841.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: d757944b-b97e-4be6-d1c7-08dd3b22a3c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zgtm82mK81HLX4WpHR8BvgsbA3Q4pD8tTOgli1l8V7h50dvu3lYBzwipMI2u?=
 =?us-ascii?Q?MTmtVbpfJzChT6Z7MmiBGSc7NdB5XadVc12VWVK88Fu7+qY4sTq14zqs8Tm+?=
 =?us-ascii?Q?Sgc9IYXl7z1l1fgQwOi2u0yhE8Z6q5SF0B/mTPc67JS/YG28TcyrSzxFVI+Z?=
 =?us-ascii?Q?OKvo9/cdCkCF5+IkPafIYj0+0Un/AehYfxiv1oEGMYBMdPWh8T++VJtqZVZA?=
 =?us-ascii?Q?w80JmcJTjewwrlXx9MQpkF8DWp3NfQ5o1L8MPHbg4MbmwXNbNyngqFT8bEBL?=
 =?us-ascii?Q?4U7v+igEGU5bt7zCo7imv93HZvebLXDayv+ur0Oo2aoOsRKtilaAmTqliPJ9?=
 =?us-ascii?Q?USGnoSL5aAmUtQu8sWXUSq7x3u4F/SHq1Fz+Ax+kHC61qvRljcTKLTEkzDh6?=
 =?us-ascii?Q?gjkOQcxpZ/qRHaiaR3LOffOJ/+RrMeTVuBc4JG4AHnTzsZJPiNjy1+Nxo/UJ?=
 =?us-ascii?Q?yd9wsMU8agasQjaIinzwZv7K5lP54ppIiZARUWeB/e3KpTHm7a5bXyIfQxfU?=
 =?us-ascii?Q?7R+Mcp3kJ+4NClvUCeID3PGEhouJ3qmX00GfACLXsV1kIVQBrc2heH+6PW4l?=
 =?us-ascii?Q?BXjHSPFziiT5hc8KTYzx4G8OJ8WY+QqUUK7bU9M+r5oabWSqCF8skl4XZF1E?=
 =?us-ascii?Q?qm1CxpkI04rSss22trU5w/cnz3ZT/pGFonTowAY6SaWybnJ1pyulDvaIXzI4?=
 =?us-ascii?Q?tp8DfQ1aXcyhejxCG4T2oQLFUgouBO8M+g3r8ny/cJ1oCCSAI2vsWu3QiN2l?=
 =?us-ascii?Q?vjptC0u6SbMU3RoDEiaCu6jvdgRtHSY/aZJciMvEq+Gj6EBkQzF56S/3oerC?=
 =?us-ascii?Q?HRGpezTMteR3nfN7EsAQIwEtSaBDyEmtQWtQ6LcYXXQqWamJSQk6omarcBAT?=
 =?us-ascii?Q?rU+BrYfBLZkD70bURQM+r6pl1lCM8NUM0+PkVPw3TwODbs4uHspJeoVH7QdP?=
 =?us-ascii?Q?xSQvFreewGM6tys4/Wklw7f1KLcU0gDEq+k0Wk1qrcQSXyQ2OYGmSdY9DVDQ?=
 =?us-ascii?Q?cUDSej+rr89s/YT+tuLS1btVwiVnnR4hxoSsBFwRWTQJEcJ8qrD32fy3vcXb?=
 =?us-ascii?Q?pPNg2NMJlzKRH26yw2yCrkXGLcouRgBXkAipjV3+ld0tQobxSn1zxsGHwR5M?=
 =?us-ascii?Q?pbbqHbR+i3kCvBWCnIeN0ixhHYhQUpEVdyVc+ZNMbD8WfWlc8uNUY+2bRUXX?=
 =?us-ascii?Q?pDnri/icaIHLvQTPKcdbxQbg6LeWeFrKqLnvzsa8iRDLVaxOW/B/pFgGhyZt?=
 =?us-ascii?Q?83BFn65eQdl0tsLtZJMnOKD8Efl+1MQKuov5ZwlnTbINuK7UmFNH2aCINDr/?=
 =?us-ascii?Q?ktSL8VpYDzPjo2L0abyNs/AOSTf0WlTLJB3NqApSEBcjVS7tlucZ/23bzujn?=
 =?us-ascii?Q?VZhsnrOY5LldimZcPbyc3jAvirkfGWQ80D9gBAjArdFZZw0W+ldI86J8IsTh?=
 =?us-ascii?Q?Zr6HLp0KD+zPZ/b0lef73tnrp/573Po/HobFCdDv+MnUCkYTFQmI0U5Gw86s?=
 =?us-ascii?Q?fa3CqA2KQMjdEB8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:31.8380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d757944b-b97e-4be6-d1c7-08dd3b22a3c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415

Configure mbm_cntr_assign mode on AMD platforms. On AMD platforms, it
is recommended to use mbm_cntr_assign mode if supported, because
reading "mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable'
if there is no counter associated with that event.

The mbm_cntr_assign mode, referred to as ABMC (Assignable Bandwidth
Monitoring Counters) on AMD, is enabled by default when supported by the
system.

Update ABMC across all logical processors within the resctrl domain to
ensure proper functionality.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Commit text in imperative tone. Added few more details.
     Moved resctrl_arch_mbm_cntr_assign_set_one() to monitor.c.

v10: Commit text in imperative tone.

v9: Minor code change due to merge. Actual code did not change.

v8: Renamed resctrl_arch_mbm_cntr_assign_configure to
	resctrl_arch_mbm_cntr_assign_set_one.
    Adde r->mon_capable check.
    Commit message update.

v7: Introduced resctrl_arch_mbm_cntr_assign_configure() to configure.
    Moved the default settings to rdt_get_mon_l3_config(). It should be
    done before the hotplug handler is called. It cannot be done at
    rdtgroup_init().

v6: Keeping the default enablement in arch init code for now.
     This may need some discussion.
     Renamed resctrl_arch_configure_abmc to resctrl_arch_mbm_cntr_assign_configure.

v5: New patch to enable ABMC by default.
---
 arch/x86/kernel/cpu/resctrl/internal.h | 1 +
 arch/x86/kernel/cpu/resctrl/monitor.c  | 8 ++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index c006c4d8d6ff..2480698b643d 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -734,4 +734,5 @@ int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d
 void mbm_cntr_reset(struct rdt_resource *r);
 int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
 		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3d748fdbcb5f..a9a5dc626a1e 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1233,6 +1233,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 			r->mon.mbm_cntr_assignable = true;
 			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+			hw_res->mbm_cntr_assign_enabled = true;
 			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
 			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
 		}
@@ -1313,6 +1314,13 @@ static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
 				 resctrl_abmc_set_one_amd, &enable, 1);
 }
 
+void resctrl_arch_mbm_cntr_assign_set_one(struct rdt_resource *r)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	resctrl_abmc_set_one_amd(&hw_res->mbm_cntr_assign_enabled);
+}
+
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6922173c4f8f..515969c5f64f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -4302,9 +4302,13 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d)
 
 void resctrl_online_cpu(unsigned int cpu)
 {
+	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
+
 	mutex_lock(&rdtgroup_mutex);
 	/* The CPU is set in default rdtgroup after online. */
 	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
+	if (r->mon_capable && r->mon.mbm_cntr_assignable)
+		resctrl_arch_mbm_cntr_assign_set_one(r);
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.34.1

