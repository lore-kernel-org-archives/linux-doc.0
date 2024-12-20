Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10A17B50A;
	Fri, 20 Dec 2024 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676447; cv=fail; b=p7edUnm4T+YLPCsHrvWbWb+nQlmB3XrqJ5/SfCW3hW3RgjOUfIcIZ93Nw+c0Vk5B75IdhEwCfOXCbb5jDtzPjc3VVGkgF3lvmZ9sz7o/mFS1NNZE2AYpp6AtZLklNY+X6yLFRvGOncxkSRby8GMZkfox8Y3by1yD9B7+yRgthWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676447; c=relaxed/simple;
	bh=KOTpUXDEOVWUKodQYHLEnpD+DByWLZhmed66VmrTYY4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EdCWNObG6ODkaEtrtjlsOVyt5ejCXc4vbwgcKlatj1mD7p7sUzHJrhgk01IxIstFv4my0sRg6Jc3XbAHElX/20vf6nzP3EmO4jTWrbY5GVyFGsGO2zM5OeZYhlPxEBmktMJqEAqsF1tJNyyq12bgbfoCoOckgDyg81fH/H/LyXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xcCyoY3J; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xcCyoY3J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZgc+6BIp5MTKWAaEHvuxQCuBD3mqzyUHAK+Rfm8dVBYuer6V2tJcR1p5GlKRHUmAzNDaqCC8pZB1h8WxpdyVRuCOX3hzwxnJ4wugNfEWyjvM/0eIZtV9+KUwZjpAKU+IwqUWWavup2liPBuoTkDgcYD8QlgpjWEcc4MydmxincUS21w0Fl8wtfAYL5Eta463/c6Lh+tL5ucBAAhE7Dj6gJPcwSd9dtEiSPU4qbx85B+UB1mzU6RpHSFw9hyKZZ9deubUkIixWXuoYi5tWcJkNzwC4/7iwcCSd0GUZ71vjyktZnzl27045J8YMpTdbCpYgVuOsaU3A3sLahs4ReUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opEvCtK6ycrjSwNX7TPg2f36SVCSU2W7KkI1hU+2p6o=;
 b=gzA0UQM2t3WNd/1bToddqoaj9Bb5K5dZFanJfUI/pOkYqcKZDT2SUQ8OnAA5zjSzyFlud/D+ojdHmMk+xX/zdIDth3V2gNym5OaiW9osiVPovZkqYK54lxvV7Mz7cAZmSBwmYLXEqyKTzvfxitJFUknHRPwDgmRCp/bIBxesK7CfVP4qImvkL5xAaDXnkaTnZp/i3LjY6xbVoZxV4k9jOMTRRdHPM33CI/YHgH3ySuhqV3jp5dppD5xj894SYYEt8V1REqLOohI7XaIQPrAyrAGdxgFdII7ePd2C4cb+sMQUDbvult7GRmazFOvfcUA4cY1SV2oK5jbbIOyNjUJuCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=opEvCtK6ycrjSwNX7TPg2f36SVCSU2W7KkI1hU+2p6o=;
 b=xcCyoY3JTGBXZ3YY22jibidzscgqag0xJrV8NRtrkOH9PFVJDqQnBEby45Th8VeLFdJcv3HT/HvH65RxluPlwseKCOfr03WDEfpAwvHcpIu3PRnjRMy7NFbdEZCVouv0yUyBb55hEOfC70t34f0goKY6nOoAE1EWcTnstCabHrc=
Received: from MW4P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::31)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 06:33:56 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::85) by MW4P223CA0026.outlook.office365.com
 (2603:10b6:303:80::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.24 via Frontend Transport; Fri,
 20 Dec 2024 06:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:33:55 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:33:50 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 2/6] sched/fair: Cleanup in migrate_degrades_locality() to improve readability
