Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54348480979;
	Tue,  7 Jul 2026 21:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461117; cv=fail; b=pBGSYvY4Mw8j4bUHin1+GGu1HkTqsUqW/A1ofwq8bn1BELBgu8/fQAfxJgYjR4e5lRn3CXXD7X2qmqJXQAMOOVjyNDB/pxXYa3P//3P1cVObRXa0D0LqL5aRvb61Bab/ing5Yic3bNtWOpC0ABIp/8QrEEqbM6d6TmdVFmnjUVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461117; c=relaxed/simple;
	bh=y9+meaYJbaU7RBp+seg+Nr8B+WvbrIa5Sq3DkRPYQQ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOFsIuofG/kn2Zr6c1G9h3B5MUjilMLk8aJWrMclEqoojIbmx7QE3qlZ1dpfJOupCTdUM0udXFdRYQulx8jPQikq+WraIaXqqF1eUPg5q73Y9jGUDaW2n/q9cIkO8Byu1Q56xXr2z32h/EnhrClNBQ5GjYbOE4T1KR4J5+uJOvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Huy8UOdZ; arc=fail smtp.client-ip=52.101.53.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Huy8UOdZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ym4cW3Zxx3cCGX5RVEmN4rrREVO78NJMCK/i7s3woITd3api+wNbxIPthotB4r+3LFXTEqXlCevdwavaYtVDMzbc/lWJ9kf7tKrBkx0HcLrkN/MgEMUVLLXx4HW/uxI+pDFHHFc+C7J2RV9wOZJjGJP5qCayMtlNGF8BGW5ux9tYj+PX/Q84SCXr1aE7AAWs6T/AYTNXLFh/2ASaEDRPMQf/dvHpnYfayAT766V/RuV17r22WT6v4q9bDwtcGQzhUU6Fo9wNTXB19SBes3UdlB0QQsIIEpYX9KMdlidxlfG4R6AnIuyRB1QsKjWPe9mlUWVEgtwLnCECBnydhikZhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OaBSFetZEWp2/epr6hRZuvDxKMQZWm/iIhKVZubuP8=;
 b=vNBIU+MMyMtFbJ2mp90r9goWKHR3DWW2NPAWzgIQZuIroHNDnA10a+FcNfns8enJSEy5dqasU9yNeNi893+PxDVUCn3ipRdlE8WAehzQImZH2eO9EyHh2Qv/AodXV7587xxLCpVxbybgQc3nikb/rFWnkc9V246adquxDoYf+xPt1OwrpNitoomfn/sRIWDr63VrvQRdf8qRe5iRBQknkGnk2ufuE+EzVYDFmg5VnlbaemjK51ZnT/Tsfcc/3iFZR3twA2pB4OGaAc3NCXNA1H7Tvugg8YZSgpxjTcMdDAMg9FeqsHGqiF54R5sjviKGmfARl0nJt3wSjtPdq7YbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OaBSFetZEWp2/epr6hRZuvDxKMQZWm/iIhKVZubuP8=;
 b=Huy8UOdZ2U5tv0WiT8uFGifmB7KvU4VkQwcVUvdxvt+Ta8K/FRc5E1iBNkeKYIgILTRJSGU738xcYnhyqBaebiiWS2ERZ52HlRKfq6+hde8EWCbJYVbWdIVXvCqYGjFRj5OycGY7qMd5ljeSprWKnWy1Ns8B4RT3/h34Htoo2qw=
