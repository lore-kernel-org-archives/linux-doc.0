Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2002163A1;
	Wed, 22 Jan 2025 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577328; cv=fail; b=ciRBeKdbA+uMNZ+O6Uf62Ip9rluIkmxOYul+nxpDK7SJcH9cXphGyfJOzLGsqMmjjIzlf/Fi6BFNHGz13kazZHg7sxLjR8/MGgxc21fxK3GgqQ1XFX0c1rfbuwmZnofJFJz6IK9UArT9akMCqLyt/dQCwYkqJRsbBmg5VMTewJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577328; c=relaxed/simple;
	bh=724yg2XsMzM6EMneWPBrPxlFGp5g7lpDz1O8r+7qkVQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qp7KBwDoKKJJyl9Ce4Shgl8+7NHGWLNkDAKSsPefJfU3K4y4aNtGReDjeJzuczdE0y143sCuVFYPiJHGsAjgPkoWAolm5narMamBgQFGcqK2W+Nsg9GgPbGSk9DFtzvH6ENymn3XQsUUXq9usuHu2wRr1hVMltfnWZxfOZEniTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zUZ+AcNc; arc=fail smtp.client-ip=40.107.236.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zUZ+AcNc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIoQgt2EAx4FwvnYlOHuK7w88+wbrLPqsDlMgEEKyS1+KjlpF3FYLlCpFYbxQ8/hJQoKjIqv5fWgB5LlrsI8M0Wa06cfZxRZU2HdjN/zo1hciQwrC6BkXRd1wAbmKTAF7wc+AwH8AzlxRfPZlf8WGdyRjxY4pFupxUb5Tjrf+u3s4/ySo3Jp4GbAmDqV9cFgCxPAizPuzqbfVd7mTqDoGhbSuAyWoRgxSS1yRgwKlXgZge5GhBUrAv56/rXwGZqrPOrN8uIVosQD4fA4QHJErXNWIL+B/FE8MKelj7bHpf12uViFdtamDkGxgtXBooTgsdccuKstPncE55JIfEzofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdWChno04F0RlkEkDzPMHdgjpXF4ECHactTNUuV9+UY=;
 b=ZKwTBKNSZaDl77C9slcfTXmcwQkHqjLfE/n3gkDes1uRPGlTzKHW0z15y/Q6QMwjyYBEj174WSMAEAB98ZGSLDm5Wpz2ANZoSB18/tnqOnL6gbszzdnNSjjNJ8GP+TZ5toZxPq7u46RedUibaEJBrM6HCA7+UYQQNtIhPrTyFi47/l4PiTAuILlpgpPQrzKlf2aMV4T9vqgyiITFFX88iphHz3/yScT+HwVR8FKqGOrqL1i3wgO9Y43bypC5hSvLPHLyRczUnR/uC6sW3vs+Q4ffaTQrC6yMTiaa4rXOjsjm7YjDdMf2f1lcGxH0PuIeZNu0vRsX+vps/f8Rqf2wkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdWChno04F0RlkEkDzPMHdgjpXF4ECHactTNUuV9+UY=;
 b=zUZ+AcNcSmu9PVu7GBj5ktVkv9uY7A5zl/X2PU+jE4d8QVIrp1qi4XhuITw2/K4qVE6NAGoxBhXWm+C4WukQw87dXt6aXDJ3AKNVH1W9f/t2eYS77GN4iMbgmj/rB42G6cqtByKgF0e6RwivWiwUZ5v+aQiuZuW2KtqCMRlXj2I=
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 20:22:01 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::6b) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:01 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:59 -0600
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
Subject: [PATCH v11 09/23] x86/resctrl: Introduce mbm_total_cfg and mbm_local_cfg in struct rdt_hw_mon_domain
Date: Wed, 22 Jan 2025 14:20:17 -0600
Message-ID: <6b62d3fbf5d0e96038ece3be5c2d4b6da79b621f.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|MN2PR12MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: 878a85b4-b27d-4c44-ca79-08dd3b226de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?e0YL5FhOTXBeiZpShRMNBxI+JntI3QGzAKbOHayKbGwtdMHnuAG7L3HdvZuM?=
 =?us-ascii?Q?3RqWZ5GHcuASeGzXt85ddmrTktKpncea0B7u2VxpeUF8yJYpe7ybiQui3kh4?=
 =?us-ascii?Q?SnV2MP8LAWsnRb6JmKLVVJwictLtZzaPLKKpUv3ZpJH6rFo3EClvtyilxG0t?=
 =?us-ascii?Q?yCMlYe0SfqQeactymid4jTSgVlzBoFIIszTy5IkQbjiRxRfhP87lzF2yIJMd?=
 =?us-ascii?Q?ak1ePyfpLkB5s8zSHF12/Gx0EsdHty7uh8RZCm6TrKxJfWlpOU+VXuxcWq6i?=
 =?us-ascii?Q?KjavgVsWwDMaOUy8aHM5/f3BR9NJL2Ea6YExtfXKDe0kvIKgbLgirf3b5smu?=
 =?us-ascii?Q?xz1P2G0zHWCepXjXrL+FTvzmt0eUe9mMoIuzUXTZV6pY5VS8J9wwETQn6tuF?=
 =?us-ascii?Q?fNMLY5Zx1UBuTjQvOWb8ZBTwfcR7AyzAw5CAzJpNQGpnDO3vJYl+Hj59uAKl?=
 =?us-ascii?Q?b691LSGv+2uVU59LBQcRlIQ1mVRuURO+Xwrkw0rMmnVuqUAUZwrwhQI0Laba?=
 =?us-ascii?Q?jcBTaGnY+XVdMDOnx28k19hNWD7HOpTw3qykFl7dL7Gcytc1tG1TkRgGxqxN?=
 =?us-ascii?Q?aXFCKhHJYQmJoDir4XAs6G3ycXVi3+3C5EDwDhb1cda0tXlVHYdOX/qYZi4T?=
 =?us-ascii?Q?Hryede9X90jMbRaf2RfQ5xBxy3NXQIYZYdMaIK+8AwVomgPsIuWEzkp0uEgE?=
 =?us-ascii?Q?FXiK8ZmeeNFKhjuQNhTwO2nuShCucpjtn3jMpkolpgTnvs9LFI0zbt51VPZf?=
 =?us-ascii?Q?Y0xdQTX+GxItiN+ZE4RpFD8xSImiKkfzbZg/hO/pcLV+sgQHKm7kha4g3Yg9?=
 =?us-ascii?Q?P2jbErQ5AaJYqL/Sb69OE1dV0NahmkTGWgDl/jReGbb7/VOQxtyQMc5LLtL9?=
 =?us-ascii?Q?Pirho0Xkk42NHcllzlrNJxpcJkAS1qphdLfEbRvOWjnfftzLA7z8ZGIp1O9n?=
 =?us-ascii?Q?td7nPpeJ9c7sVynr6ehKX/hb2j4E1JaU6LAEG7bZQ4Z3zQTuxMGmzWHYfcMx?=
 =?us-ascii?Q?sujMmnYE6szCWfU7yMYgMrOxZpOCUksVfXc8bzrmUDTDtSnl3uFrAR0KHLEu?=
 =?us-ascii?Q?Dfoe0Hdtm0frd+UdqFCq7ofvw5SxWIu5SULeeHw3Lx0GzyQy+YG5H1sUoZI/?=
 =?us-ascii?Q?Z5oaTshNRM4+HGyDJB7YUm2ml8EP90+DqHKMUzJHB0Kk9AWJgtjlhmQ23gcg?=
 =?us-ascii?Q?HBoXv06zttMOjFxg6PzQmAyLKMB0Y0mo1x7AJSx0FY8qd5eZ787Dz6ZQIvEM?=
 =?us-ascii?Q?7eKqKk/VS6OO6U4Grx0se+xoyBmpNXrghRJQyfTdlTaLgG4kL+LO+YqWe8yZ?=
 =?us-ascii?Q?xCGUvbr69ERuGvBfFnbP5D0jdnkxjdaGHXUh5sbyqls1VyeGXxU/sU9358nj?=
 =?us-ascii?Q?hzctuMfdjJDtZ4lMzOIeaZ/5KTloVQ0qAF5yRCT7N1VL7VgwuzgoV3xCCgMz?=
 =?us-ascii?Q?Q6/XdRALS/KIxN/2XU0pEQksHKR+MB768tULyHgjasc20lKzqktQQFAIdi9e?=
 =?us-ascii?Q?sVIjYxX2+z+mPyU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:01.4243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 878a85b4-b27d-4c44-ca79-08dd3b226de5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160

