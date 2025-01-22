Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A703821884A;
	Wed, 22 Jan 2025 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577434; cv=fail; b=c3I/DHRL3XCxEmD6qYE6+mOpNzrSHSLGfshaV2TsTqISGJ9nH+LRK+Y0c+4y5CnEzi4qL0IMHTlj0EVb02kfIcF3wee60MbIJVZJhApx4uo0mwJsGkAxMky5YP7dSCdXa9IGWD77gI2o3KYcrZktvTuoKTN5zmkMDtbwEew2yWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577434; c=relaxed/simple;
	bh=2DaioZnhf89Fl5sdiNrRxLf/6JHH2TZI2vKD2aKgpQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MswiRVgENa1KKHKjJqbHCHr3fKkT02ffgUEWwlNeshTD43vQ4niRfuYbgzSc1yNx2BaogxSlhAi+1M1Q4tBztvtLtvs0lF+a2AP1mkk1m3JEFZtuBak5FNJrI/ea4HjxM+MH38gMl6rE5IY1RaJ3+Z9wu3tQwfRCygRPaa595BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DQM6npg5; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DQM6npg5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOy1quq+53ZD2qcjIY1BHRrHXy2sOwXpDtzRi6sGr/ZWa5qw2PJ8oANymt0VNYy/4QWXBWfigFhQRVPDgqeDA+iUJGBQNlee0JPAtlFtj7CAoQtgp1smYPtI49igpk314F/KXiQUIcxdKSe8fsCqN5IaMFltEIPk0R1q3QDfKqPROciGDTFIFedGXfjYRvQJ1j14RhZEHbGF+zVAYo4Xfn7ffpCRd4gYibGLM18kR1a5q1tla75757hfBqa+bMIF3/PQSnL2IcGT+MpbPmf6WqIDXlHw/bgCLTpRe+B6QsWpgL4lprF3mZS88OgCJLOXvA3L+znk6YPh6l1FkGg3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=194ma8It+LR6yWBFaJDPOIQUTFoFmLgXqlmahW5RnT8=;
 b=ZdiY0fxtE3OAFVn/HvZXKBaptTnAWPHqSoY6e3ER6ojVW9PFABVX5wft1hofg2fK4v3P4N7G7QbPikeMREA27fYvwS5A7ObnmfDePnMp5odNmrIgZ961XI8QVaAfM1G8Z+f3F+MgLN9TLPQ9YKcNzZ5iaS9z897vhe8nF14QgvVSyWXlT/8Yp3SjvhpjmaHSc5MZxnDBdXQAtgaSaVKo1UXU9U4Y/h0JLCJ3RTQl7D52U/zQ4SN2iHz7dJmrE3zygyve5xJ27mAtLFvTVLr0kEHCWMHt3Lo0JYU+7h39fH6i7JPlrT9g0pD+M4ZgiO3B41EL+dXV20auG1h2vCeX7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=194ma8It+LR6yWBFaJDPOIQUTFoFmLgXqlmahW5RnT8=;
 b=DQM6npg5DFbfSc98L+u/tpjGUsuO4DlPdSoGwc4duYKpDCWqDzop/RLIVpktIhWlJ5r1inbTC1EJPisr9BnNPLTVeWY0goGNIg8Akrlre7sdeY1o+PMLtdQUe8H9ND7TVTsKgnuCvoRvhsS0hwA+JtDFcpnJF0WrrMQzIWVZ/pk=
