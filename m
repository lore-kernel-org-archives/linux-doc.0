Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC41221FB6;
	Fri, 24 Apr 2026 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994966; cv=fail; b=rEyhFqivQ9ouSpek2j1PNRSk/P2JuOG07QUMYHAK013nrR402g2iZdfr+yrcDxIKDLHhCqMu9mOzquu0T4/c+CY8uAA1BAW0f+xD7BH14//dQtovvC7eCpSZlaQj6aWHkG9cZS993Fu78vjyQ0yG14p8+rf6WpC3V9TuqUjrthY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994966; c=relaxed/simple;
	bh=P9gxabS214FtfseD1Ets9G2z224I5958R4xglhbnyoE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QlGgLJNcmtxPK392cCPXhgZi2VyV1l+sQaIW0871+PtAKh4DA0/ZPG70iIIA2RDUgE63whF+LPpNwbgwMEH8nXGvnb9byy5bIYKgwMSjAtufAV8Qx2Cx8kPUdseNXOetD2PRGSSZjmLQvTYqNX9JDoGc09euGXfyagZ0QhTy9uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sc83SGrs; arc=fail smtp.client-ip=52.101.62.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sc83SGrs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bM2jwiDAjRR9A0sMcGzEKnnm2xIwLNsLHlTqXzW1Uaqo1sJhdSfo+wjzx1gIhd/U1R5Bq40NGhy9F2Vlh/0T36PX6Ud8lG0sagOpm2pAgI6see29Ym0WmK3cDXJ3AQGiQWHKQrOKf42VFVgYfPrdLe9pXZnFqGiyxNzAO2BhO+jNfVJxvr64uoPffpuzcjiQAFn8YUHTwc66knGwZX84h3WsuYx8acBgxpUaXdFhHI7aSgxRtk++UxOZkyFiF8E5kSedzeLkjg8jjM/pQ3/OVTO9jo+S2w37Bwa7fUiGFqoTtbZ4mLDfa8GJq9E4C1EG8hsefHWO8YnnwNM0uUEY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ag4noiOKk5zHgydfGN5emJYFhpWCGEQitV5uqjxXKc=;
 b=G/PhpcUC4KhlBVJbTRwy18OSOVsFr8kax4JaA09P2sl1cJsCxdUm1X1LTDg0+GVdQ23BPRdzCISDqew68qACL/Ir2Buaku1lYAr/nQc9+0ZBNSb8yoYJz3WBbtTu/99Glt3ihFwqGvvKCF6j9/wR8sXdy/uJx0QlZmdQXUHRyggMQGdwM5DN2dFMoBuR9UMO4I5OyKE2SnLv5S7yVIKhejSw/lP/R7NMNypBFAwQpXOivvRu9BH+5piVaA7XPvDbufCoJviTB+BjHApEgfJztoLPuran7dnpL97zw+6dU2HUuDNHhyjcCvgZNGTo7ARlA0QCXN94agS2aRl9d5xqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ag4noiOKk5zHgydfGN5emJYFhpWCGEQitV5uqjxXKc=;
 b=sc83SGrswNbxI4TwKoPwQuYt030s5tc9+/7DsE5CQICjwJCIMpkJiSwWHINHakfvcYZvi+Upse/1b78NThM4vfYEPT4mt8toxsicSiNfNqq2YaxxtVet7u5WYgiCo88x1X7aV9fKj8Mbb6SOUR2GlUekJQlad+uK9QQ91IIi4Ts=
