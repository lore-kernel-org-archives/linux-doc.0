Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32D3B0AEA;
	Thu, 30 Apr 2026 23:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591614; cv=fail; b=uHb9LBFyHkD8N9HrPjHWCN5wW/iOARzyt4uQJtG45+sE11UjeWA+PgUN9u/1Dxn1G2fdOz6m88K1Y9GQsGQKtTWWxD+7AgJeyxP3EoKTsRbmgizrfaCoMSH80B6eznKFEnyCU8xBFxsRq5KjZPaIZ6owg+c3kLgbmZzLq4Xbif0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591614; c=relaxed/simple;
	bh=BQFVnqoPkeE7WYDMODWzEDt1iDV7DFCXt2P++YKo5es=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E2J16bcIu4pxT9zxBpbc+b5ClqtYg52oSd9sJhw72mixXpvMpqEXV8Wz6LQRS0qJPTxdLVqqEO3exnUhTXBJWeDty+vO2th0RE4Y2pZxQsYPHcnOy+dAu9E6ce/+AeH1fdCsMOSOFEpxCX4Kxz56LpGMHk6pPmZLwPpmNhEgVzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hXYxgSLX; arc=fail smtp.client-ip=52.101.57.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hXYxgSLX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGt3Y5b/v/XY19f3fDhQY/lX1YG6LuoU+8CFdJF7gFBxJdok1TOpYeHwB38otXCb8HZU8qSfCGXCY7/w/cvRN7m5lov6Hh5hbZe0pfzEn551y3D7PwZX0GvI6lfTtpAcnLS8OSM2knA5PXsMa+D1SpOZSfuWlkVLoN0KuhHO7dSn6UXfoH8K2GWuOUCW3w2Ty+27o8kxaAnZffouumqfmO0gvg127LJdB/z1iW9/V5N6J6auacyd8WHJGKxMF90V9mpGaZSr1ZyMZMYCrf73h0OowCMWopxVjW5SEhrRzGRhk5A9tIU6WJkgNaPBOA8ntpFzm6cMHws8YyyT4plqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Io8Md5wsMSq9W5OHrWDmtXFjqgrzG2A4XN6yJ2P+EvI=;
 b=abVV42fQvWoXVTe/VZgL+BAnElbpIdusIZTFj5H8GzzuRne9At3BO4iZWOmW7vvwJT1qn0ZsWe0QAbtZPEXoBSQWOn0r2KAhW3sijNu8LRsr0/YXG5+VAVNYWAoU+74dOrh2WoLQFdbxDl4rCT26cGHk5kUtdz9QMQzEPmlGt9DeO4+m+BPZQUJRGxo4x57VH6Hc+D17uyHu9VEXrTvzqndz7Wzfsfv29SVZcbflWJoxEnMfVxW5bF7bZIVMcQemjzMrnE4x3dZ+rieIkaOmgSrWCCl1BvEjSAzv/kEgnkQ6k0Mc+hI8N0hadiDYhmtJGfdUAqbvlDxNvGw42cMeaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Io8Md5wsMSq9W5OHrWDmtXFjqgrzG2A4XN6yJ2P+EvI=;
 b=hXYxgSLXlQH2F5j4p+sKCPdEld+i5a7sNU50joiMzFBz0KMRV2maRHzO37w6EnjAETWwib6YFkLtX4Jmz8lYqzsw0TyiXqaClifj1VYc0SWux6yMpdQi9yPOzvr7cZjcxf+zBNr754OfQs1wXoDxg3cc4TmVGZ7PuzjsMyVqo9M=
