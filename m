Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4721660E;
	Wed, 22 Jan 2025 20:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577313; cv=fail; b=hEisgGk8IdwDV9oJvdAkiJMqLJe4z74dpfdWO7Tda3wfLS1YI2R4ohEGbRX6I3EBSVSzy77IgaTTryB2PqzL/YTKe0D8+nbv8LOWfg9nbUrITDjPpgWaG1oVG0NVjgQTaVIeZmGyUed/j3/9ZuaRXInTXGb9BSH/jJSU1HwmWl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577313; c=relaxed/simple;
	bh=ceb9jGKKZa1HQiQRF3SyjVyf4xc/Dw03n42280Gc5js=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ee7AuaObFgk7S4eC9qqHlII+ADuHhUwhz6WQr8IvNJ1xky46Fb0HVmHgs7bK1G+f+Qso1o2IQn3+9/a4K3/ihwzmXff1WhSOlpl70ifWRSALFPqEGN/OiLbKLdeYRQyyYPyHhiAjM3Aj26L4vpchSIRUvBQ/H6mweaXX9UryQxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KSQx9evn; arc=fail smtp.client-ip=40.107.223.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KSQx9evn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVbx7dH6ar6xBLlEeFlQWXgrtWhe6KulsOToQOviMQXvYI1TQn7K0QVyOc6VOzNEeQmUX00xscGPUwNlW5imNO5YmolZn0qhcbOxtvZIRIMNTHlJ0L5CNx9UsLHBxXhIR7HTHs3leE831gKMsnx0YOhLhsziMMnI99DnK6Gg0VF461q4tHoqqHIh+27Gj260aOlbVKsP/UmCojSkmQA1MznKfVEv0SlMVxtRQv/99yGLdGt9/4jJY9MnYdsyWT/ZqqhEhdjP3tpYaXaUFU2ACdZgDAPgkRscQ485eoP+/8dhB6HYcF+B+O4bsyw7PBYCOSX0v6NHYJxCQJ2xdWrRPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/DVGkCOU6FmltBb4sux5IQxF4FsDAW9MweRnNk/HB0=;
 b=JIglGqWS3XuRu57d8NgCh9qUvspF/UWV+3aUnETyrukL/QGMBd3mQ8wWPVSk6q94FbVAxRNBf/Dd2IdCGAzi9fwMFvYH+FwMpMRJcFpvqCtdHv1zs0zDAg3a35EZfCnRln2Y3bi95zApzRp4aiO+4IBX2CMcKpFoD8FJkTaZxj8wTk1KEWk8JHXo8iWdZ5pF6UjkK90kyZ1w7xnZay0rfLqGY2AmzzpR6B8AWdymzihLdv7y+o5hQxi3IlKOVkuJdbtWsHkEuJrzKyxHD8lBCFEOR9tEqCyGuqVaAACjrkU8cJp1OOdHW7WAnxe6RJy7Q/d2ScJLYr4oEWrYXbjbdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/DVGkCOU6FmltBb4sux5IQxF4FsDAW9MweRnNk/HB0=;
 b=KSQx9evniqayk9xG5BqzPKWm84XKxznjB3bi+1BZSzNDERc+YgHwVg/bJF0DHqSASfc8n+P1Tq/SyvpClPsCASjyl84MLU5wsVft8fynv7XIqmU1WIV2hKBWUxqWYu9j2B7hLKIpk2rMlhrTIT2eSRwzh4j2C4KOLulyGEoNO3k=
