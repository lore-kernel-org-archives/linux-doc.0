Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7303346AFB;
	Fri, 10 Jul 2026 20:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783713661; cv=fail; b=GX3dqtwZ7a0ejF0250WvBJ4zxadCJmjjxHuleRo/AdfYhH6RgIOEQcN0BvqLC0C/xo6i6C1YCRQD/JUAGq0BWUDZtFYJMCQDBiMlZHqFMkHZVVT32N06K43W9nthkG7HrU6y4YJ9yQmsHr/+8gLxYrqzWMBdEPcEBIj/pA9XLmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783713661; c=relaxed/simple;
	bh=Il6GmTI1+5zQAB6h2wPSuw+zDQ/BFWOkZwEh0z5CZBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D/dhqY9AKUtgwT7t/AMTYpND0DloYVCLPddNkL2KpGO2d9Pwsb/FNPu7sC2176oDj0f3q/2ZEeeb2SiCIr+zctO4MrLlBkorJQwh9vt4ZuzS4AnR7krmK4MvDBeSSwRuw4LLBDs5SnKLFp+pw5uzlTNUz7KsciU4UuTHg1WiXBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rUlH89Xm; arc=fail smtp.client-ip=52.101.193.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUlH89Xm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF2qTKJM8hyJB7Q0EDJsVepfYuXw7DOsKOSgqzIKoTvUFBm+rc3FXllyRRHo56PpexUJiTOaEtlvw8bczK3GnZkMALaGnp/jjU3v3uYYCUbx13vsRJTlTH6A3LGm4QEaVHXobRz6rbZvNPlxo54IfwK8/ZjzICq9ef/pIsjC95uckRs9wztcThA95zD9AVrLg9jPAM24IsuVzx4B00p/TGG9JIvaN0ThZ6Kchlwyp2PfxvfKkQAaghFmZEI2WcgRg1349RezWvVt7wB10ecb4mp+O4CNeQdLMjlrkS32Iys0GIs23wvaUcUJxkmbS4297q8qqt7ewwMKXdAzfP+7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMf/tu/UhunF6ih8TWcmMdmamjclrvmf691/xv8C9o0=;
 b=v1wFrZnQ6BhVTrXzGQI2p5hdhc4YBCWh7S1ahjv90Rs/D44+5vmh2JTsqK8ZlpJSM3GgZh8TmBcpKR9JkNDcYmuVRmLx5l1Z50Z3zf3os6emj9Bv7ZPhGnLsjOC/jlOpjtObeXqeFuSOxZth1MdXjc0Da79w+LLq1dkbjaUmGN3KlUEGBWnPz2cb0jz220+FFGP/aNELVUZBJVTq9PdtBjjoEmjUd8duG76b/uED/BFMNvi7pT/cWHszeAP8vjKzV1xNGvJ1Z8RLx2O+X8MQSS6Y5xD5CJx55dYcdBa8f/oZLvF83ko57kkcYuDQp8pd3Tkairz0EGWd+B5qG1UDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMf/tu/UhunF6ih8TWcmMdmamjclrvmf691/xv8C9o0=;
 b=rUlH89XmstE0eUmd7oT6cWgFyjtfe9IPFpYaYcjcO73g9hX0dGQRZFoYn5UQdKhHjiW/yOTqfEPHoJYKNRcHIP9xilOzQ0lXZKh3i4UNQb2/Q/lGYFuh6PAuj2o6BWDzTWUfFXZXPeig0bD5epbAMpjQ1nd7fdt2NtCRcCERF0cRukn9av2Mm/iIW0XYXMxy/Zi047JfFx/LP42zSyqYYtS5XlAyN42Yv62K1j6W5seMMGoLZk6OEQfXG8Ar9Iisqlzl1V96pQwdMk9VxaLhureG+qOytovhSgMfGaFgK6olXqXbSpBe4I5mnuEmn2J8kN2q6jgFVpJpU9cEM6gNJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by MW4PR12MB7382.namprd12.prod.outlook.com (2603:10b6:303:222::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 20:00:50 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 20:00:50 +0000
Date: Fri, 10 Jul 2026 16:00:47 -0400
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
Subject: Re: [PATCH v7 10/12] virt/steal_monitor: Provide functions for
 managing steal values
Message-ID: <alFPb9lUKCGTN8Ky@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-11-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709215648.1246821-11-sshegde@linux.ibm.com>
X-ClientProxiedBy: SJ0PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::21) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|MW4PR12MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af9819a-54ef-44fe-2005-08dedebdf070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|366016|23010399003|18002099003|5023799004|4143699003|11063799006|56012099006|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	IyIlQ/4CvMDU6qVVKGReu1Y+lQEssWvSznQ5cGIbaHUTTjweMvByqqyZPXoXu1DtTNC8Viapht2ziFchSjdw7EjmxzaYLadNfERQU+A9M04aumdjz+0raabRQ4gK77cvKZZGJMAw9LPlFcKd5XYTAzrmMqM7fo6uOyrTkJLdgAbB0CezlFMg8j8YKFbpxTnAgC9RJnFiGotbXwi4GOuYTvQT/rpsQPcveTgTwapr8oWwVLxGAEx9WnJ92HSA36p0YaCp8IvzoXRyf99pgeFle30FbAKZ+38CDvUWKOSqnQyN+F4IYI3sDn+so4PRc9k2Z2NCLbUC+DV29l3SJ1xMAcFpk+8kgxgxpudo4sx2b0Dcnr5HYKEuWdWrsQuKu6aPFixp8IGkYKpubIUJmvELErqMKxu1OHNc8fz+OU8dxfRdDifDt7M2o63Pp4N5+bAx2cjKuuZG+8ht0TmVv6Ho4n9s7QOv5qDZp0wINNtllFNG3FZdwmOEG9PK2l4g3zibp1UQutFaaxnBmpvn+v694kU7EwnNFaEzDw7in2+SfQQaaVRJiEYZe9DaV7M5M4yBDRPcAQ+LMMhG46uI2AHVNaR2wKjaw+vSQ6YIiAkNLNlTUvT7Ctzv025+b5l2JmGbKgfDGaOU9URsssNXX+B5zxHErXWpN25hz5j1TSJUjck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(23010399003)(18002099003)(5023799004)(4143699003)(11063799006)(56012099006)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8mjlU6kzii/S8IfmVnhJ1pQRa1UOdUggLxOZQ/kRoSm+czf2GBm0g4jabt3T?=
 =?us-ascii?Q?ay5Sjmi9G92Hgep4b3zYr/dvdY6uk9Nklb9gTHO63lxGyKyo/HUOfHjggEr4?=
 =?us-ascii?Q?PHbY0LSiN/7TPntDc8BP6i7WSq2FIH98+CQ/y5Upc6js9Y+Gf3JQe1X9mcA4?=
 =?us-ascii?Q?F7Dm9nyoGvO8wXR+7ihjEWbQK+9w3fUzxqhAzPHklRdIi08PWWRJLj5NMwTR?=
 =?us-ascii?Q?sODluYtVG2coxqaBw/x2KYZDbi3DBGCFhZ/Gv2OCmGuxfsbQ8StDjoTWeCAm?=
 =?us-ascii?Q?trgW60RMsHu8qJdPnLj1zU4002AcZfmNvxJqebMlOJy5ksY8ZD7R8yEM4vK9?=
 =?us-ascii?Q?VBmallvK6hF6NS1/MbzsTEk68vyqKXcMxuDbh4o8oYVVxluCOPfnFsbt6AAi?=
 =?us-ascii?Q?t/OQ0q/u/CXjU1NTL0KfcGtSr5CvgDs/AQ2JavDbc5mTdRcjV7nuGhf1EJIc?=
 =?us-ascii?Q?pn5LuB8Y1Fv6gw5mv/dK8IQLd/AVy33Az9fPEOGcZhyT+hLABx7GyHmNrazp?=
 =?us-ascii?Q?TBKgJkpxuPawKmkNX2BYlKJ3Uo6YNDJcDimqXiTieN9rRs0UW+UZBNlFOPek?=
 =?us-ascii?Q?8oQYfSYBd52qpAd4c7D4kKCms/lIWgmuVk81czkRu+BtRZ5mCgnYfCwlFO4v?=
 =?us-ascii?Q?sFYqhWRCnpdiA9HM2EQ0pML2u0YJsezKpokIHYMOIbn/LHh3vHouz4wSe11r?=
 =?us-ascii?Q?0wdiY5S/f0O9OmaczKeZgWu476cz9CaW0/GFY0vQH95palp/SX3VLZYTje4N?=
 =?us-ascii?Q?KbS+TO3mRWt1VWKbncp/4eVv8ZFNKyfFBnNKk0kAy+LnpIN7Ujlsa5aCO1HE?=
 =?us-ascii?Q?TnalOTJyOq9Q7Q3XwfeSfF0znqwYugC2sWF0Ff1qXqZJCD6b5dy36gm4aDcp?=
 =?us-ascii?Q?FV9FMhgWqH556NjYWBKXXzlRW1jOuEgR0apAg3j37yIGql8ZKoOkA0aIwjYo?=
 =?us-ascii?Q?XiUxJWXOc3HN1cTVmj4GKcgKymDIz1sV84CInwtfYTskhuQ+3MGOcIvoDEVm?=
 =?us-ascii?Q?oxz7QMqNJk4z1xvyKv2E31EI/nPYR4bvqU+yjU6aJmDBcy8BGCXyW9TSC8wa?=
 =?us-ascii?Q?MlpQdKeVxcA9TD4cptjmqwesm2bhnjB3rzeluRFnO5tKVhpTFfgrqK4PvtDG?=
 =?us-ascii?Q?XtSZ7BM3H3yeWlwhWZ3oT1yoYPuHP+R35YtHAWl9mf3RksyckNpF15tc8gNA?=
 =?us-ascii?Q?AZnCWQkxQVG9UTafOUa51hUApVCpXls+SPei/7FgvBTbkhWWpHFOV/bb/PEp?=
 =?us-ascii?Q?61X4G+AzTaEWbqxCIxpvnn2SOFQisH2WHY4f6Ph1XvGdpNtcamYGw/NJ/yq7?=
 =?us-ascii?Q?E8HpfW07rWDGKcRoEgrZF2caiQKXnAdpWWcrxKBkxgdL1HHoZTcYMYsEFgOM?=
 =?us-ascii?Q?FBLZV7/eLr/GGD/KsOAeDTxeciScTB0+Yw5Bype1BXA6bgCMLirzDe1PFc2O?=
 =?us-ascii?Q?/4XvrLVEMP+AvA+KNbrAoEb8Rlka5HRrsv7QRmHcCYGG1mS5h5qAG6YJtZe0?=
 =?us-ascii?Q?BNC89hoa7AdLHxalc6N/a5kCzNNycBG49KHNJfkoLYTiE+XETYcaLtDOiAIe?=
 =?us-ascii?Q?AQiAZVgO8tUbrR+RfWEzIy1TohvV1pileDaVQchBLzxQCgmbn0aaaAkMd88m?=
 =?us-ascii?Q?Nz+/KeizTSK27Sc8ESNSTwSdGa9dLPzB5+in+aOE36S+sH51QTv5j6LVwbzH?=
 =?us-ascii?Q?DjH4mYSmKQ12A71F5VaI3AElpGcQWEGUIn4RCEytdiz8ByI+QlWIIuSHma3B?=
 =?us-ascii?Q?Msx5VtA/Ug=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af9819a-54ef-44fe-2005-08dedebdf070
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 20:00:50.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrCnC7l21fghI+8TDnsRXskrUHb/8iV951g4nzpuxtvpomTZf+V8dwcvoOyih6PSOZtAMmrDM+GPfDcv7hkdDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7382

