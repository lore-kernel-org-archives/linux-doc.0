Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5461218589;
	Wed, 22 Jan 2025 20:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577402; cv=fail; b=EcWc553o2wHidBnyj80QrImX6sDNjBGb8jCYsr0FzghvV+t1KdaqYPL2jVXrtFqJGI07vFCUIfkguMN8c6qUFCcUk8Sic2/y6zkRDk+hQmTa+H5JdbOXgGp2tfA+/KswBecaUCTyeUBhIBBanqPqaggATtgkQA6XaO7aJ/nGkps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577402; c=relaxed/simple;
	bh=QmLe1+4piIRdrYLVZbFXj38m0zIjCBMF+pKkZ3/aBMQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxXaK/q91ObSe3fRy/EN5MG17slDuca5lxVfBHmTUZIAkzAXvLlRuka16YpJeEE+h6IvH/62IwyeZsPL4IVaQ4k3wS2Gl5zU9a958O5usB8w8x6VvF0a3s/ksnhVMhlWLru5kFwgvkY48+U7vADmCLGLJxoOLAtu0uonA8VybcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bM++9uuT; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bM++9uuT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQCjqwSvs63lFzWTIWmCrPkcvfMMndbwBiDzLUHKVKnNi0gWNA1OtDhCN4yrUCbGDbCnGmFigDbRoyiGdm2kqj1sqnKIrjhtQrSCtO7empmaFL9qGTZw/uz2sv5g0YPj9BfwEsOBNCYlnJ4tFsGCcUYULtiWTXkT/XiDn1N2sF0S3qO+J5I/OXtp66/7elsVxVOKCOj3yk9gO20edIcbTNagohaLoLM8hgCmFO1TQKck0vAfWlm5ExHNgUVP6n8WooEkyrmYCXDSPOeubey/hiejmA4OFNvZCj3jnFWC/WAavvK5kWouO/vhXznXf6c9rGDpe/T3M+4KltW1fb+0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KlEOkR1OSotvkCGt0xT1cQqUmI6uKhsD1QKydw+aoj4=;
 b=Du2kX2KFSypZHprRtrC/gQULHTudcqE15nIvDfr63ngOFdhxmMXZSGHL22DheBRbM0wwbfCkAxIjf0H/jLa48NjDut0F/IAtEGQvhRKbK0RYZYmlla8gdx6/8p4EU5xm88M+GvW1FmiISze2eU2crNLeRhmwfJwV6KFw8K+ePdABMNSHA2RoSCbPI3c9nTFOsIVCtIezzOhgIZS3/8wZUf3SueV4yvmhoaEtj0oOwjtBDrV87bFMzO1ox6uJFRWjzDDg0i4ciu2EVhsr+tZzbyVmbonydVTT75/5Lt5IZA+WL25gh0+iVVKEYxc71SnwkO/7RQYVIk5+VD3hTYoLPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KlEOkR1OSotvkCGt0xT1cQqUmI6uKhsD1QKydw+aoj4=;
 b=bM++9uuTc35TReNSjTv2HH8xgaSuCZBjr62yobNY8/gaVxP6dFbfYsvWyn1c8s8ERGOFz4eM9QHi0ZG6vVuLTL5xQEhpunjQL5CnEq6GgZ8BjU2/s2pFMI7+iO0H7GOpDFFHvaXcFSmjuPfG2HtMacr+kXZ8RUTKVuTe61r75PI=
