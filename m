Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F48422550;
	Tue,  7 Jul 2026 21:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461061; cv=fail; b=r4Te7/gmaUr7xDnXcy0YstFfUk7ysJ08G0+AQHpQRvCItkVy4jNnKl1MIq4mouezVmo09ZR1miQUVTPlZRCZUOaR6A3zH00BNOUa6zzcaWAFKtZ+mDWfpenWEFPfUS1Ubiw0PnXaeNixOVbdM8X2AzL4bjAvbQBjg91JlBmbth0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461061; c=relaxed/simple;
	bh=PBUXBfkgxDudXoTLRSNERHeTNuxXnW/7T6iNryNM1ZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ChBlQnpoVMcO4OQ8JiKUftiA21u4LUA8b8m2JyHMDXIbx+QhGNRq688mrAv0GLAzlsEubBJLvIvoitxu4/X+/5bo7gSopbgWCZFoxcWaX+OTiyR7pjlTFi++cDWgajb1Ih8Ympc+nGT0MF+BRaQbJHR6SKxeDdsPe3i6ndRhSRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wWI0oRN7; arc=fail smtp.client-ip=40.93.194.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wWI0oRN7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfkN0LpkQN84ztskJmeWgOmuqVqnX7RWkRLBj997hkc2zXdynbQ3B+iZRPew948Eu9zPtJaBVIqLBJyUGaelDgW5GUvuncLCf9Qq1LEnLBk9miXgr3MyeX/K43ZMTLVAU5mojm4eI81mehHQBQ6CkgHWKtHEdP2DhJyvdjnEFFJ4TVQusC0K37Pa6O6ZFVLbVf/rtUcotZ1cyxARWl/KSFDeJGNr0zOJMhwy+btrTg+Xh7vX6pC3ZuF/MJw9IWpJzu+VhXK0YLU4q1hOOXxBIgKpz9aw7Q1wtm69+eP38epEpjNb0pBWNT/NZae4Kw9/TJCEqaqy6h6ZHgZLdSHeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/N1/eXV41MlyZkPVKiV/r4Yj1OYEXfjD0P7pD9IVBA=;
 b=vjUwj9Bi6AoMKjkr8mVJheZKlPNavVrqzcK67OgqE4YJyxfF0FZKRF9x5MtGczTP5R//uki1xz69MtRtXWITGyRL+0+PRg0s8Aut6T3YIe754UMkP3RM8C91RnCBw/IZmzvH/xIu6Cbs1XEFzk7YL8UIVN3riIigv+Urg/LFB9RPC/yIRROTyNbtuJb6j8MANXz2MOeLHZmxjtA9dSaP8EWcYWDqiNfhnPObqKthYqhm9nSXFvFwls/SVCjbUIYnOdpBl3qLUmYG+QkA/uMqcFASrDQhfn2h1sWSn4dYTdiVIggnL9LqnYKuWyB87V1hNkaCoY6qgDTmXRq65AoDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/N1/eXV41MlyZkPVKiV/r4Yj1OYEXfjD0P7pD9IVBA=;
 b=wWI0oRN7O64wDILpuZl1Xr8VP3AD9HpaCEQZ2hftm6LT5Ix0oZaW9dCNGDmidSX96RrRb2ZefyjJEErComSfMPHdDLDAJn53bqlxLoNyEW0eoLFeIP+WIBlEGFZor1YTYd35OIbrQ6xrKh0hK5ENiSHCSBNFeDpdoyoD8pSDYvU=
