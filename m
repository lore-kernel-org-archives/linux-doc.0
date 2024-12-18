Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A571FBEB7;
	Wed, 18 Dec 2024 21:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557900; cv=fail; b=oquRjUE3rpvgZuzq8J53AJ005oEmghnm3C0Icz4dl6mVd4D53hP9jLVTGIl7/IMkC7RtklMdZYilEEsoBYKiJx6zMg3Gur67q4KNIMXVqv6gUAMEexeBBuXbOHoemfiReJmkMw5rMG/FDbmqZSsEgyYg+bs7DKr9QnxjJffmJQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557900; c=relaxed/simple;
	bh=llCecKlI2jCGDSlC6lL7inPjH/CAKM5wDXdVkcXSUoU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bFl1+z7ld1OafwZd76cDCTrPA/6KGEV02huaOO0Syt53qDQfK26AoGNE/pYrJqvocqTBmKug0xvfD2wL8Hz4R79g8AC4x2Np4mXLXtyV6XWk4fRxAVyPRkiHiJOJ89R1/jtH1aHoklrpODn5IeflYzwHZKYyP2Js32idgPSaQtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yq9iuVkd; arc=fail smtp.client-ip=40.107.93.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yq9iuVkd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXaVgdGD6Qbw1TdJdnlLTbrz9Z3flKRgh2rl/VdYq2DOIgcyDkYfpto0mUPD3vAS41K7sWhHndqy1BnvAhf7eNi/CGBLBx9brI8kuVPvdISZzRyg/oAqDY1obd7xM4kQ8ZvjIf3hvtGD+xkLuZvlVrF1V78zWcVz7fLn0z3Z6qJmFRe2doDQhKzZqNECKlctkGNjhdOiXxbvW646U86hgV7ddXhgRRQGTKe9ygEVJq9YSYXZb/OlDUQzY6u6eDr+1Nw5eR5VF2/T0gWcKYACYj2SRKCvnagslh4FNcnrWAPsRy7a0cugXwOoLrwDIhCXaG/3MswU0WqjT0URpJ2w1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mm9/9ONtEhq/cXUvBZDT6/PXbNxTkNnojt5k4RYSXo=;
 b=BwKD/yyphHuTg6iggrTPpH8hOBkOvzCPWoTnsuBRFG7vDS0rNpWO9emuHCFiO97jpOVsrtTz++mBPFLb4YPbAVLSi/vH3AKZfqDaR4tFTChKlng220GO/XoScyvbc/gfkUzF/9yRT7AST1Uu61v3WyBSa85+jLDLV4+3jK3jYyJbN25edg+lCYDQUdDOWO6vZUPSLm03X/yqwuy3ECculLpoFM2yoO+7D6nV9wslMojtNulqijPGOCg0pJ3dByWEgkdYCIjyODtsgFLLwAOmt2D9r7j53pZoZ6HYUgI40flsREiAfsYSIIOtxqRFkQnt3sBkIXeoH5NCx5svr7RUIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mm9/9ONtEhq/cXUvBZDT6/PXbNxTkNnojt5k4RYSXo=;
 b=yq9iuVkdgjPB7tjRh0ySlK5uZa/k5t33Z1O0iVGDj3pXjs5LlCF6qZWxf/iwdXN4U1EUcrz1YDWG0dmTd1gKwmrHlJMycaQID3fF6SOySMoYkXQFnFdVTvXjhTjggVs8E54JTb2sCDFZlOHa+pg6hcEMwO3EBuP15DMM3/WyO1U=
