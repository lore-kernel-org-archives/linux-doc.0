Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011044.outbound.protection.outlook.com [40.107.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06434175A7D;
	Fri,  3 Jul 2026 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783106184; cv=fail; b=WjI2+2Ev8E5zmFGH+Jauy4X92SzasQMsmnkEedj1jFiNJ202GfY5ov/wIIFxrCeNgQFNiTLnfme/tB9/6UKm7afY6+PjtZhYFrCdPZbh+bdwFX2PgitP2Eb6GqUs4jSox22F7evQKNCf2jlp5jAIdzNt+cQ2th2qTCwpPkacFYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783106184; c=relaxed/simple;
	bh=iTi+K0kJ+G42/vLIJkI/mDTDfD/yrejKfuAlmddWyBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GNVAOopzBj+ROI+PpyCqIDhXVh76fEeycEAQFdeZModwbNfuF7yMI1QMAS+HdElpZXAPCXsjAvqUXYFOBf/feFG/1bZH2mDfA5krLezWhMhE3UjWrJYty497fbvTXUfYg1N685NW3r3BJT2JskVnzqVWRDRxIeldAoweMG1Do6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=he0/2RPS; arc=fail smtp.client-ip=40.107.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="he0/2RPS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t5dAV9n4jg4zBE6gswasZWcNSFxPds53CU0hnSwlNEZbAhKXLa7XvOhIbAczLLKkZpY2HUD+DUufQR4nq+IPmiP/diVTzYrntvpLGhYzNy/id/SCy41UNA3+TfrbWlUZ87GbIqoYRhAcwuNjojO5ffTsikvKuDVBfYUxHixtNhbRKvgK5Up+hi/nzd+ovRAVE3R65K8NQUnYsemSgN5lM8MFPGQCKMdWeFRNE3W4Yer3FfFegzi9UA4T9xoUn4UNpHFd/3HyS1VY070sjvtjrw14haLwCrV+pvzLn4d+HW5YH/bfqomawctt0dxbiGvut1aDroUKOMv/iNKFFJ+ILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejYW4Wrx+KeK9Hy74ZZg9BU3TWoX5Qh32aI2dO/btFQ=;
 b=OaHbhG9QuJBrsVYzX/+6F2sxKtNACwz4lPzw1aIVn0s+dEkCR8nRpMAhXJPdz4Yg8Th8CcOq+jvP7iE7SG/58ba8Q/017Rl1phNrqbza5C10j3CAmVDr8aOWoFvRNMOp35qYkyihpulKLWYy3ZB5eeWxQS/Qkz51jxeRpYS1dTl1PcP9uiaigU1t8XB72xUNdrh9Jaf0aDGVkrrMnaji/ynXrMQO2xyuWpfMUd6cATXGq72sTMof9J6TQzh6JdWE+Ppx/4dkQnQjKf7Pp0Av47cbpdMdOSWTloko0/t55HEGVyMZMKuxWV3xCci5oD/oqlovgGDxyj6PttDOkey+Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejYW4Wrx+KeK9Hy74ZZg9BU3TWoX5Qh32aI2dO/btFQ=;
 b=he0/2RPSpk3ly9TZa8h8vrmHCraj3jHpqZ/XGG9lkrr3/l8pUY5fTCIOCJBi1cBQQxooO9MWhKun9/csvx7IVBxl8ETemnVOTvHvt86/fvEtTl/WI8YIWjoBIknwb4NcMr27AuFLmRUrFmy8HQS2IrBzo+AMBzY3ur+W/UY/gpCoaSo+TpZVFB1qfh6tfFMxs1xICHYchYFJ1jZrOjUWwbpvf4B7R4Nw9GtIxW0LcfMh5ZBuICCEuxLXWQ24ur6iNKikp/HKZ3jy7gqSUr9Qjke99jVXINv+P3FkZSLBM3CbJ8mkDsyEIM1MYovRVJnUWxAMQ3fGlDQPpSFxrLSdxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CHAPR12MB999249.namprd12.prod.outlook.com (2603:10b6:610:300::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 19:16:16 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 19:16:15 +0000
Date: Fri, 3 Jul 2026 15:16:14 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 17/23] virt/steal_monitor: Provide default method to
 get systemwide steal time
Message-ID: <akgKfm_sSl_ZAXfT@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-18-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-18-sshegde@linux.ibm.com>
X-ClientProxiedBy: CH2PR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:610:5b::30) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CHAPR12MB999249:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c300d91-d2a1-4eae-dd9d-08ded9378dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|4143699003|11063799006|56012099006|18002099003|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	4zb1kPzm7n66763Qz4UfvSMkkPgXcki4D2Vd55etKvtWFzYyE0JthprhMQ+PxLfPMWp5GNQpY8YMajoyQvlufL0+OJehAg4OxzCVvK0an6IdO0urHeQ9E8XYFIM/20ENLEE0KzoNtS9OLCHUZjnV5q2hOz3c+ESIzhx4nHUElS4GhzKWuSN0lOuJ3ej+m3z9TeyVWBjwVJ1q6WFgUWGOAeTHMfJNmhJHejVYBsN048tIQYm7CZ77tG/Bxl/2ApbQDJFPBqdKm18qAY1TSi1tfhGzr5KN+QyRRSWL8SWRWfJLMwnAt9JU3o4nRVvPsWQeZhsLJ69c2T0PPRLdaixfK3wMlVOyOICJfZpJVGTrCVD1y7YAs2Loy1SS9vrSV6LjQo3PIYTZlUHaD2BEFtmwDyWpuGGlPMBXYyCTwfUYovtbjSR728vnCKtt9wNGCEIV3z+lgNPqGvE9HGG7dMIn1eksnL6kGZWTiAaIIJNxbgWA3mKHAGl9m87NV3xrw7KxjsaSpNl5k6CyInxSyfA/lGdLsUtcWXEqeIOavmdEQSOw9H7oE7WqNqKElGhy6lcBQsl5Ig24moiXCtTYHXki2j2YwJ7qvWdBVJnCNKJCcWcoC69GFx9CqisLDcK296zPsnMJA7dXrhxHvZiOmT3id50wUr0S3O7jGwBmBpmuHiM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(4143699003)(11063799006)(56012099006)(18002099003)(3023799007)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBq7AHPDlK/Vv6sVFFkRyTkLlKooh0IO+zVHliJDEmxh2EibvK8gSla5kb1r?=
 =?us-ascii?Q?X0xQTNjpNgN+Cam6tbO9D5uBgeXBlyDpZKhwk2K2ch7Ukjmz1GT25+3AVOSI?=
 =?us-ascii?Q?frJGapgEmlPa4ndFN+69WjIhV0QfOii2UyI/JkpogcE1Yp+nnsxzp5yTUI1Y?=
 =?us-ascii?Q?CBP7H4E+VxC0QBVmVOpMNlwgAV+W6Ep6nlJML+z4MRHtiqGEu81I52gJLpAP?=
 =?us-ascii?Q?9pzLB8MRt7Hd+aPP89jjdVP7TJfVXSxENOy2tMo4SkFatCNwrhltepZ3LCJW?=
 =?us-ascii?Q?qMM5j/TyxK5erPI615ZcYrqkdf1U9WdxRvLg8wsSaZjYNyIxLf+jx903jH0r?=
 =?us-ascii?Q?yve0on2LY1udCnTLGJEIdAElPXIEbETrCnwNsXv5dopFjCylxzbICH7N3o7Y?=
 =?us-ascii?Q?JHXE84BGjnxI/9IytaH5QtfZa8dCGdg+dzMs47xKUw2N9+1eNLN/VkfImisM?=
 =?us-ascii?Q?no1fe0zRbs08vuCW7aDQlySIEHuY/6DSQK7lNAWtwWSKeEa4lxLKNjShVUNe?=
 =?us-ascii?Q?iItsoonpv/9Xavy6F6804Rw7ZBpCLs04+xYnDd7FIw7zL8X1hqpDcHpugQvh?=
 =?us-ascii?Q?K6ATBte/ptQySX5O4RMkGOXFgcq6ntxaeg41MGyxe9aANpXIy48zwth8x8/1?=
 =?us-ascii?Q?ZDra5zjS6sj5/Ik/pwH9XAQBZxYnOQms45pF2fLE3id+eu32gmsBlGC1HuHW?=
 =?us-ascii?Q?j4FsY0Y5kaWcNQB5zmZpo451zOKP0iG7aYtFK8t7xruvnac5eBWP3paTAWIR?=
 =?us-ascii?Q?fli3GUtMJreEhG6Kbdac+fxUEcmHnOE6/Vw2QQsSBzNzC//QeQcImyFP9QVS?=
 =?us-ascii?Q?yv8dFrU8Mp6xeV9Rhbuo2dU7yuO0Nuhv4FpX3TpwPil5WOpl18e0/eekh1XP?=
 =?us-ascii?Q?YTn0fLO99CpOpa+iTMbPLz8Gd11FnTbYcKsKn5hc/dXZJX1eibtBNyKucJxc?=
 =?us-ascii?Q?zMGWuti0CbGBegxtasTBxQeNETCMX4Qj0ZuQVsYfRG/QWnzn3Jrt5uT47rM0?=
 =?us-ascii?Q?KJIduemDflfn2b1pXjOiYa5cE+r1CJPPs3/mUe5qziTYVkFi1xvSeti5Ux/8?=
 =?us-ascii?Q?Wv5Mr+YmLjVzDny0cPWiOV9fFp6cDYMuzzpYw13DWIevoA9RtPyvWFiPHmHD?=
 =?us-ascii?Q?YKikd3VebE42t0078jHiVrG7cfw1gDGP40ScPPoyEzMp9n7oiNAKxmZp0wz3?=
 =?us-ascii?Q?3XDEfRXgyy4boLykWOG0yOaF2XewHoe3n4jk6AxviQJcc1LafGixzl78276j?=
 =?us-ascii?Q?muQhj+KN0VNuBspPv8pbReL8bvf4mN6LXro4Y6L8g9bdp83Z6cd2Sy9GVplI?=
 =?us-ascii?Q?snHPvbPruhMEMemtxx2WJ6xDqC0hGcPVsT7nJMEXCfuw9Moi44LW6nHivHAK?=
 =?us-ascii?Q?TBiicFj32kDjFWRppZcfc5nuo1Li81JqJ5Ykmy1sTRc8zZ/SVpbDYiKJyVBp?=
 =?us-ascii?Q?/gy8fObIJCGTy6rVwio12jVM+55cHEww19hEHO8S3U4/T+xK/+te+JF1DnuP?=
 =?us-ascii?Q?+mtbd02qgWNFKh0Bgu4LpzAii2lrwQdgyjEfOs+qq0XxuhL2A3eicH2/d9n+?=
 =?us-ascii?Q?ZCcKs+erqYZXg6o86yI1uXkWLVRpgXZyso7oW6Smsi4RJl47+0/CH4yBBDmo?=
 =?us-ascii?Q?v2MlB1zGjrSCb6d6qM9+acWahrkA9YN76lh/5VJmACPEB2a+Kyp5NlY1pNwx?=
 =?us-ascii?Q?nu3GSV1b+uhSPcmSqJJlFaaMbLDvKZc1pXHpGUY7uDi15zfG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c300d91-d2a1-4eae-dd9d-08ded9378dab
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 19:16:15.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FL5/BfIcUPGGZMttEKoIseabU6Sq583ido9XEnu4fVDok5V6zih0rtdQtpZyNSdJ6d1nWWs2fYNpDKrrgXxcgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR12MB999249

