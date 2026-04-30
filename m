Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B653B0AEA;
	Thu, 30 Apr 2026 23:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591578; cv=fail; b=L+b2QKk+kxvg/0QEKwew8WTGmABqdac7dQQXoMbR+G4h5s8L9us/iQ3mtSwzCexp2SCXixxvfxLMHbMrRik/iRugIKyHOjLk/k0Sy+HfF5mf50NK8pJ4NiwMDPucn8lwJTLbeBmvQnzzPtRBlkoeGnBDwUbytLILj+V8MLhURbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591578; c=relaxed/simple;
	bh=5AAKGHnYjfIKVbue4VAKwrYVBAcWY7Mwl3n7zrzpouc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtxHKaDJyMBJNDpyjVjSzFKHZTXGwfK8Ps4CbqPN701MJIfzj0fsfMkfUNXlK84P8xhb1DTnvIYJtI+43nF6ny3Zrqkl9ymWceh5IVD/RA606B3TbDZKb1rXkpLbxUfnxCAMakQLUaiSgjBXZYMHPj6bjXHmrKHt5W1b2d3j3E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E9hn+kLh; arc=fail smtp.client-ip=52.101.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E9hn+kLh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlrImhNzAIuI4h4Ae80XfjS+MROsDTjsZROx5RoDI0foiAO4TaeqwNkCH6VeiDxlZfYyiFC1ni7RWMudYllvXCLmZqgDYOqwy0SgtZ2s6ZAiUgSVdmaXBTHs/fKl9Gha4UtLZb8x4zaaNtbDwQDaMzNWYlVSQbnbuNKuK+N9zQy0gvJfuhgBqVpoulYlpZEd/S6tsuwsNj2kYRsFntojqj9rJouam//LbW8YZ58RffcHyKsaMq39L/xj4z20OX4LOfVLlplTKmaAoYfCPnFqpl4CRowZ9+cHOJq13f7RM9EjGyXSwjP4l1BhZiiuevyb7dy0ds34jAbNWb62OwAf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+pnBH/811Jtj/R+PPmmdNU5aPx6LRisobZ5KRyWxns=;
 b=LkJWxXecf6pf5qd/XQGeRzuzRKQM/Zi75pXQB8cTjNU3B+XjNNOd25x5vwZXwJ4P1DbwmX3pRuPTLoKKOXgoskNLF7mAg4XmRV5Cuci8Zw1Dhx/OWaDI1ziyEeo6kWuiWX5gZzeoOIZDZuJi7SJJLqn66m5jcjjYGc9gHSif/y2c8QTERNh2nWpLpfjylGCry9t7QypMiakAXc2MF3+JJCFHTXRsvXLcP4o8gBrQVctyNFNX/m7E17nug41kBNHts3wPHz9MRiMOsbpoGyB5FCTImmaYQprAP+X8+de1b1PGaa61pJSI6w6m+qnOvVUmW97M31K4OlVmRzBCwHTvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+pnBH/811Jtj/R+PPmmdNU5aPx6LRisobZ5KRyWxns=;
 b=E9hn+kLhw6uQUo9IYpvDEgPhCf4xgcUMptzlFtSJ3pv777BOWW8eqbhImuNr8bsa9yI/HzQvtOL5ZFFvgkZWDXNIjv8Ybf4IZFBXVTU68ZGBHocQ/elfJ5PjbkHvJ4Zn5bxRFIl0yQBX2B4tBl5IXx/y8062/ic7rAPc1+T1AoU=
