Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287411EB2F;
	Wed, 22 Jan 2025 20:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577258; cv=fail; b=H+ZVxfnOqM6TMvm38vJ9WtPEWmeUxVO3B0+FK1hb64AlPARAVXMVL/NYWyfCxUJdq5LV1CsXzqvB1j9n5CeyabcCs3Tzed5HXtsQiQQ923c7RWBTneKWxg5kZwMc2dMZTgRIpJYUsxFfjrrweHxgMKXwBnMMY8F7y+MJ5BiMBrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577258; c=relaxed/simple;
	bh=+MmZNop5UJYRGQa+4Lq+mmSUIjlWvA19MHBcLKGDBlE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QHr1N0OqnErBtbOY1+2LngOliFhrCWA2cBDGmo9TMqwoLdAmBmKX4vvbfhvz1nOj49DcS4VZpYKmdIsdwTiHlKxQstMcf5q/vF0PP3nDhGo80zvmO6nLWlX2SMHT0jqahEDFJ6t4c2ZW4xRcU4b/N8IFFQJvNTIBi2AhXnjcL/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=l4PBwzx0; arc=fail smtp.client-ip=40.107.223.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="l4PBwzx0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8a9uTyqMRUMIQKi1qh6EfzBaan9Vnt0T90RJrSBopmB4VWwNN4qfdOCkXDzTDdf2TlNK8q+CXDKarVmnzRbObnmqXzqdGQHs1prG7QpG4UQ6FQV0Xtb9O7sfKeANhwLkAorsffjSG2+m1N72yQcH526qBA69bL541Uxlcmh6KdhbeBMHmPosXQSWmlmAEPajAvdRx37Qd/xmxMOevc0xr19zCuRZSaDHfh8cCPk17h/pauZzt2zKqZML7dUCrWRLEOxxUIzus3r9F+TC2UP+zHW4d8qFvLD1QJdOn/VWccD8GeI6+BwI4pIEedTyK6VVj3MTeKSEgEBYZ0gTehlFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7QKWO6IyienfAthVxNUXSi4SQGHEYMJ5+aGWy52jRQ=;
 b=GsTrSPrSsG4ByyCzPiutdwy0G/GW479YUWqlZq/eCzU9B4qH7NIbspxJCMEHD3v4jNeMQDN3sdAHjrLvVncTtJ1kfDDfWSN6+4pE11Ubup3RnrtDeyTvUCdiDYKG92wEA8UUaiKI3RmTgKyya6iOvejfdEfmbARandCa1iXakbGWcpfjl5FP2t3VQBBzYer19nAuDYzW9vli8oDWbR27kns0G410K8shRhLJvq9X3xB31+1cwTtj+gPx1yzSbSvhlg7TVGfjY8AQfZWdJ1R1x/J5mHf/gPH2HBDmlxb1T/lXsG918nBdoT3kj7rwcuCdsHNo+uevewH77YHPUC1nnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7QKWO6IyienfAthVxNUXSi4SQGHEYMJ5+aGWy52jRQ=;
 b=l4PBwzx0b2bSkthmte9cXvQleUual/YSO248VY8VZzAD4Ss0h3HzoOUsRAXEYisWjyQDU2/sAsTibPYzJdIFk+HsVnFx17q0mw8+Yf6hhxOsbElfIanbTsk4djMs8IIMw6LGFbdUOK/haZpV/lHfoMQsQVv+R+wV3g6+MiZpCGM=
