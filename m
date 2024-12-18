Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B081FD7A9;
	Wed, 18 Dec 2024 21:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557934; cv=fail; b=RU6dGFH2kuDBD4Z1PwfOlE4f1oyBeUfwDwG4oL7Bpfqpb3/a2l2xQAqkFl6MrgD5+FAvtCkZL6xqI8Quu1gnSLSTZRWMupYgQdiWHmDHE70qeDwFAz4mY0E4CCsuCiNQEr6Lr6+PNuT0psf/IHEQu8Yqep8l37dzdJKhWTnpF5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557934; c=relaxed/simple;
	bh=vVwrgTph2DZbtETsB6Nqo+A5LBpp9zkRfdPcBiDLNsQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SO0oJqFbYbcoiemTW0ZxiTF0O4Fs0z2UFuX2JbTMj0kZUUgfz2nOrwVEMXiyDbQKLhcEOlocQNM8Jrc2ROpekAyBPN0YBfZIzhUF2/Ql1sBm/vU/BuwxAoE1abqbrl/7nCCZbF3BKJOpNMGG9g3O7v6/3t/0MSlOAHfG+g5F6zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QDr/Cbtd; arc=fail smtp.client-ip=40.107.244.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QDr/Cbtd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMUvuAgSIEU7/F1Oe+ASVErwRWA0X0mljf+MPUV8Z1ixFNjngBEyP+3nDhAII8ex6JDFp6jKwNXCaP6N33Z4WZKUXcHJpyGt/Z6dbhvvLMt4ZIyE4yFY6nALvCmyafnvYK4Q2SZomM9y12l0TVlV0DQ3PwgYwRFqrXpv/EukBQw0qtKEqW1z8F7mm1sI9l6yJxEQoka/Vxn62igmSQCf630RdmeFbpkETuSUGNCarkqEpsiJsQAEnUaj+zzmZ/0fyiIEVgG181bWOs2gTpY0ZNNDFZGyPQ6R7NVys6nvDZZhcacspQPuI9pZNQeXl1GGVUsYVW1/sciHE4rQVHP/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P1ShRWOWY3VDRyK9tFddgkE1qFXdLL6qosxOJYQKeo=;
 b=qux9j9RbZ5avjOpsG7+jmijolZ+0Tj+83ryqAjdHMqDHPFbVbq3NmszrVrmjjAgF3y9xVf5k2N9k+JaVO8J10TwPeSjMOlEMmYGXPiKuYkwzrm3VFwKAfk0YatQ6wmqPLxbhTSkovQ9keqzYrUlDV5zOvB2sfyAIrs7ohnsBFrjFOkJq3pbKnkr5Fqny/VROpCt2XgeyGirGoStj8jlsIDniJ5PcKVbIB2X/HXmqSSpyWhdxHBAZtz8+yWTCUGPDJ4sgSD+//zP5AzgpJH/2rjeSYA2YVDnQSVecxP9q8FlPw4L4O+USNiIH/HydBAob/yAR9VY5Jf6TdCsVpfUFtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P1ShRWOWY3VDRyK9tFddgkE1qFXdLL6qosxOJYQKeo=;
 b=QDr/CbtdPa6jj7KdpriVU1TaU0DotgS3usma8TS5Gt/8vwpA5ALQcYp2t2G3ZexwSBJahmxFe7HfHbmmMFH7T9xDgKU57oVFeFjj870MSnr/TAgCRdHYWZnFYwGVGugXrrduPuGOedMs4HlfgR33eJ2jmBFNkx5FPUHc0JZP18s=
