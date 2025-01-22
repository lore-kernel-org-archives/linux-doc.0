Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C52165E3;
	Wed, 22 Jan 2025 20:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577340; cv=fail; b=FuSa/BAAzNBMSAgP8xXmJlLm7dmQzDVUFC2kkMDYfb4AJUB4nLexTJUe8uREPfiwddOMt0Fjv9Dvl3ph9ScXViURhCRXpVqLv/CMRsp+pQIobQuYQ3R9WfBEn7Usm8lugF7hyUfjuwz0F0fTOj8j9Itc7ZXidiACKtBw7/dC9vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577340; c=relaxed/simple;
	bh=qvPu5KWW4PKi3FD9b6IdkicfdhmwQpQWCacPOyNJovc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rTYaGES/T9eYOERvDbJ9d0pGJXU6o/BEpT9r1gIdLjXG5hhr0LGvpFt3HWfwzQLnOW/TebDT3ZxOkX+qzRLIdnVu3dG3Gw10qSUN5aO6KM88ll+1FDyFR+1I3JLjCkZJpsvzbLehzw5UK9cgP/kcXdqFphGcBulvX8C0kcFC+rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=idFzCJhk; arc=fail smtp.client-ip=40.107.93.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="idFzCJhk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXyDc4WGPNAigKkND4aBPZw7RmRnF5YDbE5ZDpWBWaJVkrQX3iJi6BqWiE318gVcZmNgO4bl3ClKIDkqW+eOsMER3FoBTQl+NRGZ2//uxBzuqTjjQCS0oAVu07/oYmHAD4wNDiy0teA+4RshvkPB7WDi3BziPTMSGcuXtqjI8f+e2mAI9Hu3ZNV06nvWS8yJBwIB+LQ52kUrKwV0kF75Okej2kNJ7AhCwdL6OgIqL4U7bdD/l5KZZDZh3KZmvc/j6B1sptcPHJ3m/Rjugrxv4bgknhopUVOxCbqgYPAFqgBpzgbPeWl87fLTGITDHwjCB9B0RAbpnFJ1NnEZf/s7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9XSh7jAA+V4w9FOygA7QFhN2QOWkrFRgnpck9QGpOmU=;
 b=T5y0sG6shO+I3BQhzKLSRjXnkwL5U/bEO/NoSwoft9t1j3FDfYBXzWkW+DIypAcsHyEVYILTt2Sn/fFO9n5eZ8VwP3aL28UJNz+oJkW2WRNn7NlHJuwxCAzopSsdys1mn9UjByiRFTMfoLtWq+qH3iBbyrtABT1MqfWK4T5ndn6TBddxnVkUwFC/Fq7DIfSKIBlxIaFZ1qQVj3DSdGGtKbq2qfLJKnXbE+lcziOyVmX3yugmI8vyuKs5G9gKoRPBIl1yJCBnTsseMO/24bDAAma9WRh8+WZgLAc4JCtI0npnisRzoZlwVaoyTjEbb1KgG/qiKeMSnmUa395bZAtX4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9XSh7jAA+V4w9FOygA7QFhN2QOWkrFRgnpck9QGpOmU=;
 b=idFzCJhkBo3QhTjPhIVOFr077an0TguI8CRgLeJZ5vnWUqXF75Q4Tgmv5HbV8PeGeDpbMvI1K2cWYVgJ63iV3DMg6fksqMoX9TFN/OJwYGq0m8JP6jCiZlXPKHGfNUD1L1iGJ0aCB2W3WZICyfejTadJD4xTukEii61o5B+PQJg=
