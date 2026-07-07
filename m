Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013001.outbound.protection.outlook.com [40.107.201.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4526422550;
	Tue,  7 Jul 2026 21:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783461199; cv=fail; b=fjeaoyC3M5HCxzo1Hv/wbt3q1aATjMjMUZxchA057UdEQZCt8QHQS37NaE6OO1k3FsF5V80RpV/taDqBEkjPmmtk5F4BVgVrY42ZutcV3uc1Y1eEwFG0WTLBjrOe/iXu/vgt3guj01y3/HlgEwWbdzULivc0K5I+jRDnaJs2iVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783461199; c=relaxed/simple;
	bh=1Ytb2ly+egaxrAx4XHdlfFP7ifnKQLkawpPMT4FvwYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mtVMx6GZSOv9FaEB2utEouGYAhmNFrd0gZVYDbJWrndd0x24BBXwNbq4KyO+/MCZgWxgAhV8FFicHpw0bm8fed1GwfNW6k6EvIAM221Wy6X+DZw29botx73NqWNBp1X4/4sXNe03JDqF358QZZinc6AbPErcAXbWb6dyuIZu1PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=t8IfySU0; arc=fail smtp.client-ip=40.107.201.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="t8IfySU0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOZ1nXYvq0kp2ePgp7NbkrF34oTjeuC56qoXTgbaqsUz/B3cqxby7ZSGIeK9xhF4UQKbFR9jQnjdgYZGu7B1NsYSCh7o9lrGwoO5jbl2+0jqME/wRb0B1hK/ntX0f40/DutZ8A7J+jpM/tidIuEk/1Zt2mRDr68wqMvcPDuqJIAo/dou1FVXnBary7X1X/k/xLdz5w2wtKV2DjeKtHbdbxFMr+4XAQh4xAgbGhqRi/CZChg8btq4AK9AUosi1Rg+L8PLt94gmu6P8fOWhP2wBIMjZFu4c5I4sPwCopbYLsSXRuz+AAW+2wVR4xnpzOxuvR+I5YeMWE0QK3EhVvdmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pu5xAnvm8HsTEnwWNwNIpmgZozx3zevt7gWbP1kwq8=;
 b=YVEnT2jjlTVCzEJPnHdTQjV0z9yI13HYBtQfV8guXm3wujOr2gV0R0YXD20StaumMR3McTNmLLuJGt+c8uBA8P8aCOjtfAk0Ho+3ZWSHf1cai4kDgODsFSdRwgruzCnR+FEQYUaVY9JCZu0UgzFKSrac5sm9J84tDIi8FyZvBvx1VZrmcm1NtG1CSKaMFtQ7s4b+TY8PwbvN43NqmHu0TgYsV47nGIQNf8i7hxZPoE8nkiBPvsL7ETBlnYcI/cj/HppaWGI2focEJrQjyixg92mWDh2s1zsjZzX2kgVmjYm1DLasqoHSUUYHw3b2BrY3o0YErrfv9+oYAVQiBBKfMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pu5xAnvm8HsTEnwWNwNIpmgZozx3zevt7gWbP1kwq8=;
 b=t8IfySU0eDQme+QzZqmNpBAmVOCfYmPM7ehXT9kqstX5xkUl3MI+NFWyRDrmp+YgwaktHcOpWHWnFhoCEJ3HprFJx/u6dF1WvSuV6I8NnT+3iULCNSqlRBlPG5jD0ILiiEs5YDHgOVHIi/WrHFTA/D7Xd7pdlqHNf8YUed+9dM8=
Received: from BLAPR03CA0095.namprd03.prod.outlook.com (2603:10b6:208:32a::10)
 by IA1PR12MB7541.namprd12.prod.outlook.com (2603:10b6:208:42f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 21:53:07 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:32a:cafe::6b) by BLAPR03CA0095.outlook.office365.com
 (2603:10b6:208:32a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:53:07 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:53:02 -0500
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
Subject: [RESEND PATCH v4 15/15] fs/resctrl: Add documentation on kernel_mode with example
Date: Tue, 7 Jul 2026 16:50:16 -0500
Message-ID: <9ae3bdf577d54e17ee7f78c90d9c329315e3800e.1783461016.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA1PR12MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2a89d1-cbfc-428d-4d96-08dedc722148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|82310400026|376014|7416014|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rGswlkmPKnFp2FgSokka6r12Oqmxa8Oy7xdGfboIglEmD+rOhJO7HftjdqYvIXQc7uvMzpgHTF5VdxabZfi2EdnDy/9b+bkfgiKMf/3cREJNuo3hMTbchfAc54bFZqD0j+G0cz4mCdaW8Kq9iKxzpmT0DM3aLK0M2yx96V3XT3yDJQnwuvZ7YnAZ+K74wxqh0K1YIRGxnmphFy7X5pEqkkZSA3eDt23JAIvJqjPCoIBbOwYpa6p6KvtOL6878bap/8Sx1OJns1mdWepYvQUODTtJzH53HQ6Gd8ML/VwqHAwB5qaeB/zktr/Xqm1PwrXyYpU++QDLD0FlvyTJjyxuf7Yf++P3ZXhhp28MRM61ZEWd3dw6OjmNnNlTv6c3bzTfn8Dmk6tAs40+Ay9Q0+IffBs8R6/i4xVarhNFe5boBnFl/BY6pPh8+dKIylYxZ8biPuV6y/n5NbA5aV/8w3xPZC9m1N2QDt0xvqCanSVYxsYQveN0198GZ8pkUAqv1ZPdAe22RVRz00ywvgvJ+C2rXWepeN3Adjgjh53sQyyLv8e/yaOUviOvjB8baQD8w9HqQGPAGrW+ToLsDIaMzSfJ1nHVrN41ly8PUjouLj+KvJmiPDyy7p7XHmA21vf4YDs8m3MLVnn9ZlJ4kmboN+KkASrlKxq/z8o+U+35ehz7D5fBAt2EMK98GcpfdynBvfcr1f7GjWayWcOC1QYs2ZpWKw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(82310400026)(376014)(7416014)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c5XddMmtS4OUuRT8oMpQtQiuswnVzUJqPWOUcnwVwvtJz2eyvo47cTjKtZxqGG0/kp36+n+Nb4Dx3sif8BJudIEEChA4flsFrzTuZqk3o0lDvXa6hp5/R6FtIQBTN6K3yd28BKlGUq199jZaRtkoYhK1qC6Y70AvsQMJd8T2Vf2MoOSHz7CtdU51hTDQlBwPoxtGBAi5IKVBi2GIkK3LW3vWePUcZ4+4ay4r1YjLeno4+7L7yTjzW8PFd6Zz9UlgkWyYVxiW71RCTjVtj0NcnlLdTWPnMSQ8I7qnmus73VH2QdfAim3s4xxqTUpXw75n9V6Nd8jhXjNSCQw8tIaNVl+7od/t5ATl8H7w4vjoHtggqZc4jhbIzfe4uVsDET1Hul7EFWppab++/nZAfO/ePHTJ7p0t2zMQ8LkPNUn7N/r2MBTycMNw7C0ldUvGq5ud
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:53:07.5613
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2a89d1-cbfc-428d-4d96-08dedc722148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7541

The kernel-mode resctrl interface now includes multiple related controls:
info/kernel_mode selects the active kernel-mode policy and bound rdtgroup,
while kmode_cpus and kmode_cpus_list adjust the CPU scope for that binding.

The individual file descriptions document the formats and error cases, but
there is no end-to-end example showing how user space should discover the
supported policies, bind kernel-mode allocation or monitoring to a group,
adjust the CPU scope, and return to the default inherit mode.

Add an "Examples on working with kernel_mode" section to
Documentation/filesystems/resctrl.rst.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: New patch. Added examples in the documentation.
---
 Documentation/filesystems/resctrl.rst | 84 +++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 4a2bdd74d4aa..e9f7048a62e2 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -1891,6 +1891,90 @@ View the llc occupancy snapshot::
   11234000
 
 
+Examples on working with kernel_mode
+====================================
+
+The resctrl file, ``info/kernel_mode``, holds the global policy for
+resource allocation and monitoring of kernel work and the resource group
+(when applicable) associated with the policy. The bound group's
+``kmode_cpus`` and ``kmode_cpus_list`` files adjust the CPU scope for that
+binding when a global-assign policy is active.
+
+a. Check the kernel-mode policies supported by the platform.
+::
+
+  # mount -t resctrl resctrl /sys/fs/resctrl/
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  [inherit_ctrl_and_mon]
+  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
+  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
+
+The "inherit_ctrl_and_mon" policy is active. Kernel work inherits the
+resource allocation and monitoring of the current user-space task.
+
+b. Create a CTRL_MON group and bind kernel-mode allocation to it.
+::
+
+  # mkdir /sys/fs/resctrl/ctrl1
+  # echo "global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//" > \
+        /sys/fs/resctrl/info/kernel_mode
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  inherit_ctrl_and_mon
+  [global_assign_ctrl_inherit_mon_per_cpu:group=ctrl1//]
+  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
+
+The "global_assign_ctrl_inherit_mon_per_cpu" policy globally assigns resource
+allocation for kernel work; monitoring is inherited from the user task.
+The group path format is "<ctrl>/<mon>/". A control group has no monitor
+group component, so it is written as "ctrl1//". When a global-assign policy is
+selected, the bound group's "kmode_cpus" and "kmode_cpus_list" files become
+visible.
+
+c. Restrict the kernel-mode binding to CPUs 0-3.
+::
+
+  # echo 0-3 > /sys/fs/resctrl/ctrl1/kmode_cpus_list
+  # cat /sys/fs/resctrl/ctrl1/kmode_cpus
+  f
+  # cat /sys/fs/resctrl/ctrl1/kmode_cpus_list
+  0-3
+
+The write updates the CPU scope incrementally. CPUs added to the mask have the
+kernel-mode association enabled, and CPUs removed from the mask have it
+disabled. The mask must not name offline CPUs.
+
+d. Bind kernel-mode allocation and monitoring to a monitor group.
+::
+
+  # mkdir /sys/fs/resctrl/ctrl1/mon_groups/mon1
+  # echo "global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/" > \
+        /sys/fs/resctrl/info/kernel_mode
+
+  # cat /sys/fs/resctrl/info/kernel_mode
+  inherit_ctrl_and_mon
+  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
+  [global_assign_ctrl_assign_mon_per_cpu:group=ctrl1/mon1/]
+
+The "global_assign_ctrl_assign_mon_per_cpu" policy assigns a dedicated
+resource allocation and monitoring for kernel work.  Rebinding through
+info/kernel_mode resets the CPU scope to all currently online CPUs, and
+the "kmode_cpus" and "kmode_cpus_list" files move from ctrl1 to mon1.
+
+e. Return to the default inherit mode.
+::
+
+  # echo "inherit_ctrl_and_mon" > /sys/fs/resctrl/info/kernel_mode
+  # cat /sys/fs/resctrl/info/kernel_mode
+  [inherit_ctrl_and_mon]
+  global_assign_ctrl_inherit_mon_per_cpu:group=uninitialized
+  global_assign_ctrl_assign_mon_per_cpu:group=uninitialized
+
+Switching back to "inherit_ctrl_and_mon" clears the active kernel-mode
+binding. The "kmode_cpus" and "kmode_cpus_list" files are hidden again because
+no rdtgroup owns kernel-mode.
+
 Examples on working with mbm_assign_mode
 ========================================
 
-- 
2.43.0

