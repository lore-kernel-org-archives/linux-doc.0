Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FF480350;
	Tue,  7 Jul 2026 21:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461147; cv=fail; b=CCAT9khBNIAq/fdKMSbYLKe57u/qAW3dSuDkxnTX4zAGXzYuVKJOGrbIRExe9Mll7Y1pXJrGdA+c8PqGGeFfHqGsNTDvVFmMsalUCs6xo4nxWlJqme+j50FyPyh9eezGDgcQLpNRhm+okoHp5m7c1Utb2Ip8VuffT8+Z3qfHqps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461147; c=relaxed/simple;
	bh=debDmZb0s9HJM34kZNanIXGZDmdHI2vQRGB05uDCu7g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTU333yG551h08sNbXyvrYXhbE9P9IfJWdtpDm2sVUIcltskt4VvCev93ImIVoEHkOuwOG5iBxyUVbCdKCFPRFByDpBy4uivQW7C8J7X5T278M069UCi3xK+v/rDO3hIY2kQyR3ag5whF7HCwT6660iGWcU/OSo3w1dK8y3Nmu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rZVjyEod; arc=fail smtp.client-ip=52.101.46.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rZVjyEod"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUp2Ro4wAT1sTHorQME5RpBjFyC8T3sBu4P3Z9mg8QpoaZwBQbSDZJN/Pn7hLA3IQgTFQiPJQy4HKUyhU5Q0rpPpGWycLndnaEmr92sFEwdxri9MV5KGVBNiboxpE4FVPwcf1+hMckUbaLfSs3MfwQv9R3ktdemKxxSbInmqi2Eu77X7Gn0Qc2buGhA/d3yvUacxDasl5wZOkA90kvDmc6qf2MsUGKP7iXs3CKPQlaA2Mp9kUhGT6TOT25JzWVSezJxijamZzBpjQFinZM3GM8i2xE5aTU1d8GrJQgI9bYQdKCP/5MVxNH0G1lZR2TDFUxaQfE2XpKgnltk2VvKRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rv5jDChLnhhHvyR3T2D9l2QG5/yg2Sa8MOV6xoE5xSI=;
 b=SdS/tH4edOfYXAMxyjAzw9HqBCcwRXXGv4bcDJDuNiMjxRGtD08jIa2B1MjxTkRceXeys/PQ1cfEgnSvJtUh+E4fOae9/pXZyV3acUYOO9FwoEHFjUUh0beLoZhvyHyyMHdny2zpEy5XbGJlkIsoWqz58+8383fHOMFHnJw5NakKp7VrDvSiW6oFDySoB9ikTEjY0ebPan0MmvOqXapovHpk71DpQ7L8n2Btq3yNhssrEKWAA5IjLu+H2GuXzYh6Bk7e7QIkc3odWAuhlO9hBvGISjRdpLDeMXcuAz8TLCoykuTtpo6+2Gk81BWF3UHVTDqWvt5RVmnLOFsSD/XaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv5jDChLnhhHvyR3T2D9l2QG5/yg2Sa8MOV6xoE5xSI=;
 b=rZVjyEodPg5IQrZD91/n1aZ3SaiiqCko0mgxfsFrhIzOxxy40rml23n0v11xNiOy/Pz83KPijbpncsfcqlXfGifbF3vaGdUTfQAGZ5SiVAa+d5g6L4G971r3Vcjx6UUffT3iBdgb5UQP54qY+x+t6TuTVvptrHTJbRXyDJpnkcw=