On Fri, Jul 10, 2026 at 03:26:46AM +0530, Shrikanth Hegde wrote:
> Provide functions which is going to be used in the periodic work
> function to calculate and handle steal time values.
> 
> get_system_steal_time()
> - steal monitor takes global view of steal time instead of individual
>   vCPU. For this collect overall steal values across all the vCPUs or
>   vCPUs of interest.
> - Sum up steal time values across possible CPUs. This helps to keep it
>   a monotonically increasing number and avoids spikes due to CPU
>   hotplug.
> 
> decrease_preferred_cpus()
> - Called when there is high steal time. It needs to decide which CPUs to
>   mark as non-preferred and set that state.
> - Get first housekeeping CPU and its core mask. Mark it as
>   protected core. This helps to keep at least one core as preferred.
>   kernel ensures at least one housekeeping CPU must stay active.
> - Find the last CPU outside of this protected core mask. (target CPU)
> - Based on that target CPU, get its sibling and mark them as
>   non-preferred.
> 
> increase_preferred_cpus()
> - Called when there is low steal time. It needs to decide which CPUs to
>   mark as preferred and set that state.
> - Get the first active non-preferred CPUs. This likely is the last
>   set of CPUs being marked as non-preferred.
> - get the siblings of that CPU and mark them as preferred.
> 
> get_num_cpus_steal_ratio()
> - This method informs the steal_monitor core, how many CPUs it needs to
>   consider for steal ratio calculations.
> - Return number of possible CPUs as get_system_steal_time computes
>   steal values across possible CPUs.
> 
> Notes:
> 1. Using core instead of individual CPUs performs better as SMT is
>    quite common and some hypervisor such as powerVM does core scheduling.
> 
> 2. This doesn't do any NUMA splicing to keep the code simpler and
>    minimal overhead. Current code expects CPUs spread uniformly
>    across NUMA nodes.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v6->v7:
> - Combined patches which added helper functions.
> - Use possible CPUs for steal value calculations. 
> 
>  drivers/virt/steal_monitor/Makefile   |   2 +-
>  drivers/virt/steal_monitor/defaults.c | 100 ++++++++++++++++++++++++++
>  drivers/virt/steal_monitor/sm_core.h  |   8 +++

