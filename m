Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010047.outbound.protection.outlook.com [52.101.56.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D037D47F2FA;
	Tue,  7 Jul 2026 21:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461104; cv=fail; b=FxYBiUlKJtgS+qTWxMpsEnNbkOkfZPxT1gmSWLfXSYo3Jd6NpAmjz0O/dwEFA0y5HPIXFN+x6OV5TiYIJKPWMvXguJ/4oy3lBLbZSwVKbACuX3U5LEz3+cMHbVRACE+8UTtQBrDKeCVU4V8sh816GKsgvKkW0ZUhhQRwoP7SKKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461104; c=relaxed/simple;
	bh=QhxPJPInBGY8KdahsNCoS1nUyc+fxb9Lxms2Y4bGook=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=exBAQiV8GP49PzUACXZckHLBC+Q5+/90ZKgpyNwJhg9grMS+5DGIoACnkAmhTrDb6GL7ZLgPfwyAxNvlybDu57xSJisuwxoGtWkT8dZ1sKPJ4opa/hOauHNwndrVYNFL22uVv15d3vzwDPA5dmPUV3JaWNKx6bj66PtCsp6rEl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yaw1VdcW; arc=fail smtp.client-ip=52.101.56.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yaw1VdcW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd1IVsw/yeVX0WqBjyDu8tO4Myfv5demxMhZzHbNnz0SZrTGWVie5MB9GoFIXe8Py/Q2jbqIrdp4vNWuaLqbXjbMIvAxZ/AAvv/wFqxTtNFFyiFmLzo/t1ksnX6RG6KFsJuHwid3v89cny8za9SBeLMt2Apl3aU8E5a0feLakC+3o7PJU2lwgVu9xmdRcRFzLWwlwAMK0yxfnHVRmnlheDDYrzPLTBu+ZCH8nK+HBGA3kI/kgPWA6b/rEakWvMvKjA+HanplC9eLWUYCglhLmHv+JgJYMnJqsMRayqsPRmth/gJUbGiHn2l014mGer4/tb6GnvhJO7rAgA/k2FPCow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2Cgs1+joqhG/adWlAEDwVlblZS44+8mgNNcrhSDj8E=;
 b=BRj3GeWMPGmDafUXAiVRFnJ8gv0vpiV2K0x5beHQP6hgWrBmFohrWp5T//p/0r2vdskGkLxWwEBD9R6exoWycTo6aq2lRKruJFjOMipabax109CcZcGeA4lHSkAki9zSCju5pvY+0nu/y5cxVP7IjfTkFwdGchm39lFifvD0SCssaOEy36/4VXHDPsJCYvD577e7m2V79tROZp7pxT7xcIV3nD5aMnUQMvGpVQaS1hsltqmiKD4shHaf50mDhamQDixdRxjUPhTJsaq8MTs2iAaneQvY2OzFlDRUdr9HKncKht5JCDyZpjgBgQa5Pi3L3R4mRZ899/kGFwr0tBQCxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2Cgs1+joqhG/adWlAEDwVlblZS44+8mgNNcrhSDj8E=;
 b=Yaw1VdcWptA0JHzR731DKZ848g+HP5P1TN4vVkOgjFisaraOuJbzo5EO4fnLb4BlVZgBCIJF4kHKu/OZZvArFKwZCbPbmN/6eE3luj1ge5QeZVhuNFKMuF1xjhQgXdyNCg/UI9H/H3zdIiFkLbmHYFnMPGRzNMvM/2voNz2mEuA=
Received: from BN0PR04CA0155.namprd04.prod.outlook.com (2603:10b6:408:eb::10)
 by PH7PR12MB5806.namprd12.prod.outlook.com (2603:10b6:510:1d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:51:34 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::52) by BN0PR04CA0155.outlook.office365.com
 (2603:10b6:408:eb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:51:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:51:34 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:51:32 -0500
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
Subject: [RESEND PATCH v4 06/15] fs/resctrl: Introduce resctrl_set_kmode_support() to initialize supported modes
Date: Tue, 7 Jul 2026 16:50:07 -0500
Message-ID: <f4926d9bc70261ba0245a1d1158d8bd3d09bdefb.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|PH7PR12MB5806:EE_
X-MS-Office365-Filtering-Correlation-Id: b2404de3-9e78-4f33-50e6-08dedc71e9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|7416014|18002099003|22082099003|13003099007|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	8F26Gw/LEbHvRBtc2Cdp6F/4F/l2CL3ir5otAsBn2E8UmJeXuFnaIN6ajzX3VL+9b2d/7/xTxrbwVnoLDnkxceKfwJodpqct6XpfYBiKt3osSZm36a11oY9VZW58xAuND3ALwcYjK4uM9dAmaXAmYIMrOG9EYtnKJwAubWQ7U56Bs8eWHmE8YHQETzdqm5RCJA4L5LUpgPuZ5x9hAh1UYIqV8YDQTBFhFjqekuPpYrbIGKwcUdDFhV39jVFAdjWvIm0KAPoE9EjIe1c4O8x3eBFslcvcRuJw/dI76qD/4jbPVTmwLMnWdozEeFpQbNZpfJBe+fzrFLfQwmePTWha7D6NYly8ryyOYgCZ82vwon6nhl8JwhFl5wHzUr+o3mmOt0T9I6lCIy3Po+kbj+22lNpQty2k2PxcOXYBc8J7HNVH7RnCy1hC5FUJFDu9707/hANsB/SIXGcBaV1fOuqU6ZghvMeff2gI9fy0tH5DBfQa1PGsXrZQ8sD+YQdRkoWjaHltDC8D7st69JysIFsz/BO2dKyqstag0r0aFRDjXs9Gdi5aRz4tEb5S53F+FQK0HgRJbhFRM52u1t9ZC0MggIVpaY7tVL8mGK/pokooAEl2DPtwBGRqUKvl1G8GoxN7i6PdP1D2tXJnq53xGyaT0nTacP45pEaBG8+stpaN0CmgNsLNJ6chhtSsFDdW37tH31XH8AqWPAPsYrM2IuLgbg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(7416014)(18002099003)(22082099003)(13003099007)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OmfXw5/8wHrfzYeim/9GuoWScwduJaOQB1V0NLwSRal/7wf+7Avk/R8DLp4xN93BlIk8yFD3TNWUO1N+4Mx9cjvOSx+H4BP1+EPFKrnfA2R6GZY9AuuycOdXFd7goC/JSX+8niYhrabZ2AZpJb3DWv3QdyYF2QbtcLk9lcy5MpgcGvHHtTf+HjPMQy5jX8ecIdDlsXs4c5ACT0m72jUHY6U9kwBC45O4Y1uVn0MbqAAFvX8XLwE4a2kOWx6SPfK+7gTad9aaC1Bp0bpU5d4gWSi61AmOJwvE6f72Z6HauJSR3wpsjJztCjv0RrkAcyP4LD9cf3cuSCDMs/LryKgRyvj3xnThMWJz8xFRNDYiO5eU3x5iZbTc1at7y3ohULOwUII5sKcNBWdvCksC+CoOrf/xEAQkzKalqB9nsKG4X61J6pS0Grz9O0+j2WyG5k1m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:51:34.4066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2404de3-9e78-4f33-50e6-08dedc71e9c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5806

Architectures need a way to advertise which kernel-mode resctrl policies
they support before generic resctrl exposes those policies through the
filesystem.

Add the `struct resctrl_kmode_cfg` to define the default mode statically,
and introduce `resctrl_set_kmode_support()` so architecture code can
register supported kernel-mode policies during resctrl initialization. The
`INHERIT_CTRL_AND_MON` policy is supported by default, so architectures
only need to register any additional modes.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: New patch to initialize supported kernel-mode's.
    https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
    Changed the kmode_cur to enum resctrl_kernel_mode in resctrl_kmode_cfg.
    Moved the resctrl_kmode_cfg to filesystem code.
---
 fs/resctrl/internal.h   | 12 ++++++++++++
 fs/resctrl/rdtgroup.c   | 23 +++++++++++++++++++++++
 include/linux/resctrl.h | 10 ++++++++++
 3 files changed, 45 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 48af75b9dc85..178126bb2da5 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -314,6 +314,18 @@ struct mbm_state {
 	u32	prev_bw;
 };
 
+/**
+ * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture
+ * @kmode:	Bitmap of supported &enum resctrl_kernel_mode values. Each
+ *		supported mode is represented by BIT(mode).
+ * @kmode_cur:	Currently selected kernel-mode policy.
+ * @k_rdtgrp:	Resource group backing global-assign modes when applicable;
+ */
+struct resctrl_kmode_cfg {
+	unsigned long			kmode;
+	enum resctrl_kernel_mode	kmode_cur;
+	struct rdtgroup			*k_rdtgrp;
+};
 extern struct mutex rdtgroup_mutex;
 
 static inline const char *rdt_kn_name(const struct kernfs_node *kn)
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cc9966ff6cdf..0ee0dfaf9065 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -78,6 +78,16 @@ static void mon_put_kn_priv(void);
 
 struct dentry *debugfs_resctrl;
 
+/*
+ * Global kernel-mode resctrl policy. Architectures add supported modes before
+ * resctrl is mounted; @kmode_cur tracks the active policy after user selection.
+ */
+static struct resctrl_kmode_cfg resctrl_kcfg = {
+	.kmode = BIT(INHERIT_CTRL_AND_MON),
+	.kmode_cur = INHERIT_CTRL_AND_MON,
+	.k_rdtgrp = NULL
+};
+
 /*
  * Memory bandwidth monitoring event to use for the default CTRL_MON group
  * and each new CTRL_MON group created by the user.  Only relevant when
@@ -888,6 +898,19 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * resctrl_set_kmode_support() - Advertise support for a kernel-mode policy
+ * @kmode:	Kernel-mode policy supported by the architecture.
+ *
+ * Architectures call this during resctrl initialization to make @kmode visible
+ * to the resctrl filesystem. INHERIT_CTRL_AND_MON is always supported.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode)
+{
+	if (kmode <= RESCTRL_KMODE_LAST)
+		__set_bit(kmode, &resctrl_kcfg.kmode);
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 /*
  * A task can only be part of one resctrl control group and of one monitor
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 47db34dd167e..8dd02579f354 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -734,6 +734,16 @@ enum resctrl_kernel_mode {
 
 #define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
 
+/**
+ * resctrl_set_kmode_support() - Advertise a supported kernel-mode policy
+ * @kmode:	Kernel-mode policy supported by the architecture.
+ *
+ * Architectures use this during resctrl initialization to make additional
+ * kernel-mode policies available to the filesystem. INHERIT_CTRL_AND_MON is
+ * supported by default and does not need to be registered.
+ */
+void resctrl_set_kmode_support(enum resctrl_kernel_mode kmode);
+
 /**
  * resctrl_arch_configure_kmode() - Program kernel-mode association on CPUs
  * @cpu_mask:	CPUs to update; the architecture applies the change on the
-- 
2.43.0

