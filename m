Received: from CWXP265CU010.outbound.protection.outlook.com (mail-ukwestazon11022085.outbound.protection.outlook.com [52.101.101.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB3322C6D;
	Tue, 14 Apr 2026 20:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.101.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196974; cv=fail; b=tVAuw1YKCl3giH9+YFXKpP0ZHIS6KWudvYBbutQQtJKjKJt2atZGzqBJ5yES8j25Yb2XdZziprVU7oh87kj0K1HNrMeplWZOv7/0gYeATDoPm4uACh4VMtPEw9DiVb7h6gykYmz7qSWndhwMkBM9b3dBm6TAqlW6V11X6VGSvPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196974; c=relaxed/simple;
	bh=RMc/htsv+159+922dgs9clE4aiQpyKal1u1pe4rRIp0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=MeUpRYVPDW6j6eJ6T2fLFvUD0tEy6plel6IcNSgozyPjzOAO/OjBrVFl/5odQZFSAtVPsD/aLhZRllpDfdtnq2kt146xoYYByJm0cGRbOjWHaTgTDf5yqLQRGbtzwnot+brbJQ4ziCAD7jMbsXhfcI9o1aA6IUEyidZIAz/lruQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.101.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFqbe1BdfrWd2MuvK6liwLjLSB1lfqFEX6NjrRvlpaYY7WZ9aOgUsHUO8548NvmJaQyp5RvEgEF4tIwjDqjQkyts2jqtGJcPxELdEIceQQj0AKPRpJIzD4Lausptb8inXK0luGwsC94iclTa00SCDVxtW5KhvjmoDWAAsFv7qzt8nqGbM06qTxvkN+UAg51I7JgPTCuBARAusEor5t0j6tUShDEK6IWej1mIxHjDJA9lCO0DC6tg2ZxKHs8YG47zMxnRAhRvJM2J5/9dQCUREAhesRk9rMjNW7/RuR/3JUJrBaDSFvngYtrxweqfCBc8txgyrrU6U96UsO5tWdE1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kf4S5/KC8AlKFQBrlJAoDCGQMNksej1qAOdDwU2bFM=;
 b=ClqYg2r24VGyIUHjGQQ3Sc/vanZpDs8P0Xpv8Wbd4IGXYDpWw7tBf04qbaMGfC26hwHkAS2ipYb/4ZTtqMhOhXxZiCC2XgLjR9R9Wkp7j3nKtJ0DEV4umoj9mhHiEgzXMg3LkZxH2tXeFBQGpv+pcShELQtOwqjvISe2FMJrrTzLfEC9woPMOy/41baCH5bS6UPoEKi+BbL0caVZtI6bCHZyXlwmTZbx4LkL9pCWyTZQNaKqMbW6MQW/oY9KBRpunLMLNljHHHdwqvRJJ44gefjFEPUnRbU7oAf1BV7I6UHCcxKrZe9gwNxqAcrtizAvvtw9ZG8TR+cM/ENEns216w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWLP123MB2753.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:4b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Tue, 14 Apr
 2026 20:02:50 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%2]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 20:02:49 +0000
From: Aaron Tomlin <atomlin@atomlin.com>
To: corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: tglx@kernel.org,
	akpm@linux-foundation.org,
	bp@alien8.de,
	rdunlap@infradead.org,
	dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com,
	pawan.kumar.gupta@linux.intel.com,
	dapeng1.mi@linux.intel.com,
	kees@kernel.org,
	elver@google.com,
	paulmck@kernel.org,
	lirongqing@baidu.com,
	bhelgaas@google.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: kernel-parameters: document scope of irqaffinity= parameter
Date: Tue, 14 Apr 2026 16:02:45 -0400
Message-ID: <20260414200245.1153919-1-atomlin@atomlin.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0160.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::15) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWLP123MB2753:EE_
X-MS-Office365-Filtering-Correlation-Id: f7adde86-1305-4fe2-797e-08de9a60cdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	sLwJaGFAoFGA7WtD0UTfaTuIFdr+qnov+ZK0MfBnB/ql3HwBGX050G6iISi2e32N4nKK/g9DhAlEy1WXjy9GEbC3ULiXz2UoAoYs/Ex+LT9iTCfKrv/jhQGcq+ur5QuhJCgOf06VTx7edG+xlhPNwrziY4rxRpc2xg3ElD/CfaxypA6dtCi2ZCIr9bLXjvkYzOg2OrzCXhAQ7f/PVGwjBSd2ZN0Oi9kKOjKaVrIjF+E5zf6KpgK2H5kcpp4eqaKDOobBFrIQ5TBgKN/eUpAE1tonO8SwIByYIiII7blxbQGD7sd6ybD2xRDLksfIvUWZl8KLix5jBjqwsCEqvd9p7TbDU1TFWAo4LAmixJZ6FshVvajPKeZf+D7ZcPtdT++MpmHVkeIj+snPj8LmpUbYZPxyM75auXGWPe6VfvpzMod8PKhxA2Dbx5CheFsfTr/G+OP8KQ8pfDZEIR4iVEl9Y7lZdzhnHJLtA283WSSC8QFpeI5PcPZ04bE5H2MHAn8w0+xZnQt3ryhLMVZccfsAZBtqgZS7pXttQv8rFINvTWDa4vUgv4eq5aSlM7rNCT5ZIEQtVMR5JhNmnDeT1y2iy2HnfTYW3CbR8vpsEOw4hFYrYmyUKIp5n/uV9DLVCWrj6iAJXBJNhIhrg5SUKAb7Zh4xC6D64gp7RwB68zEev9nLRHAuEhAh6DpCZ1642Qh+RUje0+q1qmm58tQcPdzd6rnMj3zV8Rq1exZiAHwMfC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2umfCXeNd9cdjchLQBcRH5XJSJwYem9b3Qi/Kbi3S0vh/WZatcQOa12aCNg3?=
 =?us-ascii?Q?/4qXBSNUhKf56LKwo6Z4GBJDW1LUZw1FFmH0gkYgvcHFPN8VHnv4qp5Erx1d?=
 =?us-ascii?Q?isr/6D7//TiUyPIAPsh8D/YutvqrXVSSLT0ZG9viuU8n4anWGh1KYbcMDB3W?=
 =?us-ascii?Q?/kx5SFxB7jHNDvLcno8qFDjTK4bNz2L7zb6DvrjrYoud1ixZ2PxYT4t4+Pf5?=
 =?us-ascii?Q?5C1kzTEBjEXpRc7jxnGne93ptcpCCz41GtIDb7R2TWAZ1QXgnLh9QgqUY2SZ?=
 =?us-ascii?Q?tFnOppCD3fodRv0Xv+K4RFnnXxbWkP7gQ6owOgHFnRAGz/iuzwWD1olVYpfH?=
 =?us-ascii?Q?Cm318UM254YOy6k1bIgmuLntGnQShxXz0kWqW6XTXM3cBj1277Pzsy60kWvb?=
 =?us-ascii?Q?Zvd9P8SBwu/MpzoToKeVuFLzXNA84px+ulLimr7Y63ZTDbxMeAfsiEw6DqGN?=
 =?us-ascii?Q?9Ui+Q889AVlz5fMRcroKKrogaCfn3B/eVHGQGag15fiJiiieqOrUR3bajSH8?=
 =?us-ascii?Q?Kmz5wfSEoAsTws+9oz2Sj2kxlj8+e2Nf0b52KdnDII7u1zAU2EsbvmUwAq5U?=
 =?us-ascii?Q?sVWT/qK3Q1PNlgyXzofpSSnQRuQAQeQC+3nBvbEt22VSXd6tYu7gAlnOzvrH?=
 =?us-ascii?Q?CkYSjQMeaEjc3cAygFBHrpth/87xLwzYB0gSjYMuzjsw7cf6FWIqczGIuYt7?=
 =?us-ascii?Q?7hDugvDO93xFzcaQOAudlkoCrz9+HXfynSXr3peG3TT8NbdwmHB9ApT7t1//?=
 =?us-ascii?Q?wyByFFyH3OIo1lLyPOdBjf6v/WrrrOQUVj+KjjMimXm5Nok8XSQ7qXqlnq6W?=
 =?us-ascii?Q?79SzQciymzvNGyFiJYS0KzF3TKdKTUgfefEvDLo/h8vwNHowz6UFNCrTxSIu?=
 =?us-ascii?Q?BPsBSZZodXEdNKe5l3yFjCcu97qXHc66vY2/NAsQWJD8nbHCOQfxam1l+6f4?=
 =?us-ascii?Q?/QQHHvkj8IYARyJBKsP+d5suP0y2Z4XSj3k+dZbnZVWuATUpQZBBUBhooWwC?=
 =?us-ascii?Q?Isx6GRHWmSehsxfa5CwSw/d/sObbWxRt6gK6A66D7dZ49iUjxdTDJa1XJt1b?=
 =?us-ascii?Q?6ZN4dND1ydKkM4xTCbktz4u0JTInx82wdYpaR07yidBSRUweuEzo6Pq7nE11?=
 =?us-ascii?Q?nxqIwKVZjFuIPoSwG+bY4NqiVyBj4oW/O+fFAlX8RCwk9LS1ZMZDS0jd3sQO?=
 =?us-ascii?Q?3Hoh3PX9mX/sqx8qsRCxiLfVFI1BDaTTz0AQbLtdSe/KmQsrPFdYjFm7I85v?=
 =?us-ascii?Q?XkSTBlNg+F0lARCYvuqULDtlR1gTszuERiaEg0a/In2ZPzcBWvwejG5I77b8?=
 =?us-ascii?Q?5oNQ21LQsUu7we2T6DbyTXy9Of3msvlU8/vWv263uAcSKGxaeWegx2MZe9r4?=
 =?us-ascii?Q?wR8aTVs8SYUImsRmu/dUJAI3YJguFRRJF09Xf1j0+E54rMXJ5dtngy7xADEL?=
 =?us-ascii?Q?IFCS9Dn48T7s0uPGO8lyBePLPO+x2QDoM6BhTqCSDggHvgVcUXImsC2k9R7/?=
 =?us-ascii?Q?R6rZff2YWaqfzRklPZyl9M1/Vw3AcNHQ2RxqLTejueYglGt4vNKteIpIt6um?=
 =?us-ascii?Q?BOuvkBKpINbMy9gECOj+lNEXiV7NIVbbkq94vtPgFQr+GRJPFKRvY6bYkf6O?=
 =?us-ascii?Q?fynnwIhGfaZi4Dl+fCWpN5q/a5+92/9cgpgadTEiaBuijcybOgJcupOrLNcG?=
 =?us-ascii?Q?cIqYqH74ma/4jkHkMfglHY8Op/BcKjoIjO++hofO7oPQ5CndwcURm3np+LV3?=
 =?us-ascii?Q?k+OHRRrEPQ=3D=3D?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7adde86-1305-4fe2-797e-08de9a60cdf2
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 20:02:49.7517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: li7KNEO0dJQhzU5bru/tAJZcCjEaRMl+HYa6dkEHrt3q+kQm3DfLJyrTi+3qsRnQGmSEFlh+I7sHElBDH8COMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB2753

