Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35772144A2;
	Wed, 22 Jan 2025 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577276; cv=fail; b=hLIZoneznf185Ik6yoq3DC8+YqBz1DvcF1fTrCmUurc66wkQQlsElSV9m1TVuv0Fr2XFqz/0SV6FBUXnzos920ZGNyfWmMWzAuSVL/l0m/hbLP5ykhul5fax4eOrkdlHuN0X656yW7EBG2y0ZSMGUeNsysz79zTxW2EqYFTNKsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577276; c=relaxed/simple;
	bh=NGFmmvvBDDewCP74TnRf62SU3eg4/4n7Gu5D7Q/BT+4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fgkz9ojd0kBuzy9VgSzfTU4j55Qlkit465kNP9YuzfV9f6yQYSCLHUVBJ5UWEee1ZbvcCFwAMQyJ6ZlwxD+m2a/XQXejlyFa6Mqe2kdTAogdxEwCedjH8aVLL6WNQxZDCQ9ChmqW/u2C0m7QHLZTnhBGgjvFB/337eiYTKBztzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SLX18sHG; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SLX18sHG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLdzDqppj9pPAs7zJ8NFUBWPD9NTOOaLTQul9VuxA8VmvGTSnkDtUq6yjbxIfrmEKcvgZTh+oiVuSHo644d7VP2Sd6pFi4S5oZHva6e9NIOWm3ExQW7PALk9kgDvvObZ4i+MWOF0NrNgLwTyiDtvsGCijMTGGKcYC3G/F73FmwHpAkJDTZDyVkoC3t2dDceg3BhS46ZJgvcgYEtAzkCvJrq+PojBVKkNy4OWDdVnU9BXOqpmAF7ucJFc63OcBKFw6WheoT53nzCbJPqa9yxUjnTTJCp3yEDSagYwwOYxs2JdeWg5oTNpNwJ2FhMQFoQb2xOXvnQTqFv90v6eGQW18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=584/9aDQ6GCzsyD9pQIrlTl2SCi0YRxJlSW6lSfe4b8=;
 b=RpGBZKdz9jAGUAFFuanwZM4Cff6Z1kFYzHWS9upEA5dRp5Abk2NZ2/hnEgFgtgc4cw5Q633Mwn76xf4PL9ZSN9lQMuuAX7K63urp9cy+WwgJe39hEKHzwKwAtmyp0bCdNfz9J/bhMRfs2tx6dU0tCRGJ4TCm51CagQ022QHyH3tVbDcKEIq1z+1OqzfJ1lYSZPX8yXpvwg9q1+4HsUvYv7FotSTzZeUqrdDqTFJa3F63FlZSQTkyEfYDvUJsXw2y0mqJh/+qtGtL+1CRr8V4Ye5UJX+6JrtQH62M7xmww8yO48Z6R/0IHC6belsgjhjN85lnHt+FgRGy6sB6HtGu+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=584/9aDQ6GCzsyD9pQIrlTl2SCi0YRxJlSW6lSfe4b8=;
 b=SLX18sHG1ebB/9oWs30rclr1R0TZ2jIHEzC6ls933MCIPdAtq1qUuA3IPfTb2BpzU8aaSLQsmCfseFX5zpC8fNW7udNsTWLDSDyggFWIp1zvWYcZ55YuB6XM4hfyUg2unuiGWlZJo/2uTpxtEI60WWoaR65gu6Dd4oYbWVSVvsk=