Received: from CH2PR15CA0023.namprd15.prod.outlook.com (2603:10b6:610:51::33)
 by SJ1PR12MB6026.namprd12.prod.outlook.com (2603:10b6:a03:48b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 20:21:45 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::df) by CH2PR15CA0023.outlook.office365.com
 (2603:10b6:610:51::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:45 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:43 -0600
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
Subject: [PATCH v11 07/23] x86/resctrl: Introduce the interface to display monitor mode
Date: Wed, 22 Jan 2025 14:20:15 -0600
Message-ID: <b298391d4db5806c145ba0b92d79e02a4df8d8c5.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|SJ1PR12MB6026:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f29242-0b11-4f0d-ab61-08dd3b226460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TXjge5SfGErpvxBoq7CcS3tBoDp2qSy12xVYNwWyimgEyod7mGO1w1uRNyGy?=
 =?us-ascii?Q?juGzhvhCoSHQZOGm4tR0c9fxvUqUQzSgJzRYUv16AZv9+ldSzLxLXNTtO0Ou?=
 =?us-ascii?Q?xYzwvxY4ybnZ5dKR/daCBxe4lhq9SsHH7C1/5jOq/Vufcdxfore3rSKam8oH?=
 =?us-ascii?Q?IJkLF2qNVD5pAf6h8MH7GYJaThQ9HLs3guCjt8+pZBU8sr231DptHxXb2LbS?=
 =?us-ascii?Q?lRCgDTxcg/NKaSM4VsZxVZDIJTWAH/5dxkcoIrzT50AMJF6Lpp/nmv/paaHs?=
 =?us-ascii?Q?aUydtSVJrSeSM/syBdrD8P+DXkJ+kkevvjc6Oa2eUgS3CS7JqDmuUEHmzt1Q?=
 =?us-ascii?Q?sh08d5j6DhzVnRgR9Zk4Y00TlfCyzXEcS0mKLNzmwN6SgT6+fKC3CgKVJJ4l?=
 =?us-ascii?Q?SU3Z63IVSF8LDLoY3bdTrw0RgGZm5zeYg8K6QJpEYKtMuTyhNA5czNnn8tVk?=
 =?us-ascii?Q?FE0Lb1+ZO6eJT79bZj8MWWbae1dOx1X1uqE1n25i8gNGBzFNJLi0e4HDa9PZ?=
 =?us-ascii?Q?YKP663dF8VsYWkq+KspkUBx1pQ5XkKVnz/ecnXxqsAfm+UVxAGhr2IyaWViP?=
 =?us-ascii?Q?Hstn0OgaT4qv5XUpxpxGfeYbm3SOMnZzfqVuCJ2q2IIDzcZaCRjzCPHeJBLW?=
 =?us-ascii?Q?9G97e17yBGrmsbubjwjqhTa2b+sc1qCxyR0Vk+PYYTl/jdK6jt/sUa6Ysah2?=
 =?us-ascii?Q?RQLMWetjpk9j3YqD7HvrLGLTe3ivX8dGTXQ4K0Dm4u1ZeF3x8Bl/h4BOOhMa?=
 =?us-ascii?Q?5VHbWKDDESTWgv1fXrkUEvSFrr47acfugHLd4/vDCTj0EFd8k2deg0JD2HY1?=
 =?us-ascii?Q?qO2uwNM3503FRXwowkJVQOJP0u1v1jVAnxnBlT2CWL1b6a8+6Ys1pApWeN4O?=
 =?us-ascii?Q?arr+E2iG55ijJx1l05H+RX0DetuQR5RqNMbKHacc/usSo9qAodiBnTVfTenB?=
 =?us-ascii?Q?6Y3Y2ZSbULth/9DZiwT0EyMG3oW/+YERX8sksA4zR7ukStIoV+prc15H73gY?=
 =?us-ascii?Q?owMVJOLMzk6Dd2XinmpKrmNwELhZXdeOUEw9YWAjsMEEZyze52b0n4tZDGDK?=
 =?us-ascii?Q?8JSRvovm+f4F6/CB2LlUXCAJnGDbLzHsiXq52/SzlOnKFTR1+cfegJmAkkjw?=
 =?us-ascii?Q?2etne2+OSOM6D7ns4WW8NHMeqTIECa7b3a9Dly00yPOr6XjF0d9runQmcGp+?=
 =?us-ascii?Q?FZ/7tFj2sH2/9Q8E2IoTcikO4vdFCG0W/FqgNxJuWitYQ8hVTMXd8xTphIS2?=
 =?us-ascii?Q?WZ94iQ13dotXGnTNBbPL7XyAZOi03gTAWJ9ZFOwjkA+FjVfvY+LkZJg1IDmL?=
 =?us-ascii?Q?96iUJ4BuEhsRTp6fvH087vS2KY3LfM07uNx2w8a3GGcyR6CAiqwUWKtVKdNI?=
 =?us-ascii?Q?Ac/r2VjJGjnQnyyMJ0VXPaWfJHZV3vDpbR8h5929SuxdNT48jcTos3mF/uu9?=
 =?us-ascii?Q?8P7h0Wux2oERy5agxgE68B/zlC9fqKO5TyME7yzCBKRHxUhpa4IaHVrYRIWg?=
 =?us-ascii?Q?J33IhXg4ioaAOWs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:45.4524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f29242-0b11-4f0d-ab61-08dd3b226460
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6026

Introduce the interface file "mbm_assign_mode" to list monitor modes
supported.

The "mbm_cntr_assign" mode provides the option to assign a counter to
an RMID, event pair and monitor the bandwidth as long as it is assigned.

On AMD systems "mbm_cntr_assign" is backed by the ABMC (Assignable
Bandwidth Monitoring Counters) hardware feature and is enabled by default.

The "default" mode is the existing monitoring mode that works without the
explicit counter assignment, instead relying on dynamic counter assignment
by hardware that may result in hardware not dedicating a counter resulting
in monitoring data reads returning "Unavailable".

Provide an interface to display the monitor mode on the system.
$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
[mbm_cntr_assign]
default

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
     Removed few texts in resctrl.rst about AMD specific informati0n.
     Updated few texts.

v10: Added few more text to user documentation clarify on the default mode.

v9: Updated user documentation based on comments.

v8: Commit message update.

v7: Updated the descriptions/commit log in resctrl.rst to generic text.
    Thanks to James and Reinette.
    Rename mbm_mode to mbm_assign_mode.
    Introduced mutex lock in rdtgroup_mbm_mode_show().

v6: Added documentation for mbm_cntr_assign and legacy mode.
    Moved mbm_mode fflags initialization to static initialization.

v5: Changed interface name to mbm_mode.
    It will be always available even if ABMC feature is not supported.
    Added description in resctrl.rst about ABMC mode.
    Fixed display abmc and legacy consistantly.

v4: Fixed the checks for legacy and abmc mode. Default it ABMC.

v3: New patch to display ABMC capability.
---
 Documentation/arch/x86/resctrl.rst     | 26 +++++++++++++++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 31 ++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index fb90f08e564e..b5defc5bce0e 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -257,6 +257,32 @@ with the following files:
 	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
 	    0=0x30;1=0x30;3=0x15;4=0x15
 
+"mbm_assign_mode":
+	Reports the list of monitoring modes supported. The enclosed brackets
+	indicate which mode is enabled.
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+	  [mbm_cntr_assign]
+	  default
+
+	"mbm_cntr_assign":
+
+	In mbm_cntr_assign, monitoring event can only accumulate data while
+	it is backed by a hardware counter. The user-space is able to specify
+	which of the events in CTRL_MON or MON groups should have a counter
+	assigned using the "mbm_assign_control" file. The number of counters
+	available is described in the "num_mbm_cntrs" file. Changing the mode
+	may cause all counters on a resource to reset.
+
+	"default":
+
+	In default mode, resctrl assumes there is a hardware counter for each
+	event within every CTRL_MON and MON group. On AMD platforms, it is
+	recommended to use mbm_cntr_assign mode if supported, because reading
+	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
+	there is no counter associated with that event.
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index f91fe605766f..3880480a41d2 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -854,6 +854,30 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
+					struct seq_file *s, void *v)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+
+	mutex_lock(&rdtgroup_mutex);
+
+	if (r->mon.mbm_cntr_assignable) {
+		if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
+			seq_puts(s, "[mbm_cntr_assign]\n");
+			seq_puts(s, "default\n");
+		} else {
+			seq_puts(s, "mbm_cntr_assign\n");
+			seq_puts(s, "[default]\n");
+		}
+	} else {
+		seq_puts(s, "[default]\n");
+	}
+
+	mutex_unlock(&rdtgroup_mutex);
+
+	return 0;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -1910,6 +1934,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= mbm_local_bytes_config_show,
 		.write		= mbm_local_bytes_config_write,
 	},
+	{
+		.name		= "mbm_assign_mode",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_mbm_assign_mode_show,
+		.fflags		= RFTYPE_MON_INFO,
+	},
 	{
 		.name		= "cpus",
 		.mode		= 0644,
-- 
2.34.1

