Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E812EE262;
	Thu, 30 Apr 2026 23:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591629; cv=fail; b=bnKMWTYSq0nlmER4eINnNX+ybnH7NEhTrnh0l1CUB2vjrnCgjScrPLTPSaFNOxdZLgTdWuzEV96nh2+m46aig3X+UIV3rM3KfOAYcgsiPIT0RA57qnPU/lTwBchDSFl8JANaoBi32VQEr7MXzvwp3v3egj+N268EXJAW0uRcuOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591629; c=relaxed/simple;
	bh=3hTgSVjKuA2QnH7wGtIOcVJuyjdpBhoY2GXCGd3nasw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fHO/Yikuyo8KxCLZS3dnweHb+ch6zvG0vgAjFII5TbXKPE38/8vShFZ/CsUfKwsaFvXE88Cd0LBg+5+jVusdu1LxGqzR9E9wEpMj19VqznuuPf2T8TECAsSvSVWOUjmkE9lWn9zhBT/ezQeZUCA4xzLwyYjaIML/4aRK7WLKogE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RVVNG0rb; arc=fail smtp.client-ip=52.101.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RVVNG0rb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z8h3RQP0bV0R9kJm9tyJMV/Yr3UhfjfBU6ZFyvDhvSgsfeL+qHWa5GoOTdrlBDu3Al62h9gVYymgbibAJJReLsMGnGiVOOsRgGOyxL4ABNUSzXA//JH3xgbf1tAAK8hiIrYkkpNb9lJXVYs70BudiAdpwsVQOUjZKiSwJFwi9STh3O1pZOcXfrZbmiXW6JUzxqAsvMHhKpSwraPgnZDzvmczczFi6JNQRWDA5olv72CMg+2kh611OsvBWXrhJoRygWVuRf+HLKxT8CMN8K4ogPOOhOYApbbNbflM6czYq8ZsxebL2T/hir7+WE9CcfPWO99fHwqtSmDhlgfPIxHJvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtHL3PLU3D5ejW6z0xS4bLkTtne86GrscVmnUrpCe7g=;
 b=Z8xTwMlkA7MGNE1KPl7eJ2dNdQOOBWTADIRae5//bxvKEN/jSoT2OQkkLky9NmD6+z2qpZdykiJPO3aE4GsnU4rOyBbdeBObJ9Ts2BFbPigPsXJ0WRW+87zoao3RHTZmMgR2mCTaMS2ihhu8/U+PPTsgciskwxkn8vacvTAQVITaD7gyKKjWAwl1OgcwE4A/GcX/08BAaH9dDX2Wun+nymtiaTdQ6mSHt1PiWQ5dfnXd0WecfeGyRGmCQkSb76bfkKgMg/2GzCYozfJyI8UnZ9TujiQafc7n9Xn3v2c1d8mA1X3YvzO1X7+++aIlMlIXx+sdmoRZvcoBEeIMPIh4Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtHL3PLU3D5ejW6z0xS4bLkTtne86GrscVmnUrpCe7g=;
 b=RVVNG0rb7wLYjxaxzyHKsuNcao88fsBl5Fi78IdOTDzc5SUuDv45Lb39YT6gzuQDZG8XzTLETGi5iBA26GxAirtPa484jhooDfMMbqNY+JuXj5Dd8JEk97UZ1Onbwbed701FPuIhg1R3TRuffm9/4ASIbqkOVVExQo4hw6uNTEE=
