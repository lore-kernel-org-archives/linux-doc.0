Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8A23314B9;
	Tue,  7 Jul 2026 21:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459072; cv=fail; b=DNpbMAz4opRoPczqcEHFMw4tjWpg+4bRsWmIN2aHyHHqa2y+I1DEoNTvAa9Qc+/R7eqZ+ylgdrK6oOnnpWu6NH8hm8I4ri8MNtjdZhY7P6J+SUKO8uMWpAkMrLw8jnd53nuVhPKy+her1QmNu9D6nTXLZuU8VhM/Yux9nXZ3j3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459072; c=relaxed/simple;
	bh=AQyTb5a2XiUJ3p7axALYy1iFbcvPTF/9FY3csCDz5Uo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wm/I5CAACf5vRh+6X/5gTP2s68XFih9/5uCeFOd1eXR3OU5hxSpkYrPJbMelv966E0enMTHd5p02TCE7Hh9ueonB2QD1cmsx556+8DkrVvfS6hO0UFFvU0UmkT0qXoXv9kzB/ltH7K/8tbXrA/5XYY8SLnAe7pMrfK9E3qXpBrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BC+NJV1A; arc=fail smtp.client-ip=52.101.201.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BC+NJV1A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0WJZgBz4ZQtjyYj/RL/JJ+NsETQ204CzZxAMdx7eVAieMwLl/zhqF0rKg0MWvM0jnJ7FSq88CrifH+p0Js8U89+CWZyWyaWJzmIm1XJhAJrO+csah+XWl5wh7kllraXerJG3+h80X1zF4oIPOh7BEfbAUg/UKxnGu4iB8rBR1oYynDx/i0xhP7Wrjx7I+UmjthaBzpnQhjcW7f3hr3oZDmJGBg15zDoHfqJSBBpxYxN8ewidsxLV7e0upVcZJmaHzxilCJKzS06Qh3GtzXBpBGUaFQEdS0rOQJMzLBPgslxE5H9Kfwkd72TzYrY2SozuAgrmZjl2qD16CDj+NEuqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6Ql8tbi4nmu04AHMyOCwGDeOFhGCQcurB/1FEKdz48=;
 b=I3Xcyu8l2IMmsuK+ZBwwk/oRG2oETWT9u5GkYc3DA2SJ+LfSiRZPEWZyXoDmKb/yn9q1FLJJCKrhu1wXaMOojlS52ZA64T7a/QlQDroQ9/NlW6upUIDumNPSidsJ+Se8QFg7y1h6HoY2GR6ZVU1DPa8eufkBl7ZGoeOXxpbams2t0AUG21elBn0kTbxc37+xWL3CXaGHMytVXyuWNwnZ66bHF7ny3L6C2I65BYVL2vQC1CKTgh5AhxtX3lChxy9CwqFvrn244Q3P0NV+mbcHT71do65K/8rgy35SJxwjmHEAbAJAoC2XT7APHLTwM9hJxjbAdV+avvfalwrfKBAXBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6Ql8tbi4nmu04AHMyOCwGDeOFhGCQcurB/1FEKdz48=;
 b=BC+NJV1AJ/qe4Q84bR2wv9mr095bIo55+d9yZSsXV0E6GVoJq0zhwQrHGUmFggdNNSHPDBUv4J6WvdGPGNM1GeLWmNL7Dvna1FMAkE9+x4ULGb9NJoSZbntoeA594jYwc6JIX+luA7zWtNetAyrxWETtIUWxFXsOYneEdNbL3h4=
