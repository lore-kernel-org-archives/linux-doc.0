Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9536215769;
	Wed, 22 Jan 2025 20:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577297; cv=fail; b=IDMBN9sZ1+CS1TsxT5sLsFX5dATZpLTYtTHT+ZGo65SzP8OQMINCXkZOcRYtf0jXm5PVVbwbGwGkFvh23XPwDwPDVS4Uykt92BrhLls80Tw6O/EviNQmawuuz9CuoQqghNCyKAmjQadPsJSqhc9p4bPsgyjzhKgE4xirvu6GzIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577297; c=relaxed/simple;
	bh=EmHa1o3we3R/Mcrn2+6XVGwfUNyEtZCM+B7Y2JohYrI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLzrXDKLEczHKXkJxP+BJyEiCDhYm932/lyxumgoEq/DZyK2b26oGOrrt4ptbI/ErEhgCPGsoiZftOl1APlcXxyIAAadf3ufK2zS3/U0WtKHsseDicl7fYbZ4XCI8Uf/kezFKB0nh2qkpklheQqpfb4MmO2wZoWEja0eBa9O594=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=h0CjpIzu; arc=fail smtp.client-ip=40.107.244.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h0CjpIzu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGPBwF5p3mEtQEOJBPLoJR5DL9zZtnfBxiQ7BSjAWYKk1h39C3wu3sKLjz0Pl2KQ7JvWi/nncnTARj1N303mJj/DLv5iSuqvA45r2MfuyriD2paPpqLB7najGu/pEwh+XPDWwfXTfOrdvR1JuUr+Eg4+Rh6qvY0zd4KSBDalU8NINsjwbNHFlG1ALb9qyPqrcFRDHx0INJ4z+ySfOu3snjFYxHcwYXzYK+FpFrOHHzViX7yinBmRLkg8LEfeRk+3NLxtjyu4P0jxWOpfKnxK78AuLUzQpB4b4gff/Mwg3GCQs8YwKXfDJ/6jLjbq47OhCkg6qJmLxUhohrFfk191Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73T2ElaSlrHc4Ty8BpLcMkX9p70oHsoYdRnbyFtRnSA=;
 b=VSU06URObZAXcfdfWiZsoLU0sYSyUaH5qIPVi93gDIbzBnyu+E9wCY9kxY9+CqUJh6gR6YBzNWe3QAqBL+5A8VTD/pdK0bkhh2BU7L/MZajgN3+GAj/4Sta6ZQt8NstiD3sb6TXSJ7Wawjwg9KuYW4iZLIAMz7MDlH9dlADQxNYV3CKxqT+UcZTTYxh0/e4+jUlCA7NDX46qetrHwkMPXnMLGndeZ2ohdHtr4N4y6EGFqem0pXF7eFQap05Da7or5ZDrSR3fwYTn7HtKnwVkrln3m9bhANDC3TKBAbqIY6TYBfd/57TXouAlMIfg5Qzic9xrpbExlW63XiqPwzYojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73T2ElaSlrHc4Ty8BpLcMkX9p70oHsoYdRnbyFtRnSA=;
 b=h0CjpIzuNK5nFWwOlhY1GO9yWyj0dpZ7+RyXJmhfwRk9gw5YeWb4ZMxfTFQjNUgvhnE7udkln+vneqro9R5uHdJgDKBRDebvXSvkfmmgGIxMQCB+sTK8ZGra1s7cq7zVEKU/xBznpTePPtWTAQn9Y+AKsnnOcd4cy2iTsYqfNdI=
