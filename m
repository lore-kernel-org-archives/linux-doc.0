Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004270818;
	Fri, 20 Dec 2024 06:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676488; cv=fail; b=oqR4REobw3UllcdUEKHQw1BjEiV0/TJacqz9xr7JE+3ok1TpAsN+pbKB6ljuIPkaWhFXdr5zwvvYK+VMu6vE9kBuwTBxUDVDrNlZrOCaaz4o3WFPtYpo7kyxSZLUn6SbA2DbZ6xfI6cctwNsQjzzSQpcHPAQfYmqIFcwdpkmJv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676488; c=relaxed/simple;
	bh=QzvYnxLggdomgx0I/3ZLNFQBVVmxRDDubP0cL3ikqqc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TKFQmySawCR0M1J2ti+qi9bqINo5bQuyM3OuT6eeoytr8X05H4KtH2SUjZlJVAKExzQ6mHoxpB+mbU+YJPxSyA309ZIQ/A50SjxlrIGlweL1pXjnXDTlGeAMvYUhs4Bn3ijW8N7uIJBM0O566JkSKjRfMcEKg7RPAeXEzaPpHvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eGqN1T38; arc=fail smtp.client-ip=40.107.244.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eGqN1T38"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyinjkF4vnAe3txxF34WEObP+Oje2vP54cw7zUaZl+NayBaVFdbEA3/+YL6nfq7BRS4LXViggkxbih7zIuCObDa9l4VjYG81k4hZv0/u2E9EF1VguvU553ANbQNw+OwahNTIZD0DTX0YFjPdXjxR24jF1oGzpYmtyyenSZ/k8kyX/0dldkq28ZE1FIzZhYwKyimD3LUZ+qxddtnslesZkVCKTwsMlkPaAmPgZCGBhVAEyzNCGNUUvuX1zP55rG0C5tU84HZkBY++7F5UFburqe8L3uO5hHpTsJiXwh3HYmb7Kr6ylr335XnDllG+M7vwv0SvvTvj3JYWi6sKnJ8+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/8dnpWCsPDcDBlVNBQ03ePZnGE2WchNolW8p8yZILM=;
 b=EFtJEJOihYgy/7D52OdAHrSrr7tGteJ99i/sPi81BKJhI1SMDeWSQXKSlRcG5SUXGXf6a+qNuCc2F7fgQ18I9Y4ZLbt4ZNhadTCW8bF6d6UDB1/llvyUguhj1odua1/19HPC4ahJtCZRGej3iIUR1nv3QDlWB3chSqtmDXA4P4RP7oxTkWWj04DG0itE4S0a1tT63UabIARG9EquZZHjkP9az2nYzuLYF0AoDpD5EbLlEBKctiY6UgP1vqOed0btNji3iQ/mjV52lml/QRKqEhcrngAe3W6IRhd4B4s0edxNZ2JCcrpvBw4n0Qb5Z2K7md25Wr0o3jm3HRDDVVseuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/8dnpWCsPDcDBlVNBQ03ePZnGE2WchNolW8p8yZILM=;
 b=eGqN1T38xwftVMvtm1bbJMrc2QqWVZWr/si693yk7lbvUYuBHTNDw9Q0quqGoX/PEeXf/nnKNvWgRFMGC6v0NSYfidzcciB1F8jeBb5M1ao1h7eUf3R4QoX/xXrLkkqOY/hUS0BEBimloHWnTxaCMtPqDWobo+3HT6hfhCQSy/Y=
Received: from MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::19)
 by CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 06:34:43 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::bc) by MW4P223CA0014.outlook.office365.com
 (2603:10b6:303:80::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Fri,
 20 Dec 2024 06:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:34:43 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:34:37 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v2 4/6] sched: Move sched domain name out of CONFIG_SCHED_DEBUG
