Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA01E72618;
	Fri, 17 Jul 2026 21:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322850; cv=fail; b=dEeNVx4cID249YZCkFX/XfhPK49v9xc3SY653i+d2zvO3YCQnppQH0MkoXaJ/0F1lR936BB7T/Lz1c1vn3KxDK+W6tzh1QxAvONjCsNxgwNQrDdJchwBUZz6Q/S2dhoqh2Byi+uuHmz2SF2wHP1yf0JMATZlTPwFUbFtxoM6X3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322850; c=relaxed/simple;
	bh=ScvYE3DXCI6sXmcDnNOBXWwpO2D5IZNIf1B0lzqLA7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dxFLHYmo4QmmKaZ+XJh7GiImGGWs+fSTNBfGbMPMVm6xyjqAH+Us8FNsZSvHoawHYiWfyl9GmsmNWv1qg2c9j00gm8edOJ+tdl3dC8jT5+cKvoVz+RvdO5hxq4hXzTy82ra7BNug+p7Vf2jHUe+I04pjCHR63KYIGVOJ+oiIEhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kf28NxJf; arc=fail smtp.client-ip=52.101.48.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kf28NxJf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/MUtXHCheBfvDvzszFFncfLewKIxYd+LMEKQO4Xf77Ccj2s6gX651+HnoT5S/MVOYH70IZwjBb5zUj9sm6v2kzJPl+C2YwYCnwJjCdySVWhcK/ga23BvyT3h0ZiGcjYM57eMcsBW5CeAopvw0Mj0IaeKtI0k/4Cu1SJPBMFJjB0YTi8W9KYAiaf7PTzUJtDKbMnN8GJYC7EZ3nEmBkbQd3h3W4YjyxH3eoYdd1Nm9Ayv9yq0fMhZeJeTCWnnOAsYIhp9Amvxpr5scN9RSlgVFX8okzt5kliQc2eoF1M+BMgH8zDSoyOYaIMRFysULPMM2hkMRCBpfk1OP2JKFcoIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7YZB8xSU++C3DzvI1bjSK3Th4UQAYo/32aNqXTgeEc=;
 b=se8UPWR2oY6YGD9Sa0/zls0smhQPfozRlnq3M+kubCsXlcVV3dEuO4YGU4AKcch4aVfiGnV3dT2zS2pTpvQteGW2ZWdsXv0A5wHbUYXoMdOVkhEHGLbBQvRkGJ/B3YLF8Gg8IhwFAlUx8e18IRrp/GxKK+fSUFPK0DZYntKhgOe8+4WrWz1DH5b6zAhgx9CX0ijA4DMBnVgX6+osiDhPJVe+Y8wft2kVYwYX8Y5m21VArhyne7BPfD64p299GXgjwBHVYKrzFkOcvvJ2gM1AhaYYmfwDeg1xGFGbGepzo2cIQ/173Mzgzq3AU3swZJUcfbgipPXNmTcQ0G5stkoEEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7YZB8xSU++C3DzvI1bjSK3Th4UQAYo/32aNqXTgeEc=;
 b=Kf28NxJfQzKsWcPu63yFifDVRb4FS5uWTZhDp4JFx2skAMTt4huvjdHHoM8MggAdPorTgydFc3+gJImT+RiHWMxw+gyveyTC3mn5l8kt9JT0VhlOHayk88Rz7kDW6drjuZtPyPAjVgz6jkiz2TDFbC33hNUKXwp0MzrG2RLSrJE=
Received: from MW4PR03CA0109.namprd03.prod.outlook.com (2603:10b6:303:b7::24)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Fri, 17 Jul
 2026 21:14:04 +0000
