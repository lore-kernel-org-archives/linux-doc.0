Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3713B5AE;
	Fri, 20 Dec 2024 06:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734676509; cv=fail; b=t/TJHFxslBFpSNIUkr8c6mNHCjh20y+y07AexjPgRBC8c9Kj0Gzxc/BuquCqR9u1mq7a95L2GF9KL7hGHnmoICMLOOsF8ZCrmjKsWZ6aILo60kDtdg8CX7V4JjTO4KCRWwa9yv6qHQdzJieYCaOwBqDLA/Gv+L3fFUlnRbCsEu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734676509; c=relaxed/simple;
	bh=5imA6ZNBxOsT9LZjKmWlgFdgED6D46Xy4pzn2iVYwhs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sinc8mzZkLKBR9Z4If9Byo+hbIUojB4A4eAs1EQ+0+ca4dncuvxQd6EnRvOuR+15RuKRbSaaIFrav7+Mex17cMiiwQzBMVJf8uvCQpnMGkDlfTRvItOFdLQ3uQLIgkK4ag3+Awo7tQEwlqdBvLfuONY6sosKlvDYNkgHJk/FFz0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mujix//+; arc=fail smtp.client-ip=40.107.101.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mujix//+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlL5OHj90awPP39VXJCMYFGSMXrLxUmwEL0x3S5zFfxj18Rol10cSOGPTIv7DP4dOQW6XySX6LAb2a+DujwLxd5P54MZjEw7m2MKpjWF9gV6gKk/OwI9eI9pJx6XeQEP0vB4OE910oedhHeCVKrfQae9T3ub5pRaIohL0YRs6U8IDTCIOHiJ+aAt39rRP0Aoq2WiiU+YY0l+/HPhgfyDfxrmNi3ufdv9i5OsTeNM2O1aW9uLiu3OrJG1M96a0WiUZj9adyYE3nvo/0uX/ncZxD9wSe8nUEKItN0ZIN/VAvhq4YOyrlDItWtMy8BozF/ZO46tii7g09r/8d0hwVOyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S47izQ13tMfqzj0XwrdzOi5U7G5peNUHpWyQWl/b/c=;
 b=DFEnkGMrz0N1EEHrUSV640SNe51UTmQ2k8Y5m5PpxtpzaSE9GYDpFvi6FQEXGWQcWMR2IbFEva9eEmueGNIIXJs/pTDZHvahn0AMTcL+jVY/mIILI9Q/wtVbOGjhaiBdVpZWq4vdt/HkfkB7eEgVQcVPrXryBymkqK6A3+ICRv37hiSMBY+/7ZOteIIrs9oNii8tDV65hzq7P2aBK9dS2LgQY5skst4knvga9jCw3ILuO5oWPmpm0bIUx4jReUDHtLAOt27XM4zcifT8ZN0hz/yx8VCaZlLmqckvf08LjILOFQTLIC2jjPDtAl3QIBarTqXWgVjZeCHIIT2zQt6ckw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S47izQ13tMfqzj0XwrdzOi5U7G5peNUHpWyQWl/b/c=;
 b=mujix//+8jmB3nLFxSjZS5jJEUZ5+EkvNrtGeiklDzqLJqAN34LdRsSQMQUnODtN88dRbwby3Dh8gq6HQbBCI4lf1YK3fNIC8r4mi/ZNvBrX+dxAxF7lgjthVcdNoNVEfba3hGiTp6BY9n2pk99UbpREYsw8f+8zchHwvUDZd2w=
