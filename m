Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4FF17C9F1;
	Fri, 20 Dec 2024 06:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676417; cv=fail; b=QNaLqBi9B2QWmOXUVO8mSims/I4usxsWJPrcpUSAebsWtXzLJcHU29/gItgdAyCtLw01p7/z73l+NM+UQFDCJEHRLlVNFrJ2nY40NWnkR5rWf/F9/67xOJyv8hBmWUFSy97foLEXEm0F3eAg4SZYNXgtVdO/QMLqoPSPtIZqdUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676417; c=relaxed/simple;
	bh=9daBPYkeQ3TrSUSd0AVbSj+LLkWO8+Pcrz9b3TtyAWk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XriCs1w4ZlFwHe6V5uLsh9DmNYAx3IjL/olUL4HkEfooYv9TriVEwzKa6J2G3RZg+DlnWTEjqiRTkSUk/jjyZOx76M5a7Uf0ueBRGcIkeoc8GGZAeGKQgI2+oykBe8cS2CHyvUFpJowA78l3Gsn8rUcJ43b8iJS1hpUYhsV2l1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2nLkrw6/; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2nLkrw6/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFN5qoidNjS5Vz6MhjOve2TeuHjGyYuO/YkX8BhMQYoWzrlfZ8LXwNMZdabr4e+MYocmXXPa6qsOMhcbTp71XVchRf8R6qMwHeYN1TQNCer1Y0yYCD+n1o9/tUVVBbKF+Hqfrca2Yr8uaK9THJe2hIe5S+8mAjc//fPz1tKTvHVabWczsg7j8yQ5jdAQgjIkTMQcx+hMO4SLm/33WY92nuMt5xLClnGJM3jvSaTBB/pEu03a5yj4pVv/a2cSaME0crRvo6gGENUs//TiB6w16xxz14/qnvtH5J+1L/4wUvxWsWTIJq+5wDazfE+VYWYM81QpWg9Xzed9d+fChCyqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsoL+DZ+qfzpg+7EK/iXOfYqC1dudSac2cOLJeyUccc=;
 b=Nm61fZXmKEjhsfsiCw4YqICJEd/XVULS8UESDE8rm9yOipk8Nil1Ju1i1Nb65pVA2VggMtlQW7DvPEX9sGxk5yHuHnZb0WEtBiyTJ6aFVraKYBuhTx8apeTMi8MO8I+XTgWuX5L8QV/7L3vkQJv9k0chAKg35IkRmIaZBFWHGykITZafd64JGnf7Mkd8be/+PvLH8rftnan6XQity1ED6EOwiIjRMzAtf+GckzRJ7YNl6/pe2eFRPDiTvXsYAXH6P7ogjkZkpWQu6Da2fUKDLmJan7Z2qVBDmeaAi3sQvJ6ACAI0sUSWzZWgbIpaTayEMjGqsWlzvywrZx/oHfDWqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsoL+DZ+qfzpg+7EK/iXOfYqC1dudSac2cOLJeyUccc=;
 b=2nLkrw6/F6w60tID9+rUVzOlr9ccUqWr4nNNxkti+dvyjdYxMp+j+Kk0eG7wAAwwd+Wdxu/9ySQGngLbPjLa7un63zm1nj9n1db/+7zfKvfNhPV3TD8uXbEgLw44soXzAA/cpCGBqvr/3sHLcHyvdfPUJjS9K0qxqLTi7iLUEp8=
Received: from BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::14)
 by PH7PR12MB5808.namprd12.prod.outlook.com (2603:10b6:510:1d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 06:33:32 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::a0) by BY1P220CA0001.outlook.office365.com
 (2603:10b6:a03:59d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.17 via Frontend Transport; Fri,
 20 Dec 2024 06:33:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:33:32 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:33:25 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 1/6] sched/fair: Fix value reported by hot tasks pulled in /proc/schedstat