Received: from CH0PR04CA0113.namprd04.prod.outlook.com (2603:10b6:610:75::28)
 by DM4PR12MB6350.namprd12.prod.outlook.com (2603:10b6:8:a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Wed, 22 Jan
 2025 20:20:50 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::bd) by CH0PR04CA0113.outlook.office365.com
 (2603:10b6:610:75::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:20:49 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:20:47 -0600
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
Subject: [PATCH v11 00/23] x86/resctrl : Support AMD Assignable Bandwidth Monitoring Counters (ABMC)
Date: Wed, 22 Jan 2025 14:20:08 -0600
Message-ID: <cover.1737577229.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|DM4PR12MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e71485b-9c2d-4915-5dc5-08dd3b224338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OVNselkyb0t2UFo2ZmQrZXJRRkgrQVlSZDF5ZWVrZFlLMzBPSTVad0Ixa002?=
 =?utf-8?B?c3MyVW1JZmhJRjJ1eHJTaE9vUDU4OUJqdHNhbFRaOEtmOXpiMEhnTFRTOVBY?=
 =?utf-8?B?bTU3Y0NyMHhVTW8wUDRuMUJjMGxITnJzUk5USExIUUw1bndqeCt3K0NWMjVr?=
 =?utf-8?B?ME1FSDQ2VlFpZ2hJdlhwOEdNcTJpdWY5TUlWY3hkc05yNnNPQmFYK3ZPREhP?=
 =?utf-8?B?VmRtQWhENGhPWmxhUzdOeXlJZ3FMcTE5eGVyY2ZyNzYyTTViRFh1TGtOL3Zw?=
 =?utf-8?B?alp0OHVxRkdMQjJLeFpKdW1uclhIVlZsU1FjZEd4Ni84THhHVlozVU1QWU1O?=
 =?utf-8?B?Z0NzbCtHQ1hERCt0VEhPeXB3U1pkRURDMjgvL05xVDYxOVZ4TG9TWjNPUmRM?=
 =?utf-8?B?RzlMUUpab0p6cjhBejlLaDdFOEFsMkw5Q3V0YUE2Wkh2dldqWFRCMkJaM0xV?=
 =?utf-8?B?R0JDcXdxRnFuNXpXVlphTFBjZTBEU3JhaUhLMUIvRVBaeXI5bnBFWFRXZlRD?=
 =?utf-8?B?THVDejN6OWQwY2Y1eU5wcVNQT0VxS2RLUnhVVkdWbGljVUFsbjBYdUZPclY0?=
 =?utf-8?B?MHk5bnpiSUVoMkdtRmVyZ3NZQVIwY0w4ZkYrdlhRVVlnWk40REZjZEs5bU5l?=
 =?utf-8?B?azJxVjNOazU1eXpSMlhqd3l3V09VN3VSZ01PWk1GdXhOa21QWDR3c1lGK2VG?=
 =?utf-8?B?Uy92aU5nTDJuM1JqaFh0R3ZvR3RyamI2VHNNVGp5MnlYUWt5bzdHaTIrWng2?=
 =?utf-8?B?NGFwY0d1cEFLYUlQZ2g5dXRscHFjaVczTDMyN2lSdFhTWmtQRldXUnUvWVFv?=
 =?utf-8?B?Tld1UG42VW5zK3FDNHdJME9KUTg5QTUyTzlpYkg2ZzMyNUpYYysrbGtIRG5z?=
 =?utf-8?B?WWRxRGxkSldMa2dCRVQvdzlUR0VmV2dwdDhHcmJuOGxQOXUzbXoxUmZ5cURs?=
 =?utf-8?B?dWRiNHpiNENySXo4a3JVT1ZCWVV4UTFERDdTMEZCaHBZZWpNOEJ4NDlqRUpr?=
 =?utf-8?B?a3NUMnltaENCdFZHbllxTVZoY01mMnZzWDM4aDd5L1N5UlFZeFpKd0FiNkJM?=
 =?utf-8?B?QmlIbFd1M1JCaFJsUlloUklZYXNRVTVsemxXT1N6c1hrRHJKOUhxaEdnQ0lB?=
 =?utf-8?B?L0dRNy90cFZpaDFRME9JcVVtM3dnSC9JaGlpZ3VrUFRSUTI5emcxR01QUjVW?=
 =?utf-8?B?N2d4bmZnb1hBd2hJT2NkbktCR2tSSCs4SmFzVWVJUEZCV0xOTWZ5bFQ5Q2FV?=
 =?utf-8?B?a2lYdGNHVHB2bWhKUDlPQllnV2gvaVo1WHRhQ09DdnhyYTExbFYxUWZtTDYr?=
 =?utf-8?B?eE85NWg3YTJrMWIyTEpoZG9hV2ZYYnV1QWowOW81UHFtRTc2RUxpYWhJMWhq?=
 =?utf-8?B?bk82U3hvKzlPUEgvUVVJaE5VTVZXaXlrbzF5OWZQQTRLSUZIa3VaeVpjdTk3?=
 =?utf-8?B?MGVzK3ZLREtuYWd6TnJXSHgwMVBaYnlCWHR5NUp4elkrYmY2anBjazZnYjFN?=
 =?utf-8?B?eFBQckpmNGJFTWhqMWllVU5HUzlsMUtmdDBGejl4bTJVQm1SOEFCYlFDMEhB?=
 =?utf-8?B?SGpUR2RqVnpnaXdONm5wK1NOblNwNDdPVWp1aWFOcHRtcFJYa0w1emg2N2Ev?=
 =?utf-8?B?OVdmTU1OK1IvSVU3Q0cwV0d3T2YrdVBmMUw3VFhJTDJ2OFFLYSs3ZTVDNzc4?=
 =?utf-8?B?WUh0RFpXdkZIUFd0MDZQQVV5YzlZWlVlUWhUaVh1a2FnSmJZNk9yV01UK29j?=
 =?utf-8?B?WXlSelRRdjE1bGJSVk5XWXJwTVROV2NoS21LM051ZWdHWllNQ0pZK0NhZ2FQ?=
 =?utf-8?B?WGF1cHZUdlBEZDlNRjJQQUM5ZHhlOHVYb2JZUVhCTE9BQ0ZPaXRCMzBBVVUx?=
 =?utf-8?B?K2RUZm9SQUV5NjhPYnFqMktQcmk1MUFiM2dVdFpTWmVmclNzMUZSdkVSYzQr?=
 =?utf-8?Q?NWzoaoVhYUvZEA2/7CQbtkvTuWPnzQqb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:20:49.8078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e71485b-9c2d-4915-5dc5-08dd3b224338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6350


This series adds the support for Assignable Bandwidth Monitoring Counters
(ABMC). It is also called QoS RMID Pinning feature

Series is written such that it is easier to support other assignable
features supported from different vendors.

The feature details are documented in the  APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC). The documentation is available at
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit
d361b84d51bfe (tip/master) Merge branch into tip/master: 'x86/tdx'

