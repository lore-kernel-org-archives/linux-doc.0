Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFB1991AA;
	Wed, 18 Dec 2024 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734557914; cv=fail; b=Cc5myIVeFNyMqpCuJJdNC8b6jw3y2g5NlDHsM4g7D8I7FPp8TAENZJRA04czg+VriM4D66VLp07IKwPHgiFsgc3xm9w/1rek50jAxLrh0LCKzBF2GDBncv4gZM4zjA8VWRAmeLioELKtOHXGq8rtC5SJHtoxwQXhzguYh7PJntY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734557914; c=relaxed/simple;
	bh=GOCfJwaT2NsEQD8RZrcnFC0tNnXtmX00uCV5N01lwmI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P9q0J6Zg4/EJiSujfKsh1Q9HkT4NlFAM3lXmsmlv5vkpFBtz2FmpJhN7Cj1fdh9Pp7ptrCopfkNaoQij5eitM9w/7mpcr6SJbGPZQEGAkkBda/9P/E7kqWSzsRqCH979Q1bT1N4QvaMo7PaET4AZji4pOIltfMFtjcC/F6ThVKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=adC858S8; arc=fail smtp.client-ip=40.107.236.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="adC858S8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mmikf5WJv8Jj6GbHZtVrRPDH/Ni7Jnt5K880xx7HfBUML+MYti4hoJPg3suaul2tUfYGZNESSBt52iaBqmiV+9tiHRN90gIN9IehukKlO/Y4tQ9k5khz7hUQKCtz9p/LDAuD5e+kmUnFHz43bsP0oc19uiV5ddOhobey1vNs5lLeHcsr0+tTD1nzxmiFZywQ4VqpbNymUqipjNUql11DvsEfwkpwAAr95y9Yvf/O8pt934sIHUXJ9wNeWHQcYywLpHViKkDJan8Gr5RYW5WasY5P+49/yaNiyqvLX/XUdl4Bx/TUKmZV2ptajdef7PaWZs+x13W9W4Q5ruH3tlZ7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6u4rV0MB2QX/u4Dh+nLTm/ZK6li4W3LQlmmwl7eyadY=;
 b=quUTfaZA3C2ortVGgWIobiNmyh4Es2FfIMY4rs6vI0EbOluIjY42BsHpC1Ne9kny7Fbk8OG2RNWUBuaJWpoCWD0uYxVi2dveGqUv0dmXkFnaoCpBSyXV1HSNfm86Y/w2YsuKgqUZA01v37ZLZMWL5f/uANGe5Ebn9AACsdN4CNdUZzMhA31TXc4LkCy1h/tOveZG4vtb+S98FBxH4TizfhISiZmo3I3KUMw8W+1kinxK5Azr9rCZIJ1l5xJjnSMpQdks4/nzlnsObM8KM9ODEr/H30carG4n00ce4JZLGrmYNQiCEcQPRagYEc/qmU7W/z0293AjxFno/lXCH/+rQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6u4rV0MB2QX/u4Dh+nLTm/ZK6li4W3LQlmmwl7eyadY=;
 b=adC858S8JizoyuNmC73GOcR8yzOhNjcY8ZzcybhbVwuGyB2HXQbza8+kBFDVxuDOzK4AEX5h3+O21olIOxT7zZFvuxc6cA+BtxY6CbF1mh311r/VgHM/fhqk0CVnFCMBx2adIDMcI3miP/pf1yLJ0EUitxa73IgjSVOkKOGYg+U=
