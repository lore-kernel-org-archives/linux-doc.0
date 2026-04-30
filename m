Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013058.outbound.protection.outlook.com [40.93.201.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F63C9ED0;
	Thu, 30 Apr 2026 23:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591580; cv=fail; b=XVTANDvO7IfsMuyrT+8You2vY1HpMY9m+SsVDouGO3YjcJ2JpAA6VgzXES9YlmQS6IFOucO2eCXAooi2q2lYKTRWgabne/Bes2OVXnQofYR9P/iCmWagGMty+4hHwiNWBQBEOaXPQXqkAdsouNrogUBYLQx6VD0NhakWVyVpfkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591580; c=relaxed/simple;
	bh=bSoUgZ098PNxTQofRZp6F1LQnAKWrK+fuCqJp3SCRZ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fGgODaNHA7uY4GBpbsH8kaD4rhSL+AiXqiSOdVawdY/+UN/FaTe9HKsRaVIdPmlSanTny5HI9DjkocgOUCO9lySK4rVRb953N+ICAAV1caaae9qJTzKDTRu4/7twVdcIevVykHlfi2HiDorpj/OGPkOevx0GNanOdhn3QbxB2LQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mUgFVv8D; arc=fail smtp.client-ip=40.93.201.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mUgFVv8D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RywbYPhbmRRDlgNgg/gC8l1Q7oH1Oc0aGJbG780PfACUN/EqPolrwSZOmTrTX39YJMmFZExmoZKIKkC2jei4hMH1lbfFu5e738wxFu3zLunXIRErcUjWp0Lw32MzPfAJfc/gicIGkVW2aZk2RYOMMoAHYt4huWWaZDUZhJzIzaBMYPpRxPdXXh4zyOaGRWYv7dpwTgNDVkSRk4N131dDgq09hiQcy/HIs/H5gnt3uSBhm564VeZFIMcd4xdUavfPSQfmiXsg6S3V0bPWyxSM+RDSdDwOpj56zNmxxro9O6d03DlrY1d0Da7aFOlr/YNZWDOC/FkiDpq8F319GHst9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVGMM5t4fS15YuQmxzd267AwJX0SSYcKCeBPlcpUmto=;
 b=nB5KaQktIPrRS74kXyEQ5ZE5RpzdxCNzR/soyMnye1DgJOdzFsFRA+fMvRZbzm83uSZw6+ri/CQ305Tg+gKcnP5feg4Ae7f6FHZDOH3hp/8iHnRvYdel99zdT5XRoq4vpJzjZVhl8UOOT8fYopFBnGsUeuF2YUqrxEv4rn4qWa0zTXIV9V17JnWuC2P7FhZKmo9PwQXHXTPad5aridgP1cba/etb/KapLOPXj56hNxQB0uh00KUw3gGJ+CQI10pduQPAJ8I6kIRoemEUM73XNOgqXAXd8rNDOEflAk4ZNrDMkn3tRel/GA8NkI+T5crslt727iwWTZTVKCKoBtwbEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVGMM5t4fS15YuQmxzd267AwJX0SSYcKCeBPlcpUmto=;
 b=mUgFVv8DEGK+fgOyFxojhDAi/BIQHVh8w3DBLE95dP2yNSRcS3YCbBAftyQkoqY09SE1SwU2zODj8lHfo6cu0EuDn3vTyHXLoHW46h0Eex+r9piX9XDNm/UbgwHeS1DPPdOHoL2n3Dw/R8iSq6mb85CpnwH0vVWTZoxIGG/qUVM=
Received: from SA0PR11CA0124.namprd11.prod.outlook.com (2603:10b6:806:131::9)
 by BY5PR12MB4050.namprd12.prod.outlook.com (2603:10b6:a03:207::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 23:26:13 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::f8) by SA0PR11CA0124.outlook.office365.com
 (2603:10b6:806:131::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.31 via Frontend Transport; Thu,
 30 Apr 2026 23:26:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:26:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:11 -0500
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
Subject: [PATCH v3 07/12] fs/resctrl: Add info/kernel_mode for kernel-mode policy introspection
Date: Thu, 30 Apr 2026 18:24:52 -0500
Message-ID: <549bf0fadf1cedb5938599be58e53b7464c939b5.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|BY5PR12MB4050:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2eec4c-fb5b-4e34-c239-08dea70fde83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hQizE9VEcD4mvmIolPQ3qofwUGvlAwT/7JWYtNGbwaBmc5401Z/ERKXpR3CbKruuenbzBF87sMcbSj0sWrM/fF8MfTvmaFvavjXb3xqpkxCLDvqXiOFBydYwpYZkeNdyckoPw5CbPNs5xfnMoym8w78cucwaoRVlxp/sDxe+OdA+LWygKEKMMQ0OQs0yjEk5zgUuKQJvPiKA/nu4WnwM3Aiwl2dkVc5TczENU9+SMKVlAwsJjkDJDyGX78Vb8T34FbI9ptccrw4MkuebXkqTqZ4sM3k33+N2D6cBAIaA1a68Zt3tl/DX9KtfGdk4g9t0F70QNg5Ix8TukYicuds+qWzzDteA+igybjYBLcRP61x0ysDwemj2hfGwCV8qAw4oxWiRT+DvQvtZ+9JC9y4aVd1BkpMoiSJYfEGjCnDTCiT1aNoSpKl7bn1/q1oDjVmvAN/a3ZurtjXCSSPN9AGVqklG3pnjlgxMasLPq1PyRQefOGy1PklilP4kvpO0Yn1gX7bSIYPh7CFujJ/t4yjKsDeMtcxsKtbVUNe7IGaOVzbdLZz1UoF1z5jldeMMmMm2FA4rJTKK82oE2ivBUKzvFvmmwuHCFZ5hYt8appCnz1vEmSnplvgkC8VcRdHSZQGjWq5pCs+DTCXhdc8eG04IqUwFd/Wgcu7831//mQQta7QZV10ewe5jFRTUiFk5KjNUHPtno6d9T1iut+dsuGzdid9w4KXF97szgjA6yL6Ac1c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	37UNPuGp53pGXh/sQtc9QCAfbmM2MH0cRz78sScKlYAFKRZAC2a1AFKoRg0f9z65x69p4umBwPw+CnioYcQC5eEW+nF8vPNsZIhsnWAbpiNhRZdL9WGM0aP623N81Hi7Lc1DQCKJrYem9f99kheGPqqbEQVvZ1IhVzJxB4f8tTYYFB9NxN3PvY4I1ZZld6HJm0PRgBhY1yXaycdGLNM8jZxc/ZR3A14ioeVTRiX8tQgeN/mwqvneKiPL7kZVXGj/MQdIb5nLuUSR7g0y+sDg/EC606SsEI4HHCGU8yBsBPVsmRU1T4GOHQDM0qn9yPVMV0c+NfdTZ7k4sIZKOjFlk5IkGiA2sdfitOlhcpst1UW90oG5QPGvPnNocGK20IOeioJLGTZJNhGwrd9K19OJWZTg6R8g18a7V/FnG1dVF59tn5vpXnIKsBgA/AN1UNYP
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:13.2052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2eec4c-fb5b-4e34-c239-08dea70fde83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4050

There is no user-visible way today to see which kernel-mode CLOSID/RMID
policies the running kernel supports, which one is active, or which
resctrl group currently owns the kernel CLOSID/RMID.

Add a read-only top-level sysfs file, info/kernel_mode.  It emits one
line per mode advertised in resctrl_kcfg.kmode, in stable lowercase
spelling derived from enum resctrl_kernel_modes, e.g.:

  [inherit_ctrl_and_mon:group=//]
  global_assign_ctrl_inherit_mon_per_cpu:group=none
  global_assign_ctrl_assign_mon_per_cpu:group=none

The effective policy (resctrl_kcfg.kmode_cur) is wrapped in square
brackets and its :group= suffix names the resctrl group currently
bound to the kernel CLOSID/RMID (resctrl_kcfg.k_rdtgrp), formatted as
<ctrl>/<mon>/ with empty components left blank.  Inactive modes are
reported as :group=none.

rdtgroup_mutex is held while printing, matching other info/ show paths.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to handle the changed interface file info/kernel_mode.
    Changed the group name to "none" if kmode binding is not done.
    Reinette suggested "uninitialized". "none" seemed more relevent.
---
 fs/resctrl/rdtgroup.c | 74 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index a7bfc74897cc..9cdcfa64c4a2 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -988,6 +988,73 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/* Sysfs lines for info/kernel_mode; indexed by &enum resctrl_kernel_modes */
+static const char * const resctrl_mode_str[] = {
+	[INHERIT_CTRL_AND_MON]			= "inherit_ctrl_and_mon",
+	[GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU] = "global_assign_ctrl_inherit_mon_per_cpu",
+	[GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU]	= "global_assign_ctrl_assign_mon_per_cpu",
+};
+
+static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
+
+/**
+ * resctrl_kernel_mode_show() - Enumerate supported and effective kernel-mode policies
+ * @of: kernfs open file
+ * @seq: output seq_file
+ * @v: unused
+ *
+ * Emits one line per mode advertised in resctrl_kcfg.kmode (each mode is one
+ * BIT(index) per &enum resctrl_kernel_modes).  Every line carries a
+ * ":group=<name>" suffix:
+ *
+ *   - The effective policy (whose BIT matches resctrl_kcfg.kmode_cur) is
+ *     wrapped in square brackets and <name> is the resctrl group that
+ *     currently owns the kernel CLOSID/RMID (resctrl_kcfg.k_rdtgrp),
+ *     formatted as "<ctrl>/<mon>/".  A component is left empty when it
+ *     does not apply: an RDTCTRL_GROUP emits "<ctrl>//", an RDTMON_GROUP
+ *     under the default control group emits "/<mon>/", and an RDTMON_GROUP
+ *     under a named control group emits "<ctrl>/<mon>/".
+ *
+ *   - Other supported but inactive modes are emitted without brackets and
+ *     <name> is reported as "none".
+ *
+ * Context: Called under rdtgroup_mutex like other resctrl sysfs show paths.
+ */
+static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
+				    struct seq_file *seq, void *v)
+{
+	struct rdtgroup *rdtgrp;
+	const char *ctrl, *mon;
+	int i;
+
+	mutex_lock(&rdtgroup_mutex);
+	for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++) {
+		if (!(resctrl_kcfg.kmode & BIT(i)))
+			continue;
+
+		if (resctrl_kcfg.kmode_cur != BIT(i)) {
+			seq_printf(seq, "%s:group=none\n",
+				   resctrl_mode_str[i]);
+			continue;
+		}
+
+		rdtgrp = resctrl_kcfg.k_rdtgrp;
+		ctrl = "";
+		mon = "";
+		if (rdtgrp->type == RDTMON_GROUP) {
+			if (rdtgrp->mon.parent != &rdtgroup_default)
+				ctrl = rdtgrp->mon.parent->kn->name;
+			mon = rdtgrp->kn->name;
+		} else {
+			ctrl = rdtgrp->kn->name;
+		}
+		seq_printf(seq, "[%s:group=%s/%s/]\n",
+			   resctrl_mode_str[i], ctrl, mon);
+	}
+	mutex_unlock(&rdtgroup_mutex);
+	return 0;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -1891,6 +1958,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdt_last_cmd_status_show,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
+	{
+		.name		= "kernel_mode",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_kernel_mode_show,
+		.fflags		= RFTYPE_TOP_INFO,
+	},
 	{
 		.name		= "mbm_assign_on_mkdir",
 		.mode		= 0644,
-- 
2.43.0

