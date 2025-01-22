Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74914214239;
	Wed, 22 Jan 2025 20:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577322; cv=fail; b=WdH69qhtAh0FMHV/PovzXafpt/VcBSg88O9YkEORXjyUfGmFHetX90wg7vdtDRETn2KGUSl8RKwjKac+ta5mD5inoH0KjvNPrpnu+KcmBD/sQyVBUNNDFKwWc26N6KhBOO2Xg7pme3fPOJab+fTTpeg0s9wktF26e8Yrh9AfFpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577322; c=relaxed/simple;
	bh=aWdLgCCYmu12eFzU1iUT5VmYloffErGCyd6aD7Rq6U4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRlIudaoETbSBkPOeqIpXGyKCSPVT4/QJGbVgO3+sHVtavOexAbMJdEWOMifoYWubOaOwZxUPwTk+M62ThxeCn3rEkuaLRXWmhCprAJ1JdQZiShlq3dXIYGC5tXHiHpW0B7qvBm6ZI5sqFu14G/2nOI/vU/y0DFmMUQGRnqSWlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ebc7ALTG; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ebc7ALTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ttjs6+xE3lfmqmHP9qU+uJmoLwP441eyTgmjkXn2Fq4PU4nTz9GyIhg6SRrlPrVGiGgnIh7m0al5j38mc0Hd3CPh5DD/THgPT5pTL8grM0VQH2Q+XBIjXnNW5V0dM1oBqUaFfS83tNsSZ3rs/TpPJDGt8SJvBSjZiKSyM+dLMnrjT46etfjT6oQdPzkwxX4mJozXr7/4b2DfpBqcpB2JVTjwqB5nzLRjG2/v4ltOyU1tpgK9kf0GxkZjWQDEWzGHBVE30j6zR3Cqcv1iq7YeTmFAujtCmccObG6N0oMa+sfV0mj10bHTeHGh1OpokrJymsPaN/834dDFeEFLaFAAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBMoDuCGL2klLlJllsOfPD2mA/hNLZ0Er0dFNMcBduk=;
 b=MhFkjkR8BNmZB5pZJUpLe9aHMxJjFRWdgJMomDeRo3lNfSukXp6itFX9wThglKq3FG7ScbPkBoyJzaw26tpCthSDBI109bGMJihoRlBwT1tVwdKxhAiYUCHM1fmSlOg4L8HtmNVUVvhY8VAM2SApbshIxsyNfiSvLJV1SMBtSQv2q9AQh/DXwKMSp53fldQRnExD7ffl/GgzPe8XTRSDlHh5w2UBmRT78TwxOjnJ1ZkqyXWiaQsmAeOWsRR1Az6VfCKAhuAnEgyqRRgadlP9s6mTmRDir8HuhKscCdJML6VK+G4QEqbOjbZw2BWVvMofgNUeKko4X1swBOM/yqQjeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBMoDuCGL2klLlJllsOfPD2mA/hNLZ0Er0dFNMcBduk=;
 b=ebc7ALTGmezxIalc8Krc8wvx0WP1B1L22Zh3tHASr0mMETp3CDDy/FWO0JNkmsarjf+qyJRELtYTNC/MCa8PVtyL5H6vVOV9n7P+PH7qTcFG0Xl7mayuF42kOx79uBkOE1Dt7VNzzGZ3qWP8+uUnViidlJLRU0Z2vWC8EG6MOwM=
