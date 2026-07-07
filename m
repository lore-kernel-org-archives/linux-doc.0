Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0B847F2F0;
	Tue,  7 Jul 2026 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461138; cv=fail; b=LgNQMOD2uJwEL6HIQwFKuMDGYzdSu4MfyXlIPlWseHaewfND5wQJ7ClTaqaFw8RTlDetwQKIxcRSFA1Zt1+yRbWe8n6dTRItUX+DtDr8VB9Qd2MrVP/N9Kg6E/PRpZAtF22rSm8C43ho9Irx+r8QBEM/iXl6n09oFfDyqEz2DX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461138; c=relaxed/simple;
	bh=j+vKitWtL6xe/OrT0iNbvLn1A3t4Ht+WzoRXOj/I0Qs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObWuXjS0HWhKmtziJxX9VpFtt2EeHrQEPwzB+qCEQF1//bAKGxnV/3smnjc/PvI40PaUWlE4xH9jfl32FP4cT1n5W3VdQNMcJDP86XiWG6WFDy17ZanW6re440oV3imftssX3TPnM/uC8LWz9sazVNMFJyV4YwBXbO6GkbUQZHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2CZolv6F; arc=fail smtp.client-ip=52.101.62.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2CZolv6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2zfsVV4rqNZkcrRukVioTWnVTvPutFFwVLFWc5lWQ4qjnzdK7XTGxtwxvJ2kDbfG4EqFIu+UJWZGSoqQlDIjK12fdehhaBaD9MsNgWXcW5o+Oig93Tb+Qanru/E6c80emejkIiyyua7FSn96N/I0E0m+I72hj45ba9thyuWdrAZyMRlgAy4L89fs6yQRSToPw0GWy1vdlMJPmLEnsdBVGspWmhYce8sVHzK33nQmLQ54/VFMadryoCAxgv7J2Ip9hbM2khHNfyVF0QP88R3uWmWW6xU6cIAuhAPqXC58pDDqomBDQlEZclolji8mVxjNAUP43YfyE7Yg6mOJXEIeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krRYiv3lxLFDBJdakiZyZ4TzWmEDcdUe8nfltEGdhMc=;
 b=lo3xZ0Xly69AN07HlWQEAEll6XI4Og2n5aWIh/1+EUwU3y46HF5W/Jvcq9jpzVfzdmW967GIPIgRinmzDfkrCFFUChKxhNSDF24m5COrB5ZaAk+qVCyaawiR71cbw8fifUBbsOrVYBE7r+84nNgVSeZoFPVqWkLsJXHINmUceLJksyzxCsH4C1KX42PNrrSehq2QlwJcfTEV8VdyZoWOqY1qgnruO71GlIMx/LUdf8dqj2uK7x5iZeifYCsRpQne++lTGhAmnEJP7xTZ8L2Y2d7c2rZNHsRNiAN4oeQbAsQY6VXaI5Jo1dJRzX/ck3QQE9q8dwQAZtuBVW83iWZyUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krRYiv3lxLFDBJdakiZyZ4TzWmEDcdUe8nfltEGdhMc=;
 b=2CZolv6FcdmJ9Nl7IvpFnMqaQZblMBfT+v6jR/awtlq48IW7OEF3ZE6+XB77It2O5lJ57uUXqQedEWRWaPtb8rGUZB4uEn1UvlaBtCB6wFV3C0C6Oi22+PqLCiJuezNoORf3TR1uvsGDr16VLmCDg8WZcp+GMvXYr6IbAPwrSxA=