# Introduction

Users can create as many monitor groups as RMIDs supported by the hardware.
However, bandwidth monitoring feature on AMD system only guarantees that
RMIDs currently assigned to a processor will be tracked by hardware.
The counters of any other RMIDs which are no longer being tracked will be
reset to zero. The MBM event counters return "Unavailable" for the RMIDs
that are not tracked by hardware. So, there can be only limited number of
groups that can give guaranteed monitoring numbers. With ever changing
configurations there is no way to definitely know which of these groups
are being tracked for certain point of time. Users do not have the option
to monitor a group or set of groups for certain period of time without
worrying about counter being reset in between.
    
The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it is
assigned.  The assigned RMID will be tracked by the hardware until the user
unassigns it manually. There is no need to worry about counters being reset
during this period. Additionally, the user can specify a bitmask identifying
the specific bandwidth types from the given source to track with the counter.

Without ABMC enabled, monitoring will work in current 'default' mode without
assignment option.

# Linux Implementation

Create a generic interface aimed to support user space assignment
of scarce counters used for monitoring. First usage of interface
is by ABMC with option to expand usage to "soft-ABMC" and MPAM
counters in future.

Feature adds following interface files:

/sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignable
monitoring features supported. The enclosed brackets indicate which
feature is enabled.

/sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
counters available for assignment.

/sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: Reports the number of monitoring
counters free in each domain.

/sys/fs/resctrl/info/L3_MON/mbm_assign_control: Reports the resctrl group and monitor
status of each group. Assignment state can be updated by writing to the
interface.

# Examples

a. Check if ABMC support is available
	#mount -t resctrl resctrl /sys/fs/resctrl/

	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	[mbm_cntr_assign]
	default

	ABMC feature is detected and it is enabled.

b. Check how many ABMC counters are available. 

	# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
	32

c. Check how many ABMC counters are available in each domain.

	# cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs 
	0=30;1=30

d. Create few resctrl groups.

	# mkdir /sys/fs/resctrl/mon_groups/child_default_mon_grp
	# mkdir /sys/fs/resctrl/non_default_ctrl_mon_grp
	# mkdir /sys/fs/resctrl/non_default_ctrl_mon_grp/mon_groups/child_non_default_mon_grp

e. This series adds a new interface file /sys/fs/resctrl/info/L3_MON/mbm_assign_control
   to list and modify any group's monitoring states. File provides single place
   to list monitoring states of all the resctrl groups. It makes it easier for
   user space to learn about the used counters without needing to traverse all
   the groups thus reducing the number of file system calls.

	The list follows the following format:

	"<CTRL_MON group>/<MON group>/<domain_id>=<flags>"

	Format for specific type of groups:

	* Default CTRL_MON group:
	 "//<domain_id>=<flags>"

       * Non-default CTRL_MON group:
               "<CTRL_MON group>//<domain_id>=<flags>"

       * Child MON group of default CTRL_MON group:
               "/<MON group>/<domain_id>=<flags>"

       * Child MON group of non-default CTRL_MON group:
               "<CTRL_MON group>/<MON group>/<domain_id>=<flags>"

       Flags can be one of the following:

        t  MBM total event is enabled.
        l  MBM local event is enabled.
        tl Both total and local MBM events are enabled.
        _  None of the MBM events are enabled

	Examples:

	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control 
	non_default_ctrl_mon_grp//0=tl;1=tl
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
	//0=tl;1=tl
	/child_default_mon_grp/0=tl;1=tl
	
	There are four groups and all the groups have local and total
	event enabled on domain 0 and 1.

