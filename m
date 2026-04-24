Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9355D262808;
	Fri, 24 Apr 2026 01:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994914; cv=fail; b=lpmaPLWaFOlpoTEqijm1epYEO8sL+GJ5sPlh3BimqRe9+wT254XVcBNXcSOxqlDBvmObQ8bSHhDYPjO1iT7AKJR+piqziGpGHBPP7aepFwRJy+NczIh1PzaiZC+YtnA+7rB+NwAN9xEKtn14bMpZm7xzSbxXcPUjaCOaDYLfy1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994914; c=relaxed/simple;
	bh=GcBjEFbslGJ4B9vpF7K7KKm7RSjJTZUp1w+yAUFaGvY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r5OrDSKaYZLXGIAWI/ECGnJGkvUIpi+/tL0emdinMQf7BHZNgFSiAR8377+f/mQ2+RP6vrVtMAOZ3+sfQmFL/JPr0EfYaWwh/Q/SMO2X7OIaiDlIfa8uYWTIc8optz7f+cTVgi1icWwPA1z9D557RE2z1IRT25CPEQytEhJ+F8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DC2pYO4p; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DC2pYO4p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nxk43lbXMIt2jVorZS7MR1AgrR8F9V13z34is71KeKGXHcOZPIYUIKvbCwZq3vFr+vcBZJy4XONq7v2bTCrqIWMjgklzQ7j0Bmc5YL3ecOchKn+civf5Toz0wWSZvdxAUBybQnmw9ttTFRDhx+oNEDftgwRI1v2dqAzcqd3uvulZ50VIecHl2glW9bvR0bX0ZFl89IOZ//AVr+Cyr7hHyRSxWpZCvJphaFpGUCiMomt3Tb2pfdRyXDaQsC7w6h5I3NP93rtqzEqn91tEDTkwvC5k/pxkTiZF1aQjpLeHVlgXy1waueS4EY8iS/AnjLqh8/gOvOLRoEBlHVjEJzbreA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cz+i6hW8TW2C/g2NaCFCxHX09XY0ebhxWC2Flp9DPmA=;
 b=ArO1AN7mjNzZdzQGpF8Hea9TgG17onegJkb/LL7atpA4pc1X+WZboohF66RlfsBObtSCQIgmPKX9JZd1SJfxRp1y49GySvybh7YXregAA8CxgaZx2jyfCwbldqIBp9QR+36OXs2I3ZRoP8VHkL2Gg6a9DzoBN/kieQHFBN1Z3EIQM7rfGT8cgoqLQ3lAyezW5Q0H9naUi3hmlvI+79Jun8yoU4Nkj6LW0Qt8OzpGeoh05NDcI867IZcVxmrv0eTapZ/vaNel6n5U+pdqXrbj/GoNEzYW9Wmy9QrfycaQunvBi0Wz4DEp7d7Zb/VaA4qzbTL3h2ZrScPGiLIVvcc3LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cz+i6hW8TW2C/g2NaCFCxHX09XY0ebhxWC2Flp9DPmA=;
 b=DC2pYO4p1DElEOYRjhqnWn9dkF/jLGgyMvVeuu1Cg6SJ6Y+SmsuuF4+aL6PhgE0TQHqQgPdhANJuRD6ESOxOLtitnJeTPs9Uvj8jXAsld/4vL4QtBZ5ZuGqkFwDFRH5KDyRNRu3+V9jOtp3HYl/Qmp7ieLe0o12d3M84vq/yBfI=
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by DS0PR12MB8456.namprd12.prod.outlook.com (2603:10b6:8:161::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 01:41:47 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::28) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Fri,
 24 Apr 2026 01:41:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:41:46 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:41:44 -0500
From: Babu Moger <babu.moger@amd.com>
To: <corbet@lwn.net>, <tony.luck@intel.com>, <reinette.chatre@intel.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<seanjc@google.com>, <pawan.kumar.gupta@linux.intel.com>, <nikunj@amd.com>,
	<yazen.ghannam@amd.com>, <peterz@infradead.org>, <chang.seok.bae@intel.com>,
	<kim.phillips@amd.com>, <thomas.lendacky@amd.com>, <naveen@kernel.org>,
	<elena.reshetova@intel.com>, <xin@zytor.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>,
	<peternewman@google.com>
