Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D9217655;
	Wed, 22 Jan 2025 20:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577444; cv=fail; b=igL8IcnOI//ODs+9RGaCA1ucKtI0olvm6vXiyVK5Hnj28uwPVH6V75o3uLeZzYQLocHCP14+rylxcHYEFz60khfyT0rVx89zssepbUS5FlmVOEfB7laFununrqD8oC2ooCVZtjRKDnnwcsg9f5NvLWdWpgZDfolHxTzSbp/n3o0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577444; c=relaxed/simple;
	bh=wZJIdvfQhT2zB1jsJeb7wSQBw8wCfN0hjqlMAT8GE2E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IWSJ1pY8Bcv0i6A8NWnZGiJlI1+gzKU7GxYTrIlHPg10LKJP0/pisNYVXjqSAHVnOhwjIq9Qa0ToLyMykNk8V3N2mMA7mWh0BM6l2j5cJ3r9C8ojTwwvQhvLBtr0u5IKCADok+zzObNkf9gJtK+ikl2Cj/ETwLw1D7R7QbMoT9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=A87veTWw; arc=fail smtp.client-ip=40.107.244.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="A87veTWw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIF0HKYx6hmIUz8uKM8leQxaL9+c5luXd1sF7e0Ykml3b12UvtnU0KIsWLGc2ykRUh3YsLfv9CUEdoxZTwIl9pSiqAm6f3sITqkC2JoCvd+S3N+E8UlKli905k8V717INnaJ2IEohp6LYxGbhtW0L2vuymAkFIGNv0m1r8JkWyJj+9rILZpwPXL9WocHTq6vUzJEEdqrd6nxXnaXF93/epHyeqTi+C/YPrhYkhO+Y+ZivAywbmShD4411XP/IN456om8wQxuX7nzCD/D0dxxpEOofhCchVuVLtjJv/tI8HeTh6JFcYs/CXF+qkRhWUXIWLmx/Mq+mHrDVo95cjDs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra1VRAElPMsU0pELvWluObkjlIr38D9Z82Ls1r/EjBM=;
 b=DN8NjXpJFTzVjfB0g7lDRxAw2BSZAZg+SRtVAogXScTUd9yi+wgFqJkk81h7cgv3aWbRVIgJpuv8ZIj64m4Cbbhfbsups+m+IrZ6uN1LrSPRsTkrI/SlD+l96f+FsjBiFdg84NANmfCabsUfo3IxFFMo53BTNc7JZfeRzSf682Dd2v/JLWSmeBmmbLz0DaXx1G+J5F7xAZmIzMCUklbsfW1HlxwKKTpznTtFbHTWos+e51029dlNJiqcfYcG17CeI7F7QosRT/XT8i/b6vLyqZg1SAs97CmVx+g7YRHzD7/U+VvjV6N8SRbMAm4qomySMA4U708IF8vCkI/Vk4/JHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra1VRAElPMsU0pELvWluObkjlIr38D9Z82Ls1r/EjBM=;
 b=A87veTWwQcLHzoyYteRZwaRQcTzY8UOodFZw+QxefykHmdj8iNIlkW2iAWwgu105ZFEzQVAgrfbzwG9nktDw+fndC4pdCtfIBSwcMrboJjUUjvb/D68MiGD1yhhaIo9833/OFT7JzmOxmdcIAz5ffDxXrkUH4JaPeKSQtXhjEu8=