Received: from BN9PR03CA0269.namprd03.prod.outlook.com (2603:10b6:408:ff::34)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 21:52:08 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::9a) by BN9PR03CA0269.outlook.office365.com
 (2603:10b6:408:ff::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:52:08 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:52:03 -0500
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
Subject: [RESEND PATCH v4 09/15] fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
Date: Tue, 7 Jul 2026 16:50:10 -0500
Message-ID: <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d92607-ee33-49da-6d98-08dedc71fdd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|23010399003|36860700016|18002099003|22082099003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	LY2h+dd4zcvpmq1co3nOeBIB6mdtszRddg8EqVfQgFbU2SZVeuoV7ANa6bcMzmudIBBY77SP4qZDOfpZlWV08Xx3jvhc/+AAJQtISYOko3q1vOO9F3pvA5+Z1Zy6Ug3V/W+us/vMxSCuMXcyAwyu2FpspEn9jdXVdW0NIOcaAp2uL5+Vdkz8dIkXDgRBvC+5tKG0XmZzwHBoF4/WydOEnDD2iUOygudkj4AptyNAbGvpDBVy79//Te94ecFkU3VwkwUisiKOpIlIwRJtZS9dxXFovWr9Bs4lPNksT5+HVBk0toAmIjjFgfAH9QVRD/affXEiQRt7gspp0mfg25+OsMMjkfT2EpJoFjF7HtYerw2cjsriHUQnVU9VWfkvwGodAcSWqo6Lmfuo+Nbi66GY7AaWhWMg9F+3IR9z219lnhIGF3tQ/RwFM9NtSBDmDU7g1fE8reDOKxJuthgSz4ZHElf6qDV5/DHie+1fY0cSgHeBWKM0GAs4G2i8QqWDUvZxsrgvzF74sayzYUVKe7m0OnJKCtXKc/k7hLLeWrq6Ps9JA4qfcPxVN19gzD9elrygAIoUAXiCHyxWlFyXIGCA2WWtUuJsBq97iZHoQpt4suVfVXNkgy2V2i2dITAuUIqBhnn62xMJwtwy4ty5yWicR1+gcsReIPcu0zdP3ZEi8WKdRZgIHcGL32uso6r8MDiLj724qYTIZpaUAYWneO2AwQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	F4Tu9UWISQRvNdL4nqcdCeXOAmyEj0nGLjXzb2b0IwXJ/IW2vTyg9u7flp6kJe9nkbq0iM8o+ewJWBh7c2xpNOy+3c88c6hBrYdlOmZRo2BTJIPm4Zu+lYSVfecgWhe8KtpOH4aISu8VdjDIFmBhTSLyY4sc8Rqe2vuM95ElQTYgSOoo8KztCMoTm/69s4TODYquOF4WDFHVfKAzEZqxhl+5BuM88HXn3qKNuT3Yxmx9PihtdkczaRX/+9I3WM9Ug0bnpSKr+ncn7tQa5UvpD4ElMF9O4gqBZ74tK/5hkYQO2IFDOgEtnUZkM4CIvYaj+dhPUwRHGLMvEtgfOcoxr2ycUg2OxpgKGbYirXS66yos3eTYLgs37v2grIJnZE8SkDuetm8yOkWUPS97nZaWkDE8VFqcs3nE6kWzZLWRVSqI0YP+m9fsfNXpsJgXxXnp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:52:08.0855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d92607-ee33-49da-6d98-08dedc71fdd6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

Kernel-mode resctrl policies allow kernel work to be associated with a
specific rdtgroup, optionally restricted to a subset of online CPUs.

While user space can query the active kernel-mode policy and its associated
rdtgroup through info/kernel_mode, it currently lacks visibility into the
CPU scope of that binding.

Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.
These expose rdtgrp->kmode_cpu_mask in both bitmap and range-list formats,
consistent with the existing cpus and cpus_list interfaces.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Rewrote the change to be generic.

v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 fs/resctrl/internal.h |  4 ++++
 fs/resctrl/rdtgroup.c | 46 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
index 178126bb2da5..12db6933bc54 100644
--- a/fs/resctrl/internal.h
+++ b/fs/resctrl/internal.h
@@ -216,6 +216,8 @@ struct mongroup {
  * @mon:			mongroup related data
  * @mode:			mode of resource group
  * @mba_mbps_event:		input monitoring event id when mba_sc is enabled
+ * @kmode:			true if this group is bound to a kernel-mode policy
+ * @kmode_cpu_mask:		CPU scope for this group's kernel-mode binding
  * @plr:			pseudo-locked region
  */
 struct rdtgroup {
@@ -229,6 +231,8 @@ struct rdtgroup {
 	struct mongroup			mon;
 	enum rdtgrp_mode		mode;
 	enum resctrl_event_id		mba_mbps_event;
+	bool				kmode;
+	struct cpumask			kmode_cpu_mask;
 	struct pseudo_lock_region	*plr;
 };
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 346aa4df62a4..0d5c94169d03 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -392,6 +392,37 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/*
+ * Display per-rdtgroup CPU bindings for kernel-mode enabled groups.
+ * Supports both "kmode_cpus" (bitmap format) and "kmode_cpus_list"
+ * (range list format); the output format is selected accordingly.
+ *
+ * Returns -ENOENT if the group has been deleted, and -ENODEV for
+ * pseudo-locked groups, which cannot host a kernel-mode binding.
+ */
+static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
+				    struct seq_file *s, void *v)
+{
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+
+	if (rdtgrp) {
+		if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
+			ret = -ENODEV;
+		} else {
+			seq_printf(s, is_cpu_list(of) ? "%*pbl\n" : "%*pb\n",
+				   cpumask_pr_args(&rdtgrp->kmode_cpu_mask));
+		}
+	} else {
+		ret = -ENOENT;
+	}
+	rdtgroup_kn_unlock(of->kn);
+
+	return ret;
+}
+
 /*
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
@@ -2181,6 +2212,21 @@ static struct rftype res_common_files[] = {
 		.flags		= RFTYPE_FLAGS_CPUS_LIST,
 		.fflags		= RFTYPE_BASE,
 	},
+	{
+		.name		= "kmode_cpus",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdtgroup_kmode_cpus_show,
+		.fflags		= RFTYPE_BASE,
+	},
+	{
+		.name		= "kmode_cpus_list",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= rdtgroup_kmode_cpus_show,
+		.flags		= RFTYPE_FLAGS_CPUS_LIST,
+		.fflags		= RFTYPE_BASE,
+	},
 	{
 		.name		= "tasks",
 		.mode		= 0644,
-- 
2.43.0