Date: Fri, 20 Dec 2024 06:32:22 +0000
Message-ID: <20241220063224.17767-5-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|CY5PR12MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: f91b242c-6e59-4992-4215-08dd20c0638a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2sIaiQlckuiDuOxNISGMfmVh/uaJ7avHklgayX+uVJPKwNQCx24Ya/Zngx4q?=
 =?us-ascii?Q?JC01swe8s5fsTw74vEJapxSw7I9dqa8Gl8Kpyn7IHAowVdryeZe8I/B/29N2?=
 =?us-ascii?Q?NyfAxfPUd/MiJVcI0rcV+rnzr8Sd/9Cs4+olP4EFZO1mfLUyKQraQYC2Rq49?=
 =?us-ascii?Q?1sdMNgYyYTjq2N06ZC+h4u4qo19ze8UiCyNXcnFlEFWaiYDZ+5OjZQgtmlIK?=
 =?us-ascii?Q?m8kmuxa+blU+vT9K0r5m/dpKyArzcMSFsj5VWnqnRC85yAf6IS9pd9V/X/nq?=
 =?us-ascii?Q?GMY57XRz+IMCu3vBxcr/o6l+MGkBW6xjahSW2IInvQ1Px/CXAZ8b31mZihr2?=
 =?us-ascii?Q?5yzkkUYkg03y25QICuB5sNykEBfcZWQBr2kfb7UuX5aUBm7dCUAp75wRVD1W?=
 =?us-ascii?Q?Xs5pasteJQOxdtBGG9KtzEEjgv/h4jO6vti1LnE1yMm/PhuDPJue6y9YWlas?=
 =?us-ascii?Q?AgJy/tQAtFY6yXvDUB6SXiG2jhgLTrmDnQYbe/4CQE0kiNqEOmWM+YXDSEMf?=
 =?us-ascii?Q?CsLqeYSJwJ6baldMjKMp7UKCJjo7i0j9u247bc5C1ay6dGuWU4jIyNODplsy?=
 =?us-ascii?Q?Ur7/lNJ0F0TAOYqPW2Q2kdTfQzsjvg4HvrZrk6KQmXmU85ARd+DchC9kzzt4?=
 =?us-ascii?Q?og5lLi9D/WCCtFkM8jw20MvprajAyG/2UkBpEaQ1zpgSx50ntLruuZSPXFeG?=
 =?us-ascii?Q?GeTi28PpYLARI8Y5qWlOp3OynRK8EeWqTMoT4Pw+ajfvI1kw3RnBnBNDf/Cp?=
 =?us-ascii?Q?uoBo9Tnk3f5EBy5vYlqDrYMuE8kXdL5IIbvofXMFYz8lH4NORaqPq5sfIy9x?=
 =?us-ascii?Q?+hiKnxEaVqYi+EydD9AnRyjVjpqeOfF+AbsRBEm+KWFagDwrznJPIPH7sdWi?=
 =?us-ascii?Q?tRugDwp/ZABoBEdTSEKoNV4hgjqCHf4mevheQFKX2FXDCioLZm/Vr5JI2Yoi?=
 =?us-ascii?Q?GOVnqhJUxBbQLUFT8YNc67scLBFZiSpfzjL24PV/3lF5ew5GOtxP+JrHlCk5?=
 =?us-ascii?Q?b7kGS42DEzaBQZk7suH1cu0H7thy7pnmCzPPBJyUQzPITaCO28S1j2rQyBsJ?=
 =?us-ascii?Q?glzWFWiCbGN1yUoUmxgXZgjmzQxvIvs7se3Fc1D8WKUsPstDaXyEhxsKg6+7?=
 =?us-ascii?Q?jZ3ol9sS+f/6wwbtSz/yQzuRdwbHYyZdDe4CaAWmaz+SVP8cbFzqkSU7Voyd?=
 =?us-ascii?Q?PZwI5n64ALI93aewkQ5CwRbBFSmYT34MxjF8ChND7nEsyPr9mPvNCa/bWhx1?=
 =?us-ascii?Q?ZVdmFEF1OCpEXkw9OOQDpyYlqZkSGbmn2lcomcjzyiCtQtw2P5SFIiqQNi5x?=
 =?us-ascii?Q?s8Wb86iphxOMrkqF7y4lMzCOJzbKygUcZ+bTohBzO7GaXxMOPmgqvyLl/TfG?=
 =?us-ascii?Q?agZoR4c8kblwZ4FBf0QMq6p92e+M+Iqvu1rfZQJ5D4vvVHXkHnr2yg9zlbjw?=
 =?us-ascii?Q?R7sAjRzaqlRschiY16OAQsalL5JsocjnwwCuCsLZ9nU781VwMn25d7ugz5Tf?=
 =?us-ascii?Q?u8BrOqpSV4iovYc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:34:43.0730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f91b242c-6e59-4992-4215-08dd20c0638a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6478

