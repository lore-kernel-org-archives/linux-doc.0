Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE17C1FC7DF;
	Wed, 18 Dec 2024 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557943; cv=fail; b=Gv3xrO25CfUE8EDql/os+yvyPwrso8faYV/+GNQkl/SBYTDI6jcJzwDG84POGZ8JUHoiA7cMSn78FXSVucISNpux/WSViFX6yyZ2G9RFdwr11NLMJTKBYWWDY2VsZVpY5MgX9OJ2LZ7pEsjZEqe0fGfikMmtnpHBntOrYnSQnLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557943; c=relaxed/simple;
	bh=L6opYfh2edydpHw+w2P7gd3b2NkiWELK2xetYUxxw8Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=be1ONVFUu7aa6gnLsQAzoVXDTFzYzwownj5lbYx86BI5bo3R+Izys1zo8nz9F+F70BnFtXuq7P3jAqep0tWORloS/BGlz520AG6OVi5FAvSxOQkVUNh2QAtLYDl00D/Whw6zWghFiqKr87sMAn35rLrEu70G1bE16/VSSWCTABw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jKn5OaJX; arc=fail smtp.client-ip=40.107.96.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jKn5OaJX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BYfCYxumEnprswNCk+B3hFHYFYM53OmDLEcIRlMmHlnKmHaC06+KXwPWOd/X/pQRQQQj2D0ty3+heXuh/8iCq9forhfrDViK/c5dqjfcu9j2wRcL9wPlBEq0p0GAv4o0mFCNs/pUNL/klIbE1JOxlx0pWWhDI9w2tlu1zUHY1AvIZ3zZFPaAXcOIGjd8lOIHyI8ybDK3KPQtcVJhxMGsb6gA436D3QCGp9hn62kC4EYKb8jP/NAyIlVjElfbIACJMztJ4Nu53THhc3w3xlYG6HNBVJcy7JWIhhvx3mX6dr/hXXV7SO3a8TobKuItMxuz3cYUBupqzMkFAQYhOlCT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWm+PbxO8sx/FY4FdjuntqgCIQVw71CdNF9OCndcWhw=;
 b=pGh4iYqrp08KfMVQpx7RD134jdoBxyiOn0sTgDVBowQMZYZwQxbT0uWkZ8XC/vTX/ydKb8kyEhVthyQ2fJQ0TSAswCCrT4vdER9ACXzNrOT06XCyDZk0JhM/d+Ygbn1ffaUSWSSjZNxPWVzo3eik67sDA0eXxcQ3vF21zjkDuCELcI6HqZosXZPfrh2Y9PMcO79iUitk7bqRWmgOsVADiZqVr0KVm+O0JsNwFXPXB9gkN7z/15v7/uufhcBJTJ1dlFEkjsk9SYo6N5haZmf7nB7XzHERVFK+iuuICEuiide46b6tOw1iGXOf2vpqNLxrK4D91N56w63RU1pQZ9GAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWm+PbxO8sx/FY4FdjuntqgCIQVw71CdNF9OCndcWhw=;
 b=jKn5OaJXTQoYlUemEK8oRogbsJNdDX62+z29DX1gbxOaPzjW4mwXurBcVzcxNiME7yz+mmF6aqmSimY9lmDkNV23TpP0FMqFJkHEs4O2OIt5XyENDw0mtTDkeGSNT8HF/9O32V7CqHV9OA7pgGJtC1oazTcHzyaeVeVOW3rDV14=
Received: from DM6PR02CA0095.namprd02.prod.outlook.com (2603:10b6:5:1f4::36)
 by PH7PR12MB7137.namprd12.prod.outlook.com (2603:10b6:510:1ed::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 21:38:58 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:5:1f4:cafe::a) by DM6PR02CA0095.outlook.office365.com
 (2603:10b6:5:1f4::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 21:38:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:57 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:56 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v2 6/7] x86/resctrl: Introduce interface to display io_alloc CBMs
