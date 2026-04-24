Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB1D26ED3E;
	Fri, 24 Apr 2026 01:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776994987; cv=fail; b=eNmvW2QvuijIBlX5VBwHRoU9f5TmeGxRvuwhm3Egwu8dSClzDqx3usNG+s27lLq/BlSxeDrMqIMWWpxtxMUEVMnqB3XzEgxVOj1hkoW2IWytO0YErMsz6WL/5kApOa2F39f5h5XQUXoSBjKfRrVXbRg1K19mUuaZenrvBlI/z0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776994987; c=relaxed/simple;
	bh=DlnZtxoVc5s+/feUznwcVx9+6wyn1sJ7ACfgP+w1PmM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExXGHQlBj7pT4HdGgk87Kr4G1OahVE5kQaXbY9y9KJBuUg4is2vAc7nHe/DAWPUaiqo+m94UZ/6nFJWDNBvQInbNA+Wi3l9d9aGbIsu40WGzPimMxTnfb19YE2ixJOBadVKF9jIq9ybNLQOiKAdlx19jfIpCrmfNJ84KFFB6z/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rVz6SBCI; arc=fail smtp.client-ip=52.101.56.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rVz6SBCI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVKRbwaUK+VsUmmgcoWdcGR2DHj7b7vv5RzVz9V0r9S91zGSMBIlSUvWmJ8m9YC6UmxfYDlCLabtUcN4ibg8wKCjoqLaU46gHtUoSivPTD1eF0zQuKzLwowaDS6IAAwxnCy244a7VwnoBV9zHNv2dfNlPTqYaXLx/3WmWEDgpZTEk2vMkXQcS6EJuBDi+NUOJxrdjnWOTIc1LwALfiPHCvVDM4OCd3an/fDsw2iX5XAYfRWA1Q7eukoL85kRU/d5NnwCXhT/NEPVZk5lquYDb9JSJ6FQA8fXnGxJ1S+HUc39fUovbfUxtv36fBGKiY1izKGNISRm9T4oOq/gD3EoqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNxUMTYN//Z3WjbjEe3QkB193YQenfJOuH5tfVostFM=;
 b=ypwEwBRKGn1Ngc6c5kmBUA3ng0umjHWi4Ksa7lvPJDSqEmjKrGJlglSTxRTE1+gUHk96rNyJowizBicbr06r7z7w7HzI9Uj3EAs3ljvEzy85DNc6sKMgWS0OhFOx6GHD6Kyg9RZifahd3CD2IE29qwvlowIpHPGKZOtZDBwmozPZQG2sVBy5BkLGCU2bWtqPTEIFyMhIM7v07METcJZ+9ipoAwFk2nxAPcB8R+eg0KQxeL4t6zO2mC9LqCwhZgTTNzEQSk37rwjlRV3TKt/yD5JW41fPKuWb/1EyzX+Dn3NSMK8ZCJNsrqlS6GDtpMpz0nE7bDfnJUEU0mm9xccElw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNxUMTYN//Z3WjbjEe3QkB193YQenfJOuH5tfVostFM=;
 b=rVz6SBCIlycmGfT/okjY+qosTpdjMiv+1nQ8kpfALtPmS9csY4X03BfeAGoouUxcwDhQ6lL7sLiykRlMfq9qTry2rF5AnpHTrQUKbWZU9wAxbNhFoElsriyhnrc0gA79bM+F9htPeGrhA/9c/TmbEwBpnBBcdalDnYELkT1jBTc=