/proc/schedstat file shows cpu and sched domain level scheduler
statistics. It does not show domain name instead shows domain level.
It will be very useful for tools like `perf sched stats`[1] to
aggragate domain level stats if domain names are shown in /proc/schedstat.
But sched domain name is guarded by CONFIG_SCHED_DEBUG. As per the
discussion[2], move sched domain name out of CONFIG_SCHED_DEBUG.

[1] https://lore.kernel.org/lkml/20241122084452.1064968-1-swapnil.sapkal@amd.com/
[2] https://lore.kernel.org/lkml/fcefeb4d-3acb-462d-9c9b-3df8d927e522@amd.com/

Suggested-by: Gautham R. Shenoy <gautham.shenoy@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
---
 include/linux/sched/topology.h | 8 --------
 kernel/sched/topology.c        | 4 ----
 2 files changed, 12 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index 76a662e1ec24..7f3dbafe1817 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -143,9 +143,7 @@ struct sched_domain {
 	unsigned int ttwu_move_affine;
 	unsigned int ttwu_move_balance;
 #endif
-#ifdef CONFIG_SCHED_DEBUG
 	char *name;
-#endif
 	union {
 		void *private;		/* used during construction */
 		struct rcu_head rcu;	/* used during destruction */
@@ -201,18 +199,12 @@ struct sched_domain_topology_level {
 	int		    flags;
 	int		    numa_level;
 	struct sd_data      data;
-#ifdef CONFIG_SCHED_DEBUG
 	char                *name;
-#endif
 };
 
 extern void __init set_sched_topology(struct sched_domain_topology_level *tl);
 
-#ifdef CONFIG_SCHED_DEBUG
 # define SD_INIT_NAME(type)		.name = #type
-#else
-# define SD_INIT_NAME(type)
-#endif
 
 #else /* CONFIG_SMP */
 
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 9c405f0e7b26..da33ec9e94ab 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -1635,9 +1635,7 @@ sd_init(struct sched_domain_topology_level *tl,
 		.max_newidle_lb_cost	= 0,
 		.last_decay_max_lb_cost	= jiffies,
 		.child			= child,
-#ifdef CONFIG_SCHED_DEBUG
 		.name			= tl->name,
-#endif
 	};
 
 	sd_span = sched_domain_span(sd);
@@ -2338,10 +2336,8 @@ static struct sched_domain *build_sched_domain(struct sched_domain_topology_leve
 		if (!cpumask_subset(sched_domain_span(child),
 				    sched_domain_span(sd))) {
 			pr_err("BUG: arch topology borken\n");
-#ifdef CONFIG_SCHED_DEBUG
 			pr_err("     the %s domain not a subset of the %s domain\n",
 					child->name, sd->name);
-#endif
 			/* Fixup, ensure @sd has at least @child CPUs. */
 			cpumask_or(sched_domain_span(sd),
 				   sched_domain_span(sd),
-- 
2.43.0

