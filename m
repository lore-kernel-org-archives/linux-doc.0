Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374B5215F4E;
	Wed, 22 Jan 2025 20:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577412; cv=fail; b=QkaQKp/Mc16+MdRC91lgOdxNMrBNJIx5eDo7lAL12ouUBtrGUxK1ekOK1QdFgxQbNWUwVwhwTDoZWlNDh9ctqnr313jXrZSd95ZRVuGG9FbkLvKEk/jla9bPiZ1JkbTJAhPgjKDwpNtJaftr0RxZJMyBYHdvfQyU15qFZOy1Rxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577412; c=relaxed/simple;
	bh=8PamxcBouoN2RXFvevdCqDLlSkYxQrWxmalH3i4vUR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRRYxxbTr3K/JLHq4OXyyyzCasR538yc4hHzI/twpToG+9m8JNbkkyZopKKE2fVhpNPM2+zHTPjoYguV8qs/en0O/bedGgiVAsXJfGtES1bMB1KfIsXkY+8Z9BFYWNvbIL8jE7tFjibTpzeJAZKBxwjxJhsklKPK5PyKIjM4YhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=r21EC9IB; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="r21EC9IB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/VbB1vorfE32NuJKAeSQ0cWkpBvN2cnseoX8XZ+Z0N/BKU9ixrEU889HytfWsHdIG0IgezPqy26JVhaFVtHvlhn1VsfSEeg98ey6IqwqCY6HCoU8iLqJTHmiTa6zP7mtaPKcTdnlwBA4TEuXf+vnz1LU4di7HHjjWxIMHJbcJYyQ+kgcykJ3+79v8MuZHZK+tBauKiaJ7U8KOvPwI8KbWkU3SjIVUMD1O1pHIBDbb1NmqGSRdHriPqcwVSsaDM1XpooQLV9yWDaVLdrlts7DR3pO9ctqXKdsDcRtBccWNMq09WdqCqdg4mWeZ4CoMSxkIvoBBHWR9y+QbZgL6llog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYH+00nkTdxZwXrCJPMGj/NBQ921m8op2z/3pznTrPo=;
 b=pszwZAj/j2m0kw3/GKxT0CxIIUScCm2snBguktBPrVdHMqqDR72zSNqs3kNvE0P9fBetQTWWbiRyBO7zSSFLxTAKo/bctqwzG/SdTiFPWox0F+ry39G1WQEOl18eU7mZAbl5lo5we7PIHONjeufEl7uucVrcy2wmTBiCKb5iM3CEJII+I+Sa/N2p8dNK3/llb6UyFfs0VdF4rHQfhRlbhgV8geWNy43LoURM95cSo87S04ENLYrqXPzNoeotKIGfUTf490Uyps0Ah0RqK+Ek2Ejmzt11CRJkNHzKggT0qk2PmbQ3uJjU31+qTRg959Cbkx6qBhfZSbgwf2hbCLZCRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYH+00nkTdxZwXrCJPMGj/NBQ921m8op2z/3pznTrPo=;
 b=r21EC9IBAi+ZQqnNkMcu3Lj7N0CUMJvGACtjzWyOjsiGOGF8NjzQGi8oKkTed5GhpBDv5a9+p76ADN6Ii7lQ+D1ISYoENpT5IZVbn8cKETAIslarV1XIoZOBMphs7+gOyVojNKV5lZobV+DBLIOFwBW8NmYqDoLfuViUGc4kxq0=
