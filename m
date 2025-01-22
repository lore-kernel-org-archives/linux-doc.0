Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A965D2163AB;
	Wed, 22 Jan 2025 20:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577307; cv=fail; b=AcZ86CYA3y9z3a7+IoTaANRUIn84VOlnYvqc7VXtRKqLnbdDWPq6I4tndchYJu2Rp3bh8DsUcW77XMqM7GQxoTkwHxTjFO5vWCAqQJxEEHEygFl8gyW2jblgEk+toztAnZOidjc9sKaj9wRAbSpbFsRCxIPh/bfQcVoYTycyPd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577307; c=relaxed/simple;
	bh=Tkc1Pza9XBe5MTWfN5sIhN/mawSOtp3ZEqCIs42Ekco=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nLY6BYaDRXhosRl6lkktth/3QDt73v/fyN3WjxZ4QlYkx4lxzoFRGUA2MpomPFde1Nbrv6OQD3tjkMDJNQdjIz3afs8VgZhRNh02Jul4KfHFzPTyaiiFk4jUloZtkSDsqjCUm+kWiXSuZmab1Lzgs30EWLa91s8fwKVT0JYs+hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qmMrlqNU; arc=fail smtp.client-ip=40.107.237.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qmMrlqNU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxynwybFT8+SF29mRcuibzcDCLEb9J0KxM/ZOPGllagVLIaOR/eW/RFUirBXvwQ6eAeESzBdbnnqLYhOvAo5vk5yaNeNPbjRDkjWSZkd8wkMuw4gzcvYFbgopZDNS+Ez+st/544drn/ecMyvjoCvQiYdDYCW0qzhkh9qtGAe+KqHSuR0MmLJ8KWsdlcIE778XKh825naPm8UbCrd1BGxHY4VMu0oBI/0k+5MLBtGPnx35JhG6hqRh0SmQLWm3FCjsIo41uhY4GEZCKLSoeMnkgcY9ELVnBy56dA0Biq2hddNDo6bUyhgtzofGmxxjJ5Zfhn2iDO9edxurqJR2AeqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeJrSxNzHHp4Yi4hU5T+dUxnDxFoOhn2vqkKO/+hGdM=;
 b=avk8VDjS/w2X+LTsVSN2rFf+y6Dls1L/56YjEebS1LTAKKdYehOdpn1DZO4E1omLy7Nby/DN8klkLRAceIZjWdXKCLkbLPpZgUuZ0qhGiC89QKq2zfXcLph3ACn03c30re1weyhd9cybRkFpATqImkUBjboJGQvRgcP0SdjVBeienMnLTeju/SR35FUD+4QprOxZviRt9V75eMqqCoLHbEJI5yCxC4krZS78TwVw1oGzdxqNYDsDqG5cS/gNV4yTSMqfFeBvtiLYjQtpcMDzSKWv7CS9S1UhnsYvx0Uam3CxUkCOmG56LD9yz8X9IkUJ1aptx9HYn91wS947XHt1eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeJrSxNzHHp4Yi4hU5T+dUxnDxFoOhn2vqkKO/+hGdM=;
 b=qmMrlqNUDsYXmAfUI2P4vpVfEbMD0g2AB3eVC2usGWgC4TF4w2vFk5imb0HObITDV8sKQlZso7ijRdH+IgypScquxO2jhb5fLZ+zB5TdBqX0pEN99pBhh51+nFy7QR7lYSJaYt67o79bPdp6VZD7YegskYC1B3IFN907lJoRkjA=