Received: from BN0PR04CA0176.namprd04.prod.outlook.com (2603:10b6:408:eb::31)
 by DSVPR12MB999260.namprd12.prod.outlook.com (2603:10b6:8:41d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 21:51:52 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::69) by BN0PR04CA0176.outlook.office365.com
 (2603:10b6:408:eb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 21:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:51:52 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:51:49 -0500
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
Subject: [RESEND PATCH v4 08/15] fs/resctrl: Add interface to display supported and active kernel-mode policy
Date: Tue, 7 Jul 2026 16:50:09 -0500
Message-ID: <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|DSVPR12MB999260:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b8fbdc-c7fd-4742-0617-08dedc71f441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|7416014|376014|36860700016|3023799007|11063799006|56012099006|18002099003|8126099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CMM0P2sfcqGXMdTm0huECJ1TjSW9yuiXPPfH4LrNG4AO5v7xY2ZvRC1aXB4sD6LCkBWiRKrNbJ1MO04nr1MNaXmc8APFYBZf10IvOJ7xFRisjcETJJXmJtzxS86Qqkr0xbPdHOxSPY2KJF+qXT+7pPPuYVR/CxPAF29UcSjqZW77tqJW7SYC2OHnMnmDLXSCHzLWOvosaumyLoT2cayDpbFyqGABjykSJ+sUOalSUjLJwMHyyuAHEumgW1h8Pmc/mUfne64BUDSO5b7BGQdJpq3SNyp0R9waCk5omjazzQpqJrwz/8bAWvEuhoiW2ZD/kFcP494Rv+dSbXc27dfRqk8PZsoLqdczZrrSKUosmw0eqoWZmtchCv0zTuQPv+chn3l469/xlL/kf/QbQQSR3THLrhpbJ+OuD04POG/YsXratCp2eYIbocRTxp2SmvmYKlno1mVt+fQ7V8GiFv3AY9ObfYtLL7mNKTGZbjOU9elAYbt3RX0oUTtfqY0Soa4Nh5SlM9WfpuXuNWxsEhL+l1A2LS5P7ZEmLsXWd9jGJTPxAoaGIU36p/5W6f2GgXryfKNbLrK23FO1dFwHMihcy9DzuJUrfBxMKrA8FsEMqOCXDI2rAi1jgBpmUaN/os64NCs33td4cFtXz/wUNOhQ8i8pqQojNEBLYPKa/7uokv4mwkQWwf76rXNqbf5cSMlb20GKnLIhzwaRocT0+hDCOw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(7416014)(376014)(36860700016)(3023799007)(11063799006)(56012099006)(18002099003)(8126099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9u0Fx/9hk5B2ifnjjE39DhTLcNMcII66tjhogsMfLm1O0OP8ZlNa3z0WZ7NxSszs9h6QQtkOh/wDbrDpQ6pJOzxg0bhiW9hMH/QLissQIYnSAyykoFZT0ewPQdYe4DYuGfIUfUeMul9+urnSJSrmZjkrXlDEbSymL6UeqwwOxMsY775e0EJsGDlkn+tVYNcWo47589PdBBkbZ2mlFWP7GlWGJw/WofaIQG+jaBPG+Z9+Fjdva8xMa8Fn9oEbH5iQbgpXceLBEC/bXhBdTiysreT/ubaCwOn8qJGIY8kRWdfY8lse72+2ObRyPEOOOK9+h3U0953sdEwbJQrxU28TUDsFByPLhEzs8MEfeL2zAG0fRLD9Np3CvmhjAbzTnIafLDHi6hP/7IpkM5AteGuSknV53kpDpx9SF4vmLcGHGVoNyVtHaI1DzcJDcDnAwjMe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:51:52.0063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b8fbdc-c7fd-4742-0617-08dedc71f441
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999260

Kernel-mode resctrl policies define how kernel work is associated with
resource allocation and monitoring relative to the user task. Generic
resctrl tracks the supported policies, the active policy, and the resctrl
group backing any global assignment policy. However, this information is
not exposed to user space.

Introduce a new resctrl file, info/kernel_mode, to expose the global
kernel-mode policy and its associated resource group (when applicable).
This read-only sysfs file lists all supported policies, one per line, and
highlights the active policy using square brackets.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Fixed the display of inherit_ctrl_and_mon policy. It is not
    associated with any group.
    Added "uninitialized" for the non-active group.
    Rewrote the changelog.

v3: New patch to handle the changed interface file info/kernel_mode.
    Changed the group name to "none" if kmode binding is not done.
    Reinette suggested "uninitialized". "none" seemed more relevent.
---
 fs/resctrl/rdtgroup.c | 91 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 0ee0dfaf9065..346aa4df62a4 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1012,6 +1012,90 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/* Sysfs lines for info/kernel_mode; indexed by enum resctrl_kernel_mode */
+static const char * const resctrl_mode_str[] = {
+	[INHERIT_CTRL_AND_MON]				= "inherit_ctrl_and_mon",
+	[GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU]	= "global_assign_ctrl_inherit_mon_per_cpu",
+	[GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU]		= "global_assign_ctrl_assign_mon_per_cpu",
+};
+
+static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
+
+/**
+ * resctrl_kernel_mode_show() - Display supported and active kernel-mode policies
+ * @of: kernfs open file
+ * @seq: output seq_file
+ * @v: unused
+ *
+ * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
+ * policy (resctrl_kcfg.kmode_cur).
+ *
+ * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
+ * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
+ * suffix in either case.
+ *
+ * Global-assign modes append :group=. An inactive mode is emitted as
+ * "<mode>:group=uninitialized". An active mode with a bound group is emitted
+ * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
+ * resctrl_kcfg.k_rdtgrp.
+ *
+ * Return: 0 on success, or -ENOENT on error.
+ */
+static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
+				    struct seq_file *seq, void *v)
+{
+	enum resctrl_kernel_mode mode;
+	struct rdtgroup *rdtgrp;
+	const char *ctrl, *mon;
+	bool active;
+	int ret = 0;
+
+	mutex_lock(&rdtgroup_mutex);
+	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
+		if (!test_bit(mode, &resctrl_kcfg.kmode))
+			continue;
+
+		active = (resctrl_kcfg.kmode_cur == mode);
+
+		if (mode == INHERIT_CTRL_AND_MON) {
+			seq_printf(seq, active ? "[%s]\n" : "%s\n",
+				   resctrl_mode_str[mode]);
+			continue;
+		}
+
+		if (!active) {
+			seq_printf(seq, "%s:group=uninitialized\n",
+				   resctrl_mode_str[mode]);
+			continue;
+		}
+
+		/*
+		 * There should be a valid group when any of the global
+		 * assign mode is active; otherwise, report an error.
+		 */
+		rdtgrp = resctrl_kcfg.k_rdtgrp;
+		if (!rdtgrp) {
+			ret = -ENOENT;
+			goto out_unlock;
+		}
+
+		ctrl = "";
+		mon = "";
+		if (rdtgrp->type == RDTMON_GROUP) {
+			ctrl = rdt_kn_name(rdtgrp->mon.parent->kn);
+			mon = rdt_kn_name(rdtgrp->kn);
+		} else {
+			ctrl = rdt_kn_name(rdtgrp->kn);
+		}
+		seq_printf(seq, "[%s:group=%s/%s/]\n",
+			   resctrl_mode_str[mode], ctrl, mon);
+	}
+
+out_unlock:
+	mutex_unlock(&rdtgroup_mutex);
+	return ret;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -1915,6 +1999,13 @@ static struct rftype res_common_files[] = {
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