Received: from SN7PR04CA0227.namprd04.prod.outlook.com (2603:10b6:806:127::22)
 by CH1PPF68E8581EB.namprd12.prod.outlook.com (2603:10b6:61f:fc00::611) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 30 Apr
 2026 23:26:42 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:127:cafe::97) by SN7PR04CA0227.outlook.office365.com
 (2603:10b6:806:127::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 23:26:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:26:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:40 -0500
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
Subject: [PATCH v3 10/12] fs/resctrl: Expose kmode_cpus / kmode_cpus_list per rdtgroup
Date: Thu, 30 Apr 2026 18:24:55 -0500
Message-ID: <3c59e6133a05aa305075791f312340ae98343feb.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|CH1PPF68E8581EB:EE_
X-MS-Office365-Filtering-Correlation-Id: 85661b72-a348-4116-aa6c-08dea70ff005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eJw45CCClITNU9dsGXZU6aRakYuKr3K18SeiMBrTYF2rgAAlPNXtnSoneOElNPYjaYwK2pZk3piTSx9PhAv7j+o/ZOFmN0qsLh7E4cuWsqa5UTs2x+g9ihEVRLWTAnhydhCSXj/jUMsWIPKYcf6717Tm1iBaAzSYYR3V62S1yar35a65oPTqh2UVZxPGvdouA/321e/R9OQAruLyxrMogrUSYyOXVc0oP4+7z4xDwDzWZ8+VQMLuv3ZSSgFZTCsCgV2DW4q5s4B7+tQN01J++CXdOW0+/tzEBzOuVe2QdrjDAUIsSq2lFqb178cNbh1eNJi7o5ecYslfcYFcRDoivOKgFQqxKuEk9+PQH1ng7v1IJpQUfckQcnOXL9VLL/silOwMeK1HaJ1Sgxx1wnBx5O81VLM2QLtuo4JsYpXOYAQfE+eqCYzAyvcX4QMz2eFbh87DhzBMOzLhfmCvwUl3iWBaGOSaqZOqo0gXcEsPmWZaeCU2z/meJC2K74/Vp9tdnIH38ruhX0UZqR9cxbXwfwqwZ2y5O6QHz/9uejMHSZrHhZRUzFBEih+xfcbBMPmPwmQwTZUq7sA1IYwRICj1rSOKIOcCWDVLwwacbTeWTtbe1cb27dQg0dM9BmmhBQsCgtep+uo/S9NfSK4trO8F1ezmG22vouG80tj/VUO9IL4oraFe/3uG8rr91uJnHjI6dMVpGGMU1vaA8k0UWywYA+9bXE3MdSbEFjoDE+0mgoo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B0kk7CTwzBAfK83RRGIydECk4Y48ze3415Sd2tt+cSOOHybxUz0L9q9DnKH7k98fjA1xyH87WDWwHDqUN+1t7yO+eDkyFAw3f6hsjwoWoNXDAecr+4UtEIKXBtDTGSiIVAngS43n3bYh4Qr/0HELKwyLF+6WptmXlzymnsKcdvXQotC/NkF9nVE7EGv7fzCGQx9cUuE1P6CYmzI6lPo0JSn3QCM/Lk3YFKyAXoCD3p0/2tDYKop0k/UIqKfYDXwZ4tcMcohBNp0UtMa9UpyJZlaMcN0oLZUwLGLCmgwNPYGwmtdPClFJRmV8N9Ydfv+PpRnnh22C1I3h9p6m+hduQeST7wGMUYS8yScVY5S8Grp7uL3aHukgA6uQekvi8RHM+cDl9t9NFKbs+NN/XzsQ5k45FIpMru9WFhNCv9W4NaW9axpk4vmAEdI9+nAKeOYJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:42.5812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85661b72-a348-4116-aa6c-08dea70ff005
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF68E8581EB

rdtgrp->kmode_cpu_mask selects which CPUs of a group have the
kernel-mode binding programmed, but the mask is not visible from the
resctrl filesystem; user space has no way to verify the result of a
write to info/kernel_mode without reading kernel memory.

Add two read-only files alongside cpus / cpus_list in every rdtgroup:

  kmode_cpus       - bitmap form of rdtgrp->kmode_cpu_mask
  kmode_cpus_list  - range-list form of the same mask

The handler returns -ENOENT for a deleted group and -ENODEV for a
pseudo-locked group, mirroring rdtgroup_cpus_show().  An empty mask
reads back as a bare newline, matching the "all online CPUs" semantics
rdtgroup_config_kmode() applies to an empty kmode_cpu_mask.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 fs/resctrl/rdtgroup.c | 53 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index faf390893109..e155160ba2b1 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -387,6 +387,44 @@ static int rdtgroup_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/*
+ * Show the per-rdtgroup kmode_cpu_mask, the set of CPUs scoped for this
+ * group's kernel-mode binding.  Backs both the "kmode_cpus" (bitmap) and
+ * "kmode_cpus_list" (range list) files; the format is selected by
+ * is_cpu_list() based on the file's RFTYPE_FLAGS_CPUS_LIST flag.
+ *
+ * An empty mask is emitted as a bare newline.  rdtgroup_config_kmode()
+ * treats an empty kmode_cpu_mask as "all online CPUs", so reading just
+ * "\n" means the binding is applied group-wide rather than restricted
+ * to a subset.
+ *
+ * Returns -ENOENT if the group has been deleted, and -ENODEV for
+ * pseudo-locked groups -- which cannot host a kernel-mode binding, so
+ * reporting an empty mask would be misleading (the empty form elsewhere
+ * means "all online CPUs").  Mirrors rdtgroup_cpus_show() for parity.
+ */
+static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
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
@@ -2547,6 +2585,21 @@ static struct rftype res_common_files[] = {
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