On Wed, Jul 01, 2026 at 07:46:48PM +0530, Shrikanth Hegde wrote:
> steal monitor takes global view of steal time instead of individual
> vCPU. For this collect overall steal values across all the vCPUs or
> vCPUs of interest.
> 
> Default implementation chooses steal time across all active CPUs.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v5->v6:
> - Add cpus_read_lock() for hotplug safety
> 
>  drivers/virt/steal_monitor/Makefile   |  2 +-
>  drivers/virt/steal_monitor/defaults.c | 28 +++++++++++++++++++++++++++
>  drivers/virt/steal_monitor/sm_core.h  |  3 +++
>  3 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/virt/steal_monitor/defaults.c
> 
> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
> index 24cee55342ce..7c16f8cf9583 100644
> --- a/drivers/virt/steal_monitor/Makefile
> +++ b/drivers/virt/steal_monitor/Makefile
> @@ -11,4 +11,4 @@
>  #
>  obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
>  
> -steal_monitor-y := sm_core.o
> +steal_monitor-y := sm_core.o defaults.o
> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
> new file mode 100644
> index 000000000000..6681f9938f6a
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/defaults.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Base file contains the default implementations.
> + * These are defined as __weak so that arch may define
> + * strong symbols to override.

But there's no arch doing that, right? It looks like overcomplication
with no benefit.

