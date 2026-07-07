Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013068.outbound.protection.outlook.com [40.93.201.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F21422550;
	Tue,  7 Jul 2026 21:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461177; cv=fail; b=fsxZSv2F75oXrrxj9WJpKVyBVWyeBiiMARZZwaEm5OwT/zobxEmXshc98Ggl/RH41h8mpbNoHFlT/EQkcWwTop6+HoJOkyi5kYtVMBtC3dxv87cFlhrro3DnEhJkWealTI0z4lLY58DS4+pNX4SAAilSylsNvWj92OoGsor9oOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461177; c=relaxed/simple;
	bh=hc++OzEFf1XFyDxKYNW24M9BnV2EtFhZrirtz0uqAdM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DbNXn5nQQU9gMBHZhHaK2MhAiKd/P6PMMR2mbMIt5QFpVCB7ZRAxwun5Qa7ZYY0xQQ5NsVWBq2JviFQ/HmMVz6J3fKjjPD+O78SD8HF+XgDigQSMR6OsUrnXUqCAIHH1S2G7UTm7EdK7Dl51LQm960j4wE7FT68deCyXF8a3wK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pDUofdvI; arc=fail smtp.client-ip=40.93.201.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pDUofdvI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZ0pF1SpCFbdkmVPzl8ILj7VxyKzUcmHa6/3Wmho0ffbJ3xUu69gSlASARQci/vIVqtAxdJU8/R6fz3wq3shWoMpSLPxB2YmZTyneQiYfTbFXdVMHPduW3ZpcMDhE1hpb96+tJACdJ66OWV41Pe+6lRkbyLywroUpvC+5JPNq4zZsvPbWkTtjiZjS+5AtKxh+exyJOFaxqoi6uk5+Tcy80kEmcQvgvgCQnnjAKmxdkiDt8A+//3+0efvIbmOmRwfcXMs/spfU63rmFHoxsAw9yNuCgTxEQLC/e15btep8mJYPZZ5DkZlc4qPrmA1kEUo+/xgG7szeMWj0UF4Xh+L6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RuYWgLUMVX+ofyhMLfIfP1Ka2nFFHs1qf6Pl28yPHnA=;
 b=rFE5UxrzH1CUqxj6+e31Ag9hYeDktkEPZgRzSMhCnU5IxYyZX6RRa1RYVxLCxR5NgeqCn7GlUx08QBRPes5UjgM7Mr4USXz7IM715UxM9ZhSh02sS2nifvY/f0J79wMavnyZ05FSuOsbPJ6I3N8Nazu15o/LGamghVgC5UVoGsFFV3PUC70rquE+BdSXFeuJskoLBW6L+YbuH2du/6pcHhc4j1+HW9Uq3oU2DpQG7rDMh2SS8CHoAxYjLMPcdI6ESHhjt8MkoEjY/VAqq3UollQNr+Ip6M5jeGM4KtpVKjeJw5riFdfNlBDihkv7C5qrxA0FwTACJff6bCbrbNPobA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RuYWgLUMVX+ofyhMLfIfP1Ka2nFFHs1qf6Pl28yPHnA=;
 b=pDUofdvIk8jg559n2YTUliCMWZ6vkkIHzqAA8OOZAKCCzlqBGcHRXQJuP/5TdIp17ZGjHgZhD0WkCdvlmX7Hv/qWdQs1geJg1j04Nleyd9JaOkagXvN7vpsgFWAf3lVid/HdIIdjA7ZibkvrvlwFHHdAwOYLJT3W+QPKMZERU5I=
Received: from BN1PR12CA0004.namprd12.prod.outlook.com (2603:10b6:408:e1::9)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Tue, 7 Jul 2026
 21:52:43 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::1) by BN1PR12CA0004.outlook.office365.com
 (2603:10b6:408:e1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:52:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:52:42 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:52:40 -0500
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
Subject: [RESEND PATCH v4 13/15] fs/resctrl: Add interface to modify kernel-mode via info/kernel_mode
Date: Tue, 7 Jul 2026 16:50:14 -0500
Message-ID: <9916861e5fe73cc8d7ea02ce366b512bc5424843.1783461016.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783461016.git.babu.moger@amd.com>
References: <cover.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbedbd3-d6a5-41fb-724b-08dedc721277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|7416014|23010399003|82310400026|22082099003|18002099003|3023799007|6133799003|11063799006|56012099006|8126099003;
X-Microsoft-Antispam-Message-Info:
	nlBzbNADvKDmPe8tc0l7pviM/sbSqL/y4A1IdbiODwcsA4uIOENlzP/jwa/pzULnvsBYmN8FdWvoCvzQNKx6t2JXvYUJoX7PqwN+E9W5CM4W+4sh56VwWwfjIi7Xmai46Gq7igg+AgwJbERqaTa9X9MLa2XzXErahG+jnfmz7ALJkGhHkoKAq80KwvfnWvpeb6Iowj9S/H6PYtVTY4rdktxYP7t+GkDVIGsb+frvQw6KG1pJm3f/0k0a4b9udlTkxhnJMJy2ykKIakt+hhM8gVobjta7t8YSam+J+BzNBK0wWmuZyt6vrF0zI9sJAWDTNxNU7oGp8E7jmYXHMWGoARZRSwssg45+mH6My4oaN2yOT1DQp8HKGsl49tySbGJD3rXDOJT+jwC4M5V1W4zBFY6w91yLq8dt+6czNauWgMEOrJCQEQErK20VO0Df5ZFcxRvj0ybENp1u/uoLgdzsNJHN9qCZatJOex2rMXv/d3RXQjS2ygtfAXpv4chw5rIag/kzzOlcVR52UiDdhai6EO81gFbtVPe4b08PXSEE+ZpAL/2aDXIQ7wzs+78AWs3yUFNPm6hYeheu1Zs87im4sZp2CpDZhKuBBDDtFO6qJRlFxNitWRq6iG5t83AdkMrPpzwtwXy+OZq3BLTnf8owsXcaJDQ3Vl2YfRiJP1i7dPkkXmBpRYMx4prEiRvtkkXsjW6uFTc45guTjAtvXCxKpw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(7416014)(23010399003)(82310400026)(22082099003)(18002099003)(3023799007)(6133799003)(11063799006)(56012099006)(8126099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nHgTq0lJBfHOhMtt3y/mg6lifilV6cA6Py/S9nvOKBGESZQg2cun1LqPzzGtPSBxZQrTMn2UWFDcKMjcpiosgopVlFk4H9e4ZSPoeB34OVlnSnuJRul0hRi7LjpOckcCsOdJj1nfNzFrrEUXBardIAOmBRTRdREdB3Li46AlMcsmcvRu1L32JGZagSVvUK/d9dXfs1pJDNKnvsfcvggUBkJF1y+Gj1FeNbPBjpippLO9oXAw0HUSvSLRA9enJnHV9MVnmYXUmCa1kS8iQ3CdPUk1Xyxl8Vbct3kKPSfS/fQ6KqnneHgEnBuhdXQA6TXXWQUSE+Bh4JyJGtjMJ/E5mxK7EkjwJDLhyC2kL2lSY6uaUAmGDsewuBy99jW9qLrPbqgxRwGg4DIzcxmbloGOrV4prTqt80FnkPb6ivjDEmCfpSfv5dInyFWy4oD0XjZq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:52:42.6956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbedbd3-d6a5-41fb-724b-08dedc721277
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108

info/kernel_mode reports which kernel-mode policies the platform supports
and which one is active, but it is read-only and does not show the rdtgroup
bound to the active kernel-mode policy.

User space needs both pieces to manage kernel-mode assignment: it must be
able to select a policy and bind the global-assign modes to a specific
resctrl group, and it must be able to read back which group is currently
bound.

Make info/kernel_mode writable and extend the read format to identify the
bound group for active global-assign modes.  Inactive global-assign modes
are reported as "group=uninitialized"; INHERIT has no group suffix because
it does not bind an rdtgroup.  Square brackets mark the active mode on read
only and must not be included when writing.

Document the interface in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Rewrote the changelog.
    Moved all the fail path earlier so that failures will retain the old
    binding.
    Taken care of requirement
    assign_mon can be  RDTMON_GROUP or RDTCTRL_GROUP.
    inherit_mon can only be RDTCTRL_GROUP.

v3: New patch to handle the changed interface file info/kernel_mode.
---
 Documentation/filesystems/resctrl.rst |  80 +++++++++
 fs/resctrl/rdtgroup.c                 | 238 +++++++++++++++++++++++++-
 2 files changed, 315 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index f3e941404967..5a13814d1325 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -528,6 +528,86 @@ conveyed in the error returns from file operations. E.g.
 	# cat info/last_cmd_status
 	mask f7 has non-consecutive 1-bits
 
+"kernel_mode":
+	In the top level of the "info" directory, "kernel_mode" controls how
+	resource allocation and monitoring work in kernel mode. This is used on
+	some platforms to assign dedicated allocation and/or monitoring to
+	kernel-mode work.
+
+	Reading the file lists supported kernel modes, one per line.  The
+	currently active mode is wrapped in square brackets for display only.
+
+	The modes are displayed in the following format:
+	"<mode>:group=<ctrl>/<mon>/"
+
+	The inherit_ctrl_and_mon mode is shown as "<mode>" with no ":group=" suffix.
+	Inactive global-assign modes report "group=uninitialized".
+
+	The bound group path uses empty components when they do not apply:
+
+	"//":
+		The default (root) control group.
+	"<ctrl>//":
+		The control group named <ctrl>.
+	"/<mon>/":
+		The monitor group named <mon> under the default control group.
+	"<ctrl>/<mon>/":
+		The monitor group named <mon> under the control group named <ctrl>.
+
+	Modes:
+
+	- "inherit_ctrl_and_mon": Kernel work inherits allocation and monitoring
+	  from the current user-space task (default).
+	- "global_assign_ctrl_inherit_mon_per_cpu": A single allocation is
+	  assigned for all kernel work; monitoring is still inherited from user
+	  space.  Requires a CTRL_MON group.
+	- "global_assign_ctrl_assign_mon_per_cpu": A single resource group
+	  supplies both allocation and monitoring for all kernel work.  May be
+	  a CTRL_MON or MON group.
+
+	Only modes supported by the platform are listed on read.
+	Example::
+
+	  # mount -t resctrl resctrl /sys/fs/resctrl
+	  # cd /sys/fs/resctrl
+	  # cat info/kernel_mode
+	  [inherit_ctrl_and_mon]
+	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
+	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
+
+	The modes and binding can be modified by writing to the interface. Writing
+	one line (terminated by a newline) selects the active mode and binds it to
+	a resctrl group.
+
+	Writes must follow the format:
+	"<mode>:group=<ctrl>/<mon>/"
+
+	The ":group=<spec>" suffix is optional; when omitted the default (root)
+	control group is used for global-assign modes. Selecting a new mode or group
+	tears down any active global-assign binding before programming the new one,
+	including when switching between global-assign modes on the same group.
+	The inherit_ctrl_and_mon mode ignores any supplied group and clears the
+	active kernel-mode binding.  The mode must match one of the supported names
+	exactly, and modes not advertised by the platform cannot be set. The
+	display-only "group=uninitialized" form is rejected. Errors are reported in
+	"info/last_cmd_status".
+	Example::
+
+	  # mkdir ctrl1
+	  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//" \
+	         > info/kernel_mode
+
+	  # cat info/kernel_mode
+	  inherit_ctrl_and_mon
+	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
+	  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1//]
+
+	  # echo "inherit_ctrl_and_mon" > info/kernel_mode
+	  # cat info/kernel_mode
+	  [inherit_ctrl_and_mon]
+	  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
+	  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
+
 Resource alloc and monitor groups
 =================================
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index c537846d9264..7b06c3b3f00e 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1059,7 +1059,8 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
  * @v: unused
  *
  * Displays one line per mode set in resctrl_kcfg.kmode. Bracket the active
- * policy (resctrl_kcfg.kmode_cur).
+ * policy (resctrl_kcfg.kmode_cur). Square brackets are display-only; writes
+ * to info/kernel_mode must not include them.
  *
  * INHERIT_CTRL_AND_MON is displayed as "[inherit_ctrl_and_mon]" when active
  * or "inherit_ctrl_and_mon" when supported but inactive, with no :group=
@@ -1068,7 +1069,7 @@ static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
  * Global-assign modes append :group=. An inactive mode is emitted as
  * "<mode>:group=uninitialized". An active mode with a bound group is emitted
  * as "[<mode>:group=<ctrl>/<mon>/]", where <ctrl>/<mon>/ is derived from
- * resctrl_kcfg.k_rdtgrp.
+ * resctrl_kcfg.k_rdtgrp. The bracketed form is not accepted on write.
  *
  * Return: 0 on success, or -ENOENT on error.
  */
@@ -1164,6 +1165,8 @@ static void resctrl_kmode_files_set_visible(struct rdtgroup *rdtgrp, bool visibl
  * @kmode:	Kernel-mode policy currently active on @rdtgrp.
  *
  * Reset the kernel-mode binding on the CPUs in @rdtgrp's @kmode_cpu_mask.
+ * Called from resctrl_kernel_mode_write() whenever an active global-assign
+ * policy is replaced, including a mode change on the same group.
  */
 static void rdtgroup_config_kmode_reset(struct rdtgroup *rdtgrp,
 					enum resctrl_kernel_mode kmode)
@@ -1212,6 +1215,234 @@ static void rdtgroup_kmode_detach(struct rdtgroup *rdtgrp)
 	resctrl_kcfg.kmode_cur = INHERIT_CTRL_AND_MON;
 }
 
+/**
+ * rdtgroup_config_kmode() - Push @rdtgrp's kernel CLOSID/RMID to hardware
+ * @rdtgrp:	Resctrl group whose CLOSID/RMID should be programmed.
+ * @kmode:	Kernel-mode policy to program for @rdtgrp.
+ *
+ * @rdtgrp carries the CLOSID/RMID to program. For monitor groups, the CLOSID
+ * matches the parent control group while the RMID belongs to the monitor group.
+ *
+ * The caller (resctrl_kernel_mode_write()) is responsible for validating that
+ * the (kmode, group type) pair is permitted before invoking this helper.
+ * This helper records the current online CPUs in @rdtgrp->kmode_cpu_mask and
+ * programs those CPUs with @rdtgrp's CLOSID/RMID.
+ */
+static void rdtgroup_config_kmode(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode)
+{
+	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
+
+	/* A new binding starts with all currently online CPUs in scope. */
+	cpumask_copy(&rdtgrp->kmode_cpu_mask, cpu_online_mask);
+
+	resctrl_arch_configure_kmode(&rdtgrp->kmode_cpu_mask, rdtgrp->closid,
+				     rdtgrp->mon.rmid, assign_mon, true);
+
+	rdtgrp->kmode = true;
+	resctrl_kmode_files_set_visible(rdtgrp, true);
+}
+
+/**
+ * rdtgroup_by_kmode_path() - Resolve a "<ctrl>/<mon>/" path to an rdtgroup
+ * @ctrl_name:	Control-group name, or "" for the default control group.
+ * @mon_name:	Monitor-group name, or "" to select the control group itself.
+ *
+ * Matches the path syntax emitted by resctrl_kernel_mode_show():
+ *   "//"            - the default control group
+ *   "<ctrl>//"      - control group @ctrl_name
+ *   "/<mon>/"       - monitor group @mon_name under the default control group
+ *   "<ctrl>/<mon>/" - monitor group @mon_name under control group @ctrl_name
+ *
+ * An empty @ctrl_name selects &rdtgroup_default. Otherwise @ctrl_name must
+ * match an existing control group. If @mon_name is empty, the selected control
+ * group is returned; otherwise @mon_name is looked up in the selected control
+ * group's monitor children.
+ *
+ * Return: Pointer to the matching rdtgroup, or NULL if no such group exists.
+ */
+static struct rdtgroup *rdtgroup_by_kmode_path(const char *ctrl_name,
+					       const char *mon_name)
+{
+	struct rdtgroup *rdtg, *parent = &rdtgroup_default;
+
+	if (*ctrl_name) {
+		parent = NULL;
+		list_for_each_entry(rdtg, &rdt_all_groups, rdtgroup_list) {
+			if (rdtg->type != RDTCTRL_GROUP)
+				continue;
+			if (!strcmp(rdt_kn_name(rdtg->kn), ctrl_name)) {
+				parent = rdtg;
+				break;
+			}
+		}
+	}
+	if (!parent)
+		return NULL;
+
+	if (!*mon_name)
+		return parent;
+
+	list_for_each_entry(rdtg, &parent->mon.crdtgrp_list, mon.crdtgrp_list)
+		if (!strcmp(rdt_kn_name(rdtg->kn), mon_name))
+			return rdtg;
+	return NULL;
+}
+
+/**
+ * resctrl_kernel_mode_write() - Select kernel mode and bind group via info/kernel_mode
+ * @of:		kernfs file handle.
+ * @buf:	One line of the form "<mode>[:group=<ctrl>/<mon>/]"; must end
+ *		with a newline. Do not include the square brackets used to mark
+ *		the active mode in resctrl_kernel_mode_show(). Leading and trailing
+ *		whitespace is ignored, as is whitespace between the mode name and
+ *		an optional ":group=" suffix. The ":group=<spec>" suffix is
+ *		optional; when omitted the default control group
+ *		(&rdtgroup_default) is used.
+ * @nbytes:	Length of @buf.
+ * @off:	File offset (unused).
+ *
+ * Parses @buf, validates that <mode> is listed in resctrl_mode_str[] and is
+ * supported by the platform (resctrl_kcfg.kmode), resolves <ctrl>/<mon>/ to
+ * an existing rdtgroup (or picks &rdtgroup_default if no group was specified),
+ * treats INHERIT as an unbound mode, tears down any active global-assign
+ * binding via rdtgroup_config_kmode_reset(), programs hardware via
+ * rdtgroup_config_kmode() when the new mode is not INHERIT_CTRL_AND_MON, and
+ * on success updates resctrl_kcfg.k_rdtgrp and resctrl_kcfg.kmode_cur. The
+ * display-only "group=uninitialized" form is rejected.  Errors are reported
+ * in last_cmd_status.
+ *
+ * Return: @nbytes on success, negative errno with last_cmd_status set on error.
+ */
+static ssize_t resctrl_kernel_mode_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	enum resctrl_kernel_mode mode;
+	char *mode_str, *group_str, *slash;
+	const char *ctrl_name, *mon_name;
+	struct rdtgroup *rdtgrp;
+	int ret = 0;
+
+	if (nbytes == 0 || buf[nbytes - 1] != '\n')
+		return -EINVAL;
+	buf[nbytes - 1] = '\0';
+
+	/* Tolerate surrounding whitespace before mode parsing. */
+	buf = strim(buf);
+
+	/*
+	 * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
+	 * and when omitted the default control group (&rdtgroup_default) is used.
+	 * Trim mode_str after the split so whitespace before ":group=" is ignored.
+	 * Square brackets from resctrl_kernel_mode_show() are not accepted.
+	 */
+	group_str = strstr(buf, ":group=");
+	if (group_str) {
+		*group_str = '\0';
+		group_str += strlen(":group=");
+	}
+	mode_str = strim(buf);
+
+	mutex_lock(&rdtgroup_mutex);
+	rdt_last_cmd_clear();
+
+	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++)
+		if (!strcmp(mode_str, resctrl_mode_str[mode]))
+			break;
+
+	if (mode == RESCTRL_NUM_KERNEL_MODES) {
+		rdt_last_cmd_puts("Unknown kernel mode\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (!(test_bit(mode, &resctrl_kcfg.kmode))) {
+		rdt_last_cmd_puts("Kernel mode not available\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/*
+	 * INHERIT mode binds no rdtgroup. Ignore any user-supplied :group=
+	 * suffix and let show print the mode without a group.
+	 */
+	if (mode == INHERIT_CTRL_AND_MON) {
+		rdtgrp = NULL;
+		goto update_mode;
+	}
+
+	if (!group_str) {
+		/* No ":group=" suffix: fall back to the default control group. */
+		rdtgrp = &rdtgroup_default;
+	} else if (!strcmp(group_str, "uninitialized")) {
+		/* Display-only placeholder emitted by show; not selectable. */
+		rdt_last_cmd_puts("Cannot bind to 'uninitialized' group\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	} else {
+		/* Require exactly "<ctrl>/<mon>/" format */
+		slash = strchr(group_str, '/');
+		if (!slash) {
+			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		*slash = '\0';
+		ctrl_name = group_str;
+		mon_name = slash + 1;
+		slash = strchr(mon_name, '/');
+		if (!slash || slash[1] != '\0') {
+			rdt_last_cmd_puts("Group must be <ctrl>/<mon>/\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+		*slash = '\0';
+
+		rdtgrp = rdtgroup_by_kmode_path(ctrl_name, mon_name);
+		if (!rdtgrp) {
+			rdt_last_cmd_puts("Group not found\n");
+			ret = -EINVAL;
+			goto out_unlock;
+		}
+	}
+
+	if (mode == GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU &&
+	    rdtgrp->type != RDTCTRL_GROUP) {
+		rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
+	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
+		rdt_last_cmd_puts("Pseudo-locking in progress\n");
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+update_mode:
+	/* No-op if the same mode is already active on the same group. */
+	if (resctrl_kcfg.kmode_cur == mode && resctrl_kcfg.k_rdtgrp == rdtgrp)
+		goto out_unlock;
+
+	/*
+	 * Tear down any active global-assign binding before applying the new
+	 * policy, including when only the mode changes on the same group.
+	 */
+	if (resctrl_kcfg.kmode_cur != INHERIT_CTRL_AND_MON)
+		rdtgroup_config_kmode_reset(resctrl_kcfg.k_rdtgrp,
+					    resctrl_kcfg.kmode_cur);
+
+	if (mode != INHERIT_CTRL_AND_MON)
+		rdtgroup_config_kmode(rdtgrp, mode);
+
+	resctrl_kcfg.k_rdtgrp = rdtgrp;
+	resctrl_kcfg.kmode_cur = mode;
+
+out_unlock:
+	mutex_unlock(&rdtgroup_mutex);
+	return ret ?: nbytes;
+}
+
 void *rdt_kn_parent_priv(struct kernfs_node *kn)
 {
 	/*
@@ -2117,9 +2348,10 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "kernel_mode",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
 		.seq_show	= resctrl_kernel_mode_show,
+		.write		= resctrl_kernel_mode_write,
 		.fflags		= RFTYPE_TOP_INFO,
 	},
 	{
-- 
2.43.0

