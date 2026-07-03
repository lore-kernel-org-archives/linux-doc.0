Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012008.outbound.protection.outlook.com [40.107.200.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E811A311C3E;
	Fri,  3 Jul 2026 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102456; cv=fail; b=CJJ4+A1Uf/9OyMFsJkVhP3SkcuuqkqIhlh7kPL54lcaJYsynrJo+Ho2KwcHTAyT7YqHroIZfYytU/GM1724aiyDTEXnDcQeH4NVp21Xclm+yt67181BHwvgoTNCRg12y4URplX5CKngnkyy8r1zng4Wo4lI7A8CNe0LZQamobkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102456; c=relaxed/simple;
	bh=4RmLGosaQxWzFQHidhyzQeb1fuoGDSTrv4umuJ0cAi8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K4TmHJL3cwrk7DwigfrBgqxDPQ09PlWppDKHh42V3CBhKtncHxHSGCcgKGjkYp07sqLbwKdrHQZmS9dmYEG2US0hYHfCyRPeiyNe77SxhUeyXVm0kyLisx6DA9gBkMVQlBOHtPhkeu3U0a6xQ2ez1tVgKDunqyO8sifreR7RwNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=heGICJdN; arc=fail smtp.client-ip=40.107.200.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="heGICJdN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RezDczYzPgxCRIzR36CbzxajRrIsZLucdHbLYyVhGVInaGE5e1IzeJsXSeJF9weYFl+ALU8/99UWBmSrmbs8s2zt1VbCuen0Qbc3e4gkmLst1r92LwjHZMOTCSxFkE0sGC9PF818wEnHFRABtvzDeFV8MLyt4enNWNovzXume8Uiuh3PM793gjDRqpC+zCiOif9J8hAZ4uZ7KmdS7g/XiPaGZeEUwd3NjrAuWNVUApX/UrUahNQgbb/wrp06tRVbLMqWL2IT25btleiyu6G/WUJL/AAMxbrY4hN0X3L9F+eDQAzE8IlHplEJSS0H2ZAteHBH1LMJTvkXfbadVr1vnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltzmXBpNL1OacVP2/KRxTz/MbIFa3ZvwsSqbZNR4ZUs=;
 b=i3j4avWZFO4w0G1QyoILU1GA1QXqSKEJ7a0ntW6fC53nbqBNVBmNY5RQRzk4I4Xp2npavqZWONF5i6LIA7d2kTYCL0nUJDa3NvV7e5D3sj5OJRgb+nmGXJa+sAiJYrU30+QwDHRlYlevrQ1bVIrd+HkXmFY/25OULwWLeFksH4he5FPrOppW8QK+4EkA0kj4pfXc1njOisB7IgJhiiAeIyeQDEsV/3m+62Lmg7iyI8qmsZ4OWqH8Xu3X+MT4raGtTVq44zIYiLh0combNiroFFYZnAqKWs0L/ccCMfuO3UDgGdBb80PZ5no+Uci1v3cb5LG1GGNdlGfWe91nkL8ufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltzmXBpNL1OacVP2/KRxTz/MbIFa3ZvwsSqbZNR4ZUs=;
 b=heGICJdNBlyqs5UoQpm20Ml+Ooj49wQifvhAsnLMamVvyljSGoO4gZ9fe4gvzBW7LdrX0j4VFAq6Xsi1Y5qxAJWoalerF9ODiAOl3hf060x73ECRfhs87gp7qG568tle4YW5w4J1D2CR9ICk05HqfLFc3G5XMyH0efLfkk0tjPYH6HbDS0Z8N8MYUg/yA5vEVssW2Z0C25WycAVsjBtzpvE2revQK+l4R0qq99td/fctfD84uy0y9V6d7qU1K1G+t0Z7P8JqYPmPKk4Aa0l02PrRBdddqW5UCQw7lgFqPrOL8igq9Q30Ft7PXlnEtJY6kt8Y4wj37nEh7IvcsxO7bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 18:14:03 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 18:14:03 +0000
Date: Fri, 3 Jul 2026 14:14:00 -0400
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
Subject: Re: [PATCH v6 16/23] virt/steal_monitor: Compute work at regular
 intervals
Message-ID: <akf76J6S5etNOICE@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-17-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-17-sshegde@linux.ibm.com>
X-ClientProxiedBy: BN9PR03CA0450.namprd03.prod.outlook.com
 (2603:10b6:408:113::35) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: e7db4042-b0d6-447f-4be7-08ded92edcda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|4143699003|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	gW91F0a6/uCWJSO42f2HI9+cH+XJuGQv88cguF81zE+7f7nH4k+U4WBg2s5GM+HYq3N3d+z6/rR+LnmEhlKz8VMEqYecpCxFRjZS2zEfIHKMn4nECvuRAYOthph2HWBFqGyfy8TKpVUKBHKQAtEOZ0+l5Eh/uP1wHwcIwz5wqnglc0vCAKkjut1YJo+JUbsZmYZKrCZeAidnZgYw3LJ5CeMR6IN3hQ5s6q0ZZ9uKUHStxALbgNbRxdfiLMwR4uE/qlnxzfTLGid1BXmdBV5eBjsM8QY0T81FmG4qfMQVI9KmrKhr29jPdK4QAofTK4gTWJuR1ValpGXnRiUZfZv6BwRa8WRwVB3scId+ugSVV3gf/yA7jAsN3i84GufzDoTOUyLwcshUxIGGAiGlYOdzK/PISuo5rQ1EkJKBW8l90+2bUzqtHh83dqJlC/nOd+dNkyLBNDOVTx442TMcwQHS7GiOP4YkbvhN0v2eUP50lcCxKWpO4D6h80IcrWibaiiC4LYjD2AUJGGL7S3Adguj2ogrWMF4bI5XOZRnoDx9r7kzQTbTptAsOidhqeJNZpeZ48L6gQwbkjQELUCauIApNqa+xwjP3Jvpt5arVMaCCwgWAHB7mVl8M7cuBFKvW9M04dHZOE7dY/1U3xdT/bzUy6d23CSXYx+IiwdcA7rpNTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZgK3YswNo0yHHAwnGOy+lfq+aFqFnxtJLwSCdxhWxiDzZJWTxZjLw0zURymM?=
 =?us-ascii?Q?Ms6CjEEFYRnVhzVm0RuiEERztpZhcKXs5kDroChqPrdmAJzp5TI6T7gBA9X8?=
 =?us-ascii?Q?j75gId2ZmT5ffOV4qxpkPNg8HjOAjLlJqLupDxKOpVm0KIOcOC8yfejTjbEp?=
 =?us-ascii?Q?0ILB06sbdqWnYdcxwZ/OqOKKlxFF0H2coToNYfHcvddwigjNQ9g/2pDeXiTz?=
 =?us-ascii?Q?k+r6sN0j4kg4tYB5gD1tXWtmpprVALIWROnep5pbHxi8rGPZ4kB+v7xEGlo7?=
 =?us-ascii?Q?v6jkZSErch8v/wf5MFuq65M0JLpq3TiiyfQnpiRIAko6PMD0sNp+Tpj8Dnkf?=
 =?us-ascii?Q?JOW0sg3WXUgCPrj0zw97itTuqhKxjkiEldwaO5nt0DvciW/PzWy3ztYzrOnD?=
 =?us-ascii?Q?wBfhXP6HUfo/E6BWUo7x7luix9iJnBrMppQR3WKjWEqL0CIxcmJnOz9BZkEn?=
 =?us-ascii?Q?dP6ztq/JYh++46GTta23kHsbe7giysq2sIIx6/kXGIMgJd78kPazVWw8MDHL?=
 =?us-ascii?Q?cBHHhfyvYhMsGEWbImK4JdoHhgGfatxUE1fVUs2lKO2nfeA2DwYG16IWMlo+?=
 =?us-ascii?Q?vFfJcMx792eN/AicHqiKNAiwrioEh7KCyBR/bsOSp8vtudfvSG+Fp6xOewfx?=
 =?us-ascii?Q?ejmXO7DSf1z9ohyYPOQG2U51qepn1FMxggofjhoRU2LcJM512a+saAY9cWwg?=
 =?us-ascii?Q?vHtzLeBOuLCfG1ZuoepATgMEKT8CIALnXDxJRBbEvpBwiU7nyQQCWCp1rTv1?=
 =?us-ascii?Q?i3fSthkUQiicv97WoMtMP4fWmifE72qGeL27IiGczCzg9PZQe+vUvsJ3tV/w?=
 =?us-ascii?Q?vQXz80Em4uUhTaKrmoYWRwmXxMEkZa6S1GbkPQX+Mb3HTDu3RGeTzJL86UkD?=
 =?us-ascii?Q?FEvDFoJVC8xN84nodteiCpK7/ppRb7OPwmqniEmckMEpHE5TjsTmXEZYaMSM?=
 =?us-ascii?Q?vwi9/Zuyjjxd8exzxp3voyvRzxBVD5zbFk68Y3sb11dsaxGDIzuDcLb/6HLb?=
 =?us-ascii?Q?2NrnDDi2Dmg9FF/nH8SyU2gCSbqnZnFbZh3DNFPLGJW02quyjWXMMh4auc7o?=
 =?us-ascii?Q?/lkoxhyVZWAwz//AfTobykImURjvwTsJcKGHVU1ADB4prUj6KNMoMkG6iSkG?=
 =?us-ascii?Q?vnY1TH/AHaKLqLGT+CP/1mXTYTDhD6QogpfrWDs78y01jozYOPPyQf3RdVUn?=
 =?us-ascii?Q?hoZ3Zz8LRc89+H9P9wasE2yoK3ajwE6Im6ZWMS2/A0ewElWhDDK+q4Qx3gym?=
 =?us-ascii?Q?1WHWJh6KYssldrg8YPD06fFQehpCSSwpTdA6hii6OsAdNjjLuPDWmvxBDQab?=
 =?us-ascii?Q?VTZxjY/Guv/PhYq10I4hn9WGU4m6eZnP0ZFmHsaKWQjo8qxX13zBIU8VTY1D?=
 =?us-ascii?Q?9kA9l48V3HXCbLk4ZL2E2Nqo8RPIoFJkGbMaeiOGTgubRgTUcA2vk6KthZQT?=
 =?us-ascii?Q?XNGznjx7sdd+OEeq+zwlfZbpVPUMGpnsUNdBa1pGfOwV6iop6vL/w2q0/vm7?=
 =?us-ascii?Q?9oSLPxJcWt4PImVCMGO9X+xqd76O5Z27abckEaCEnA3HBe7gVVlyLs577aQG?=
 =?us-ascii?Q?7CjnkKAHbJBuZo94agHqcu5rNP0cSK1UzNZcJJ61+SNuISgnKNhLVfzLsWgS?=
 =?us-ascii?Q?yuAvbtIOTmQp6Nbntv2fV79/0N8qawnn3elozWwTR2iH90lfQ5utoCKWEmrO?=
 =?us-ascii?Q?344oe+ecSh/8Uk6+aZoc8xtywngwUlFuX4y28dYX0R8kTgwcMDL2de7qP/lN?=
 =?us-ascii?Q?oxyfxwRqBqJ92eiQT+dCwzCw0mfdFJkGAtmutFW2Aug/1ff8yzwTKxZnpfqa?=
X-MS-Exchange-AntiSpam-MessageData-1: K1jRe/OJJOwExg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7db4042-b0d6-447f-4be7-08ded92edcda
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:14:03.2198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QwRoUIEfw91GwX/UvToDccE05zjEKowOLg6d0h1FSUWQKzy4r3/ePLKvCfwcCy/WugdAxYT4RohNPm6hlAeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456

On Wed, Jul 01, 2026 at 07:46:47PM +0530, Shrikanth Hegde wrote:
> This is the steal_monitor core functionality done in periodic work
> 
> - Calculate the steal_ratio. It is multiplied by 100 to consider the
>   fractional values of steal time. I.e 10 means 0.1% steal time.
> - If steal value is higher than high threshold, call the method to reduce
>   the preferred CPUs.
> - If steal value is lower or equal to low threshold, call the method to
>   increase the preferred CPUs.
> - If the steal value is in between, no action is taken.
> - Save the values for next delta calculations.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  drivers/virt/steal_monitor/sm_core.c | 26 +++++++++++++++++++++++++-
>  drivers/virt/steal_monitor/sm_core.h |  3 +++
>  2 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index 1ba638224abb..b499faa61010 100644
> --- a/drivers/virt/steal_monitor/sm_core.c
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -32,9 +32,32 @@ module_param_named(low_threshold, sm_core_ctx.low_threshold, uint, 0644);
>  MODULE_PARM_DESC(low_threshold,
>  		 "Low steal threshold (default: 200 i.e 2%)");
>  
> +static void compute_preferred_cpus_work(struct work_struct *work)
> +{
> +	/* At least one core is kept as preferred */
> +	WARN_ON(cpumask_empty(cpu_preferred_mask));

This is very true, at least one CPU must be preferred. But throwing
warnings is useless. What do you want me to do if I see this warning?
The only possible solution I see is unloading the driver and not using
this balancer at all. Don't think it's what you want me to do.

Your logic should make it impossible to have the preferred cpumask
empty.

> +
> +	/* Warn if interval_ms is set to 0, that might cause lockup. */
> +	if (unlikely(sm_core_ctx.interval_ms == 0)) {
> +		WARN_ON(1);
> +		sm_core_ctx.interval_ms = 1000; /* Fallback to default */
> +	}

WARN_ON() means panic under some configurations. You shouldn't do
that. The proper way of handling it is failing in steal_monitor_init().
This function is int, not a void, for a reason.

> +	/* Trigger for next sampling */
> +	schedule_delayed_work(&sm_core_ctx.work,
> +			      msecs_to_jiffies(sm_core_ctx.interval_ms));
> +}
> +
>  static int __init steal_monitor_init(void)
>  {
> -	pr_info("steal_monitor is enabled\n");
> +	pr_info("steal_monitor is enabled. interval: %ums, high_threshold: %u, low_threshold: %u\n",
> +		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
> +
> +	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
> +
> +	schedule_delayed_work(&sm_core_ctx.work,
> +			      msecs_to_jiffies(sm_core_ctx.interval_ms));
> +
>  	return 0;
>  }
>  
> @@ -42,6 +65,7 @@ static void __exit steal_monitor_exit(void)
>  {
>  	pr_info("steal_monitor is disabled\n");
>  
> +	cancel_delayed_work_sync(&sm_core_ctx.work);
>  	guard(cpus_read_lock)();
>  	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
>  }
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> index e5c3ea0a63c9..ea06e83c228c 100644
> --- a/drivers/virt/steal_monitor/sm_core.h
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -8,6 +8,9 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/cpuhplock.h>
> +#include <linux/cpumask.h>
> +#include <linux/workqueue.h>
> +#include <linux/sched/isolation.h>
>  
>  struct steal_monitor {
>  	struct delayed_work	work;
> -- 
> 2.47.3
