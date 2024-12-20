Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841E970818;
	Fri, 20 Dec 2024 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676390; cv=fail; b=qhHvlOVwbQTrGESmELq7ZY9CpW66Za9CADOlOioZfHS6rz0PenPqtCpudQvkOmAflJMQT55c86G9eY3RBvp13stRhUEgPwKzGlPtiWPPcO1Ldx05E5r12EJLKBbCQcbpAwrnPNl/GmIqm6ZX3u+au+hHEbNWecI/Wc8WduRdJUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676390; c=relaxed/simple;
	bh=euAFq8OaWay2KmYWhVt6CRIWcN57v6DXv7o0NPs/7Bw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IGqxBzDLJxWiUso5MUKPtm0AMCRKa/Tmv9z2yfV0XLRDYvM4HUQVzGZ9dmEkUIXYp2haFSWLzcXDK0ju4cgjdYUNeryRP1TKuw3WV2Ka5otmEAITdwhRwG7WX/V1JmfkeZQWubqXH0vsrUxPJptYNAsd2INijfb4HUbORy/Ywbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QbPSE23l; arc=fail smtp.client-ip=40.107.237.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QbPSE23l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXwcyyAD+JbNV/V7TNvRiceD7xUOt8DywzbruDam5ekCQiJjD7z6jaEKda4rxv8VDc/hgSqeRB6JlG25fcUXinlF8/ZP1QLCccaCK0KHPTLHb8zwxNx1aboSsIAWyF3yGPB7QJOMobIR1EzqH+6XzFU6A+FPYPHrkckF4eOp4b9MhvO67imwM8wOWazS+H28oIWn6IbBHZl3ion3RLKZ58mgLYUs5cg/Jam2sZvVANRhNWLGHIwFQo75rS1R6J8q3iEFji1qh1sxvQnoV3/7OlSIH7ZDDbf5H5Mk1E7AQcFdAC9O1qmf5Dke5l9ysMha026J/SYDUCOmjsCbn4SRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAZAVVQiXEdtJJ8yb09kaJPkl0ltoWOpallEuTBUKlM=;
 b=c+KN1r6nyWUFINjeCYrQhn3P6EzswleuePszeUCDh9Xk0uKRN0SvE4s/xoi3on9ntCbszTQhmJ6Lb5lHZp+IqLEuoskb4gctXH9+YYe4bv0/YtwoOfvgYRxvvqlDBqFxUzKghN1RnmHVCouCSW7l5ai/gd66bdJIO2HaSO7Wk0yA5/P/tICp16b6BDN9CXSia0fahkOe4Ze/FHw1AAVxU+4CcDsWPjh6Gi//mOlWhOf8J8UH6r5oTeoBNfZa0BeDCkxNB3eqLyj8gWYVwBGNnSuOclrLAaz3PXyOjQLbiIXlsfIQcGd+JeMwf+wCYhnDKjE/WOFWJEFJvXZivjZ4mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAZAVVQiXEdtJJ8yb09kaJPkl0ltoWOpallEuTBUKlM=;
 b=QbPSE23lhuoC5cKH24wY4AxEc6vTxivDswf/MPI03sZTt57QYL2MhyuV59LosC2A4l9PpQT4bVuQJsvpCY8HcjRuBTHtD9WJ8yOfVy13mlmKGh5W3c+dcKRGu4sV6ywf5tvIrEOLxhzRSG1afPwgIjr1OXayD8vpasEM4p5DrLg=
Received: from MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::31)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 06:33:04 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::d0) by MW4P223CA0026.outlook.office365.com
 (2603:10b6:303:80::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 06:33:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:33:03 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:32:56 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 0/6] Fixes and improvements in /proc/schedstat
