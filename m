Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012046.outbound.protection.outlook.com [40.107.200.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25163C13E3;
	Thu, 30 Apr 2026 23:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591619; cv=fail; b=FpTV48+9I1dWXbLov26rEa8jZ+4PLxw3Dwb0781cQ1v+wpOg+OVkFaxbHcIKR395ce+j2QNF7o/KAlihkjQ8ZIQaax/0WqpHkXzz9d588eeHvVJAKbm6Z2sYwS8AT/pr4ePTqKYg/56xG0M6PBtSNYPzCYyCFN7n/yhdhAlrIUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591619; c=relaxed/simple;
	bh=8DKmNEX+qIYLvwutredErG3GhqRC0opoO24ptXvC1Jg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ReqsowjtVAePCMOKaVqjLtWM8q6zEFb8h7mtXPNBttojY3+61FMgEbPBSOMXMwXpbnbv2kAN6xLSvLIwX/O0r1un8VvxIBZgls2EoCW0HU+FWBuRiKMc5tKMD+HFnk+8y044leoiGOkIr+YvEA4t/80z8CDzniWF/6pb/DbZfR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=3t7dFmJZ; arc=fail smtp.client-ip=40.107.200.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="3t7dFmJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WR+gtWwnoV3XcVHzLGwv2CvXWUNi3Vy3p976eusU4pZcMilimHYapBQfI+YwdbOtUhbo168+uOEgNOLDXBy8MJoKKM0RrIxEy4gWJ1DsW2NVwC8xXJm3UQ4/1bkm1Px8+lKXpdQKmlZgOkAqtR41u11STcsJPhkuniUErCQBYINcpDHAy8+5wVJDYSVtN8gke2szQacS5L4Cp04+Y9YDn/dt6WVD4xan7qeM0bS/tHEE30B+9XxiLceCz2MD/FJfpUqzg6jvgoTbOXKU9KE6sa2AU+++Xrd6FwNSmJUZ3KQcJBbsUPG8E2mDDEVzCSwcxoxyyk0CocgS4RJwAyx2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHx/qGRG3odw5weuDu7/L1JxeMDiWloL5soKJGfcw/4=;
 b=F7b3KvqHZ7ct1IdKG3ZBITEAushm/UXHaJK6HFCd53ztlEM4OX0DvXbjRlXUR6sRgc4Si3rQXb2P6ZtBlK+peaK4jegae6KByX0sukpPV3BpMlOez9cz/7OaXS4EimTP4IxV/TTksR7ytOTiDUZ4SEvbSnSiAde+DllOB6qSBmaMs6Qr89K86jCoL0T/MU+4tBtXWEM9kfmm9FzTjjPbLDNokeljwCwcGlZqVQfEgwMH8/R+ii6jZiuJfB9ObIpVYY1c+EYWbeU/q4VABTbNsoo1fyBWRJtORogC0IsS45iE3/J0oy9bJvie09lph1k8E/OaOmM5hdsvDSCg3YuHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHx/qGRG3odw5weuDu7/L1JxeMDiWloL5soKJGfcw/4=;
 b=3t7dFmJZ38SpslSsFbv8ooy94BJu6xXOz0P2tsNHYjGWOqfWevBvZN157TNjciRBv3zJvFCWttgL8cvlnL0JE3WT11uKEY4v6VvSHA7JLr+jGaYsiNSWcgPkuYozKxmi0z0AEgt/HNSc78MnOQ5N2IubxGMonkynHYhfOFeyUMY=
Received: from SA1PR04CA0018.namprd04.prod.outlook.com (2603:10b6:806:2ce::23)
 by SJ5PPFB332093D3.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 30 Apr
 2026 23:26:51 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:2ce:cafe::fe) by SA1PR04CA0018.outlook.office365.com
 (2603:10b6:806:2ce::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 23:26:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:26:51 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:48 -0500
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
Subject: [PATCH v3 11/12] resctrl: Hide kmode_cpus[_list] on groups not bound to kernel-mode
Date: Thu, 30 Apr 2026 18:24:56 -0500
Message-ID: <612d7a81fb179aa323c18d1c3a7f2470f2dd6a7b.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|SJ5PPFB332093D3:EE_
X-MS-Office365-Filtering-Correlation-Id: aab4e552-441e-47e9-1c7d-08dea70ff513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	S5ivLhBVp/bdb4zaIKsZO37V761a65JYEv0WYI7FibwNqFAI5URhYto0ID/Pga0dWRuniYO35V6ynqJb2m2cNFkh4L9OktbILJhw0HHq+GZjgdbBN+DrRQPV90y6oFKaCRZS+okEZZ1OOc4l4y7jydZl0/WTcal2qoGyGWAH6ewRyG/91k8HNy4HHxeo/BmBKCpdRgvABb5T6RIvE/yMVFQ3/Y0CJ8nnXBbxbzA5gX8o6E/RmnkK4z+B1+K9Nhvamk01gTbUmA1Yg04pdJbItOlEFFtU7807m727mw1BsXIJNaUlE7mA02POgVUWipLqQzyDfrPYnOsbVztkHMA76557kU9nsQdH2ijk46X5ooklnOAAK62T2XItkjyf/tjuaCst6jZhpsXrF9cAdezDF4a+zw1R0YBw73spIxNZyitx1E4jzTVJ9RMl4ZzzyjSRMT8/ivYhBCsd06D9X0UhdRWZlXvqu4zCgTK2D3lSo4YKxCE+sD1agb9Cj9b3RhKpanqqG0GKKRCiRQvgp3x9IqWaHIF5Z9+NIY7MMQDmoRieO2fJksHHiAUiLGLdxbUx1XWCoEytWKhL/m9sBsI3sVJ29eRyDtPJL5JZSd9mBgVkJE/cpR2OdIFnHgFLtWEpHGGp9zQSTkkNPG5yPPp6aCsI7joZGRb+gjeIoYF4Gk+kRp8r/UBD7MKiQ+VosmTz0LNvKI4CEo9nXl9lzwl7ZHeSIku1isVTMOGc0XKg2qs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0NgIJIZVycupNQl10zDYyMEyC3XubryCoRPMEymiVNcWk78l4vEfNxvAQnfCCd13MZyonQYhwSj2iWvXx2cpb6AskOFTQSQ6O7nogTm2HCBjUIrDxP14gw+PWypzr/PyOW/5oezrAIxnQUWirRYf5iBSk3MTNbfQ0LqeVR+rZImdjxm21p2J0/IDg42IAojGrabFyopmACcCPluUXpBiAsXnDAl5tdokJKaBKiOAk3nnOKcaVsphPilyqTxU6OT74vL0sGLw728hIlYYCddTuxpVap+7lJuhe1pBSfyuzE4r8OUUI4bxg+NWuerLg8orVZR212F3QLXTprTCOSmYmBLZYDGitj21bGYauMIsxtej76jkX6LeiiIgUL5fPkP/aC6XIm5HW77e7K+V+1QkBby6upUvq5pT26sFsiTMFY43CPBLetfIsky4vyhsB/Xy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:51.0563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aab4e552-441e-47e9-1c7d-08dea70ff513
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB332093D3

The kmode_cpus and kmode_cpus_list files control the CPU scope of the
kernel-mode binding owned by resctrl_kcfg.k_rdtgrp.  On any other
group they appeared as stub files, and writing to them reprogrammed
hardware as if the binding were active -- corrupting the real binding.

Hide both files via kernfs_show() on every rdtgroup that does not
currently own the binding.  The kernel-mode lifecycle hooks toggle
visibility: hidden at mount on rdtgroup_default, hidden at mkdir for
new groups, shown by rdtgroup_config_kmode() on the group it binds,
and hidden again by rdtgroup_config_kmode_clear() (and through it,
rdtgroup_config_kmode_delete()) when the binding is released.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to hide/show "kmode_cpus" and "kmode_cpus_list" when kernel modes
    binding changes.
---
 fs/resctrl/rdtgroup.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index e155160ba2b1..cff306d28e79 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1093,6 +1093,38 @@ static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+/**
+ * resctrl_kmode_files_set_visible() - Toggle visibility of the per-group
+ * kernel-mode CPU files under @rdtgrp.
+ * @rdtgrp:	Resctrl group whose "kmode_cpus" / "kmode_cpus_list" files
+ *		should be hidden or shown.
+ * @visible:	%true to expose the files, %false to hide them via
+ *		kernfs_show().
+ *
+ * Each file is looked up independently as a sibling under @rdtgrp->kn.
+ * kernfs_find_and_get() failures are intentionally ignored: this helper
+ * is invoked early on rdtgroup_default before its rftype files have been
+ * populated, and is robust against any future rdtgroup variant whose
+ * kernfs tree does not include these files.
+ *
+ * Context: Caller must hold rdtgroup_mutex.
+ */
+static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visible)
+{
+	/* Keep in sync with res_common_files[] entries for these files. */
+	static const char * const files[] = { "kmode_cpus", "kmode_cpus_list" };
+	struct kernfs_node *kn;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(files); i++) {
+		kn = kernfs_find_and_get(rdtgrp->kn, files[i]);
+		if (!kn)
+			continue;
+		kernfs_show(kn, visible);
+		kernfs_put(kn);
+	}
+}
+
 /**
  * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
  * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
@@ -1161,6 +1193,7 @@ static int rdtgroup_config_kmode(struct rdtgroup *rdtgrp)
 		resctrl_arch_configure_kmode(disable_mask, closid, rmid, false);
 
 	rdtgrp->kmode = true;
+	resctrl_kmode_files_set_visible(rdtgrp, true);
 
 	free_cpumask_var(enable_mask);
 	if (need_disable)
@@ -1228,6 +1261,7 @@ static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
 
 out_clear:
 	cpumask_clear(&rdtgrp->kmode_cpu_mask);
+	resctrl_kmode_files_set_visible(rdtgrp, false);
 	rdtgrp->kmode = false;
 	return 0;
 }
@@ -3387,6 +3421,8 @@ static int rdt_get_tree(struct fs_context *fc)
 	if (ret)
 		goto out_closid_exit;
 
+	/* Hide before activate; the kernfs hidden flag survives kernfs_activate(). */
+	resctrl_kmode_files_set_visible(&rdtgroup_default, false);
 	kernfs_activate(rdtgroup_default.kn);
 
 	ret = rdtgroup_create_info_dir(rdtgroup_default.kn);
@@ -4411,6 +4447,8 @@ static int rdtgroup_mkdir_mon(struct kernfs_node *parent_kn,
 		goto out_unlock;
 	}
 
+	/* Hide before activate; the kernfs hidden flag survives kernfs_activate(). */
+	resctrl_kmode_files_set_visible(rdtgrp, false);
 	kernfs_activate(rdtgrp->kn);
 
 	/*
@@ -4455,6 +4493,8 @@ static int rdtgroup_mkdir_ctrl_mon(struct kernfs_node *parent_kn,
 	if (ret)
 		goto out_closid_free;
 
+	/* Hide before activate; the kernfs hidden flag survives kernfs_activate(). */
+	resctrl_kmode_files_set_visible(rdtgrp, false);
 	kernfs_activate(rdtgrp->kn);
 
 	ret = rdtgroup_init_alloc(rdtgrp);
-- 
2.43.0

