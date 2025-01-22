Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49FE216388;
	Wed, 22 Jan 2025 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737577266; cv=fail; b=YKxngV6w611RoUD06k1FCfxWWE1YixnUtgAwbbXW3Xg2nDXwSFCAppqQfVwTAkya0nexyuaGKHvFFvS04JPy8pOI0Ae03equWgdjldZ6Tjoof9n5Ii5VEu6zXfxfvIqfW7iUSNRy35xh48m545vqOO6JP5gEdrOJZkCr/e+omWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737577266; c=relaxed/simple;
	bh=sLKWU8d0tEZQAoC1WKQH5FWVfryBf2/M2RhDCe4Fc/s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A2W4AEDBGck0XwRtE7a2A0orgJeLx0Tvv3+KQ9uI6ItnOhHaa+zpVV1qrZ+cELbxHi8vcXYoT9Lxnl10kTYApWIy/BRuI1bfXhA3kU/ZjjCEcAZRxPqI1iGVcIsygLkqAJbC7EG9P2tLnkd1ANYvuTAQT74M4VR3WTJEZkGdceQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BcZjbznO; arc=fail smtp.client-ip=40.107.236.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BcZjbznO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v9Bbap5OtjDBWokqH6h2j85YeBNnp09ZuW30cgp4aDbAHTD1wDry489KTvBEU7XFVfLM73vJEoD2JWCjH6tVjGZ974yKtzwNxA+xGbkqzqzeEUafJSWwVzWN7eZwK5/f9oYcEdX2T270qL/zAOP8x+lz9KL0DDkV78I+nAnN6Qz42emKztNTgivxeY3o3vyRwezBnB+k9GvqQ20pwc0soSeHZPxlobc+gacIqFtMik2a9IyscV8kTyV4U+/5jWywbw6GHGsSEKzPwmrEn9+dvIfk+1Fs13jThGvkGEt853rhgX9PWmzfJFmOOpI/W8qURKY0mT4QnUh0ba/0hwpkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIF+MWco3I3RyTP66fMGZ41wCeX6L72UQdUYIHwqvjA=;
 b=WjKa+b5kiv3KGZbNkRC3ROHKiYpYAs1QDyAoP7cjAcGvpHctOa90wrdsKa/r9q1ebNdZlipNfJGS9ktaUhjlIAq0LeqjVAM6tS8MidnZ0xVrc23g+44pIXHob1CPPzM4oI7IZFdxNlBoqFYunoqOvrS9TqYOQG+d92Xvd338NvPG1ZAY/vBb4DhtbI3dMIseegBK1Hbl3Fsl9ERy5l9S+TxLfPfGgMQl9UEo7JwdB6Qtux70eWVeJY8ulxLAmJ+7yODXoC3xD1+aKe0yfgiNgdZW3F6rghSH46uyvZXJQWbUByMm7I5DWJUFUKeeyklndrIBfDrjuooAi7qZU7tzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIF+MWco3I3RyTP66fMGZ41wCeX6L72UQdUYIHwqvjA=;
 b=BcZjbznOQlSW3rhcIZ748bOFyiUx6bgb6EDCpguW8RtQny2jjCMbtYdgqDXEa0fEpphSSjty0+v8Q59wj8rI/p+XOT8LAy3hchqFoinZmJEfZYmoX6IKEQissAlsDP4vIg0T3I0oCCOfJ/58b/GEkgLvNZxgXX/biNtl/hzjPsQ=