Subject: [PATCH v2 0/8] x86/resctrl: Support for AMD Global (Slow) Memory Bandwidth Allocation
Date: Fri, 24 Apr 2026 01:41:30 +0000
Message-ID: <cover.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS0PR12MB8456:EE_
X-MS-Office365-Filtering-Correlation-Id: 287431ce-e85b-4331-cc76-08dea1a2a556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|30052699003|82310400026|13003099007|56012099003|18002099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	CW4Y5/MZ0uq4KQnvkA8RSOIAq872Iu/2O8KvNJT+GEBhTMxLrs9EYLbZ46i83kGl/bDwbnpiYaMvSIQTVKGjC8mBhkyzg5nC67sNIGv39NN3xtMkc5P1iQHtJcj8bcIA+tFW3rC1NHvtp3juIDG8MvYFmmLv4Tn3dtRt0UBtX5Z5cALegpI9cZi1jzDoUSqXrS12DO65GzwET/fOJjfQAAqtEEAyTni0My6no5HGuxftjmGgUnxHZYF9GmhXtjxfh4qdrJwSsgrHgH+EudY/ZF+S958S3c34bLpkycN3FCw46f/7ekI6VFGtKAN0P2lMpEvY2302HzshIK6XZLeg7/UCD5wIS4fHjgmwQ+IZObWYKexKHdb+Dut6owCNg9boox1a+HDBdvzwNxJyiN88vHlZ0Z2qv45CR1yXbCHIwC7xGCbEWhulgK6jz3v8OJzkOFWjqLXh6PpeSVQO0vnxn15Zd9jByO/7Ia2kf7NLM8b6+mmll7li7rJvqnp8nZGAPCanbXpyiqNmO9OrxHHfz3D/Yj3Aqg7NGp/1VIXyYVAGwvBtm5GME/qo623XWpSN9cD6ENkhf6zhLyXon2PvHOQ6BhrrTQWUBgGEkUI5z7NipOfiNmSeBrSKF7hqQvazc3if/06yEZhqshxlS8dzDQQo+tqdOKNtYQhB+T4ZH2o1o2c0XCA9jolXu8n0fKY9A3M3z/ylzk1TG3QV8noq7ungJUsCMwdG6J5su1JdcF1V3IUCfe3CCxIufjmH9/WOhR6xmADHcHKBU6/RWqYT5OECWGeM0cEUxetwSx5YvyQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(30052699003)(82310400026)(13003099007)(56012099003)(18002099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DE7xvWd5a63hkrfhmcAIOWSxc55BQYlNlrOMXkJVBQdNRuzCGJZvmsdSmG/ZnC0WrGOen0ProCIBm2AL/aRZZTiPIjuvscO1TGfyF6w4AA3oTw/9vrhPz2rBoqH6NlLoNDjArjmYBFOIqqnxjMvZG0zGIMFM2C0jo0BTdm7b8zw1awC5DXfdkpSn0tNSJ1xgCXgO6VRWCa9cyWhpMvEM531QtgUEDhBxjpCMsFPFhQW0YU/usVjiL0lzzeKar5nNve/LZJU0+nFKF7SHf6RHTN/VdA3v5rd3vAR4Ys3kwOlhBVJ+ucsCWG89yWVa2AgukDvJzQZNxH9yT55aNSC/nH0fSmeZQQIH6A+WZTE25WBzO0V43gdx7A+A8/ziWey5HHz8Tf5R4xaq4aTPgyFNzKWmP8+v+nLH4aOIoZVutmp2Ujj13SG0QBkla/EleiBH
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:41:46.3073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 287431ce-e85b-4331-cc76-08dea1a2a556
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8456


This series adds resctrl support for two new AMD memory-bandwidth
allocation features:

  - GMBA  - Global Memory Bandwidth Allocation (hardware name: GLBE).
            Bounds DRAM bandwidth for groups of threads that span
            multiple L3 QoS domains, rather than being per-L3 like MBA.

  - GSMBA - Global Slow Memory Bandwidth Allocation (hardware name:
            GLSBE). The CXL.memory / slow-memory counterpart of GMBA,
            analogous to how SMBA relates to MBA.

Both features share a new "NPS-node" control domain: a set of QoS (L3)
domains grouped together and aligned to the system's NPS (Nodes Per
Socket) BIOS configuration. Although the control domain is NPS-scoped,
the underlying bandwidth-limit MSRs (MSR_IA32_GMBA_BW_BASE 0xc0000600,
MSR_IA32_GSMBA_BW_BASE 0xc0000680) are instantiated per L3. Programming
a single control domain therefore requires writing the MSR on one CPU
per L3 that the domain spans - a new pattern for resctrl. Patches 2/8
and 3/8 introduce that infrastructure so the new resources can reuse
it.

