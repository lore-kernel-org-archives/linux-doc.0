Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011059.outbound.protection.outlook.com [40.107.208.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60639FCAB;
	Thu, 30 Apr 2026 23:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777591515; cv=fail; b=MGQVeiyZgqmPFKSmVQQD3Jq2EkmaZ2IxG0ThSPwv2syO/LbFdkMq/xcJDfrOUOQfFabdUfL7wf3oen0z8UZJf4spLl7s0zp2oPs8DnrIaGCJSgvaVxK3AXDhf4ZSnL+Zo/m93HAf5F1Fh0vBP5Lf5BfMRyo4qKKgqS0CJp9EbPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777591515; c=relaxed/simple;
	bh=Vc2MZeWustoR6QAXtIJskuNfj509MbIh8648lBWMjXQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nIa4Duf9FjKAfqWsyT5Oe89yJuPxpfPfJ1VhmHZ3sw+h2cRwQRlS62pEpf+n3h/1y+FHmtBfWM14s24PSmx7N7nDeHUOSNr1O1EAEY4aVspInyDdbXWs5URhSJmbyG6vlJhrg/mgyFFTdk0WGw7Tzy7FaTSqfz6ftaX0ozFSDXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PgKl4zGC; arc=fail smtp.client-ip=40.107.208.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PgKl4zGC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFApdQWMwzG5GN3P2F9jGZ9/Q6qjv5iYSpM2SG7ZAdaLWKOfy2e+1ZSH2kmzE6Xtb+vPoCG+9hq5ftj4a1ZiXeguR9uReZKqUzBi0NkGKJSQx8HT8HKw/aYbWzafPI9PGCiYN4nj/M0nNcld3WGAMYlIEkK1btL9dbK3KEsDu5UT8M1Gu7DEWMYhP5k4GeQMnL9KG3PAhMXyZxVPkWP7GYEIqVs5GwxlLVnBOYqff23u3KO05A9w7211ExyISlGrfN+Q4IaOmEYE9BIqW8YrzSRcgdr5KFrhtYsRXJRG/SBYvQVvnf0s6uVPW8m51pnJ6oyW29T07zASQo/lV2zI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9dV5R/k0Nfi5yoeDPRfa6Do+98kHV99oSumPJPZQco=;
 b=uhjOO9oMoazBjic4DrD9bT22YfGUIkzpBBhwm57YJ93wwGY9SE6wBzoxjLQuhZOrDXNFWl+zLDBb9my2Si17GEk8qR4VewGrsloBUUZ/TQj7Y/tqnz6dcCgAjnp9i+0eaIWR4TiBkc1z2qHO9McvySjl87f3fYFIe7xbJxCssSEkcFCXUD3LmTxXk3yDFfI4liyX4ciPc9qBamAKMyN64FzCOCBUGMsQbUuVWDjOzP8kLYkKFK13OoKdJNMNOBj0OkmuysrVMgmX0D2X1cAzAzHMtCs1Sz6h5MgG8rTd5FcsGnW/FlPuWvuu0qv92jC/p2irFNtg9x3llbgty4sZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9dV5R/k0Nfi5yoeDPRfa6Do+98kHV99oSumPJPZQco=;
 b=PgKl4zGCsfhBnDcsAFIjs7Grkbo/iOI6BL5V6gn+33ZRfI836I+HO2H90n8sqxZCb9jcippqQos0iKrqRFAo6ci9rgE2KwWKnk1EnVQJtIj8OmHiRWcmA8mygLGBjDBrw6IrvPDfUBuLISAFwIEF4pCWaRbgOPWnjaJTfbvvoV8=
Received: from SN6PR05CA0011.namprd05.prod.outlook.com (2603:10b6:805:de::24)
 by SN7PR12MB7418.namprd12.prod.outlook.com (2603:10b6:806:2a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Thu, 30 Apr
 2026 23:25:05 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:805:de:cafe::6a) by SN6PR05CA0011.outlook.office365.com
 (2603:10b6:805:de::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.5 via Frontend Transport; Thu,
 30 Apr 2026 23:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.22 via Frontend Transport; Thu, 30 Apr 2026 23:25:04 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 18:25:02 -0500
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
Subject: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode (e.g., PLZA) support to the resctrl subsystem
Date: Thu, 30 Apr 2026 18:24:45 -0500
Message-ID: <cover.1777591496.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|SN7PR12MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: abb2e096-762b-49fa-05a7-08dea70fb5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	+8sIQc/HF1DSKYj1ow8GEK7L9Uo2R7FYc5uOmtvoUUf4Vc1a5Z5MQ6b3wkKDSl6CtnRQdgbRLAqXonlt86jRYwnXfIwicGxdB5B2rsvWKUg11uyqKnVECI+RzxBQNRoAYIgsRgHtmae2Hg2lH1dNsyuNWQ7ZZCY9oA88F+hAeObCIJ4BepQZfYSCJd8vuagXPYNUMWxbWdUT+w3idUGW1eXFHx5sUEOw0LtLyvUjZNgvDtfwMh8bP0LCs9orSl8udlKgZfyCq3N6ogJiPxjNW7lLzvsglYhU47M7tuILqzuRPAAS926GAoB71qqBpqTs+envo2Te2nL4YnpS1s38HDeQh6lsN4Jxc5JUZ6CFhha39qyO/xP5j+AoevEwvvofSl3eoVv3xEGCZQegF+7M8nMadXbxiiF4uyNxMWFnll0cP0UDAVQ1c7y07wakyY5xNYlie42NBs2Np9Gghdxc5dbxRxYjrQruW+WDHE3lNN9HwELS6hqoXVerQTpWy/Q1rlLv0L2eruEbpWNd84jUdKd7/1d0+iROpVAkDFYkmJGZJd7T/s5vvZg0dU9Q6JAfRjMPdqmjdQSF98VDhwZ8aQi7QDM4v1TwY7cg/ue+GgPxwQdlqz48OinCpydV1kuxsVVXDuN/pbl+5MDmRwu8b7FjCpJUl7jhU84tat1KF1/dBxCkGhZaWXzYQQ7zRsLr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v6cuXIIThJA6cPD6iUjllp0ZYwqrI/6GCsQuhg7xG3sVWtEppuInG+5bM9OfPeYlPmCy+9swb0jd7nXSjVPE5Ygi/LFuKKqVITIk2hI/18ItHBNDzpJNkpqLF/2w5iZNo7i+JomCnYq8OK7LbjQ7ZZvcssz3ZXMdSvanStlOOJaGDUtnK2XHM+8d+O7dZP4fWeWObwf0GufkhduDaV4G9xpiLCttBDD/plFZSAhGUKxvLREfzrZ6Dmr+z1YZ1Nue/VtSnq1u9Ss0WnA6ru53dRVSXCZpBjdvqy7Us9ao/u6rEIFtojsi3YF+0IdKlwjkJp5CnuxYZx0S/BrSp0x8xX8Zs9gtPQatkX+TIGs5Jd1WJzE/8gvvAPXRasgPo4xb9oW3mpmIwhTCzcb+llpDVRS8Hp5C51uBQGntZIDmV1VO2lx8C/zhkN4Z0ifOhfMC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 23:25:04.8997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb2e096-762b-49fa-05a7-08dea70fb5cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7418


Hi,

This series adds support for AMD's Privilege-Level Zero Association
(PLZA) so kernel work can be assigned to a resctrl group, and wires it
up through a small generic "kernel mode" (kmode) layer in fs/resctrl
so future architectures can plug in without touching core resctrl.

The features are documented in:
 
   AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
   Publication # 69193 Revision 1.00, Issue Date March 2026
 
available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

The patches are based on top of commit (7.1.0-rc1)
Commit 3382329a309d Merge branch into tip/master: 'timers/clocksource'.

Background
==========

Customers have identified an issue while using the QoS resource Control
feature. If a memory bandwidth associated with a CLOSID is aggressively
throttled, and it moves into Kernel mode, the Kernel operations are also
aggressively throttled. This can stall forward progress and eventually
degrade overall system performance.

Privilege-Level Zero Association (PLZA) allows the user to specify a CLOSID
and/or RMID associated with execution in Privilege-Level Zero. When enabled
on a HW thread, when the thread enters Privilege-Level Zero, transactions
associated with that thread will be associated with the PLZA CLOSID and/or
RMID. Otherwise, the HW thread will be associated with the CLOSID and RMID
identified by PQR_ASSOC.

Design
======

A new sysfs file, info/kernel_mode, holds a single global policy that
selects what kernel work is steered and which rdtgroup it is steered
to.  Reads describe the supported modes and the currently-active
binding; writes change the policy or rebind to a different group.
Look at the thread below for design discussion.
https://lore.kernel.org/lkml/14a8ad0a-e842-4268-871a-0762f1169e03@intel.com/

Per-rdtgroup files kmode_cpus and kmode_cpus_list scope the binding
to a subset of online CPUs without unbind/rebind churn.  They are
visible only on the group that is currently the active kernel-mode
binding.

The arch hooks (resctrl_arch_get_kmode_support,
resctrl_arch_configure_kmode) keep the fs/resctrl layer arch-neutral.
Only AMD PLZA is wired up here; Intel and ARM can add their own
support later by implementing the hooks.

Layout
======

  01-02  x86: PLZA CPU feature + MSR/data-structure plumbing.
  03-05  fs/resctrl + x86: kmode data structures, arch hooks, and
         population of supported modes.
  06-08  fs/resctrl: global kmode config, info/kernel_mode read/write
         and documentation.
  09     fs/resctrl: reset the binding when the bound rdtgroup is
         removed.
  10-12  fs/resctrl: per-rdtgroup kmode_cpus[_list] - expose, gate
         visibility on the bound group, and allow incremental writes.

Examples
========

(See Documentation/filesystems/resctrl.rst, "kernel_mode" and
"kmode_cpus" sections, for the full UAPI.)

  # Mount resctrl
  # mount -t resctrl resctrl /sys/fs/resctrl
  # cd /sys/fs/resctrl

  # Read the supported modes.  The active mode is bracketed and reports
  # the bound "<ctrl>/<mon>/" group; other supported modes report
  # ":group=none" because nothing is bound to them.
  # cat info/kernel_mode
  [inherit_ctrl_and_mon:group=//]
  global_assign_ctrl_inherit_mon_per_cpu:group=none
  global_assign_ctrl_assign_mon_per_cpu:group=none

  # Create a CTRL_MON group plus a MON child and bind both the kernel
  # CLOSID and RMID to them.
  # mkdir ctrl1
  # mkdir ctrl1/mon_groups/mon1
  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/" \
          > info/kernel_mode
  # cat info/kernel_mode
  inherit_ctrl_and_mon:group=none
  global_assign_ctrl_inherit_mon_per_cpu:group=none
  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/]

  # kmode_cpus and kmode_cpus_list are visible only on the bound group.
  # ls ctrl1/kmode_cpus*
  ctrl1/kmode_cpus  ctrl1/kmode_cpus_list

  # Restrict the binding to a CPU subset; the write is incremental.
  # echo 0-3 > ctrl1/kmode_cpus_list
  # cat ctrl1/kmode_cpus
  f
  # cat ctrl1/kmode_cpus_list
  0-3

  # Empty masks are rejected; use info/kernel_mode to reset to
  # "every online CPU".
  # echo "" > ctrl1/kmode_cpus_list
  bash: echo: write error: Invalid argument
  # cat info/last_cmd_status
  Empty mask not allowed; use info/kernel_mode to unbind

  # Disable kernel-mode steering (back to inherit, default group).
  # echo "inherit_ctrl_and_mon" > info/kernel_mode

Tested on AMD with PLZA; the generic bits build clean on x86 without
PLZA support and are no-ops at runtime.

Changelog
=========

v3:
  - Generalise the layer beyond AMD: rename "PLZA mode" to "kernel
    mode" (kmode) in code, sysfs, and Documentation.  The public
    interface is now info/kernel_mode and per-group kmode_cpus[_list].
  - info/kernel_mode UAPI cleanups: ":group=none" instead of
    ":group=uninitialized"; designated initialisers + static_assert
    for the mode-name table; strim() the input; clearer error
    messages via last_cmd_status.
  - kmode_cpus / kmode_cpus_list:
      * 0010 exposes them read-only on every group.
      * 0011 toggles their visibility via kernfs_show() so they
        appear only on the rdtgroup currently bound to the active
        kernel mode.
      * 0012 (new) makes them writable: incremental
        enable/disable deltas via resctrl_arch_configure_kmode(),
        empty masks rejected with -EINVAL ("use info/kernel_mode
        to unbind"), offline CPUs rejected, defensive -EBUSY for
        stale fds opened before an info/kernel_mode rebind.
  - 0009: reset the binding when the bound rdtgroup is removed,
    instead of leaving stale state.
  - Kerneldoc/comment cleanups across the series; Documentation
    updated alongside the UAPI changes.

v2: 
     This is similar to RFC with new proposal. Names of the some interfaces
     are not final. Lets fix that later as we move forward.

     Separated the two features: Global Bandwidth Enforcement (GLBE) and
     Privilege Level Zero Association (PLZA).
 
     This series only adds support for PLZA.

     Used the name of the feature as kmode instead of PLZA. That can be changed as well.

     Tony suggested using global variables to store the kernel mode
     CLOSID and RMID. However, the kernel mode CLOSID and RMID are
     coming from rdtgroup structure with the new interface. Accessing
     them requires holding the associated lock, which would make the
     context switch path unnecessarily expensive. So, dropped the idea.
     https://lore.kernel.org/lkml/aXuxVSbk1GR2ttzF@agluck-desk3/
     Let me know if there are other ways to optimize this.

Patch 1: Data structures and arch hook: Add resctrl_kmode,
	resctrl_kmode_cfg, kernel-mode bits, and resctrl_arch_get_kmode_cfg()
	for generic resctrl kernel mode (e.g. PLZA).

Patch 2: Implement resctrl_arch_get_kmode_cfg() on x86, add global resctrl_kcfg
	and resctrl_kmode_init() to set default kmode.

Patch 3: Add info/kernel_mode and resctrl_kernel_mode_show() to list supported
	kernel modes and show the current one in brackets.

Patch 4: Add x86 PLZA support and boot option rdt=plza.

Patch 5: Add supported modes from CPUID.

Patch 6: Add rdt_kmode_enable_key and arch enable/disable helpers so PLZA only
	touches fast paths when enabled.

Patch 7: Add MSR_IA32_PQR_PLZA_ASSOC, bit defines, and union qos_pqr_plza_assoc
	for programming PLZA.

Patch 8: Add Per-CPU and per-task state.

Patch 9: Add resctrl_arch_configure_kmode() and resctrl_arch_set_kmode()
	to program PLZA per domain and set/clear it on a CPU.

Patch 10: In the sched-in path, program MSR_IA32_PQR_PLZA_ASSOC from task or
	per-CPU kmode; only write when kmode changes; guard with rdt_kmode_enable_key.

Patch 11: Add write handler so the current kernel mode can be set by name.

Patch 12: Add info/kernel_mode_assignment and show which rdtgroup is assigned
	for kernel mode in CTRL_MON/MON/ form.

Patch 13: Add write handler to assign/clear the group used for kernel mode;
	enforce single assignment and clear on rmdir.

Patch 14: Update per-CPU PLZA state when its cpu_mask changes (add/remove CPUs)
	via cpus_write_kmode() and helpers.

Patch 15: Refactor so task list respects t->kmode when the group has kmode (PLZA),
	so tasks are shown correctly.



v2: https://lore.kernel.org/lkml/cover.1773347820.git.babu.moger@amd.com/
v1: https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/

Babu Moger (12):
  x86/resctrl: Support Privilege-Level Zero Association (PLZA)
  x86/resctrl: Add data structures and definitions for PLZA configuration
  fs/resctrl: Add kernel mode (kmode) data structures and arch hook
  x86,fs/resctrl: Program PLZA through kmode arch hooks
  x86/resctrl: Initialize supported kernel modes for PLZA
  fs/resctrl: Initialize the global kernel-mode policy at subsystem init
  fs/resctrl: Add info/kernel_mode for kernel-mode policy introspection
  fs/resctrl: Make info/kernel_mode writable and identify the bound group
  fs/resctrl: Reset kernel-mode binding when its rdtgroup goes away
  fs/resctrl: Expose kmode_cpus / kmode_cpus_list per rdtgroup
  resctrl: Hide kmode_cpus[_list] on groups not bound to kernel-mode
  fs/resctrl: Allow user space to write kmode_cpus / kmode_cpus_list

 Documentation/filesystems/resctrl.rst        |  ...
 arch/x86/kernel/cpu/resctrl/...              |  ...
 fs/resctrl/...                               |  ...
 include/linux/resctrl.h                      |  ...
 include/linux/resctrl_types.h                |  ...
 N files changed, X insertions(+), Y deletions(-)

-- 
2.43.0

Babu Moger (12):
  x86/resctrl: Support Privilege-Level Zero Association (PLZA)
  x86/resctrl: Add data structures and definitions for PLZA
    configuration
  fs/resctrl: Add kernel mode (kmode) data structures and arch hook
  x86,fs/resctrl: Program PLZA through kmode arch hooks
  x86/resctrl: Initialize supported kernel modes for PLZA
  fs/resctrl: Initialize the global kernel-mode policy at subsystem init
  fs/resctrl: Add info/kernel_mode for kernel-mode policy introspection
  fs/resctrl: Make info/kernel_mode writable and identify the bound
    group
  fs/resctrl: Reset kernel-mode binding when its rdtgroup goes away
  fs/resctrl: Expose kmode_cpus / kmode_cpus_list per rdtgroup
  resctrl: Hide kmode_cpus[_list] on groups not bound to kernel-mode
  fs/resctrl: Allow user space to write kmode_cpus / kmode_cpus_list

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         |  84 ++
 arch/x86/include/asm/cpufeatures.h            |   1 +
 arch/x86/include/asm/msr-index.h              |   7 +
 arch/x86/kernel/cpu/resctrl/core.c            |  17 +
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  35 +
 arch/x86/kernel/cpu/resctrl/internal.h        |  27 +
 arch/x86/kernel/cpu/scattered.c               |   1 +
 fs/resctrl/internal.h                         |   6 +
 fs/resctrl/rdtgroup.c                         | 784 ++++++++++++++++++
 include/linux/resctrl.h                       |  23 +
 include/linux/resctrl_types.h                 |  46 +
 12 files changed, 1032 insertions(+), 1 deletion(-)

-- 
2.43.0

