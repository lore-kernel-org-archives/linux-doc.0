Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011057.outbound.protection.outlook.com [52.101.57.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C68B480962;
	Tue,  7 Jul 2026 21:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461184; cv=fail; b=TENBIePdYAvvcy1xFSSD218qJ3A4/zP8VkM10C99owM/BoKhiTMh2EEF+RMxfiwi9BH188pm8OxHPMmDu01abGFEzhBQOzrk62QZsn9Mu6H6b05Ta/g4xPVFgylbByrlaGIQwLgqvWB/BjhuuxrxVs4HpM5sOpKBZ+xu4jzPas8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461184; c=relaxed/simple;
	bh=wbEXnnudyZhKhmoxsFAsR+7hNvj6GyIhV3aYEpDe5KI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jplqzS79cEr6pV2LjAE/SKB2hoOoQbXsMp2odGKRkzqGCj3lKYOqJmJWUDjF0LlrVY8fcjxbiZys4njYf/+ODEwxNyX4fzff0h8ICkNlEuv9LAsjETd3oYqiSjBW5NOayZiNqnKUUv0ENZGZWHT/ih8FY0gQQlOTp0nJ6yWu4bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XXqpUog5; arc=fail smtp.client-ip=52.101.57.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XXqpUog5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3SRjO+8Hcw72DH3wYfV+Fhauk92pElx4selXrisDHpGoh8axyfLDMfHFAmWBnFpZHw0j0noHxNptBB2aRN/T0/Ip+NAt0Nx/l2Plftd3lu8QUKPYieKEB7lMCu8hffMIaVB7Idc/zNG92AFF1HS0rFYzx5vA6WsjOoTj0/KdZmdS3pn075osTVzwZ3rv3Jt/O4a0IFdQajE7K/294MhyR4zYSm/XuD1lHAU0aZ0xFyZLpgPEoekFlNj5YR1dfyyZ4E1LPyFskIjeGkYvB6WoqIW4+BfOYneki2rs3N+LWeGFHmDyWccfPX5uOstuSnoIdBjEUulXun6Lit/Jzjnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wh2F5vaeGW0yiNEx9zlRZXIdwbvz8mbhoIvX9xvRI4Q=;
 b=R3dQ0aLvFagYGu7GUlkFTA2wvGfUCkj8qoco3iE6ci4Ng5QJSnBMJv5NfLqGeLFjbHdRikTC3MA2M71X9Q6k+CgeAiGzLal7V9KbXKQmrefoUfc49mVkQ7UnDBNgh8vW8RLerCEf1t/I354OXRjkcH5yWg2PhOd6voLuKxa8iiQ8iqesZZ7Llb98gGJuw0OVfyMPXzM/53XS0u8JhtTv8iZz5B+8RUtrRfw0hsNbSy1zCe1ybBrq5E2pGYedknsNO+ilYD3672JxFBbh8tDNqTmOOVudNVSsAEB6etV0Ny3kSa7rYi7Eps8+XfmjyRYh5A8UcXzO0w5yLuc77PhLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wh2F5vaeGW0yiNEx9zlRZXIdwbvz8mbhoIvX9xvRI4Q=;
 b=XXqpUog5FyTntGBjnf8HxNOBAzDJlqgUzSW0hQ1hAkya+gb3aZPqxOafmfOfRLAY6L5DKw4ZJLyF5zDwuYf9YviUkQiGLqa8swLaxHIC071cPjZETt6hj/3NzTKljZnX88Wz3ieMuJNiCgVLBoUrFc0cbELzplIxjGasZg7MSXc=
Received: from BN1PR12CA0006.namprd12.prod.outlook.com (2603:10b6:408:e1::11)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:52:56 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:408:e1:cafe::9c) by BN1PR12CA0006.outlook.office365.com
 (2603:10b6:408:e1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:52:55 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:52:54 -0500
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
Subject: [RESEND PATCH v4 14/15] fs/resctrl: Allow user space to write kmode_cpus/kmode_cpus_list
Date: Tue, 7 Jul 2026 16:50:15 -0500
Message-ID: <e2deefce19f3cf087ea96a7aba3f6850812e3036.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e508950-4765-4620-f2ee-08dedc721a5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|22082099003|18002099003|3023799007|6133799003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	8t/GTtMa90oGRLl5t8ewPUhsCC2xxtYelu6bdzAEqLUGkBr+g7XmLfWG1b4rWJ/uB6pT8lRjlem7ZakcJ4QNe+2NxXOJPwj4C0EmBOlxL455goBr8b9PfRXz8IjurdPeRmyPW5/xnJ45zFnLdLUPBcR6olaB5AtOXvNG0VnkpDyH1K7i6zKyj7o4KoJ3iPj4qeROVk+2GwenJ8EajFsAsx1vPVS/lthrOTDsULffRgOCSL36OZ4kAoQWc1rMCtesyxzdDqo6rG35OvU+bBR0psuElDaIoM7B9VITwZSu0AzUuqAf0Pjb2sZXup5C1aw0urA2oFbuwNW4NEdvHHpdkxX61rxnzOOXK8ati5DyFDFRVOYksNigyTST8Y9+tZC3ZhC49UNMxTdRo9Gkayd6/1BfzUos85Ob8u06qo6KOGIU5dNN92Rks3q0UOYQnC90AqK+Kpor3CSIzweYN5djq0esoVo32mk7EWG2ekmopV6cHOhJlHEjAFxpMD898rsIxHMSQSrxrsu/Gxgb8I1vRnG0lqqsDarR4xfAJKizO23pGnPbDKIq55EzhwSiQG9UpWixyeUaK7zphZvgC1i6+I5UxiEm0cNEWv/pUV/aa9qjdhXJjh03QSpaJNaQK6NHrbIPHnCKLJmy3+mLOg8BDEUhK4I/Xd2NCmo7ayIfrJRY/Aw9EE79fFuamKy7fLsdCRDRHJA5lZ8ZFAGPvbEcbA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(3023799007)(6133799003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6Ps/gZqnUTR9QKlYZ9mg72WHCJW5mDF6u3DBvH2Qp7uDAislkkBAkPswbfYeBElNFN/YlQ8RTJIjp16GyR5NTs/2xVFJHLUTMBRlFMyAb0WQUcOFJ8ClDKySiZ9NwfGfeW2EEzav+0EufsCkrGGQFp8ZRHHZ3+nDW3C6yv1mVcx1dhY3w6WSB4ZUw/X5zTGV2Uz3HPK/6jFO+tjduK/l82J4LprghF29vMfiHkyKfvBr+2Smg8tDV4gIdyxSUrm78180eY4mYFmBDY0hbTNYRgPUJEAthpXCpsXcUfbbAhSi5snH6IIIRbFOn+JBSe8y298ZwLbHUEx6h1WCiaWhRn6Cwt7FRh/zHyc3VP6zfQmXEKi6xGa0jxgLgrEHU9QmzwsO7niJrqIS3KT2M2JYkAcgeF36POnNUIbliIbbyRSupb2ZRnfHQQVxtZITx0yE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:52:55.9569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e508950-4765-4620-f2ee-08dedc721a5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701

kmode_cpus and kmode_cpus_list expose the CPU scope for the rdtgroup bound
to the active kernel-mode policy. They are currently read-only, so changing
the scope requires rebinding through info/kernel_mode, which reprograms the
whole binding instead of only the CPUs whose state changes.

Make kmode_cpus and kmode_cpus_list writable. Parse writes as a bitmap or
CPU range list. Reject pseudo-locked and pseudo-lock-setup groups, writes
to a group other than resctrl_kcfg.k_rdtgrp (including stale file
descriptors left open across an info/kernel_mode change), malformed input,
and masks that name offline CPUs.

Update the bound group's kmode_cpu_mask and reprogram hardware
incrementally: disable kernel-mode association on CPUs in the old mask but
not the new mask, and enable it on CPUs in the new mask but not the old
mask.

Document the interface in Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Empty masks are now allowed and updated masks are in rdtgroup->kmode_cpu_mask.
    Updated the changelog.

v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 Documentation/filesystems/resctrl.rst |  30 +++++
 fs/resctrl/rdtgroup.c                 | 151 +++++++++++++++++++++++++-
 2 files changed, 179 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 5a13814d1325..4a2bdd74d4aa 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -676,6 +676,36 @@ All groups contain the following files:
 "cpus_list":
 	Just like "cpus", only using ranges of CPUs instead of bitmasks.
 
+"kmode_cpus":
+	Visible only on the rdtgroup currently bound to the active kernel
+	mode (see "info/kernel_mode"); hidden on every other rdtgroup,
+	including when "inherit_ctrl_and_mon" is active.
+
+	Bitmask of the logical CPUs scoped for this group's kernel-mode
+	binding.  At bind time through info/kernel_mode, every currently
+	online CPU is included in the scope.  CPUs that come online later
+	are automatically added to the scope and programmed with the binding.
+
+	Writing a mask reprograms the binding incrementally: it enables on
+	the CPUs newly added by the write and disables on the CPUs dropped
+	from the previous mask.  An empty mask disables the binding on all
+	CPUs in the current scope.  The mask must contain only online CPUs;
+	masks naming offline CPUs are rejected.
+	Errors are reported in "info/last_cmd_status".  Example::
+
+	  # mkdir ctrl1
+	  # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
+	        > info/kernel_mode
+	  # echo 0-3 > ctrl1/kmode_cpus_list
+	  # cat ctrl1/kmode_cpus
+	  f
+	  # cat ctrl1/kmode_cpus_list
+	  0-3
+
+"kmode_cpus_list":
+	Just like "kmode_cpus", only using ranges of CPUs instead of bitmasks.
+	Writable with the same semantics and restrictions as "kmode_cpus".
+
 
 When control is enabled all CTRL_MON groups will also contain:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 7b06c3b3f00e..8ecd107368b3 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -423,6 +423,151 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of,
 	return ret;
 }
 
+/**
+ * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
+ * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
+ * @kmode:	Kernel-mode policy currently active on @rdtgrp.
+ * @newmask:	Set of online CPUs scoped for @rdtgrp's kernel-mode binding.
+ * @tmpmask:	Caller-allocated scratch cpumask used to compute the
+ *		incremental enable/disable deltas; contents on entry are
+ *		ignored and on return are unspecified.
+ *
+ * Compute the difference between @rdtgrp->kmode_cpu_mask and @newmask
+ * and call resctrl_arch_configure_kmode() only on the CPUs whose enable
+ * state actually changes:
+ *
+ *   - disable on (old & ~new)
+ *   - enable on (new & ~old)
+ *
+ * Then copy @newmask into @rdtgrp->kmode_cpu_mask so subsequent
+ * show/write operations reflect the updated scope.
+ */
+static void kmode_cpus_write(struct rdtgroup *rdtgrp, enum resctrl_kernel_mode kmode,
+			     cpumask_var_t newmask, cpumask_var_t tmpmask)
+{
+	bool assign_mon = (kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU);
+	u32 closid, rmid;
+
+	closid = rdtgrp->closid;
+	rmid = rdtgrp->mon.rmid;
+
+	/* CPUs dropped from this group: old & ~newmask. */
+	cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
+	if (!cpumask_empty(tmpmask))
+		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, false);
+
+	/* CPUs newly added: newmask & ~old. */
+	cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
+	if (!cpumask_empty(tmpmask))
+		resctrl_arch_configure_kmode(tmpmask, closid, rmid, assign_mon, true);
+
+	cpumask_copy(&rdtgrp->kmode_cpu_mask, newmask);
+}
+
+/**
+ * rdtgroup_kmode_cpus_write() - Sysfs write handler for kmode_cpus[_list]
+ * @of:		kernfs open file (selects bitmap vs range-list parsing via
+ *		is_cpu_list()).
+ * @buf:	NUL-terminated input from userspace.
+ * @nbytes:	Length of @buf, returned on success.
+ * @off:	File offset (unused).
+ *
+ * Parses @buf into a cpumask and rejects:
+ *   - pseudo-locked / pseudo-lock-setup groups,
+ *   - writes when INHERIT_CTRL_AND_MON is active or to a group other than
+ *     resctrl_kcfg.k_rdtgrp (stale fds opened before an info/kernel_mode
+ *     change),
+ *   - malformed input,
+ *   - masks containing offline CPUs.
+ *
+ * Validated masks are passed to kmode_cpus_write() to update
+ * @rdtgrp->kmode_cpu_mask and reprogram hardware incrementally.
+ * Errors are reported in last_cmd_status.
+ *
+ * Return: @nbytes on success, -ENOENT if the group has been deleted,
+ * -EINVAL for pseudo-locked or pseudo-lock-setup groups, malformed input, or
+ * offline CPUs in the requested mask, -EBUSY if INHERIT_CTRL_AND_MON is active
+ * or the group is not resctrl_kcfg.k_rdtgrp, and -ENOMEM if the scratch
+ * cpumasks cannot be allocated.
+ */
+static ssize_t rdtgroup_kmode_cpus_write(struct kernfs_open_file *of,
+					 char *buf, size_t nbytes, loff_t off)
+{
+	cpumask_var_t tmpmask, newmask;
+	struct rdtgroup *rdtgrp;
+	int ret;
+
+	if (!buf)
+		return -EINVAL;
+
+	if (!zalloc_cpumask_var(&tmpmask, GFP_KERNEL))
+		return -ENOMEM;
+	if (!zalloc_cpumask_var(&newmask, GFP_KERNEL)) {
+		free_cpumask_var(tmpmask);
+		return -ENOMEM;
+	}
+
+	rdtgrp = rdtgroup_kn_lock_live(of->kn);
+	if (!rdtgrp) {
+		ret = -ENOENT;
+		goto unlock;
+	}
+
+	rdt_last_cmd_clear();
+
+	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED ||
+	    rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
+		ret = -EINVAL;
+		rdt_last_cmd_puts("Pseudo-locked group cannot host kernel-mode binding\n");
+		goto unlock;
+	}
+
+	if (resctrl_kcfg.kmode_cur == INHERIT_CTRL_AND_MON) {
+		ret = -EBUSY;
+		rdt_last_cmd_puts("No active kernel-mode binding\n");
+		goto unlock;
+	}
+
+	/*
+	 * The visibility layer (kernfs_show()) prevents fresh open() on a
+	 * non-bound group, but file descriptors opened while the group was
+	 * bound stay valid across an info/kernel_mode change.  Reject those
+	 * stale-fd writes so they cannot corrupt the now-active binding.
+	 */
+	if (resctrl_kcfg.k_rdtgrp != rdtgrp) {
+		ret = -EBUSY;
+		rdt_last_cmd_puts("Group is not the active kernel-mode binding\n");
+		goto unlock;
+	}
+
+	if (is_cpu_list(of))
+		ret = cpulist_parse(buf, newmask);
+	else
+		ret = cpumask_parse(buf, newmask);
+
+	if (ret) {
+		rdt_last_cmd_puts("Bad CPU list/mask\n");
+		goto unlock;
+	}
+
+	/* kernel-mode binding is only programmed on online CPUs. */
+	cpumask_andnot(tmpmask, newmask, cpu_online_mask);
+	if (!cpumask_empty(tmpmask)) {
+		ret = -EINVAL;
+		rdt_last_cmd_puts("Can only assign online CPUs\n");
+		goto unlock;
+	}
+
+	kmode_cpus_write(rdtgrp, resctrl_kcfg.kmode_cur, newmask, tmpmask);
+
+unlock:
+	rdtgroup_kn_unlock(of->kn);
+	free_cpumask_var(tmpmask);
+	free_cpumask_var(newmask);
+
+	return ret ?: nbytes;
+}
+
 /*
  * Update the PGR_ASSOC MSR on all cpus in @cpu_mask,
  *
@@ -2531,15 +2676,17 @@ static struct rftype res_common_files[] = {
 	},
 	{
 		.name		= "kmode_cpus",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= rdtgroup_kmode_cpus_write,
 		.seq_show	= rdtgroup_kmode_cpus_show,
 		.fflags		= RFTYPE_BASE,
 	},
 	{
 		.name		= "kmode_cpus_list",
-		.mode		= 0444,
+		.mode		= 0644,
 		.kf_ops		= &rdtgroup_kf_single_ops,
+		.write		= rdtgroup_kmode_cpus_write,
 		.seq_show	= rdtgroup_kmode_cpus_show,
 		.flags		= RFTYPE_FLAGS_CPUS_LIST,
 		.fflags		= RFTYPE_BASE,
-- 
2.43.0