Received: from BN9PR03CA0519.namprd03.prod.outlook.com (2603:10b6:408:131::14)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 20:22:13 +0000
Received: from BN2PEPF00004FBF.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::63) by BN9PR03CA0519.outlook.office365.com
 (2603:10b6:408:131::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBF.mail.protection.outlook.com (10.167.243.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:13 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:07 -0600
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
Subject: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event configuration value
Date: Wed, 22 Jan 2025 14:20:18 -0600
Message-ID: <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBF:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 666f9e1b-2b12-48af-5330-08dd3b2274d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?daZeyCaI80b2xDQAMPcfJ3EA+grGAqO8JApyhq9eN1K58oDWv5dvSi6Rrug+?=
 =?us-ascii?Q?gNPMwv4iWONM1nFaacN4EfkTGlbW/+m/0yCQ/yEPvFhSHoiEoIlNDuzJmZrE?=
 =?us-ascii?Q?C+48GN/Dsx/6kHIgJ00dWIy/N9lMMp9JRaZIH6cZBzEZhLFbkI35HlZHNS61?=
 =?us-ascii?Q?ELavQE/DdGz+9G9ahhsqxFA4FzlHciPhIn1QfFIPt+ykgx38o62xjesfDsUR?=
 =?us-ascii?Q?qHSGgG/rRh9lfodnBcBh3Cp7zEx8HcmEFOBvHoeorVsSMPDY2gdcEt8QBRTu?=
 =?us-ascii?Q?D4je1EbtJ0B61eaOUkrcWyvjgVnZ3OzKLxbjfahFdzg6qPcjeP1DqH+czcMK?=
 =?us-ascii?Q?0Ki4G/glwn+sXRdTUEZjhX3ByN6Mdfzy0SG/HSaOjPeemboDk2LxzJTlz3VG?=
 =?us-ascii?Q?ttqiFAkegCguShyryFkARsheRB9f5DZ/Usw5j8ikdvKgavjcRzZL3VKndnyC?=
 =?us-ascii?Q?9m29BkfBVO0os2mDUBdeClg1T6cbfq3CWsJcECHKaYhK8M+O24jLQ31Lzf+r?=
 =?us-ascii?Q?yJ/Edv9Ndq9lgMg5Q6m4SuWq8oT+IB1/VyfH5YJXk1bj57JGMuszOZHYrqrL?=
 =?us-ascii?Q?6owQ7xxkAp7HFKN/wAyG2EjF5Ufb/05gwnPF6xIUCF/hoMjenWizFwXlY1NT?=
 =?us-ascii?Q?jWl5247UTCOMVR8fHC+ZRV0cMihqNUceT+SRNg3LHHSd/8ItJ5FOHKKyxkA+?=
 =?us-ascii?Q?W5mweXn8VsQd4HixET8EUNjG+AkiX2Tl96hkK/u2hB7XeK9II3mSUYA98Npf?=
 =?us-ascii?Q?RI1HNuwBCujDVx/QWsjCoGYGZuy2g4J8XfI+dXR0jzO9XvT3fIK5a/pNUP4C?=
 =?us-ascii?Q?HeGUVfnN88mJMjukHg4UNMqqhOVPqvKSU5FEGz3HIitUpswPx6AGpEbblt24?=
 =?us-ascii?Q?4nVvo2YChlypcdE113dHHwsVZvAreffrX2oM+Zy3xOjeevWo5eHyjwYREemt?=
 =?us-ascii?Q?4iuN7Sk2I0MPY+LH3g+pqLoIAFtBCAzuZvgAGZDuGT2X6EitiGvuMG03SmIn?=
 =?us-ascii?Q?Rsgbz94GhOB3mShcZPveUsuDHUmj7DRT8HC8PdDygv+3qjVmih5JxDsVg3Rj?=
 =?us-ascii?Q?YX5TW6GOd3OaAls4RxFE48GJiDtxildFamApM7Bjqk5fzfrQZ94qS/sgNht/?=
 =?us-ascii?Q?oNbLoO/KEryaEpVy4kpz5n60Rs03tNl2Fw42IZ5nLtA0tdpmMEtwhXw30fcp?=
 =?us-ascii?Q?CCoKieeTtYKeo6PxSW32xUGwTnmMwf6/GEi+ilvJjTfgzFCBfUJ/iwBLzQ0o?=
 =?us-ascii?Q?mqX95l1Yuw9u7LMJ2eanBOn6lRj7/Bk6A0WfaZTMxK98jX5SSMXMkNTaC/Qt?=
 =?us-ascii?Q?jksrrqHzOJoUN30hBCWqOlX8ARFR5ebb4trAm2GnBvrnROdkpJiTM640D/4K?=
 =?us-ascii?Q?jb4YA37gn04Nwq+O5eJ1Kx06RgJyzuryBcibNfUWD+xBYoNeixnoN3cnK3uV?=
 =?us-ascii?Q?y8NhAJi37ZlKW1N/saNcbkYO40OeTFPH6/xJS9u+rM1ky5FMhtHgjqvFNCYX?=
 =?us-ascii?Q?Oz3LH+Y8QBvTO50=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:13.0590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 666f9e1b-2b12-48af-5330-08dd3b2274d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708

The event configuration is domain specific and initialized during domain
initialization. The values are stored in struct rdt_hw_mon_domain.

It is not required to read the configuration register every time user asks
for it. Use the value stored in struct rdt_hw_mon_domain instead.

Introduce resctrl_arch_mon_event_config_get() and
resctrl_arch_mon_event_config_set() to get/set architecture domain specific
mbm_total_cfg/mbm_local_cfg values.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Moved the mon_config_info structure definition to internal.h.
     Moved resctrl_arch_mon_event_config_get() and resctrl_arch_mon_event_config_set()
     to monitor.c file.
     Renamed local variable from val to config_val.

v10: Moved the mon_config_info structure definition to resctrl.h.

v9: Removed QOS_L3_OCCUP_EVENT_ID switch case in resctrl_arch_mon_event_config_set.
    Fixed a unnecessary space.

v8: Renamed
    resctrl_arch_event_config_get() to resctrl_arch_mon_event_config_get().
    resctrl_arch_event_config_set() to resctrl_arch_mon_event_config_set().

v7: Removed check if (val == INVALID_CONFIG_VALUE) as resctrl_arch_event_config_get
    already prints warning.
    Kept the Event config value definitions as is.

v6: Fixed inconstancy with types. Made all the types to u32 for config
    value.
    Removed few rdt_last_cmd_puts as it is not necessary.
    Removed unused config value definitions.
    Few more updates to commit message.

v5: Introduced resctrl_arch_event_config_get and
    resctrl_arch_event_config_get() based on our discussion.
    https://lore.kernel.org/lkml/68e861f9-245d-4496-a72e-46fc57d19c62@amd.com/

v4: New patch.
---
 arch/x86/kernel/cpu/resctrl/internal.h | 15 +++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 46 +++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 61 +++++---------------------
 3 files changed, 72 insertions(+), 50 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index ab28b9340ee7..cfaea20145d0 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -605,6 +605,18 @@ union cpuid_0x10_x_edx {
 	unsigned int full;
 };
 
+/**
+ * struct mon_config_info - Monitoring event configuratiin details
+ * @d:			Domain for the event
+ * @evtid:		Event type
+ * @mon_config:		Event configuration value
+ */
+struct mon_config_info {
+	struct rdt_mon_domain *d;
+	enum resctrl_event_id evtid;
+	u32 mon_config;
+};
+
 void rdt_last_cmd_clear(void);
 void rdt_last_cmd_puts(const char *s);
 __printf(1, 2)
@@ -674,4 +686,7 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
 void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
 unsigned int mon_event_config_index_get(u32 evtid);
+void resctrl_arch_mon_event_config_set(void *info);
+u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
+				      enum resctrl_event_id eventid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 8917c7261680..6fe9e610e9a0 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1324,3 +1324,49 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
 
 	return 0;
 }
+
+u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
+				      enum resctrl_event_id eventid)
+{
+	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
+
+	switch (eventid) {
+	case QOS_L3_OCCUP_EVENT_ID:
+		break;
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		return hw_dom->mbm_total_cfg;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+		return hw_dom->mbm_local_cfg;
+	}
+
+	/* Never expect to get here */
+	WARN_ON_ONCE(1);
+
+	return INVALID_CONFIG_VALUE;
+}
+
+void resctrl_arch_mon_event_config_set(void *info)
+{
+	struct mon_config_info *mon_info = info;
+	struct rdt_hw_mon_domain *hw_dom;
+	unsigned int index;
+
+	index = mon_event_config_index_get(mon_info->evtid);
+	if (index == INVALID_CONFIG_INDEX)
+		return;
+
+	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
+
+	hw_dom = resctrl_to_arch_mon_dom(mon_info->d);
+
+	switch (mon_info->evtid) {
+	case QOS_L3_MBM_TOTAL_EVENT_ID:
+		hw_dom->mbm_total_cfg = mon_info->mon_config;
+		break;
+	case QOS_L3_MBM_LOCAL_EVENT_ID:
+		hw_dom->mbm_local_cfg = mon_info->mon_config;
+		break;
+	default:
+		break;
+	}
+}
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index ddecaa51cec4..18110a1afb6d 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1586,11 +1586,6 @@ static int rdtgroup_size_show(struct kernfs_open_file *of,
 	return ret;
 }
 