Received: from CH2PR15CA0002.namprd15.prod.outlook.com (2603:10b6:610:51::12)
 by PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 20:23:15 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:51:cafe::6c) by CH2PR15CA0002.outlook.office365.com
 (2603:10b6:610:51::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.21 via Frontend Transport; Wed,
 22 Jan 2025 20:23:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:23:15 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:23:13 -0600
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
Subject: [PATCH v11 18/23] x86/resctrl: Report "Unassigned" for MBM events in mbm_cntr_assign mode
Date: Wed, 22 Jan 2025 14:20:26 -0600
Message-ID: <22cdafb381295c3802388613686d7b89a5e313c6.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: fe834b0a-df29-4e47-2795-08dd3b2299d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HlITD0FYUuBfcfWSkd9ig/XDjmixVOGk5qTrI8ZariMrS3S77jH2pK38p5WT?=
 =?us-ascii?Q?h9bC2hK448Zgin4xAlq0FLZk2s2+t9LNA9lCNNjx8AdENzMuIf/7eINpIV77?=
 =?us-ascii?Q?/eDFrgNktLTYU3jaJwTeivdb8g7Sl2jeWl8TrbmxHphT1zxEyr1kTLQLXRaQ?=
 =?us-ascii?Q?yz3RorXu7smVa97E/sfM0R9qJptCuT1HqUQKcfRy1g5uFAGfcEvm5Kpx3QJP?=
 =?us-ascii?Q?Lxf7z5412BoRorgFkx2qOo5+Imj9cNPw3h87Al2r6zVqpEDKJ405Nfx2fm4N?=
 =?us-ascii?Q?mZ62UdQkPQw4NF5/ELTdgrvW0mEyRVK1PqdakxRPHMwcRqrldKS4b6VjLBnN?=
 =?us-ascii?Q?IGaV3C/eb2Q0QUjm7DMY9sAAtYZ3x3ySQPvydw+OPGKQDXeKGigfmjpC8hAM?=
 =?us-ascii?Q?rWU78hnFGOjoGWVUZadw2Yg802dQxJZBOO2ZDbvy+n4fTfoqefExnkL386Le?=
 =?us-ascii?Q?9um6rnrOaBIEW2yJzACjJuJw0avgMjAg+QlrSNhmsMMOMBqdLah4PM9r10jH?=
 =?us-ascii?Q?S25KQcwYoCh0gnugl6sY85SS69k1/kjw8nLaKGLWmMJU6OGpumFnCwg4xOAA?=
 =?us-ascii?Q?Y8LLr6Kdz/2IWPBBdZe/i2LbXJWH+thE1tXfGvarZypk4pICLYf2RWKVsQhc?=
 =?us-ascii?Q?37vquu4i1xJ+WisfOYgy0rNF5JAGXXG1AVaXoC86F0suSi4Mqt3YqqF3NQ50?=
 =?us-ascii?Q?XfWrp/XAGqFce9+u0WXEpX92yMlvriA0zmQlHrhorQqmnZWp6UEkEfLZ8AZU?=
 =?us-ascii?Q?Mdhpel683CxXdMkbfF5rJ2c8mLY8xNlwBwGNnaA/NU2VMVUujCq5j/duBPZK?=
 =?us-ascii?Q?Lu85wxY3K7fgRuouLo2su2Lw26wGOmO/zuSTLFuOBelbA5KLUiJsfa8vl02G?=
 =?us-ascii?Q?YlTANXvcQpRBmcPf95sOTL/jNiBSWvEphDoopisVa7YPPjYZUJ4XF7StP8or?=
 =?us-ascii?Q?HsVoHaPus605Mt7DfT7fI/62ZUcVf8T4zH/k3Jv2v2Zo6qPzKHmjC79sWhYk?=
 =?us-ascii?Q?v5mvPCxpn33vaQnDuhDd8Qv6R+L7SCo4S72YeApofFJjjUoh+fxCj4chgrSn?=
 =?us-ascii?Q?CSENpcS+xeMOoqqTLmEasyXLSerSxhVG36sgzrcTrf6ywaUDCP/XPaV5J4b5?=
 =?us-ascii?Q?vlwd0iD315qVfGwRLVroj+WgtkU1Zs3QqdWso4h+6RpEEmUgHHDn3TLaHvO9?=
 =?us-ascii?Q?o1Pcz/95L8uDZ59nUWSV60fV4fljh5DIn0Q0bs5ENndCJMT0JULBzepj7J09?=
 =?us-ascii?Q?SEZ2aut9eNTRSkKSzyezQBD63mPgXsVLN4/tUxkwaRJXCbdLRkMvRF5lcUFA?=
 =?us-ascii?Q?YdDNPehlBVIWlXoCQyAUGy6QCxUYs5yzXkMki2RC2DtS03pQEocy+2rH0pDW?=
 =?us-ascii?Q?BJTnzx5Hg/0r79aBmYjcYPmI6NHFnPGzyJB2Bie6bAVf1UEOWUYO9l8rzUVq?=
 =?us-ascii?Q?dyiDIXQrEl/H7vzDyls+6BmA5YtpSvYc3dpbzpn/goqZfgfE2lHAMKGIsWjO?=
 =?us-ascii?Q?O1zK/7qgiOfFlrs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:23:15.1245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe834b0a-df29-4e47-2795-08dd3b2299d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808

In mbm_cntr_assign mode, the hardware counter should be assigned to read
the MBM events.

Report 'Unassigned' in case the user attempts to read the events without
assigning the counter.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: Domain can be NULL with SNC support so moved the unassign check in
     rdtgroup_mondata_show().

v10: Moved the code to check the assign state inside mon_event_read().
     Fixed few text comments.

v9: Used is_mbm_event() to check the event type.
    Minor user documentation update.

v8: Used MBM_EVENT_ARRAY_INDEX to get the index for the MBM event.
    Documentation update to make the text generic.

v7: Moved the documentation under "mon_data".
    Updated the text little bit.

v6: Added more explaination in the resctrl.rst
    Added checks to detect "Unassigned" before reading RMID.

v5: New patch.
---
 Documentation/arch/x86/resctrl.rst        | 10 ++++++++++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 13 +++++++++++++
 arch/x86/kernel/cpu/resctrl/internal.h    |  2 ++
 arch/x86/kernel/cpu/resctrl/monitor.c     |  4 ++--
 4 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 99cae75559b0..072b15550ff7 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -431,6 +431,16 @@ When monitoring is enabled all MON groups will also contain:
 	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
 	where "YY" is the node number.
 
+	When supported the mbm_cntr_assign mode allows users to assign a
+	counter to mon_hw_id, event pair enabling bandwidth monitoring for
+	as long as the counter remains assigned. The hardware will continue
+	tracking the assigned mon_hw_id until the user manually unassigns
+	it, ensuring that counters are not reset during this period. With
+	a limited number of counters, the system may run out of assignable
+	counters. In that case, MBM event counters will return 'Unassigned'
+	when the event is read. Users must manually assign a counter to read
+	the events.
+
 "mon_hw_id":
 	Available only with debug option. The identifier used by hardware
 	for the monitor group. On x86 this is the RMID.
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 536351159cc2..d00e77d08ef4 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -679,6 +679,17 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 			goto out;
 		}
 		d = container_of(hdr, struct rdt_mon_domain, hdr);
