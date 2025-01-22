Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2042.outbound.protection.outlook.com [40.107.212.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF342165FF;
	Wed, 22 Jan 2025 20:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577343; cv=fail; b=ogx2RP+Px6i3KalbWhCXpfAz+/jrnl7fxDUd8Y5tS8P6FXrPiQHKM871CzfWfj0WgUGrirvveYE5XA1vddnseQwMkrSTSv/+UIKLTheFuxwsqCb1D9W9muTMp8D8VgufAENUSByw4HUOGVW1RkqTTeuRO85s/BXgb99cDVowYsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577343; c=relaxed/simple;
	bh=pwAy1eMX7WGYkbhPjCSRNyrXUWuZM54g3Q88QCTv2R0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2bUeIZiT/0pXZxTYJcHeHkcqhzSKAq3UWLtg0ocK4L1efjHjE9vlr8MDKAvwdNUqzVDPXCa0SXLd7RWc4ad62FI39bsxQDBVc6W30tPKFmAQiwPIsYnxqtwHJU2M8Nj7G5KynnkDoTyl+JfxMxc2vLKuD89z0YXH2XLSGOzsL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e9Kw8znI; arc=fail smtp.client-ip=40.107.212.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e9Kw8znI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdwT1LdULxcCY0CXQ+0XkvzDEJNSwHS7hmS/QMNEUkjaJhYIdqtWA7MpxXNMIMPiBscU9iz8bjk5eUkTxo/h5qALsKwEFp/SOQqdre1tXRuFnW6oty+reaBPmPAZTu2vWObvrYJmMTH1gYs+z/2QxeuazNjVnlQZDUloNoYXDQI0ZRfJbIcUUse/EERUKpIxUqIVp7TZXzn8r1ceSl/KopZ9FGiWycGvhJC9HVu7n8YulOL9pqmiRvogCIDbzn0NRqV/QX8TxtWY4q7WiQn5HxpCiV4eYNTpUQ2T9QXvCxBCH2Gcf9TaNVDLA/5UvvLBelust1wP98fb4wg0zvsMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9xAXyItUXdy7/sk9ZCdVC0L0JI+gyjZ3lqKPQsnYgQ=;
 b=EX9WlOkigcV7IBvNoKmuzWZefLTspuBBJk4k1zfhKjmMPRo+4M0QoiJXGHcZJz95qoMza7mSpoOtpKJlS1jzTikHWiJi3sky8PDRQvCYC7A3zES8Zmc+RqrMj7YrSaMQR3a5KXTZV2lKPNqYZk44u58i+K20MtrSr+V2AhFkF57eFs5D60PBSb4AFE1OyyNdllk6drxGBrWeq2v2iWws03ZDBmhGpNiEypOUYlvz8AK4WKMkOc30byWeps+cXuTB/V1UWs6tpNDNX9I0Gqu6xDRMpHDK1bdMaYI4zAoN77kAqq+IGBlyfWCmSP0zQljYqcoep9KTQ85L0Aq3YQS0AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9xAXyItUXdy7/sk9ZCdVC0L0JI+gyjZ3lqKPQsnYgQ=;
 b=e9Kw8znIJ6vCvZ2orLKFq9+ZGv+1xRVP6RRSBBdsoBe0teX8xTyT62awgjDs9aqz6hDMjYDVEOZa+W9iFCvP9h+GxnRzQAT1wlWcA3aGFrPBoAeGRy6qBNF+mWz3TpBK/MnYXCNow+YM2cFSb/i01xaa6W5v5y34azE/9qT/dkI=
Received: from CH2PR12CA0008.namprd12.prod.outlook.com (2603:10b6:610:57::18)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 20:22:17 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::cf) by CH2PR12CA0008.outlook.office365.com
 (2603:10b6:610:57::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:17 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:15 -0600
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
Subject: [PATCH v11 11/23] x86/resctrl: Introduce mbm_cntr_cfg to track assignable counters at domain
Date: Wed, 22 Jan 2025 14:20:19 -0600
Message-ID: <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3e85bb-f4a6-42a6-8b72-08dd3b22775e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mB52dwCywUhnQcP476b5IOMBQ14d1U5H2jrRhM10bsRnkFrLlBGxE82kTDAe?=
 =?us-ascii?Q?VXYQe7o50Otnm9vTdY+I7XfIkEJ0nuraOEp8PoJuJehIqiPADGc1gecDPmiQ?=
 =?us-ascii?Q?n7Bcle6E3Va8g1+rVSYSQojfzDm+wLbty4dDk3Rupgm3o23XODFrew+e38fG?=
 =?us-ascii?Q?3ssv1NnY+JfdUBDDQQCSBIPptKYVmRdbpAVh6wtG/o7HFTxp6xhljE0s5rqy?=
 =?us-ascii?Q?ahPSlN6F5mQfQtFewbWpXMVvScogxWJdeRedN9WPv1CcdERlFEjE1UY2JKz4?=
 =?us-ascii?Q?NWOINm+xLRBtw95C/GXi3PqSJU0q98FftZQyLPUfgiuRXU/XDylzB0e716Gx?=
 =?us-ascii?Q?5cLk3Um/nlChqamFRlsyUnao36h1CLytQ8kXzCyliNTxVgyqFrTrRCw7wjCZ?=
 =?us-ascii?Q?Ie0DlA8dgEbin7Yf55Yvyf7T7Lsuj4Jt6Mb/1O9uVymHHm2CaLWi31g+oU33?=
 =?us-ascii?Q?GWtveQgHA7EMy22E6UUIwZB4j5g98LU3OoaRxnzbR9G+EZbFU9ZU0HNB6R4u?=
 =?us-ascii?Q?8mOI5QkPuLeYoM06oBBMQCXSaVgcWHxJuiMjFLa9QqxTwH6CdkqUKFb3vzEh?=
 =?us-ascii?Q?n+v9/YcoU+n+XIBPvt/dbZBHwMOfuI80r3aZZH2qZdCbFCHXVWpjvl+SNBTv?=
 =?us-ascii?Q?DteO7RkFPUCV2Wb3o3Wwa+fKZ80m5bzCcdu9s7qL8kP4mlMyu0WA0lH3GiCj?=
 =?us-ascii?Q?mMT/k9sYIG8CjoA//kkV1JAFmA4iFBuTGEykcr3/gBRW57wvqn/GZp1qRQdQ?=
 =?us-ascii?Q?o2RQtEOfMheRjUdKeCpFMOfXhDAO7QfoWCal8p/HjPaHUFTk70ZneC4SpHAP?=
 =?us-ascii?Q?Zue+MsZRcBjWDkUOK+DszilWOBaWjLaFkXs8dvtxZZ4NWT+AtbWms0MQm1Bt?=
 =?us-ascii?Q?5tEky/QkLYpEyTFQqYQpgqGbT6CWsJtG7moAEfRWAuNQ9J7V3pVtzMN0bWZo?=
 =?us-ascii?Q?504wh5Zr9AFvtYrece4Of7SFEVqTHIkyFo4uNGHHFbclmd6/vb9oxZtELK2z?=
 =?us-ascii?Q?3WDJULfl/FlTWJQNOhSyXDg7YwNgkUtqYptEqKcgjSOl5gSMxzS9swefDhdZ?=
 =?us-ascii?Q?/xZFD0OEqWfG9IBCXRtNIw5kBbTt+YSwY4TAGVu0GI7nmWB5FZ9QxVt7y2OB?=
 =?us-ascii?Q?O3gcJFNZjgUnhEYX3tEGJNEIgqs6xszC5ZWnQXUXFdk2lzS8hUPIBm8n13Vl?=
 =?us-ascii?Q?FKwnxp9i+2SQXV4/w0d+jdfejmUiVQJ1d27AAIzsPEoWQ4V3wlkbyg9GHuKB?=
 =?us-ascii?Q?shk6uqyHf8J9u4BrDY45TScN1bh95z5oCLqrmeEeX6GvFmHXU+Q0rg3gPKsB?=
 =?us-ascii?Q?slr+yabrcJ8St7WP5tAIb/ZnGX2ThAIR8u1ll2a2nPbv1J/H/Zo90DoREEOe?=
 =?us-ascii?Q?Hr58SCi5SISA5lbZbxdsBRNiYk5AZ2iofTqBiOVJHoVKS/3ZDpQIx1bO62tf?=
 =?us-ascii?Q?uGA74eC6JBiVhGL5e623azCmMr7MBHtK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:17.3152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3e85bb-f4a6-42a6-8b72-08dd3b22775e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864

In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
MBM event of a monitor group. Hardware counters are assigned/unassigned
at monitoring domain level.

Manage a monitoring domain's hardware counters using a per monitoring
domain array of struct mbm_cntr_cfg that is indexed by the hardware
counter	ID. A hardware counter's configuration contains the MBM event
ID and points to the monitoring group that it is assigned to, with a
NULL pointer meaning that the hardware counter is available for assignment.

There is no direct way to determine which hardware counters are	assigned
to a particular monitoring group. Check every entry of every hardware
counter	configuration array in every monitoring domain to query which
MBM events of a monitoring group is tracked by hardware. Such queries
are acceptable because of a very small number of assignable counters.

Suggested-by: Peter Newman <peternewman@google.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Refined the change log based on Reinette's feedback.
     Fixed few style issues.

v10: Patch changed completely to handle the counters at domain level.
     https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
     Removed Reviewed-by tag.
     Did not see the need to add cntr_id in mbm_state structure. Not used in the code.

v9: Added Reviewed-by tag. No other changes.

v8: Minor commit message changes.

v7: Added check mbm_cntr_assignable for allocating bitmap mbm_cntr_map

v6: New patch to add domain level assignment.
---
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 11 +++++++++++
 include/linux/resctrl.h                | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 18110a1afb6d..75a3b56996ca 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -4009,6 +4009,7 @@ static void __init rdtgroup_setup_default(void)
 
 static void domain_destroy_mon_state(struct rdt_mon_domain *d)
 {
+	kfree(d->cntr_cfg);
 	bitmap_free(d->rmid_busy_llc);
 	kfree(d->mbm_total);
 	kfree(d->mbm_local);
@@ -4082,6 +4083,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
 			return -ENOMEM;
 		}
 	}