Received: from SA9PR13CA0132.namprd13.prod.outlook.com (2603:10b6:806:27::17)
 by DS7PR12MB5838.namprd12.prod.outlook.com (2603:10b6:8:79::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 23:26:05 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:27:cafe::ea) by SA9PR13CA0132.outlook.office365.com
 (2603:10b6:806:27::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Thu,
 30 Apr 2026 23:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Thu, 30 Apr 2026 23:26:05 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:03 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <lirongqing@baidu.com>,
	<paulmck@kernel.org>, <bhelgaas@google.com>, <seanjc@google.com>,
	<alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
Subject: [PATCH v3 06/12] fs/resctrl: Initialize the global kernel-mode policy at subsystem init
Date: Thu, 30 Apr 2026 18:24:51 -0500
Message-ID: <38f794ae4076a3c118e8eda08ae2bc1e69eba979.1777591497.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777591496.git.babu.moger@amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DS7PR12MB5838:EE_
X-MS-Office365-Filtering-Correlation-Id: 13e5f4da-dc43-489e-e1d0-08dea70fd9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	F47fDy7PisbrfCySsAScQNttUdGPaZM0ePYb3KGXnsT03x+VWdoabz84CkPvF3ia5Bt/23v/3yZj/p3HZeJ+598nD3YIGsxEJv7bzKVu8uMebbDI84ke7UFc+i/guzIYwKSgD5k81X0waASUjjuklHJr4Lzsuq8aTffuoastYfxWHZprf3IlTZGsHIom6URgBe1Hze4UPpdnRvpafOOZ4mPJxVzud8OFLEFF/GDP1v4undONellM028/LKTxxnzW3R5YLZ6bM0wJUz9ZkL719rPeTS1jQ2rkixvDunsg1tW5IoECKTIVkS6qVyswrqz/nqgnatjinhlHXEQdXuVbUxrr1KiSxLQUJ24HLyuprGVtudaC2Esp8rBb/vr5Pbfb8k7w/PyjvALW/tsFxyOHkNWDcr1t2SBHiWVLc8dbbExa5LniUZUXhOmJEQc4RqIp4oTuZEqFOs5V45M0rQFpGe2eBdAvUecHkrrSkRqaBJzg8+yqmeI0PO39T08/YfRXcyEm+OutRvpwH3uAnuG/IKO2LNfe6gthvRnjLONZZU3bFjfcGL5LL1h4FTleEHfGmwWoN61vkBB5VWDAneXfBbEZhHP2EamJGtUS7qMsMHx7rBbVb1/1SANWvBLq7sObeA95Px4jf9NxGRQfm1D/l3FaRftqRdwMSiFCfm8JYbrx25E1afMrSi3IMvVJKfH8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/nMU4s4yBsCh1xBOX/traM8WWLmkjqLezmGhJQinLjQVIgN0DUXrfBOUA+jCzLVxq8YqpGm2YQ2rSgN9rm0g2FAJ7TNpHbLRkNICMfsE4m/6+HGr+P+6UCWtc1M6TSwwsO+cVEdxp1KMl0+dv+ZIksGgMWB/galt+V9g1VcPpnQ9i6D5LjdGkt09EQWxX/k9oxqaarXPoeI7Lhze0iLTVPSq+OSYlfLjLcO/SzMe50wDWQr6B3D0zS4fUmM6E/m0LqkTl6Cl2/CosfiCnL/hxBxmF8tPcwE5oylD+X4OyXIZINPPeLBPgKgN7117TlKRQSHc/FKr0laHVql3CiNZBgIU3Jan6LDdEdkl6sidjvDx0XjDx+3V04KLZ60Uf7beLH48Jjivue3K0RtLg3cGAIr/SzDj4zNw/niIc9YxSqn7sCswi0NcoIjk7TH6aYR6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:05.2445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13e5f4da-dc43-489e-e1d0-08dea70fd9c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5838

kernel_mode feature needs to add the interface that lets user space
choose between INHERIT_CTRL_AND_MON, GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU
and GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU.  Both the generic resctrl
code and the architecture layer need a single shared snapshot of the
supported and effective policy plus the resource group that backs the
global-assign modes; that snapshot is struct resctrl_kmode_cfg.

Add the file-local resctrl_kcfg and a helper resctrl_kmode_init() that:

  - Adds kmode and kmode_cur with BIT(INHERIT_CTRL_AND_MON), the
    universally supported mode and today's behaviour;
  - points k_rdtgrp at rdtgroup_default so global-assign modes have a
    valid backing group from boot;
  - calls resctrl_arch_get_kmode_support() so each architecture ORs
    BIT(<mode>) into kmode for the policies its hardware supports
    (on x86, AMD PLZA contributes the two global-assign modes).

resctrl_kmode_init() runs from resctrl_init() once the default group
has been set up.  No user-visible behaviour changes yet; later patches
expose kmode_cur via sysfs and act on changes.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Moved all the changes to resctrl FS.
    Updated changelog.
    Arch code only provides supported modes and FS decides which mode to
    be supported.

v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
    https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
---
 fs/resctrl/rdtgroup.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dfdaa6f9d8f..a7bfc74897cc 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -76,6 +76,13 @@ static void rdtgroup_destroy_root(void);
 
 struct dentry *debugfs_resctrl;
 
+/*
+ * Global kernel-mode resctrl policy: hardware-supported and effective modes
+ * (see struct resctrl_kmode_cfg) and the rdtgroup backing global-assign modes.
+ * Initialized from resctrl_kmode_init() during resctrl_init().
+ */
+static struct resctrl_kmode_cfg resctrl_kcfg;
+
 /*
  * Memory bandwidth monitoring event to use for the default CTRL_MON group
  * and each new CTRL_MON group created by the user.  Only relevant when
@@ -2206,6 +2213,23 @@ static void io_alloc_init(void)
 	}
 }
 
+/*
+ * Baseline the global kernel-mode resctrl configuration at boot.
+ *
+ * Initialise both the supported (kmode) and effective (kmode_cur) policy
+ * with BIT(INHERIT_CTRL_AND_MON), point k_rdtgrp at the default resource
+ * group, and let the arch hook OR in any additional modes the platform
+ * advertises (e.g. on x86, AMD PLZA adds the two global-assign modes).
+ */
+static void resctrl_kmode_init(void)
+{
+	resctrl_kcfg.kmode = BIT(INHERIT_CTRL_AND_MON);
+	resctrl_kcfg.kmode_cur = BIT(INHERIT_CTRL_AND_MON);
+	resctrl_kcfg.k_rdtgrp = &rdtgroup_default;
+
+	resctrl_arch_get_kmode_support(&resctrl_kcfg);
+}
+
 void resctrl_file_fflags_init(const char *config, unsigned long fflags)
 {
 	struct rftype *rft;
@@ -4560,6 +4584,8 @@ int resctrl_init(void)
 
 	io_alloc_init();
 
+	resctrl_kmode_init();
+
 	ret = resctrl_l3_mon_resource_init();
 	if (ret)
 		return ret;
-- 
2.43.0

