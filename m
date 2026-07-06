Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FDB3B19C1;
	Mon,  6 Jul 2026 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783370035; cv=fail; b=tgym06dTHnL16LQr1hnHrfuRAEbMDKe3aZ6fUc/O9Qumz03SP4mIgze/Ee3BsjSvvMTuPTQijx6I0Bs/IxYEYDG+mxayM7X2hosWIkqUasYLJLGng/hFVbdOXzF7btkgUtYi6v7g9bR6kPs9XMlW53t+2hqnKbivKD/FDud0sjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783370035; c=relaxed/simple;
	bh=HBRd6OXUvo6zEOPl/J2KPsW812cGZaRQAnx1gZxKp2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OW8SWQDUpeOtm0h3xfdbVbh7TLonmbWMJQTDNaQzzUKi9OzW+QUMrkYOkBxRsgBhBLxwhzvoLckP8FMcq5jcO0Llc2Q8hAIsYPoEpd5BnmUIMrJg/9n7qv6szcqwBIi96qIZwZskID3FIjbRzE83JDvR4RKIIUYwWKRx0rRMurE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BVG3yaJL; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BVG3yaJL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYJat2Go+a2q6HecbScWGaG1GXv0TR4SDf4ecowzsT7GrjNORzjTegNc8MaM69i85vki2wUvfu4JLihWSeEzQGyhREbFImLLblcd3e2kDC11cnA41VL2oxcLjAcLK+X9CMq4RQAP+kPj/sdqKEXj97rT5xuL24Zx+uWSiS6pa81DcAIulE1qOEDvID57f4Mw2e2gWm3A0alwEH7dRLa8KPKjo4OibUsfuXyXMIEvXUkGjDbTdSeueXMzNE6661v+skkru1dGJ82nxrW4xu506VNNF8qXFqFQvK1fGWc3+2qic6uYjqJzCEkik4jwWdP+2BHj3KWyxN4yY8TF2UV/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLwcIblU2p518hEFIIt07DKWwvIpDG2i8E5mDSfJQw8=;
 b=SCS2J9M9NioYaMhTTZpguPfzktM+l2uirxWULRNU8E4x8/9OhNy22Z/JQ1xOdLdMFnUM9lpYRBtZFT2JSlSZtJVaiuYMmgu5px+1V+mXzhMFFwVPqfnkgq7TmNP2B0Yl8AfpbjIgRjLEcnvtks+oMIysaexAxV+pYsOa3Pn0539N6ylBbVBFXj5mriWkXuI5WLWPC35hcp0b+3s15Xw8HZCTU5mkriVDhxBaCFhyEGHDZcM39a1UcKnQscR33ATGZLed0ZvOsrqpFN+64N1Jno0YOR82OR1qlK0fLhK6k+B9cCmC+qqXpHh5n9u106kKyx5ortsvuXiHGcVCyjZa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLwcIblU2p518hEFIIt07DKWwvIpDG2i8E5mDSfJQw8=;
 b=BVG3yaJL5zsaBgX3SaMfT6k8SoZlClJ3WxQrbRT8ryLqCD8Cbt9ybzeBiqQ2+DPznwpqjcHeEI3ejpc0Hygx0ff8jEKsUPy6n1aXF5/50SjEqJqs/ZzRrCuAKev6PPpFHXMvfD0hm0LVtdKVhMgOO+l1QngXgh7y6zmTScXr/sPfPlrneQP7ENmQcYS4j51NVvS9HxiYyG12lQYZZ+tJCFqtvrSt0PHBFE46Ggj+EFEuAYkt61XmxwIpP86UimuXWTh/xRgTUI9ICY1AmE/+2Z/+sJzDriNV/CXAXlJVC8ftLKxIpz6utXnEtXavWceEZEzeh/1ZSZ6rdbD1+DzajA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS4PR12MB9588.namprd12.prod.outlook.com (2603:10b6:8:282::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 20:33:46 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 20:33:45 +0000
Date: Mon, 6 Jul 2026 16:33:42 -0400
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
Subject: Re: [PATCH v6 20/23] virt/steal_monitor: Act on steal values at
 regular intervals
Message-ID: <akwRJnQklymOjNTv@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-21-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-21-sshegde@linux.ibm.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS4PR12MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: b0195b29-802b-4791-c2e8-08dedb9de06a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|4143699003|5023799004|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Vuq7sKwlpgmpEC9vgK5DueKVs4rjgJ6DTkJa+Q/mHKnZM5Z3gWeSDIPcKNW1HBGm8guknVBx4XVdKO+9ZavxVvGsHFiBB76D6OeL5LCfB+daWzVplgHwRN4vHsZAPHK1NRZRpmAt+/uS6fkis6WL2MydX/TfmxZWE9YDtPauWXL1/mN9Wgfld09pcP1hsCBpi6GD0p6lTh03IYcsXPGaFOB9XGln/ySQ0G/Zdf7Ax7UIIBkC7m3ayzWjokDMKZt6PG+E3o4emelcW0EHGjFp9amE/wzf00kgaTdVuIUnXWWT+w7yhKcswvjoo/5YqH96D8X2Ir+ZHquwB++2zx3AgPGSpibTGrhjVNnIFhPqgrSTdu043F3frMljw0NbnuzHuVgThANz4ho4smsBykfrRSOBaZSNyoz8QdlxUiXk92znR5t7lkL63+N0kXnAgZt4opE9hkJfAzciBktYvadFXig+KYnR4sdGQCYQgPkZ3zUjL2FC90XaqQBFJxSTFJGgOKDf55cBeNR7CvGpTGoX7NY/50z83k/hPgg+AJiuaTNeBdDYQp6Xe/XvOu/RhGglWnBa1gBW8lt4eMOa95zL0haubvpLhlXJ96ftMVD3fYrqWb5B7vEn5q5ZMIcVFdJwYqCZtxsp61FSUKklKt/KuV1pjFeGuQY9gkjFh6//ZaI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(5023799004)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lXK4Q0SXuUsE1YGPc/NsG3eAsJD7UK4Y0lfxmUCyIH6Y0/Visk8FvEuHz8TQ?=
 =?us-ascii?Q?sppkshn2HQ8sjmPITSZneOuOuTlx3KU8eYN+PeEtIOsh1PENp6ZiR0mHwwNE?=
 =?us-ascii?Q?dnwqp+fVpqH8tMyEou7pvdCdUb5vD6fFtfG67V9bSfofXutQYVXxKBtbdp7f?=
 =?us-ascii?Q?tr3ACTfZjeF4xCJ+kBKlNC71R7KwtZTyRbfm0ir6mHY0yJM0Ja51PIgJrf0+?=
 =?us-ascii?Q?1cAe5mP3dV4nwzulvPfY69ODELIf4XFtkIRUFEyues0YhwerDz7DmPwGm8TA?=
 =?us-ascii?Q?PjleF6DMubhntUnlsZgC+ROacr6ko3EnD/R1EnF6j7hrQpNBPg/+5TzqQEXP?=
 =?us-ascii?Q?ZqxMbwh1VpRSqNozj5tuFLFQUpCozxfeqwqqJQtNYLzOnr5Zo0QdAu1cu1hx?=
 =?us-ascii?Q?aViobEsbk9QlJ4zT+It8RhoD2X2T7tCg+iTj+zbMcUNX2CKsDqs5KVbd2LHq?=
 =?us-ascii?Q?9pBmlcBKY9WY7dWKzPPvC0dDPSrKoL1opvaLNFJ3WfFXLgW0u83Yj+usUWQD?=
 =?us-ascii?Q?6+T6dNZRI/0dfSPV+UjxcNSrg2Ct8+iJfe+0x86EPHzT35I3EGDhhV6JMgBi?=
 =?us-ascii?Q?1ILSOCc9hwSLHNgGTtrYAwOzFnv6XGxI38zLSiAT86O3kr6rg2uSoeesnbKX?=
 =?us-ascii?Q?k59p8kCa8rtpZ5yL6F91yluZvsjCmS/KlTU8/FcfTQfyN9/h9LBT1D6cR4LY?=
 =?us-ascii?Q?T41U4uiPtOrfzynWOGPtz9QXCUxV3wC3R8ynhOLbbM2NjY2gbIN+kfXbhRtH?=
 =?us-ascii?Q?5qVFlbIYA6q/RgXJ/Q6k/fekG/UGUN75atQ/omBTpDtvdmzF478TJHMF/k1E?=
 =?us-ascii?Q?zM1x17VCkFuHw+g03YTpci3sPi2vZwsupQIrAYNj9sPEFxVYa5CSfoJAWVNj?=
 =?us-ascii?Q?exrgfgDRynX+Afs9I+Yfe0iU7ModBSoeWLJRYQvICFMT5fvqYx/k8ZLaOMqz?=
 =?us-ascii?Q?Lu0bknfrtCvEwHWWL+KoSQmiaFmE2X8nZYDSU4HQbB9bkbjdOs6yzJok52wX?=
 =?us-ascii?Q?n4V7z7AxPB/5b6p3e7e/+y1+C1OpUKYDUw9xX/YCuoKE5gXWDmcQjaMX/hXO?=
 =?us-ascii?Q?XoL/PRPDrBLNeRrSiiVgqOyLKlDKE+iKchNDiA8519LTolrp5zRsmIMZMbvZ?=
 =?us-ascii?Q?5vwQXHhZnA2lsLulc7dBmJBc+ehgIprXMAKDUxBrBk6xjvnWJ3Ptxu3eGVcg?=
 =?us-ascii?Q?L5frcs4GG+VmLDV29ftUwn+TG7S/6wNj1JNVNww3M/JEXlLadkj5YwC2H5zs?=
 =?us-ascii?Q?aQQJHXrRuQSWWi0RkhX5SiMybzuL1Gn/xdejoHi7THZzymX5g9CVoWSDrvea?=
 =?us-ascii?Q?zQbj+rrNNJanY+HVWopXvKRv3WIasOhbkFuPOAMWfSIFbaHKC1dLJD7XMlzI?=
 =?us-ascii?Q?Ad2O6WerGqoXWg23IBtiIeiePjYIoWqxrp8o9PK0JZQVWVlO06Kkzjq1o9ym?=
 =?us-ascii?Q?eonluxaVRMQDe9W2/qR7hBORkgv/8KYSAbQNz19anb4TTX2Dt5o0J33AW440?=
 =?us-ascii?Q?49sfAKWLLbj+Z9F3RBmhhiRO9H4gJGsN1YVkccmjEgOWzMFB4xh/FR9mJKQt?=
 =?us-ascii?Q?qHF/jGjuDO+X2wlohW411d9zHcviA2DXkw5OZxt4sTlv8NwWidsYO8K5r6lT?=
 =?us-ascii?Q?5D33tqqq5TIQFwJyG+XcviWZmNBciQ/k9czJ+8ywSvqXZyKZISWfAyXqAPWH?=
 =?us-ascii?Q?IxlEJ2gFlH5WvbvWldT07TFcOyXWzx6KqzYKnkQVQQ097KG0brzyIPr3vqfc?=
 =?us-ascii?Q?aQLGZIO7Og=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0195b29-802b-4791-c2e8-08dedb9de06a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 20:33:45.6550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUwqk7kaZcbvNGBSWBK5vF9oeSFzXllBEoh0AngnNi7I69MqEm0wYd4p4yGmQLTwi9IvKcCa3ymj76g5+cq3Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9588

On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
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
> v5->v6:
> - Address u64 overflow concerns.
> 
>  drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index b499faa61010..7b7435f79b85 100644
> --- a/drivers/virt/steal_monitor/sm_core.c
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
>  
>  static void compute_preferred_cpus_work(struct work_struct *work)
>  {
> +	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
> +	ktime_t now;
> +
> +	curr_steal = get_system_steal_time();
> +	now = ktime_get();
> +
> +	/* get the deltas */
> +	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
> +		      curr_steal - sm_core_ctx.prev_steal : 0;
> +	delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time)), 1);