Received: from CH2PR07CA0023.namprd07.prod.outlook.com (2603:10b6:610:20::36)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 20:23:24 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::5f) by CH2PR07CA0023.outlook.office365.com
 (2603:10b6:610:20::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:23:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:24 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:21 -0600
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
Subject: [PATCH v11 19/23] x86/resctrl: Introduce the interface to switch between monitor modes
Date: Wed, 22 Jan 2025 14:20:27 -0600
Message-ID: <cee46a0ddace8ea05ca5371a93dfc53c71016c77.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: ceeaf484-df0a-416e-3f21-08dd3b229f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?irLpORexEzkat8oWfHmtdQrrU4uZ2w44jOJ6U7UG32lzcKcolIxGVHW0sXn9?=
 =?us-ascii?Q?8G5i/MQhUV/CMFADwFal27ScHkXS36hvgkWJsUcq0WdhVwSELapLZhXEBPbr?=
 =?us-ascii?Q?gHSNf0Smc7bE8sP9psGN5LcKwu4vl2Jvkle4S/t+p5aRGcZ1M9akFLf6zWq1?=
 =?us-ascii?Q?6qobPCcWFxB6T5tWg6nsEtV/MrWio83/rOYVJiUT3CNYlm1m3jo4aHhNA55H?=
 =?us-ascii?Q?VUI18MG9lW/pJ05zlUEAbJ/lVInqbv/dDWCDNSunFZKDoh9e04keYuL5zxYI?=
 =?us-ascii?Q?IN8F0kPldEZG/2VcVf6CpUz5+4HnFDDahbiCQ9tx4J4KKMwJ3XDFtlpbBDlH?=
 =?us-ascii?Q?9Q7yEVD0PITr7FdWpCKVGhIVIubQTWu+vsWZ/Poj8Yq4skJppT2j21LholTE?=
 =?us-ascii?Q?DrCrXvQYZ/AlnqymRSqGgkqfWd06l54ytieNl9qKkXOaX/J3EKwZ5AhR7oLa?=
 =?us-ascii?Q?CRdR29FsXJT+fvHGKT12L1LGObtiuqxNaG28+/EvWIxUO2gDDHgjGrwS4PKP?=
 =?us-ascii?Q?GRS5vwPYi8JVlkyIMPtPY7Gr7vnQBE/1sCMNE8e24swUhcgKijc0TQW7la+y?=
 =?us-ascii?Q?N8zrlnJsE5n4PCFOL9njIUnJ/2If3jFrzmIAY7t/ETsYmjJlj5K7PhZTaadl?=
 =?us-ascii?Q?qLEgBygDoiRpZ2dHOSuaA/RwY2H3PlaVUKq5OU1T1oz3X0TDLIrqTgyuhezG?=
 =?us-ascii?Q?LiCTY7ykGjw+kgvdzu23B5vpvKJs2qXBxYOV+jRyfBdxVzQCqqDks/J0lS0I?=
 =?us-ascii?Q?IN/bKvB4kWEYVYHcpNGRscP3f+qGQkuYx2NBP0Pt8M19UfQYYhTZvoXF85WT?=
 =?us-ascii?Q?gWGY+jKF7H4/wAC6oyQMjMG3cM6iXPvGJwwjviFPJFvndh8FOMbQpneAEGEf?=
 =?us-ascii?Q?iQQHc0HhkkOonh/2MfC4QPa20Aj5pBYr6Z05IbKPZ+jMlRIELglUYdlIkasF?=
 =?us-ascii?Q?zhYIrl2ZV6fxVvo06McOaGIYaATbx+47HUFDTIxeHPeJ1gE0ZLTKM977ptP2?=
 =?us-ascii?Q?3I4JHoRJWox4yhKnVr6jDm0DoexQ1s0GYZOxKKYz/AjMm8agY4m9tDwH13Fb?=
 =?us-ascii?Q?OoGkAs1tQBYi94g2/OnG5QDH1s/XntbsGrYR31MK8e3cP6P/5Llu40ME/8Db?=
 =?us-ascii?Q?SGuLSzu2ZvPJEfXjt/B7ZTBkkBS7HHOgosiBTuxYPQvNPuU3Al6eDtWH1Xfu?=
 =?us-ascii?Q?V8WwB7CKAgCdulZ6KHuppMITRNSzwHo6n/3UqGtzMwo17WyQUWi91xCUvB0H?=
 =?us-ascii?Q?GadQgQ8i6KJXu8krFfnkaDKXBtkF+yt0OiRVhX2XdI0vvDMvEFded/pDR9BY?=
 =?us-ascii?Q?WQa/0VgxRmtgn9o63594O5W+SQ7eVkrW5zjy5VwCSuINxVMKoxNevz/X2W4f?=
 =?us-ascii?Q?zrRgxtyN1uF3hzYg/Iocyo6YWd9ctJCXhNXHVyQBx8v1blLaSl6bXwqC6Faf?=
 =?us-ascii?Q?bTcVJAIo8iYGkauy4+3AQQu+NxASZvziqZvHrZxH8IZPFffxCpz5nI5IefTP?=
 =?us-ascii?Q?tvmFHnds3kJ8i5I=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:24.6974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeaf484-df0a-416e-3f21-08dd3b229f88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287

Resctrl subsystem can support two monitoring modes, 'mbm_cntr_assign' or
'default'. In mbm_cntr_assign, monitoring event can only accumulate data
while it is backed by a hardware counter. In 'default' mode, resctrl
assumes there is a hardware counter for each event within every CTRL_MON
and MON group.

Introduce interface to switch between mbm_cntr_assign and default modes.

$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
[mbm_cntr_assign]
default

To enable the "mbm_cntr_assign" mode:
$ echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

To enable the default monitoring mode:
$ echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

MBM event counters are automatically reset as part of changing the mode.
Clear both architectural and non-architectural event states to prevent
overflow conditions during the next event read.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Changed the name of the function rdtgroup_mbm_assign_mode_write() to
     resctrl_mbm_assign_mode_write().
     Rewrote the commit message with context.
     Added few more details in resctrl.rst about mbm_cntr_assign mode.
     Re-arranged the text in resctrl.rst file.

v10: The call mbm_cntr_reset() has been moved to earlier patch.
     Minor documentation update.

v9: Fixed extra spaces in user documentation.
    Fixed problem changing the mode to mbm_cntr_assign mode when it is
    not supported. Added extra checks to detect if systems supports it.
    Used the rdtgroup_cntr_id_init to initialize cntr_id.

v8: Reset the internal counters after mbm_cntr_assign mode is changed.
    Renamed rdtgroup_mbm_cntr_reset() to mbm_cntr_reset()
    Updated the documentation to make text generic.

v7: Changed the interface name to mbm_assign_mode.
    Removed the references of ABMC.
    Added the changes to reset global and domain bitmaps.
    Added the changes to reset rmid.

v6: Changed the mode name to mbm_cntr_assign.
    Moved all the FS related code here.
    Added changes to reset mbm_cntr_map and resctrl group counters.

v5: Change log and mode description text correction.

v4: Minor commit text changes. Keep the default to ABMC when supported.
    Fixed comments to reflect changed interface "mbm_mode".

v3: New patch to address the review comments from upstream.
---
 Documentation/arch/x86/resctrl.rst     | 25 ++++++++++++-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 50 +++++++++++++++++++++++++-
 2 files changed, 73 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 072b15550ff7..5d18c4c8bc48 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -259,7 +259,10 @@ with the following files:
 
 "mbm_assign_mode":
 	Reports the list of monitoring modes supported. The enclosed brackets
-	indicate which mode is enabled.
+	indicate which mode is enabled. The MBM events (mbm_total_bytes and/or
+	mbm_local_bytes) associated with counters may reset when "mbm_assign_mode"
+	is changed.
+
 	::
 
 	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
@@ -275,6 +278,16 @@ with the following files:
 	available is described in the "num_mbm_cntrs" file. Changing the mode
 	may cause all counters on a resource to reset.
 
+	Moving to mbm_cntr_assign mode require users to assign the counters to
+	the events. Otherwise, the MBM event counters will return "Unassigned"
+	when read.
+
+	The mode is beneficial for AMD platforms that support more CTRL_MON
+	and MON groups than available hardware counters. By default, this
+	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
+	Monitoring Counters) capability, ensuring counters remain assigned even
+	when the corresponding RMID is not actively used by any processor.
+
 	"default":
 
 	In default mode, resctrl assumes there is a hardware counter for each