Date: Fri, 20 Dec 2024 06:32:20 +0000
Message-ID: <20241220063224.17767-3-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b94eee-bbac-45de-a11c-08dd20c0475b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3leTKRoWLQ18Yxw5sE2kh2q6HqDN20dhJfW/cnk/uc1t0M8BUIbBERhSlA0l?=
 =?us-ascii?Q?vF6K77OHRBQRy/jKIyn8fWMggmyv3EJsb5uw6gziVYVLYMsVaIdItZelW/4a?=
 =?us-ascii?Q?ptAxCiGiThsQrZE8XWgjDeXhS6QpMcPVKdYPQwtna1BcSxiOZQHDsBOvT81W?=
 =?us-ascii?Q?CtZzy1dJH30DDu4xputdJxXazcSJ793LC/FLo+UcZ080fcte3pNm3HMInxJU?=
 =?us-ascii?Q?mSJWsYa+Wh4J1xZAJOycc3BB+7mBq3VyayYzI4toJKAlXvjH+kXVxbe12yI4?=
 =?us-ascii?Q?wZRtdTKlGxoro455GdKq0TToPjgb8euY3Qc6ErzG569q/vacEunVen9rKI9e?=
 =?us-ascii?Q?BD1lMEovleLnrIFFl9nJ7fDdd1vrry/8S3bD5M92SOz+GGn71tQsoxpBRoPH?=
 =?us-ascii?Q?rJO+EXrFI+Xibbu5jpeO7U6nFHEe4GcEC3XHQHlr/LsrjtSJ/CJIh1ds89Ce?=
 =?us-ascii?Q?jVZsHZQxzyFcJKdsGNxj0Bdq7w6kT6uLSzGQy4z58GojKtcb6zF0QSWZgXD+?=
 =?us-ascii?Q?0M/2K8ZV+4flnZ7DH7e/m0wVTaSp4+poDYXulw6FfJHn7vUUZ72xmljxns2R?=
 =?us-ascii?Q?INd0gNIYTbTwB+mOJz6qqWDR01UUUjxii2t8338ecva2n3z10WAPXC0FP/HG?=
 =?us-ascii?Q?XCJ/PLGbEgClIVhWhFUzkkMIRvf4m1kp4YA+qtOttBc/ELIW1Z1t1hiJshMC?=
 =?us-ascii?Q?LetjhxqLe/m/i8lTUIMyrFd6CEYdPhovPmLVDa0EaYwdrzf72NiMBY813uxr?=
 =?us-ascii?Q?lWdj73t4in7LZh4LFSKBey77rIceebhtQytyx3My9SUZJELWI0IX06WNOoUJ?=
 =?us-ascii?Q?DaK+gS4v+HETJ1DCOncY4W38zdxzNPVMkWRQbbEi5fsBV1V3aNL9g64iUdgy?=
 =?us-ascii?Q?NyHrraLuwug71qjLug4MjQ4j8L3METhg0P6h9U0CYRPlxIjHRkyZPDotC2Lo?=
 =?us-ascii?Q?9LpdWXNPvSAnBipMYFhv7cu3a+QAOU6ZL4ly6OwOLX+AmkfJWc7zrgwuRwG+?=
 =?us-ascii?Q?H1wDmQVLQhfOgMTymCAZNo+lAshueJ0GXDs6NbQaAVJ2wWRRiserKTmbBw2b?=
 =?us-ascii?Q?ux1guZwZbVPYOVoLDX2vX5k74wuHsui0l8X3AjvLOM8quLwK57mo/ZQj9b7x?=
 =?us-ascii?Q?MzI6EnoEbThEe7aCxeGM/JDKBj2aXM5bmB0n7zXOv39n/+b2UeEHM3Alkt6h?=
 =?us-ascii?Q?mV4cML0zU4Lsvie3xg2rq+V+hT0Kr3QHt62pqQcHl28A+CJXpYkPe2nZG43U?=
 =?us-ascii?Q?rNnE0PGKEx+sPgkYGAVtMGED3ovjXxjQKMNJwIxai6Yh7I4Q/3K+mAgY1ENo?=
 =?us-ascii?Q?5FhOAvgCR0RlBgAvpWnuEclS1W8SLqds8y76KYNoEuFmkH/UBB1wUqTF0tsK?=
 =?us-ascii?Q?6NcIxSyB9/2ZkZvp8vy3iUIX9PcczukKb3SEhe3FQRVlIIVpgdRFPbibIKzA?=
 =?us-ascii?Q?2RO7QXvwQf1DQdlIQ7PNBO8nGiXYUHhaNWURoX0qI59l9X5THc8Usa2IU/+0?=
 =?us-ascii?Q?5D8nv/KVLFDe14U=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:33:55.8225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b94eee-bbac-45de-a11c-08dd20c0475b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374

