Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B2047F2F0;
	Tue,  7 Jul 2026 21:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461046; cv=fail; b=d9w03ZHCz/mm/2ZI2iT4FAboG7BK/MnTSpbNba82oAIA70ckkTjPlyewdd0gf6GCVtlg9LFazZ0aspZBTCikFWQ4lBBW/DnlI1a6MTVCvQYwveyhGr2HouYbezg1hSWsr9o+sGIm/SkG9UgN8wbfjOasUwAviK36zHFYzA+Lvhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461046; c=relaxed/simple;
	bh=1Le1+x+A0IUSGVR1aw5aqm4vs7FnvO6mrIDhVDNoFqE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uy/NQTxDow4MJBVruqFVsGQjLLRtZosmOhjvjku0Y9Oc89EOWWJwCIF+1PktBmkf2K1DoSxNoVouNbICFtEtbHurSFV6LSnq3bVebXLEfJYvbVXjD/vkoZTRGtuJyra/yTMkyhDE8E4Nm6N+PvFpKZer5SysfdcOtfs4eUqVIXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iVALlTKu; arc=fail smtp.client-ip=52.101.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iVALlTKu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJPzT206aoHpPVgKQFu5DBh07bUr/8ZZ+b5YEGuxehA4i53U7A1Qjs44RUmRYN8c/PT3VksYEEjD3Gi0EHXSfYymDSbhUp593PX480Ra1+vwi/s1MszXYyRWAHQZnnZUFAp8Rra8iVVS43eomWNdkfplx+JJzC7sw1jC8dL/Q/mImTuC2p6djlISmY9ydrNVs90HM+0oRx8ekysm8dYasf29n/6LbAqw2CcS3gxbcDrLt/9fibAh9muhwkWQ+8zRw576a6ViwRiWSCr1QlK690pC76uret2GJpFJjWNijAtMY7/Xlksiyk6xS4GT8bPI1H1egoiQ7PFVthYZUowAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGVt9lb9dQ87hOD57PniecmAigcvWODaTjnb7/i2GQs=;
 b=pvViNxHcvsLVxZ3KLEaJ8DIBWyYgamfV+TGVy+LhaewHn4Idm9pcYkUlLqKJ3ntWwcnuYzbGLMVgFjBC0nmyGRcO93PdO5RUSIt2bz8F22YX+hdoEowJaeDZYWTPVYOMB8e9Tv0K1R9XIVfaWDzkRebFF3bX3P+B555IKT95y6U5wh9M2LxpC45bDTzr3aOIq1KuTfEgB2LMlz0zDP1tXgImTTQ1YR2vUouBSyx1mSQI6T/mO7XRQbjqJ+OcU8WOL16rCIlVrmobZWJJx55tuUQOmV/7cHInMxuARKRrb8Xjq9/Vw28c9X6yVI3RACSKiTPoOlq4EQ910eVmr+lqZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGVt9lb9dQ87hOD57PniecmAigcvWODaTjnb7/i2GQs=;
 b=iVALlTKu7pTqrKcqR8eQWJJ2yx/TxlyoUyZX6fZkG8B4eC+EcexOmjcuOUuS/OTqFRPpSzGUT68sltOuUFC0j2F8OET9PfgzHJ9ZFonkfDwl+Fxv0CrA2JQ8vHILSBTJjg5X29EOt+R7YbpK7XAXkLqRL6GunZT9VUQWjJxwSIc=