The features are documented in:

  AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
  Publication # 69193 Revision 1.00, Issue Date March 2026

available at https://bugzilla.kernel.org/show_bug.cgi?id=206537

Series overview
---------------

Patches 1-5 to enable GMBA:

  1/8  x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)

  2/8  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
       Add a new ctrl_scope value for resctrl resources whose control
       domain spans multiple L3s within an NPS node.

  3/8  x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
       Add resctrl_arch_update_nps(): builds a cpumask with one CPU per
       distinct L3 in the domain, then issues rdt_ctrl_update() via
       smp_call_function_many() on that mask. Falls back to the full
       domain mask if the scratch masks cannot be built. Route
       resctrl_arch_update_domains() and resctrl_arch_reset_all_ctrls()
       through this helper when ctrl_scope == RESCTRL_NPS_NODE.

  4/8  x86,fs/resctrl: Add the resource for Global Memory Bandwidth Allocation
       Register RDT_RESOURCE_GMBA in rdt_resources_all[] with
       ctrl_scope=RESCTRL_NPS_NODE and schema_fmt=RANGE, add commands to
       discover feature details.

  5/8  fs/resctrl: Add the documentation for Global Memory Bandwidth Allocation
       Add examples in Documentation/filesystems/resctrl.rst.

Patches 6-8 to enable GSMBA in the same shape:

  6/8  x86,fs/resctrl: Add support for Global Slow Memory Bandwidth Allocation

  7/8  x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth Allocation
       Register RDT_RESOURCE_GSMBA with ctrl_scope=RESCTRL_NPS_NODE.

  8/8  fs/resctrl: Add the documentation for Global Slow Memory Bandwidth Allocation
       Add examples in Documentation/filesystems/resctrl.rst.

Changes since v1
----------------
  - Earlier sent RFC(v1) with Global Bandwidth Enforcement (GLBE) and
    Privilege Level Zero Association (PLZA). This series only handles
    Global Memory Bandwidth Allocation. Both the features are sent separately.

  - Documentation
      * Fixed grammar in the GMBA / GSMBA sections of resctrl.rst.
      * Added examples to update GMBA and GSMBA in resctrl.rst documentation.

  - Major changes are releated to RESCTRL_NPS_NODE scope handling.

  - Commit messages
      * Reworked the changelogs in all the patches.

Previous Revisions:
v1 : https://lore.kernel.org/lkml/cover.1769029977.git.babu.moger@amd.com/
---

base-commit: 216fe4b3e06754e73c79a88b1df7e9806e41f29d

Signed-off-by: Babu Moger <babu.moger@amd.com>

Babu Moger (8):
  x86,fs/resctrl: Add support for Global Bandwidth Enforcement (GLBE)
  x86/resctrl: Add RESCTRL_NPS_NODE scope for AMD NPS-aligned domains
  x86/resctrl: Update control MSRs per L3 for NPS-scoped resources
  x86,fs/resctrl: Add the resource for Global Bandwidth Allocation
  fs/resctrl: Add the documentation for Global Memory Bandwidth
    Allocation
  x86,fs/resctrl: Add support for Global Slow Memory Bandwidth
    Allocation
  x86,fs/resctrl: Add the resource for Global Slow Memory Bandwidth
    Allocation
  fs/resctrl: Add the documentation for Global Slow Memory Bandwidth
    Allocation

 .../admin-guide/kernel-parameters.txt         |   2 +-
 Documentation/filesystems/resctrl.rst         |  81 ++++++++++++++
 arch/x86/include/asm/cpufeatures.h            |   3 +-
 arch/x86/include/asm/msr-index.h              |   2 +
 arch/x86/kernel/cpu/resctrl/core.c            | 101 +++++++++++++++++-
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c     |  90 +++++++++++++++-
 arch/x86/kernel/cpu/resctrl/internal.h        |   1 +
 arch/x86/kernel/cpu/resctrl/rdtgroup.c        |  15 ++-
 arch/x86/kernel/cpu/scattered.c               |   2 +
 fs/resctrl/ctrlmondata.c                      |   5 +-
 fs/resctrl/rdtgroup.c                         |  25 ++++-
 include/linux/resctrl.h                       |   3 +
 12 files changed, 313 insertions(+), 17 deletions(-)

-- 
2.43.0

