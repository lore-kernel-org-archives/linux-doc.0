Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012067.outbound.protection.outlook.com [40.107.200.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39222306B3D;
	Fri,  3 Jul 2026 18:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102850; cv=fail; b=L6Hvr+tqADvVU1wXoiDWN5L1ihn8URfXdYIeirgJ1jNHkkCURS7b7cIim+iLQLSB66KJH7udFF2cDWz9E22Fhz1EH6TU11jimTQudg0tRIT11OY/64S9dPZI0CgF22Qb0xI+GIUuaZ9mfFffxYGRHR+oLhe7idD4qmUBPMTLGuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102850; c=relaxed/simple;
	bh=zEthxRk63QzVDiKKC94eeNMLcO33OCRjKSRPLAeml2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Trs/pQiutpHhldszkWYp2PiKJ/jW4GyRiJkADR67QV+oPHM0wzqJp7fqrWggazyKOs0yVonJ9W2iQ7xl+6ZwdXTY9OBvGLgrQlnjkOkxbLD7WYmZnwcpr9dA/UQhP2hATOUHoUiBz5GoVnoatPT7W6M8OPArosO7HuDxH8W5+Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EVOhpxfR; arc=fail smtp.client-ip=40.107.200.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EVOhpxfR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VanHh2mIOv9ePyGOL/1TFsOtJ9KQqGN63gn0Dz6J+2eCvVr7cPnON83ayJWdofKLNYsNFmQPNl35KmL4UvqQ5kdhmWff8rePH8Q3nUQFpXsdxOC/bMYNFZ8/CDNa7jr/NcxgLcfjG14MQc8hSngyZ2qRseJShWTiezWF6MGU1g2+pyl91gdTgXfMT0iUlcnl+xS9hS9cqtR7Y3iNLkuZmfVIb3E/Qh4+5ZsBYJ+qMlcxKf3NLITuy/9vXdLGf/3GJm85CnbVfooK0Ht7KpElXThA6aXImwYgiqZw06j7gFFpM3CKDdYJrQZr8AYeJgkybOd4AImGOlrg6ExtwsReBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LUljg6f3BD8iAjDs15x8O/Vr2BTQ1Pd32HH13TKKb8A=;
 b=ltqg5MmIRL4LvM4MBw3e6um6mLT6rhxX3R04oQvRnRvyGSmGu6ip8bJqopxmmwLp55yBIel5Sa6HwnOdCkYV1Vz7uK0lIkVshkT4AFtDfVoqBTW6xxIG/ki6HEICRFG/k//YXtkKRaljtOLsPPEyg93JWvp8Mj2gXwhxkpe8ZqCOu8ZNa+f2VfrOpygWZ1lFh63TzMjO6l0oKT7pLamFuxZsvlRm7Pbyaq2V3N/rnezfOUKnDmKxjrTxIAZkOlyF0WCS3sE51CLIM7Tgpm9PZlvQH5LPHb1ZH9nyxqV8ozlCAOjzBNPqwNIVyuRfezhmHDvW6UVPor3DicOuvEj4MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LUljg6f3BD8iAjDs15x8O/Vr2BTQ1Pd32HH13TKKb8A=;
 b=EVOhpxfRpyAmEN4naSbEpFMyes40JJ2M47tVgHvmqoyhd+gGVVYTnRznMLF0StfvYHxhoGz3u6A3lS9S6+7rG30wfH8cAqa4UrRuFqvrdnuWz+Piy8XOeuQKzh+/YFqR2o2YY3ZjalpIzRBwE4EmLZfD+3pRPp8RVo+eOpIPA2wHPDGwG5QlOcW8wmJF/iEaxaXaRVy0xTqUFxPzcu1WRlYlkhJQ6iXgdyrA1PpQirva69egn6t3FD3okXVM+tT8FKGljsRYEFvdvWExZhENeuAA7GQEloPA0Iu2oYHPV1kEevXr30T5b5REJzhY59OQIvnRlhXVDeFRczy58I5dqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV8PR12MB9642.namprd12.prod.outlook.com (2603:10b6:408:295::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 18:20:37 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 18:20:36 +0000
Date: Fri, 3 Jul 2026 14:20:32 -0400
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
Subject: Re: [PATCH v6 12/23] virt: Introduce steal monitor driver
Message-ID: <akf9cE22wvPeYNiM@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-13-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-13-sshegde@linux.ibm.com>
X-ClientProxiedBy: DS2PEPF00004560.namprd21.prod.outlook.com
 (2603:10b6:f:fc00::50e) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV8PR12MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b84ef7-1734-4733-d403-08ded92fc74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|23010399003|366016|376014|22082099003|18002099003|11063799006|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	a1WFQ/tfem12PzKJoeOVNhQOseBzqMkRpnzBgnxl24dYs4bTl+jlz8foBlpqDT4bh8Kps4dLfzRNQ3qHTKgip3aPQF8ITFFkzuS8f02p1Aggmf2qQkFWqhHeXEqZzStTeZ85WqsZNbiKnA0pvkQ/PuPUj1tEGs2diI85WikYRMrTTx8QRMk/Wd/HXhTMLlB1wnhonE766n6jNJtZOzaOJf7KTXVrb7iTmRg7Y6azCe1V4qeFrOzmsvKqnr66fD/f5m8A3teS6orw0UrPNwfHA2N6aSdzctWDiebQm3R4cNcInHvehq9P9w1J1kuuk3sN5Yq3DtIPBuf2EIJ5MlNww9FkPd4aVUwjYmJxLpjr112SUACqP3imJ0DX/gX2qTyRZjgxye6+UiKlsym2eYVoCIYRFoXqLTThfb+pFi5Lxe+e+j0zMCmtncsNrFa1T8ahXPRVZGHymQzw4NazUI913LqjaVb/e/5jyUsHbzAw5/jpbfPSULWbx6kUbhAKlGYRFYf8tlw3l4vCBPgiuoM2uXVLHKEszGOfiJLXBvLY6KtZW1P6XwBdIHcb8Yo/NbAhbuFBWnDMxSLwDVWkieTsU+JaVOgEmnAgCyXhTeEiwwK7RTrxkKwR8Dp/j9LIxwylhhN8ohRGm2a2w179L1keRGtak7taSjtjQYR05RrSVyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(11063799006)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3UVh8kGpzxjrMhVpOLaEyc2/UOhmJpkzDv7Jx7fFBYAdULMGc1Az2ixL2+lt?=
 =?us-ascii?Q?jx2/MtxwTcRL/Z4Kq0LN8ZwyJ/YS7mykoXb4aZcFlTmfgZfeCw5PS0pTm7uJ?=
 =?us-ascii?Q?uWNVKKYYURtfLoCmkuCDCmNpAs0x7FX6H+h53Wfj7Zu6EmbBYbB5QHMC+2lw?=
 =?us-ascii?Q?5GfrMzg8RvAQKAHRdpAZIrtM7+oyVuVTBBdZonNNYjWpyUrD7Th4gMbzkkAc?=
 =?us-ascii?Q?dP/XSNkcrMgoZqzcMne1/EmEjgUp7n24/bbICGc6ZaUpQcsFjclIc42opPIS?=
 =?us-ascii?Q?pbEc6z7J8ER1KPLKgQQCcukzmrQOZRqJCniaLXDTGE4iL7BoVvVOTul8TcZo?=
 =?us-ascii?Q?kjjatggEi4Xayknvog7L/lp2DzV/LrDa4YBjpr2uFX4uucxw1MOg7ufe74p9?=
 =?us-ascii?Q?iCEHEsyIbenoVXszjeAtR8dVsPF1k96qaJ2Wd5a3ExQrEdKdTAwRqjbL4atd?=
 =?us-ascii?Q?Ymb4nw5VzcS8YiengXjbcA47Pxyboe0wiIR5RITOuPhg1SGUQjZcSq/5tI2B?=
 =?us-ascii?Q?phXm9dWHahw6jtmPCJm0ZQMgCz0O2s1M8FPGSOfJt+F+2ZCauUdEVJJ3hELJ?=
 =?us-ascii?Q?U1coQgSnAWcEIy+IbQjb02r+G5M9V8b7x+rSknXNYBxBeuVO+JSQdFVSyE0A?=
 =?us-ascii?Q?fMYE5Ixetv7VZaOuFBeC+T5d2T4Yh/wmhQkFnlOoLTga3axYaFGx/5enmKoV?=
 =?us-ascii?Q?1/r7pnTbwKWiJda+RNROPhDJ44lqXuzBcm8SuDnkN1sEQZxqO5da5akukIDk?=
 =?us-ascii?Q?V9jsxQtHqJZMvjxrrT1ex5Z1fZzYAy/F0SCicm/GgZ28fJWZZL7E6Y9m0D4f?=
 =?us-ascii?Q?c9EzUKzC+A3arUmfaed7FfpnGiBb1yRAYUNAXywDW5UISRz0t+kGQ7MEXQCX?=
 =?us-ascii?Q?nTYV6ElH0VJycr//1t7Y7FbS81Se6hvje7Pb0vC7sqbIjhOoaEA4Njryw2fk?=
 =?us-ascii?Q?x+xlG3w/b+yqmM8jWVCprIw30DhyjJWsazMiyQzTZPYcNr8i22JHwsErfbWL?=
 =?us-ascii?Q?Kqs/iIZ/KMs5Xzyn6CEaoqdFMDraYvKbV20VYidpS885ktVhFaaR3tVqKnlU?=
 =?us-ascii?Q?K0S1rAHvFQbgj/G2U0g5TZxYycWaya2AtY0kVqqzB5WrcHd5PGIJFaggjenJ?=
 =?us-ascii?Q?+N/KVmWF9i1+323npxIU3mz6QoBkyZq5cB8T9IRAMcQq/2gT33OVXPAX0fxS?=
 =?us-ascii?Q?XN7JzA+xyOcNHc+xkLk7jXlBPeUUAV8pTFIb8cqL4Q2iBQD+hXy5jxsa3q7f?=
 =?us-ascii?Q?SkQHCECS8coRk69vDcwGf4KANc77mbpiXrhGN4QzL8+lACr6yutgKlJsmnEx?=
 =?us-ascii?Q?922rGlMF3Ymy9oJ3oe41E9ebE6iNn7hjTCkHHNAVjsG7z0G3AQQ62joKqlAy?=
 =?us-ascii?Q?oGDGUDzQHbB0FJLjyKWV+v+7m7cFbSPzeAvwOIuams8zPMbyD6D/XSEtubI1?=
 =?us-ascii?Q?/SuZQTZEBTCdiOWfnyAKaxdOnfeoFrglc/vPoqw1RoKRdkxsephWtXtOxGdG?=
 =?us-ascii?Q?o7Vs6pbGVNE95CXFR0PKMPE46Nw1sw/jIUzTs6OfvPRDy6yk2ovcAOx9VQy0?=
 =?us-ascii?Q?l0dJEg2bXLo3i3xotEyVwuyjmvxxqKB7bVXH0oMFJ8p0vflJsDrWCkWsYS+I?=
 =?us-ascii?Q?Rzi0NdQOZk+aVipQMuQVLr+U3tiA+bOvIApQFCxEL8y5GkCyCvOieUQHaXaX?=
 =?us-ascii?Q?zoKsZRdu0mvPnx+PLKNO0iwWppCp0eKUoAtarVYUFFcZk6sOE+40H2GAx2Rf?=
 =?us-ascii?Q?cJlSpntHYN7q590XLQ+JbF315qDYcHD8ltt7Ca+jBF/fVls+/ZoIYPq+97OQ?=
X-MS-Exchange-AntiSpam-MessageData-1: +Wd+j/l+CyL1BA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b84ef7-1734-4733-d403-08ded92fc74d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:20:36.8693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlYcBUZPNmAWRZbhtDeowQw3nblubw9UNJjwXDeILHfHyLl1hugWxCOEG/UvMlhtzMhaQWxOqFn6Ndh7J09BXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9642

On Wed, Jul 01, 2026 at 07:46:43PM +0530, Shrikanth Hegde wrote:
> Introduce a new driver in virt named steal_monitor. This driver
> will compute the steal time and drive the policy decisions of preferred
> CPU state.
> 
> More on it can be found in the Documentation/driver-api/steal-monitor.rst
> Introduce the skeleton code first.
> 
> There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
> - If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
>   loaded by default.
> - If CONFIG_PREFERRED_CPU=n, module isn't compiled.
> 
> File layout of the driver is designed with having arch specific
> files in the future.
> 
> - sm_core.c - contains main driver code. This includes the periodic
>   work function and take action on steal time.
> - defaults.c - contains the default implementation defined with __weak
>   symbols.
> - sm_core.h - header file which includes data structure.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>

You've split the driver code into 12 patches. It makes it impossible
to review the driver as a whole. Please make it less granular. 2 or 3
patches for the new driver is more than enough, I think.

> ---
>  drivers/virt/Makefile                |  1 +
>  drivers/virt/steal_monitor/Makefile  | 14 ++++++++++++
>  drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>  drivers/virt/steal_monitor/sm_core.h | 11 ++++++++++
>  4 files changed, 59 insertions(+)
>  create mode 100644 drivers/virt/steal_monitor/Makefile
>  create mode 100644 drivers/virt/steal_monitor/sm_core.c
>  create mode 100644 drivers/virt/steal_monitor/sm_core.h
> 
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index f29901bd7820..aff715cea42d 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -9,4 +9,5 @@ obj-y				+= vboxguest/
>  
>  obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
>  obj-$(CONFIG_ACRN_HSM)		+= acrn/
> +obj-$(CONFIG_PREFERRED_CPU)	+= steal_monitor/
>  obj-y				+= coco/
> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
> new file mode 100644
> index 000000000000..24cee55342ce
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Steal time monitor to alter preferred CPU state.
> +#
> +# Arch can implement strong function definitions and override the
> +# default by adding them in arch specific file. It must ensure
> +# that preferred is always subset of active.
> +#
> +# It is always compiled as module if CONFIG_PREFERRED_CPU=y
> +# One has to enable the module.

Why?

> +#
> +obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
> +
> +steal_monitor-y := sm_core.o
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> new file mode 100644
> index 000000000000..e320559c6576
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Steal time Monitor.
> + *
> + * Periodically compute steal time. Based on the thresholds either
> + * reduce/increase the preferred CPUs which can be made use
> + * by the workload to avoid vCPU preemption to an extent possible.
> + *
> + * Available as module with CONFIG_PREFERRED_CPU=y
> + *
> + * Copyright (C) 2026 IBM
> + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
> + */
> +
> +#include "sm_core.h"
> +
> +static int __init steal_monitor_init(void)
> +{
> +	pr_info("steal_monitor is enabled\n");
> +	return 0;
> +}
> +
> +static void __exit steal_monitor_exit(void)
> +{
> +	pr_info("steal_monitor is disabled\n");
> +}
> +
> +module_init(steal_monitor_init);
> +module_exit(steal_monitor_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("IBM Corporation");
> +MODULE_DESCRIPTION("Virtualization Steal Time Monitor");
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> new file mode 100644
> index 000000000000..684a258526e1
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __VIRT_STEAL_CORE_H
> +#define __VIRT_STEAL_CORE_H
> +
> +#include <linux/types.h>
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +
> +#endif /* __VIRT_STEAL_CORE_H */
> -- 
> 2.47.3
