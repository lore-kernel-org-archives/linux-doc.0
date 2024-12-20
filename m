Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EB3156F3F;
	Fri, 20 Dec 2024 06:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676531; cv=fail; b=qPjpbt2Vj02WnUqWdJW2TTa+cKJ50hguA8TpRDaXZtR/ZzLPLvsYfKIaa/JpBw73wi5qECfxc9B49Y0ZrQ5RT4yKj9LTLD854IBq51AVveGWMXGsp+aXhfMEJ3pHXwsx/9W3JU8gdO+pDzg2GXsBc8Sq1iJE951tx1ngQwODLQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676531; c=relaxed/simple;
	bh=zjkgX7oTkOvnJaYR9WoganUX+QyOqwPABe5PXLp/Kto=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m/l6SupoSmdYvcN9hMljUi+WnM8ytXwnLQ7j5UXInEhwR02t2EM/bUWH+THWpFnKvz3C6n2gzhA2l0i3kaSgGXuuu9fQygVSNFYPEoJ7i+7lD7ProAlDuxfgGGhJ3W+ZGA6iXGdGMwJ0bFSGfXmQyUaxPkeXPu1l3bgbpT1G1ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E6f4ZyRB; arc=fail smtp.client-ip=40.107.92.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E6f4ZyRB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht/Ot2f/APjb8xpD0Cuc/iiK7IU2uO/WyefqZbCgO2jDG7ZqX/WafJcwPxHag51iuGcDtxJJz1++ydoSgdoMhtiayTERaWXVsoZYmfw+WJ/FM2Kb7W6rW/i+fP5SBWRCLtC7/6eh5cfqZiMLVoose6cGZ1O0UEbygC8B1vGMQHjgk2qWimvrpC2Ds0BYbGa0cux+x6aZ0p7gUmtKhUQQbwXlHoJ6vm25KMxwlUo64xx3JHf9CCEIthR/oIX8/n2lJohM9kYGgQIxcD1T5n9ksVDz0+9LUlQa+r3K+CMdQXEdhSvdhGHGjTJUMVooKA8/vWPTiIVHDxCqX3CaHbWNvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49zHcmM+ujdQPqYTRPu5KLUIVTw9o0pIOBx8sUfcZ4U=;
 b=yEjP8CbIF0wL5IWf2pui3tBr5xWrQvgAshrC8J2Ahd41eCv4T0O/TeJhedUAyvchGb8c2nmGTCLCFSZeuZ4J0jRnBUAEHC7tykPx9eKXB6kiXzMkqBiaolqd2s5ABdOquMtLvK0xXJZpxLDMn0X4kBL46Z5ToxtiTSAMIg1ybI59fQE+DcJDpvdC23euGOvptNG20RiZMsS6n2yBGZvTkgM1YsrAHzDjleaAXODvYaxfvFiNJgRPq0Vqkuh/9/DLC8o2B9vngejtDO9lqyiNY3ntJBGTL5xi/KXsHQVb1F71Ch1qfGgM5/GuQN9UG38rukloH+gPgJn4xq/+bD0c0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49zHcmM+ujdQPqYTRPu5KLUIVTw9o0pIOBx8sUfcZ4U=;
 b=E6f4ZyRBh/M+JFVFXsLC1w00EYhM/QPiJVyqGhoLRROusz63HEU4P0azZueEmgAOXKhY2LiqAKI0ogw07rJE/ZmdWv3Qox4NKHKY9qt6ZluS0fVt7yd9HA+F4fKgBoFCTaHZBmaIhhxSBNsXEMfIoemw/rNzpwpyj3Zbh6jNgFA=
Received: from MW4P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::30)
 by LV3PR12MB9235.namprd12.prod.outlook.com (2603:10b6:408:1a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 06:35:25 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:303:114:cafe::11) by MW4P222CA0025.outlook.office365.com
 (2603:10b6:303:114::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Fri,
 20 Dec 2024 06:35:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:35:24 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:35:18 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 6/6] docs: Update Schedstat version to 17