f. Update the group assignment states using the interface file /sys/fs/resctrl/info/L3_MON/mbm_assign_control.

 	The write format is similar to the above list format with addition
	of opcode for the assignment operation.
    	“<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>”
	
	* Default CTRL_MON group:
	        "//<domain_id><opcode><flags>"
	
	* Non-default CTRL_MON group:
	        "<CTRL_MON group>//<domain_id><opcode><flags>"
	
	* Child MON group of default CTRL_MON group:
	        "/<MON group>/<domain_id><opcode><flags>"
	
	* Child MON group of non-default CTRL_MON group:
	        "<CTRL_MON group>/<MON group>/<domain_id><opcode><flags>"
	
	Opcode can be one of the following:
	
	= Update the assignment to match the flags.
	+ Assign a new MBM event without impacting existing assignments.
	- Unassign a MBM event from currently assigned events.

	Flags can be one of the following:

        t  MBM total event.
        l  MBM local event.
        tl Both total and local MBM events.
        _  None of the MBM events. Only works with '=' opcode. This flag cannot be combined with other flags.
	
	Initial group status:
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
	non_default_ctrl_mon_grp//0=tl;1=tl
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
	//0=tl;1=tl
	/child_default_mon_grp/0=tl;1=tl

	To update the default group to enable only total event on domain 0:
	# echo "//0=t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control

	Assignment status after the update:
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
	non_default_ctrl_mon_grp//0=tl;1=tl
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
	//0=t;1=tl
	/child_default_mon_grp/0=tl;1=tl

	To update the MON group child_default_mon_grp to remove total event on domain 1:
	# echo "/child_default_mon_grp/1-t" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control

	Assignment status after the update:
	$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
	non_default_ctrl_mon_grp//0=tl;1=tl
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=tl
	//0=t;1=tl
	/child_default_mon_grp/0=tl;1=l

	To update the MON group non_default_ctrl_mon_grp/child_non_default_mon_grp to
	remove both local and total events on domain 1:
	# echo "non_default_ctrl_mon_grp/child_non_default_mon_grp/1=_" >
	       /sys/fs/resctrl/info/L3_MON/mbm_assign_control

	Assignment status after the update:
	$ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
	non_default_ctrl_mon_grp//0=tl;1=tl
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
	//0=t;1=tl
	/child_default_mon_grp/0=tl;1=l

	To update the default group to add a local event domain 0.
	# echo "//0+l" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control

	Assignment status after the update:
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
	non_default_ctrl_mon_grp//0=tl;1=tl
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
	//0=tl;1=tl
	/child_default_mon_grp/0=tl;1=l

	To update the non default CTRL_MON group non_default_ctrl_mon_grp to unassign all
	the MBM events on all the domains.
	# echo "non_default_ctrl_mon_grp//*=_" > /sys/fs/resctrl/info/L3_MON/mbm_assign_control

	Assignment status after the update:
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_control
	non_default_ctrl_mon_grp//0=_;1=_
	non_default_ctrl_mon_grp/child_non_default_mon_grp/0=tl;1=_
	//0=tl;1=tl
	/child_default_mon_grp/0=tl;1=l

g. Read the event mbm_total_bytes and mbm_local_bytes of the default group.
   There is no change in reading the events with ABMC. If the event is unassigned
   when reading, then the read will come back as "Unassigned".
	
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	779247936
	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes 
	765207488
	
h. Check the bandwidth configuration for the group. Note that bandwidth
   configuration has a domain scope. Total event defaults to 0x7F (to
   count all the events) and local event defaults to 0x15 (to count all
   the local numa events). The event bitmap decoding is available at
   https://www.kernel.org/doc/Documentation/x86/resctrl.rst
   in section "mbm_total_bytes_config", "mbm_local_bytes_config":
	
	#cat /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config 
	0=0x7f;1=0x7f
	
	#cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config 
	0=0x15;1=0x15
	
i. Change the bandwidth source for domain 0 for the total event to count only reads.
   Note that this change effects total events on the domain 0.
	
	#echo 0=0x33 > /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config 
	#cat /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config 
	0=0x33;1=0x7F
	
j. Now read the total event again. The first read may come back with "Unavailable"
   status. The subsequent read of mbm_total_bytes will display only the read events.
	
	#cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	Unavailable
	#cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
	314101