Received: from BN0PR04CA0159.namprd04.prod.outlook.com (2603:10b6:408:eb::14)
 by CH2PR12MB4231.namprd12.prod.outlook.com (2603:10b6:610:7d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 21:50:53 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::3d) by BN0PR04CA0159.outlook.office365.com
 (2603:10b6:408:eb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:50:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:50:53 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:50:51 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
Subject: [RESEND PATCH v4 02/15] x86/resctrl: Add PLZA support to command-line options
Date: Tue, 7 Jul 2026 16:50:03 -0500
Message-ID: <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783461016.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783461016.git.babu.moger@amd.com>
References: <cover.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CH2PR12MB4231:EE_
X-MS-Office365-Filtering-Correlation-Id: 3662d55c-adba-45e8-636b-08dedc71d17d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|7416014|3023799007|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	1Ks5XtKayEIJM2vAULULaCI11jcfCZNRF00m7t2PbpTSaGPb+NwPmnemqdV4Bv8vHaJLmKHL9UNoRTkLlC1lrJYW8jZacKibKvZe5z3h87Jn+oaoNOBCcnHVxq709cwKIH3Z+t1ug+UrhyBikYVH235/P7Lci9ZkaSVyiOKorPOb3O45sZhqR4IlP0rJYlP+U03onaXxk6Xsb31YQqihX3yiMtrkeKGSSeJ+VwbNQNZUtBXhgKIV5+gUJtxr7EKA/VX38c2Ph6H9by3+4+/8Sbz4MHsaEOH5zTJkl0ayX7Yvf4bXhPBYLU6x404hbCWVjBjjsLVjNaoT7j3wSrOkrGTTyF5kgpEPGSvkj9tM0G59W+Hpd1z1uOkQwOt753EsFi2/89v3SQSssXjdMAcA8LSQlgrvDfbcEhxfInxfKslNfC61+TgBRdNFH43khzA6vLdqawh0OeBpNGRl5dmGnRKVNvh8wEsPlKghnWZ3CMa6Dfsxe1Q/AnuHYpRpHIV/LDNzrmrCj7Wdf+XgjG/gkl0+G5wLjPW3pyQ33Sp7r5NsM+igXiO9JbAz7CQt2p1sAKhbPgGwNvmrUSp6q1c2CZp1VEI6Fq6JoCAPkEEdb7WcrOIobmlwyRhmE8jK1RQcwXKDpFwKIk5K47uB1UFZExdIH0VQ8rhLiM5JEwp693Ujg/ntyw2gJnyk1EOVyxbsQkUygZM+sy9J3Y2HBkt+lQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(7416014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R32z/H5VqJIPecV6sagUTs7hZhooJUzAU0vn6OQblMDqelooz+na0NAWmccfL4Br3HMfD0+ILzxDnuNcAfXgbuGka/pEJUxvHVeMGkMpqsKMfapO8V51yUXeumc8RD8KwK+AnVFu8yE/R/6R9MiYmizTrCCLxzLmABv/oEZICOBk+PNi3u+gRw3j2JC7wtlC3JOuJpFwHx0JmpZ7DAhSgAijWI+ztokMKhhyg0h4ItSGw4HLquRn4n1uanVJPIBUohQnF0AsFuDJaPEGGhP3CNHsoNyg6TOYlURI1lugpbMJ3oI+NOrPNr5YuRggIO9YCT6Jgz9Ws37cVz258RFkhqQ1pQPjQ3hd5uCEn0R3E0ORk0qcQOuuBC1tgFgXtPvkCJfj3zeS5ad7ed3CDxbnndO44Ff3z+nbZOhtAERu8/tteAAogrIVRKLw4H1ZUN0W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:50:53.6824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3662d55c-adba-45e8-636b-08dedc71d17d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231

Add a kernel command-line parameter to enable or disable the exposure of
the PLZA (Privilege Level Zero Association) feature to resctrl.

This allows administrators to control PLZA visibility at boot time via the
rdt= option (e.g. rdt=plza or rdt=!plza).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Split the patch 1 from v3 into 2 patches.
    This patch contains changes for resctrl subsystem.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/filesystems/resctrl.rst           | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..1de27055cb32 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6401,7 +6401,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, smba, bmec, abmc, sdciae, plza, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..f3e941404967 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -28,6 +28,7 @@ SMBA (Slow Memory Bandwidth Allocation)				""
 BMEC (Bandwidth Monitoring Event Configuration)			""
 ABMC (Assignable Bandwidth Monitoring Counters)			""
 SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
+PLZA (Privilege Level Zero Association)				""
 =============================================================== ================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f452e8ce4cef..27e09cded829 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -803,6 +803,7 @@ enum {
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
 	RDT_FLAG_SDCIAE,
+	RDT_FLAG_PLZA,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -830,6 +831,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
+	RDT_OPT(RDT_FLAG_PLZA,	    "plza",	X86_FEATURE_PLZA),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.43.0