Date: Fri, 20 Dec 2024 06:32:19 +0000
Message-ID: <20241220063224.17767-2-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|PH7PR12MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: 7789d226-9ce9-4e73-6cec-08dd20c03934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?00umrY3y0T97pxzSneP9yFYorNEKx4+w72Xs8mB9Fuwq4vZ77ukViQVXeVq5?=
 =?us-ascii?Q?qT++BTSUP5Ykbg6tpxJOHbldFZFpJX8cWHpYDgpriNk5FN3NKleIFrSrO2Bb?=
 =?us-ascii?Q?erCOUpWnOzg4Cg+Z41ifrpi5PJafuj5QWNEm4nliIDFXL7KopzaFbLAAfPHc?=
 =?us-ascii?Q?g7rb5KOteK2ysyRs4iH6g/ej/uesVN2w15kldUds373JUPK2sGr9956srKb9?=
 =?us-ascii?Q?80AdaCsxpDdwyTc/CMV5Ji8KJS1FUhXarm8d8Px8sH/FUe+a43UUil3cqsFh?=
 =?us-ascii?Q?YAbpRadhC9qReFXaKCaWApW5mbR/ynd2p5uFjbkFZ94ohwhF2iVnSWby+MHx?=
 =?us-ascii?Q?sJBSnPIZCYVn9vCxy7i9IiMG3I8oCUGLs6OIswLqJi6TnTGBUA/+qqLB8Bj8?=
 =?us-ascii?Q?E0qemRBhuuZdEkoKDHmKUQGzqiyPVBa41ytXWtkkA2uDN1xAvOQPahfDXNsV?=
 =?us-ascii?Q?2BgIem+InkNWw+OX9D2gLicBbelvrU7UzAUpWJONfqpvjXrEGEb2fzt6Kj3t?=
 =?us-ascii?Q?BLRumAARAdxE8CUq0TquIYh6jKlsPd30wPJ4vcsIlPyr9Twb9QIPYAa42C9T?=
 =?us-ascii?Q?PhVcP4LpltCBBdi5zs1YhfWf5sxC23TZVmsh8mpGfsy5qlRwfjzmK7i6Qawx?=
 =?us-ascii?Q?dvI79q4PnJKfSTQWa8ce3vBHCz2hkmUU59N5X+WYj49iIQ/Xgynxgpy9CreQ?=
 =?us-ascii?Q?58i0HcxPaLbso6xyrsmAU0XcI2X5Xjh0xht78ZNMDkqIOAVzDKsSJH44gYAg?=
 =?us-ascii?Q?GW8v1FmJAsoJi/CE5d4YePdkYNS2XvjCsCE4r7fzuJNyCynXxtfyTRdyB3c8?=
 =?us-ascii?Q?Pzk/xlrZxTbYT7nTnvwm4nSB43Ja4Arq4ESqBhG1kzxGfQzi56a0tFayU0UR?=
 =?us-ascii?Q?zlEbGtpapc2GbavUc68bH4IUxABMmM89Ivo1cxFuUQGLDBvKNl1sQ1sgyn9H?=
 =?us-ascii?Q?VzRDeSvqA+sLq+AsgYBjl9Sc/80h7YYfifepg5PoyLuhFZPBAXHSonOVhBoL?=
 =?us-ascii?Q?GvmdjLsqxbnhBV5eGGi2AbGoDveNW9ob94nfLxKH/U6HlJBD1/PoCs/9meT0?=
 =?us-ascii?Q?Zf1gqIlwxXWS78xx5L6H/IomGyrEwUcbBRUqPhOMWY26V0BsEHTmnW2uf9uf?=
 =?us-ascii?Q?Ii3mLw0bI7lpHKaYHCVeQJqvzI3W3zWEO8+pVZcP/sG2hpeLHx9QVhhdnoQ8?=
 =?us-ascii?Q?PPc2PvGaL0ulSZzzGA1yWLBkbC5Jp5rArmicRrYh3EjwfPQjSV4guqpH2ymD?=
 =?us-ascii?Q?iFOnZpT0SGFyLKhpoh5iOwuLwFOxmIZKCxjfE6x2W3FVYbq+rs0R8JrkAVPe?=
 =?us-ascii?Q?950yIr0Ssu+u6Vjgeu1R5RE+sbpSjn28xVZnoG1jUDL9nbKSW6p8j5/1sqyw?=
 =?us-ascii?Q?Tao1Fps8JOtSEkaxEqiPlJOtRAVhwyuWjgdF2SXHfmuodbHvEV3sJH2fXn+y?=
 =?us-ascii?Q?emrHsN9WYTEyu15TowKHDG/tXBWRVszidqP29kcOjKft+4sTBa5mGLf9sLnZ?=
 =?us-ascii?Q?sZDljvRkFhnTZKY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:33:32.0618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7789d226-9ce9-4e73-6cec-08dd20c03934
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5808