Received: from CH0PR03CA0445.namprd03.prod.outlook.com (2603:10b6:610:10e::31)
 by IA0PR12MB8695.namprd12.prod.outlook.com (2603:10b6:208:485::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 20:20:57 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::8f) by CH0PR03CA0445.outlook.office365.com
 (2603:10b6:610:10e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Wed,
 22 Jan 2025 20:20:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Wed, 22 Jan 2025 20:20:57 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 22 Jan
 2025 14:20:55 -0600
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
Subject: [PATCH v11 01/23] x86/resctrl: Add __init attribute to functions called from resctrl_late_init()
Date: Wed, 22 Jan 2025 14:20:09 -0600
Message-ID: <e946a96a5d161f7b32e84c23c1a0024a31db2898.1737577229.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|IA0PR12MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: b09f06d0-ff67-4f89-d6b4-08dd3b2247d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NoADu3ixoKtqdm1CXUJQKmJqgpIHnIYdoFOZUf0m2LUr08GSIxsZp2yiHbyl?=
 =?us-ascii?Q?qG6Iim1L9g46C8jboRfAABzaKJUeZ3CrlH9p5s3TH1ii3ETJxrjh+8W/q84V?=
 =?us-ascii?Q?RkRRGoXWoBLqI7FpV6+qHk8nvcgtKtrVjs4i8g0xfgHrmdc9u/FlfPMIQF2V?=
 =?us-ascii?Q?HZsjDGvLL34qXDXsSJ560iSh20a4DtHXt1QmCmJ5gGjXDXA+gkjf6mZAdGkH?=
 =?us-ascii?Q?C1lUr4LVp3wcW6K1A0Nj7ayb5YoGGmtrsN/7JBrHKfxUrQdk/zWEk07mcqlI?=
 =?us-ascii?Q?AQ3cOUwR8ugcH0yVCHH+IcZYWPcga3fgga1o75SRLw2go+mgN2GmJexbvdeE?=
 =?us-ascii?Q?LHt4Lf361IOKkp1YqW1jFIrEXkESAFXvJMrs0ABP6LxvLDlcl8C6CCBmO6++?=
 =?us-ascii?Q?hUrUl4YdawHUWjToJbeXHc7n2Q8jHS5qOakb1yeobM1SptHW18XDWBtWUigI?=
 =?us-ascii?Q?UuHvdsQSO6/Hx1MQt/9k1WAR2MRMx/5UUt8EbpQvavxsoW+ycI9ySK0Yd2N/?=
 =?us-ascii?Q?1lrcsmVYh0xdQ+dLxZ4xVkTK4UUmuILVrtUy+l7vxW7eV7qgG/YwwBgxhqo4?=
 =?us-ascii?Q?cVRCplnouYsEke92fwXvSlitKHyubwOJGWryAc8Hc5XCusTmzllXKpJxrR5n?=
 =?us-ascii?Q?baAwbNuWljLV6H85eOk0QQTkuxgQAc4LB2e+8tWUKMyno7wZmimILt9LWFsx?=
 =?us-ascii?Q?+k+N2FYu9LURkQX8ZpWH+HcKBLVaiXnUYYVOMxJJU6jorWen7mfE3xD4X/io?=
 =?us-ascii?Q?KgMM9YbYYOfOLG5QI2U422EwTSv67qndFhblef3tAD5Lxl4ix5EVsO/aO0a/?=
 =?us-ascii?Q?CqcyCan6p7UripG25vawV9BFdczBz6prfxZI+0l6G9VHeTEWadTQAlBAlNsv?=
 =?us-ascii?Q?KWIDEMgk1H4CCojF7RxhqGlWLzALWNCeoO2NMS62eq8uQuq0lFKJ5InWEkIQ?=
 =?us-ascii?Q?12F05jKwcn9CVF6UFWVZ2YzyjdpIMwuw6TQpWjkPuFiDaYINQTUtuOQcDDPe?=
 =?us-ascii?Q?ZARCiSEj2Gea2QSczqhgVcIWrkz4Tt9t6nHLAsrTWbrUNiv0efcQxastU3fH?=
 =?us-ascii?Q?GeFErPkyFcV5nqSSjWikL0qAKTVhW9SrKK79rTXeuN8QkikwSwSNp8LA8MzA?=
 =?us-ascii?Q?9q0kdpefj2F7vKO0NAZmlAyG+PLukwU4WnJZqjvvYm3oTTHzf7k3iJdvGBfN?=
 =?us-ascii?Q?Snr5UzPa6y5PMazHwddB3blL9/gWsdzNkIKbX6JcYMkdvky9ev+LFZOUGr3U?=
 =?us-ascii?Q?WmqRh6vnJEdt+u7NyI+hxJhh1pA0jIdLpKz5MExeslxHQXKkuy/ELqIvhawj?=
 =?us-ascii?Q?kFsjOBJOhbpXEnuCkkl/6QONE7GTDgwBo6Ai7jT3tQYkdrk9aXgJrWZULHxh?=
 =?us-ascii?Q?l89DdPPwo2Zpl/lSh1OFyARl7MvSUkP8mxfZGCKgrxSrkc9EGXu31zhfX3bb?=
 =?us-ascii?Q?YipueaD1YY6iF/yQobWnNOxdGX3i+ieMeMR7UL8EnxGoJdX/jlwvDGdKysDO?=
 =?us-ascii?Q?4PQAsD9/hQ8pojY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 20:20:57.5951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b09f06d0-ff67-4f89-d6b4-08dd3b2247d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8695

resctrl_late_init() has the __init attribute, but some of the functions
called from it do not have the __init attribute.

Add the __init attribute to all the functions in the call sequences to
maintain consistency throughout.

Fixes: 6a445edce657 ("x86/intel_rdt/cqm: Add RDT monitoring initialization")
Fixes: def10853930a ("x86/intel_rdt: Add two new resources for L2 Code and Data Prioritization (CDP)")
Fixes: bd334c86b5d7 ("x86/resctrl: Add __init attribute to rdt_get_mon_l3_config()")
Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v11: No changes.

v10: Text changes.
     Added __init attribute to cache_alloc_hsw_probe()
     Followed function prototype rules (preferred order is storage
     class before return type).

v9: Moved the patch to the begining of the series.
    Fixed all the call sequences. Added additional Fixed tags.

v8: New patch.
---
 arch/x86/kernel/cpu/resctrl/core.c     | 10 +++++-----
 arch/x86/kernel/cpu/resctrl/internal.h |  2 +-
 arch/x86/kernel/cpu/resctrl/monitor.c  |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3d1735ed8d1f..f0a331287979 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -145,7 +145,7 @@ u32 resctrl_arch_system_num_rmid_idx(void)
  * is always 20 on hsw server parts. The minimum cache bitmask length
  * allowed for HSW server is always 2 bits. Hardcode all of them.
  */
-static inline void cache_alloc_hsw_probe(void)
+static inline __init void cache_alloc_hsw_probe(void)
 {
 	struct rdt_hw_resource *hw_res = &rdt_resources_all[RDT_RESOURCE_L3];
 	struct rdt_resource *r  = &hw_res->r_resctrl;
@@ -277,7 +277,7 @@ static __init bool __rdt_get_mem_config_amd(struct rdt_resource *r)
 	return true;
 }
 
-static void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
+static __init void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
 {
 	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
 	union cpuid_0x10_1_eax eax;
@@ -296,7 +296,7 @@ static void rdt_get_cache_alloc_cfg(int idx, struct rdt_resource *r)
 	r->alloc_capable = true;
 }
 
-static void rdt_get_cdp_config(int level)
+static __init void rdt_get_cdp_config(int level)
 {
 	/*
 	 * By default, CDP is disabled. CDP can be enabled by mount parameter
@@ -306,12 +306,12 @@ static void rdt_get_cdp_config(int level)
 	rdt_resources_all[level].r_resctrl.cdp_capable = true;
 }
 
-static void rdt_get_cdp_l3_config(void)
+static __init void rdt_get_cdp_l3_config(void)
 {
 	rdt_get_cdp_config(RDT_RESOURCE_L3);
 }
 
-static void rdt_get_cdp_l2_config(void)
+static __init void rdt_get_cdp_l2_config(void)
 {
 	rdt_get_cdp_config(RDT_RESOURCE_L2);
 }
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 20c898f09b7e..05358e78147b 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -634,7 +634,7 @@ int closids_supported(void);
 void closid_free(int closid);
 int alloc_rmid(u32 closid);
 void free_rmid(u32 closid, u32 rmid);
-int rdt_get_mon_l3_config(struct rdt_resource *r);
+int __init rdt_get_mon_l3_config(struct rdt_resource *r);
 void __exit rdt_put_mon_l3_config(void);
 bool __init rdt_cpu_has(int flag);
 void mon_event_count(void *info);
diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
index 94a1d9780461..1c7b574bf0cd 100644
--- a/arch/x86/kernel/cpu/resctrl/monitor.c
+++ b/arch/x86/kernel/cpu/resctrl/monitor.c
@@ -979,7 +979,7 @@ void mbm_setup_overflow_handler(struct rdt_mon_domain *dom, unsigned long delay_
 		schedule_delayed_work_on(cpu, &dom->mbm_over, delay);
 }
 
-static int dom_data_init(struct rdt_resource *r)
+static __init int dom_data_init(struct rdt_resource *r)
 {
 	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
 	u32 num_closid = resctrl_arch_get_num_closid(r);
@@ -1077,7 +1077,7 @@ static struct mon_evt mbm_local_event = {
  * because as per the SDM the total and local memory bandwidth
  * are enumerated as part of L3 monitoring.
  */
-static void l3_mon_evt_init(struct rdt_resource *r)
+static __init void l3_mon_evt_init(struct rdt_resource *r)
 {
 	INIT_LIST_HEAD(&r->evt_list);
 
-- 
2.34.1