Date: Fri, 20 Dec 2024 06:32:24 +0000
Message-ID: <20241220063224.17767-7-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220063224.17767-1-swapnil.sapkal@amd.com>
References: <20241220063224.17767-1-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|LV3PR12MB9235:EE_
X-MS-Office365-Filtering-Correlation-Id: 6960102b-ae32-4d88-7305-08dd20c07c60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?n2JtF1ybjWKNtr7cZ4ZVSGqJc7cK6d2juSKPeXZipazM7NTVcGHirSN6dHrq?=
 =?us-ascii?Q?lhsb8+MDm79UjxqmBBj4zgL8DsMerQHpz3Tr1ZGIRJlDDP5IHiUrhNeCZFJ0?=
 =?us-ascii?Q?I+MigMT4fNAlacSSty/NRib+uz7uV/dKa8z6b3XvoKzgkYVRozE/jgNx1yII?=
 =?us-ascii?Q?tmvdp3rmUWIeWg2VOfqzpl56uxEX5f0skZPB04Be1TPLj4BHOaaGntPIpgJL?=
 =?us-ascii?Q?NyzdetJYKvvtK8xRoupXupe3oCqffAlDcOjsIT9pxzygCK9GfO3h51z/GfDA?=
 =?us-ascii?Q?srNENyivRjziyClifQXCHAj6mznZ9uCxK+ufWXslSViPrNJsqANXYJHfnmEb?=
 =?us-ascii?Q?0XSJ2taSPy2b6ZBqDTulX03vFVXpJkF+aafQSRNqANoEn0u9hB2hLEYqyred?=
 =?us-ascii?Q?ZTT0IYbrGH6Dz1159r5RPuKQ9YwH1CRpdjaepKszdDsTUFtlR7S7WvcQXLi0?=
 =?us-ascii?Q?VSjOwdcTHEiOQ+BsFOYjYueinAYmEnOdHlTgi0sKFdxay9DkCanhm6uUdYXA?=
 =?us-ascii?Q?Sohmlq8Lwr4SKTodSDgGWqjH2DupFS749QOk4ej9EdvhzRt7aT+N2HGRWOrY?=
 =?us-ascii?Q?/pv2+PcSlA9EtzhUOeEtYDwyDEyZzxSxzl97BFLQYIy5ehf3dhYy4mo9zvZc?=
 =?us-ascii?Q?ceS+/Jm0nZYQVuhokgkUW8ESDcvIeKP9lbeUE0vuoTsj71i87iKzLJ7YjwBb?=
 =?us-ascii?Q?eOvrEnGX4yf4hX8AueLOCzjARMXZyHVPfmLEaM9qTpnGHq9mJ6Cmhksuuw3L?=
 =?us-ascii?Q?5xg/0yzKXsB07wF84APm44cUxGrPIlKAiHOn0lzT5KGMXfhwudYhSXS60Kp/?=
 =?us-ascii?Q?UD4lUNk37m31x/D67LZxiucb53zqsyuf35eC2hrESmocquMd76aG9e5L97L6?=
 =?us-ascii?Q?hGWBwx3pQhiinhdqshfk+bKdI52LVzuXSxQYjHjXHIjqjgNCFWctqVZrTCE9?=
 =?us-ascii?Q?/MDpuqH/3tUPztUlRq9nY4iF+Q5EN90z6t9afhWllOUP7rb3Fz7ymxlEP9WJ?=
 =?us-ascii?Q?cEqP+1moJuRodOmh4NiMtAFYxQeI3uJmw1AMu+fkyDpdI3GF7Dv6D74PxLND?=
 =?us-ascii?Q?hYnLCf/RbO+t0IY2Mh9fTAJiXTjncHvLfJyZyqOvhBoWuljblLD/ZCeRM0SS?=
 =?us-ascii?Q?7v6kMg3tEKgA4FXDVwWR7JP87nan/B/WtVDfqi17kYC4Tu4UMl7HNiZvb4V0?=
 =?us-ascii?Q?e2amAXmSvn1gRXvg2TviscUIpxfolZ5vZNUfxUIJrNAh9DIYeRZLMVyINM0H?=
 =?us-ascii?Q?LGmkVO+1X4ZSYU2kuXjdqHRFyZx89ywl+ZUPD+sY/GVFCWpz4Nz1dzZ6EgEV?=
 =?us-ascii?Q?KTwV3JGiS5wIur47Ab0eS715RMO12SRCq5m4uH5hhVDFSz8yRHwD+zjNSnLP?=
 =?us-ascii?Q?VfafA/Znuz01mhX0F39oPmOE32i0v9DW67gIUAOWmSOxAe4rqJecgTAhvhRt?=
 =?us-ascii?Q?oaIJOcNcCmZ2ST38V9YxXI0xoqZQwcxn+LXhvyPdLGYlbQ6rylFzpA0eNu/+?=
 =?us-ascii?Q?FTN9qWp2IGn4t2k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:35:24.7421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6960102b-ae32-4d88-7305-08dd20c07c60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9235

Update the Schedstat version to 17 as more fields are added to report
different kinds of imbalances in the sched domain. Also domain field
started printing corresponding domain name.

Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---
 Documentation/scheduler/sched-stats.rst | 126 ++++++++++++++----------
 kernel/sched/stats.c                    |   2 +-
 2 files changed, 76 insertions(+), 52 deletions(-)