Received: from CH0PR03CA0303.namprd03.prod.outlook.com (2603:10b6:610:118::16)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:23:48 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::5) by CH0PR03CA0303.outlook.office365.com
 (2603:10b6:610:118::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:23:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:47 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:46 -0600
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
Subject: [PATCH v11 22/23] x86/resctrl: Introduce interface to list assignment states of all the groups
Date: Wed, 22 Jan 2025 14:20:30 -0600
Message-ID: <52c66bf98480c0ab6bb0f0762497e328fcbdeaac.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aaa66a7-898c-4f56-2a86-08dd3b22ad5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yn2YUttPqh5IFax0ZV1ZuE8uwXzDTESICIsKkDxXAFP8mzPJCO3JpniDmnLw?=
 =?us-ascii?Q?YNE9eb+iK8/g/nNX0uvoeX9snfWm86tnCZak7NYEb6h0AnMJJ2cvcNsZEfMy?=
 =?us-ascii?Q?1jBFZ/JQ77QZWMMm4PZcJT/G5e4o/MUD7Ii8RQ4gesznADLX3vpblcRtg6/J?=
 =?us-ascii?Q?Se6XqsCPaBfkgvDcIiSXjJv6Irh94IPFkUUAWWDnD5Z2jcPbkOmdPHGjHrZ+?=
 =?us-ascii?Q?nAhPSjFh1GTd2hvgCl4Law/5IA/SqSzxfUL7PDzIx9CfzBg9yK6O+wED34u6?=
 =?us-ascii?Q?IbmeZV3RrsPrEWDlNj8a5fRnCveyMjY+PQWdZg8EGIpqHQTUwNlhhFuc6vWH?=
 =?us-ascii?Q?/IAFETNVakkOX/7/Uf/jw/LW1NB3sJd+fyqM0MkumFRC15OviRgUGCemraem?=
 =?us-ascii?Q?9SvhJbrG5ue+93ZU+Jt59u5lzC4Fmmf9B3r0ECpp9dKe9fFJzQVynNVZy9GT?=
 =?us-ascii?Q?SRUVhf4kOegLtL9Na96WRU5fZ0dYMfFXLz55Apfei1d60cYEExF8bycGCK2x?=
 =?us-ascii?Q?qj/EVkHpWdbJfz0yYv9bS3Pk2TFRRYnRSsNot60K12eUPC+Ho+F+BGO0tEWg?=
 =?us-ascii?Q?FUan2Tg19wl5vgRY2pJ0Kx6tJB2E4JZG3iDYjlx4i7iupleAz0MDIWM7uIUU?=
 =?us-ascii?Q?uuV2hAkvjGYahAA79bUHExqB3EbXPhIcEJ3NFsGnCU/tlPxQ2qQh/rzFP/i/?=
 =?us-ascii?Q?77Kr2wy3lAmqKuNjRVam4EmOvht9C2ygiaVCTdHkllQrVvyxmIsQQtQCIQF8?=
 =?us-ascii?Q?L9Ijd8MxRt7BtQUKTiBWpvioayuqmHciksi13j6yIVRvAlUTLAIau7fCTpUH?=
 =?us-ascii?Q?Tc0wuHfgJQRXLoSTzbKxZh8ncYOdRKDOcVXD6K/SPfMiP2jHUYkhAxGAe8En?=
 =?us-ascii?Q?HVIiPxotM4v7Alcx57W+EVcAiyzcekyBkNHXDuhlKb7qgKln3r+qYC+kIsKO?=
 =?us-ascii?Q?N2ZM96ySGq2sNYzaOMr95BsMOBieu5wbwCoviGyFu8MoxDCoYtAN6XFkx7RV?=
 =?us-ascii?Q?F0J4kKHbTTCSfvhVq9cQhd0Wv0+pQXXxjORAB61eO1A9lOGkGnOdVv+d8Up/?=
 =?us-ascii?Q?UndAHZfH8NbQcWMK5NSdRBz9z9VhYovk70xZVFM3a2nEp7PcqmqiRNQejdsw?=
 =?us-ascii?Q?QIahyg0/W+zkFx/0BhgGU1sbGAbEoFnFIYLiKbi0wduyXX+5dgA6sK4c3l24?=
 =?us-ascii?Q?Vv6yyzY6ls4/3dVtqQO6ub6Crxzj+DcWwww9ONhxaoD4zu/mCIkgMsovxeRv?=
 =?us-ascii?Q?lRdbiD2r/SiscSoyOhKaj6fhTGbq8jrZrBUk40TRSlkFKs0A5O+MYRBbuWRo?=
 =?us-ascii?Q?Izs2ZVdm7g9n2QeLLGBCCdDjXPhJt8yXlXQqHzthYhEVxuFW/0UXbUxRsD4R?=
 =?us-ascii?Q?mosUjMyyILcK8cBlhquAA5cnxdO60ocRjLmra7pP9rCIJ56GVrVCjkvecJK3?=
 =?us-ascii?Q?vgyNQ0fbwqP/V64+yGhpWkJEq2lYZgnDxmIpLGH665lbaDdyCFu3P63fhdHU?=
 =?us-ascii?Q?UN/1UR/HVjxS+yo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:47.9122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aaa66a7-898c-4f56-2a86-08dd3b22ad5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604

Provide the interface to list the assignment states of all the resctrl
groups in mbm_cntr_assign mode.

Example:
$ mount -t resctrl resctrl /sys/fs/resctrl/
$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
//0=tl;1=tl

List follows the following format:

"<CTRL_MON group>/<MON group>/<domain_id>=<flags>"

Format for specific type of groups:

- Default CTRL_MON group:
  "//<domain_id>=<flags>"

- Non-default CTRL_MON group:
  "<CTRL_MON group>//<domain_id>=<flags>"

- Child MON group of default CTRL_MON group:
  "/<MON group>/<domain_id>=<flags>"

- Child MON group of non-default CTRL_MON group:
  "<CTRL_MON group>/<MON group>/<domain_id>=<flags>"

Flags can be one of the following:
t  MBM total event is assigned
l  MBM local event is assigned
tl Both total and local MBM events are assigned
_  None of the MBM events are assigned

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Fixed printing the separator after each domain while listing the group assignments.
     Renamed rdtgroup_mbm_assign_control_show to resctrl_mbm_assign_control_show().

v10: Changes mostly due to domain specific counter assignment.

v9: Minor parameter update in resctrl_mbm_event_assigned().

v8: Moved resctrl_mbm_event_assigned() in here as it is first used here.
    Moved rdt_last_cmd_clear() before making any call.
    Updated the commit log.
    Corrected the doc format.

v7: Renamed the interface name from 'mbm_control' to 'mbm_assign_control'
    to match 'mbm_assign_mode'.
    Removed Arch references from FS code.
    Added rdt_last_cmd_clear() before the command processing.
    Added rdtgroup_mutex before all the calls.
    Removed references of ABMC from FS code.

v6: The domain specific assignment can be determined looking at mbm_cntr_map.
    Removed rdtgroup_abmc_dom_cfg() and rdtgroup_abmc_dom_state().
    Removed the switch statement for the domain_state detection.
    Determined the flags incremently.
    Removed special handling of default group while printing..

v5: Replaced "assignment flags" with "flags".
    Changes related to mon structure.
    Changes related renaming the interface from mbm_assign_control to
    mbm_control.

v4: Added functionality to query domain specific assigment in.
    rdtgroup_abmc_dom_state().

v3: New patch.
    Addresses the feedback to provide the global assignment interface.
    https://lore.kernel.org/lkml/c73f444b-83a1-4e9a-95d3-54c5165ee782@intel.com/
---
 Documentation/arch/x86/resctrl.rst     | 44 ++++++++++++++
 arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 81 ++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 5d18c4c8bc48..3040e5c4cd76 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -330,6 +330,50 @@ with the following files:
 	 # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
 	 0=30;1=30
 
+"mbm_assign_control":
+	Reports the resctrl group and monitor status of each group.
+
+	List follows the following format:
+		"<CTRL_MON group>/<MON group>/<domain_id>=<flags>"
+
+	Format for specific type of groups:
+
+	* Default CTRL_MON group:
+		"//<domain_id>=<flags>"
+
+	* Non-default CTRL_MON group:
+		"<CTRL_MON group>//<domain_id>=<flags>"
+
+	* Child MON group of default CTRL_MON group:
+		"/<MON group>/<domain_id>=<flags>"
+
+	* Child MON group of non-default CTRL_MON group:
+		"<CTRL_MON group>/<MON group>/<domain_id>=<flags>"
+
+	Flags can be one of the following:
+	::
+
+	 t  MBM total event is assigned.
+	 l  MBM local event is assigned.
+	 tl Both MBM total and local events are assigned.
+	 _  None of the MBM events are assigned.
+
+	Examples:
+	::
+
+	 # mkdir /sys/fs/resctrl/mon_groups/child_default_mon_grp
+	 # mkdir /sys/fs/resctrl/non_default_ctrl_mon_grp
+	 # mkdir /sys/fs/resctrl/non_default_ctrl_mon_grp/mon_groups/child_non_default_mon_grp
+
+	 # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	 non_default_ctrl_mon_grp//0=tl;1=tl
+	 non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
+	 //0=tl;1=tl
+	 /child_default_mon_grp/0=tl;1=tl
+
+	There are four resctrl groups. All the groups have total and local MBM events
+	assigned on domain 0 and 1.
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 024aabbecbb5..2dd6c47c9276 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1236,6 +1236,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
 			hw_res->mbm_cntr_assign_enabled = true;
 			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
 			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
+			resctrl_file_fflags_init("mbm_assign_control", RFTYPE_MON_INFO);
 		}
 	}
 
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 5d305d0ac053..6e29827239e0 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -975,6 +975,81 @@ static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static char *rdtgroup_mon_state_to_str(struct rdt_resource *r,
+				       struct rdt_mon_domain *d,
+				       struct rdtgroup *rdtgrp, char *str)
+{
+	char *tmp = str;
+
+	/* Query the total and local event flags for the domain */
+	if (mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID) != -ENOENT)
+		*tmp++ = 't';
+
+	if (mbm_cntr_get(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID) != -ENOENT)
+		*tmp++ = 'l';
+
+	if (tmp == str)
+		*tmp++ = '_';
+
+	*tmp = '\0';
+	return str;
+}
+
+static int resctrl_mbm_assign_control_show(struct kernfs_open_file *of,
+					   struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	struct rdtgroup *rdtg, *crg;
+	struct rdt_mon_domain *dom;
+	char str[10];
+	bool sep;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		mutex_unlock(&rdtgroup_mutex);
+		cpus_read_unlock();
+		return -EINVAL;
+	}
+
+	list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+		seq_printf(s, "%s//", rdtg->kn->name);
+
+		sep = false;
+		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+			if (sep)
+				seq_puts(s, ";");
+
+			seq_printf(s, "%d=%s", dom->hdr.id,
+				   rdtgroup_mon_state_to_str(r, dom, rdtg, str));
+
+			sep = true;
+		}
+		seq_putc(s, '\n');
+
+		list_for_each_entry(crg, &rdtg->mon.crdtgrp_list, mon.crdtgrp_list) {
+			seq_printf(s, "%s/%s/", rdtg->kn->name, crg->kn->name);
+
+			sep = false;
+			list_for_each_entry(dom, &r->mon_domains, hdr.list) {
+				if (sep)
+					seq_puts(s, ";");
+				seq_printf(s, "%d=%s", dom->hdr.id,
+					   rdtgroup_mon_state_to_str(r, dom, crg, str));
+				sep = true;
+			}
+			seq_putc(s, '\n');
+		}
+	}
+
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return 0;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1996,6 +2071,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_local_bytes_config_show,
 		.write		= mbm_local_bytes_config_write,
 	},
+	{
+		.name		= "mbm_assign_control",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_control_show,
+	},
 	{
 		.name		= "mbm_assign_mode",
 		.mode		= 0644,
-- 
2.34.1