Received: from CH0PR03CA0420.namprd03.prod.outlook.com (2603:10b6:610:11b::25)
 by PH8PR12MB7182.namprd12.prod.outlook.com (2603:10b6:510:229::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:21:54 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::4c) by CH0PR03CA0420.outlook.office365.com
 (2603:10b6:610:11b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:53 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:51 -0600
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
Subject: [PATCH v11 08/23] x86/resctrl: Introduce interface to display number of monitoring counters
Date: Wed, 22 Jan 2025 14:20:16 -0600
Message-ID: <80457612b98078bd7786c73f83775e4de86c699e.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|PH8PR12MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: 13146f76-db35-40d9-feb9-08dd3b226916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/JnuRsKxkBpNLUh7EKY3hD4j0RY/q6tWi/CWqaaj8uBVST+jjkHiBfy/ceMQ?=
 =?us-ascii?Q?uWVy7OebVloX42vk0HnSIhfXQF6Z/f+KLPBRTWyotyveD9CYJpv79RwN62Pe?=
 =?us-ascii?Q?EPBHCyKYhBY5BaxNF4CO2jR+aE4leekO74YXEK71jHrN/vB897eZZhGNrEbG?=
 =?us-ascii?Q?uHGvwBCouRduLKfOW5gpI18I3zK8yyPwjtKLwPCOkVVjbQr/tvpNRMsSyYNf?=
 =?us-ascii?Q?CWJMfv9PX7nAR4t8EqeXRlfskbDxbd+0FPed7GAIFpdBeoxf2rTEEuMg+mrL?=
 =?us-ascii?Q?nYGhx6aHQyKjK2TMO/cLUf/nCPzm2vk0Z6Xiub8rJBOFirKS2sgBrQYspL+n?=
 =?us-ascii?Q?CY0M5pmBhkY+x2wg0TeqSewf46BIt1Rygcc/ChRCnWFqnwtnfau5ivK0Nmwv?=
 =?us-ascii?Q?dWvWI1T4rb3Esvi3udvsxoL8RQeAOrm4XdaOyjiIG3xeus0uy222bdZCIRXw?=
 =?us-ascii?Q?+OvJs/UEsjf0oUFpbPibD23CIDYf67gWWB74wA8unHZggfkkGMZUW+LyLRaj?=
 =?us-ascii?Q?Z0HmPaTKkoVqhkBUAwnUoQSi581MQZKf3UjC6+upNulHsCsefRWijfUB2MkV?=
 =?us-ascii?Q?deL0nfEclfJuC3N/E7h/W7kK/m+0I9L2UrQ0h6Ei4BORdcMhHKJfptiIlCN8?=
 =?us-ascii?Q?uDdGGIZiaddNJGvoEHNOU5TzPWyZxE/VziUw7Q9SO0VhhBHs925Wvh2a/ejK?=
 =?us-ascii?Q?xIUI8Ce3qhBG2O634ewcfGD19k2FMawcXk+GVZeDdG50gruzJJ1PkkpjeFpU?=
 =?us-ascii?Q?LwGDajN5HBBwcv4rGA+YKQzlq4H56Kld4q20N8MGl/0aSTVshNGsTKcHr6yS?=
 =?us-ascii?Q?Jkn4i3dyuRKbQEBshwEqno6POWZy/zANbMYlgvjp5gGM8NQH1OhVLZY5wuMi?=
 =?us-ascii?Q?8NCkrw0zgaHzGUir5Hzd79FrG0nt+HGCIwtm1Hv4m/TgmswGCNHY8CfQ67SM?=
 =?us-ascii?Q?GNVZ9v9/m6hnYuD1GlLumHvz8CQv6Z0eTntVSUxFCh0nQD9X2ga4Q8Q2pztT?=
 =?us-ascii?Q?a5KL6g+u8Z1s7Daypcde+w66gs0hE8t4snJW5W/4jzeRL6O0jGEjKFGR6EK2?=
 =?us-ascii?Q?Rs1M2bITuFxHUEvxja7IZqzyILY8EGVmRBFpJsb2BwlpWbAD4VL934DM9+mI?=
 =?us-ascii?Q?YdTN6t7DCFEH3Bs/peyfc/i0Zf1TVmZIlqGTM7eGN5m0KxPCAJsKz2idJJbF?=
 =?us-ascii?Q?Jt4/Rz7e7mjCtINtaGL5bqHG5B42598G8M4OLHLWsbrOG8DCilH9qZBxcz0C?=
 =?us-ascii?Q?Suyv/2jCoKFy3d13ijPVNRc+wNBs4ZFFddtplNiLbY+e+u++rPVxjGJhpxw2?=
 =?us-ascii?Q?MUR1eu6f7j7McYV4vS3pbf3NsAFTAKJdj0Pn/bmiKRNHp/4Q1CZZTjtBOJR2?=
 =?us-ascii?Q?gVQzCIidGZcfVdVrc8vLeis0flJQPLNJ7E5odDhogvDqaI2xQ4b51QRaFzcf?=
 =?us-ascii?Q?ijRFLiKlXS4XZRzPwi3UIiQgZeIxD5heaSqcz1UUl+1vsRon8hrgHdyYK5v7?=
 =?us-ascii?Q?xneJrCVwNci5jP4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:53.3738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13146f76-db35-40d9-feb9-08dd3b226916
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7182

The mbm_cntr_assign mode provides an option to the user to assign a
counter to an RMID, event pair and monitor the bandwidth as long as
the counter is assigned. Number of assignments depend on number of
monitoring counters available.

Provide the interface to display the number of monitoring counters
supported. The resctrl file 'num_mbm_cntrs' is visible to user space
when the system supports mbm_cntr_assign mode.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Renamed rdtgroup_num_mbm_cntrs_show() to resctrl_num_mbm_cntrs_show().
     Few monor text updates.

v10: No changes.

v9: Updated user document based on the comments.
    Will add a new file available_mbm_cntrs later in the series.

v8: Commit message update and documentation update.

v7: Minor commit log text changes.

v6: No changes.

v5: Changed the display name from num_cntrs to num_mbm_cntrs.
    Updated the commit message.
    Moved the patch after mbm_mode is introduced.

v4: Changed the counter name to num_cntrs. And few text changes.

v3: Changed the field name to mbm_assign_cntrs.

v2: Changed the field name to mbm_assignable_counters from abmc_counter.
---
 Documentation/arch/x86/resctrl.rst     | 16 ++++++++++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 16 ++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index b5defc5bce0e..31ff764deeeb 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -283,6 +283,22 @@ with the following files:
 	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
 	there is no counter associated with that event.
 
+"num_mbm_cntrs":
+	The number of monitoring counters available for assignment when the
+	system supports mbm_cntr_assign mode.
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
+	  32
+
+	The resctrl file system supports tracking up to two memory bandwidth
+	events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
+	Up to two counters can be assigned per monitoring group, one for each
+	memory bandwidth event. More monitoring groups can be tracked by
+	assigning one counter per monitoring group. However, doing so limits
+	memory bandwidth tracking to a single memory bandwidth event per
+	monitoring group.
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index a7526306f5e4..5f87fc1650e5 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1233,6 +1233,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 			r->mon.mbm_cntr_assignable = true;
 			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
+			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
 		}
 	}
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 3880480a41d2..9b09189ef2d1 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -878,6 +878,16 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
+				      struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+
+	seq_printf(s, "%d\n", r->mon.num_mbm_cntrs);
+
+	return 0;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1941,6 +1951,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= resctrl_mbm_assign_mode_show,
 		.fflags		= RFTYPE_MON_INFO,
 	},
+	{
+		.name		= "num_mbm_cntrs",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_num_mbm_cntrs_show,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