There's just ~50 drivers defining weak symbols, so this is not a
common practice. I think it would be much simpler for the arch people
to simply write their own driver controlling cpu_preferred_mask,
rather than tweaking your code.

> + * Copyright (C) 2026 IBM
> + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
> + */
> +#include "sm_core.h"
> +
> +/*
> + * Compute steal time of the full system.
> + *
> + * Default implementation returns steal time across all active CPUs
> + */
> +
> +u64 __weak get_system_steal_time(void)
> +{
> +	int tmp_cpu;
> +	u64 total_steal = 0;
> +
> +	guard(cpus_read_lock)();
> +	for_each_cpu(tmp_cpu, cpu_active_mask)
> +		total_steal += kcpustat_cpu(tmp_cpu).cpustat[CPUTIME_STEAL];
> +
> +	return total_steal;
> +}
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> index ea06e83c228c..634c9f5a2610 100644
> --- a/drivers/virt/steal_monitor/sm_core.h
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -11,6 +11,7 @@
>  #include <linux/cpumask.h>
>  #include <linux/workqueue.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/kernel_stat.h>
>  
>  struct steal_monitor {
>  	struct delayed_work	work;
> @@ -24,4 +25,6 @@ struct steal_monitor {
>  
>  extern struct steal_monitor sm_core_ctx;
>  
> +u64 get_system_steal_time(void);
> +
>  #endif /* __VIRT_STEAL_CORE_H */
> -- 
> 2.47.3