Received: from MN2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:208:239::19)
 by IA1PR12MB9497.namprd12.prod.outlook.com (2603:10b6:208:593::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:52:21 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::47) by MN2PR08CA0014.outlook.office365.com
 (2603:10b6:208:239::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:52:20 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:52:19 -0500
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
Subject: [RESEND PATCH v4 11/15] fs/resctrl: Program kernel-mode binding when CPU comes online
Date: Tue, 7 Jul 2026 16:50:12 -0500
Message-ID: <a8255414ef95dcb83b6eabbb210f45a17fec5c38.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|IA1PR12MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: cf494f75-7203-4dff-257a-08dedc720586
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|22082099003|11063799006|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+Q4i/yn6gPjHrdI89Y2ztZkLBEXa1g/T6d2b+wwaT044m9V+Yx+wAyU3xiMJTS+bMY+Q9uwxhnXOwDG3POxUm3fG5Z3Ido0C0JZNLNmvqDSqpiHb7otJajEsEObpBdJRiT2Pb3At5OP4lKLQBV/UKUSvXPnlNjPW+ZDs0UYKyp2cWeiqommNxKQ8+gkZc3St5llQ1vuFukn/uhGbRyOiMgAhKwRdWp6s2JBVlMUJ+zBfpeu5aPvk6w1UYBrbeQcSJauDykxNrZPM/L/HMOPBge22Yb8OEREi1KcYuo9WvgdZekoDbfYf6T9jKdequnkbO6yeAL/Gd2UDft1QFcnBGyZE4+6IvQLeVLF/WjV07P/Hrk948gsqOmmk5KHUEk0Y30e1aRBx0Cgas2q3t/J3BA2hWSQJmvgdCxluCaU2q6uJLazLQkV6eSRUbHoXbBkz5t7pYIyelrgr8ypGvWZaFFPpD3t4z7/Nqco96S4d81AfEbjzTP6GYXqYZG8fAxo8xOkD8CgolWXRzCnl/H3co+CizPQB7VeS6HRGtxDCrWExX5MXx5ypmNFAqaX4W90qcXJ07+oAEibQFIe/UBKZbEwLUcYZlOhJnP0gtaXNEkWbhAvum3egXi8eY8EsW49AoZhmMekLFguoA9jCkHyPeSexwGt7jqxorzmPd0zU6JRFBTUr86TSzKwB5SrjkytwDbbA5SUX0iZ9LWRZmlWvXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(22082099003)(11063799006)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VoNCDsqmGnRIYiHWoDc7SFZw870w8QKrHvpKOifII3k9ahnPnmR/JUsI6QPKqwuEyioBTlfyksqGKJHyWGxauePbDDvV7vUVY58w3oBjR6ykfjGyxheWpFKsq8+EuXqJRiIkfWTJOm8gYdd+cDvmlrdugXM9qgOxYOrY+jtREW2w0Gx24bV54mYel3k9Kv9dGIn/2sE4+eVD5jwVuIizINecg9BexVjzOxC0JB0cduFvD/22XYtBWAgDpxzNjDG39AJWPdSXGwq8F/z6fAPi6UzUta9g6YsY8JAnKmWK1g0Gv59EmC/09C76ec0vvZVlCMMrM3TGUhGSLl2JJG8drNk00UZDwEYkhGY/4PC2KwCYeJWO2ADUkb7crEbu8AMR5xdPnPR0O84Es4+N4+CLtl0jXE9xo2HKyYw9jqw5t72/EeqMPZU3ud8veNDN9r2o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:52:20.9522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf494f75-7203-4dff-257a-08dedc720586
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9497

Kernel-mode resctrl associations are programmed per CPU. When a
global-assign kernel-mode policy is selected, all CPUs that are online at
that time are configured; however, CPUs that come online later are not
automatically updated.

As a result, hot-added CPUs, or CPUs that were offline when the policy was
selected, can run without the active kernel-mode association even though
the resctrl policy is still in effect.

Add resctrl_kmode_online_cpu() and call it from resctrl_online_cpu(). When
a global-assign policy is active, add the newly online CPU to the bound
group's kmode_cpu_mask and program the kernel-mode association on that CPU.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: New patch in the series. Patch taken from:
    https://lore.kernel.org/lkml/20260611111706.1981788-5-qinyuntan@linux.alibaba.com/
    Updated the code to enable kernel-mode by default whenever a CPU comes online when
    one of global-assign mode is enabled.
---
 fs/resctrl/rdtgroup.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 21659fd75850..413d3ff14546 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -4722,11 +4722,40 @@ int resctrl_online_mon_domain(struct rdt_resource *r, struct rdt_domain_hdr *hdr
 	return err;
 }
 
+/*
+ * resctrl_kmode_online_cpu() - Configure kernel-mode binding for a CPU that
+ *				comes online
+ * @cpu: CPU that has just been brought online.
+ *
+ * Kernel-mode associations are maintained per CPU. When a CPU becomes
+ * online after a global-assign policy has been applied, it is updated
+ * with the current kernel-mode configuration. The CPU is then added to
+ * the bound group's kmode_cpu_mask, and the appropriate association is
+ * programmed for it.
+ */
+static void resctrl_kmode_online_cpu(unsigned int cpu)
+{
+	struct rdtgroup *rdtgrp = resctrl_kcfg.k_rdtgrp;
+	bool assign_mon = false;
+
+	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON || !rdtgrp)
+		return;
+
+	assign_mon = (resctrl_kcfg.kmode_cur == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
+
+	cpumask_set_cpu(cpu, &rdtgrp->kmode_cpu_mask);
+
+	resctrl_arch_configure_kmode(cpumask_of(cpu), rdtgrp->closid, rdtgrp->mon.rmid,
+				     assign_mon, true);
+}
+
 void resctrl_online_cpu(unsigned int cpu)
 {
 	mutex_lock(&rdtgroup_mutex);
 	/* The CPU is set in default rdtgroup after online. */
 	cpumask_set_cpu(cpu, &rdtgroup_default.cpu_mask);
+	/* Program any active kernel-mode binding on this CPU. */
+	resctrl_kmode_online_cpu(cpu);
 	mutex_unlock(&rdtgroup_mutex);
 }
 
-- 
2.43.0