Received: from CH0PR03CA0393.namprd03.prod.outlook.com (2603:10b6:610:11b::21)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 20:23:56 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::87) by CH0PR03CA0393.outlook.office365.com
 (2603:10b6:610:11b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:54 -0600
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
Subject: [PATCH v11 23/23] x86/resctrl: Introduce interface to modify assignment states of the groups
Date: Wed, 22 Jan 2025 14:20:31 -0600
Message-ID: <fe1c0c4cebd353ccb3e588d7ea2fe9ef3dff0ef2.1737577229.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1737577229.git.babu.moger@amd.com>
References: <cover.1737577229.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a77854f-f8b0-4239-a8b0-08dd3b22b218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QmNVYjhBMWhkVU5XRk1nVkNMZGljZlBOTTZnYk81THlzYVdTVEtreVBlVi9R?=
 =?utf-8?B?Y2ZjdUxwVHZqd2w0ZzZkU0wwT3Zqb09mS01hanQ1Y2kvdGZjb1l4cVpnRlVz?=
 =?utf-8?B?VCtNaFg2WlJVdTUxTUhFNjVOb0lHNTZYWkdLMmRSYmRqVy94dWNoZjBpV3Rm?=
 =?utf-8?B?L2xmZEFJb1M4M2hKN01WZCtvdDhSa25tUzBLVDYyZnJyR1JYTXRWYjJoTml0?=
 =?utf-8?B?NVd2a012TDlCU2poYTVyWFRPai9DUndzK1Z6ekFpdG1jNlVicUlVV1orSUpq?=
 =?utf-8?B?d2xYMnFxdlArRWxKbE1CY3kySnFFYUQrenN3SmhnOVRvZUVGZEFXbUdERThZ?=
 =?utf-8?B?ejlFYmhJYUVCK2FxQTRrN1dVenRJWnpQeHNiKzhoZ1hSV01iYk5ZaG5SR1Zt?=
 =?utf-8?B?dm9TcVNmbGZTbWVvWUMzYlQwY3lmWHQ5TDEwbU16b2hKYU1tYWpuSGRXNC8x?=
 =?utf-8?B?SFJ3L1dlSlYrRmlxL3Q5VnZwRkpMLy9RVlc4aFIzM29HNW9rM1dYd3JRVXlB?=
 =?utf-8?B?L0JmMTRoazR4VkFqYkJ5dHNnY1pTZ1djSDJVU01nNUswOHdLbldwaUIrWGRO?=
 =?utf-8?B?c1lZalVNeXRpOGpZZ3UxeGJMVEVucUxSUXk1SW5jbjNJNklRQW9IeUtYUGd6?=
 =?utf-8?B?b1ZSM3lMbStFaWZVSURXbllGblNQUHpUNUdLUnV6K2I4VWp4M3NQYW8xZTZH?=
 =?utf-8?B?VnlzaXFGMitRUFlRME1Qa3pkc2QwZG11Nlg5TEg0cGlnbVpuV0NaM0U0a0Qw?=
 =?utf-8?B?akNmblFHZTZhVUxRcFJ5MktiRkgzMTF0c1NYUVhkcjM0QzdJQkR0aXJJYkx3?=
 =?utf-8?B?Mm1kaWpDOXNQOC9RUG51Z1NBOEtZNnBQVDRSQ05rdkt1aEVqNmV6ZXBwUEIw?=
 =?utf-8?B?aDd3VGYwbUxVNi80amlVajYvL3FFTmR1Wm1YWTFidFBhWWNrcjRHS2dDWDRi?=
 =?utf-8?B?bk1paHVseUgxaEFGOGF5S0xFcE45N3hGVHdUVWM2SDRzc1g3VWVQbU1GZHdR?=
 =?utf-8?B?Z0xudnNQdllmWFd2NjVZMzBYdDdRRVZaZFhTNWNDM09LTmhoRGZhSmdvMjk1?=
 =?utf-8?B?d3NTekh1N3g1MlFaTWNoaFMwWEEzRHNMT25HZ1duZmpJcDhSTVB3dXRXczU3?=
 =?utf-8?B?eHJnSTlObVZ2aGo0WVRqanBHWTk5ZFVYb1BvTHZaU0N2RWR0N3Fjb3MrZkVx?=
 =?utf-8?B?bFBKanBpNjkrbEU3TlF5WkpmeWtZZm8wT3M4Zmx0M3VWSk9GRE9uNjFXZGVy?=
 =?utf-8?B?MFJoNE5CdTVaci9qUmNiekptVGl2S0NucXZNMmdTa1AxVzJLWERkYWZHSEV4?=
 =?utf-8?B?VyszNDFqLzhnSnJqU25ZOHg5MjNSMGtpRzl6T1NjYWJ5Y0tTRGZqR1hOMVQ1?=
 =?utf-8?B?b2lyb0xwSFZady9HSCtycTZEUCtmU1QzaGY1R0lMK0hxWmNjN2hDck1hdFhu?=
 =?utf-8?B?TndsS3JVbnp3bFJKS2h6aHRyUWxZQngxQkZqL1l2dndyc0Q3ZndMNHlGcE9O?=
 =?utf-8?B?ZzgrbXF1MmgvYkszckpFRm53RmQ3VlhHZk0zdFJ4STZVdEZhaUlpUlNYMTFa?=
 =?utf-8?B?RTNhVGl0OW5Za2hHVWpXZUd5N1lndGkrVU9lWHJuM29UUlpYL1dXOUt3VnQx?=
 =?utf-8?B?R1F6VFBjcTBmOGxzalY4UVkwUDFYNXl0bXl2V2lEN1MxUVhheDl0MFYvcHFo?=
 =?utf-8?B?REJuQ2RhRFI1OVZ2Mkp1MDIrdTE0RGFoQkFQL3ZoMUpxWkdrQUdudS9aODBr?=
 =?utf-8?B?R1BXemt3b1lvcVEwRUVITy92UWFZVitseFB6WWs3ZW5VUHdSbDRnOTlPY0Rq?=
 =?utf-8?B?Uy90cXJaWFRFWHkyNWt0Rkc5a0FQRENCMm9EcjB6Sjk2ME9tb29qUVZZcTVw?=
 =?utf-8?B?UmE5S2xqeW9UUUF2Z2ZrSzlQQS9sdHBHZXVNei9PY0NFZDJyMnBSUEs2YXJa?=
 =?utf-8?B?WEFtT0tYbExXdnA3alkzOXdmYUJ6by9KOUpHcSthYnd6bjlzQ1NML0U0NXFq?=
 =?utf-8?Q?G5OkrWmUG+VjLyO5L2lyUwDv6DTdUk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:55.8428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a77854f-f8b0-4239-a8b0-08dd3b22b218
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319

When mbm_cntr_assign mode is enabled, users can designate which of the MBM
events in the CTRL_MON or MON groups should have counters assigned.

Provide an interface for assigning MBM events by writing to the file:
/sys/fs/resctrl/info/L3_MON/mbm_assign_control. Using this interface,
events can be assigned or unassigned as needed.

Format is similar to the list format with addition of opcode for the
assignment operation.
 "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"

Format for specific type of groups:

 * Default CTRL_MON group:
         "//<domain_id><opcode><flags>"

 * Non-default CTRL_MON group:
         "<CTRL_MON group>//<domain_id><opcode><flags>"

 * Child MON group of default CTRL_MON group:
         "/<MON group>/<domain_id><opcode><flags>"

 * Child MON group of non-default CTRL_MON group:
         "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"

Domain_id '*' will apply the flags on all the domains.

Opcode can be one of the following:

 = Update the assignment to match the flags
 + Assign a new MBM event without impacting existing assignments.
 - Unassign a MBM event from currently assigned events.

Assignment flags can be one of the following:
 t  MBM total event
 l  MBM local event
 tl Both total and local MBM events
 _  None of the MBM events. Valid only with '=' opcode. This flag cannot
    be combined with other flags.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Fixed the static check warning with initializing dom_id in resctrl_process_flags().

v10: Fixed the issue with finding the domain in multiple iterations.
     Printed error message with domain information when assign fails.
     Changed the variables to unsigned for processing assign state.
     Taken care of few format corrections.

v9: Fixed handling special case '//0=' and '//".
    Removed extra strstr() call.
    Added generic failure text when assignment operation fails.
    Corrected user documentation format texts.

v8: Moved unassign as the first action during the assign modification.
    Assign none "_" takes priority. Cannot be mixed with other flags.
    Updated the documentation and .rst file format. htmldoc looks ok.

v7: Simplified the parsing (strsep(&token, "//") in rdtgroup_mbm_assign_control_write().
    Added mutex lock in rdtgroup_mbm_assign_control_write() while processing.
    Renamed rdtgroup_find_grp to rdtgroup_find_grp_by_name.
    Fixed rdtgroup_str_to_mon_state to return error for invalid flags.
    Simplified the calls rdtgroup_assign_cntr by merging few functions earlier.
    Removed ABMC reference in FS code.
    Reinette commented about handling the combination of flags like 'lt_' and '_lt'.
    Not sure if we need to change the behaviour here. Processed them sequencially right now.
    Users have the liberty to pass the flags. Restricting it might be a problem later.

v6: Added support assign all if domain id is '*'
    Fixed the allocation of counter id if it not assigned already.

v5: Interface name changed from mbm_assign_control to mbm_control.
    Fixed opcode and flags combination.
    '=_" is valid.
    "-_" amd "+_" is not valid.
    Minor message update.
    Renamed the function with prefix - rdtgroup_.
    Corrected few documentation mistakes.
    Rebase related changes after SNC support.

v4: Added domain specific assignments. Fixed the opcode parsing.

v3: New patch.
    Addresses the feedback to provide the global assignment interface.
---
 Documentation/arch/x86/resctrl.rst     | 116 +++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h |  10 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 241 ++++++++++++++++++++++++-
 3 files changed, 365 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 3040e5c4cd76..47e15b48d951 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -356,7 +356,8 @@ with the following files:
 	 t  MBM total event is assigned.
 	 l  MBM local event is assigned.
 	 tl Both MBM total and local events are assigned.
-	 _  None of the MBM events are assigned.
+	 _  None of the MBM events are assigned. Only works with opcode '=' for write
+	    and cannot be combined with other flags.
 
 	Examples:
 	::
@@ -374,6 +375,119 @@ with the following files:
 	There are four resctrl groups. All the groups have total and local MBM events
 	assigned on domain 0 and 1.
 
+	Assignment state can be updated by writing to "mbm_assign_control".
+
+	Format is similar to the list format with addition of opcode for the
+	assignment operation.
+
+		"<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
+
+	Format for each type of group:
+
+        * Default CTRL_MON group:
+                "//<domain_id><opcode><flags>"
+
+        * Non-default CTRL_MON group:
+                "<CTRL_MON group>//<domain_id><opcode><flags>"
+
+        * Child MON group of default CTRL_MON group:
+                "/<MON group>/<domain_id><opcode><flags>"
+
+        * Child MON group of non-default CTRL_MON group:
+                "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
+
+	Domain_id '*' will apply the flags to all the domains.
+
+	Opcode can be one of the following:
+	::
+
+	 = Update the assignment to match the MBM event.
+	 + Assign a new MBM event without impacting existing assignments.
+	 - Unassign a MBM event from currently assigned events.
+
+	Examples:
+	Initial group status:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	  non_default_ctrl_mon_grp//0=tl;1=tl
+	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
+	  //0=tl;1=tl
+	  /child_default_mon_grp/0=tl;1=tl
+
+	To update the default group to assign only total MBM event on domain 0:
+	::
+
+	  # echo "//0=t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+
+	Assignment status after the update:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	  non_default_ctrl_mon_grp//0=tl;1=tl
+	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
+	  //0=t;1=tl
+	  /child_default_mon_grp/0=tl;1=tl
+
+	To update the MON group child_default_mon_grp to remove total MBM event on domain 1:
+	::
+
+	  # echo "/child_default_mon_grp/1-t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+
+	Assignment status after the update:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	  non_default_ctrl_mon_grp//0=tl;1=tl
+	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
+	  //0=t;1=tl
+	  /child_default_mon_grp/0=tl;1=l
+
+	To update the MON group non_default_ctrl_mon_grp/child_non_default_mon_grp to unassign
+	both local and total MBM events on domain 1:
+	::
+
+	  # echo "non_default_ctrl_mon_grp/child_non_default_mon_grp/1=_" >
+			/sys/fs/resctrl/info/L3_MON/mbm_assign_control
+
+	Assignment status after the update:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	  non_default_ctrl_mon_grp//0=tl;1=tl
+	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
+	  //0=t;1=tl
+	  /child_default_mon_grp/0=tl;1=l
+
+	To update the default group to add a local MBM event domain 0:
+	::
+
+	  # echo "//0+l" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+
+	Assignment status after the update:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	  non_default_ctrl_mon_grp//0=tl;1=tl
+	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
+	  //0=tl;1=tl
+	  /child_default_mon_grp/0=tl;1=l
+
+	To update the non default CTRL_MON group non_default_ctrl_mon_grp to unassign all the
+	MBM events on all the domains:
+	::
+
+	  # echo "non_default_ctrl_mon_grp//*=_" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+
+	Assignment status after the update:
+	::
+
+	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
+	  non_default_ctrl_mon_grp//0=_;1=_
+	  non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
+	  //0=tl;1=tl
+	  /child_default_mon_grp/0=tl;1=l
+
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index aec564fa2833..377b5db66793 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -62,6 +62,16 @@
 /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
 #define ABMC_ENABLE_BIT			0
 
+/*
+ * Assignment flags for mbm_cntr_assign mode
+ */
+enum {
+	ASSIGN_NONE	= 0,
+	ASSIGN_TOTAL	= BIT(QOS_L3_MBM_TOTAL_EVENT_ID),
+	ASSIGN_LOCAL	= BIT(QOS_L3_MBM_LOCAL_EVENT_ID),
+	ASSIGN_INVALID,
+};
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6e29827239e0..299839bcf23f 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1050,6 +1050,244 @@ static int resctrl_mbm_assign_control_show(struct kernfs_open_file *of,
 	return 0;
 }
 
+static unsigned int resctrl_str_to_mon_state(char *flag)
+{
+	unsigned int i, mon_state = ASSIGN_NONE;
+
+	if (!strlen(flag))
+		return ASSIGN_INVALID;
+
+	for (i = 0; i < strlen(flag); i++) {
+		switch (*(flag + i)) {
+		case 't':
+			mon_state |= ASSIGN_TOTAL;
+			break;
+		case 'l':
+			mon_state |= ASSIGN_LOCAL;
+			break;
+		case '_':
+			return ASSIGN_NONE;
+		default:
+			return ASSIGN_INVALID;
+		}
+	}
+
+	return mon_state;
+}
+
+static struct rdtgroup *rdtgroup_find_grp_by_name(enum rdt_group_type rtype,
+						  char *p_grp, char *c_grp)
+{
+	struct rdtgroup *rdtg, *crg;
+
+	if (rtype == RDTCTRL_GROUP && *p_grp == '\0') {
+		return &rdtgroup_default;
+	} else if (rtype == RDTCTRL_GROUP) {
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list)
+			if (!strcmp(p_grp, rdtg->kn->name))
+				return rdtg;
+	} else if (rtype == RDTMON_GROUP) {
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+			if (!strcmp(p_grp, rdtg->kn->name)) {
+				list_for_each_entry(crg, &rdtg->mon.crdtgrp_list,
+						    mon.crdtgrp_list) {
+					if (!strcmp(c_grp, crg->kn->name))
+						return crg;
+				}
+			}
+		}
+	}
+
+	return NULL;
+}
+
+static int resctrl_process_flags(struct rdt_resource *r,
+				 enum rdt_group_type rtype,
+				 char *p_grp, char *c_grp, char *tok)
+{
+	unsigned int op, mon_state, assign_state, unassign_state;
+	char *dom_str, *id_str, *op_str;
+	struct rdt_mon_domain *d;
+	unsigned long dom_id = 0;
+	struct rdtgroup *rdtgrp;
+	char domain[10];
+	bool found;
+	int ret;
+
+	rdtgrp = rdtgroup_find_grp_by_name(rtype, p_grp, c_grp);
+
+	if (!rdtgrp) {
+		rdt_last_cmd_puts("Not a valid resctrl group\n");
+		return -EINVAL;
+	}
+
+next:
+	if (!tok || tok[0] == '\0')
+		return 0;
+
+	/* Start processing the strings for each domain */
+	dom_str = strim(strsep(&tok, ";"));
+
+	op_str = strpbrk(dom_str, "=+-");
+
+	if (op_str) {
+		op = *op_str;
+	} else {
+		rdt_last_cmd_puts("Missing operation =, +, - character\n");
+		return -EINVAL;
+	}
+
+	id_str = strsep(&dom_str, "=+-");
+
+	/* Check for domain id '*' which means all domains */
+	if (id_str && *id_str == '*') {
+		d = NULL;
+		goto check_state;
+	} else if (!id_str || kstrtoul(id_str, 10, &dom_id)) {
+		rdt_last_cmd_puts("Missing domain id\n");
+		return -EINVAL;
+	}
+
+	/* Verify if the dom_id is valid */
+	found = false;
+	list_for_each_entry(d, &r->mon_domains, hdr.list) {
+		if (d->hdr.id == dom_id) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		rdt_last_cmd_printf("Invalid domain id %ld\n", dom_id);
+		return -EINVAL;
+	}
+
+check_state:
+	mon_state = resctrl_str_to_mon_state(dom_str);
+
+	if (mon_state == ASSIGN_INVALID) {
+		rdt_last_cmd_puts("Invalid assign flag\n");
+		goto out_fail;
+	}
+
+	assign_state = 0;
+	unassign_state = 0;
+
+	switch (op) {
+	case '+':
+		if (mon_state == ASSIGN_NONE) {
+			rdt_last_cmd_puts("Invalid assign opcode\n");
+			goto out_fail;
+		}
+		assign_state = mon_state;
+		break;
+	case '-':
+		if (mon_state == ASSIGN_NONE) {
+			rdt_last_cmd_puts("Invalid assign opcode\n");
+			goto out_fail;
+		}
+		unassign_state = mon_state;
+		break;
+	case '=':
+		assign_state = mon_state;
+		unassign_state = (ASSIGN_TOTAL | ASSIGN_LOCAL) & ~assign_state;
+		break;
+	default:
+		break;
+	}
+
+	if (unassign_state & ASSIGN_TOTAL) {
+		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+		if (ret)
+			goto out_fail;
+	}
+
+	if (unassign_state & ASSIGN_LOCAL) {
+		ret = resctrl_unassign_cntr_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+		if (ret)
+			goto out_fail;
+	}
+
+	if (assign_state & ASSIGN_TOTAL) {
+		ret = resctrl_assign_cntr_event(r, d, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
+		if (ret)
+			goto out_fail;
+	}
+
+	if (assign_state & ASSIGN_LOCAL) {
+		ret = resctrl_assign_cntr_event(r, d, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
+		if (ret)
+			goto out_fail;
+	}
+
+	goto next;
+
+out_fail:
+	sprintf(domain, d ? "%ld" : "*", dom_id);
+
+	rdt_last_cmd_printf("Assign operation '%s%c%s' failed on the group %s/%s/\n",
+			    domain, op, dom_str, p_grp, c_grp);
+
+	return -EINVAL;
+}
+
+static ssize_t resctrl_mbm_assign_control_write(struct kernfs_open_file *of,
+						char *buf, size_t nbytes, loff_t off)
+{
+	struct rdt_resource *r = of->kn->parent->priv;
+	char *token, *cmon_grp, *mon_grp;
+	enum rdt_group_type rtype;
+	int ret;
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
+	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
+		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
+		mutex_unlock(&rdtgroup_mutex);
+		cpus_read_unlock();
+		return -EINVAL;
+	}
+
+	while ((token = strsep(&buf, "\n")) != NULL) {
+		/*
+		 * The write command follows the following format:
+		 * “<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>”
+		 * Extract the CTRL_MON group.
+		 */
+		cmon_grp = strsep(&token, "/");
+
+		/*
+		 * Extract the MON_GROUP.
+		 * strsep returns empty string for contiguous delimiters.
+		 * Empty mon_grp here means it is a RDTCTRL_GROUP.
+		 */
+		mon_grp = strsep(&token, "/");
+
+		if (*mon_grp == '\0')
+			rtype = RDTCTRL_GROUP;
+		else
+			rtype = RDTMON_GROUP;
+
+		ret = resctrl_process_flags(r, rtype, cmon_grp, mon_grp, token);
+		if (ret)
+			break;
+	}
+
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 #ifdef CONFIG_PROC_CPU_RESCTRL
 
 /*
@@ -2073,9 +2311,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "mbm_assign_control",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_mbm_assign_control_show,
+		.write		= resctrl_mbm_assign_control_write,
 	},
 	{
 		.name		= "mbm_assign_mode",
-- 
2.34.1

