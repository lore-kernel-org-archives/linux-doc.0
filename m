Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21443156F3F;
	Fri, 20 Dec 2024 06:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676469; cv=fail; b=slC+zX703khNhsd5je4kxNVkLt6QXJ91JD9x/J3AvUEq+2afbNSVn8TDVXjyPzKzvMFTm96U4URVglPKNuvxGyoPysO+HCu2KJ6m3jbDE26Y3H4RxngblYEv5dC9qGEg9ssSqiKpHBDtGONbf2rvwzuQG6GhYwLymyvHGfUAris=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676469; c=relaxed/simple;
	bh=jurCLl3fsIBkjLbXXXO+NlBxUQznbG8299fMfSO1akg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WtH8q9df9e6FSx6LAZvoydrts1+Xr9eFCZ8UG/30hi+yKZZlNe1kvn4L8NzYwz0Q7r8S0uc5wHk+Bsn5U3P8bKauG3JtmQvsNjqkblzqLBBmtxF2m9QD6QzWU/jdJaD3ltYnVmbq/pJxvNEruAGSUCZ+/Nt+jOoc2lj2QexJMKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=etRmqMFd; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="etRmqMFd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BrfFLb4fH0cMkKO/3Ze2c0YnVeBwMzoHExfcnCtgFAhqYNOW6XFVzzQyQfdYM5NfP+8/6DCi9oH26tNYnpMeNC/+JAjHAYg5C030LrLMKA/JcBFN0sJ40DVg2vdoVuENC3Z0Jb81gCjiIc6xg1neDo4abll3vHixzKH4m1UTYi7IoyUVnJjMljCye+hV+UDKB7e6hv5Xe8BSm72jz55OL0xV6vOUocmnkA6TgLIsT8o9EvyginFDG1byH8JLhIPZLzBIXrNBI0vfrx5+2SVTEizBQXEzsWCLkDo6YvHvwQXQl2//K29n6XiUkDA/kZzhpRyTQZieQSuPAtWyObdPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvrT1OYZQZbC0lFEU3j+Bh22hRSC2bnndzc3DYLZwn8=;
 b=OYvDyCRqSak1caSvqWKePFiblR3jyW1tJwIPd+lqTjihNT33kFVKzMSRcytj0AK+FlRyk6N2aH4peEMk/nfhjhx47T6f2TduuOZ1V8188sPPl7SUuqHD9fGsIeflrXg5gscJbh9HZAq3zhzlQBVWN8thg8sK92tAgu4rxrGM08Ts6o+TQPEwlQBJ/B+76tSQ2wO2t3koKOsrLk/+C+QzMT79f5htRFvsby2tceXicQks5trwyKWhST09nXSLu8OqKPadTb2ReR1Bto8VePwLHrlJjsrZZYMMZluOqSwdpVsMerEIyrD08KhBoNMRfUCtzlHEB0aASl4+VlZ+6j6xNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvrT1OYZQZbC0lFEU3j+Bh22hRSC2bnndzc3DYLZwn8=;
 b=etRmqMFd2++6Lv8urZRFLOcWsTM49o0QDkCpT1LOdqtljPNv55XC1sYd5ZWx6Oe193fcRFrUxUm8X7YFBBh9yk4CwcVMpxcuUlcEX7aSzN4SxqHixW1jhBnV5GDtfRkdD1yd0w0Ynzc11dYoO80rzoKuKRs/7b+qqJ8gYR5F7jM=
Received: from BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::13)
 by IA1PR12MB8336.namprd12.prod.outlook.com (2603:10b6:208:3fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 06:34:20 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::1c) by BY1P220CA0007.outlook.office365.com
 (2603:10b6:a03:59d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 06:34:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:34:19 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:34:13 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 3/6] sched: Report the different kinds of imbalances in /proc/schedstat
