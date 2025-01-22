Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7542163B7;
	Wed, 22 Jan 2025 20:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577361; cv=fail; b=kAWDajgXJiP1/x3Gld0H4zyd59Mrh0bXy++YbYb6JmfQCxAzJMjXYsQdmfSZcfH3L9CfUam5M4iYEEPU1vLQ8T2vBvBdzqbdoDbR9TjlhZAMvhPV8raIfTtxaJrnbZMYY0Gf7ffbZAbWHQnH29dd8imbc6Q3kRplpoj+esKZe4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577361; c=relaxed/simple;
	bh=BZ1kMCjcnzaTbr6aaVvNJuo/j1rlt7lU/5gBdE6fw9o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QwCkGclSAKXejunq5dRy45zLHElOcDxKY9INO68KKWZvCOW1WmdduL/3ZznPxY7PIYaMUW/5RbnyAunhiDxGag+CF/slbd5yHHAkweHTq9+5BVWbGR8VoHB/psPduItSvto8XysaSjOasnk37Y7uQUsxmBL2pzsVX7aUPceXCPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mXJGXnzL; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mXJGXnzL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7WHF2X3oYRhg9HxUmKEumwXKDddOuT2s5XsyWDIXvBEG1nuxtcU82JFP9g6jLqYTIyfbr5LUi6mhyobL34sc75tWzWH7jtVle1HsK5pQX07j+gt7FV8LTINbhGyx6HGqQy3Jv2fbS5FZ5eSCBU+UowNPXfPMIl50biouWl0i/r7SE4NKw38GuWYrRTkEQtMjiKhQVHpOop7DnHJym1/QUfjpgRMAVWQhseXK9rZH+x2NT89UbdtH9ouOOkdW0pl8+VCMfBuijH2Jnw1NFdnTFor9SnLjP4Fz2QWNyJKKBtHtzb4dP43zKqgQXURWC4uB7af8VWdbzH0EDneSqT4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZRHuq+BZRB2+A7KilFnGt3RC+0JHmxkohxLAVW/ijk=;
 b=Cuebdw+Lg8nQKMVouMRNCWP/TCrxo4vdkqxa/cWF2PhdeIeIE5zCzVNqWtPVlM195sFS/9oTE0dtwGWnuRKsGM21xudfV0lLWF27++2WzfZNxfQ5Ao4cmnYcpR4KFTYc0XIK9Ci6t6DM+y+692GEzMRvHE6WZ1pdFtNSkEsVOCn8tPnoVJ2LfplY41DnVRIOacfZa3TEhB7oNSLHG4AHsh8g4+GCr3G6IEtH1OEhVlM+4b6hT5D3qoWSn1quRr6oJKtwyQJjwwgtXggiLRUv4+sTyX5PuN4gJkX8yrdyGDxxv8tnSBSm+Z8JE48vO+egjE8D2s/3KMXRoLC/KYEf8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZRHuq+BZRB2+A7KilFnGt3RC+0JHmxkohxLAVW/ijk=;
 b=mXJGXnzLDCzNQsbvVZ00uO7EvAXy4hSI8rGakxjFdj6vFWAepP9flyn+SBXqoMMs1It62VPnPeUU+KGPc8q2aCvCsqC9ePWgQLsle46U0Y2EB2Vy00C3xUHGa4K9EvrFED0c8aVp1ug4pUaV5K0X85PvTpVPhc5OzQYQTjoBXko=