Date: Wed, 18 Dec 2024 15:38:02 -0600
Message-ID: <0a50ccd017eef4fa968413895ce2d9b08c23606e.1734556832.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734556832.git.babu.moger@amd.com>
References: <cover.1734556832.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|PH7PR12MB7137:EE_
X-MS-Office365-Filtering-Correlation-Id: fa407b26-9be3-4fde-4f37-08dd1fac60fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+uVUJsuO7yZ9ouHLzba94mU2Ua3GRI4/eq24MpuhWpJmpUn+H+a3jkWsECHR?=
 =?us-ascii?Q?pX7zv+kLR3w7S4HxfBdZpDiWa1q7ElDvkinwvhoKdBptRqpHF99M6YfZxXWG?=
 =?us-ascii?Q?cCnvWsKXboPYlWWq4yGxK4uULkMEXRDWYxZaHArRrEHaWA9OcqbDL9q6s79L?=
 =?us-ascii?Q?37RQ0l8CNpyBEOGQDIAIxMdn1vSbnTgirv2nU46D7o+FMNEwZnlidU+zKfaH?=
 =?us-ascii?Q?vQ4qPqyGYPhCWVvswRqwPmMoxmVAEtk25Y61YMqcUtyxNJUxMEplaCtOD1Zb?=
 =?us-ascii?Q?nP9+2nsU3/mOujBrnjBlBBIQA+BZb6rqx9UCF3Li9om8H4ux/TCCB1Dp3sz2?=
 =?us-ascii?Q?kYchWhaxdIdKrMHh1pTwauOQ5P/S/pu+wKtN0xAwU96Wlh2a/a/9W6prl/54?=
 =?us-ascii?Q?VM2k3JTdCuVX5FULECv4mZ818Afts7a2vPYrM1tNu9TQ1yAJxCmpQXi24MAc?=
 =?us-ascii?Q?UPJz7uwfpXlTxSVJ9gvchvWDPAAZPRIbYm+AgP4DNBfG/uEwsGwHJ8tfhB/S?=
 =?us-ascii?Q?P6vCmjuO//iea+Ukiz2QRVGTj7mb6gjOGp9S8U11SYy7I5THD2vzBH30lYzP?=
 =?us-ascii?Q?5rn9Q9Riot9kKKSqNStTaj2cEao56pjxNLEbwX8hTrcP4sl8GOkUKEI79Zow?=
 =?us-ascii?Q?XGZPGmwODZrG2Al6BPSFTmrV75S9lnLyyNuOn94TNOr+Nio+ZrVlWWvQgTIQ?=
 =?us-ascii?Q?5HBCgCZsQfXsac50TqTQD3eeFXnRaihCH57rGzOjDSAe47YSwxhrb1ID0vdD?=
 =?us-ascii?Q?GZJcJdjsr41ogoYHtuzQg5Tu39h02ylCg9UkykqSBsr4gyQ0UJOcI/cmuVwq?=
 =?us-ascii?Q?bQohbX/QsQ/Z2y6SUw7mLhCdjm+rYH0JvuDqK9ZhAy8RTEDcCkzzj1r/1FO3?=
 =?us-ascii?Q?J/4xkbXyLTu379gRmtsLSq3rEQZyJvIUjsHDe7qH8GkvfEc7BqO8q878/eSq?=
 =?us-ascii?Q?7mxTyxONVfD9yWXepL4A5h0IjAIqMLoF+VNNhSZrmf0uoJq/HaV8tpLkX8b7?=
 =?us-ascii?Q?n8v+u2lGO2HnHect0gYpCdDPK08ZLIKXHf6M4Cg+RaxoxNbiVvHUAropUEo6?=
 =?us-ascii?Q?S57yG2tqZXBk2u2lyFhaMZhLA9BaGRKW04I0DtFAPEYieP4k1M3Iv0Ir/rdM?=
 =?us-ascii?Q?YeQJe4kKtHUJYIuYf5v9i/5dfEggFel8gwPAT+4adPb5IpRFWP928R45CkBy?=
 =?us-ascii?Q?mJJdl67RI+MDt5Lk6MIi52HCYVkY+05VzDb6Rmq2jLUWJNKs4nkqg4UiW6tZ?=
 =?us-ascii?Q?yECX/3L057B+u/sACQ+QUBpqxa19mROVm3TfjDY3tJHj3+yjaOVt6PjddBbv?=
 =?us-ascii?Q?q3Mb5LDJdi/eEPYkA/p/kwFANTbABT7lr4uTBgMi0UzdvbQf1goMg65ZHBgg?=
 =?us-ascii?Q?aCgli2o4kT0rpv0Vyy9rNOkAXB4Dpljpw2IPl+rs/gVVnhSpsFr49nUZ4Sef?=
 =?us-ascii?Q?GFO5hXsNYypB2gmgFklTrKKo+jOXZ9j26O2223NOj3QFjdqse8iNe1a+zNem?=
 =?us-ascii?Q?ezrfUVJ5eBmJ24U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:57.6990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa407b26-9be3-4fde-4f37-08dd1fac60fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7137

The io_alloc feature in resctrl enables system software to configure
the portion of the L3 cache allocated for I/O traffic.

Add the interface to display CBMs (Capacity Bit Mask) of io_alloc
feature.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Fixed to display only on L3 resources.
    Added the locks while processing.
    Rename the displat to io_alloc_cbm (from sdciae_cmd).
---
 arch/x86/kernel/cpu/resctrl/core.c        |  2 ++
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  2 +-
 arch/x86/kernel/cpu/resctrl/internal.h    |  1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c    | 33 +++++++++++++++++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 066a7997eaf1..f1ac7af7b366 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -311,6 +311,8 @@ static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
 	r->cache.io_alloc_capable = true;
 	resctrl_file_fflags_init("io_alloc",
 				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
+	resctrl_file_fflags_init("io_alloc_cbm",
+				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
 }
 
 static void rdt_get_cdp_l3_config(void)
diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index 536351159cc2..d272dea43924 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -444,7 +444,7 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 	return hw_dom->ctrl_val[idx];
 }
 
-static void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid)
 {
 	struct rdt_resource *r = schema->res;
 	struct rdt_ctrl_domain *dom;
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index dff3354c2282..1550cb468b8e 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -668,4 +668,5 @@ void resctrl_file_fflags_init(const char *config, unsigned long fflags);
 void rdt_staged_configs_clear(void);
 bool closid_allocated(unsigned int closid);
 int resctrl_find_cleanest_closid(void);
+void show_doms(struct seq_file *s, struct resctrl_schema *schema, int closid);
 #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index e30731ce9335..4d6b83d18790 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1943,6 +1943,33 @@ static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static int resctrl_io_alloc_cbm_show(struct kernfs_open_file *of,
+				     struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	int ret = 0;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	if (!resctrl_arch_get_io_alloc_enabled(r->rid)) {
+		rdt_last_cmd_puts("io_alloc feature is not enabled\n");
+		ret = -EINVAL;
+		goto cbm_show_out;
+	}
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
+
+	show_doms(seq, s, io_alloc_closid);
+
+cbm_show_out:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+	return ret;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -2102,6 +2129,12 @@ static struct rftype res_common_files[] = {
 		.seq_show	= resctrl_io_alloc_show,
 		.write		= resctrl_io_alloc_write,
 	},
+	{
+		.name		= "io_alloc_cbm",
+		.mode		= 0444,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_io_alloc_cbm_show,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
-- 
2.34.1