Received: from PH8PR15CA0016.namprd15.prod.outlook.com (2603:10b6:510:2d2::26)
 by PH0PR12MB8175.namprd12.prod.outlook.com (2603:10b6:510:291::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 23:27:00 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:510:2d2:cafe::db) by PH8PR15CA0016.outlook.office365.com
 (2603:10b6:510:2d2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.21 via Frontend Transport; Thu,
 30 Apr 2026 23:27:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:26:59 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:26:57 -0500
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
Subject: [PATCH v3 12/12] fs/resctrl: Allow user space to write kmode_cpus / kmode_cpus_list
Date: Thu, 30 Apr 2026 18:24:57 -0500
Message-ID: <959cb9b930288c144ff4a2654de90e956a070dc9.1777591497.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|PH0PR12MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: c126eade-eb81-4b0b-ddf1-08dea70ffa27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	o3CTlTFoOmP/wqv8rw0rQmzK+kp00TWzjsb/qMsP8Yby203r4PQfB06yrWdw6CMLOurdVsWi19Y+8f164QKmuIGHh1muf3OUH0JpPAmqTYhPMLls8J9c1ijU0EbnzM/ZKO82QhXh2XPODtTEtHEaUshqElm2zJnWYqVxbmoFBgejooginieWsStQxrfb8clEr/iHIB31ws1r0Jc9DJBioxra5VHGX2zA3UAVPziR+mT/2Dp86RAl9XXIHKgX+4ZTZZ80FylvAYqsGX7sJAgsFVjMVYAPn6+y+jv0TOQCJtiDggh6RWCEUE38NA++vlDhGP9GUjz0W4h/3Ybi2FqsgU3SZcHtmnHGfUPntTW2OyTPoSRqLKObwIYVxGcu5I1r/7pKGhy0knPaBJpdKP0n1M5gZr5aoUHgSWj/etU8lBZlskPTUFMTzrljIIMgYvy7ckO3YOrMWZouYYuYPEPGy5VnTD/aB+TVuW+oxIOv5mUsanycfQOrug0EAM1otiM3x/lMfekfTBc6NFXXGCPRzKGWKxeb0uNQ4x/Y2fmHS1farL/jFOnu37nNMcQ7LNNdr75u7uJotx1uG+8uGX/xo5Gk9mPx5zij+NmrZBX4QYm2TdOjnY1I8qtLd4/R1uR3XEghT5j4kRX1o51AgLgRg7TLjvNnrE9guf9Qa+fA78ANsxQ65k5ujjV91j5pmPtYr/TK8qfYS5tASwX/P4BymdB0pDZHoH3H8BJncLG4QcA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aeb9/UMSJYdszxNIQ0ZmPIQ9kRhNe73u+S/z8NA4G3ZEVbpwXgHRvZH7bNvRyaCM3N3uEvuDkpnBKb7/k8Xc4Zq1ZMMI6qYj6c0LwsIlMm3hkRET/qI+yBw1E4IKvRZ6eUUtGB0SQeTXwYXqpVKF5Ap7gvUSdXEk6Oz845poDkhToszGloiuuqCscuiZ5JiLECvpclSXX0iCPMlbPYRfi9scXEKPWZYGw8EHaZp9rFtvSkYGwE9SuzaWFKjTm4T9VnrVnT8exgySU7XTdQ5PNkTdtE2axf7mb1rExLaU/+jkbhtem4EVyRkQvVHsrCvJGYKsGYV5ivZ9AzegmfTZu4gwO1gRkdIt9gx3pSn+EzYELQxn+mnMthNzaoJMuzNmiTXxAaZYf7xF37zofjeaFrN4N16KUlqyZpybcHWW6kEqm2niUT/1s6L7tbCAxjSA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:26:59.5805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c126eade-eb81-4b0b-ddf1-08dea70ffa27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8175

The kmode_cpus and kmode_cpus_list files are read-only, so adjusting
the per-group CPU scope after a bind requires a full unbind/rebind via
info/kernel_mode -- reprogramming hardware on every online CPU even
for a single-CPU change.

Make both files writable (mode 0644).  The handler validates the input
(rejecting pseudo-locked groups and offline CPUs), computes the delta
between rdtgrp->kmode_cpu_mask and the new mask, and reprograms
hardware incrementally: only the CPUs whose enable state changes hit
resctrl_arch_configure_kmode().  The new mask is then stored in
rdtgrp->kmode_cpu_mask so the next rdtgroup_config_kmode() at re-bind
sees it.

Documentation/filesystems/resctrl.rst is updated alongside.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v3: New patch to add "kmode_cpus" and "kmode_cpus_list" to support
    kernel_modes.
---
 Documentation/filesystems/resctrl.rst |  33 +++++
 fs/resctrl/rdtgroup.c                 | 183 +++++++++++++++++++++++++-
 2 files changed, 214 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 89fbf8b4fb2a..aebd9a649773 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -636,6 +636,39 @@ All groups contain the following files:
 "cpus_list":
 	Just like "cpus", only using ranges of CPUs instead of bitmasks.
 
+"kmode_cpus":
+	Visible only on the rdtgroup currently bound to the active kernel
+	mode (see "info/kernel_mode"); hidden on every other rdtgroup,
+	including the default group while INHERIT_CTRL_AND_MON is active.
+
+	Bitmask of the logical CPUs scoped for this group's kernel-mode
+	binding (PLZA on x86).  An empty mask is reported as a bare newline
+	and is interpreted by the bind path as "every online CPU".
+
+	Writing a mask reprograms the binding incrementally: it enables on
+	the CPUs newly added by the write and disables on the CPUs dropped
+	from the previous mask.  The mask must be non-empty and contain only
+	online CPUs; empty masks and masks naming offline CPUs are rejected
+	with -EINVAL.  To reset the binding to "every online CPU", use
+	info/kernel_mode to unbind and rebind the group rather than writing
+	here.  Writes to a group that is not the active kernel-mode binding
+	are rejected with -EBUSY.  Reading returns -ENODEV for a
+	pseudo-locked group and -ENOENT for a deleted group; writes to
+	pseudo-locked or pseudo-lock-setup groups are rejected with
+	-EINVAL.  Errors are reported in "info/last_cmd_status".  Example::
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
+
 
 When control is enabled all CTRL_MON groups will also contain:
 
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index cff306d28e79..0eb28dbfd77f 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -425,6 +425,183 @@ static int rdtgroup_kmode_cpus_show(struct kernfs_open_file *of, struct seq_file
 	return ret;
 }
 
+/**
+ * kmode_cpus_write() - Update @rdtgrp's kmode_cpu_mask from @newmask
+ * @rdtgrp:	Resctrl group whose kmode_cpu_mask is being updated.
+ * @newmask:	Non-empty set of online CPUs scoped for @rdtgrp's
+ *		kernel-mode binding.  Callers must reject empty masks
+ *		before reaching this helper.
+ * @tmpmask:	Caller-allocated scratch cpumask used to compute the
+ *		incremental enable/disable deltas; contents on entry are
+ *		ignored and on return are unspecified.
+ *
+ * Compute the difference between @rdtgrp->kmode_cpu_mask and @newmask
+ * and call resctrl_arch_configure_kmode() only on the CPUs whose enable
+ * state actually changes:
+ *
+ *  - Empty -> @newmask: the previous mask is the post-bind default
+ *    "every online CPU", so disable on cpu_online_mask & ~newmask and
+ *    enable on @newmask.
+ *  - Non-empty -> @newmask: disable on (old & ~new), enable on
+ *    (new & ~old).
+ *
+ * Then copy @newmask into @rdtgrp->kmode_cpu_mask so subsequent
+ * show/write operations and the next rdtgroup_config_kmode() at re-bind
+ * see the updated set.
+ *
+ * Context: Caller must hold rdtgroup_mutex (taken by
+ * rdtgroup_kn_lock_live()).
+ *
+ * Return: 0.
+ */
+static int kmode_cpus_write(struct rdtgroup *rdtgrp, cpumask_var_t newmask,
+			    cpumask_var_t tmpmask)
+{
+	u32 closid, rmid;
+
+	if (rdtgrp->type == RDTMON_GROUP) {
+		closid = rdtgrp->mon.parent->closid;
+		rmid = rdtgrp->mon.rmid;
+	} else {
+		closid = rdtgrp->closid;
+		rmid = rdtgrp->mon.rmid;
+	}
+
+	if (cpumask_empty(&rdtgrp->kmode_cpu_mask)) {
+		/*
+		 * Previous mask was empty, which means the binding covers
+		 * every online CPU.  Drop the CPUs that fall outside
+		 * @newmask, then (re)assert on @newmask.
+		 */
+		cpumask_andnot(tmpmask, cpu_online_mask, newmask);
+		if (!cpumask_empty(tmpmask))
+			resctrl_arch_configure_kmode(tmpmask, closid, rmid, false);
+		resctrl_arch_configure_kmode(newmask, closid, rmid, true);
+	} else {
+		/* CPUs dropped from this group: old & ~newmask. */
+		cpumask_andnot(tmpmask, &rdtgrp->kmode_cpu_mask, newmask);
+		if (!cpumask_empty(tmpmask))
+			resctrl_arch_configure_kmode(tmpmask, closid, rmid, false);
+
+		/* CPUs newly added: newmask & ~old. */
+		cpumask_andnot(tmpmask, newmask, &rdtgrp->kmode_cpu_mask);
+		if (!cpumask_empty(tmpmask))
+			resctrl_arch_configure_kmode(tmpmask, closid, rmid, true);
+	}
+
+	cpumask_copy(&rdtgrp->kmode_cpu_mask, newmask);
+	return 0;
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
+ *   - writes to a group that is not the active kernel-mode binding
+ *     (defensive against fds opened while the group was bound; the
+ *     visibility layer normally hides this file on non-bound groups,
+ *     but an open fd survives an info/kernel_mode change),
+ *   - malformed input,
+ *   - empty masks (use info/kernel_mode unbind/rebind to reset),
+ *   - masks containing offline CPUs.
+ *
+ * Validated masks are passed to kmode_cpus_write() to update
+ * @rdtgrp->kmode_cpu_mask and reprogram hardware incrementally.
+ *
+ * Locking is via rdtgroup_kn_lock_live(), which takes rdtgroup_mutex and
+ * ensures the rdtgroup is still live for the duration of the write.
+ *
+ * Return: @nbytes on success, -ENOENT if the group has been deleted,
+ * -EINVAL for pseudo-locked groups, malformed input, empty masks, or
+ * offline CPUs in the requested mask, -EBUSY if the group is not the
+ * active kernel-mode binding, and -ENOMEM if the scratch cpumasks
+ * cannot be allocated.
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
+	/*
+	 * The visibility layer (kernfs_show()) prevents fresh open() on a
+	 * non-bound group, but file descriptors opened while the group was
+	 * bound stay valid across an info/kernel_mode change.  Reject those
+	 * stale-fd writes so they cannot corrupt the now-active binding.
+	 */
+	if (rdtgrp != resctrl_kcfg.k_rdtgrp ||
+	    resctrl_kcfg.kmode_cur == BIT(INHERIT_CTRL_AND_MON)) {
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
+	if (cpumask_empty(newmask)) {
+		ret = -EINVAL;
+		rdt_last_cmd_puts("Empty mask not allowed; use info/kernel_mode to unbind\n");
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
+	ret = kmode_cpus_write(rdtgrp, newmask, tmpmask);
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
@@ -2621,15 +2798,17 @@ static struct rftype res_common_files[] = {
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