Received: from MW4PR04CA0211.namprd04.prod.outlook.com (2603:10b6:303:87::6)
 by MW4PR12MB7357.namprd12.prod.outlook.com (2603:10b6:303:219::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 21:38:50 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::5d) by MW4PR04CA0211.outlook.office365.com
 (2603:10b6:303:87::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 21:38:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:50 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:48 -0600
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
Subject: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable io_alloc feature
Date: Wed, 18 Dec 2024 15:38:01 -0600
Message-ID: <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|MW4PR12MB7357:EE_
X-MS-Office365-Filtering-Correlation-Id: fab48523-c913-4568-cb3d-08dd1fac5c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dMTCKzivyGKLpcj8jfOHucwRZlHOjf+WBnm96RATG2khTCDm7gtnl0gCV+xE?=
 =?us-ascii?Q?6PlWV4rPqYjvTCqZASRfISvH9AnmBzMKNHWEiXv4JDT7AOyQJ++xP6sDNx1A?=
 =?us-ascii?Q?dweUTE6URaTWP0dAygzUtfInJ6WxB+zIPLYzWxkJlkf6Qf/k6bn5mQKxq/3R?=
 =?us-ascii?Q?aD4weWzOJisoAnenlCSoUH1bFJYTQcN7kcYouKJlMjy7ZW/TLCV8zDlDxk9C?=
 =?us-ascii?Q?oB14To52T8cEvRg/r+DfTaQ9+iVDELpjgT3L/3G297dQaklMxkJ//e4Cwoi6?=
 =?us-ascii?Q?v9Wt66WWGpp/TZ2JNBxsfYV9pQZcHW2isNS+Evg31SABYllRYYlR/mJk8vIa?=
 =?us-ascii?Q?+iH8xj/Hit6YXgs3KMUh2iG7b5nwj5oNte9ZvckaQzyp6tGPwXBos4RyfpvQ?=
 =?us-ascii?Q?uago46QU+POkYlDsn+amk4a4Og3cxTH3NUPbuuhLq8pQaqH6Mn7G9tj1x3Bh?=
 =?us-ascii?Q?JGwvHsCQYcyojYoSd7KTf+hckgSfk4F7v77h9wxsodY/sGbfJe35XMRHZQCk?=
 =?us-ascii?Q?3gnQV2QAyo2TsZxOnsQYo+rgErU4fcw5IuexrfJ5sSD3trN1U584/V3YF5oc?=
 =?us-ascii?Q?w13Ia7HPjxTfh6L+kzcjwemeTmjGFt84tbz4n9IWbNl8ROq49uf0Uodh/FmS?=
 =?us-ascii?Q?0G+FKJfyUKwBU2zf+SBcupLA0i/5WPLy0trH3KgCcQr2u23cZO3szr1/BwNG?=
 =?us-ascii?Q?GnnL0rc+AeJhsyK9yuQSIXwPAu6GtezL88MY4NKzbVC/yLPIQyjeFXQTNye9?=
 =?us-ascii?Q?SsCBWedC32UdOFDswgx0XAAykjMUCKf/ygoFSKVM9iu7w2EpHiV47LAHP90z?=
 =?us-ascii?Q?Qzin6v4bSvBMGJXVcI0MCje2ByGjbXZnJlhdj2RI5CelOQ8WoBQRu2rAN1cr?=
 =?us-ascii?Q?j/9Sivv9ilXH9sj0qt/0/Wd3kduhQQNdCU0UzAPWXMHyi4AkhuOXw0fu2Ljh?=
 =?us-ascii?Q?D8xseIgazSalwNEUOtSjarlDmQQx8x4aEfUleNpQ+E/ldkbh8OvuP8o/K6g2?=
 =?us-ascii?Q?acsTwzjI+XS2qSzC2sQ+Nes6nJoVBHZG0qO4zRtMZcCXvtzxWF0uTFutEgd4?=
 =?us-ascii?Q?U8A5ZCboSkWPITqYmH6hRXWvwGIlEtg2wkzw5KRFZLOgO6b6BgAEYKkl4UY6?=
 =?us-ascii?Q?CUWbCtF9lw77umOp2/YoO9u0hLgF1RSYrTnfycwoklhIB5TgOkyJITD1USIZ?=
 =?us-ascii?Q?d/g3M+5pY4HwlSWLV4evnv/lV+a5ugKjKGxjyz3X1o1Wm9T3hcnOQnN6e595?=
 =?us-ascii?Q?NyaDVlVjuVUFRLTHSNgB+uGyyd7csg2/PyLaibWofy8Epg3ZUP7Ltr3pGVV/?=
 =?us-ascii?Q?m0cYvK45EovTz9N/bXbtvOqH94d39/GwoornbTrZltiPBJVnRNdmumv5tfn8?=
 =?us-ascii?Q?x766IbR6cI7WGuECHsM4U5HSrSM37bBo099oZ+iOU1rmoGd7KZYQ5VGzpdCi?=
 =?us-ascii?Q?VB+v9bSgw7/BE9eq1HXhaqVjORTGhCKl8OUhDihXv2sqGcUNrB53uZT8H9Yo?=
 =?us-ascii?Q?66hc5QEORRhiwo4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:50.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fab48523-c913-4568-cb3d-08dd1fac5c88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7357

The io_alloc feature in resctrl enables system software to configure
the portion of the L3 cache allocated for I/O traffic.

Smart Data Cache Injection (SDCI) is a mechanism that allows direct
insertion of data from I/O devices into the L3 cache. By caching I/O
data directly in the L3 cache, instead of writing it to DRAM first,
SDCI reduces DRAM bandwidth usage and lowers latency for the processor
consuming the I/O data.

When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
partitions identified by the highest-supported L3_MASK_n register as
reported by CPUID Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15,
SDCI lines will be allocated into the L3 cache partitions determined by
the bitmask in the L3_MASK_15 register.

Introduce interface to enable/disable "io_alloc" feature on user input.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Renamed the feature to "io_alloc".
    Added generic texts for the feature in commit log and resctrl.rst doc.
    Added resctrl_io_alloc_init_cat() to initialize io_alloc to default
    values when enabled.
    Fixed io_alloc show functinality to display only on L3 resource.
---
 Documentation/arch/x86/resctrl.rst     |  27 ++++++
 arch/x86/kernel/cpu/resctrl/core.c     |   2 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 118 +++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
index 6768fc1fad16..52679175ee14 100644
--- a/Documentation/arch/x86/resctrl.rst
+++ b/Documentation/arch/x86/resctrl.rst
@@ -135,6 +135,33 @@ related to allocation:
 			"1":
 			      Non-contiguous 1s value in CBM is supported.
 
+"io_alloc":
+		The "io_alloc" feature in resctrl enables system software to
+		configure the portion of the L3 cache allocated for I/O traffic.
+
+		Smart Data Cache Injection (SDCI) is a mechanism that allows
+		direct insertion of data from I/O devices into the L3 cache.
+		By caching I/O data directly in the L3 cache, instead of writing
+		it to DRAM first, SDCI reduces DRAM bandwidth usage and lowers
+		latency for the processor consuming the I/O data.
+
+		When enabled the feature forces all SDCI lines to be placed
+		into the L3 cache partitions identified by the highest-supported
+		CLOSID (num_closids-1). This CLOSID will not be available to the
+		resctrl group.
+
+			"0":
+			    I/O device L3 cache control is not enabled.
+			"1":
+			    I/O device L3 cache control is enabled, allowing users
+			    to manage the portions of the L3 cache allocated for
+			    the I/O device.
+
+		Feature can be enabled/disabled by writing to the interface.
+		Example::
+
+			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
+
 Memory bandwidth(MB) subdirectory contains the following files
 with respect to allocation:
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 39e110033d96..066a7997eaf1 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -309,6 +309,8 @@ static void rdt_get_cdp_config(int level)
 static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
 {
 	r->cache.io_alloc_capable = true;
+	resctrl_file_fflags_init("io_alloc",
+				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
 }
 
 static void rdt_get_cdp_l3_config(void)
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 398f241b65d5..e30731ce9335 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -62,6 +62,7 @@ static char last_cmd_status_buf[512];
 
 static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
 static void rdtgroup_destroy_root(void);
+static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
 
 struct dentry *debugfs_resctrl;
 
@@ -180,6 +181,25 @@ void closid_free(int closid)
 	__set_bit(closid, &closid_free_map);
 }
 
+/*
+ * io_alloc (SDCIAE) feature uses max CLOSID to route the SDCI traffic.
+ * Get the max CLOSID number
+ */
+static u32 resctrl_io_alloc_closid_get(struct rdt_resource *r)
+{
+	return resctrl_arch_get_num_closid(r) - 1;
+}
+
+static int resctrl_io_alloc_closid_alloc(struct rdt_resource *r)
+{
+	u32 io_alloc_closid = resctrl_io_alloc_closid_get(r);
+
+	if (__test_and_clear_bit(io_alloc_closid, &closid_free_map))
+		return io_alloc_closid;
+	else
+		return -ENOSPC;
+}
+
 /**
  * closid_allocated - test if provided closid is in use
  * @closid: closid to be tested
@@ -1832,6 +1852,97 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 	return 0;
 }
 
+static int resctrl_io_alloc_show(struct kernfs_open_file *of,
+				 struct seq_file *seq, void *v)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+
+	seq_printf(seq, "%x\n", resctrl_arch_get_io_alloc_enabled(r->rid));
+	return 0;
+}
+
+/*
+ * Initialize the io_alloc feature default when enabled
+ */
+static int resctrl_io_alloc_init_cat(struct rdt_resource *r, u32 closid)
+{
+	struct resctrl_schema *s;
+	int ret = 0;
+
+	rdt_staged_configs_clear();
+
+	list_for_each_entry(s, &resctrl_schema_all, list) {
+		r = s->res;
+		if (r->rid == RDT_RESOURCE_L3) {
+			ret = rdtgroup_init_cat(s, closid);
+			if (ret < 0)
+				goto out_init_cat;
+
+			ret = resctrl_arch_update_domains(r, closid);
+			if (ret < 0)
+				goto out_init_cat;
+		}
+	}
+
+out_init_cat:
+	if (ret)
+		rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
+
+	rdt_staged_configs_clear();
+	return ret;
+}
+
+static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
+				      size_t nbytes, loff_t off)
+{
+	struct resctrl_schema *s = of->kn->parent->priv;
+	struct rdt_resource *r = s->res;
+	u32 io_alloc_closid;
+	bool enable;
+	int ret;
+
+	if (!r->cache.io_alloc_capable)
+		return -EINVAL;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	cpus_read_lock();
+	mutex_lock(&rdtgroup_mutex);
+
+	rdt_last_cmd_clear();
+
+	io_alloc_closid = resctrl_io_alloc_closid_get(r);
+
+	if (resctrl_arch_get_io_alloc_enabled(r->rid) != enable) {
+		if (enable) {
+			ret = resctrl_io_alloc_closid_alloc(r);
+			if (ret < 0) {
+				rdt_last_cmd_puts("io_alloc CLOSID is not available\n");
+				goto out_io_alloc;
+			}
+			ret = resctrl_io_alloc_init_cat(r, io_alloc_closid);
+			if (ret) {
+				closid_free(io_alloc_closid);
+				goto out_io_alloc;
+			}
+
+		} else {
+			closid_free(io_alloc_closid);
+		}
+
+		ret = resctrl_arch_io_alloc_enable(r, enable);
+	}
+
+out_io_alloc:
+	mutex_unlock(&rdtgroup_mutex);
+	cpus_read_unlock();
+
+	return ret ?: nbytes;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
@@ -1984,6 +2095,13 @@ static struct rftype res_common_files[] = {
 		.seq_show	= rdtgroup_schemata_show,
 		.fflags		= RFTYPE_CTRL_BASE,
 	},
+	{
+		.name		= "io_alloc",
+		.mode		= 0644,
+		.kf_ops		= &rdtgroup_kf_single_ops,
+		.seq_show	= resctrl_io_alloc_show,
+		.write		= resctrl_io_alloc_write,
+	},
 	{
 		.name		= "mba_MBps_event",
 		.mode		= 0644,
-- 
2.34.1

