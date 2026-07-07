Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB033BBCB;
	Tue,  7 Jul 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459056; cv=fail; b=KuMBlGJk/p+STp6W5BnA8sHuos3D4J8elxBzT1mjhgBQaGl2qJUkuRXe59RCPGsXPTQFQsp+k3tUdBctfXhkACk/uJgwMjA8/WxzTn8xFie6tyy8QdcaMJfxyrHKbqr5FWrNgC5mhK+QESrza4lFPgfjK+eq+bj0rDky1bxdcss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459056; c=relaxed/simple;
	bh=PBUXBfkgxDudXoTLRSNERHeTNuxXnW/7T6iNryNM1ZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLaGZzMEebCQP+8LiYNED1y5JqHPP8B/gPhGuBYzGbz+oEYP6NN/6tOhhDHBmzE6Eer0xikICiXP3SzF29Xp1CiM61sqgZH25jCNWE09Ma16i7mq1G3sg0fyC4vaEs0cXi9nbadaCoajop2JX9+S2kT0pVOWwcppkgrGB5qR4A8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=j5kYecr6; arc=fail smtp.client-ip=52.101.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="j5kYecr6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzRCSjwAeoOxdHsytOVU1o9MPzKBaRpxw7fQ/Zx7jM+n+JNNKt/jE+sDCMe6rNQMSlYWB9A2jrv/6j/Gz4l6RxyE+KaXVx+ZN6hw9g4yuphAxNPxB4MS3eJdaqgwwwS0JoCPdi94Kj29ygQh8JUsCw7cGqkcPHciV3EcDecfoVlVdu+HdQhlHJbAhE38FaA6nz7Tji15e53HhcxF7hh5+b5z71nunf3sPzBUcZmRVvvu9eopeYDaZvBSYzuURM408l6Id2g7bMt5cRiuojrUE5cz+jVYBJV/feSyXJEPRfTW/+1oRqlTve4XijY9Ymau3nKcpUiD5pJlHfucR533ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/N1/eXV41MlyZkPVKiV/r4Yj1OYEXfjD0P7pD9IVBA=;
 b=QaxTDGlLWdk6lITTa9X1O20qMvEUW5m7oAOlTiszwJ+VkgLY/kiKSC980DwqF0Mrc7JFzqhhs8UkVLYKU1rgbraG5gK/eLMb1g+M1PSI7mxNciItTKINaFYQKnoRKNW6UwPtrYdH0KZ7sYwDV3BZG2JzInue+kuwCrMWpaMSD6bWQ63J7lSgSJFkcFT4d9beCnxDVtL+gYglKxLX3f8vBVMJf03RbGC6jVWsGNpJ5xG6MwFtIPhaS+xDtB4lyW062vLfLeJdBCC5AAH4I0+exa7ZDlGsTIFFkwyaFkVsqBWhYchphoHpC7GyhdBfxxzvgBfMMQst9zmO5Bb7OtJsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lwn.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/N1/eXV41MlyZkPVKiV/r4Yj1OYEXfjD0P7pD9IVBA=;
 b=j5kYecr6lO8jac8hhKd10lHv4L28VrgK77SfYNpEs8HnlalHnIeB2FpmJQxp0x/Y0QuTs0eSKcLnZpmTqcjDa92E+/d9Oj22ch6zQ7SVLPO8vxcD0nV8ayrZSeQBHnRi2KeKzK0cBaCQFpcKvBxJCGc5K3LWx+wx0HwmNRFtcMQ=