Received: from PH8PR05CA0020.namprd05.prod.outlook.com (2603:10b6:510:2cc::27)
 by CH3PR12MB9145.namprd12.prod.outlook.com (2603:10b6:610:19b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 21:38:13 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2cc:cafe::6a) by PH8PR05CA0020.outlook.office365.com
 (2603:10b6:510:2cc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.11 via Frontend Transport; Wed,
 18 Dec 2024 21:38:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:12 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:09 -0600
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
Subject: [PATCH v2 0/7] x86/resctrl : Support L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE)
Date: Wed, 18 Dec 2024 15:37:56 -0600
Message-ID: <cover.1734556832.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|CH3PR12MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e3a388-5426-4816-bef8-08dd1fac45ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jAcTwU5UyakyZkvUTjJLPYDwiFFl3hWSqzniQPTavn0mv9TIvVf9vreKvOdD?=
 =?us-ascii?Q?AtBlCU1y7YQ33HN/H5UDc9yqvDFnDtc9JzaBni/paMJeNYtGFEvxHA+WYsyJ?=
 =?us-ascii?Q?5G5nk7PuoQXvgmJ2dkGPZsqabfxU5jNxLBptz43SVP4lP0S03QdwKu7UH/Ll?=
 =?us-ascii?Q?iL9xj/MmYR9uzB7YZlqOkQuCmmn7Rw4VgJgNe61fhPBs4pe076++Ghvu7ipA?=
 =?us-ascii?Q?NjruGBMU038HTsNMXF8nwyFfRaPfGU1qcW3yPcsEa/47XPFzeXUyXVbeqxRN?=
 =?us-ascii?Q?lxXh2XwzKpuuyzkoR41oEQeIOxL+UJczMwZzzDthEGbErvim9ANYVltxjbUD?=
 =?us-ascii?Q?ePV9cayz0CPH0yNhm820RYeppnB21Iqlpu/1ek2KaPhgj/Ci5+WqYDsLwXTl?=
 =?us-ascii?Q?EixCnua1118xIMjclep5mNp/HwR1shkLb2fwYvU5x+1n7j1yvAl+Nu4jFub8?=
 =?us-ascii?Q?PJYAYiWfpffRdAkWMUu5WpEiJmfd3i2TgentIkQUKqYIikv+RphC1qXs7Q30?=
 =?us-ascii?Q?zBSxlHMp8vynXispuT+gEyjLlhTFvn/qCeoYTm1Hy2FM3+a+sYJTH3YlzpV7?=
 =?us-ascii?Q?JbGJI0kSiBawxOMGe/OBwetzsEN/GeE+qJ6TCHhKoDNjyLMBOnRAVzjFsH8U?=
 =?us-ascii?Q?xYF3gSe0puGcFMgP33iyt6BTNjIaa6+Hw1Q+46thiofyrXsV51FxBoFS6/9q?=
 =?us-ascii?Q?pX8p3rUgBPPy9ikGUBAJKk4pavAJDnn8hllXu2lZfBgzHNjFmcxWT0DE8ks/?=
 =?us-ascii?Q?yWGwy6NuZiW/KlPhZBh29CSHiZOiu2ndbIUIunoSsohDFjy4EIcQWiIXZ35N?=
 =?us-ascii?Q?SH57zIICP5bWzZCLVOmnX54k7tzEOwHTpuwjrOVdJPmTpJ/o9+1ZDI1uJiEH?=
 =?us-ascii?Q?xz6y2iP0sZbjIYATKlKthKT08/DJEQg/t6q4XVQmSWIKJbrdHr/3wZZQyYLa?=
 =?us-ascii?Q?620dmbCiwQmDfT8/raBttQNvybemY5AUGmgFnVcTQarfHyv51fEWH8fZiUOB?=
 =?us-ascii?Q?eln4/ll2lnedgIFOnz448bqdDi7UxtPFoJy1gO4IGZ9kIt+WCW24uJLnu3Ss?=
 =?us-ascii?Q?oNWqEHmBaboA4bIANMIdWeLbdwyhdUfOAPBEYXQCRbOJyGuvnn3mqW/NnZTH?=
 =?us-ascii?Q?sEwBvtPk57cTo+IJp/StUMjhWC5N2/0yyemzqVVw3pBaTdPrkYyM3XNGGNZs?=
 =?us-ascii?Q?z6WaIishRtbyxoXO8qvr6ubqw9uzsiFFhGsgf/2PlyCBr4zYGfcNL2vlkEes?=
 =?us-ascii?Q?G0oByAc95SZETVGm/eF56nYN1HxDTgi1FWX/8OPUEVDFFk/cQ7MI+xvnF3x2?=
 =?us-ascii?Q?inASeZDwU3xi80I+waPEKBCMFZHc17pnVpLVxmmXvcvwK5zyUPZkgnquzM9S?=
 =?us-ascii?Q?hKEG5uovjf/AZiF0fq/IaBvPVi8cDudeTN4TFj9IMdOnnxSfrIEH7yXBDPwV?=
 =?us-ascii?Q?CE5CYvjs4jA4Od3LB4NGdyRj6inHaWtH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:12.2935
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e3a388-5426-4816-bef8-08dd1fac45ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9145