Received: from CY5PR15CA0138.namprd15.prod.outlook.com (2603:10b6:930:68::20)
 by MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 21:38:27 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:68:cafe::8b) by CY5PR15CA0138.outlook.office365.com
 (2603:10b6:930:68::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 21:38:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Wed, 18 Dec 2024 21:38:26 +0000
Received: from bmoger-ubuntu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Dec
 2024 15:38:25 -0600
From: Babu Moger <babu.moger@amd.com>
To: <reinette.chatre@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <babu.moger@amd.com>, <fenghua.yu@intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <paulmck@kernel.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <jpoimboe@kernel.org>,
	<daniel.sneddon@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<seanjc@google.com>, <xin3.li@intel.com>, <ebiggers@google.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<tan.shaopeng@fujitsu.com>, <james.morse@arm.com>, <tony.luck@intel.com>,
	<peternewman@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <eranian@google.com>, <corbet@lwn.net>
Subject: [PATCH v2 2/7] x86/resctrl: Add SDCIAE feature in the command line options
Date: Wed, 18 Dec 2024 15:37:58 -0600
Message-ID: <134fea73d8394d4d67c9e8eeb69dc877936f6de8.1734556832.git.babu.moger@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734556832.git.babu.moger@amd.com>
References: <cover.1734556832.git.babu.moger@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e24bbd-18d1-400c-fae7-08dd1fac4e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/VavLR6w8uxooLwzXHS7bAGhgOVUuP2IAM9mbfqQNuoPY5XknmZXW3D4WT52?=
 =?us-ascii?Q?lMRbAmhH7MA4UZ6lW5Xs1UdbVankNRHvW4YOSQ1NmnIHpc+ccVvPvVFLrFBS?=
 =?us-ascii?Q?P7K+vrj+9oo8pijSXnOFEYGmvx0mUWAWpPjiwYQ4rBro1YAbSVWIqccIEf8w?=
 =?us-ascii?Q?26KRUq7fHMXbO1kkZivRc4dXTVZAw3ZRh2IdLkSZShp0Zn4ePDDNwhcIBVD+?=
 =?us-ascii?Q?xhupypxm3lcJjJc26fOd5ApQAp11B0moX0Vg5OGxF020vyQxqk34cMYZykcF?=
 =?us-ascii?Q?EOHFwHzdFJuK79mDj/MaCOt5q4D1eblmbQucfGkCxjXFoduh98wf9IJDLteD?=
 =?us-ascii?Q?9azsfHzmGGbiRoS1pS2gjN2IEIzSKPflQ+Gf5lGLBT3cwIXGjDrP2UI1KXNA?=
 =?us-ascii?Q?9R+dXTv1o1f8jcXh7r4BXWNivq8kAeZiPp7ip1Jplyr1Ge1udZYZAAASFpgv?=
 =?us-ascii?Q?5LooU7vxv/F79+XPTHkIh6l9VC85L3jgv9aIlEottqlDEPizbpN14PwJbQmq?=
 =?us-ascii?Q?ofv6D3moo5CPjERLLv76Y4z+SOqTKPb67F5iYy9TIQs+dPiFKqokXn+V60UI?=
 =?us-ascii?Q?fOsU3j+RA6GFPkeUsiMZTwY4Bd7JbWuGMDrXEb6aQxeixIY9FihSfNz3KNw6?=
 =?us-ascii?Q?rMPNj446FhNmF/oNKR8hsR3m0zSrsppkB07EPY4fefuOULG9cF2jkW5OXv2P?=
 =?us-ascii?Q?kLOAU/LOHUDNtg3wvULy7Oa0+Ur1WMysDNqTWId+ldUGCR7SJk0OisFoJV9u?=
 =?us-ascii?Q?OFWKqgNECN3JmznCjTQM3RIq7QWdJhGWV2meUZVT0G/KdcRFp3NLPk1XzPt+?=
 =?us-ascii?Q?gPozUIqZf1PxfFpKqPD15X8Hp7LR9A7GiItaTSt7kozWYx5VuoEyAGemmLLl?=
 =?us-ascii?Q?f0JgwjXPTPNZQlMKf2MAx79zHCjyG+upMHI66joyfX3WP8O65d03wFXQmtaE?=
 =?us-ascii?Q?QGfTImZ6TSOZTNdJIRcWDnny5KmiqEPlm7EF4nYgE3VbbTLVdP/RBHGIXi2L?=
 =?us-ascii?Q?2oK1dpMdvD/2Nf2gqJCespLT9S4j7S26oozcEdRpdGd9g4rOoM0aoKNaVipr?=
 =?us-ascii?Q?dOnqApS2oUOtUuTTnAaVQfsVqW7BTfQzFGGy9PR0+tXGSZCSKCu6uvwA8t/g?=
 =?us-ascii?Q?4/Sz5RM3yAI/0rfDqAwwGGH6qonius9c8vL2RrSY7y/dTNyU2lnaWHocl/wt?=
 =?us-ascii?Q?zakOKoPUPJyx1JEXcVth0qYiSwza1KgFzOVNVYJqFnDbUfGlMGPfkYzlP/lV?=
 =?us-ascii?Q?+1akwIw8El7TF6AZZ0oYQA9TQprX8lUBSaFoP+STudje7hMi7cbzXJcWbWYN?=
 =?us-ascii?Q?VwKcJNSxbgTx4T0Mfa7E/f1/kAaooIEFyxtmhtZVrx2TM7Qs9vbaMwh3ew8e?=
 =?us-ascii?Q?no9Ed8NM3135W7e38ZGU1gBLCg5GXoHRZqbhqVDlrFg+cfsgX4Q3L4E9kMvF?=
 =?us-ascii?Q?2EAcffaTSAucV4lzPcT+cjjUVLpNO+kximh0o3VLcpzr39sRWFWn9HxLF5/u?=
 =?us-ascii?Q?J8Z94Yt+P8QK8nI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 21:38:26.8793
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e24bbd-18d1-400c-fae7-08dd1fac4e9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

Add the command line options to enable or disable the new resctrl feature
L3 Smart Data Cache Injection Allocation Enforcement (SDCIAE).

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
v2: No changes.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 7d427d0a4a1a..8e8efccc1d0a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -5854,7 +5854,7 @@
 	rdt=		[HW,X86,RDT]
 			Turn on/off individual RDT features. List is:
 			cmt, mbmtotal, mbmlocal, l3cat, l3cdp, l2cat, l2cdp,
-			mba, smba, bmec.
+			mba, smba, bmec, sdciae.
 			E.g. to turn on cmt and turn off mba use:
 				rdt=cmt,!mba
 
diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
index 3d1735ed8d1f..c2450cd52511 100644
--- a/arch/x86/kernel/cpu/resctrl/core.c
+++ b/arch/x86/kernel/cpu/resctrl/core.c
@@ -811,6 +811,7 @@ enum {
 	RDT_FLAG_MBA,
 	RDT_FLAG_SMBA,
 	RDT_FLAG_BMEC,
+	RDT_FLAG_SDCIAE,
 };
 
 #define RDT_OPT(idx, n, f)	\
@@ -836,6 +837,7 @@ static struct rdt_options rdt_options[]  __initdata = {
 	RDT_OPT(RDT_FLAG_MBA,	    "mba",	X86_FEATURE_MBA),
 	RDT_OPT(RDT_FLAG_SMBA,	    "smba",	X86_FEATURE_SMBA),
 	RDT_OPT(RDT_FLAG_BMEC,	    "bmec",	X86_FEATURE_BMEC),
+	RDT_OPT(RDT_FLAG_SDCIAE,    "sdciae",	X86_FEATURE_SDCIAE),
 };
 #define NUM_RDT_OPTIONS ARRAY_SIZE(rdt_options)
 
-- 
2.34.1