Received: from SA1P222CA0169.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::12)
 by DM4PR12MB9734.namprd12.prod.outlook.com (2603:10b6:8:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Tue, 7 Jul 2026
 21:17:28 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::29) by SA1P222CA0169.outlook.office365.com
 (2603:10b6:806:3c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 21:17:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 21:17:27 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 7 Jul
 2026 16:17:25 -0500
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
Subject: [PATCH v4 02/15] x86/resctrl: Add PLZA support to command-line options
Date: Tue, 7 Jul 2026 16:16:50 -0500
Message-ID: <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783459023.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783459023.git.babu.moger@amd.com>
References: <cover.1783459023.git.babu.moger@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|DM4PR12MB9734:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ebee52-e311-45de-805c-08dedc6d25b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|22082099003|18002099003|6133799003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	wU1/xXwvMvt5SWsaTIAfUDOS6ECGMvFfqy79cp0k9To5nRvuhrCkc9mvGd2RvFm8JdpRd2DgvFj4/ZmvWdWhqt+PMce1SBlM8tB8KGe/Pgij//UPpiDSGrLVJPGQhuLzLtyumKbIrlLoAtqfELpo70GXWjcxM1KreBCosWggQLnzVk7PGjICLw4T+oLwwWvFNa8SqvqUQ8nnz3sayQYKmeNGrX1pPgVTxf5I2qbx2vaJXj1TIXMw4KfzNM+pu26glSmp+QhOE7Jql/dp4istAzHkWM0BRKpkdRn+lnCLXgzYXbmIx03emqHUv4olyUOq68gVJIbj5Vv6zo0yxVClWRxZsWpPAZLpczsm8NIBDRz/8yncjcrlakvLdvGZNt7MK43Kvtd5WywijGHOjZ2+3e3AD5/CiwM8lKcegxfAQ3eaiNKU5j5ruQwp/vVuWqoShCPind0EKaTRYd1JkbCXgZWSw/pPznsJsoh3JAKRe8sXKCGTRMYe2KdSZkyTXM3GwtrNkvpIL9pHrGjPdCg7naxdKByIlvfls3FHgN+hK+ZBV0BeIBUDSDd83jLPdDYGefecYLp6BQ1TCG8OWAcr1HgPQd0KyaKBJc0Y2hPqr7GxwEAocFyAbrOY6zHIMQktLhN2Mv+v5KPgQLvv2FKUdVen4bnhQhwAr9G8lwigEZbjDSt4HZlPDxZxSqW+yVo96PGKNYnYh5coUZuyE+laLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(6133799003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	akqw+iHi2DvHUJ4kvI6lmKawLuNCpUsRseBjUeqPqMWYgLP5Jrwkp5qlbBcLaTIJHV8zagBD0t9sx2XCErtGT8VmO4TNoBItNTCSRabse/B2fJgPUt9PekJNnFgEIItVegw60VVhlMEcT3bfcX+NLeYw4B86bpvWCJK92u7QnLGDoUE9KaAY0RVnwj0XTYfL8zWXcBhkEO1WRUEf7KU44fI+ION5mO8tfAFjxw2hJ8dZUpjhZ1dHMCL0L6KsSBp+t2t6UJJ/ys+3wBloUC6pFG9PW1rY+yrhLxW799tu1Lz+cZ6MFrU5JK7sdSOMhDHJQWL9WI1ELGv0k4kvvwBLWKAzXfhki98l6hmQ1khO4Kt6WzPenZdvVlEtzHM++Ti6R/DaouzzNvPNSPqb+cE6su6Ikm77xcgbbBzMBfzcn4Ty4fZngLhJCU6APEP61Tox
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:17:27.4761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ebee52-e311-45de-805c-08dedc6d25b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9734

Add a kernel command-line parameter to enable or disable the exposure of
the PLZA (Privilege Level Zero Association) feature to resctrl.

This allows administrators to control PLZA visibility at boot time via the
rdt= option (e.g. rdt=plza or rdt=!plza).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v4: Split the patch 1 from v3 into 2 patches.
    This patch contains changes for resctrl subsystem.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 Documentation/filesystems/resctrl.rst           | 1 +
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..1de27055cb32 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6401,7 +6401,7 @@ Kernel parameters
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec, abmc, sdciae, energy[:guid],
+			mba, smba, bmec, abmc, sdciae, plza, energy[:guid],
 			perf[:guid].
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index e4b66af55ffb..f3e941404967 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -28,6 +28,7 @@ SMBA (Slow Memory Bandwidth Allocation)				""
 BMEC (Bandwidth Monitoring Event Configuration)			""
 ABMC (Assignable Bandwidth Monitoring Counters)			""
 SDCIAE (Smart Data Cache Injection Allocation Enforcement)	""
+PLZA (Privilege Level Zero Association)				""
 =============================================================== ================================
 
 Historically, new features were made visible by default in /proc/cpuinfo. This
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index f452e8ce4cef..27e09cded829 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -803,6 +803,7 @@ enum {
 	RDT_FLAG_BMEC,
 	RDT_FLAG_ABMC,
 	RDT_FLAG_SDCIAE,
+	RDT_FLAG_PLZA,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -830,6 +831,7 @@ static struct rdt_options rdt_options[]  __ro_after_init = {
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
 	RDT_OPT(RDT_FLAG_ABMC,	    "abmc",	X86_FEATURE_ABMC),
 	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
+	RDT_OPT(RDT_FLAG_PLZA,	    "plza",	X86_FEATURE_PLZA),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.43.0