diff --git a/Documentation/scheduler/sched-stats.rst b/Documentation/scheduler/sched-stats.rst
index 7c2b16c4729d..caea83d91c67 100644
--- a/Documentation/scheduler/sched-stats.rst
+++ b/Documentation/scheduler/sched-stats.rst
@@ -2,6 +2,12 @@
 Scheduler Statistics
 ====================
 
+Version 17 of schedstats removed 'lb_imbalance' field as it has no
+significance anymore and instead added more relevant fields namely
+'lb_imbalance_load', 'lb_imbalance_util', 'lb_imbalance_task' and
+'lb_imbalance_misfit'. The domain field prints the name of the
+corresponding sched domain from this version onwards.
+
 Version 16 of schedstats changed the order of definitions within
 'enum cpu_idle_type', which changed the order of [CPU_MAX_IDLE_TYPES]
 columns in show_schedstat(). In particular the position of CPU_IDLE
@@ -9,7 +15,9 @@ and __CPU_NOT_IDLE changed places. The size of the array is unchanged.
 
 Version 15 of schedstats dropped counters for some sched_yield:
 yld_exp_empty, yld_act_empty and yld_both_empty. Otherwise, it is
-identical to version 14.
+identical to version 14. Details are available at
+
+	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/scheduler/sched-stats.txt?id=1e1dbb259c79b
 
 Version 14 of schedstats includes support for sched_domains, which hit the
 mainline kernel in 2.6.20 although it is identical to the stats from version
@@ -26,7 +34,14 @@ cpus on the machine, while domain0 is the most tightly focused domain,
 sometimes balancing only between pairs of cpus.  At this time, there
 are no architectures which need more than three domain levels. The first
 field in the domain stats is a bit map indicating which cpus are affected
-by that domain.
+by that domain. Details are available at
+
+	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sched-stats.txt?id=b762f3ffb797c
+
+The schedstat documentation is maintained version 10 onwards and is not
+updated for version 11 and 12. The details for version 10 are available at
+
+	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/sched-stats.txt?id=1da177e4c3f4
 
 These fields are counters, and only increment.  Programs which make use
 of these will need to start with a baseline observation and then calculate
@@ -71,88 +86,97 @@ Domain statistics
 -----------------
 One of these is produced per domain for each cpu described. (Note that if
 CONFIG_SMP is not defined, *no* domains are utilized and these lines
-will not appear in the output.)
+will not appear in the output. <name> is an extension to the domain field
+that prints the name of the corresponding sched domain. It can appear in
+schedstat version 17 and above, and requires CONFIG_SCHED_DEBUG.)
 
-domain<N> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36
+domain<N> <name> <cpumask> 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45
 
 The first field is a bit mask indicating what cpus this domain operates over.
 
-The next 24 are a variety of sched_balance_rq() statistics in grouped into types
-of idleness (idle, busy, and newly idle):
+The next 33 are a variety of sched_balance_rq() statistics in grouped into types
+of idleness (busy, idle and newly idle):
 
     1)  # of times in this domain sched_balance_rq() was called when the
+        cpu was busy
+    2)  # of times in this domain sched_balance_rq() checked but found the
+        load did not require balancing when busy
+    3)  # of times in this domain sched_balance_rq() tried to move one or
+        more tasks and failed, when the cpu was busy
+    4)  Total imbalance in load when the cpu was busy
+    5)  Total imbalance in utilization when the cpu was busy
+    6)  Total imbalance in number of tasks when the cpu was busy
+    7)  Total imbalance due to misfit tasks when the cpu was busy
+    8)  # of times in this domain pull_task() was called when busy
+    9)  # of times in this domain pull_task() was called even though the
+        target task was cache-hot when busy
+    10) # of times in this domain sched_balance_rq() was called but did not
+        find a busier queue while the cpu was busy
+    11) # of times in this domain a busier queue was found while the cpu
+        was busy but no busier group was found
+
+    12) # of times in this domain sched_balance_rq() was called when the
         cpu was idle
-    2)  # of times in this domain sched_balance_rq() checked but found
+    13) # of times in this domain sched_balance_rq() checked but found
         the load did not require balancing when the cpu was idle
-    3)  # of times in this domain sched_balance_rq() tried to move one or
+    14) # of times in this domain sched_balance_rq() tried to move one or
         more tasks and failed, when the cpu was idle
-    4)  sum of imbalances discovered (if any) with each call to
-        sched_balance_rq() in this domain when the cpu was idle
-    5)  # of times in this domain pull_task() was called when the cpu
+    15) Total imbalance in load when the cpu was idle
+    16) Total imbalance in utilization when the cpu was idle
+    17) Total imbalance in number of tasks when the cpu was idle
+    18) Total imbalance due to misfit tasks when the cpu was idle
+    19) # of times in this domain pull_task() was called when the cpu
         was idle
-    6)  # of times in this domain pull_task() was called even though
+    20) # of times in this domain pull_task() was called even though
         the target task was cache-hot when idle