If the BMEC (Bandwidth Monitoring Event Configuration) feature is
supported, the bandwidth events can be configured to track specific
events. The event configuration is domain specific. ABMC (Assignable
Bandwidth Monitoring Counters) feature needs event configuration
information to assign a hardware counter to an RMID. Event configurations
are not stored in resctrl but instead always read from or written to
hardware directly when prompted by user space.

Read the event configuration from the hardware during the domain
initialization. Save the configuration value in struct rdt_hw_mon_domain,
so it can be used for counter assignment.

Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v11: Resolved minor conflicts due to code displacement. Actual code didnt
     change.
v10: Conflicts due to code displacement. Actual code didnt change.

v9: Added Reviewed-by tag. No other changes.

v8: Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
    Minor commit message update.

v7: Fixed initializing INVALID_CONFIG_VALUE to mbm_local_cfg in case of error.

v6: Renamed resctrl_arch_mbm_evt_config -> resctrl_mbm_evt_config_init
    Initialized value to INVALID_CONFIG_VALUE if it is not configurable.
    Minor commit message update.

v5: Exported mon_event_config_index_get.
    Renamed arch_domain_mbm_evt_config to resctrl_arch_mbm_evt_config.

v4: Read the configuration information from the hardware to initialize.
    Added few commit messages.
    Fixed the tab spaces.