Date: Fri, 20 Dec 2024 06:32:21 +0000
Message-ID: <20241220063224.17767-4-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|IA1PR12MB8336:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e771e0-e65b-4908-16c1-08dd20c055b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KCmCHmNMv8nFnLwu+e550R4IQuHVdzArW0j0rPWM4gjYvjv5wtgCuIKZpido?=
 =?us-ascii?Q?RKh/WN3KmD7aoHV7cng87yYshDVe/JFNMhMWNxdlanhuUwHJ+9R+Lqb2/G63?=
 =?us-ascii?Q?87RP/ImVlcSlJdv6GgOC8AZI0UbUYP9QdaJ1hmbGEsd5nmWeH+eo5PhXMNc3?=
 =?us-ascii?Q?UMH5rDirRB26lZ2TSN9GObPSiq71p4Ev+kDo9KaSzQvV77WRSkEM7fZihvWu?=
 =?us-ascii?Q?WGPatvdFR+nZFEb6dWykL8aTeZzRZwLmpuceAwYlTbknLldPIfFNj5yRttsI?=
 =?us-ascii?Q?hPgmYA+HJ6d19GhsyRniE6VuWHDdHgTkXTxl4GwVmbT99mevUpYyDrWKGvQr?=
 =?us-ascii?Q?PeAjiDtSAwQBucvluOOa1OAe48DzWBLTjTzLpMDN4Hi5LwtIWVoqCOtEJxR2?=
 =?us-ascii?Q?EI0gIyc0QyIFeVVJZWl3Bv/e2faiDMHw+92PFgzAqPCQvu6CuWhfJqIONl7G?=
 =?us-ascii?Q?fxtfOnqp0DLIoumuGcwAw89u24TgSfx21YNljl/uMDNYsoKNA9siSOWLvN5i?=
 =?us-ascii?Q?JwOMwp+Ec6/5e4Digp+fPG85KAcpNrAt9a2lgVcMBcFjwXLe3yo3FAJpfwiM?=
 =?us-ascii?Q?a8dwhNM8B9+5FFyrFjbsXvsYe77lQvO6WU7sB6tfivhRAYB5dTJKDXA7FJvf?=
 =?us-ascii?Q?lDDYAbYJ26Xd/zF0FFb60xwPrIdfrCiMoLQu260qUqGfGt7Tu3qnsTGbFjOM?=
 =?us-ascii?Q?ABVoA08nWizWdxBdp+G781FGJdXeoNsCYs/KNVTHXHvsiecABZXVpreAnEYh?=
 =?us-ascii?Q?9jTWDB6Y/YqIWcAQ9YFAhc2hFCbYHQ0oMOPNiIhxszWZk27d78XVVnCLKUKP?=
 =?us-ascii?Q?/bd3yoEQkjFoAoSeFvuUsi+PfhWCTp5uJWD638atiamqOpoNueAvbZA/jfT1?=
 =?us-ascii?Q?JiSC52AaR/KCqNyeU5I842HTvYVSMKrYxcGsVUwtJF6jA+iGwTlHdRp09wDd?=
 =?us-ascii?Q?1Lu1PP4EOkJD/SopdsN95Ik6kXUo9MQua0ylKLhO4SYFP6G1pRl36cX9Pf4p?=
 =?us-ascii?Q?NSozAMN7XnLeDtLqCJfcAiuOl9FShSj977mZDnDfpRbDmDKMyFbOFOHV8pN5?=
 =?us-ascii?Q?OJCe6y882sAT6abAj10WJ8rXDX5BEGV6beW2b+COTQnH/D6KMaWBIg2whjKI?=
 =?us-ascii?Q?lf0D9/dMb2oin/9zDCn5WtdGyJKt+j9eaFrupUx5p19F49unpiHSFdoep8Od?=
 =?us-ascii?Q?cjlABXdoweC/f9YpqPIfHbqmmTp4lN6hcnJx7SsVYI0zVzy1goRWuK/guEQ0?=
 =?us-ascii?Q?eqXokTYUWB/EQZl4Kf4xBjcrGozRJgFjmEswikvr0tBsOIUXZILxgxbJhLL1?=
 =?us-ascii?Q?Fo1Ar5VanWvSHXrMbufnqb8wo8d/w/24MGshs0ZLXB9aR2UDNcoGMs/b6Oe+?=
 =?us-ascii?Q?Ci50wWnznOQZBOfm/fzEH5Jhh5tYZnKBCgvgFsZRXvlByLaariwylmm4ksfg?=
 =?us-ascii?Q?UB+MyVxhTsBArCKiRcz3PiSr8CuJNq+N56irHZfV3P4BnHDlFm7HGAsoeMM1?=
 =?us-ascii?Q?yYotGiVoAGBRM9s=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:34:19.8591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e771e0-e65b-4908-16c1-08dd20c055b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8336

In /proc/schedstat, lb_imbalance reports the sum of imbalances
discovered in sched domains with each call to sched_balance_rq(), which is
not very useful because lb_imbalance does not mention whether the imbalance
is due to load, utilization, nr_tasks or misfit_tasks. Remove this field
from /proc/schedstat.