+	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
+		tsize = sizeof(*d->cntr_cfg);
+		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
+		if (!d->cntr_cfg) {
+			bitmap_free(d->rmid_busy_llc);
+			kfree(d->mbm_total);
+			kfree(d->mbm_local);
+			return -ENOMEM;
+		}
+	}
 
 	return 0;
 }
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 511cfce8fc21..9a54e307d340 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -94,6 +94,18 @@ struct rdt_ctrl_domain {
 	u32				*mbps_val;
 };
 
+/**
+ * struct mbm_cntr_cfg - assignable counter configuration
+ * @evtid:		 MBM event to which the counter is assigned. Only valid
+ *			 if @rdtgroup is not NULL.
+ * @rdtgroup:		 resctrl group assigned to the counter. NULL if the
+ *			 counter is free.
+ */
+struct mbm_cntr_cfg {
+	enum resctrl_event_id	evtid;
+	struct rdtgroup		*rdtgrp;
+};
+
 /**
  * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
  * @hdr:		common header for different domain types
@@ -105,6 +117,7 @@ struct rdt_ctrl_domain {
  * @cqm_limbo:		worker to periodically read CQM h/w counters
  * @mbm_work_cpu:	worker CPU for MBM h/w counters
  * @cqm_work_cpu:	worker CPU for CQM h/w counters
+ * @cntr_cfg:		assignable counters configuration
  */
 struct rdt_mon_domain {
 	struct rdt_domain_hdr		hdr;
@@ -116,6 +129,7 @@ struct rdt_mon_domain {
 	struct delayed_work		cqm_limbo;
 	int				mbm_work_cpu;
 	int				cqm_work_cpu;
+	struct mbm_cntr_cfg		*cntr_cfg;
 };
 
 /**
-- 
2.34.1

