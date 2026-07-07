Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3D326923;
	Tue,  7 Jul 2026 21:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459041; cv=fail; b=PIGSrcH5XU24SJpF6BsZ981Mpq76mAz5NzI8d/48OUQJeIWh3zCCB0OxWcti5eEDNtGuy2BFUg0B2IqbsBO7OF+nmH/bX3xKZBaH+32cGuf0XbtWudFnTfgSwqPNamGIZu00JJF3Y3Yd7Zt8AEu2mJnsLdJ2BgsOZHgwbaeJOVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459041; c=relaxed/simple;
	bh=FF9POI5EOaWzswrum39jHoRFkh27nefcn5WbG8At3j8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GvMUAqPzRbAJKVqtJ4847xYE1BYfm7r/gJLC4mVibtUeddRcAM8GklZgQ/h6ehdSy8c2Tb71lPOBIzzYsVQd5HwBuJOpLw2l0yXeqd6FnSCCR9fDh/sTcMLyhzc5zZ2XSUGJiT1YRRxu2gfQ17FwWYH9OulIhmKa1NtBABD1mOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=wScVYfWl; arc=fail smtp.client-ip=40.107.209.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="wScVYfWl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PexGPUu0ma9ZIXIFZX86Gb2adszTSbgmVJ6zaNQUL3HdLChP3dnYNoPX+cLZzMs4KbVZHKSzDtFvfv/Hbzq3TRt+Rr98NzcJQrcFhX4D6BQE2+8aV0qTtrpBz8CJ/gWbF+0/6/RSz8NmywhgTc6MudqJUO/ovIeYudj3LKbTIIYO41SZOET53Gf5M6r1JsMaJ7JTqpkQlMrNlJfBDwd7leEytpolVsL/3obYgBCp7Sli87uRFWjca5rVLOizurPt6mbNsD7e2hdYXsZGQzuHtHDDTXb8/8aqRzRq/hCo+Cbcl+345Rv9vDzA5C0jtvt4W0C1UrX8UTHOwXTOiWDq+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUbQgYfA8MRTXiA1sk89Ns3neAkmfV/Sy9/TfSIGWyc=;
 b=PKxr+s2KjVht7nyIxvdeBCGJGivn3sXm+F6+dw0UOE3fkOll8gLtMvwQQ0tViFk/P2SbD6YV9S/AUSYnbaLk99CZ/9SQrWXKLkO6X1R3NJ2eHoe2rCHQKzXWU/Hs92XI7P+TDk6WACO6uZQjUhvibtZaH+e2irQLTVS7KGK8l5/N6+K2HVC4+ZkzV+W+FHG7FdCSpHuHilrmDQMEOSNXZhh9Qk+R4bSzw7nFflWd4xIDJWjKLuswpu6Zr35/o0Gt+/szK1WBZvF3EEZinWTw+2GCc0M6W721+5xv7wAi4qkZYQfcsr8Ftokosw922RZIv2K07d60cllYMYDf7MFPMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUbQgYfA8MRTXiA1sk89Ns3neAkmfV/Sy9/TfSIGWyc=;
 b=wScVYfWlGULyyTBKT6bO2kKr/UYqZTM1gwfPoxRLFfQ9KaR1BPu3Ky4JRQoKKfYqV0VazzlqNkkiWsDRmMeuSfMujdewok3xRrCI1xwRfLHtIUqHWFh3DYmvZ2lv85z17ztdo4n/98cez/7RsIorU0PVF3OxGHdE6vlwpm7FGBI=
Received: from PH7P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::27)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:17:12 +0000
Received: from SA2PEPF00003F65.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::89) by PH7P221CA0021.outlook.office365.com
 (2603:10b6:510:32a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:17:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F65.mail.protection.outlook.com (10.167.248.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:17:11 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:17:09 -0500
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
Subject: [PATCH v4 00/15] x86/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Tue, 7 Jul 2026 16:16:48 -0500
Message-ID: <cover.1783459023.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F65:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b7c012-ccea-42a1-8ada-08dedc6d1bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|82310400026|7416014|376014|13003099007|3023799007|11063799006|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	tT2IMkib9E2wcAq9jrPN7S0rFtklZZeaCwN4Trt9XtF3EOWTkIsZAP5DJPP5DGZ0XEwrevK5cA3TwdB8VUlMEQHGq1Odn+hlLvwmOcQZ+rTMcv4J+Gj7BueCH2bg9yPNvRsTkzYNuT6wWEd7P0k1Rf/SXzjUv3D3ad9Eg1nlIuaLbmjoINGt0DmNKyZlfYcwGO28AMhSH17AIOaBd5WvPSofXsYnDsPRV7bzedPnOoyULIvvOuFgeziAx3bx1dfnLR0wfNkFJ/BGamoUGsJdktMn/3kEHRFf+D9EDc6ZipZSquGuR3c8q0jT1Rwz1y4eK0vlhML1JNHLlpKvFh2kWtmKJhr/sOJ3+b8pd2WbZVYxRiA98spCVCCjtAPUIR3rxVy9bSXXpbXHWgvE2HD18C2asRndXhgs+ejKlqJK8lsT4/qDxoHbdZ9MjpUgGP0NJVqw+sZVnij92zaxzdaH8FT2T3Fy3sohMgQbcqEt9jU7sqWDD7MC0Lu6hNGBMKPFqhlxmXAtkvAk/W6Rcy/aKRr6KmbKr2bkEzEaVrJ54To2YBod5Y+Zm67mBBmiAD/TNhkZwagyBq3lsbbnVO5FF2qvHoeFTai4QI4GGx+FGQ1KfhNFqxjCZ8Kq9iOt0+a1Jmyjw3Z63sKrxEz3AeptjA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(82310400026)(7416014)(376014)(13003099007)(3023799007)(11063799006)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YtaN6sq5GUhZA7ZV9ZrLd85nMyGgPOj8L51SNmuk1JN82fT491vARlpGao5f3Qs9fWr8F+vdfUol3zERfCKXy0XZr3T2F8ahiEyBpY/yt4RepxMN14DS9s2zsJSC7q+IGiGapQXahoLRaCZuSfA/vV96jCS6vefopfgqsLtp2MRRN4/uI9DjtST/BOTOF6zfvpHulgVcNGnge3tJaP3PH7i1APUjxF3LGoasK+PjMxj/U08+T49G+5MLlYe1QZfAQbpdz23OAgTicUIN+PdXFBKoYfvshlRtQjoy7SUZuPfLXKJuF3tzC8Bp2OAr4+LILnS6dH6Wq58B9w/qb4B0Z71Apw9SsbkGOQhNGzu85cQc4hk9+vK62B9xve4tJihTFDTwJpp/joDrDmL2JsGC8B+pmCdvKYM7mkbOK8YP/VVmKzhd2w1oOv97wZ6lZg6R
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:17:11.1172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b7c012-ccea-42a1-8ada-08dedc6d1bf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506


Hi All,

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