-struct mon_config_info {
-	u32 evtid;
-	u32 mon_config;
-};
-
 /**
  * mon_event_config_index_get - get the hardware index for the
  *                              configurable event
@@ -1613,33 +1608,11 @@ unsigned int mon_event_config_index_get(u32 evtid)
 	}
 }
 
-static void mon_event_config_read(void *info)
-{
-	struct mon_config_info *mon_info = info;
-	unsigned int index;
-	u64 msrval;
-
-	index = mon_event_config_index_get(mon_info->evtid);
-	if (index == INVALID_CONFIG_INDEX) {
-		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
-		return;
-	}
-	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
-
-	/* Report only the valid event configuration bits */
-	mon_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
-}
-
-static void mondata_config_read(struct rdt_mon_domain *d, struct mon_config_info *mon_info)
-{
-	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_read, mon_info, 1);
-}
-
 static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
 {
-	struct mon_config_info mon_info;
 	struct rdt_mon_domain *dom;
 	bool sep = false;
+	u32 config_val;
 
 	cpus_read_lock();
 	mutex_lock(&rdtgroup_mutex);
@@ -1648,11 +1621,8 @@ static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid
 		if (sep)
 			seq_puts(s, ";");
 
-		memset(&mon_info, 0, sizeof(struct mon_config_info));
-		mon_info.evtid = evtid;
-		mondata_config_read(dom, &mon_info);
-
-		seq_printf(s, "%d=0x%02x", dom->hdr.id, mon_info.mon_config);
+		config_val = resctrl_arch_mon_event_config_get(dom, evtid);
+		seq_printf(s, "%d=0x%02x", dom->hdr.id, config_val);
 		sep = true;
 	}
 	seq_puts(s, "\n");