From: Peter Zijlstra <peterz@infradead.org>

migrate_degrade_locality() would return {1, 0, -1} respectively to
indicate that migration would degrade-locality, would improve
locality, would be ambivalent to locality improvements.

This patch improves readability by changing the return value to mean:
* Any positive value degrades locality
* 0 migration doesn't affect locality
* Any negative value improves locality

Link: https://lore.kernel.org/all/20230619094529.GL4253@hirez.programming.kicks-ass.net/

[Swapnil: Fixed comments around code and wrote commit log]

Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---
 kernel/sched/fair.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index e66b10da7ac5..2ca3f098552c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -9323,43 +9323,43 @@ static int task_hot(struct task_struct *p, struct lb_env *env)
 
 #ifdef CONFIG_NUMA_BALANCING
 /*
- * Returns 1, if task migration degrades locality
- * Returns 0, if task migration improves locality i.e migration preferred.
- * Returns -1, if task migration is not affected by locality.
+ * Returns a positive value, if task migration degrades locality.
+ * Returns 0, if task migration is not affected by locality.
+ * Returns a negative value, if task migration improves locality i.e migration preferred.
  */
-static int migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
+static long migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 {
 	struct numa_group *numa_group = rcu_dereference(p->numa_group);
 	unsigned long src_weight, dst_weight;
 	int src_nid, dst_nid, dist;
 
 	if (!static_branch_likely(&sched_numa_balancing))
-		return -1;
+		return 0;
 
 	if (!p->numa_faults || !(env->sd->flags & SD_NUMA))
-		return -1;
+		return 0;
 
 	src_nid = cpu_to_node(env->src_cpu);
 	dst_nid = cpu_to_node(env->dst_cpu);
 
 	if (src_nid == dst_nid)
-		return -1;
+		return 0;
 
 	/* Migrating away from the preferred node is always bad. */
 	if (src_nid == p->numa_preferred_nid) {
 		if (env->src_rq->nr_running > env->src_rq->nr_preferred_running)
 			return 1;
 		else
-			return -1;
+			return 0;
 	}
 
 	/* Encourage migration to the preferred node. */
 	if (dst_nid == p->numa_preferred_nid)
-		return 0;
+		return -1;
 
 	/* Leaving a core idle is often worse than degrading locality. */
 	if (env->idle == CPU_IDLE)
-		return -1;
+		return 0;
 
 	dist = node_distance(src_nid, dst_nid);
 	if (numa_group) {
@@ -9370,14 +9370,14 @@ static int migrate_degrades_locality(struct task_struct *p, struct lb_env *env)
 		dst_weight = task_weight(p, dst_nid, dist);
 	}
 
-	return dst_weight < src_weight;
+	return src_weight - dst_weight;
 }
 
 #else
-static inline int migrate_degrades_locality(struct task_struct *p,
+static inline long migrate_degrades_locality(struct task_struct *p,
 					     struct lb_env *env)
 {
-	return -1;
+	return 0;
 }
 #endif
 
@@ -9387,7 +9387,7 @@ static inline int migrate_degrades_locality(struct task_struct *p,
 static
 int can_migrate_task(struct task_struct *p, struct lb_env *env)
 {
-	int tsk_cache_hot;
+	long degrades, hot;
 
 	lockdep_assert_rq_held(env->src_rq);
 	if (p->sched_task_hot)
@@ -9462,13 +9462,14 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
 	if (env->flags & LBF_ACTIVE_LB)
 		return 1;
 
-	tsk_cache_hot = migrate_degrades_locality(p, env);
-	if (tsk_cache_hot == -1)
-		tsk_cache_hot = task_hot(p, env);
+	degrades = migrate_degrades_locality(p, env);
+	if (!degrades)
+		hot = task_hot(p, env);
+	else
+		hot = degrades > 0;
 
-	if (tsk_cache_hot <= 0 ||
-	    env->sd->nr_balance_failed > env->sd->cache_nice_tries) {
-		if (tsk_cache_hot == 1)
+	if (!hot || env->sd->nr_balance_failed > env->sd->cache_nice_tries) {
+		if (hot)
 			p->sched_task_hot = 1;
 		return 1;
 	}
-- 
2.43.0