k. Users will have the option to go back to 'default' mbm_assign_mode if required.
   This can be done using the following command. Note that switching the
   mbm_assign_mode will reset all the MBM counters of all resctrl groups.

	# echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
	mbm_cntr_assign
	[default]
	
l. Unmount the resctrl
	 
	#umount /sys/fs/resctrl/
---
v11:
   The commit 2937f9c361f7a ("x86/resctrl: Introduce resctrl_file_fflags_init() to initialize fflags")
   is already merged. Removed from the series.
   
   Resolved minor conflicts due to code displacement in latest code.
 
   Moved the monitoring related calls to monitor.c file when possible.
   Moved some of the changes from include/linux/resctrl.h to arch/x86/kernel/cpu/resctrl/internal.h
   as requested by Reinette. This changes will be moved back when arch and non code is separated.
   
   Renamed rdtgroup_mbm_assign_mode_show() to resctrl_mbm_assign_mode_show().
   Renamed rdtgroup_num_mbm_cntrs_show() to resctrl_num_mbm_cntrs_show().

   Moved the mon_config_info structure definition to internal.h.
   Moved resctrl_arch_mon_event_config_get() and resctrl_arch_mon_event_config_set()
   to monitor.c file.

   Moved resctrl_arch_assign_cntr() and resctrl_abmc_config_one_amd() to monitor.c.
   Added the code to reset the arch state in resctrl_arch_assign_cntr().
   Also removed resctrl_arch_reset_rmid() inside IPI as the counters are reset from the callers.

   Renamed rdtgroup_assign_cntr_event() to resctrl_assign_cntr_event().
   Refactored the resctrl_assign_cntr_event().
   Added functionality to exit on the first error during assignment.
   Simplified mbm_cntr_free().
   Removed the function mbm_cntr_assigned(). Will be using mbm_cntr_get() to
   figure out if the counter is assigned or not.
   
   Renamed rdtgroup_unassign_cntr_event() to resctrl_unassign_cntr_event().
   Refactored the resctrl_unassign_cntr_event().

   Moved mbm_cntr_reset() to monitor.c.
   Added code reset non-architectural state in mbm_cntr_reset().
   Added missing rdtgroup_unassign_cntrs() calls on failure path.

   Domain can be NULL with SNC support so moved the unassign check in rdtgroup_mondata_show().

   Renamed rdtgroup_mbm_assign_mode_write() to resctrl_mbm_assign_mode_write().
   Added more details in resctrl.rst about mbm_cntr_assign mode.
   Re-arranged the text in resctrl.rst file in section mbm_cntr_assign.

   Moved resctrl_arch_mbm_cntr_assign_set_one() to monitor.c

   Added non-arch RMID reset in mbm_config_write_domain().
   Removed resctrl_arch_reset_rmid() call in resctrl_abmc_config_one_amd(). Not required
   as reset of arch and non-arch rmid counters done from the callers. It simplies the IPI code.

   Fixed printing the separator after each domain while listing the group assignments.
   Renamed rdtgroup_mbm_assign_control_show to resctrl_mbm_assign_control_show().

   Fixed the static check warning with initializing dom_id in resctrl_process_flags()

   Added change log in each patch for specific changes.

v10:
   Major change is related to domain specific assignment.
   Added struct mbm_cntr_cfg inside mon domains. This will handle
   the domain specific assignments as discussed in below.
   https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
   I did not see the need to add cntr_id in mbm_state structure. Not used in the code.
   Following patches take care of these changes.
   Patch 12, 13, 15, 16, 17, 18.
   
   Added __init attribute to cache_alloc_hsw_probe(). Followed function
   prototype rules (preferred order is storage class before return type).
   
   Moved the mon_config_info structure definition to resctrl.h
   
   Added call resctrl_arch_reset_rmid() to reset the RMID in the domain inside IPI call
   resctrl_abmc_config_one_amd.
   
   SMP and non-SMP call support is not required in resctrl_arch_config_cntr with new
   domain specific assign approach/data structure.
   
   Assigned the counter before exposing the event files.
   Moved the call rdtgroup_assign_cntrs() inside mkdir_rdt_prepare_rmid_alloc().
   This is called both CNTR_MON and MON group creation.
   
   Call mbm_cntr_reset() when unmounted to clear all the assignments.
   
   Fixed the issue with finding the domain in multiple iterations in rdtgroup_process_flags().
   
   Printed full error message with domain information when assign fails.
   
   Taken care of other text comments in all the patches. Patch specific changes are in each patch.
   
   If I missed something please point me and it is not intentional.