@@ -283,6 +296,16 @@ with the following files:
 	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
 	there is no counter associated with that event.
 
+	* To enable "mbm_cntr_assign" mode:
+	  ::
+
+	    # echo "mbm_cntr_assign" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+
+	* To enable default monitoring mode:
+	  ::
+
+	    # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+
 "num_mbm_cntrs":
 	The number of monitoring counters available for assignment when the
 	system supports mbm_cntr_assign mode.
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index f61f0cd032ef..6922173c4f8f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -928,6 +928,53 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static ssize_t resctrl_mbm_assign_mode_write(struct kernfs_open_file *of,
+					     char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	int ret = 0;
+	bool enable;
+
+	/* Valid input requires a trailing newline */
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+
+	buf[nbytes - 1] = '\0';
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	if (!strcmp(buf, "default")) {
+		enable = 0;
+	} else if (!strcmp(buf, "mbm_cntr_assign")) {
+		if (r->mon.mbm_cntr_assignable) {
+			enable = 1;
+		} else {
+			ret = -EINVAL;
+			rdt_last_cmd_puts("mbm_cntr_assign mode is not supported\n");
+			goto write_exit;
+		}
+	} else {
+		ret = -EINVAL;
+		rdt_last_cmd_puts("Unsupported assign mode\n");
+		goto write_exit;
+	}
+
+	if (enable != resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		ret = resctrl_arch_mbm_cntr_assign_set(r, enable);
+		if (!ret)
+			mbm_cntr_reset(r);
+	}
+
+write_exit:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1945,9 +1992,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "mbm_assign_mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_mbm_assign_mode_show,
+		.write		= resctrl_mbm_assign_mode_write,
 		.fflags		= RFTYPE_MON_INFO,
 	},
 	{
-- 
2.34.1