Received: from MWH0EPF000C6189.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::2c) by MW4PR03CA0109.outlook.office365.com
 (2603:10b6:303:b7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 21:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6189.mail.protection.outlook.com (10.167.249.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 21:14:04 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 17 Jul
 2026 16:14:01 -0500
From: Babu Moger <babu.moger@amd.com>
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
Subject: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode "default" on boot
Date: Fri, 17 Jul 2026 16:13:55 -0500
Message-ID: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6189:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: a45c9ad5-6b49-4fda-e1b6-08dee44854ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|7416014|1800799024|82310400026|10067099003|18002099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	hY8dJyjXnV5w9I6Jkb5VNX74eKCaGI3EwCYNHKI1z75opxlNVGbzCUem7jL446Ch1MLyZjF/QDB8W0dUg8dnW/Grrg4AVOZmLMGGBgzSWKyu3CMZ+b3zWh88pxL5ipj+XYTNyiyY4aXyiIP5kNL0UBZgkL4TD9LGA2X3Kwn0NYq4Y8V8Mv1XT83xHtS7c0tH/gmC8Z8e6in7+GK2ci17X+KWUUpcxcceK2BuKZYWnygcK30nBelZ27iUD440vdjvVYF6k7JB5C3VwyoPa1ubPdnYSYmV7tu97r2hCS7mVR3aj9pU1GK96iXToOBRinyQrK8ndyFFS595kdEvdZLjJfD2lSa63a3xC7rGUIm3q+49p6hLLpfRLDo+evPKWdmNIbSh777HEvjjD93Vem8huK3/vthfV5u/IY1lF6jxwJIVNuU61yQ79SDVUYRZ1qR0z/G/NUjtEglxINU3Fe/EMUayEVp1ERsFF5mxI6KeZz6BokRb2Sz+pYhd8/EYN3ICM4TUN4bbuoLcPaZkps4cEWoiZwqsd5ve7N2LiRPWO2SUjFUaBRjPK0Pu3WyRQyuDNtn5ynMT6r7Vb73/pEdXOvt1zsXLQNedWNaJh/ZVkOfPykbOMoREhUw+/DFmjuxu4KSU7jbhDVGhGnFDxxNLlh7Woscd155zsFrYd9OtCmm7XwnWQOC5Ayx7TGZxk5/x8K9rm6gSh5G+5T5XhcgUfw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(7416014)(1800799024)(82310400026)(10067099003)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lF1ot8GhsBW5djogO+883d0vbwnt11ee3tFzU0QR/qgdvG4sZD6cWgM9LfLDZvcIqKfIyEJFf7JRJCDpGgfPFmwIhxRUKxna2R+Bu6hCTLbKSvBdMR/QBo1/kJFJj9N/fxYE5bTknSkp5OHNu88FfqiigAXvJ7Ty7g6McaHe4FNF6iO7RI1VmInlSpeYwWTU4L9Afoev3I/3SRYnCrlVDoHPEMTVXpBpbDvHtxVS+gDxn9te3sM571Ene5RvBkCMvr0DrZrCTI3yd5KfoW2/hJNCTGr6pYLQOk39Dhqrd4JYWe9rXQbeugAz7yzH2CksiCWRlGPwDepYWl2lXkGLpBUfZtv11YA1+PTsZ1IsJYGBqAdIc1m68L4P9h+suWlcUnBWJhl6leoBGiE27U1DSI7q00XR6mFVVfMJWUDkbTOsXTSM9ct6Xrbbsm8r8cDj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 21:14:04.3475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45c9ad5-6b49-4fda-e1b6-08dee44854ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6189.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708

The kernel currently enables the ABMC-based "mbm_event" mode by default on
hardware that supports it. However, this can cause bandwidth monitoring
failures with existing userspace tools such as pqos.

The pqos tool mounts the resctrl filesystem and creates 16 or more resctrl
groups by default. On systems with 32 or fewer ABMC counters, this default
configuration can consume all available counters, since each group requires
one counter for local MBM and another for total MBM. If additional
monitoring groups are created, counter resources are exhausted and pqos
tool reports memory bandwidth counters as zero for those groups.

Avoid this compatibility issue by leaving mbm_assign_mode in the "default"
mode during initialization. Users who want to use ABMC can continue to
enable it explicitly:

 echo mbm_event > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode

Update the resctrl documentation to reflect the new boot-time default and
adjust the mbm_assign_mode examples accordingly.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
There are plans to enable "mbm_event" by default once additional counters
are available. For now, keep the default mode to maintain compatibility
with existing tools.
---
 Documentation/filesystems/resctrl.rst | 71 ++++++++++++++++-----------
 arch/x86/kernel/cpu/resctrl/monitor.c |  1 -
 2 files changed, 42 insertions(+), 30 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..e38bfd15fc3d 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -355,8 +355,8 @@ with the following files:
 	::
 
 	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
-	  [mbm_event]
-	  default
+	  [default]
+	  mbm_event
 
 	"mbm_event":
 
@@ -375,19 +375,23 @@ with the following files:
 	to the events. Otherwise, the MBM event counters will return 'Unassigned' when read.
 
 	The mode is beneficial for AMD platforms that support more CTRL_MON
-	and MON groups than available hardware counters. By default, this
-	feature is enabled on AMD platforms with the ABMC (Assignable Bandwidth
-	Monitoring Counters) capability, ensuring counters remain assigned even
-	when the corresponding RMID is not actively used by any processor.
+	and MON groups than available hardware counters. On platforms with the
+	ABMC (Assignable Bandwidth Monitoring Counters) capability, mbm_event
+	mode ensures counters remain assigned even when the corresponding RMID
+	is not actively used by any processor.
 
 	"default":
 
 	In default mode, resctrl assumes there is a hardware counter for each
-	event within every CTRL_MON and MON group. On AMD platforms, it is
-	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
-	events between reads resulting from hardware re-allocating counters. This can
-	result in misleading values or display "Unavailable" if no counter is assigned
-	to the event.
+	event within every CTRL_MON and MON group. This mode is enabled by default.
+
+	On AMD platforms with more CTRL_MON and MON groups than the available
+	hardware counters, hardware may re-allocate counters between reads
+	while in default mode. This can result in misleading memory bandwidth values
+	or display "Unavailable" if no counter is allocated to the event. In such
+	cases, it is recommended to use the mbm_event mode, if supported, to prevent
+	reset of MBM events between reads resulting from hardware re-allocating
+	counters.
 
 	* To enable "mbm_event" counter assignment mode:
 	  ::
@@ -471,8 +475,8 @@ with the following files:
 
 	Determines if a counter will automatically be assigned to an RMID, MBM event
 	pair when its associated monitor group is created via mkdir. Enabled by default
-	on boot, also when switched from "default" mode to "mbm_event" counter assignment
-	mode. Users can disable this capability by writing to the interface.
+	when switched to "mbm_event" counter assignment mode. Users can disable this
+	capability by writing to the interface.
 
 	"0":
 		Auto assignment is disabled.
@@ -1788,32 +1792,41 @@ a. Check if MBM counter assignment mode is supported.
 
   # mount -t resctrl resctrl /sys/fs/resctrl/
 
+  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
+  [default]
+  mbm_event
+
+The "mbm_event" and "default" modes are supported. The "default" mode
+is enabled by default.
+
+b. Enable "mbm_event" counter assignment mode.
+::
+
+  # echo "mbm_event" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
   # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
   [mbm_event]
   default
 
-The "mbm_event" mode is detected and enabled.
-
-b. Check how many assignable counters are supported.
+c. Check how many assignable counters are supported.
 ::
 
   # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
   0=32;1=32
 
-c. Check how many assignable counters are available for assignment in each domain.
+d. Check how many assignable counters are available for assignment in each domain.
 ::
 
   # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
   0=30;1=30
 
-d. To list the default group's assign states.
+e. To list the default group's assign states.
 ::
 
   # cat /sys/fs/resctrl/mbm_L3_assignments
   mbm_total_bytes:0=e;1=e
   mbm_local_bytes:0=e;1=e
 
-e.  To unassign the counter associated with the mbm_total_bytes event on domain 0.
+f.  To unassign the counter associated with the mbm_total_bytes event on domain 0.
 ::
 
   # echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
@@ -1821,7 +1834,7 @@ e.  To unassign the counter associated with the mbm_total_bytes event on domain
   mbm_total_bytes:0=_;1=e
   mbm_local_bytes:0=e;1=e
 
-f. To unassign the counter associated with the mbm_total_bytes event on all domains.
+g. To unassign the counter associated with the mbm_total_bytes event on all domains.
 ::
 
   # echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
@@ -1829,7 +1842,7 @@ f. To unassign the counter associated with the mbm_total_bytes event on all doma
   mbm_total_bytes:0=_;1=_
   mbm_local_bytes:0=e;1=e
 
-g. To assign a counter associated with the mbm_total_bytes event on all domains in
+h. To assign a counter associated with the mbm_total_bytes event on all domains in
 exclusive mode.
 ::
 
@@ -1838,7 +1851,7 @@ exclusive mode.
   mbm_total_bytes:0=e;1=e
   mbm_local_bytes:0=e;1=e
 
-h. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
+i. Read the events mbm_total_bytes and mbm_local_bytes of the default group. There is
 no change in reading the events with the assignment.
 ::
 
@@ -1851,7 +1864,7 @@ no change in reading the events with the assignment.
   # cat /sys/fs/resctrl/mon_data/mon_L3_01/mbm_local_bytes
   121212144
 
-i. Check the event configurations.
+j. Check the event configurations.
 ::
 
   # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
@@ -1861,7 +1874,7 @@ i. Check the event configurations.
   # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
   local_reads,local_non_temporal_writes,local_reads_slow_memory
 
-j. Change the event configuration for mbm_local_bytes.
+k. Change the event configuration for mbm_local_bytes.
 ::
 
   # echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
@@ -1870,7 +1883,7 @@ j. Change the event configuration for mbm_local_bytes.
   # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
   local_reads,local_non_temporal_writes,local_reads_slow_memory,remote_reads
 
-k. Now read the local events again. The first read may come back with "Unavailable"
+l. Now read the local events again. The first read may come back with "Unavailable"
 status. The subsequent read of mbm_local_bytes will display the current value.
 ::
 
@@ -1883,9 +1896,9 @@ status. The subsequent read of mbm_local_bytes will display the current value.
   # cat /sys/fs/resctrl/mon_data/mon_L3_01/mbm_local_bytes
   1566565
 
-l. Users have the option to go back to 'default' mbm_assign_mode if required. This can be
-done using the following command. Note that switching the mbm_assign_mode may reset all
-the MBM counters (and thus all MBM events) of all the resctrl groups.
+m. Users have the option to switch back to 'default' mbm_assign_mode if required. This
+can be done using the following command. Note that switching the mbm_assign_mode may
+reset all the MBM counters (and thus all MBM events) of all the resctrl groups.
 ::
 
   # echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
@@ -1893,7 +1906,7 @@ the MBM counters (and thus all MBM events) of all the resctrl groups.
   mbm_event
   [default]
 
-m. Unmount the resctrl filesystem.
+n. Unmount the resctrl filesystem.
 ::
 
   # umount /sys/fs/resctrl/
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 3838e0a13d36..8a0d6086518b 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -471,7 +471,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
 		r->mon.mbm_cntr_configurable = true;
 		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
 		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
-		hw_res->mbm_cntr_assign_enabled = true;
 	}
 
 	r->mon_capable = true;
-- 
2.43.0