The below return on '!delta_ns' makes this max(...) useless, right?
Regardless, if the time between 2 measures is less then 1ns, I
believe, the whole measure is not trustworthy

> +
> +	/* Update for next calculation */
> +	sm_core_ctx.prev_steal = curr_steal;
> +	sm_core_ctx.prev_time = now;

So below return should go prior to this update, because 'now' is actually
the same as 'prev_time', right?

I don't understand why 'now' can be so close to prev_time, because
you've scheduled this callback on the regular interval. But if that's
possible, can you explain that and do like this at the very beginning
of the function:

        now = ktime_get();
        if (unlikely(now < sm_core_ctx.prev_time + sm_core_ctx.interval / 2)) {
                pr_warn(...);
                return;
        }

And if it's a never-happen condition, just use WARN_ON().

> +
> +	/*
> +	 * Multiply by 100 to consider the fractional values of steal time.
> +	 * steal_ratio = (delta_steal * 100 * 100)/(delta_ns * num_cpus())
> +	 */
> +	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);

You're not multiplying by 100, you're dividing by 10k. Can you reword the
comment?

> +	if (unlikely(!delta_ns))
> +		return;
> +
> +	steal_ratio = div64_u64(delta_steal, delta_ns);
> +	/* If the steal time values are high, reduce preferred CPUs */

I really believe that the below code is clear enough, worth nothing
explaining it.

> +	if (steal_ratio > sm_core_ctx.high_threshold)
> +		decrease_preferred_cpus(&sm_core_ctx);
> +	/* If the steal time values are low, increase preferred CPUs */
> +	if (steal_ratio <= sm_core_ctx.low_threshold)
> +		increase_preferred_cpus(&sm_core_ctx);
> +
>  	/* At least one core is kept as preferred */
>  	WARN_ON(cpumask_empty(cpu_preferred_mask));
>  
> @@ -54,6 +85,8 @@ static int __init steal_monitor_init(void)
>  		sm_core_ctx.interval_ms, sm_core_ctx.high_threshold, sm_core_ctx.low_threshold);
>  
>  	INIT_DELAYED_WORK(&sm_core_ctx.work, compute_preferred_cpus_work);
> +	sm_core_ctx.prev_steal = get_system_steal_time();
> +	sm_core_ctx.prev_time = ktime_get();
>  
>  	schedule_delayed_work(&sm_core_ctx.work,
>  			      msecs_to_jiffies(sm_core_ctx.interval_ms));
> -- 
> 2.47.3