+
+		/*
+		 * Report 'Unassigned' if the mbm_cntr_assign mode is enabled and
+		 * counter is unassigned
+		 */
+		if (resctrl_arch_mbm_cntr_assign_enabled(r) && is_mbm_event(evtid) &&
+		    (mbm_cntr_get(r, d, rdtgrp, evtid) == -ENOENT)) {
+			rr.err = -ENOENT;
+			goto checkresult;
+		}
+
 		mon_event_read(&rr, r, d, rdtgrp, &d->hdr.cpu_mask, evtid, false);
 	}
 
@@ -688,6 +699,8 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
 		seq_puts(m, "Error\n");
 	else if (rr.err == -EINVAL)
 		seq_puts(m, "Unavailable\n");
+	else if (rr.err == -ENOENT)
+		seq_puts(m, "Unassigned\n");
 	else
 		seq_printf(m, "%llu\n", rr.val);
 
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index c979abb3d3b0..c006c4d8d6ff 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -732,4 +732,6 @@ int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
 				struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 void mbm_cntr_reset(struct rdt_resource *r);
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 118b39fbb01e..3d748fdbcb5f 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -1436,8 +1436,8 @@ static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
 	return ret;
 }
 
-static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
-			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
+int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
+		 struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
 {
 	int cntr_id;
 
-- 
2.34.1