Currently there is no field in /proc/schedstat to report different types
of imbalances. Introduce new fields in /proc/schedstat to report the
total imbalances in load, utilization, nr_tasks or misfit_tasks.

Added fields to /proc/schedstat:
        - lb_imbalance_load: Total imbalance due to load.
        - lb_imbalance_util: Total imbalance due to utilization.
        - lb_imbalance_task: Total imbalance due to number of tasks.
        - lb_imbalance_misfit: Total imbalance due to misfit tasks.

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---
 include/linux/sched/topology.h |  5 ++++-
 kernel/sched/fair.c            | 24 +++++++++++++++++++++++-
 kernel/sched/stats.c           |  7 +++++--
 3 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 4237daa5ac7a..76a662e1ec24 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -114,7 +114,10 @@ struct sched_domain {
 	unsigned int lb_count[CPU_MAX_IDLE_TYPES];
 	unsigned int lb_failed[CPU_MAX_IDLE_TYPES];
 	unsigned int lb_balanced[CPU_MAX_IDLE_TYPES];
-	unsigned int lb_imbalance[CPU_MAX_IDLE_TYPES];
+	unsigned int lb_imbalance_load[CPU_MAX_IDLE_TYPES];
+	unsigned int lb_imbalance_util[CPU_MAX_IDLE_TYPES];
+	unsigned int lb_imbalance_task[CPU_MAX_IDLE_TYPES];
+	unsigned int lb_imbalance_misfit[CPU_MAX_IDLE_TYPES];
 	unsigned int lb_gained[CPU_MAX_IDLE_TYPES];
 	unsigned int lb_hot_gained[CPU_MAX_IDLE_TYPES];
 	unsigned int lb_nobusyg[CPU_MAX_IDLE_TYPES];
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 2ca3f098552c..5e7e4fe81648 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11699,6 +11699,28 @@ static int should_we_balance(struct lb_env *env)
 	return group_balance_cpu(sg) == env->dst_cpu;
 }
 
+static void update_lb_imbalance_stat(struct lb_env *env, struct sched_domain *sd,
+				     enum cpu_idle_type idle)
+{
+	if (!schedstat_enabled())
+		return;
+
+	switch (env->migration_type) {
+	case migrate_load:
+		__schedstat_add(sd->lb_imbalance_load[idle], env->imbalance);
+		break;
+	case migrate_util:
+		__schedstat_add(sd->lb_imbalance_util[idle], env->imbalance);
+		break;
+	case migrate_task:
+		__schedstat_add(sd->lb_imbalance_task[idle], env->imbalance);
+		break;
+	case migrate_misfit:
+		__schedstat_add(sd->lb_imbalance_misfit[idle], env->imbalance);
+		break;
+	}
+}
+
 /*
  * Check this_cpu to ensure it is balanced within domain. Attempt to move
  * tasks if there is an imbalance.
@@ -11749,7 +11771,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 	WARN_ON_ONCE(busiest == env.dst_rq);
 
-	schedstat_add(sd->lb_imbalance[idle], env.imbalance);
+	update_lb_imbalance_stat(&env, sd, idle);
 
 	env.src_cpu = busiest->cpu;
 	env.src_rq = busiest;
diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index eb0cdcd4d921..802bd9398a2e 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -141,11 +141,14 @@ static int show_schedstat(struct seq_file *seq, void *v)
 			seq_printf(seq, "domain%d %*pb", dcount++,
 				   cpumask_pr_args(sched_domain_span(sd)));
 			for (itype = 0; itype < CPU_MAX_IDLE_TYPES; itype++) {
-				seq_printf(seq, " %u %u %u %u %u %u %u %u",
+				seq_printf(seq, " %u %u %u %u %u %u %u %u %u %u %u",
 				    sd->lb_count[itype],
 				    sd->lb_balanced[itype],
 				    sd->lb_failed[itype],
-				    sd->lb_imbalance[itype],
+				    sd->lb_imbalance_load[itype],
+				    sd->lb_imbalance_util[itype],
+				    sd->lb_imbalance_task[itype],
+				    sd->lb_imbalance_misfit[itype],
 				    sd->lb_gained[itype],
 				    sd->lb_hot_gained[itype],
 				    sd->lb_nobusyq[itype],
-- 
2.43.0