System administrators frequently use the "irqaffinity=" boot parameter
in conjunction with CPU isolation to build deterministic, latency-free
environments. However, there is a widespread misconception that
"irqaffinity=" acts as a global, absolute override for all hardware
interrupts.

In reality, "irqaffinity=" strictly populates the irq_default_affinity
mask. When the kernel allocates multiqueue vectors
(e.g., irq_create_affinity_masks()), it explicitly bypasses this default
mask for managed interrupts. Instead, it relies on dynamic spreading
algorithms to map queues to the available topology, effectively
overriding any default the administrator set via the command line.

This patch explicitly documents this limitation in kernel-parameters.txt
to set correct expectations and directs users to the appropriate
"isolcpus=" sub-parameters for managed interrupt isolation.

Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9ed7c3ecd158..40ca92d8cf04 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2732,6 +2732,14 @@ Kernel parameters
 	irqaffinity=	[SMP] Set the default irq affinity mask
 			The argument is a cpu list, as described above.
 
+			Note: This parameter only sets the default affinity
+			for unmanaged interrupts (e.g., legacy single-queue
+			devices or unmanaged pre/post vectors). It is
+			explicitly ignored by managed interrupts, such as
+			those utilised by modern multiqueue storage
+			controllers. To isolate CPUs from managed
+			interrupts, see the "managed_irq".
+
 	irqchip.gicv2_force_probe=
 			[ARM,ARM64,EARLY]
 			Format: <bool>
-- 
2.51.0

