Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44351FCFC1;
	Wed, 18 Dec 2024 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557928; cv=fail; b=Y20HohAmOpw9ldDZO5xby1oyinooOjKs708nLVD5SIoRitMCt2ntY64a/RcSPSNPh6EuzI9cRZ6nsylUoblrDQnNTPtQxcD7Z6Sl27EEFxzm5AYNH4EmoF170BuU+zYAx9+iQHLQolYA/zd6tX829FEEaOOsif/CBAD16gILsQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557928; c=relaxed/simple;
	bh=bw9tx1tJYjNrgaJbu4yJbUJ4LmpXwHKxbbWxzQwxAMM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JTz5coZAr05OAB4D0tGAXVjS5ulDR7yZQv9ZYODmqXSdvTBIJ9TeGUYXypyUcTzA6rWWo8NbMZnZ5jif4Lbp67VrFu37ajawoLD8V1Dv8zqDX1/5uEZsekiNcw8jFkE28PdkErjaFVnGJQ5/552TTabVzrlQXyq/t9CXKiP10mU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ntDxUjpn; arc=fail smtp.client-ip=40.107.94.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ntDxUjpn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjIAREwapHamXCBHXgYx+1ayRkcYoQax5HIhQyOVxUPumzWhVafJyKeMY9eCnw3BATotu1zzp0oaUPdFAmLFqrdL8aniLnXQAgXfIG3HewggQSawk9fPODnOsR/tlAtRsVaM4xaaKdYkkMRYhHehuRdrUtQxg25tYIMq8oG74OqIGVDnPW9hJINXFKpsnQn5ZywE7hYibUAzc6WjMH7zBtBsqe8cXisGKRG3j1mOsqqPi2s5o3ZSvGARdYfQmyGuxRV/gtSvZfgcZ9NFxQr+48HrPmSZS8jV5Ae1KYjTPsjGnyw8aMbpfO76sfQ31Fk7ft1uhkqmK7js98abYXNXAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meTbV9sJojrN0UN5QBs2nMHriakW8Y80qkuqCFqDU+4=;
 b=HEb9Ig/7ndA1BkjiQ0c510r/v8qudreqUItQOdKzpWbdDsN5IhcszClgv47USUMUw2P77zQrgJdwkkixMp4esvL5n2gWMx+xlkALYpwx8BK1XIm9XVsH+ZTGUujmEjh9UuEgRF4tnDRWKKhqHdHJsdqzzkvKpf7VNFaosylJJvyp4bEQsup9GQN6GC2vG3mxQqqVzXDjxPrBYM/ljG21mLzQFhDG6UECcsJ5OxYnd21wNSkXUGI86MGYsAOLjORbBGnkG7QfZkiWvUTo6ioHIXmW8YXylxlBQEJgnLMzv9cTDHXivGk18LwsSE0KZKAa9T0oIUSSzZl/hD8ziKJlJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meTbV9sJojrN0UN5QBs2nMHriakW8Y80qkuqCFqDU+4=;
 b=ntDxUjpnH/by9pvqjkGyCeW54PoaYEsElZMkIBhawmtTixDk4c6FU7A3RNRDKgz5HVr8NDfYh0zcU332DhRRM151lKdUBpMlxo8tEXICXFyro2aQva9tlo8sWILEWwI3OfSVM4ZdJgDUmQtf+UiUIMx2OqGJCP1txfnsoB/pOnY=