Date: Fri, 20 Dec 2024 06:32:18 +0000
Message-ID: <20241220063224.17767-1-swapnil.sapkal@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: ca9df6e9-4dbe-4c43-9550-08dd20c0285a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gCFm1SOQNro/OwGCsZkis7qyAwtavSB90XCcz1eqnc4L3CXxw8rOe7tfWtRJ?=
 =?us-ascii?Q?7KXahTxsYgEv0wvw1MbgQo7obNZfV0Ed+P3zJXyz2z08yYt7kehkaSd7k3Cl?=
 =?us-ascii?Q?ut02GTPGOL9NgjoVHohX6uS+rf+l6qtp8Dd6QECkcJ4NGmSLyw7jqg6cuRs0?=
 =?us-ascii?Q?lTrE781TpirTiKlxwSAca7MStNLAwt6V24GbNaKCc3fbpuEpuyM6CegctDnn?=
 =?us-ascii?Q?lHv7ScPCfgWM8h0uygCav6J2P5QLo3mF17rk6Fn4f7sRWnw0lSZ9xfPu1ASK?=
 =?us-ascii?Q?bglLBHTHwu14kzjWB3kbwEOQcQVL0keCqPz5KYWs0Qw6V1OzuXfXLuEa2DmR?=
 =?us-ascii?Q?rf8d0gerWWRHvUhQIAp2+82uF37JNEXA1hQkVZsJkMjm+EhrLUMIvRLj9glJ?=
 =?us-ascii?Q?g1OpvVQYA47K80zRcEkhDmCvjzb0GotHrl1aK6f3hkbm+VPxQxxZffIObLM/?=
 =?us-ascii?Q?Q9ggdxj9X5rs2/ZQ2kKaxjDJmxpSghaMeC/kPRSvjWEXiAI9qAloMxntLhV6?=
 =?us-ascii?Q?17UXOQoliV4Qg0/73bWOgORTX2uk1NIygq3jZMUYD14MtJMvNxv7poCjoWWF?=
 =?us-ascii?Q?dHEQVJjRZc1qckcn8vC58kJsCOpMYCxriElb8WJQY4OVYO75Ew3720oFfERf?=
 =?us-ascii?Q?oAeVMG96M6oiIKCrtnGIrQTGuN84++dm+YO72l+qj22sq79biDGBdhpuS3rI?=
 =?us-ascii?Q?10AcJJQTWdyq8ZktvziuitGMz++B49GEO/VQOp9vVvTSlH1jMWFzvbL7Qio9?=
 =?us-ascii?Q?SXpjYzEgPtJFiRBhglI8Zt75YQ5gDzAMGK36UaPJgLnkrL1OvG8saVrWbcVh?=
 =?us-ascii?Q?Jc0tDU2T+qzb+ecDXvMMYBNKiKQ6ciakoCpmFSxMG+NaHofUYD1zAfhOx0Bk?=
 =?us-ascii?Q?bF8aoPcwxi0jcyfarzvIk8wXKqQZfHWh/Xpp21Anu5iPdqmODdsE7t4WYuo6?=
 =?us-ascii?Q?IYKdkOdn7ivLqvc5TVqo1k942A54Ra/SjAFUj4G+Xfxik8OXCWFLofApJx/k?=
 =?us-ascii?Q?Y8TUosAEP9aclF+lnmyWuprVyera58N45MLENwgpi6OBVIBYa6urvbo39b7B?=
 =?us-ascii?Q?S8qybghM/euF/MG//BaSiQi6vpEgpeJaxXn/mBL2IQuzINcsoXJfF+W+QZPr?=
 =?us-ascii?Q?w6iux79HZSi9iUBiafyFnV1MIcMooU1kepzLf9vIiMvA4RD2GwUODNee5q+0?=
 =?us-ascii?Q?I5k/QPCzjQmNrycz+w7PHP5mPwnftwwcx2yYQ/uUim5ti7c8VxGAFiPTHoPd?=
 =?us-ascii?Q?xphD1cB79Zox8Tqek0dG5FLoNlby/8Jj+POwgK+corOIigGzqlbqvIe49NQ4?=
 =?us-ascii?Q?WawTK8ejGHq2sG02q+ZKGPDyqdOsFyESeEQHJZgbFzbaQwqUQ1a7I3ey6ogM?=
 =?us-ascii?Q?FUm/hFoM3n0H+e5cG7iXWYh5eCHXW6IzJ2e17P1C83rCgidEfDKDUioCLFUu?=
 =?us-ascii?Q?53jY2F/jikFELGt+LOKdCde+Vd9Dg8dH7SKALmvNmHiBUSQio1z96PYv+FcX?=
 =?us-ascii?Q?Qn09gBpm/dABnxQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:33:03.7594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9df6e9-4dbe-4c43-9550-08dd20c0285a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804