Received: from CH2PR12CA0004.namprd12.prod.outlook.com (2603:10b6:610:57::14)
 by IA1PR12MB6386.namprd12.prod.outlook.com (2603:10b6:208:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:21:37 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::b4) by CH2PR12CA0004.outlook.office365.com
 (2603:10b6:610:57::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.17 via Frontend Transport; Wed,
 22 Jan 2025 20:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:37 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:35 -0600
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
Subject: [PATCH v11 06/23] x86/resctrl: Add support to enable/disable AMD ABMC feature
Date: Wed, 22 Jan 2025 14:20:14 -0600
Message-ID: <920cafec1920358ad0c8af2e78a8f8bbd8c0b77d.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|IA1PR12MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 4723c8cf-7abf-42f3-8bd1-08dd3b225fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgDc5o1x1hH+aweIwH0rFdl0O3IhF1CQX8r6d39vn0fNcZAmNrQipUokSRBe?=
 =?us-ascii?Q?8bnib8nQIJO3ztG6OSgxg3p8Vs/4z2joP690C8/xl29aKP6qp/waGA3Y2BC+?=
 =?us-ascii?Q?1mxcThhKuCHEFgxhEdKwe4fQ4hSaiZqEBz7SZZmCXJPonEzv2HS3Tn3q5hAT?=
 =?us-ascii?Q?KzSnjQIMhWpz3LqjyExstgev89InY2kBnBUH9teCVZi8t46UJ0jZqPqZ2KmZ?=
 =?us-ascii?Q?jpeEN0G9PJe2f7ZPqF45ogMAH/BrTkjMzwLrXtQXq3Gbs9mIchesa8WjGPtx?=
 =?us-ascii?Q?0uIXXa69nDD6SCWrHpBgksCjxcMqnpXMVkBkfmDaSgFStoL1ZRzxkFBOuyYR?=
 =?us-ascii?Q?nWhQTqSrVsFdzz//e9Makd+XGY/uAyQoWTJnperHAQZ2k0llH7sIl8Vqce52?=
 =?us-ascii?Q?9+9GEqmYGCKSxW5PgMAwwsV8rsbLSf+Oe/svhPWy9HGwT9mVtupwja1N9PBM?=
 =?us-ascii?Q?QQQAEc7fSBE/7W1NCalfsNWXb4kkFqa5bSQ6zFkHtwx1W/wxGpx0kEpkDqYe?=
 =?us-ascii?Q?xVw8gy9KGadCiqbux2LQ7o+35NcYY3MzKJ3J3XOD/VrcWSIhN5HaOq/gHmVj?=
 =?us-ascii?Q?ye0+9zWVEQik2zpgEwuEQjte+NMNF8qibDd987oE42ZzOY133QUxarEA7Kjq?=
 =?us-ascii?Q?Af4jbiQFUs/BRUaia0qSxggMADTmP6zhS7JqNkGx57vXawJeJJKt82JzHTc3?=
 =?us-ascii?Q?mJRRibqw+jOF0cGjNBsJlZmyuHWLyGgpIl0HojFPY4H2CXMRpV4b6wcGQ/dW?=
 =?us-ascii?Q?HYCw4z6WS+7ePwTKoyqi4J1G6bhcKTHSH4za88emf3fcaVcR0hBIKlYW3Uq7?=
 =?us-ascii?Q?MykYUbN3OV2UJA7dEh+fqXcy2O58uOA8HCtRwImD92V38IO5dwIYFumxK9gy?=
 =?us-ascii?Q?sOPm7LfjspDgUH2oMqCNhlyHHFd0fLQxkSYtN7tRt0nAM53EFOGAX+cL/clc?=
 =?us-ascii?Q?lqP9cUNG6X6CEcw4aALkh+lsA8Xk8JpF0N0j7QHNhJivDNCagafgbKmrd5zK?=
 =?us-ascii?Q?pfjog2WzXyl0uBx2PSpCpF/vQesELmvD/9YX9qUqTs/LKEiWp3S6M2SN+oDD?=
 =?us-ascii?Q?wnciS59N57sYHhkHe+lBtICBqQKYdcAjtYYDnj6/d1VbaahMMQhhhxi9r9u6?=
 =?us-ascii?Q?V1Be4kbNiihJ+islAZv7Yw4YIVyG2sbI5iWQ7tS8kh+WVAUy97Jskhabrsoa?=
 =?us-ascii?Q?hKPfHOd4Zp6u5OzUFXFSyffYG+sWzvSoEph6sQXtJ39I6PxtQwye8KyiaLbh?=
 =?us-ascii?Q?0MhZTmqt7Urgrk0AQAN4l3s24ucSICJInGaiKrk50Q5zFFO+c0dqNCK+23VG?=
 =?us-ascii?Q?DP8BkrfWVos3a7bZav1oAfl40gQd6ngfgY+snl7xviRTvFHK5s3FUQvIzHIA?=
 =?us-ascii?Q?4+GdABKIRx5+MwTeLetFjOd+RQQyLkfmYNoHOq7tvtM1XyQDQzNcbxuSlJIP?=
 =?us-ascii?Q?KNYE3Cj6GPj28F9khxrI3tYa5BQoAyDz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:37.5021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4723c8cf-7abf-42f3-8bd1-08dd3b225fa3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6386

Add the functionality to enable/disable AMD ABMC feature.

AMD ABMC feature is enabled by setting enabled bit(0) in MSR
L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
to be updated on all the logical processors in the QOS Domain.

Hardware counters will reset when ABMC state is changed.

The ABMC feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Moved the monitoring related calls to monitor.c file.
     Moved the changes from include/linux/resctrl.h to
     arch/x86/kernel/cpu/resctrl/internal.h.
     Removed the Reviewed-by tag as patch changed.
     Actual code did not change.

v10: No changes.

v9: Re-ordered the MSR and added Reviewed-by tag.

v8: Commit message update and moved around the comments about L3_QOS_EXT_CFG
    to _resctrl_abmc_enable.

v7: Renamed the function
    resctrl_arch_get_abmc_enabled() to resctrl_arch_mbm_cntr_assign_enabled().

    Merged resctrl_arch_mbm_cntr_assign_disable, resctrl_arch_mbm_cntr_assign_disable
    and renamed to resctrl_arch_mbm_cntr_assign_set().

    Moved the function definition to linux/resctrl.h.

    Passed the struct rdt_resource to these functions.
    Removed resctrl_arch_reset_rmid_all() from arch code. This will be done
    from the caller.

v6: Renamed abmc_enabled to mbm_cntr_assign_enabled.
    Used msr_set_bit and msr_clear_bit for msr updates.
    Renamed resctrl_arch_abmc_enable() to resctrl_arch_mbm_cntr_assign_enable().
    Renamed resctrl_arch_abmc_disable() to resctrl_arch_mbm_cntr_assign_disable().
    Made _resctrl_abmc_enable to return void.

v5: Renamed resctrl_abmc_enable to resctrl_arch_abmc_enable.
    Renamed resctrl_abmc_disable to resctrl_arch_abmc_disable.
    Introduced resctrl_arch_get_abmc_enabled to get abmc state from
    non-arch code.
    Renamed resctrl_abmc_set_all to _resctrl_abmc_enable().
    Modified commit log to make it clear about AMD ABMC feature.

v3: No changes.

v2: Few text changes in commit message.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/core.c     |  5 ++++
 arch/x86/kernel/cpu/resctrl/internal.h |  7 +++++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 36 ++++++++++++++++++++++++++
 4 files changed, 49 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 9a71880eec07..fea1f3afe197 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1197,6 +1197,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index cb7feb7c990f..3f847728aa7a 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -405,6 +405,11 @@ void rdt_ctrl_update(void *arg)
 	hw_res->msr_update(m);
 }
 
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
+{
+	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
+}
+
 /*
  * rdt_find_domain - Search for a domain id in a resource domain list.
  *
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 05358e78147b..ca69f2e0909f 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -56,6 +56,9 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
+/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
+#define ABMC_ENABLE_BIT			0
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -479,6 +482,7 @@ struct rdt_parse_data {
  * @mbm_cfg_mask:	Bandwidth sources that can be tracked when Bandwidth
  *			Monitoring Event Configuration (BMEC) is supported.
  * @cdp_enabled:	CDP state of this resource
+ * @mbm_cntr_assign_enabled:	ABMC feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -493,6 +497,7 @@ struct rdt_hw_resource {
 	unsigned int		mbm_width;
 	unsigned int		mbm_cfg_mask;
 	bool			cdp_enabled;
+	bool			mbm_cntr_assign_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
@@ -658,4 +663,6 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
+bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index c3d7d4c3009a..a7526306f5e4 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1261,3 +1261,39 @@ void __init intel_rdt_mbm_apply_quirk(void)
 	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
 	mbm_cf = mbm_cf_table[cf_index].cf;
 }
+
+static void resctrl_abmc_set_one_amd(void *arg)
+{
+	bool *enable = arg;
+
+	if (*enable)
+		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+	else
+		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
+}
+
+/*
+ * Update L3_QOS_EXT_CFG MSR on all the CPUs associated with the monitor
+ * domain.
+ */
+static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_mon_domain *d;
+
+	list_for_each_entry(d, &r->mon_domains, hdr.list)
+		on_each_cpu_mask(&d->hdr.cpu_mask,
+				 resctrl_abmc_set_one_amd, &enable, 1);
+}
+
+int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	if (r->mon.mbm_cntr_assignable &&
+	    hw_res->mbm_cntr_assign_enabled != enable) {
+		_resctrl_abmc_enable(r, enable);
+		hw_res->mbm_cntr_assign_enabled = enable;
+	}
+
+	return 0;
+}
-- 
2.34.1