What for do you split functionality into sm_core and default? There's
no non-default implementation, right?

I'd just put everything in drivers/virt/steal_monitor.c. It would be
~300 LOCs file - quite bearable.

>  3 files changed, 109 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/virt/steal_monitor/defaults.c
> 
> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
> index bd7d120a79b5..273a6dd59fea 100644
> --- a/drivers/virt/steal_monitor/Makefile
> +++ b/drivers/virt/steal_monitor/Makefile
> @@ -3,4 +3,4 @@
>  # Steal time monitor to alter preferred CPU state.
>  obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
>  
> -steal_monitor-y := sm_core.o
> +steal_monitor-y := sm_core.o defaults.o
> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
> new file mode 100644
> index 000000000000..d4b016317554
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/defaults.c
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Base file contains the default implementations.
> + *
> + * Copyright (C) 2026 IBM
> + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
> + */
> +#include "sm_core.h"
> +
> +/*
> + * Returns steal time of the full system.
> + * Compute collective steal time across all possible CPUs.
> + */
> +u64 get_system_steal_time(void)
> +{
> +	int cpu;
> +	u64 total_steal = 0;
> +
> +	for_each_possible_cpu(cpu)
> +		total_steal += kcpustat_cpu(cpu).cpustat[CPUTIME_STEAL];
> +
> +	return total_steal;
> +}
> +
> +/*
> + * Returns number of CPUs to consider for steal ratio.
> + * Return possible CPUs.
> + */
> +unsigned int get_num_cpus_steal_ratio(void)
> +{
> +	return num_possible_cpus();
> +}
> +
> +/*
> + * Take action to decrease preferred CPUs.
> + *
> + * Decrease the preferred CPUs by 1 core.
> + * Take out the last core in the active & preferred.
> + *
> + * Must ensure
> + * - least one housekeeping core is always kept as preferred
> + * - preferred is always subset of active.
> + */
> +void decrease_preferred_cpus(struct steal_monitor *ctx)
> +{
> +	int tmp_cpu, first_hk_cpu, last_cpu;
> +	const struct cpumask *first_hk_core;
> +	int target_cpu = nr_cpu_ids;
> +
> +	guard(cpus_read_lock)();
> +	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
> +					 cpu_preferred_mask);