Received: from IA4P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::10)
 by PH0PR12MB7011.namprd12.prod.outlook.com (2603:10b6:510:21c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:50:36 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:559:cafe::6) by IA4P221CA0005.outlook.office365.com
 (2603:10b6:208:559::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:50:35 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:50:33 -0500
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
Subject: [RESEND PATCH v4 00/15] x86/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Tue, 7 Jul 2026 16:50:01 -0500
Message-ID: <cover.1783461016.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|PH0PR12MB7011:EE_
X-MS-Office365-Filtering-Correlation-Id: c5427fc4-5dfb-4ff4-4205-08dedc71c6c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|18002099003|3023799007|6133799003|13003099007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	nNIbk5PoS+N2Rzqc1TToyOOGRDq0DNlmdHN2rm61xGtyYs9Y7MViqDiq7BAKJAkGZPF6Po3QjNWrvDfxme2/GexdBYT6AUsmrfmhDbPhfe4mbLSmhqRFTNT2bVKaQO/LXG30pizaL4UbTnqbjAf2MngNeCyhZiV+5QgphVdr3whju706OKfwVI+lwJj77h7tj8dOmrWx76KsDVS/crc+skNaM8UYx/vww1ZCQxveKxa0QsJ5vVPQNboTn/kzYhlPZ3PCBOoK5WfbYjer0sH0by1QymICqvZ4PKO6lqG30T5Y6XqAxtPYVfIEy/wAkXJCe7Sy+NuzKS8WUa0cUGyD6kzdKAY6DeZAkMXU9mYPWqtPONPmq7/5dlICJuNMCRKZSvSTdYue4NELeC9jwHrm0jY5SYFVObe47tfOQVMARgfzh/5gCgbC7YF1VuIHvDHCYMeyPxBXes6566I/AMjb5WSxOKGTMfI5bkG/aCxxn+AjEiRSQlC8kG3tWjDdy2RGhrIqiKL+MdcKLbWxhS+UeFHb1NeAwT0rI3xAgLHfkPs8/EelHrQOpgrNp6/EoFjXkkNC/ZTt4Hf3/3E/JgJgV8G+ngZ+YOwchqvtbcLevSR057PGDL7BqEbgo+Q0yL/+07PS1d++xBbIzU7YhVmKXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(18002099003)(3023799007)(6133799003)(13003099007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dmeOjAfGL33NGHL1sAR+HdX8SM8vZZ6DPxTY9iFIcMGe8yH0+6BPU1eTD+uYJX1mFLPMptrWdwQ9k4ViaBKQ7rbCilZ0N/yDPm18Sv4nI/Gd2sTBkXsUfkcAGOmswuyJP5Osxb4jGPscQN6wFhYSPhcJdCDr7c99Op9ZzFtx8GqT+55g1vYGR/F7WxCDar5f6bOehJQ96j+9Ajar7cNprcKXQRXqb+L9iXqxpmx2+SePrhl4kIn0EBC930QO/sn+lnr1R0auhTOuUzK/p7hhagb2sBCxdJvs01swK+YIJ1Mj8r8Uc2Qfp43DWSqZ+NXg5yQjuTNxxCIw0eCTj+l4jg+G0o6Anmk6JsJJ4fo1ou53xdb9A19wcdkPhwmGk+6Z5H+VVMS79m0Pw6tcrd54sonpuR7li5xUdxKPuwrr4IKlRMBTMhNDU/89kBHmTeSu
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:50:35.6931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5427fc4-5dfb-4ff4-4205-08dedc71c6c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7011


Hi All,

Had some problem sending the patches earlier. Resending it again.

This series adds support for AMD's Privilege-Level Zero Association
(PLZA) so kernel work can be assigned to a resctrl group, and wires it
up through a small generic "kernel mode" (kmode) layer in fs/resctrl
so future architectures can plug in without touching core resctrl.

The features are documented in:

   AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
   Publication # 69193 Revision 1.00, Issue Date March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit (tip/master v7.2-rc2):

  f705c6728b35 Merge branch into tip/master: 'x86/msr'

Background
==========

Customers have identified an issue while using the QoS resource Control
feature. If a memory bandwidth associated with a CLOSID is aggressively
throttled, and it moves into Kernel mode, the Kernel operations are also
aggressively throttled. This can stall forward progress and eventually
degrade overall system performance.

Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
and/or RMID for execution at Privilege Level Zero. When PLZA is enabled on
a CPU, kernel work at PL0 uses the CLOSID and/or RMID from MSR
PQR_PLZA_ASSOC; otherwise, the CPU uses the CLOSID and RMID from PQR_ASSOC.


Design
======

A new sysfs file, info/kernel_mode, holds the global policy for resource
allocation and monitoring of kernel work and the resource group (when
applicable) associated with the policy.  Reads list the supported modes
and the currently active binding; writes change the policy or rebind to a
different group.  Look at the thread below for design discussion.
https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/

Per-rdtgroup files kmode_cpus and kmode_cpus_list scope the binding
to a subset of online CPUs without unbind/rebind churn.  They are
visible only on the group that is currently the active kernel-mode
binding.

The arch hook, resctrl_arch_configure_kmode keep the fs/resctrl layer
arch-neutral.

Introduced `resctrl_set_kmode_support()` so architecture code
can register supported kernel-mode policies during resctrl initialization.

Only AMD PLZA is wired up here; Intel and ARM can add their own
support later by implementing the hooks.

Examples
========

(See Documentation/filesystems/resctrl.rst, "kernel_mode",
"kmode_cpus", and "Examples on working with kernel_mode", for the full
UAPI.)

  # Mount resctrl
  # mount -t resctrl resctrl /sys/fs/resctrl
  # cd /sys/fs/resctrl

  # Read the supported modes.  The active mode is bracketed for display
  # only.  Inactive global-assign modes report ":group=uninitialized".
  # cat info/kernel_mode
  [inherit_ctrl_and_mon]
  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized

  # Create a CTRL_MON group and bind kernel-mode allocation to it.
  # mkdir ctrl1
  # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" \
          > info/kernel_mode
  # cat info/kernel_mode
  inherit_ctrl_and_mon
  [global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//]
  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized

  # kmode_cpus and kmode_cpus_list are visible only on the bound group.
  # ls ctrl1/kmode_cpus*
  ctrl1/kmode_cpus  ctrl1/kmode_cpus_list

  # Restrict the binding to a CPU subset; the write is incremental.
  # echo 0-3 > ctrl1/kmode_cpus_list
  # cat ctrl1/kmode_cpus
  f
  # cat ctrl1/kmode_cpus_list
  0-3

  # Return to the default inherit mode.
  # echo "inherit_ctrl_and_mon" > info/kernel_mode
  # cat info/kernel_mode
  [inherit_ctrl_and_mon]
  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized

Tested on AMD with PLZA; the generic bits build clean on x86 without
PLZA support and are no-ops at runtime.

Layout
======

  01-03  x86: PLZA CPU feature, command-line option, and MSR/data-structure
         plumbing.
  04-07  fs/resctrl + x86: kmode data structures, arch hooks, supported-mode
         initialization, and PLZA policy advertisement.
  08     fs/resctrl: info/kernel_mode read-only introspection.
  09-10  fs/resctrl: per-rdtgroup kmode_cpus[_list] exposure and reset of
         the binding when the bound rdtgroup is removed.
  11     fs/resctrl: program kernel-mode binding when a CPU comes online.
  12     resctrl: hide kmode_cpus[_list] on groups not bound to kernel-mode.
  13-14  fs/resctrl: info/kernel_mode write and incremental kmode_cpus[_list]
         writes.
  15     fs/resctrl: documentation and end-to-end examples.


Changelog
=========
v4:
  - Reorder and split the series into 15 patches: separate read-only
    info/kernel_mode display (08) from the write path (13);
    add hotplug support when a CPU comes online (11); add an end-to-end
    documentation/examples patch (15).

  - Introduced `resctrl_set_kmode_support()` so architecture code can
    register supported kernel-mode policies during resctrl initialization.

  - info/kernel_mode UAPI: inactive global-assign modes report
    ":group=uninitialized" (not ":group=none"); the inherit mode has
    no ":group=" suffix; square brackets mark the active mode on read
    only and must not be included when writing.

  - info/kernel_mode write: validate group type (assign_mon may bind an
    RDTMON_GROUP or RDTCTRL_GROUP; inherit_mon only RDTCTRL_GROUP);
    run fail paths before tearing down the active binding so errors
    retain the old binding; reset any active global-assign binding
    before reprogramming when rebinding.

  - kmode_cpus / kmode_cpus_list: writable with incremental
    enable/disable deltas; empty masks are allowed; offline CPUs and
    writes through stale file descriptors (opened before an
    info/kernel_mode change) are rejected; pseudo-locked and
    pseudo-lock-setup groups are rejected.

  - Hotplug: newly online CPUs are added to the bound group's
    kmode_cpu_mask and programmed when a global-assign policy is
    active.

  - Documentation updated alongside the UAPI changes, including an
    "Examples on working with kernel_mode" walk-through.

v3:
  - Generalise the layer beyond AMD: rename "PLZA mode" to "kernel
    mode" (kmode) in code, sysfs, and Documentation.  The public
    interface is now info/kernel_mode and per-group kmode_cpus[_list].
  - info/kernel_mode UAPI cleanups: designated initialisers +
    static_assert for the mode-name table; strim() the input; clearer
    error messages via last_cmd_status.
  - kmode_cpus / kmode_cpus_list: expose read-only, gate visibility on
    the bound group, and allow incremental writes.
  - Reset the binding when the bound rdtgroup is removed, instead of
    leaving stale state.
  - Kerneldoc/comment cleanups across the series.

v2:
  - Similar to RFC with a new proposal; interface names were not final.
  - Separated Global Bandwidth Enforcement (GLBE) from PLZA; this
    series only adds PLZA support.
  - Used "kmode" instead of "PLZA" in the generic layer.

Previous versions:
v3: https://lore.kernel.org/lkml/cover.1777591496.git.babu.moger@amd.com/
v2: https://lore.kernel.org/lkml/cover.1773347820.git.babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/


Babu Moger (15):
  x86/resctrl: Support Privilege Level Zero Association (PLZA)
  x86/resctrl: Add PLZA support to command-line options
  x86/resctrl: Add data structures and definitions for PLZA
    configuration
  fs/resctrl: Introduce kernel mode (kmode) data structures
  x86,fs/resctrl: Introduce architecture hooks to program kernel-mode
  fs/resctrl: Introduce resctrl_set_kmode_support() to initialize
    supported modes
  x86/resctrl: Expose the supported PLZA kernel-mode policies during
    init
  fs/resctrl: Add interface to display supported and active kernel-mode
    policy
  fs/resctrl: Introduce kmode_cpus/kmode_cpus_list per rdtgroup
  fs/resctrl: Reset the kernel-mode binding when an rdtgroup is removed
  fs/resctrl: Program kernel-mode binding when CPU comes online
  fs/resctrl: Hide kmode_cpus[_list] on groups not bound to kernel-mode
  fs/resctrl: Add interface to modify kernel-mode via info/kernel_mode
  fs/resctrl: Allow user space to write kmode_cpus/kmode_cpus_list
  fs/resctrl: Add documentation on kernel_mode with example

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         | 195 ++++++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   1 +
 arch/x86/kernel/cpu/resctrl/core.c            |   8 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  36 +
 arch/x86/kernel/cpu/resctrl/internal.h        |  37 +
 arch/x86/kernel/cpu/scattered.c               |   1 +
 drivers/resctrl/mpam_resctrl.c                |   5 +
 fs/resctrl/internal.h                         |  16 +
 fs/resctrl/rdtgroup.c                         | 663 ++++++++++++++++++
 include/linux/resctrl.h                       |  56 ++
 12 files changed, 1020 insertions(+), 1 deletion(-)

-- 
2.43.0

