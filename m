Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812E21639D;
	Wed, 22 Jan 2025 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577280; cv=fail; b=egJxgj0osT1aYOinQWk5wqMifJiu91eLFFb4ItTKNJIaFyXRmJV/xEUil65KOD/xvv0vF/8l3r2lK1Rw7BZwkGvfehXRtBCJCrrROfu256o6D804uhbzbffc8fgJig6JiM6buKLdNnG0S7XlopONB+36DAKnlmBckCqqfScO74k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577280; c=relaxed/simple;
	bh=c3ibRZPhnv/x45kZV0Uj73kdYfcAosbgX4geagTYwZk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V6y3gShzpY4HCRHxMxy5uaKoC49X+uD1ktUZEavpuyEv+eZfuQjXA2lG5R1y5oygUAfMxIyCzNJsT3nBGNBjh1kbph/q0dPxYKPpNNDTWFIDHIsy8j+QPsiz4Dqlc1i5OrMmV+/DEr7t+/8zhWGAjP4Pw3BxFFtdHPieuVhSTCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=I0N0azTk; arc=fail smtp.client-ip=40.107.95.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="I0N0azTk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEkWZ9g/aKzZvvBaEDNyLjodMq5wqoLVi0qWde/I1yXuFUzXXRMVN+7XHoKJutEIT2EoZNAjTmqIqtcn8NbF0AdTSRIvurcW4rmmb1rq1S0t/SsewJAhvv93UfJecRdEorXJToK0meBMIv6oFbVEDqoDRaRpq88atLEVeC8gjk2QCd+h6+ve/6a5TBGAradzsvyw7MD9lmRI1fBNgBww5r//A+s9Q1w8Rl0fLs5WJOcXT66nocnVGh7rV1v+WfCLENMbCXjtKQAq12o6kTnl3CzbdqXyXXpZwNTYAhkyOzJy6ZCRimIT0SwZvVfgAzqWMwMU8Cwo5/wyL/8zmVVEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUIwkxnz9qu5tmJvtezsGOpnaWlzCiQ+JSOh9CL4Z+s=;
 b=eiLWbVd7MCTMcfcWaOwM6quGMACmwjqHc3ohZ7ACMl+3BLDZ2pjeR8mw4AiBgHokIt21rSP1MOAw0dUjYqFd0QLqtXP1s3PCqyVPrWbXQKqELT+1Q8+w1N1qjNeTuCj9GieIBDMrmVqTbcKFkKjtzbYrD1mSQsdg3f0melxDJVxa8+k1moc2m3s18I8yqxJ3dnzM8W2XNkIMItCYhF97F+xfw819Kt+dh82dY9ej80Pl9W7uroo3JOq2hkESJEk/3+d1ZLuD2K3dRjIIkmGz0gQ3LBZF2Lb2b4YbUP53iyMDvmIb+z2pqt2qwjzDk2jSTp1c5UzTPvv5tihMMclSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUIwkxnz9qu5tmJvtezsGOpnaWlzCiQ+JSOh9CL4Z+s=;
 b=I0N0azTksFKCBwXqwp6SwPAKtC2QnkM6n6YRdQbpeuMMQXGj6jXBJMDDyrKeEBNjj3Gm9aqNHg0tG4HbWrWerRfKrbO+F95DXQ1gdhmKgqHha16X6xOoJMHoMasaAmMAvM4Fsfz8zLN3LZepx3Z1RFIkTox5/hVf8mpsTyn1peI=