Received: from CH0PR03CA0444.namprd03.prod.outlook.com (2603:10b6:610:10e::12)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:21:06 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::24) by CH0PR03CA0444.outlook.office365.com
 (2603:10b6:610:10e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.14 via Frontend Transport; Wed,
 22 Jan 2025 20:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:21:06 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:21:03 -0600
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
Subject: [PATCH v11 02/23] x86/cpufeatures: Add support for Assignable Bandwidth Monitoring Counters (ABMC)
Date: Wed, 22 Jan 2025 14:20:10 -0600
Message-ID: <e4111779ebb0e7004dbedc258eeae2677f578ab1.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|SA3PR12MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a0d95f-986b-412f-c0d7-08dd3b224d13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MBf9IZukvwhkhzImL0/kso4+zEVzfwpCceiNxhuIzjDSRhl3QH8nCoLqkJD/?=
 =?us-ascii?Q?YNpUNzIZuwJOTXcXwB01cSzKlH+dL+SNRI6dPlDBUMo3ud+OuCH225M6pGQi?=
 =?us-ascii?Q?5OF3fslx1S5gAJ4XJsdhbHctN9XaqBUT96oBIPmmHMR5LkQyrjsXr7kNTGBv?=
 =?us-ascii?Q?d4D4ydpRPye/pJWoz35OGPsxaznu2ZjIyQ86tI4b45vZ03gRGLdFY8deM/wL?=
 =?us-ascii?Q?+R6R6Whe1XLF53auk5qn2yxeNO1PVeLtU99lf0GSI4kiQNrwdQMWdEqN4OAC?=
 =?us-ascii?Q?vqt/kvBiSbcP4C2NTkaUooAhsu2tY4S8rcLjEghHMD/21ty371jYRekJtvWE?=
 =?us-ascii?Q?JN/448WfQWmu+u/FFH96ZEuRc0YpvQZGGdMWDH0c60WkQyszsdTLtYaUp3Wh?=
 =?us-ascii?Q?XJPT8UuLg5F1s5dq98i0ohnhT98KJui4AuTo3t7wMaxkE/SwQQx7WWuYnDMR?=
 =?us-ascii?Q?SfHXG/6W8Rp3zrEA+es5nA9VUQOpcVZLiq5S7M5yPXPraDanjSlNRz3RTN0B?=
 =?us-ascii?Q?7rgnogSWkVki2Y3KnmR4GEH35sWzfwzzI+mBhvGdIXx67Sghvp92saD6kGiO?=
 =?us-ascii?Q?qt6Qlgp1iBMn63pgjyEn+Cv+HCDYHDjBrjxvdGhUdvkSBpql/5aoKU4C74lJ?=
 =?us-ascii?Q?XXQ1mOsTAfpCYAGyEPG4yzh+c6WcRw+nrMyl6gQAG8ZJZXD7y1qdM/Uc/hsB?=
 =?us-ascii?Q?6sfOmXaVMlD1QimFO1+ZjBHqFAQbRq5kkDbraf02eJW75Hvl7wvQUHjlbcRl?=
 =?us-ascii?Q?9PXO/XFDkKWHS9SxFruR+gIIZAep5sebXN7aaR54H162nQDor4lS/BUUxGl6?=
 =?us-ascii?Q?YiOq9/98PkBaYho2sR7wx3c88TBaSkSd7ejcpEXzaq912dIq3lXTwZfb5+H+?=
 =?us-ascii?Q?JTUKoLnSCaKqI8vW2GQJbm9JovN4Sy5qiIg1VokixZ3Pc8t80hr29r3knqQQ?=
 =?us-ascii?Q?tekAFXFoEeZrZlQlnRp050XXjmbzGhVlJJFXiEnLt0To8AQzVYVJoSvnJo19?=
 =?us-ascii?Q?fCNAZKlLgBo4qL4wf81w2sKoONhw3Ij850dgZ31U4Zv/X8f32obFitUyNeQ3?=
 =?us-ascii?Q?McZFOghtqS1w5pXkhgI/3BAvwPuwHBTiU26Mqqg0Bhh2bzY3Ew8r67PwnqGL?=
 =?us-ascii?Q?QG2t3zyYX8WLsvFqkxFHTbtF7Kv57lum8E3DoUsQoohYnn2hlH81y0dVXjS6?=
 =?us-ascii?Q?Os2Kc1j0B7UxaqrxiGGv+IEV88hhh11crTxc94A107wtx4jwrpgV1tg/QRF0?=
 =?us-ascii?Q?fKPAzOWMMJ+/0u/RMhDPmtU78lBv95QlhjLYoXidi2f9MgzKs+igxPnqF1rN?=
 =?us-ascii?Q?tHrH0kimkhrlitkROCTSQAbEOZaAtWT8QU7FEDe51BYpiCcqyYWKobNTo6o8?=
 =?us-ascii?Q?8hdI/BHDWKQFOw8o35SuHASN3ZNuCHH/icCwA2Zxvy7fM2/zQQqQnlQAqIT1?=
 =?us-ascii?Q?bq2ib6ycfuaVv70Bta7AbIgkieME+DiQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:21:06.3764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a0d95f-986b-412f-c0d7-08dd3b224d13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975

Users can create as many monitor groups as RMIDs supported by the hardware.
However, bandwidth monitoring feature on AMD system only guarantees that
RMIDs currently assigned to a processor will be tracked by hardware. The
counters of any other RMIDs which are no longer being tracked will be reset
to zero. The MBM event counters return "Unavailable" for the RMIDs that are
not tracked by hardware. So, there can be only limited number of groups
that can give guaranteed monitoring numbers. With ever changing
configurations there is no way to definitely know which of these groups are
being tracked for certain point of time. Users do not have the option to
monitor a group or set of groups for certain period of time without
worrying about RMID being reset in between.

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as it is
assigned. The assigned RMID will be tracked by the hardware until the user
unassigns it manually. There is no need to worry about counters being reset
during this period. Additionally, the user can specify a bitmask
identifying the specific bandwidth types from the given source to track
with the counter.

Without ABMC enabled, monitoring will work in current mode without
assignment option.

Linux resctrl subsystem provides the interface to count maximum of two
memory bandwidth events per group, from a combination of available total
and local events. Keeping the current interface, users can enable a maximum
of 2 ABMC counters per group. User will also have the option to enable only
one counter to the group. If the system runs out of assignable ABMC
counters, kernel will display an error. Users need to disable an already
enabled counter to make space for new assignments.

The feature can be detected via CPUID_Fn80000020_EBX_x00 bit 5.
Bits Description
5    ABMC (Assignable Bandwidth Monitoring Counters)

The feature details are documented in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---

Note: Checkpatch checks/warnings are ignored to maintain coding style.

v11: No changes.

v10: No changes.

v9: Took care of couple of minor merge conflicts. No other changes.

v8: No changes.

v7: Removed "" from feature flags. Not required anymore.
    https://lore.kernel.org/lkml/20240817145058.GCZsC40neU4wkPXeVR@fat_crate.local/

v6: Added Reinette's Reviewed-by. Moved the Checkpatch note below ---.

v5: Minor rebase change and subject line update.

v4: Changes because of rebase. Feature word 21 has few more additions now.
    Changed the text to "tracked by hardware" instead of active.

v3: Change because of rebase. Actual patch did not change.

v2: Added dependency on X86_FEATURE_BMEC.
---
 arch/x86/include/asm/cpufeatures.h | 1 +
 arch/x86/kernel/cpu/cpuid-deps.c   | 3 +++
 arch/x86/kernel/cpu/scattered.c    | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 508c0dad116b..7950a420170f 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -483,6 +483,7 @@
 #define X86_FEATURE_AMD_FAST_CPPC	(21*32 + 5) /* Fast CPPC */
 #define X86_FEATURE_AMD_HETEROGENEOUS_CORES (21*32 + 6) /* Heterogeneous Core Topology */
 #define X86_FEATURE_AMD_WORKLOAD_CLASS	(21*32 + 7) /* Workload Classification */
+#define X86_FEATURE_ABMC		(21*32 + 8) /* Assignable Bandwidth Monitoring Counters */
 
 /*
  * BUG word(s)
diff --git a/arch/x86/kernel/cpu/cpuid-deps.c b/arch/x86/kernel/cpu/cpuid-deps.c
index 8bd84114c2d9..7e4d63b381d6 100644
--- a/arch/x86/kernel/cpu/cpuid-deps.c
+++ b/arch/x86/kernel/cpu/cpuid-deps.c
@@ -70,6 +70,9 @@ static const struct cpuid_dep cpuid_deps[] = {
 	{ X86_FEATURE_CQM_MBM_LOCAL,		X86_FEATURE_CQM_LLC   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_TOTAL   },
 	{ X86_FEATURE_BMEC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_TOTAL   },
+	{ X86_FEATURE_ABMC,			X86_FEATURE_CQM_MBM_LOCAL   },
+	{ X86_FEATURE_ABMC,			X86_FEATURE_BMEC      },
 	{ X86_FEATURE_AVX512_BF16,		X86_FEATURE_AVX512VL  },
 	{ X86_FEATURE_AVX512_FP16,		X86_FEATURE_AVX512BW  },
 	{ X86_FEATURE_ENQCMD,			X86_FEATURE_XSAVES    },
diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
index 16f3ca30626a..3b72b72270f1 100644
--- a/arch/x86/kernel/cpu/scattered.c
+++ b/arch/x86/kernel/cpu/scattered.c
@@ -49,6 +49,7 @@ static const struct cpuid_bit cpuid_bits[] = {
 	{ X86_FEATURE_MBA,			CPUID_EBX,  6, 0x80000008, 0 },
 	{ X86_FEATURE_SMBA,			CPUID_EBX,  2, 0x80000020, 0 },
 	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
+	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
 	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },
 	{ X86_FEATURE_PERFMON_V2,		CPUID_EAX,  0, 0x80000022, 0 },
 	{ X86_FEATURE_AMD_LBR_V2,		CPUID_EAX,  1, 0x80000022, 0 },
-- 
2.34.1