-    7)  # of times in this domain sched_balance_rq() was called but did
+    21) # of times in this domain sched_balance_rq() was called but did
         not find a busier queue while the cpu was idle
-    8)  # of times in this domain a busier queue was found while the
+    22) # of times in this domain a busier queue was found while the
         cpu was idle but no busier group was found
-    9)  # of times in this domain sched_balance_rq() was called when the
-        cpu was busy
-    10) # of times in this domain sched_balance_rq() checked but found the
-        load did not require balancing when busy
-    11) # of times in this domain sched_balance_rq() tried to move one or
-        more tasks and failed, when the cpu was busy
-    12) sum of imbalances discovered (if any) with each call to
-        sched_balance_rq() in this domain when the cpu was busy
-    13) # of times in this domain pull_task() was called when busy
-    14) # of times in this domain pull_task() was called even though the
-        target task was cache-hot when busy
-    15) # of times in this domain sched_balance_rq() was called but did not
-        find a busier queue while the cpu was busy
-    16) # of times in this domain a busier queue was found while the cpu
-        was busy but no busier group was found
 
-    17) # of times in this domain sched_balance_rq() was called when the
-        cpu was just becoming idle
-    18) # of times in this domain sched_balance_rq() checked but found the
+    23) # of times in this domain sched_balance_rq() was called when the
+        was just becoming idle
+    24) # of times in this domain sched_balance_rq() checked but found the
         load did not require balancing when the cpu was just becoming idle
-    19) # of times in this domain sched_balance_rq() tried to move one or more
+    25) # of times in this domain sched_balance_rq() tried to move one or more
         tasks and failed, when the cpu was just becoming idle
-    20) sum of imbalances discovered (if any) with each call to
-        sched_balance_rq() in this domain when the cpu was just becoming idle
-    21) # of times in this domain pull_task() was called when newly idle
-    22) # of times in this domain pull_task() was called even though the
+    26) Total imbalance in load when the cpu was just becoming idle
+    27) Total imbalance in utilization when the cpu was just becoming idle
+    28) Total imbalance in number of tasks when the cpu was just becoming idle
+    29) Total imbalance due to misfit tasks when the cpu was just becoming idle
+    30) # of times in this domain pull_task() was called when newly idle
+    31) # of times in this domain pull_task() was called even though the
         target task was cache-hot when just becoming idle
-    23) # of times in this domain sched_balance_rq() was called but did not
+    32) # of times in this domain sched_balance_rq() was called but did not
         find a busier queue while the cpu was just becoming idle
-    24) # of times in this domain a busier queue was found while the cpu
+    33) # of times in this domain a busier queue was found while the cpu
         was just becoming idle but no busier group was found
 
    Next three are active_load_balance() statistics:
 
-    25) # of times active_load_balance() was called
-    26) # of times active_load_balance() tried to move a task and failed
-    27) # of times active_load_balance() successfully moved a task
+    34) # of times active_load_balance() was called
+    35) # of times active_load_balance() tried to move a task and failed
+    36) # of times active_load_balance() successfully moved a task
 
    Next three are sched_balance_exec() statistics:
 
-    28) sbe_cnt is not used
-    29) sbe_balanced is not used
-    30) sbe_pushed is not used
+    37) sbe_cnt is not used
+    38) sbe_balanced is not used
+    39) sbe_pushed is not used
 
    Next three are sched_balance_fork() statistics:
 
-    31) sbf_cnt is not used
-    32) sbf_balanced is not used
-    33) sbf_pushed is not used
+    40) sbf_cnt is not used
+    41) sbf_balanced is not used
+    42) sbf_pushed is not used
 
    Next three are try_to_wake_up() statistics:
 
-    34) # of times in this domain try_to_wake_up() awoke a task that
+    43) # of times in this domain try_to_wake_up() awoke a task that
         last ran on a different cpu in this domain
-    35) # of times in this domain try_to_wake_up() moved a task to the
+    44) # of times in this domain try_to_wake_up() moved a task to the
         waking cpu because it was cache-cold on its own cpu anyway
-    36) # of times in this domain try_to_wake_up() started passive balancing
+    45) # of times in this domain try_to_wake_up() started passive balancing
 
 /proc/<pid>/schedstat
 ---------------------
diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index 5f563965976c..4346fd81c31f 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -103,7 +103,7 @@ void __update_stats_enqueue_sleeper(struct rq *rq, struct task_struct *p,
  * Bump this up when changing the output format or the meaning of an existing
  * format, so that tools can adapt (or abort)
  */
-#define SCHEDSTAT_VERSION 16
+#define SCHEDSTAT_VERSION 17
 
 static int show_schedstat(struct seq_file *seq, void *v)
 {
-- 
2.43.0