Nit: you can return here if nothing found, and save on the 2nd
traverse.

> +	last_cpu = cpumask_last(cpu_preferred_mask);
> +
> +	if (first_hk_cpu >= nr_cpu_ids || last_cpu >= nr_cpu_ids)
> +		return;
> +
> +	/* Always leave first housekeeping core as preferred. */
> +	first_hk_core = topology_sibling_cpumask(first_hk_cpu);
> +
> +	/* Find the last CPU which doesn't belong to that first hk_core. */
> +	if (!cpumask_test_cpu(last_cpu, first_hk_core)) {
> +		target_cpu = last_cpu;
> +	} else {
> +		for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
> +			target_cpu = tmp_cpu;
> +	}
> +
> +	/* Only the first housekeeping core remains */
> +	if (target_cpu >= nr_cpu_ids)
> +		return;
> +
> +	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(target_cpu),
> +			 cpu_preferred_mask)
> +		set_cpu_preferred(tmp_cpu, false);

I think it should return status: if the function can't disable CPUs
now, it would be a good hint for the caller that it would be useless
to call it again.

You may keep status in struct steal_monitor like:

        if (steal_ratio > sm_core_ctx.high_threshold)  {
                if (sm_core_ctx->status | CANT_DECREASE) {
                        pr_something();
                else
                        sm_core_ctx->status = decrease();

It would be a good hint to user that he has the driver misconfigured,
and save the driver extra work. Same for increase().

> +}
> +
> +/*
> + * Take action to increase preferred CPUs.
> + *
> + * Increase the preferred CPUs by 1 core.
> + * Add the first core in active & !preferred
> + *
> + * Must ensure preferred is subset of active.
> + */
> +void increase_preferred_cpus(struct steal_monitor *ctx)
> +{
> +	int first_cpu, tmp_cpu;
> +
> +	guard(cpus_read_lock)();
> +	first_cpu = cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
> +
> +	/* All CPUs are preferred. Nothing to increase further */
> +	if (first_cpu >= nr_cpu_ids)
> +		return;
> +
> +	for_each_cpu_and(tmp_cpu, topology_sibling_cpumask(first_cpu),
> +			 cpu_active_mask)
> +		set_cpu_preferred(tmp_cpu, true);
> +}
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> index 8bbb606add99..ee68cd8b1944 100644
> --- a/drivers/virt/steal_monitor/sm_core.h
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -11,6 +11,9 @@
>  #include <linux/cpumask.h>
>  #include <linux/workqueue.h>
>  #include <linux/ktime.h>
> +#include <linux/kernel_stat.h>
> +#include <linux/topology.h>
> +#include <linux/sched/isolation.h>
>  
>  struct steal_monitor {
>  	struct delayed_work	work;
> @@ -24,4 +27,9 @@ struct steal_monitor {
>  
>  extern struct steal_monitor sm_core_ctx;
>  
> +u64 get_system_steal_time(void);
> +unsigned int get_num_cpus_steal_ratio(void);
> +void increase_preferred_cpus(struct steal_monitor *ctx);
> +void decrease_preferred_cpus(struct steal_monitor *ctx);
> +
>  #endif /* __VIRT_STEAL_CORE_H */
> -- 
> 2.47.3