This patch series adds fixes and improvements to /proc/schedstat. Patches
are based on top of tip/sched/core commit 7675361ff9a1
("sched: deadline: Cleanup goto label in pick_earliest_pushable_dl_task")

Patch 1 and 2: In /proc/schedstat, lb_hot_gained reports the number of
times cache-hot tasks were migrated as a part of load balancing. This
value is incremented in can_migrate_task() if the task is cache hot and
migratable. But after incrementing this value, it is possible that the
task won't get migrated, in which case this value will be incorrect.
Fix this by incrementing it in detach_task().

While at it, cleanup migrate_degrades_locality() by making it return an
enum instead of the {-1,0,1} to improve the readability of
can_migrate_task(). Previously these patches were sent here[1].

Patch 3: Adds new fields to /proc/schedstat. Previously this patch was
sent here[2]. This change is intended to be a part of v17 of
/proc/schedstat.

In /proc/schedstat, lb_imbalance reports the sum of imbalances discovered
in sched domains with each call to sched_balance_rq(), which is not very
useful because lb_imbalance does not mention whether the imbalance is due
to load, utilization, nr_tasks or misfit_tasks. Remove this field from
/proc/schedstat.

Currently there is no field in /proc/schedstat to report different types
of imbalances. Introduce new fields in /proc/schedstat to report the
total imbalances in load, utilization, nr_tasks or misfit_tasks.

Patch 4 and 5: Currently, there does not exist a straightforward way to
extract the names of the sched domains and match them to the per-cpu
domain entry in /proc/schedstat other than looking at the debugfs files
which are only visible after enabling "verbose" debug after commit
34320745dfc9 ("sched/debug: Put sched/domains files under the verbose flag")

Since tools like `perf sched stats`[3] requires displaying per-domain
information in user friendly manner, display the names of sched domain,
alongside their level in /proc/schedstat to aggregate domain level stats
if domain names are shown in /proc/schedstat. But sched domain name is
guarded by CONFIG_SCHED_DEBUG. As per the discussion[4], these patches
moves sched domain name out of CONFIG_SCHED_DEBUG and prints sched
domain name in /proc/schedstat.

Patch 6: Updates the Schedstat version to 17 as more fields are added to
report different kinds of imbalances in the sched domain. Domain fields
also started printing sched domain name.

[1] https://lore.kernel.org/all/20230614102224.12555-1-swapnil.sapkal@amd.com/
[2] https://lore.kernel.org/lkml/66f1e42c-9035-4f9b-8c77-976ab50638bd@amd.com/
[3] https://lore.kernel.org/lkml/20241122084452.1064968-1-swapnil.sapkal@amd.com/
[4] https://lore.kernel.org/lkml/fcefeb4d-3acb-462d-9c9b-3df8d927e522@amd.com/

v1: https://lore.kernel.org/all/20241218043629.1142651-1-swapnil.sapkal@amd.com/
v1->v2:
- Used __schedstat_add() instead of schedstat_add() to avoid calling
  schedstat_enabled() multiple times [Peter Zijlstra]
- Fixed the commit message in patch 2 as it was not consistent with
  comment in the code in v1

K Prateek Nayak (1):
  sched/stats: Print domain name in /proc/schedstat

Peter Zijlstra (2):
  sched/fair: Fix value reported by hot tasks pulled in /proc/schedstat
  sched/fair: Cleanup in migrate_degrades_locality() to improve
    readability

Swapnil Sapkal (3):
  sched: Report the different kinds of imbalances in /proc/schedstat
  sched: Move sched domain name out of CONFIG_SCHED_DEBUG
  docs: Update Schedstat version to 17

 Documentation/scheduler/sched-stats.rst | 126 ++++++++++++++----------
 include/linux/sched.h                   |   1 +
 include/linux/sched/topology.h          |  13 +--
 kernel/sched/fair.c                     |  77 ++++++++++-----
 kernel/sched/stats.c                    |  11 ++-
 kernel/sched/topology.c                 |   4 -
 6 files changed, 140 insertions(+), 92 deletions(-)

-- 
2.43.0