Received: from CH0PR03CA0320.namprd03.prod.outlook.com (2603:10b6:610:118::25)
 by IA1PR12MB9500.namprd12.prod.outlook.com (2603:10b6:208:596::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 20:22:36 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::f7) by CH0PR03CA0320.outlook.office365.com
 (2603:10b6:610:118::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:22:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:22:35 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:22:32 -0600
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
Subject: [PATCH v11 13/23] x86/resctrl: Add data structures and definitions for ABMC assignment
Date: Wed, 22 Jan 2025 14:20:21 -0600
Message-ID: <27c267e80f224296eb37a5212ad6e6cbe8584c19.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|IA1PR12MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 15221b69-b39b-4612-81b6-08dd3b228268
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700013|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VS94QlRhcnZ1bVNST1gvcm5HRE81b1EwYm5lK1o1SEQrb2oyU0dPSG5tQ1I2?=
 =?utf-8?B?WjFGNlI1Y2xxTm9nVkh5K2ZyTXN2cGdwaXd4QXFnN1E2L05pZXZHb0RHYUt0?=
 =?utf-8?B?SnRlL3RSeElMVnRmV1dNak1LQWsvbzVwRWVoYm1ZSUtwbytGK0RQUjB2T21l?=
 =?utf-8?B?SXBuLzV4MUJLd0xYZi9uSjlMU2ViMjhFKzRVYk4wZ2hGTGxVdTB6WTFvOFY5?=
 =?utf-8?B?NE5vUHhyVDRZTlJhcEdLUWdSMnRyeW1kcjU0TzZrTDVGZEFpWUdlUHg2dU5n?=
 =?utf-8?B?dDhSTnRreCtlMUt4T1dBK1VjQTF3R0VYdGVlNmFMMStHVFM3TzRTTHAwRDhr?=
 =?utf-8?B?bzV3dkJaMlRUTUtzaWVwS1g1Skt0UmlpRCtrdVd0dGc0eVhtblo4dklBV1NR?=
 =?utf-8?B?MTFZYXdPcnIxSmZrRFY5VmxxVVFBMXR1bzdJdHlPaldjNXZjeFl4TzRhTHdn?=
 =?utf-8?B?U0VTWHNQKzNGc3IwWHZBUjNMb1UzNWIyV3oranRKcEQvVEFjU2ljTVJrOUdL?=
 =?utf-8?B?WTRMcm8vcStxS3NaTXhyUVZqT2N6eGgxTXJCNnJIbnR1bmVYcTBtQkxCbnh1?=
 =?utf-8?B?MnUvL3N3czE0ejFOdEtGeG5aZ2V6Umc2WGtXdEtxckx5MGh2R1VIYitqYTF0?=
 =?utf-8?B?TGxaTmdZeW9vTkpQc3FCRnN0NnoyRlc5SzZxcjNSMElET1hhOWd3WWhTOTkw?=
 =?utf-8?B?Mm1MVXc2K0E5MUx5R2Jrdndnd3pIL1gvbGtVTXlvR00rblJMYjZOS1cwbHNL?=
 =?utf-8?B?bDRmT3FHQjRvZHdkQktoRDRVVStZRDJPTjFpQ05pMmd0eVBTSVJzTllzZ2Nr?=
 =?utf-8?B?UGRsRUFnQTNjTk5jaWZJRUdOencxdVdQanNJK1Rkcit0MDVCNjYvbHNaR3hu?=
 =?utf-8?B?UTlJalBSc1hjS2tEOUZNcHNnU2Z3eWloazR3Rm00QUk2cnNNdFZIV0Y3bTNF?=
 =?utf-8?B?Y3JDK1pZYTJSZ00xYjF1VkJPZlhlYlZpb0h5QnlOMTB2N3I4eWF0eUI0d0tR?=
 =?utf-8?B?c1ZiUVl2MnNwcjhZNDB0RlhjeU9aQm54K0U2NkxJUzJOb1dNOUJnR1p3aGdS?=
 =?utf-8?B?Z3Z3M0ppck1LK2MyQXk3eG05NTQ5WUp5MmNZajVBTTBHbnR1bm9ocGp2QVE1?=
 =?utf-8?B?MVd2ZHpCVTgwT1pBZFU3Unh3NTVjN1RpcG1oK0hBWEx1Nk54UWNHOFovWlht?=
 =?utf-8?B?SCt3dkRsc2J5L0EzcmZLa2xidGs1ckhJbmlEeTVSWWliQklSaUM2YWtibW5M?=
 =?utf-8?B?bkhnVzdEZWluMEpEaWVleE1GV1Q5RUJwYnNnL0VTTnE1STY0cWdVVmE4S0x1?=
 =?utf-8?B?S3Nlb0NYdkd3bnUweUVoS3EvcVh4N3dxSUZSRTY4WnVydW1QbUh3dEJGRnVN?=
 =?utf-8?B?NXQvUkhQUkRuVEx6ekIrbHc1Yk1TWkJyUG5UdWh1cUJjeW1oRkVTbEZ2elU2?=
 =?utf-8?B?bTBON0c0UXZFR3l1c29KRkZpVGxUY09FTlp1WFVtb05iTnE2M1VpeHRNWVRl?=
 =?utf-8?B?S2I3TjN4S1dWWXcxUnBGaG05ZEdvQ1NtaHgrRkNVbXBtNHcyV0Z2d3ZyTU44?=
 =?utf-8?B?WHJONWdHNEFGUm55U21aRjROOGt3dkRuYXpPRDFtZGJXbTVTQlo2clhEUEVk?=
 =?utf-8?B?emtTWmV4UE1WTWQvWlF0SVZBbk52RVdRUENmbFZ5SGRXNUl0cVVQVTdGaGg3?=
 =?utf-8?B?NktMNXZsK2hwQTQ5VGJjRUlucTBJWjNKc01iYWFEckpBNGxJS1BnVmFhN0JE?=
 =?utf-8?B?Q2xBVHZhQ0FxdTNWT1Y0bkdBUHh6Vzd5bTVnUko4QUcrdzNxRVJnOXN1SGtx?=
 =?utf-8?B?MDl4VVgxK2dvbzNJUzM5ZzJXb0JGQmVGU2szaG1ua3dkYzZlTlU5MEVaam5B?=
 =?utf-8?B?c0JUdkJGTXc1SDdzcllOYzR4cFFlUEFWcVdCK1g4a3lnYUEvR0ZNS0pXOUx6?=
 =?utf-8?Q?93eZXVAyvQg0iEAuLIQOB1i5/HEzJdUs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700013)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:22:35.8354
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15221b69-b39b-4612-81b6-08dd3b228268
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9500