Received: from PH8P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::10)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 21:17:43 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:510:2d8:cafe::91) by PH8P221CA0005.outlook.office365.com
 (2603:10b6:510:2d8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:17:43 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:17:41 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <babu.moger@amd.com>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
Subject: [PATCH v4 04/15] fs/resctrl: Introduce kernel mode (kmode) data structures
Date: Tue, 7 Jul 2026 16:16:52 -0500
Message-ID: <7191fbc2a339c830e7768d7fe5e7fa0f7d65da9f.1783459023.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783459023.git.babu.moger@amd.com>
References: <cover.1783459023.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: a1a3fcfe-5820-4a59-a07a-08dedc6d2f39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|36860700016|1800799024|82310400026|13003099007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hNbWvXu1uZ6+7jI9ka3O9qDeyT3xxQ38FDbdXz8XUhQYi9tcP9jPi948JPcxCNQ44OykN5iDA4usTIJahYgmb08zzyq1Zev3TWVWqFBuEBHxfZbuLLVhjX39p8wh1Al+/5wlvQ3g98/qmOiNXtpys+CkhcQ1Hx+KtZ3AVwyEjUnOWkc+Ce8fCy83piCQO/xwL5nFqPhO1paHjHkwWy+YgDX17QiAKXzSeqUY0oktjH4KebZNrLKRQB4hsPud8TURXK3dP4lY7QLdfmXtwstzn4deVuku1NY3ehTHL8xLtX4OqC67LSzFA49591hdyatB8aiG2oG9cRloM8I+iE5N5osbv0+9UcM1W81b5+zW5OmbGzvboRttz5VDsbw+/9dVXQuCya0Tcl37utkwamGWFx5jndQ7BWep8zestDf9C+UuQXqlljkY5JQfHrLLEL9JWU3GX+aK90Z9LdEilEcHmULT3WpbWW2z0uQxecJq5/199vCiFgLtl61akq+BFarZHTD9TeqFbxs3cTJze2t7pBbe/dZTw+/HcBIxKQHWpexFbtAYuAQ5cqN85JDCd5gjdHDj9DcRBJoAv+iO6IPInXWqUPoMqHKOcSrwUj92nbEoE4JzSZL8hxdOKpVSTvi/w1jZ6ZskhV8wVxdnDCkSMRKWAsp82DmDv+tjikopBLDRKTQIiPj8Ej/KJ2exG1jG8p7B9eHxZseGx9YLl2QCXg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R5vekxY3HjbDUCfH498ZtXeqwgcskndNb//z7cxHvbNh/yxNlapO1oZgCOWJRqhZUJ+vpnPcaEzj6wnkspf/6lLK8uRZhyQBJ76JcfMrWgGU2ItMSl0R2D6b3I8gVWJ2Dq1xwzFTP2cByswRPwmemSoFWBmj0pgIBO+9bKpvgTgHHNYcvaKAWg63H8VcsLSYpAZR0OVzCBIKtQhSzJNhse1xSFJXh0j4MOL7dzOk9H2WjO7/2yVZL4mNLOPsRJLKpNIjjkKZVSXYrkBKCfkUVO5qJtPBmFA1oWbKFDrSH/huj58CWhCnaXO4Z+GY1FdlaM6wX44M9Jj7OtAuhaWdboM/q6LwHIKhJ1wM5dmVDuUjqfiiDRKIMWkksfO4gIyLrygNAyN4UeInrH/Pw0krMY5B0isIB5sGwP7CGVA/d99YVsBX67lDAefjllpf2h3k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:17:43.4485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a3fcfe-5820-4a59-a07a-08dedc6d2f39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787

Kernel-mode traffic can use a different allocation and monitoring context
than the originating user task. On x86, Privilege Level Zero Association
(PLZA) enables the kernel to switch to a different CLOSID (and optionally
RMID) when entering kernel mode.

Architectures need a common way to name kernel-mode policies before resctrl
can report what is active or what the platform supports.

Introduce enum resctrl_kernel_mode:
  - INHERIT_CTRL_AND_MON: Kernel work inherits allocation and monitoring
    from the user task (current behavior).
  - GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU: Assign allocation for kernel
    work; inherit monitoring from the user task.
  - GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU: Assign a dedicated allocation
    and monitoring for kernel work.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Updated the changelog to be generic as possible.
    Moved the enum resctrl_kernel_mode to include/linux/resctrl.h.
    Updated the code comments to be generic.
    Removed resctrl_kmode_cfg from the code. This definition can be fs
    specific only and architectures dont need to know.
    Changed enum name to resctrl_kernel_mode from resctrl_kernel_modes.

v3: Removed resctrl_kmode definition.
    Changed the kernel mode definitions to enum resctrl_kernel_modes.
    Used BIT() to set/test the features.
    Added details to changelog.

v2: New patch to handle PLZA interfaces with /sys/fs/resctrl/info/ directory.
    https://lore.kernel.org/lkml/2ab556af-095b-422b-9396-f845c6fd0342@intel.com/
---
 include/linux/resctrl.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 73ff522448a0..c7abed51cd5f 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -703,6 +703,37 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable);
  */
 bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
 
+/**
+ * enum resctrl_kernel_mode - Kernel-mode control and monitor association
+ *			      policy.
+ *
+ * @INHERIT_CTRL_AND_MON:
+ *	Kernel work inherits the allocation and monitoring from the user space
+ *	task. On x86 this means that kernel work shares the same CLOSID and
+ *	RMID as the user space task. This matches today's resctrl behavior.
+ *
+ * @GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU:
+ *	Kernel work uses a globally assigned allocation while monitoring is
+ *	inherited from the user space task. On x86 this means a CLOSID is
+ *	assigned for kernel work and the RMID is inherited from the user space
+ *	task. Default scope is all online CPUs; a subset may be selected via
+ *	the resctrl group interface. A CTRL_MON group is bound to this mode.
+ *
+ * @GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU:
+ *	Kernel work uses globally assigned allocation and monitoring. On x86
+ *	this means both CLOSID and RMID are assigned for kernel work. Default
+ *	scope is all online CPUs; a subset may be selected via the resctrl
+ *	group interface. A CTRL_MON or MON group is bound to this mode.
+ */
+enum resctrl_kernel_mode {
+	INHERIT_CTRL_AND_MON,
+	GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU,
+	GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
+	RESCTRL_KMODE_LAST = GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU,
+};
+
+#define RESCTRL_NUM_KERNEL_MODES (RESCTRL_KMODE_LAST + 1)
+
 extern unsigned int resctrl_rmid_realloc_threshold;
 extern unsigned int resctrl_rmid_realloc_limit;
 
-- 
2.43.0