v9:
   Patch 14 is a new addition. 
   Major change in patch 24.
   Moved the fix patch to address __init attribute to begining of the series.
   Fixed all the call sequences. Added additional Fixed tags.

   Added Reviewed-by where applicable.

   Took care of couple of minor merge conflicts with latest code.
   Re-ordered the MSR in couple of instances.
   Added available_mbm_cntrs (patch 14) to print the number of counter in a domain.

   Used MBM_EVENT_ARRAY_INDEX macro to get the event index.
   Introduced rdtgroup_cntr_id_init() to initialize the cntr_id

   Introduced new function resctrl_config_cntr to assign the counter, update
   the bitmap and reset the architectural state.
   Taken care of error handling(freeing the counter) when assignment fails.
  
   Changed rdtgroup_assign_cntrs() and rdtgroup_unassign_cntrs() to return void.
   Updated couple of rdtgroup_unassign_cntrs() calls properly.

   Fixed problem changing the mode to mbm_cntr_assign mode when it is
   not supported. Added extra checks to detect if systems supports it.
   
   https://lore.kernel.org/lkml/03b278b5-6c15-4d09-9ab7-3317e84a409e@intel.com/
   As discussed in the above comment, introduced resctrl_mon_event_config_set to
   handle IPI. But sending another IPI inside IPI causes problem. Kernel
   reports SMP warning. So, introduced resctrl_arch_update_cntr() to send the
   command directly.

   Fixed handling special case '//0=' and '//".
   Removed extra strstr() call in rdtgroup_mbm_assign_control_write().
   Added generic failure text when assignment operation fails.
   Corrected user documentation format texts.

v8:
  Patches are getting into final stages. 
  Couple of changes Patch 8, Patch 19 and Patch 23.
  Most of the other changes are related to rename and text message updates.

  Details are in each patch. Here is the summary.

  Added __init attribute to dom_data_init() in patch 8/25.
  Moved the mbm_cntrs_init() and mbm_cntrs_exit() functionality inside
  dom_data_init() and dom_data_exit() respectively.

  Renamed resctrl_mbm_evt_config_init() to arch_mbm_evt_config_init()
  Renamed resctrl_arch_event_config_get() to resctrl_arch_mon_event_config_get().
          resctrl_arch_event_config_set() to resctrl_arch_mon_event_config_set().

  Rename resctrl_arch_assign_cntr to resctrl_arch_config_cntr.
  Renamed rdtgroup_assign_cntr() to rdtgroup_assign_cntr_event().
  Added the code to return the error if rdtgroup_assign_cntr_event fails.
  Moved definition of MBM_EVENT_ARRAY_INDEX to resctrl/internal.h.
  Renamed rdtgroup_mbm_cntr_is_assigned to mbm_cntr_assigned_to_domain
  Added return error handling in resctrl_arch_config_cntr().
  Renamed rdtgroup_assign_grp to rdtgroup_assign_cntrs.
  Renamed rdtgroup_unassign_grp to rdtgroup_unassign_cntrs.
  Fixed the problem with unassigning the child MON groups of CTRL_MON group.
  Reset the internal counters after mbm_cntr_assign mode is changed.
  Renamed rdtgroup_mbm_cntr_reset() to mbm_cntr_reset()
  Renamed resctrl_arch_mbm_cntr_assign_configure to
            resctrl_arch_mbm_cntr_assign_set_one.

  Used the same IPI as event update to modify the assignment.
  Could not do the way we discussed in the thread.
  https://lore.kernel.org/lkml/f77737ac-d3f6-3e4b-3565-564f79c86ca8@amd.com/
  Needed to figure out event type to update the configuration.

  Moved unassign first and assign during the assign modification.
  Assign none "_" takes priority. Cannot be mixed with other flags.
  Updated the documentation and .rst file format. htmldoc looks ok.