The ABMC feature provides an option to the user to assign a hardware
counter to an RMID, event pair and monitor the bandwidth as long as the
counter is assigned. The bandwidth events will be tracked by the hardware
until the user changes the configuration. Each resctrl group can configure
maximum two counters, one for total event and one for local event.

The ABMC feature implements an MSR L3_QOS_ABMC_CFG (C000_03FDh).
Configuration is done by setting the counter id, bandwidth source (RMID)
and bandwidth configuration supported by BMEC (Bandwidth Monitoring Event
Configuration).

Attempts to read or write the MSR when ABMC is not enabled will result
in a #GP(0) exception.

Introduce the data structures and definitions for MSR L3_QOS_ABMC_CFG
(0xC000_03FDh):
=========================================================================
Bits 	Mnemonic	Description			Access Reset
							Type   Value
=========================================================================
63 	CfgEn 		Configuration Enable 		R/W 	0

62 	CtrEn 		Enable/disable counting		R/W 	0

61:53 	– 		Reserved 			MBZ 	0

52:48 	CtrID 		Counter Identifier		R/W	0

47 	IsCOS		BwSrc field is a CLOSID		R/W	0
			(not an RMID)

46:44 	–		Reserved			MBZ	0

43:32	BwSrc		Bandwidth Source		R/W	0
			(RMID or CLOSID)

31:0	BwType		Bandwidth configuration		R/W	0
			to track for this counter
==========================================================================

The feature details are documented in the APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
Monitoring (ABMC).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
v11: No changes.

v10: No changes.

v9: Removed the references of L3_QOS_ABMC_DSC.
    Text changes about configuration in kernel doc.

v8: Update the configuration notes in kernel_doc.
    Few commit message update.

v7: Removed the reference of L3_QOS_ABMC_DSC as it is not used anymore.
    Moved the configuration notes to kernel_doc.
    Adjusted the tabs for l3_qos_abmc_cfg and checkpatch seems happy.

v6: Removed all the fs related changes.
    Added note on CfgEn,CtrEn.
    Removed the definitions which are not used.
    Removed cntr_id initialization.

v5: Moved assignment flags here (path 10/19 of v4).
    Added MON_CNTR_UNSET definition to initialize cntr_id's.
    More details in commit log.
    Renamed few fields in l3_qos_abmc_cfg for readability.

v4: Added more descriptions.
    Changed the name abmc_ctr_id to ctr_id.
    Added L3_QOS_ABMC_DSC. Used for reading the configuration.

v3: No changes.

v2: No changes.
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 35 ++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index fea1f3afe197..e753a3332496 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1197,6 +1197,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
 #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index cfaea20145d0..acac7972cea4 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -617,6 +617,41 @@ struct mon_config_info {
 	u32 mon_config;
 };
 
+/*
+ * ABMC counters are configured by writing to L3_QOS_ABMC_CFG.
+ * @bw_type		: Bandwidth configuration (supported by BMEC)
+ *			  tracked by the @cntr_id.
+ * @bw_src		: Bandwidth source (RMID or CLOSID).
+ * @reserved1		: Reserved.
+ * @is_clos		: @bw_src field is a CLOSID (not an RMID).
+ * @cntr_id		: Counter identifier.
+ * @reserved		: Reserved.
+ * @cntr_en		: Counting enable bit.
+ * @cfg_en		: Configuration enable bit.
+ *
+ * Configuration and counting:
+ * Counter can be configured across multiple writes to MSR. Configuration
+ * is applied only when @cfg_en = 1. Counter @cntr_id is reset when the
+ * configuration is applied.
+ * @cfg_en = 1, @cntr_en = 0 : Apply @cntr_id configuration but do not
+ *                             count events.
+ * @cfg_en = 1, @cntr_en = 1 : Apply @cntr_id configuration and start
+ *                             counting events.
+ */
+union l3_qos_abmc_cfg {
+	struct {
+		unsigned long bw_type  :32,
+			      bw_src   :12,
+			      reserved1: 3,
+			      is_clos  : 1,
+			      cntr_id  : 5,
+			      reserved : 9,
+			      cntr_en  : 1,
+			      cfg_en   : 1;
+	} split;
+	unsigned long full;
+};
+
 void rdt_last_cmd_clear(void);
 void rdt_last_cmd_puts(const char *s);
 __printf(1, 2)
-- 
2.34.1