This series adds the support for L3 Smart Data Cache Injection Allocation
Enforcement (SDCIAE) to resctrl infrastructure. 

Upcoming AMD hardware implements Smart Data Cache Injection (SDCI).
Smart Data Cache Injection (SDCI) is a mechanism that enables direct
insertion of data from I/O devices into the L3 cache. By directly caching
data from I/O devices rather than first storing the I/O data in DRAM, SDCI
reduces demands on DRAM bandwidth and reduces latency to the processor
consuming the I/O data.

The SDCIAE (SDCI Allocation Enforcement) PQE feature allows system software
to control the portion of the L3 cache used for SDCI devices.

When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
partitions identified by the highest-supported L3_MASK_n register, where n
is the maximum supported CLOSID.

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537

The feature requires linux support of TPH (TLP Processing Hints).
The support is available in linux kernel after the commit
48d0fd2b903e3 ("PCI/TPH: Add TPH documentation")

The patches are based on top of commit
33193f21305e39 (origin/master, origin/HEAD) Merge branch into tip/master: 'x86/tdx'

# Linux Implementation

Feature adds following interface files when the resctrl "io_alloc" feature is
supported:

/sys/fs/resctrl/info/L3/io_alloc: Reports the feature status. Feature can be
				  enabled/disabled by writing to the interface.

/sys/fs/resctrl/info/L3/io_alloc_cbm: Capacity Bit Masks (CBMs) available to SDCI
				      supported IO devices. CBM can be configured
				      by writing to the interface in the following
				      format::
# Examples

a. Check if io_alloc feature is available
	#mount -t resctrl resctrl /sys/fs/resctrl/

	# cat /sys/fs/resctrl/info/L3/io_alloc
	0

b. Enable the io_alloc feature. 

	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 

c. Check the CBM values for the io_alloc feature.

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	L3:0=ffff;1=ffff

d. Change the CBM value for the domain 1:
	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm

	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
	L3:0=ffff;1=00ff

d. Disable io_alloc feature and exit.

	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
	#umount /sys/fs/resctrl/

---
v2: Added dependancy on X86_FEATURE_CAT_L3
    Removed the "" in CPU feature definition.

    Changed sdciae_capable to io_alloc_capable to make it as generic feature.
    Moved io_alloc_capable field in struct resctrl_cache.

    Changed the name of few arch functions similar to ABMC series.
    resctrl_arch_get_io_alloc_enabled()
    resctrl_arch_io_alloc_enable()

    Renamed the feature to "io_alloc".
    Added generic texts for the feature in commit log and resctrl.rst doc.
    Added resctrl_io_alloc_init_cat() to initialize io_alloc to default values
    when enabled.
    Fixed io_alloc interface to show only on L3 resource.
    Added the locks while processing io_alloc CBMs.

v1: https://lore.kernel.org/lkml/cover.1723824984.git.babu.moger@amd.com/


Babu Moger (7):
  x86/cpufeatures: Add support for L3 Smart Data Cache Injection
    Allocation Enforcement
  x86/resctrl: Add SDCIAE feature in the command line options
  x86/resctrl: Detect Smart Data Cache Injection Allocation Enforcement
  x86/resctrl: Implement "io_alloc" enable/disable handlers
  x86/resctrl: Add interface to enable/disable io_alloc feature
  x86/resctrl: Introduce interface to display io_alloc CBMs
  x86/resctrl: Introduce interface to modify io_alloc Capacity Bit Masks

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/arch/x86/resctrl.rst            |  35 ++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |  13 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |   4 +-
 arch/x86/kernel/cpu/resctrl/internal.h        |  12 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 311 ++++++++++++++++++
 arch/x86/kernel/cpu/scattered.c               |   1 +
 include/linux/resctrl.h                       |  13 +
 11 files changed, 391 insertions(+), 3 deletions(-)

-- 
2.34.1