From: Peter Zijlstra <peterz@infradead.org>

In /proc/schedstat, lb_hot_gained reports the number hot tasks pulled
during load balance. This value is incremented in can_migrate_task()
if the task is migratable and hot. After incrementing the value,
load balancer can still decide not to migrate this task leading to wrong
accounting. Fix this by incrementing stats when hot tasks are detached.
This issue only exists in detach_tasks() where we can decide to not
migrate hot task even if it is migratable. However, in detach_one_task(),
we migrate it unconditionally.

Link: https://lore.kernel.org/all/20230619092228.GK4253@hirez.programming.kicks-ass.net/

[Swapnil: Handled the case where nr_failed_migrations_hot was not accounted properly and wrote commit log]

Fixes: d31980846f96 ("sched: Move up affinity check to mitigate useless redoing overhead")
Reported-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---
 include/linux/sched.h |  1 +
 kernel/sched/fair.c   | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index b5916be49f62..8c6a2ed9f80e 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -937,6 +937,7 @@ struct task_struct {
 	unsigned			sched_reset_on_fork:1;
 	unsigned			sched_contributes_to_load:1;
 	unsigned			sched_migrated:1;
+	unsigned			sched_task_hot:1;
 
 	/* Force alignment to the next boundary: */
 	unsigned			:0;
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2c4ebfc82917..e66b10da7ac5 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9390,6 +9390,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	int tsk_cache_hot;
 
 	lockdep_assert_rq_held(env->src_rq);
+	if (p->sched_task_hot)
+		p->sched_task_hot = 0;
 
 	/*
 	 * We do not migrate tasks that are:
@@ -9466,10 +9468,8 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 
 	if (tsk_cache_hot <= 0 ||
 	    env->sd->nr_balance_failed > env->sd->cache_nice_tries) {
-		if (tsk_cache_hot == 1) {
-			schedstat_inc(env->sd->lb_hot_gained[env->idle]);
-			schedstat_inc(p->stats.nr_forced_migrations);
-		}
+		if (tsk_cache_hot == 1)
+			p->sched_task_hot = 1;
 		return 1;
 	}
 
@@ -9484,6 +9484,12 @@ static void detach_task(struct task_struct *p, struct lb_env *env)
 {
 	lockdep_assert_rq_held(env->src_rq);
 
+	if (p->sched_task_hot) {
+		p->sched_task_hot = 0;
+		schedstat_inc(env->sd->lb_hot_gained[env->idle]);
+		schedstat_inc(p->stats.nr_forced_migrations);
+	}
+
 	deactivate_task(env->src_rq, p, DEQUEUE_NOCLOCK);
 	set_task_cpu(p, env->dst_cpu);
 }
@@ -9644,6 +9650,9 @@ static int detach_tasks(struct lb_env *env)
 
 		continue;
 next:
+		if (p->sched_task_hot)
+			schedstat_inc(p->stats.nr_failed_migrations_hot);
+
 		list_move(&p->se.group_node, tasks);
 	}
 
-- 
2.43.0