Received: from CH0PR03CA0427.namprd03.prod.outlook.com (2603:10b6:610:10e::30)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 20:21:14 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::5a) by CH0PR03CA0427.outlook.office365.com
 (2603:10b6:610:10e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:21:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:11 -0600
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
Subject: [PATCH v11 03/23] x86/resctrl: Add ABMC feature in the command line options
Date: Wed, 22 Jan 2025 14:20:11 -0600
Message-ID: <fd7284592b6d9c90376574d60d917119d9405ce4.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f9c8ccf-bbb7-4fbd-f673-08dd3b22518c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?57jGUH7XBn4zies4sdtpPZA53ZwGrH4uAGBV6scIcXBWvcwbLP0fhHggaty3?=
 =?us-ascii?Q?sZafLDqHhTG+1bcp2+WxjoYic0MqFkgAzN342PNFRCoDjgZvRxX90MKCTK2q?=
 =?us-ascii?Q?NAKNoLGtKkf0gFEI3Rr+Lq0qasfxRs7XV+9ZIp4TgP3n3h8z1c+blR25OuwC?=
 =?us-ascii?Q?5wVEz7dAhnOtHrIhdEEB+BUVCk3HM+MeJEvcQeUyWjkj0OBRVO/a67HYuo8x?=
 =?us-ascii?Q?K935AZT6YMf08KRs4npZCDpHj0t4vRtsSnJwPYcflY0bWmPqtI9XOrTuKpjL?=
 =?us-ascii?Q?QVztv48h9a7D66nv+f1FamGAwWeuBsSlr1SzYwX+/IkvUX3OpOLepEbN7KZh?=
 =?us-ascii?Q?jNuFdItZGW+qJJRoylAa0eQtXlsJ/3xZgNZncnELWrwXLm7GxYDDG2Boatkz?=
 =?us-ascii?Q?JGvD0CdhzzBM0S+uIjh6MHidzPE/ew5keNuJfJu5jdT0U5XopcTDdlXpM8vv?=
 =?us-ascii?Q?JhQpceFv3NeRVvUpDV0+Y7Yzdbw78UovF46bIQfL+gML3V5FHl/pWo2EceYp?=
 =?us-ascii?Q?T9pBsjWnTgvYsFOxJpEiyOgj1Lsyhif07IRriG4UFe8AQ9N7l49hLACjCIQY?=
 =?us-ascii?Q?gcee2mbsCpYRu135JSMfs07Ab4ONsR6RSlUKKL4D4La445VOqSsulYp138sE?=
 =?us-ascii?Q?ZduLte61V8fv1zM4TM+1J5aj0QQyBbx5sjWu0crlI8bP/51XJbwiPByNToYr?=
 =?us-ascii?Q?l73IOEUkObJgMWlJQ75ZozPuA3FG6cGW1LulYbE+2Vyx0LIDoyKIExd5tl+w?=
 =?us-ascii?Q?zL/nnVhE0yPJ8P59c3JygFt0ed4l9RUMZr7AaO/A2B/KRho7Q/2ms/RCJMr5?=
 =?us-ascii?Q?GeQxlDyGxW/8uRF3F0U6vpXFFgDvhbkU/SvkctBrpBuAfhGbbhHBxT5aSIgl?=
 =?us-ascii?Q?oXlrbnOOWVMySG2Y++Zq/d5iPOXCudQC5/rdrrlBwH86fqEKKbnkyOF7LK6i?=
 =?us-ascii?Q?zgVPbmIUy7dIMw/tOst+5mrd7L3m6ColUdvYCAUJpCIDnVBp6v6C5Q5Sjyr1?=
 =?us-ascii?Q?oY/MdvLieydfW4WOs93Zj8SFh2l6bpYPCmq1gEGvx6+jWx7ikct7zXuG4jTj?=
 =?us-ascii?Q?7LjXY62zFqPpJIgFF1DJt08PCr0Vxp29FYMOcE1LL7ma2v06b0T4SttWONUV?=
 =?us-ascii?Q?rHKjzEolTyGlvA5BKpr3P2VK//X2EeZ7jzsriXKchLdgKt1lilvePnudI8EE?=
 =?us-ascii?Q?Q12EIkpqV5sLnKwG/wuZ1ejTE4Z3DEMjG6YEAqc4SOJJiTT2AIusoY3a0KLx?=
 =?us-ascii?Q?Vs8gel/0Z9k5C38kWxmB0FtMHyeIbDWLriOp4ch6LT5w5ZDJ6Qk+lCpebHO5?=
 =?us-ascii?Q?LsC81OIrO0565ggeXlICfeUPtCO/0teAMiGsMb1dzVc2IWM/B0GMUq/Revhm?=
 =?us-ascii?Q?EMirwqD4HbAC1V9IUah7jGaRRWgitYaLgMaYf2gj/yf+7FdaTyN0+bPNdsQO?=
 =?us-ascii?Q?ZiIudTCX6rHDl7IOlU126Fwwa7BtLVwsKWXOCAJctGXT3E683oH/IXq11Hiz?=
 =?us-ascii?Q?AY8VFRVmNUUbJQ4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:13.7722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9c8ccf-bbb7-4fbd-f673-08dd3b22518c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094

Add the command line option to enable or disable exposing the ABMC
(Assignable Bandwidth Monitoring Counters) hardware feature to resctrl.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v11: No changes.

v10: No changes.

v9: No code changes. Added Reviewed-by.

v8: Commit message update.

v7: No changes

v6: No changes

v5: No changes

v4: No changes

v3: No changes

v2: No changes
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/arch/x86/resctrl.rst              | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 05f5935eeac8..154a93c080f5 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5854,7 +5854,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, abmc.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 6768fc1fad16..fb90f08e564e 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -26,6 +26,7 @@ MBM (Memory Bandwidth Monitoring)		"cqm_mbm_total", "cqm_mbm_local"
 MBA (Memory Bandwidth Allocation)		"mba"
 SMBA (Slow Memory Bandwidth Allocation)         ""
 BMEC (Bandwidth Monitoring Event Configuration) ""
+ABMC (Assignable Bandwidth Monitoring Counters) ""
 ===============================================	================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f0a331287979..97511cc132d6 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -811,6 +811,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_ABMC,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -836,6 +837,7 @@ static struct rdt_options rdt_options[]  __initdata = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