v7:
   Major changes are related to FS and arch codes separation.
   Changed few interface names based on feedback.
   Here are the summary and each patch contains changes specific the patch.

   Removed WARN_ON for num_mbm_cntrs. Decided to dynamically allocate the bitmap.
   WARN_ON is not required anymore.
 
   Renamed the function resctrl_arch_get_abmc_enabled() to resctrl_arch_mbm_cntr_assign_enabled().

   Merged resctrl_arch_mbm_cntr_assign_disable, resctrl_arch_mbm_cntr_assign_disable
   and renamed to resctrl_arch_mbm_cntr_assign_set(). Passed the struct rdt_resource
   to these functions.

   Removed resctrl_arch_reset_rmid_all() from arch code. This will be done from FS the caller.

   Updated the descriptions/commit log in resctrl.rst to generic text. Removed ABMC references.
   Renamed mbm_mode to mbm_assign_mode.
   Renamed mbm_control to  mbm_assign_control.
   Introduced mutex lock in rdtgroup_mbm_mode_show().
 
   The 'legacy' mode is called 'default' mode. 

   Removed the static allocation and now allocating bitmap mbm_cntr_free_map dynamically.

   Merged rdtgroup_assign_cntr(), rdtgroup_alloc_cntr() into one.
   Merged rdtgroup_unassign_cntr(), rdtgroup_free_cntr() into one.
   
  Added struct rdt_resource to the interface functions resctrl_arch_assign_cntr ()
  and resctrl_arch_unassign_cntr().
  Rename rdtgroup_abmc_cfg() to resctrl_abmc_config_one_amd().
   
  Added a new patch to fix counter assignment on event config changes.

  Removed the references of ABMC from user interfaces.

  Simplified the parsing (strsep(&token, "//") in rdtgroup_mbm_assign_control_write().
  Added mutex lock in rdtgroup_mbm_assign_control_write() while processing.

  Thomas Gleixner asked us to update  https://gitlab.com/x86-cpuid.org/x86-cpuid-db. 
  It needs internal approval. We are working on it.

v6:
  We still need to finalize few interface details on mbm_assign_mode and mbm_assign_control
  in case of ABMC and Soft-ABMC. We can continue the discussion with this series.

  Added support for domain-id '*' to update all the domains at once.
  Fixed assign interface to allocate the counter if counter is
  not assigned.   
  Fixed unassign interface to free the counter if the counter is not
  assigned in any of the domains.

  Renamed abmc_capable to mbm_cntr_assignable.

  Renamed abmc_enabled to mbm_cntr_assign_enabled.
  Used msr_set_bit and msr_clear_bit for msr updates.
  Renamed resctrl_arch_abmc_enable() to resctrl_arch_mbm_cntr_assign_enable().
  Renamed resctrl_arch_abmc_disable() to resctrl_arch_mbm_cntr_assign_disable().

  Changed the display name from num_cntrs to num_mbm_cntrs.

  Removed the variable mbm_cntrs_free_map_len. This is not required.
  Removed the call mbm_cntrs_init() in arch code. This needs to be done at higher level.
  Used DECLARE_BITMAP to initialize mbm_cntrs_free_map.
  Removed unused config value definitions.

  Introduced mbm_cntr_map to track counters at domain level. With this
  we dont need to send MSR read to read the counter configuration.

  Separated all the counter id management to upper level in FS code.

  Added checks to detect "Unassigned" before reading the RMID.

  More details in each patch.

v5:
  Rebase changes (because of SNC support)

  Interface changes.
   /sys/fs/resctrl/mbm_assign to /sys/fs/resctrl/mbm_assign_mode.
   /sys/fs/resctrl/mbm_assign_control to /sys/fs/resctrl/mbm_assign_control.

  Added few arch specific routines.
  resctrl_arch_get_abmc_enabled.
  resctrl_arch_abmc_enable.
  resctrl_arch_abmc_disable.

  Few renames
   num_cntrs_free_map -> mbm_cntrs_free_map
   num_cntrs_init -> mbm_cntrs_init
   arch_domain_mbm_evt_config -> resctrl_arch_mbm_evt_config

  Introduced resctrl_arch_event_config_get and
    resctrl_arch_event_config_set() to update event configuration.

  Removed mon_state field mongroup. Added MON_CNTR_UNSET to initialize counters.

  Renamed ctr_id to cntr_id for the hardware counter.
 
  Report "Unassigned" in case the user attempts to read the events without assigning the counter.
  
  ABMC is enabled during the boot up. Can be enabled or disabled later.

  Fixed opcode and flags combination.
    '=_" is valid.
    "-_" amd "+_" is not valid.

 Added all the comments as far as I know. If I missed something, it is not intentional.

v4: 
  Main change is domain specific event assignment.
  Kept the ABMC feature as a default.
  Dynamcic switching between ABMC and mbm_legacy is still allowed.
  We are still not clear about mount option.
  Moved the monitoring related data in resctrl_mon structure from rdt_resource.
  Fixed the display of legacy and ABMC mode.
  Used bimap APIs when possible.
  Removed event configuration read from MSRs. We can use the
  internal saved data.(patch 12)
  Added more comments about L3_QOS_ABMC_CFG MSR.
  Added IPIs to read the assignment status for each domain (patch 18 and 19)
  More details in each patch.

v3:
   This series adds the support for global assignment mode discussed in
   the thread. https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/
   Removed the individual assignment mode and included the global assignment interface.
   Added following interface files.
   a. /sys/fs/resctrl/info/L3_MON/mbm_assign
      Used for displaying the current assignment mode and switch between
      ABMC and legacy mode.
   b. /sys/fs/resctrl/info/L3_MON/mbm_assign_control
      Used for lising the groups assignment mode and modify the assignment states.
   c. Most of the changes are related to the new interface.
   d. Addressed the comments from Reinette, James and Peter.
   e. Hope I have addressed most of the major feedbacks discussed. If I missed
      something then it is not intentional. Please feel free to comment.
   f. Sending this as an RFC as per Reinette's comment. So, this is still open
      for discussion.

v2:
   a. Major change is the way ABMC is enabled. Earlier, user needed to remount
      with -o abmc to enable ABMC feature. Removed that option now.
      Now users can enable ABMC by "$echo 1 to /sys/fs/resctrl/info/L3_MON/mbm_assign_enable".
     
   b. Added new word 21 to x86/cpufeatures.h.

   c. Display unsupported if user attempts to read the events when ABMC is enabled
      and event is not assigned.

   d. Display monitor_state as "Unsupported" when ABMC is disabled.
  
   e. Text updates and rebase to latest tip tree (as of Jan 18).
 
   f. This series is still work in progress. I am yet to hear from ARM developers. 

--------------------------------------------------------------------------------------

Previous revisions:

v10: https://lore.kernel.org/lkml/cover.1734034524.git.babu.moger@amd.com/
v9: https://lore.kernel.org/lkml/cover.1730244116.git.babu.moger@amd.com/
v8: https://lore.kernel.org/lkml/cover.1728495588.git.babu.moger@amd.com/
v7: https://lore.kernel.org/lkml/cover.1725488488.git.babu.moger@amd.com/
v6: https://lore.kernel.org/lkml/cover.1722981659.git.babu.moger@amd.com/
v5: https://lore.kernel.org/lkml/cover.1720043311.git.babu.moger@amd.com/
v4: https://lore.kernel.org/lkml/cover.1716552602.git.babu.moger@amd.com/
v3: https://lore.kernel.org/lkml/cover.1711674410.git.babu.moger@amd.com/  
v2: https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/20231201005720.235639-1-babu.moger@amd.com/


Babu Moger (23):
  x86/resctrl: Add __init attribute to functions called from
    resctrl_late_init()
  x86/cpufeatures: Add support for Assignable Bandwidth Monitoring
    Counters (ABMC)
  x86/resctrl: Add ABMC feature in the command line options
  x86/resctrl: Consolidate monitoring related data from rdt_resource
  x86/resctrl: Detect Assignable Bandwidth Monitoring feature details
  x86/resctrl: Add support to enable/disable AMD ABMC feature
  x86/resctrl: Introduce the interface to display monitor mode
  x86/resctrl: Introduce interface to display number of monitoring
    counters
  x86/resctrl: Introduce mbm_total_cfg and mbm_local_cfg in struct
    rdt_hw_mon_domain
  x86/resctrl: Remove MSR reading of event configuration value
  x86/resctrl: Introduce mbm_cntr_cfg to track assignable counters at
    domain
  x86/resctrl: Introduce interface to display number of free counters
  x86/resctrl: Add data structures and definitions for ABMC assignment
  x86/resctrl: Implement resctrl_arch_config_cntr() to assign a counter
    with ABMC
  x86/resctrl: Add the functionality to assigm MBM events
  x86/resctrl: Add the functionality to unassigm MBM events
  x86/resctrl: Auto assign/unassign counters when mbm_cntr_assign is
    enabled
  x86/resctrl: Report "Unassigned" for MBM events in mbm_cntr_assign
    mode
  x86/resctrl: Introduce the interface to switch between monitor modes
  x86/resctrl: Configure mbm_cntr_assign mode if supported
  x86/resctrl: Update assignments on event configuration changes
  x86/resctrl: Introduce interface to list assignment states of all the
    groups
  x86/resctrl: Introduce interface to modify assignment states of the
    groups

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/arch/x86/resctrl.rst            | 242 +++++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   2 +
 arch/x86/kernel/cpu/cpuid-deps.c              |   3 +
 arch/x86/kernel/cpu/resctrl/core.c            |  23 +-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  13 +
 arch/x86/kernel/cpu/resctrl/internal.h        |  91 ++-
 arch/x86/kernel/cpu/resctrl/monitor.c         | 402 +++++++++++-
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        | 620 ++++++++++++++++--
 arch/x86/kernel/cpu/scattered.c               |   1 +
 include/linux/resctrl.h                       |  34 +-
 12 files changed, 1350 insertions(+), 84 deletions(-)

-- 
2.34.1