v3: Minor changes related to rebase in mbm_config_write_domain.

v2: No changes.
---
 arch/x86/kernel/cpu/resctrl/core.c     |  2 ++
 arch/x86/kernel/cpu/resctrl/internal.h |  9 +++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  | 26 ++++++++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c |  4 +---
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3f847728aa7a..22399f19810f 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -632,6 +632,8 @@ static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
 
 	arch_mon_domain_online(r, d);
 
+	arch_mbm_evt_config_init(hw_dom);
+
 	if (arch_domain_mbm_alloc(r->mon.num_rmid, hw_dom)) {
 		mon_domain_free(hw_dom);
 		return;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index ca69f2e0909f..ab28b9340ee7 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -56,6 +56,9 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
+#define INVALID_CONFIG_VALUE		U32_MAX
+#define INVALID_CONFIG_INDEX		UINT_MAX
+
 /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
@@ -403,6 +406,8 @@ struct rdt_hw_ctrl_domain {
  * @d_resctrl:	Properties exposed to the resctrl file system
  * @arch_mbm_total:	arch private state for MBM total bandwidth
  * @arch_mbm_local:	arch private state for MBM local bandwidth
+ * @mbm_total_cfg:	MBM total bandwidth configuration
+ * @mbm_local_cfg:	MBM local bandwidth configuration
  *
  * Members of this structure are accessed via helpers that provide abstraction.
  */
@@ -410,6 +415,8 @@ struct rdt_hw_mon_domain {
 	struct rdt_mon_domain		d_resctrl;
 	struct arch_mbm_state		*arch_mbm_total;
 	struct arch_mbm_state		*arch_mbm_local;
+	u32				mbm_total_cfg;
+	u32				mbm_local_cfg;
 };
 
 static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
@@ -665,4 +672,6 @@ bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
 bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
+void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
+unsigned int mon_event_config_index_get(u32 evtid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 5f87fc1650e5..8917c7261680 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1244,6 +1244,32 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 	return 0;
 }
 
+void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom)
+{
+	unsigned int index;
+	u64 msrval;
+
+	/*
+	 * Read the configuration registers QOS_EVT_CFG_n, where <n> is
+	 * the BMEC event number (EvtID).
+	 */
+	if (mbm_total_event.configurable) {
+		index = mon_event_config_index_get(QOS_L3_MBM_TOTAL_EVENT_ID);
+		rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
+		hw_dom->mbm_total_cfg = msrval & MAX_EVT_CONFIG_BITS;
+	} else {
+		hw_dom->mbm_total_cfg = INVALID_CONFIG_VALUE;
+	}
+
+	if (mbm_local_event.configurable) {
+		index = mon_event_config_index_get(QOS_L3_MBM_LOCAL_EVENT_ID);
+		rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
+		hw_dom->mbm_local_cfg = msrval & MAX_EVT_CONFIG_BITS;
+	} else {
+		hw_dom->mbm_local_cfg = INVALID_CONFIG_VALUE;
+	}
+}
+
 void __exit rdt_put_mon_l3_config(void)
 {
 	dom_data_exit();
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 9b09189ef2d1..ddecaa51cec4 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1591,8 +1591,6 @@ struct mon_config_info {
 	u32 mon_config;
 };
 
-#define INVALID_CONFIG_INDEX   UINT_MAX
-
 /**
  * mon_event_config_index_get - get the hardware index for the
  *                              configurable event
@@ -1602,7 +1600,7 @@ struct mon_config_info {
  *         1 for evtid == QOS_L3_MBM_LOCAL_EVENT_ID
  *         INVALID_CONFIG_INDEX for invalid evtid
  */
-static inline unsigned int mon_event_config_index_get(u32 evtid)
+unsigned int mon_event_config_index_get(u32 evtid)
 {
 	switch (evtid) {
 	case QOS_L3_MBM_TOTAL_EVENT_ID:
-- 
2.34.1