Received: from MW4PR03CA0115.namprd03.prod.outlook.com (2603:10b6:303:b7::30)
 by SJ1PR12MB6049.namprd12.prod.outlook.com (2603:10b6:a03:48c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 06:35:04 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:b7:cafe::bc) by MW4PR03CA0115.outlook.office365.com
 (2603:10b6:303:b7::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Fri,
 20 Dec 2024 06:35:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 06:35:04 +0000
Received: from tapi.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Dec
 2024 00:34:57 -0600
From: Swapnil Sapkal <swapnil.sapkal@amd.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <corbet@lwn.net>
CC: <dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <iamjoonsoo.kim@lge.com>,
	<qyousef@layalina.io>, <sshegde@linux.ibm.com>, <alexs@kernel.org>,
	<lukasz.luba@arm.com>, <gautham.shenoy@amd.com>, <kprateek.nayak@amd.com>,
	<ravi.bangoria@amd.com>, <swapnil.sapkal@amd.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, James Clark
	<james.clark@linaro.org>
Subject: [PATCH v2 5/6] sched/stats: Print domain name in /proc/schedstat
Date: Fri, 20 Dec 2024 06:32:23 +0000
Message-ID: <20241220063224.17767-6-swapnil.sapkal@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|SJ1PR12MB6049:EE_
X-MS-Office365-Filtering-Correlation-Id: cb04f288-c9b0-42a0-f69a-08dd20c07057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1PU4UnlWT7zO6YlNWUpR0lBlWTpu8Op2X2dhDQxIsuDx2bdopoAEmcKkGkE4?=
 =?us-ascii?Q?6Mna4P/CMrfXzr+j0hZ6ziP9AaSEjsIEQbetn+hJI07lQYpWeRVqVzfa7vLn?=
 =?us-ascii?Q?wB6MrIN/ft/0t02bOavit07GBZ3QgVkwwHCzF0yeFypH+Vp+DWmt6cSmjL34?=
 =?us-ascii?Q?8JnDYcPh1EAQ84U+kKr664BmkorxaFpc1RTmK+3Ml+R/iFd6ciuhrLqYaT5l?=
 =?us-ascii?Q?n8/Vdh1d2BH1kqVHYJh1RPmB+KKnokY/wJLBmIXylWmmtIxG31OS46zgZ6wh?=
 =?us-ascii?Q?WJJHrs15hS5fUi3eXuLT2WEOyYco9IQ05O4gVCkGqPpaNYv+p/LOcecX4CY5?=
 =?us-ascii?Q?suAmU2xbUtUpttNNimXWHP6asiddxBR6niTHnjZLDGLRfJKx+8EuRNbM77xB?=
 =?us-ascii?Q?rK6hdu1OEWusHC88YMj6F0/ZTPUylytx9JBXv7J9aL0kP9w0m6LFIx49kVE9?=
 =?us-ascii?Q?IQfeVWR/+egWnAiFWiMA1BrBiIEmu4Zw0E2sTsHCBg8yYTT+9+TQdV2oFJr/?=
 =?us-ascii?Q?Cvw1IIHLdXzeB12elooIXTSiAahTfcSkqj5V7WbBkgkUpJn/5y6A/VtNd96o?=
 =?us-ascii?Q?BQ7UOrv9kJmGf2mEbGIhXRytLR56TzXP4ENe4/m3xf5N4GFdrsL8ysC2k/kc?=
 =?us-ascii?Q?pQyPQZRXqT+wMXdaCo/82W5hecovCR7/b7L6BrSH/3uNZUtPBMpUzHqE+C0y?=
 =?us-ascii?Q?s2mwMlFBy/oRIh+kicwfaGgTgSOvt0oR9sYsKfxO0LKsuVIxAJSOzoiQWdoI?=
 =?us-ascii?Q?LlvVl4V1rceFQmjpL7aA4Zm+a2gNSPZd179JTveF4pG4Kc+mlzfryNDos4+x?=
 =?us-ascii?Q?woGNR6d+NKemZf5SdLJ4h4t8HqWgvwtowV1UaWLON3niii1xb5W/rnjoLTe1?=
 =?us-ascii?Q?Wn91kRi0jt5lMpA4fuWrHr3wclRBdGpjjM11TmkNAcO1TCcj1QMXEVEB1TS5?=
 =?us-ascii?Q?Jadr3NG8Q3pQEfE1W+LKgpFIFfi5JQme/EPpUYipsmzu2+3CWGEcehF05xGp?=
 =?us-ascii?Q?bGuMa5x0uj/r1OoQGejnaCg/d2i+HCN9o1cG7Mr4nrueY/EawMzZUymVMn+G?=
 =?us-ascii?Q?G8oVMgHnIwJBlo6bFywWjFnGPrEejh1mcKWj9Wu64B43S53kVPb3BYzCReF+?=
 =?us-ascii?Q?pySFGFhEcrowzGpwHTw4EJEWOGJa1R80BhTf+yTSoecLmOKG/IEgvzMctcPG?=
 =?us-ascii?Q?3H32koEzJkGlpJTfZwGUoL012+QAmzuVTuQoyTfpzrzvfdPuVYYD4CWfKcc8?=
 =?us-ascii?Q?xFUJaXDVKFlkWedJlb2XrC6kBhJl7zXa65uwv5aLomrLOoZHhI/ofecGNgrY?=
 =?us-ascii?Q?f9DHih37iLOVY1ShkLQCkMvtmQSj+z8Smaw5RPc+rXsPC1RyIT0gGrVbuS6j?=
 =?us-ascii?Q?Nxpyonn4EhWwD6tlRzNHKaydmlCQtKDu1gmUUINhMVzGNM5vUYZvu24AIRHd?=
 =?us-ascii?Q?dAD5fx3+AQ3FeqVHgl/J0luNEf2TLYGToWOdMKy3PM/Pl2YkqY8g4LZiVJTf?=
 =?us-ascii?Q?QOqptG471/v+dY0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 06:35:04.5538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb04f288-c9b0-42a0-f69a-08dd20c07057
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6049

From: K Prateek Nayak <kprateek.nayak@amd.com>

Currently, there does not exist a straightforward way to extract the
names of the sched domains and match them to the per-cpu domain entry in
/proc/schedstat other than looking at the debugfs files which are only
visible after enabling "verbose" debug after commit 34320745dfc9
("sched/debug: Put sched/domains files under the verbose flag")

Since tools like `perf sched stats`[1] require displaying per-domain
information in user friendly manner, display the names of sched domain,
alongside their level in /proc/schedstat.

Domain names also makes the /proc/schedstat data unambiguous when some
of the cpus are offline. For example, on a 128 cpus AMD Zen3 machine
where CPU0 and CPU64 are SMT siblings and CPU64 is offline:

Before:
    cpu0 ...
    domain0 ...
    domain1 ...
    cpu1 ...
    domain0 ...
    domain1 ...
    domain2 ...

After:
    cpu0 ...
    domain0 MC ...
    domain1 PKG ...
    cpu1 ...
    domain0 SMT ...
    domain1 MC ...
    domain2 PKG ...

[1] https://lore.kernel.org/lkml/20241122084452.1064968-1-swapnil.sapkal@amd.com/

Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@amd.com>
Signed-off-by: Swapnil Sapkal <swapnil.sapkal@amd.com>
Tested-by: James Clark <james.clark@linaro.org>
---
 kernel/sched/stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index 802bd9398a2e..5f563965976c 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -138,7 +138,7 @@ static int show_schedstat(struct seq_file *seq, void *v)
 		for_each_domain(cpu, sd) {
 			enum cpu_idle_type itype;
 
-			seq_printf(seq, "domain%d %*pb", dcount++,
+			seq_printf(seq, "domain%d %s %*pb", dcount++, sd->name,
 				   cpumask_pr_args(sched_domain_span(sd)));
 			for (itype = 0; itype < CPU_MAX_IDLE_TYPES; itype++) {
 				seq_printf(seq, " %u %u %u %u %u %u %u %u %u %u %u",
-- 
2.43.0