Received: from BY5PR04CA0002.namprd04.prod.outlook.com (2603:10b6:a03:1d0::12)
 by CH3PR12MB8236.namprd12.prod.outlook.com (2603:10b6:610:121::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 01:42:29 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::1f) by BY5PR04CA0002.outlook.office365.com
 (2603:10b6:a03:1d0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Fri,
 24 Apr 2026 01:42:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:28 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:26 -0500
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
Subject: [PATCH v2 5/8] fs/resctrl: Add the documentation for Global Memory Bandwidth Allocation
Date: Fri, 24 Apr 2026 01:41:35 +0000
Message-ID: <908eab1408bc4e0a90c6e68b43288778b62f3da4.1776980182.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776980182.git.babu.moger@amd.com>
References: <cover.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|CH3PR12MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec7814e-ec65-4a68-d2ee-08dea1a2be9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|20046099003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UrpG9SqHYBTtq18uct/knhHrgHG1Rpxewr4uOde9fy6aNYqEwFDk5ySdinHWbx0Vt2i4/+stHlvNAjVKItCs7nbYB1YuDPDsUpgMAN0cQh9tVGFyTxU3intmgmhNjObPLjx8PlVsRz0RrT9dwjhes0TFDd/y/UCgj4j0/pnKFneebXIhsw1ONuRz5OwXaBmjkI+kaIHezCdAH2/a5S5vJNLYKDIoZJUjoRrmry5e4fMWjMN3nHzv2WZ2n0sU+uBiVtecxvFrdabiqWtKGaZyzsklaJvZkcxbdOwzdl+m11M7oQN43Eee789dg8ueG+u6LPTceYeYJ+YdKhfHuScflNhfzvmtLYzwqbWgI6oPOsHbq3zsfwO19SKPEp6BwS/2YN4r8xMkkRQjTpBnkQheQ65RHHk5vk8I3SvD+6pcr6pj69p/0Aq2jqaDtjPmGcB44RHkOYruO7Cg719cWfNrBKKtbvgvJSPdQ5zg8/RH8Fbx2W+PoPzNBCboDZWZXHyg9JUC5O9DcqJz7IQna6gP5miz4FhKgq83RHnDvKJdaUHzfedeHTfg0+DO302eg004CVrkkUnn5aTOBQFkwVwtkMz6MdlLa1ZXcEPmRRCS8K2d2by0stN2oMARGvh15yztB7PbLAPttpQu6/+vjijvi1q4RwoGE/B0z8efdXMZPQqeQTkhBnAegR7+rMixh4XTABR+vA5ZOnndJqQteGfML/puvXzU6lcl+p9SYxoUsSJzmFoFLRk+U2vp7df70lrSDOEoaVmJra+EDAjIJcLN/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(20046099003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LkKeWXgIGFD+0OzTx+Mb8TKmzGLJRcsOvv6AuwOdOcNTCAYDHLM4nI3BDqs4yGQ85GKZ/XQWf5hI7jnMQlifMN5m2IY5/4jFMfzWPekXz+V8eJ2whjmLbdCJgkd2FgrK80g7wAOFXRAOR3WRDFvOuIIlX7piUIBfbGfVf0n8IIVotM5/UpxBZUMUM4F34ev6n3f9+Rr5Azh6pOuxATE2yGBHs38ciJRkav4pIAlKnePMB4zXuR3eGCXQhDY8p/7Z+lqMDY5dk0zpUivd026ZBO5/MrybfNQy/aDVC2ZEOiRX0uEFd0bzmMGS71dW/FfmA76/FdCSppoJAF4symE6XbFCfQ5Au/PsXHTrfSNGxtYRjwi6X3XqEtoj/LHWQanhtBaiBJbqj5Qc+/u/EdzNgH9zP3fknkGSJft31TWfKuCEfVR4UEu/QxU0mF9pPZzx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:28.6945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec7814e-ec65-4a68-d2ee-08dea1a2be9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8236

GMBA (added to resctrl by the earlier patches in this series) is a new DRAM
bandwidth allocation resource that applies limits across multiple QoS (L3)
domains rather than per-L3 like MBA. Each GMBA control domain is aligned to
the system's NPS (Nodes Per Socket) configuration. In the schemata file the
resource is exposed under the label "GMB" (not "GMBA", to match resctrl's
short-label convention) with values in multiples of 1 GB/s.

Document GMBA in Documentation/filesystems/resctrl.rst:
- Add GMBA to the resctrl feature table at the top of the file.
- Add a "Global Memory Bandwidth Allocation (GMBA)" section describing the
  resource, its control domain and the schemata syntax/unit.
- Add a "Reading/writing the schemata file (on AMD systems) with GMBA
  feature" section with a self-consistent worked example.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Describe GMBA's distinguishing characteristics (NPS-aligned control
    domain, per-L3 span, DRAM target).
    Added examples to update GMB schemata.
---
 Documentation/filesystems/resctrl.rst | 39 +++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b003bed339fd..901d059800fa 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -28,6 +28,7 @@ SMBA (Slow Memory Bandwidth Allocation)				""
 BMEC (Bandwidth Monitoring Event Configuration)			""
 ABMC (Assignable Bandwidth Monitoring Counters)			""
 SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
+GMBA (Global Memory Bandwidth Allocation)			""
 =============================================================== ================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
@@ -964,6 +965,23 @@ Memory bandwidth domain is L3 cache.
 
 	MB:<cache_id0>=bw_MiBps0;<cache_id1>=bw_MiBps1;...
 
+Global Memory Bandwidth Allocation (GMBA)
+-----------------------------------------
+
+AMD hardware supports Global Memory Bandwidth Allocation (GMBA). GMBA
+provides a mechanism for software to specify bandwidth limits for groups
+of threads that span multiple QoS (L3) domains. Each such collection of
+QoS domains is called a GMBA control domain and is aligned to the system's
+NPS (Nodes Per Socket) configuration. NPS is a BIOS-level setting on AMD
+processors that selects how many NUMA (Non-Uniform Memory Access) nodes
+each CPU socket is divided into.
+
+The bandwidth domain for GMBA is the GMBA control domain. GMBA is exposed
+in the schemata file under the resource label ``GMB``, with values
+expressed in multiples of 1 GB/s::
+
+	GMB:<domain_id0>=bw_GBps0;<domain_id1>=bw_GBps1;...
+
 Slow Memory Bandwidth Allocation (SMBA)
 ---------------------------------------
 AMD hardware supports Slow Memory Bandwidth Allocation (SMBA).
@@ -1018,6 +1036,27 @@ For example, to allocate 2GB/s limit on the first cache id:
     MB:0=2048;1=  16;2=2048;3=2048
     L3:0=ffff;1=ffff;2=ffff;3=ffff
 
+Reading/writing the schemata file (on AMD systems) with GMBA feature
+--------------------------------------------------------------------
+Reading the schemata file shows the current bandwidth limit on every
+GMBA control domain. Values are in multiples of 1 GB/s.
+
+For example, to set an 8 GB/s limit on GMBA control domain 0, leaving
+control domain 1 at its previous limit:
+
+::
+
+  # cat schemata
+    GMB:0=4096;1=4096
+     MB:0=8192;1=8192;2=8192;3=8192
+     L3:0=ffff;1=ffff;2=ffff;3=ffff
+
+  # echo "GMB:0=8" > schemata
+  # cat schemata
+    GMB:0=   8;1=4096
+     MB:0=8192;1=8192;2=8192;3=8192
+     L3:0=ffff;1=ffff;2=ffff;3=ffff
+
 Reading/writing the schemata file (on AMD systems) with SMBA feature
 --------------------------------------------------------------------
 Reading and writing the schemata file is the same as without SMBA in
-- 
2.43.0

