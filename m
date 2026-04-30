Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011038.outbound.protection.outlook.com [52.101.52.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D160E3C9EDF;
	Thu, 30 Apr 2026 23:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591553; cv=fail; b=tKQ8ThxL318osdSWPxz3VJg6EWF39bcndPOGIiWaEaKzyxudBcv9L/KPAE+CgczteoJxlDKQA/ptey3T91nX+x3TS+lQSqhxFaPYriEJcTYL5G+NpGVMunGI4xBCeQZFnq9/qhfkER71Q+Bl8zxNgsu0FG4Zn13oDsBccIARgj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591553; c=relaxed/simple;
	bh=JirkQJXuX33/78uB83NOASXV+k/8QaHetU+bTiDXi2s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdmaeojKraLJvwu628dSIrnaG0TvDdAY1bPTtuJzbRZjUGs/49gKmaAe6hNk+WQNGY+TQUs4oLFYD/F7TpEmgjG9XiznhDZ10owGWDVKzo8sTLQFHTQdOSzAjwM09ZXbzBzxwzdcE+TYRbBlRJbYYmmwAHTO6Cuu31F6KlNbn7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oB9JMQjH; arc=fail smtp.client-ip=52.101.52.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oB9JMQjH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u1InqwNQxUt3dvQyLIJRCEbtEP55YdtSPcqVx1KU6N22DJbh1XS5MbL+drl7ZBJD1nTS5tl0czEu7kifK7ajra/i+x/+FY5TT795nCvDiJbKf/xHBjeUvc+pIrSvNtJE/eCNgp0dCVbgmoMHJiHeGTjDliOkXpKTPQgQFiXRVmlpdR1JczoNG2ZQWiGWa3foe0nyB6xJnUlhmQdFducbk8xv6QT+md6zBYnb2WdE7g3TQKqUSphwHsW0ZjxM419VYwp8Xp9OljxuSLI2zlDuTlts/mA3ECdz/6depb/j4Jg7H64J453Lkws+s+M3hF9Y3N1sSKkjopMS0XFjQ50kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8GRiROUN6gQ5smbZ96DHqRS6bJj8VflOO8SC8B9InU=;
 b=j8wc4CPWx3nPZcCcHn1IOrmy+y01DJnuwdwN3Qxe2Du+lJVVZSqaG6p6szcfRxCKyPLs8W30yinwiJaAJPqc4heeUNXa/Ys7qqCi9ono7uS4iEimBbkTC/gYqA2xCWeeAMV0nCzz+7D6VLIkmdNSkPRnENv2yqYGExWTrCKpJk95Ai5M/Ot2nzXJD0Xca/ELe7bC7yjtVhkOhRuWg+RNiQ/VRDH8QkJEYbcq0WhiMWPbPqGpdzexwYmae4pmeugg7x1+dcO9PCd0HueOQa0REIPYQaB2+L7CwDdY+xT4tcvu5eP6wQZD0gYK6GNFI4azb074DM6v14Ukxk/ecADKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8GRiROUN6gQ5smbZ96DHqRS6bJj8VflOO8SC8B9InU=;
 b=oB9JMQjHaBW0enkb+4YzapQDrZn6z5zwq8p52iFI41qdhuYjxAFygVl4A6s92NvxyX8EMEt7uPtj4mmuQsA5DCxxkX3Kctylxi1c5E+1QyaJBSSyfxcqH6qp3uCqAVEKxXp9Ifw+CWRkw8XK8bdeDQMbmsliQW10uDLroqIb1ME=
Received: from SA0PR11CA0128.namprd11.prod.outlook.com (2603:10b6:806:131::13)
 by DM6PR12MB4481.namprd12.prod.outlook.com (2603:10b6:5:2af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 23:25:45 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::24) by SA0PR11CA0128.outlook.office365.com
 (2603:10b6:806:131::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 23:25:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:25:44 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:25:42 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <lirongqing@baidu.com>,
	<paulmck@kernel.org>, <bhelgaas@google.com>, <seanjc@google.com>,
	<alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
Subject: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch hooks
Date: Thu, 30 Apr 2026 18:24:49 -0500
Message-ID: <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777591496.git.babu.moger@amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|DM6PR12MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ae6fa0-030c-40d4-229c-08dea70fcd74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PFu2rvEhLxXiP3PKfstbJg5asahrdQxeDrczrGsEBjARy+TKTHtTfbevVkKHbA4WuslaSxNIweCxKRZrw/LwEy8uiSmXGDmQktK5fdoLthPpVfTJns4JJOU2MzO9Aen12Tdq8DP7KI6mNmROyxQ6B5bq9m0h49zwRd5LIVuplQUaqjRAtmjfH9tWwqJLIeN1ArMURBFWTCWjO9dOIEOnNMUEKSOLJpwq9/WK47ouKi7ira807gA1smV3PVBnwm3usBsh+RNwmEFMQ+CDSmlYKWM9oFhhxBNatdUZTbo6/3flkRGegKPNjSYlXn58YIVAatSO/IkxoMEaz1sYO5Ctm9Dda2HUZhDRHagHnArRvm7ocB81yKtx10o5UekbX5FwM5WrFFvepBg5zBVw6mjepvhSSkL6NITuCo5dOuBSkbxcub0bTqHF4IxFOCRm86tiGAksosnuS6OpyrdklgE51jU4P+x1lB6spMSablhMgSBd8JXEbHBBF0XdCKMMdajifn24ziACgRtFZ2TQ6JsmufSnVDS9MIDU8PU5kAa9ESLUIwqJZ7vpVv4/PNg6XqzpZhH3Nk6cl6FSGBEi2jzr64B2jPmcSj8lU6XTo2cGRZpwItG6vNaSp1Bn5y985znWD2/5y/WSd+DvAm2DZlrA8JJFTq/x5e4lypY9f3kzDs3ZzDW6rIYFFUWQ/nkHZxnVoVl/FPuVZ9u9EJMV17RuMoW0Zu/BOLgD4A8ur+FsD5U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D+Mr6XZo3R0HgEHIcksRS72Ju1ADcJ35LjttcjN0u1tw3P9WBcPosgC341gAAhDuqaW80TAco15mBvVPWrmxiXQPfxQDSJ2glT20C8SUGHR3yFmCbuPv1PcIaDPrhzWz4kYFkE7a4bNSFQ8GvxTEuuLF8OgF1ZcArCjLUT5CVmpskw+IpzgE9aMRcDpah1/DAFK2+T8nV57KterJKXh5xiX/bB/yPuKd0nBgoso829Ho0t/psPs1k4LE4KjcWq52mmyK/pSfLL6RU4LK47MR3ySk95bSLCFBvCBC+LBfgiQnEBnGxJmtK/zaOUUxPgnV4bwV/E6EnvC+grb0y72LiLbpsaaJoO9APFl+jfvCWMCGPY/5ZhvpieG81OGFW8MjcaWeuUqhhVKebwl8tJIpSjRyh0ZY/TLmndKFtzwYVpMi37akawFTWz4fv6yC3kuw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:25:44.5854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ae6fa0-030c-40d4-229c-08dea70fcd74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4481

AMD Privilege Level Zero Association (PLZA) exposes kernel CLOSID/RMID
association through MSR_IA32_PQR_PLZA_ASSOC.  Generic resctrl already
tracks supported and effective kernel-mode policy in struct
resctrl_kmode_cfg, but the architecture layer needs a callable entry point
that can push those values into per-CPU hardware on a chosen CPU mask.

Declare resctrl_arch_configure_kmode() in linux/resctrl.h with kernel-doc.
Implement it on x86: add an SMP callback that writes
MSR_IA32_PQR_PLZA_ASSOC on each targeted CPU, and use on_each_cpu_mask()
for the broadcast.

The hook is unused in this patch; later patches in the series wire it into
generic resctrl when an effective kernel-mode policy is selected or a CPU
mask changes.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: Removed task based PLZA implementation so related changes are removed.
    Removed handling of rmid_en as it is not required. The group type assigned
    will be different so the monitoring part is already taken care.
    Updated the change log with details.
    Removed resctrl_arch_set_kmode() as arch only provides the modes supported.
    It is FS which decided which mode to apply.

v2: Updated the commit message to include the sequence of steps to enable PLZA.
    Added mode code comments for clarity.
    Added kmode to functin names to be generic.
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 35 +++++++++++++++++++++++
 include/linux/resctrl.h                   | 10 +++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index b20e705606b8..68f1cf503904 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -131,3 +131,38 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
 
 	return 0;
 }
+
+/*
+ * SMP call-function callback: each CPU writes its own MSR_IA32_PQR_PLZA_ASSOC
+ * (AMD PLZA).  Invoked via on_each_cpu_mask() with wait=1 so the on-stack
+ * union pointed at by @arg is safe.
+ */
+static void resctrl_kmode_set_one_amd(void *arg)
+{
+	union msr_pqr_plza_assoc *plza = arg;
+
+	wrmsrl(MSR_IA32_PQR_PLZA_ASSOC, plza->full);
+}
+
+/**
+ * resctrl_arch_configure_kmode() - x86/AMD: program PLZA MSR on a CPU subset
+ * @cpu_mask:	CPUs to receive the update (see on_each_cpu_mask() for online subset).
+ * @closid:	CLOSID field written into the MSR with CLOSID_EN set.
+ * @rmid:	RMID field written into the MSR with RMID_EN set.
+ * @enable:	Value for the PLZA_EN split field.
+ *
+ * Context: Do not call with IRQs off or from IRQ context except as allowed for
+ * on_each_cpu_mask(); see kernel/smp.c.
+ */
+void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)
+{
+	union msr_pqr_plza_assoc plza = { 0 };
+
+	plza.split.rmid = rmid;
+	plza.split.rmid_en = 1;
+	plza.split.closid = closid;
+	plza.split.closid_en = 1;
+	plza.split.plza_en = enable;
+
+	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
+}
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index ce28418df00f..570918e57e24 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -712,6 +712,16 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
  */
 void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg);
 
+/**
+ * resctrl_arch_configure_kmode() - Program MSR_IA32_PQR_PLZA_ASSOC on CPUs in @cpu_mask
+ * @cpu_mask:	Target CPUs; on_each_cpu_mask() applies the callback on the online subset.
+ * @closid:	CLOSID written to the MSR with CLOSID_EN set.
+ * @rmid:	RMID written to the MSR with RMID_EN set.
+ * @enable:	PLZA_EN field value for this update.
+ */
+void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid,
+				  bool enable);
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