Received: from CH2PR07CA0033.namprd07.prod.outlook.com (2603:10b6:610:20::46)
 by IA1PR12MB6602.namprd12.prod.outlook.com (2603:10b6:208:3a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:21:29 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::da) by CH2PR07CA0033.outlook.office365.com
 (2603:10b6:610:20::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:29 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:27 -0600
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
Subject: [PATCH v11 05/23] x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
Date: Wed, 22 Jan 2025 14:20:13 -0600
Message-ID: <0935b01834646e550e67e842613290b610ebf8f5.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA1PR12MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 51553b7b-5ba5-4679-48c4-08dd3b225adb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MLtn2pOMahTkmw2Yi1DNIPvzana6Ii9kEVeVUt3odri6J3TdY9m6XAmIDPBp?=
 =?us-ascii?Q?OScLOmdcHSudT99YrJxbWDM+EO/+s3XrA1jRmSp4K2DbAaC17zBwEDnVauCc?=
 =?us-ascii?Q?iULaxfh3Gt4jqh5pMSHtvd9jvFtjnZwmK8uz0YQgW2kEI/9Hzj5ZWiiBd9/S?=
 =?us-ascii?Q?UAmr3sWXnAVE3A0jTOrxZ2FhfyLzQjyd2mWWd27HBy+mAFwYcKUzU+IKjx/p?=
 =?us-ascii?Q?Xv6GD+MZ1W3DA2eyxyoCUabWHoaxgPuBZGV3z8f4ORMhjzKjh0R22zSiS9br?=
 =?us-ascii?Q?mKuEqFA0L3IYSvkFqgYSzxzHcEmcQHQnSDI0RrvkC6ww8xxiGjpopG3kBe9d?=
 =?us-ascii?Q?2xHLfMNyZ28AX8X6m8IDehJtUhovj1+WTUKNeotFj1ydQjQGZtpf4+31bNZX?=
 =?us-ascii?Q?Nr6p41kYnN+VwJ8ttFgVuJ/bYsbFtYDMl/RXw9fhd0qkGNw8be/tTZ3XNzBE?=
 =?us-ascii?Q?hfZYHbSscmw9KcdhDGZbPice47YmavCJKZaXK4Hj88PcvGzpW4DLdOGNvG07?=
 =?us-ascii?Q?IU3ogY3CnsjF4oug0uNHOicjPIcyAytUmjPKvi6sPK0teto/YPI+rSGJks+d?=
 =?us-ascii?Q?bUdVqPLfx9AG9Iv3JS+/XM+GqJOqdugufOaQV0u5iWXEU4YUMQJblnpNUCbf?=
 =?us-ascii?Q?mnpAEMEXfONlTpyZXebsRQtow5Te2pVozCh+d4pZ6QObZM6simXNSp6BNHIF?=
 =?us-ascii?Q?T1X6NoeeQJgZhEWVLjBuh2ArZBqJeC0tl98DtACefa1mcsCDwE/XPuOh+AL0?=
 =?us-ascii?Q?KaYDgz5jvFAfuRqbmjnnga5M4W2sspKlktawlCs/fDypJULR9IS3xoZyED8p?=
 =?us-ascii?Q?YUNIHXTrGApUo036QfLl28Uj4Wgv+tVt/fP7+rgjie6gNIbbHrBh0KSYHUrj?=
 =?us-ascii?Q?V4w/9M55P7XjK60a/d4toLqQGMJjzJ5PRa+XXVayLsIaXdyDkqOgI21gQv5x?=
 =?us-ascii?Q?vpidgjBHZWPLf5V2AwhuvjydmS8dx9cjzGCIUSTt7wzJnH+pD2jd8Aph7we9?=
 =?us-ascii?Q?BJMnka3GqHcjnHQoM0A8xntA01bdmLWXJvz0i/MFDL96s9CBXAKijDkWtws/?=
 =?us-ascii?Q?9tNAzHBiA45XRkSwmrlpxNYfwEiVp2CmmVWwdj6GeV4W4ME+OPn8BBsdaiEw?=
 =?us-ascii?Q?SfX7z34XYqv3Db1CAVIEaqDtjOUDlfJrz4yNEHBByH4qXdccOEBqyNx+YGcP?=
 =?us-ascii?Q?kDfa7OhME4kWx7aEloV1w4qWutOixGtCiwo1AmJsjExreSbHtr+9jWOvVPm7?=
 =?us-ascii?Q?SGGvw+VJeO0OyY2oXt2FQxQWxQFtH9KxPSmV5jH5/ginP1ZPVSXUBL4w0KyH?=
 =?us-ascii?Q?AcC80jDzeHTgUldifcwibIE4oKIVF/0VgHqP8+L9XT+elEV2Gu0sokSYmVjh?=
 =?us-ascii?Q?GF3kD333HM1l+DVErWo9l3PNKIg74M0qE8f4fNth2QGu589flizYzZvO338y?=
 =?us-ascii?Q?adS4f0ZqXrw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:29.4944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51553b7b-5ba5-4679-48c4-08dd3b225adb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6602

ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
Bits Description
15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
     Monitoring Counter ID + 1

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Detect the feature and number of assignable monitoring counters supported.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v11: No changes.

v10: No changes.

v9: Added Reviewed-by tag. No code changes

v8: Used GENMASK for the mask.

v7: Removed WARN_ON for num_mbm_cntrs. Decided to dynamically allocate the
    bitmap. WARN_ON is not required anymore.
    Removed redundant comments.

v6: Commit message update.
    Renamed abmc_capable to mbm_cntr_assignable.

v5: Name change num_cntrs to num_mbm_cntrs.
    Moved abmc_capable to resctrl_mon.

v4: Removed resctrl_arch_has_abmc(). Added all the code inline. We dont
    need to separate this as arch code.

v3: Removed changes related to mon_features.
    Moved rdt_cpu_has to core.c and added new function resctrl_arch_has_abmc.
    Also moved the fields mbm_assign_capable and mbm_assign_cntrs to
    rdt_resource. (James)

v2: Changed the field name to mbm_assign_capable from abmc_capable.
---
 arch/x86/kernel/cpu/resctrl/monitor.c | 6 ++++++
 include/linux/resctrl.h               | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 0c481501b8c5..c3d7d4c3009a 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1228,6 +1228,12 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 			resctrl_file_fflags_init("mbm_local_bytes_config",
 						 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
 		}
+
+		if (rdt_cpu_has(X86_FEATURE_ABMC)) {
+			r->mon.mbm_cntr_assignable = true;
+			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
+			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+		}
 	}
 
 	l3_mon_evt_init(r);
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 3c2307c7c106..511cfce8fc21 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -185,10 +185,14 @@ enum resctrl_scope {
 /**
  * struct resctrl_mon - Monitoring related data of a resctrl resource
  * @num_rmid:		Number of RMIDs available
+ * @num_mbm_cntrs:	Number of assignable monitoring counters
+ * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
  * @evt_list:		List of monitoring events
  */
 struct resctrl_mon {
 	int			num_rmid;
+	int			num_mbm_cntrs;
+	bool			mbm_cntr_assignable;
 	struct list_head	evt_list;
 };
 
-- 
2.34.1