@@ -1683,33 +1653,23 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
 	return 0;
 }
 
-static void mon_event_config_write(void *info)
-{
-	struct mon_config_info *mon_info = info;
-	unsigned int index;
-
-	index = mon_event_config_index_get(mon_info->evtid);
-	if (index == INVALID_CONFIG_INDEX) {
-		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
-		return;
-	}
-	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
-}
 
 static void mbm_config_write_domain(struct rdt_resource *r,
 				    struct rdt_mon_domain *d, u32 evtid, u32 val)
 {
 	struct mon_config_info mon_info = {0};
+	u32 config_val;
 
 	/*
-	 * Read the current config value first. If both are the same then
+	 * Check the current config value first. If both are the same then
 	 * no need to write it again.
 	 */
-	mon_info.evtid = evtid;
-	mondata_config_read(d, &mon_info);
-	if (mon_info.mon_config == val)
+	config_val = resctrl_arch_mon_event_config_get(d, evtid);
+	if (config_val == INVALID_CONFIG_VALUE || config_val == val)
 		return;
 
+	mon_info.d = d;
+	mon_info.evtid = evtid;
 	mon_info.mon_config = val;
 
 	/*
@@ -1718,7 +1678,8 @@ static void mbm_config_write_domain(struct rdt_resource *r,
 	 * are scoped at the domain level. Writing any of these MSRs
 	 * on one CPU is observed by all the CPUs in the domain.
 	 */
-	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_write,
+	smp_call_function_any(&d->hdr.cpu_mask,
+			      resctrl_arch_mon_event_config_set,
 			      &mon_info, 1);
 
 	/*
-- 
2.34.1

