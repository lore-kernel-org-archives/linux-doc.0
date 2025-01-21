Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B918872A;
	Tue, 21 Jan 2025 04:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737434164; cv=fail; b=eDWp6nXBbr0OuXcFWA5si1XTgrHhI9ei78Rm7Np2P8jl4EZWNdLYE+Q1Emvw7cHSQXh54U/uiLRCpLsLDarCP6BHHUQYek8yFg7zCIohjJQFU+81uHYqIQ0A74BCevWZRu5soQ19Hr65DZ9RY8QDqKXPbuwkvKM6ZLkyBx204CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737434164; c=relaxed/simple;
	bh=kqwY+cxKa96ZybZAOQXJZ76N9QSwBkFk0MRJesShpmI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJJwaOmMVneds3C8wZQqwU4GLs1UDYKcL60GsGrnxzrS9dbUJjNvlEmpJRLgNZpxGEKMRRHr+IRyPRW7357vztctTKRFIBDsMxdnv6FknGVRo0nVVAOda3KVr2Dq5j/SxASa7z2UdpF25wzFVk83xrtyT2Yxy4EdwW5sOpddjxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JUE5ZZNj; arc=fail smtp.client-ip=40.107.237.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JUE5ZZNj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Na9ddimGPYa3P9Azjdrsz7PuyY//gIj58l2VUN8350Rs69TQ4f4hXaL7ZDCCzCL45ibvM1GIylqZ5Cp5qLze+KwA2sp08wPinp1kBGCv/Gy5dc3YiNYju69sMl36gEytz83woabMMcWMBStON+h6Jot8RnpWE62w4iiOOlh2/zdPzB/U2XWAQ8nb1/aFg58pbtw0jTwKoFlA4r6ovxkHrbfZ1q3iMevZIyHUi/vbXoMh5YjvYGJCHXc4cgnLsLsMhKy8MZ3LHhdbJmdF1kwqE1Zo+U38va40VtYMnBCj+aZWPcu6h0tDe8IdI4s3mafcusQzdw5myuCPr/yiItOFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zvt8P/s6c5RL6tM9XyWKFuYW0Sw/6k0aw8zXoRLIrM=;
 b=dx/s9E64L63wKPkS6Kn11O5yLQdyihA+D5AKLODiDxzCHuFVhB5q74JZG+h+QmmjIQxuOO3aUWjcfNoPSEkIZE6cxoJukUS1uzs4rEu8KFMnlmOlNMJiPb8jQhw9cfLOKkxuUZRq5hXG+RowOeSflPa/eYW9kNkN6AyGxLWR9CZF6+0ymNtpraPXyPJ9NkAVwo7lkaxY+kmzFseGaE9AoXcXlSBZO2aauQ0zYUPSSV+/llaAZLf+EvbH0cApBA1zZu4kGv/lxQYfRVfcV1J7A+7Br1MMlcRx3e6t0LK2ur7NQDB3L7H7Z59i0rWXT59Ci5UEG0Vwx2bZ9+royfJGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gourry.net smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zvt8P/s6c5RL6tM9XyWKFuYW0Sw/6k0aw8zXoRLIrM=;
 b=JUE5ZZNjmlfmKVMjT0LR4By3Wi7b0FIge1Bprs8ijYVkX7uLktkIAwL4rUBZuplTFrQUdMOOuidbbrMLObQO7s1Ho4BrX2WDQfq3TcYpT21AnXrFdM8VPzBbmCCV5Q6E48yNByYXUhbnOZoV28pltsSnXuStQthTm1Pd8eLIINI=