Received: from MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 01:42:57 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:303:6b:cafe::53) by MW4PR04CA0078.outlook.office365.com
 (2603:10b6:303:6b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.21 via Frontend Transport; Fri,
 24 Apr 2026 01:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 01:42:56 +0000
Received: from ruby-9651host.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 23 Apr
 2026 20:42:52 -0500
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
Subject: [PATCH v2 8/8] fs/resctrl: Add the documentation for Global Slow Memory Bandwidth Allocation
Date: Fri, 24 Apr 2026 01:41:38 +0000
Message-ID: <2b0dd6490c1f860c375aa2784f138a6a66dbae25.1776980182.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d6d315-6920-496a-cad1-08dea1a2cf5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|18002099003|56012099003|22082099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	vhMs3zHPC5fKHpkoZXN9DmNlIXSk2V2IFzbBgLVxXeKklX79s94HphQcHwQUFcWRuipABq1bPLajLGP7Svfd9EaNkp6W39lMXyilUKHGOZDhqktuH5zzlLPT2D5VismkhR5Qrqn4/JwV3V0/5zGQnzHxbrz5Un5IzRJOYH6KujyCq2jxMTsfc6iexoiOgRvJkT50uetf4bCHZ+Z9yJ9HwqS79lLsIMP4i3tRNRvC43D/32ikdEwIrx3t0PmqVZUipSVCdBXLLRg3mX9sZv4anxn2cz76ozOgcXsj/3e3BEXXIEelBoiW7FpjOwYMQh4/POq26gj+SC7aOcoQHno0zWzoeD3SZEYyA0o/oDwM4buSQffOg1cMMU+2wvp6QtAroTp1UMoTZpWR6p2wUNAkPY5ZqbDgKgD3nzRac/riH2MGl85JKadS6xY7cxmk0VHJDsssInK6XwjsmoVmEVVVTdV+LTQ0FOs10ojGRALdtvAzvtHWS8eBu/vmC6MXuCKU+lo4M4sxMQ3XcZo/9NLaDwsiOLVACXAP8zt4NZGbmt9SVtglIZKu1uTRzYU7sFJcQX+tKcH0g5yjKrSYAKS/T/vN7VmrdXTiX7CqTTGZiha8duOMo2+z7MnFOzu45xrLC3zAdNBCdnfqIZoMhPEqAQw+qGUzgNit0ldtmkv94GAsOo03pazot/fit25bbGQyFVvoELFHiwOTOMkEDSVLTRveDQ57ymWc+SuBtdvFatsjKHktrZiSz8ba2s4SrioMM/EEQIBSxLzKUTuZ0K2LEA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(18002099003)(56012099003)(22082099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sn4yXzrlKzJ5XR8e/z6Zb6VAlMAWskfvMSskHYpfnKZAEbiZuhl+Js37HGdxchKzUjHXYX4j0AJwLSIuCmWqh7gQ6MZBoVXPQANYAER6aAleJlgCQ0vyOGQeJV4KSw1536n2euNvlqV6Gc2aZ8Yh0jvAwPcTljUOrXwgOWM391PE8Kd3HZVCIVYkVBUtwybzDBlTD3kDIyzTf/Ve7Z3rekj5NGbGCYKniDstbj52IxxdU6QJ7fCzuPzFxkivFhXBbRBMuOUx81uIzVAQBLXYMy4Y8w1kSgLCRd6OrlCDKyrMf8VUtt8976Q8vNG1rMqw68+GdWq3qQCOU+4S/47XPTjNQQmjN4A9gwWUrlPWsJr7y58Y8gdJJt65rCd+rb091VKAlgk+A0PDjExmaKB8lU3AXzBVJaDH7tokVw4wmUZCmN/St3UOs/2PF/dqhUHK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 01:42:56.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d6d315-6920-496a-cad1-08dea1a2cf5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487

AMD Global Slow Memory Bandwidth Allocation (GSMBA) is the slow-memory
(CXL.memory) counterpart of GMBA. Like GMBA it applies bandwidth limits to
groups of threads that span multiple QoS (L3) domains, using the same GMBA
control domains that are aligned to the system's NPS (Nodes Per Socket)
configuration. GSMBA is exposed in the schemata file under the resource
label "GSMBA", with values in multiples of 1 GB/s.

Document GSMBA in Documentation/filesystems/resctrl.rst:

- Add GSMBA to the resctrl feature table at the top of the file.
- Add a "Global Slow Memory Bandwidth Allocation (GSMBA)" section
  describing the resource, its bandwidth domain and the schemata syntax and
  unit.
- Add a "Reading/writing the schemata file (on AMD systems) with GSMBA
  feature" section with a worked example.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: Updated the documentation with clarity and format issues.
    Improved changelog.
---
 Documentation/filesystems/resctrl.rst | 42 +++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 901d059800fa..a1c5aa45f5fe 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -29,6 +29,7 @@ BMEC (Bandwidth Monitoring Event Configuration)			""
 ABMC (Assignable Bandwidth Monitoring Counters)			""
 SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
 GMBA (Global Memory Bandwidth Allocation)			""
+GSMBA (Global Slow Memory Bandwidth Allocation)			""
 =============================================================== ================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
@@ -1001,6 +1002,22 @@ is formatted as:
 
 	SMBA:<cache_id0>=bandwidth0;<cache_id1>=bandwidth1;...
 
+Global Slow Memory Bandwidth Allocation (GSMBA)
+-----------------------------------------------
+
+AMD hardware supports Global Slow Memory Bandwidth Allocation (GSMBA).
+GSMBA provides a mechanism for software to specify slow-memory bandwidth
+limits for groups of threads that span multiple QoS (L3) domains. Each
+such collection of QoS domains is called a GSMBA control domain. GSMBA
+operates similarly to GMBA, but targets slow memory (CXL.memory) instead
+of DRAM; it reuses the same NPS-aligned control domains as GMBA.
+
+The bandwidth domain for GSMBA is the GSMBA control domain. GSMBA is
+exposed in the schemata file under the resource label ``GSMBA``, with
+values expressed in multiples of 1 GB/s::
+
+	GSMBA:<domain_id0>=bw_GBps0;<domain_id1>=bw_GBps1;...
+
 Reading/writing the schemata file
 ---------------------------------
 Reading the schemata file will show the state of all resources
@@ -1077,6 +1094,31 @@ For example, to allocate 8GB/s limit on the first cache id:
       MB:0=2048;1=2048;2=2048;3=2048
       L3:0=ffff;1=ffff;2=ffff;3=ffff
 
+Reading/writing the schemata file (on AMD systems) with GSMBA feature
+---------------------------------------------------------------------
+Reading the schemata file shows the current bandwidth limit on every
+GSMBA control domain. Values are in multiples of 1 GB/s.
+
+For example, to set an 8 GB/s limit on GSMBA control domain 0, leaving
+control domain 1 at its previous limit:
+
+::
+
+  # cat schemata
+    GSMBA:0=4096;1=4096
+     SMBA:0=8192;1=8192;2=8192;3=8192
+      GMB:0=4096;1=4096
+       MB:0=8192;1=8192;2=8192;3=8192
+       L3:0=ffff;1=ffff;2=ffff;3=ffff
+
+  # echo "GSMBA:0=8" > schemata
+  # cat schemata
+    GSMBA:0=   8;1=4096
+     SMBA:0=8192;1=8192;2=8192;3=8192
+      GMB:0=4096;1=4096
+       MB:0=8192;1=8192;2=8192;3=8192
+       L3:0=ffff;1=ffff;2=ffff;3=ffff
+
 Cache Pseudo-Locking
 ====================
 CAT enables a user to specify the amount of cache space that an
-- 
2.43.0