Received: from DS7PR06CA0011.namprd06.prod.outlook.com (2603:10b6:8:2a::6) by
 LV2PR12MB5749.namprd12.prod.outlook.com (2603:10b6:408:17f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 21:38:43 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:8:2a:cafe::2) by DS7PR06CA0011.outlook.office365.com
 (2603:10b6:8:2a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 21:38:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:40 -0600
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
Subject: [PATCH v2 4/7] x86/resctrl: Implement "io_alloc" enable/disable handlers
Date: Wed, 18 Dec 2024 15:38:00 -0600
Message-ID: <2049de4cc86740fe525468347836e00025f53c83.1734556832.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV2PR12MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: 560d2344-418b-49f6-9e98-08dd1fac57f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ptoStt+1Lil8V15ONsBtdbctUlyVUdRB/LxZZ+WNahckP7JruzZbcGpa59Hs?=
 =?us-ascii?Q?ODrlH0NwlzmXYJE6HWuuGMTWRlcRfkRzNH3FuGp1sHQbEcEF8Ey/hOgbM73B?=
 =?us-ascii?Q?RXJ2P11sUtbuzVGC3gFuHxWvVd1os8CrPciAUVOLwXDO6io09HX8JhlYRSYX?=
 =?us-ascii?Q?pLemGrG+u7rnqdf7VhR2FVscW8RME+psnWer0ebNht+7tF7AePxqDtpC+RaN?=
 =?us-ascii?Q?3ERovrn4mBI0MEO4BV6VaTiRZAZ0ciWlu8LdUhfPhmZW79eZc4w6xAVyQvh3?=
 =?us-ascii?Q?hDArdtpJJUy8Uhg89FlsKcZcEk8Y1/1uvIl2ASeOsWcSX51YuuZ85aRdqmpp?=
 =?us-ascii?Q?TVJqflzhCOyx+pl7UpLm5gDZlmgZSZHc7UAlHg37twNTkwrTdKQggUBegJV2?=
 =?us-ascii?Q?obTkW7XeoghfYam9DWxW/SLbCw0zqvd9yb0SPSmPC+ewsUxHouqeIHNrtEpO?=
 =?us-ascii?Q?NomzXpTGG/SKgjM67ZQ0d8AC/GiOpjekDJQ3o3AqEeqzXpm9ToRF5tg+Hprb?=
 =?us-ascii?Q?C6BjlllSuJlXmeWwkuRa7Z5f+ztYbfHZvldE71RJH6vrna+bJPiuZ7/L45Ht?=
 =?us-ascii?Q?ELbUD04Zn411DxnfudMgcsYTuzQhQWn7y4q8kOZgjo2a/vlm15ha/IVfA9tP?=
 =?us-ascii?Q?Pb+eqczn95sN3PyEMbAgR4CUZnq6+nav1UECV1+AgVfb2EVlKBAyINqn4Est?=
 =?us-ascii?Q?GFXqZUwQS/qej6Hwyz7e68CeW9NXvpGUdGreaGL98BV15XvShlXc6JJOFF4R?=
 =?us-ascii?Q?sE4U3uTFigJ7OakhP+atfR8RkmIISq1O/fTc4hJKbsjz1H6gcGHO19NDRmMz?=
 =?us-ascii?Q?mWvwKMvIQGzmlHJrotXeMDMr9WTu3RarCY/60oOD9B6ISeRLWIU6hWVjlYP5?=
 =?us-ascii?Q?Kc6ZmgNFlc9jI5ps+MCJ8dqyRYHfLXLUtnje/w1zYZxFLVjF9DcayRIYEbn4?=
 =?us-ascii?Q?v1OmS8uX49deF7J7mgr4X7TVTHK33WIH2za55URidUE6Cs/kXSLKrTJrjU35?=
 =?us-ascii?Q?EOONPWnPwe5d1FifVFR3vhMoGpusbOagRpWdeV0jIXNvuP9nts2Zwx8vpLkj?=
 =?us-ascii?Q?THcc2O01H97vJVGCFI8rSWXA2NDY5B06kkifm8jZw6qSvkcihSyM+JMvXy0I?=
 =?us-ascii?Q?lGGXVkh5quyeJ2cqO56yixKiiBmUV6BzsU87aHcdLva2K5IO8yePZnHSOKow?=
 =?us-ascii?Q?JeNIG+bLk2bS7nC88o3GtjAH7rL+DmoD8rnScstwW9rkGbAb5+iEIJGTC0Pb?=
 =?us-ascii?Q?3rYd7U/xkMLLn+M0/eXGbf4+cx12kYHCdACPluCRhF0ZK56fK5YQzAWiIqjQ?=
 =?us-ascii?Q?mZTn0uebObvKXnyjaTJ+VJp6OtnbHOWSD8avRGZ6R8SUAFE9K5pPuPgmv/lk?=
 =?us-ascii?Q?7G9q69wH7Ntl+tLBWDi3eRcAWgD3+nNk980Av+p/ACBxjs8iH16IilWIUAuD?=
 =?us-ascii?Q?Ai9xHfmKN2A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:42.4306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 560d2344-418b-49f6-9e98-08dd1fac57f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5749

Introduce architecture-specific2yy handlers to manage the detection and
enabling/disabling of this feature.

SDCIAE feature can be enabled by setting bit 1 in MSR L3_QOS_EXT_CFG.
When the state of SDCIAE is modified, the updated value must be applied
across all logical processors within the QOS Domain. By default, the
io_alloc feature is turned off.

The SDCIAE feature details are available in APM listed below [1].
[1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
Publication # 24593 Revision 3.41 section 19.4.7 L3 Smart Data Cache
Injection Allocation Enforcement (SDCIAE)

Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Renamed the functions to simplify the code.
    Renamed sdciae_capable to io_alloc_capable.

    Changed the name of few arch functions similar to ABMC series.
    resctrl_arch_get_io_alloc_enabled()
    resctrl_arch_io_alloc_enable()
---
 arch/x86/include/asm/msr-index.h       |  1 +
 arch/x86/kernel/cpu/resctrl/internal.h | 10 ++++++++
 arch/x86/kernel/cpu/resctrl/rdtgroup.c | 34 ++++++++++++++++++++++++++
 include/linux/resctrl.h                |  9 +++++++
 4 files changed, 54 insertions(+)

diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
index 3f3e2bc99162..360c52a62da9 100644
--- a/arch/x86/include/asm/msr-index.h
+++ b/arch/x86/include/asm/msr-index.h
@@ -1196,6 +1196,7 @@
 /* - AMD: */
 #define MSR_IA32_MBA_BW_BASE		0xc0000200
 #define MSR_IA32_SMBA_BW_BASE		0xc0000280
+#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
 #define MSR_IA32_EVT_CFG_BASE		0xc0000400
 
 /* AMD-V MSRs */
diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
index 20c898f09b7e..dff3354c2282 100644
--- a/arch/x86/kernel/cpu/resctrl/internal.h
+++ b/arch/x86/kernel/cpu/resctrl/internal.h
@@ -56,6 +56,9 @@
 /* Max event bits supported */
 #define MAX_EVT_CONFIG_BITS		GENMASK(6, 0)
 
+/* Setting bit 1 in L3_QOS_EXT_CFG enables the SDCIAE feature. */
+#define SDCIAE_ENABLE_BIT		1
+
 /**
  * cpumask_any_housekeeping() - Choose any CPU in @mask, preferring those that
  *			        aren't marked nohz_full
@@ -479,6 +482,7 @@ struct rdt_parse_data {
  * @mbm_cfg_mask:	Bandwidth sources that can be tracked when Bandwidth
  *			Monitoring Event Configuration (BMEC) is supported.
  * @cdp_enabled:	CDP state of this resource
+ * @sdciae_enabled:	SDCIAE feature is enabled
  *
  * Members of this structure are either private to the architecture
  * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
@@ -493,6 +497,7 @@ struct rdt_hw_resource {
 	unsigned int		mbm_width;
 	unsigned int		mbm_cfg_mask;
 	bool			cdp_enabled;
+	bool			sdciae_enabled;
 };
 
 static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
@@ -539,6 +544,11 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
 
 void arch_mon_domain_online(struct rdt_resource *r, struct rdt_mon_domain *d);
 
+static inline bool resctrl_arch_get_io_alloc_enabled(enum resctrl_res_level l)
+{
+	return rdt_resources_all[l].sdciae_enabled;
+}
+
 /*
  * To return the common struct rdt_resource, which is contained in struct
  * rdt_hw_resource, walk the resctrl member of struct rdt_hw_resource.
diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
index 6419e04d8a7b..398f241b65d5 100644
--- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
+++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
@@ -1798,6 +1798,40 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
 	return ret ?: nbytes;
 }
 
+static void resctrl_sdciae_set_one_amd(void *arg)
+{
+	bool *enable = arg;
+
+	if (*enable)
+		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+	else
+		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, SDCIAE_ENABLE_BIT);
+}
+
+static int _resctrl_io_alloc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_ctrl_domain *d;
+
+	/* Update L3_QOS_EXT_CFG MSR on all the CPUs in all domains*/
+	list_for_each_entry(d, &r->ctrl_domains, hdr.list)
+		on_each_cpu_mask(&d->hdr.cpu_mask, resctrl_sdciae_set_one_amd, &enable, 1);
+
+	return 0;
+}
+
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
+{
+	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
+
+	if (hw_res->r_resctrl.cache.io_alloc_capable &&
+	    hw_res->sdciae_enabled != enable) {
+		_resctrl_io_alloc_enable(r, enable);
+		hw_res->sdciae_enabled = enable;
+	}
+
+	return 0;
+}
+
 /* rdtgroup information files for one cache resource. */
 static struct rftype res_common_files[] = {
 	{
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 5837acff7442..8c66aeac4768 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -344,6 +344,15 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
  */
 void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
 
+/**
+ * resctrl_arch_io_alloc_enable() - Enable/disable io_alloc feature.
+ * @r:		The resctrl resource.
+ * @enable:	Enable (1) or disable (0) the feature
+ *
+ * This can be called from any CPU.
+ */
+int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.34.1