Received: from CH0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::13)
 by SA3PR12MB8801.namprd12.prod.outlook.com (2603:10b6:806:312::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 04:35:58 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::f2) by CH0P220CA0011.outlook.office365.com
 (2603:10b6:610:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 04:35:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 04:35:57 +0000
Received: from BLR-L-BHARARAO.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 20 Jan
 2025 22:34:54 -0600
From: Bharata B Rao <bharata@amd.com>
To: <gourry@gourry.net>
CC: <abhishekd@meta.com>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<donettom@linux.ibm.com>, <feng.tang@intel.com>, <hannes@cmpxchg.org>,
	<kbusch@meta.com>, <kernel-team@meta.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>, <nehagholkar@meta.com>,
	<nphamcs@gmail.com>, <ying.huang@linux.alibaba.com>
Subject: Re: [PATCH v3 2/6] memory: move conditionally defined enums use inside ifdef tags
Date: Tue, 21 Jan 2025 10:03:55 +0530
Message-ID: <20250121043355.177611-1-bharata@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107000346.1338481-3-gourry@gourry.net>
References: <20250107000346.1338481-3-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|SA3PR12MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea96d06-036d-4875-6fba-08dd39d519cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?15ABvpKe+4v6j81k5Yfa0puWdo/0G+vTS+ntyBYFUdaedL8EYg6/EXawsbxS?=
 =?us-ascii?Q?NtpMXoPB0CqLVxOazO7euiA3WbLktkblG8SX9UZktEjqVdWQKaTqn0zjzSgg?=
 =?us-ascii?Q?aLhetYCPgLf4L/jopWNCO+McLhUbgYjpjLFtNyYU6qQfcmLKWDss8KQO3RFX?=
 =?us-ascii?Q?Ux4g5mjPHfgyU22Eaf169Wf3GtvvJ+IUAjoq/FvdCd23g1MLAGNSK1kAArYL?=
 =?us-ascii?Q?Y2mGtKazNiY13eKuNbGzOL57hViwStZkMGiGI5l2NNDoz46Ql9c1IuApsTrt?=
 =?us-ascii?Q?I/aRSz0rqq2hiiDg+yPkHGXqAlJfFZ3/8jS7ZM/H62ObtOt7/d8PnAJAHxL7?=
 =?us-ascii?Q?t8s5xDt1cGwb3K0QTgmkSrTE1DUkceEvd9XjRba0BaqhQFH/bG9LE5BfPoYT?=
 =?us-ascii?Q?EMkML/ax8gKExZAOSLzcPIQAz6iMkYc9xbCYwJIoCUdd5BG9g4z0EtBj/wRG?=
 =?us-ascii?Q?4QuUT1p81w+JSOnNZ3vc9GXlIQECL2XrNbff/26B1XVeBDFMCr7BXp7edL0w?=
 =?us-ascii?Q?Vf1q2HOcBLmSKWEt6AzFus04sFR4fTsgNmpoGeVXfHu053X0NpPsBQyzkCkE?=
 =?us-ascii?Q?K8x0w2rh3/TP2nz6djPRcP8jaBAl2jFH+KEziWvurvDL1dnnAMJKdGYefEIZ?=
 =?us-ascii?Q?SBm+YWkbHo2ded+tPgf+WTHqqrE1fhCgfqMBKlKNelY1WX57B0G5CFgw3z95?=
 =?us-ascii?Q?5DbLGV3FxfupcJZM9u6EYkODSN/3RXrpvFwYdlrE5ru6oJFbD4AEntxPLKsO?=
 =?us-ascii?Q?2vc4fyPXWnVb2uWXfmwlVNosQJJX+qqReb7uTpxO0xY7uEJrn35d11kuuN3T?=
 =?us-ascii?Q?jJgPU659jlYRFqfv4lx6VwmTRuzEP9Fx3EjpNiJtaqr82lom6yKseXv5ItJ4?=
 =?us-ascii?Q?TDGjghExgSHIQvOp+2c+sNJIbvKIv11CIGykl3XehGKIgOlPFrBhYbtRH2Jk?=
 =?us-ascii?Q?a8mazeOe9+I2oelFgng4LvmHQoDA+h7ZlT4XmVtgbrgQFv+pqEtEgCEj0vJ+?=
 =?us-ascii?Q?UHqikCblv4Dc2ykL4vu++BlfBvjoX8FqEstXLatXKnqwBjkje99yuUnBiQcM?=
 =?us-ascii?Q?ZMnVz8nfdR0xx5tRX4MU6NkxE/XZLhiVQBXivsdS4VoXbYL9dXIDjw2nAXVE?=
 =?us-ascii?Q?jlfbbIJOdHn/NU2X1uio5ekhsmM2dTHgCuijkevIKZ9tddppW675eB4Lc7xH?=
 =?us-ascii?Q?reA+ROjXUr6UZ9D5diBeBIxOpQGawsr9qP6Yxujy8OkWC4KkMaEbmHrRg5wZ?=
 =?us-ascii?Q?oKiL8A7ZN0RkwYrGNXWGSBYkdxPCzKr58UTqgkXMh3+vg7CzVNF6EL8Ytkzt?=
 =?us-ascii?Q?ktEjjSpdNQo/rJ1NfbsmwvfabhCGEptFvwlTgRQOk0ycbLISa163zY9xCAct?=
 =?us-ascii?Q?eCqylkH7xOtO5VHwAen93HSC5fQNkXcOw2hF2MNkcBxTlM13bQyfT7HYvEGq?=
 =?us-ascii?Q?zwDBQjBB+RNcYgIx5hZDcAoJxYdoj5+GiTbX0L4ooOwMqebztX/H9ba+3H02?=
 =?us-ascii?Q?kkrSmex9oHV0zOw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 04:35:57.9121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea96d06-036d-4875-6fba-08dd39d519cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8801

> NUMA_HINT_FAULTS and NUMA_HINT_FAULTS_LOCAL are only defined if
> CONFIG_NUMA_BALANCING is defined, but are used outside the tags in
> numa_migrate_check().  Fix this.
> 
> TNF_SHARED is only used if CONFIG_NUMA_BALANCING is enabled, so
> moving this line inside the ifdef is also safe - despite use of TNF_*
> elsewhere in the function.  TNF_* are not conditionally defined.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>  mm/memory.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 9cc93c2f79f3..8d254e97840d 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -5571,14 +5571,14 @@ int numa_migrate_check(struct folio *folio, struct vm_fault *vmf,
>  	/* Record the current PID acceesing VMA */
>  	vma_set_access_pid_bit(vma);
>  
> -	count_vm_numa_event(NUMA_HINT_FAULTS);
>  #ifdef CONFIG_NUMA_BALANCING
> +	count_vm_numa_event(NUMA_HINT_FAULTS);
>  	count_memcg_folio_events(folio, NUMA_HINT_FAULTS, 1);
> -#endif
>  	if (folio_nid(folio) == numa_node_id()) {
>  		count_vm_numa_event(NUMA_HINT_FAULTS_LOCAL);
>  		*flags |= TNF_FAULT_LOCAL;
>  	}
> +#endif

I don't think moving count_vm_numa_event() to within
CONFIG_NUMA_BALANCING is necessary as it is defined separately as NOP
for !CONFIG_NUMA_BALANCING.

In fact numa_migrate_check() should be within CONFIG_NUMA_BALANCING as
it should ideally be  called only if NUMA balancing is enabled. The same
could be said for the callers of numa_migrate_check() which are
do_numa_page() and do_huge_pmd_numa_page().

Regards,
Bharata.
