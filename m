Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011048.outbound.protection.outlook.com [40.93.194.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398C030C164;
	Fri,  3 Jul 2026 21:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783113075; cv=fail; b=Qp9dLPg2yE1KrFUHWMmkJq50m8R+bIi+wzRUZISfMDEUmSm1e1iJ3PjroKu3q77dyTmS8/LlmKyPgFUT2YEIbw2GGsnhXHaAJJjAa7SZhC1c4rw1fN6L8HuD/6nZmPQpD9E3TpmU3qW+sOzwH2vB3KnjqR1oXzQYUlgKRcetyZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783113075; c=relaxed/simple;
	bh=sHC84Bo92HMqApFdvcQBkU+ps7291jAuAkPOyzm+F5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U98AIEaNq08nSGccEE/Re2avLVEKozFAkxEUDiPMAnVOwVakMKB21mQnVUnwXnyY9KYxJtwNF5mD/c431vN4arB4Yp2Pur4+MnfuxdUxDcwjt2hvEk8bYJ4rV/i0HyfTaJBlH8l/uPI8IzLewEkw6dUfV801tUX5t1g+EsX1zds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Vr7uC09r; arc=fail smtp.client-ip=40.93.194.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vr7uC09r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/Dpry65RncwLH1BFkIoTDXObGtLOUBKQPcH+/cZUOtUFK9jPcPIylbp6Gv+V0xIGQfl3wkO91keqraBsYzehK7xCA2VKe8YJlpFqMHg41Z45Cznt/s6ux3y6ZoVJ3f6B3mLDuDdqBXexvb2ZhbTqqv2QktIVATZLcgzyl68z90vSoggtVAyNyhYb/TF5BclaZDDvptaLy0mFs6q/ipUOnMRXFB6ouB3P3hwMfDXPN2ZMquujuxaqbzU+NmeLJGmLTUFj1cC9WeffRpWsrj3aJ2bvXUzSNBhjevy/UQ6G4zdJgacHx7+s8s6U/s2dUDQODvm7W/SxxtUVJyscGCpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0LOzoSu1tagWWHxyc8c9ENN8+3fpAKwgnI4cssGYpE=;
 b=BkBkUvNPrYOlKKKfqA/Dgrx/zcTw6jHZbh/JeSowKdzBVZCKgw/947HaelgScgEgi1RnWjf9wxgYBbSeRvra+K7zPybu3vrqGHHgyTDfwbH+xJ+G+eS6HCIm/I0ua/C8Rk6efF3hpbb8wuJp6tNQkKSdUIJ2Pt6TstgeRiUK1qV6vnAu/XTGcRSWI+JYntAJxeezaKX4S/Fie4AQYq6KxwpD76XL8IF9cHgg2nDBcr/KhF/L6yID2bHYsEOXsFgxd0tCGyN6rlI6HN3NOfPA2MzynFkAy3VzoO52uv7zjzqIG0MbBLkwMH9uN48E0MzQKIIl6aA61CXtQtQh9msoKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0LOzoSu1tagWWHxyc8c9ENN8+3fpAKwgnI4cssGYpE=;
 b=Vr7uC09rK1ebhEh5Cg/k0QmduFVrQvZp+yAPsHTr7SBL1K7xxEySRFWApGM5XjNoPEDXiDGpS+LslLLtrlj0K/OF2Zt8hppFnzz1809Cs/B3LIwE7Qgx4/3WDsDPL6FbrTePs/6S2MkaCZmJwiJVQYfZ1L+bxBLA1FZmjHzLQXUOc6n+wFGOU73Cdd7HUo49IFtl4WOtrkJJo6mZsBzrpBg2nxqzAoblsaaJSF/R5XpNakwmwtjPbVvPgrjRergVNxCOVbpnWva/xJWqVPhwrwW/HJeLFHfPAKSWqYct5Qm3aB8oYmrKzfLfjfAZXSQuD72cft0K8q5VuF7lBJdw4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS0PR12MB9323.namprd12.prod.outlook.com (2603:10b6:8:1b3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 21:11:02 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 21:11:02 +0000
Date: Fri, 3 Jul 2026 17:11:01 -0400
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
Subject: Re: [PATCH v6 18/23] virt/steal_monitor: Provide default method to
 inc/dec preferred CPUs
Message-ID: <akglZQrZ0ghbwLth@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-19-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-19-sshegde@linux.ibm.com>
X-ClientProxiedBy: CH0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:610:cc::17) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS0PR12MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 8856821a-afee-4a37-f113-08ded9479679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|4143699003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QpT9gvd19Bt2zZrvzJqv7jArbpWQ88pvgldgRAgeGbRpNNjamgjRHaoJ09GeNxmaFlaiyhoioaKb9hxCTUG+RVZaQEPeGa4r0OVsSpArexwhr+C+Ojuc9hDIOHJz3vQLHbxFEp99gJP5iFPgJqlY6z1JbhZLlQzK/8sYKs27P2EzQNpHwUp3S1+gWAjyhrW4IzUzgAB5/Pp9+SbJFR2JNK1g4BniBBZbfdQ6BZIdG3yH0FR4IAas3aw/ffZPUJ1R2kieJYhjiwITI5+dL0DQnb85+2lDgS58FPvLsJCE6z0A76vcMdfHG3e0YLaG5B9ny8w9vP9BQouIV55Znt6sJy65/i2SpU70KGlJ4DpI6WoJ0S2qnLXMRE6hvwdubaDZNigZXY5Ap8haregmsA2rBieAvxmc58GOkLmZpNUQ6zlFDDXedNCHcXBQRKzw43NtgV6yMsKgmTiwvc1674dMIIp62OhrSiN1TJNLgNgp7ZS8t2hxTgt4dZx7w96xA+hQTB6qFNWCE7wItZhOQV0J6XS3+RndtciI595Q/qnCUDNtnAmiAmXQsHmOrCq3/ExzQvzvyagbHiq3H20THzFSDvSCf+I5StydKK7y5KE/4DJWB/AxUSmzhSxg4m23OohfF0DnTU+G7Dlb2cGrZQHNXgM16IhNahEG+I6mpj2uFRc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(4143699003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y8pg7X7MVIT1GNt1Ykf784vS2F0LMnuCTf27FMtiNr434iuC4sDZMu9oMqyq?=
 =?us-ascii?Q?f66vhkxaF8AFC3PmjE80PYE2Yw+cMLfdHMTUqNNoXTjMizxS7lPBjzRMKkon?=
 =?us-ascii?Q?sefvqhbBmJriDHdf4gv5Q1nP7KGuGTDGfhR7J/GGVsCX9Yxyk9mYa+MHwk9D?=
 =?us-ascii?Q?xij3wtOxjSKJfm0kJpEgHKrzJIsTSwTxHZK6Z1OQV3mhBLqL/Wm9wgRZRkxQ?=
 =?us-ascii?Q?4berJAxWE4sCo6sze1ZgOL4AeIB03P6ttX5FY8lYxZNZT4dQAc2YnmyfNVdK?=
 =?us-ascii?Q?6HWHxd3VGHWSd4WJ5HGgJUWcKGu/oCEh/pzyEkURZ5/vdaZV6PZEdhx9IW9y?=
 =?us-ascii?Q?wOZnNWoPV3f45nsoaSwth7bhUS7dehR4u/tJJzvKR2fPd2K5dXuBbbW35akL?=
 =?us-ascii?Q?LSPk6rSmu0XZzk0rTVcoQXRx0Q/hyU+IvOSBC2HGhZtp+xcyxSsHRSFGb7l4?=
 =?us-ascii?Q?EtxZnCyxOW4VT0/O9VxM1z1+cHdz7I3JXqm2Xmf94tHDh09T5ujUFEV927h5?=
 =?us-ascii?Q?sd4KmrNNt2rMTOF8MjNMHGhcJmhA8M/xik/LJVoXMsPqavmtmVyvDHLjdSN+?=
 =?us-ascii?Q?qX/XCR6+mFl1pdeS600LprhncpdtbJrG1NYV99qYTmDqYWLnRDgB0UfOdSpm?=
 =?us-ascii?Q?VYDWcB/TydwkhsgBcIKeTbZJ5qCup+zOdUOKHYyY2KUBFIML1qHf0Y1U+ffj?=
 =?us-ascii?Q?1Rv8XvyaLNtXkRIYQwnDalNXGzm2R1f93FrkFZNnPI/SaGNa07lESg1rZvkK?=
 =?us-ascii?Q?2fMRv2C9QR+761vOo4IWj1K5F73k2xv4BKeWSV86wunJWS/VYxcMNjO/O5ey?=
 =?us-ascii?Q?9MUVdehAtAKxiQTxXpopa1n4AUnNhHNNcptX4tYYJHg4gA6YRj7xxaj1GPxK?=
 =?us-ascii?Q?cRk4MkaFlvpGdefWv/aO0HSo7HilsuLTMx7ZC94BUiUX6ZMB1mBGcMT76O0c?=
 =?us-ascii?Q?4gCyxyfq5WU8P9D3HwFZ/lTR3Zea1C1XqokCM1yqHbUXr1MmFyk6T6F5wZyI?=
 =?us-ascii?Q?MWwDIiGYAxNyUoE1zZ7MBCZwZJxCsT344mw/st2neEMCR0aPtFg5gkITRjrd?=
 =?us-ascii?Q?CzVFuktku+bJ4e661Dm509z9/TWbczRIf1uDDu5n4SIi/qZnAJvao+2Rrk3A?=
 =?us-ascii?Q?LhkOLbjEbX9vYgzCWateG/Eh+/1cTn+oXv7uolfQL50lkf+R6YuEsVxdmiXU?=
 =?us-ascii?Q?xOASRkE2RIxUx0pYpwlwAMBYy2rYTePygy3iyTPua7mJ17M9XzA6CiCnu8nZ?=
 =?us-ascii?Q?HATdTH9G6EaR7ekhNsVGQhCR84As9Q9eYz5i7PS5ilSydr+YiCu8Nga1tpwh?=
 =?us-ascii?Q?i3zlZ3mWFp7LC96r4lP65Pax6orsD3Ibxa7sfeMeAR8HlRixddMscR4O9Xdb?=
 =?us-ascii?Q?omZnOYB7PLghcFsPqJsYQH56Cva4mGLZufZInAsP2PCof40RNkWKL9gTVRxS?=
 =?us-ascii?Q?ToGa0S2I95Xhw0w/OVfj/zUj9axl3c/g//3MG/SRXvKEfq0Yfv17TbnFc29u?=
 =?us-ascii?Q?teNjjI4uG0j3eRhkzdkE3HfGkUImQp1A0GOPTh1Y9zR4mX5UdwjCWBz8r+iD?=
 =?us-ascii?Q?12/PeU5zuMe0hoKAZB6uwCag8lGXYZU0fas/yMT/rIcIQ9UbAjCXBlGplstL?=
 =?us-ascii?Q?A13G4zgdh5E3k0cbgQ7+wxsGYvE688E/+DO6C1HI5j76b3eJOs14i0kemx1+?=
 =?us-ascii?Q?Id2rRsyW1ogLTg+Jxp5SLCSeUX/qXVOPkKg2vbDMGHhS53H/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8856821a-afee-4a37-f113-08ded9479679
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 21:11:02.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqNzcPTlvu/JC4oX3rtRXRITjo7A2emFVEzDR6afGyYny89KvjBkHDM5VDScmpelNinvXHVVlykkUWu4eiQFXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9323

On Wed, Jul 01, 2026 at 07:46:49PM +0530, Shrikanth Hegde wrote:
> These methods will be used by the steal_monitor core in subsequent
> patches. Default implementation are likely good enough for most archs.
> 
> decrease_preferred_cpus() - Called when there is high steal time. It needs
> to decide which CPUs to mark as non-preferred and set that state.
> increase_preferred_cpus() - Called when there is low steal time. It needs
> to decide which CPUs to mark as preferred and set that state.
> 
> Default Implementations:
> decrease_preferred_cpus()
> - Get first housekeeping CPU and its core mask. Mark it as
>   protected core. This helps to keep at least one core as preferred.

Is there any measurable difference to manage preferred CPUs per-core
vs per-cpu? If not, I'd choose to per-cpu version as it's simpler.

>   This is to be safe under non-normal cases.
> - Find the last CPU outside of this protected core mask. (target CPU)
>   This works for cases where one may specify nohz_full= for last set of
>   CPUs as well.

And doesn't work for cases where one specifies nohz_full for the first
set of CPUs. If you want to do it properly, you need two passes:
1. Search for preferred nohz_full candidates, and 
2. If no such CPU found, search for any preferred CPU.      

> - If no such CPU exits, then only housekeeping core remains. Bail out.
> - Based on that target CPU, get its sibling and mark them as
>   non-preferred. If they are nohz_full, enable the tick.
>   push mechanism relies on sched_tick.
> 
> increase_preferred_cpus()
> - Get the first active non-preferred CPUs. This likely is the last
>   set of CPUs being marked as non-preferred.
> - If there is no such CPU, i.e preferred is same as active. Nothing
>   todo further.
> - If not, get the siblings of that core and mark them as preferred.
>   Note that clearing the tick isn't needed as that would be handled via
>   sched_can_stop_tick.
> 
> Using core instead of individual CPUs give better numbers as SMT is
> quite common and some hypervisor such as powerVM does core scheduling.
> 
> Note: This doesn't do any NUMA splicing to keep the code simpler and
> minimal overhead. current code expects CPUs spread unformly
> across NUMA nodes.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v5->v6:
> - Make it work for all cases when nohz_full= may be specified.
> 
>  drivers/virt/steal_monitor/defaults.c | 74 +++++++++++++++++++++++++++
>  drivers/virt/steal_monitor/sm_core.h  |  2 +
>  2 files changed, 76 insertions(+)
> 
> diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
> index 6681f9938f6a..4e2e5b233948 100644
> --- a/drivers/virt/steal_monitor/defaults.c
> +++ b/drivers/virt/steal_monitor/defaults.c
> @@ -26,3 +26,77 @@ u64 __weak get_system_steal_time(void)
>  
>  	return total_steal;
>  }
> +
> +/*
> + * Default implementation of decrementing the preferred CPUs based on steal
> + * time. This is simple logic and decrease the preferred CPUs by 1 core.
> + * It takes out the last core in the active & preferred.
> + *
> + * Ensure at least one housekeeping core is always kept as preferred
> + *
> + * Could be overwritten by arch specific handling. Arch must ensure
> + * preferred is always subset of active.
> + */
> +
> +#define get_core_mask(cpu) topology_sibling_cpumask(cpu)

useless redefinition.

> +
> +void __weak decrease_preferred_cpus(struct steal_monitor *ctx)
> +{
> +	int tmp_cpu, first_hk_cpu;
> +	const struct cpumask *first_hk_core;
> +	int target_cpu = nr_cpu_ids;
> +
> +	guard(cpus_read_lock)();
> +
> +	first_hk_cpu = cpumask_first_and(housekeeping_cpumask(HK_TYPE_KERNEL_NOISE),
> +					 cpu_active_mask);

Why active mask? If you want to preserve a cpu in preferred mask,
search the cpu_preferred_mask.

Can you explain why HK_TYPE_KERNEL_NOISE? Honestly, I don't
understand the idea behind this logic.

> +
> +	if (first_hk_cpu >= nr_cpu_ids)
> +		return;
> +
> +	first_hk_core = get_core_mask(first_hk_cpu);
> +
> +	/* Always leave first housekeeping core as preferred. */
> +	for_each_cpu_andnot(tmp_cpu, cpu_preferred_mask, first_hk_core)
> +		target_cpu = tmp_cpu;
> +
> +	/* Only the first housekeeping core remains */
> +	if (target_cpu >= nr_cpu_ids)
> +		return;
> +
> +	/*
> +	 * set tick bit for nohz_full CPU to push the task out. Once the tasks
> +	 * are pushed out, bit will be cleared if there are no tasks.
> +	 */
> +
> +	for_each_cpu_and(tmp_cpu, get_core_mask(target_cpu), cpu_active_mask) {

Why active mask here? It should be preferred, I guess? If you traverse
the active mask, you're at least doing an extra work by disabling the
already disabled CPUs, and probably have some side effects by calling
tick_nohz_dep_set_cpu() twice.

> +		set_cpu_preferred(tmp_cpu, false);
> +		if (tick_nohz_full_cpu(tmp_cpu))
> +			tick_nohz_dep_set_cpu(tmp_cpu, TICK_DEP_BIT_SCHED);
> +	}
> +}
> +
> +/*
> + * Default implementation of incrementing preferred CPUs based on steal
> + * time. This is simple logic and increases the preferred CPUs by 1 core.
> + * It adds the first core in active & !preferred
> + *
> + * Nothing to do if active == preferred
> + *
> + * Could be overwritten by arch specific handling. Arch must ensure
> + * preferred is subset of active.
> + */
> +void __weak increase_preferred_cpus(struct steal_monitor *ctx)
> +{
> +	int first_cpu, tmp_cpu;
> +
> +	guard(cpus_read_lock)();
> +
> +	first_cpu = cpumask_first_andnot(cpu_active_mask, cpu_preferred_mask);
> +	/* All CPUs are preferred. Nothing to increase further */
> +	if (first_cpu >= nr_cpu_ids)
> +		return;
> +
> +	for_each_cpu_and(tmp_cpu, get_core_mask(first_cpu), cpu_active_mask)

Here I agree, it should be cpu_active_mask. 

> +		set_cpu_preferred(tmp_cpu, true);
> +}
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> index 634c9f5a2610..030f6236c38e 100644
> --- a/drivers/virt/steal_monitor/sm_core.h
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -26,5 +26,7 @@ struct steal_monitor {
>  extern struct steal_monitor sm_core_ctx;
>  
>  u64 get_system_steal_time(void);
> +void increase_preferred_cpus(struct steal_monitor *ctx);
> +void decrease_preferred_cpus(struct steal_monitor *ctx);
>  
>  #endif /* __VIRT_STEAL_CORE_H */
> -- 
> 2.47.3
