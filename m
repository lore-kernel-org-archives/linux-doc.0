Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F55367283;
	Fri, 10 Jul 2026 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715832; cv=fail; b=quHsHNC58O9a8bw+jCzcDy9FnMllvkVUBVaNuAZZ++CKOnmN/aQo/lTyArimYysRvYTN89+bFC6d67sfyMYyIMfed7XXZSF2JFT+Q29pNGcQu7FXCGtfP3HirMRIzz/dZBaQ9GBnMFOJXjDLVIF42g74RdnaFMCu5+4aSa+I1GE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715832; c=relaxed/simple;
	bh=O7W/STfQnJrq68vZKP7kpNJrHb7OzQCRdhZR4KtYec0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jg4hM82FIJPt+9Lt6tDyYhTJsk3cv60ox78iQPNVuAl/S0eLovTGUUgUaAaa43Q1yLJpJStevpklWrPzG2Vlw/qX81LnBXUomAXTicZ4keDNIeoZgyTyDvOHdMBL+X+qHjJyJqdkBq02xQaWK2WAGw2w2eLBB+pzDn2QUtUDI0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fSqSpIdS; arc=fail smtp.client-ip=52.101.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fSqSpIdS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/dRbRAq4g2qa3n9nNHY4gITSnnrMmQcqsAmveaF5F+ECMA4d9Jj3qcnG2mxYhxmcF5hspEldwPsWe9QQLaD4glY3CPwArJgBH8+wVfiCAqF/kkhtL2rU3unzVqJ/JIOFjBMlMADtIxNK2/80HTtibSTwHd4PU7S2pdD4VmzOxfQ+VP/X/4t/lEY8kDUs7iH/VtOjLsib+A0u9j2fcFnO53zqQHy68w+Kz7Z1ySn9VZzRhwbnRD/3vjrD2bFykQUS5FDf4ZIRY9PiPBMl6hyIg4QLNElDekoqv+LetWqFAEa9B50ZdcEGml8jHPucfPHEHNonBFXswc82pTJlYI7jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pss18ZVqhD4PQmi+ud0Aq1uKoqEUmByrEmd7bnu+xA4=;
 b=I3LGlcZKhBD6z6TPAhjNTHJvJKIUq0DgZbR7oi3P7FPjubJVW7siduPd0xWzrtgVJ/ZL7ljY2XC5b+SU0QpZKmtKc8o7xe0/bLZpnmZCSmYUC2YeBbk7O2Ol5cfbw2nnSPATagijIr1P91zGhiAEAWpEZV/poihIf3veGBXp7wUL07FSMRYUeX72vNqYMPLHgxJmn+Rs9Fi7VHbUkG2VPAh0+9dn82d9c5w4OpRTPzlE1qi56G+I7XZiPX7jzNdjU6AZrJxrZpyM2Q3J8EYdAgVL5w2LwGu1Xju3oT+NKSUNBolXJE7ppw+cPmNjrw9lot41acqSMYUPfau/Ib0ChA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pss18ZVqhD4PQmi+ud0Aq1uKoqEUmByrEmd7bnu+xA4=;
 b=fSqSpIdSMMgxf8HT9MjY5Ir/hFwiGpAgZT+vxwRwr+Ii/Q9r+etMkXkL2rfqlqtIUSkJc3rE/A+A2fs3awUplnOoPvFjDCVs0z2NSU2xLHwNe12tqmlsu7TEBVvGRrnIUhu4zBPm2xh6zdQArvz4Vgq4/pMN01dR3Ix3DiCtzHiX8/SKCMVQFV1qEo9w45VfN9WXWorZxsnY8/WgbO8YnMgzIpiuCxgeGMBcB3bS3FJ04CxTcU3CdcZiXnd4hliV7IudmBRA56H7VbjoLaDouJTeBeqhRnrPO7dQau7cYQMaZcM9aCqPO0NkDDotSR4FU0bgYKBw70UE5/bQAyIG/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH7PR12MB9176.namprd12.prod.outlook.com (2603:10b6:510:2e9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.20; Fri, 10 Jul
 2026 20:37:06 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 20:37:06 +0000
Date: Fri, 10 Jul 2026 16:37:03 -0400
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
Subject: Re: [PATCH v7 11/12] virt/steal_monitor: Act on steal time
 periodically and decide on preferred CPUs
Message-ID: <alFX75dzgkMnDXAD@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-12-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709215648.1246821-12-sshegde@linux.ibm.com>
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH7PR12MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 250a41f9-9173-4a50-10d7-08dedec3018d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|6133799003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	5cOm5sEdgjzJ5Av/0LUuRd0I1mbpU/arcxHKdsU76i0B4Oz0261pZTxE9AmtAhDVbpGGFygRZ9QJRxa/LxJdsGy5TjBRFWx8jzIuTJ/Vf57WyiXDb/kZGADsVAdTE6rSmDh5/UjhTujvHQ8GB6ymU6g0w07oa1efnO1Bgt5ZNOnDCACZP9WFnZstWjC5ql8K7xuNZUi3zckk0Hu+WnxUDINstddfPPmnyb1adivbMVEHX633nb/LuWzklPBEC1X4yGtCB7GO9RmQu4cbDJkXe1t4INLsqkSQrYclXHQjPpfzRiz6qtqSAPgEgFt6XZg6YgoLDKchqU2L++hDdpoxvEaA/e3RB2UWJWkel/ybTcTiDmIU/7jpK41L9CLbTpuAQRnr6XPSxhG6g6kQDIeYkLOz8WD58iNV+C05pZcqM35TkGv93DiIX9KrsDM4nBSSY48vGn12ZzQoVU7ncQ7QPtsI0hK20WfXohLv3TgujDIMdkOTmyz7tC0eT2SvrabrxkGHlPZUzXh5bzYR9IEurfiMVpEZHEKq8rS/7tAcvlweIkEQlv0VfL895LQmn2JygFbQjO7elniGMmU61RdDsbSQ1/E/uxCuwMB3Ke8kgvUfUy8xHQ4cysOKNiTn0PYGzonIHP4utLeozfQVnr8setIsLH5QnMsgJE5WIK37mN4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DxDAvJ3vkXtmW1AprKFP44D9lEpOHuUHB6pr5hO2R1etrOEYNMtylYUwgHGv?=
 =?us-ascii?Q?fOdgGQHsIJpMXAie8k+arJPYItbOVDryO4AV+66kAaQB3WaXKdHImYQQ4OaV?=
 =?us-ascii?Q?F4RHPgO1XZHqroFi/fmodNfSW9erTWI71C481fL4ZXFBlYgtWk+hKBkE9r1t?=
 =?us-ascii?Q?NwpHRwt6qbKPXASgOJJSzZDaHEsL1nGw0nOYhcxfh2cyoOupV3iavlVF+uCw?=
 =?us-ascii?Q?4/owm55sTbNws4coRNQ9Rq7jGOsRXhk8Jt2N1CW5l+8Cw3Jv9eaSS6nQFsK0?=
 =?us-ascii?Q?4s6xp1le6kJsuACJ+j1YBnMy+BM0AoeWWw6hLsk1B0dYZ55Fz8CGQVq7M3wJ?=
 =?us-ascii?Q?okNII3rQE0bX0m3JWP+AVhf8ME9/stlmqZNK2rAZfgc5Q5lk0ILhIhYde6Dh?=
 =?us-ascii?Q?TNZ8zubfEsFQZrT9RypmmSCk4E5MM7TEB/S8E0Ji0UqsuDTCaK8e70GsMR0p?=
 =?us-ascii?Q?zyYlCCf7C8kCrwuEy5ffkQTL1t0pymkBokvIFygkMh7WO/Yuqi85LSkJHnNG?=
 =?us-ascii?Q?EEFrMDWjQobSgwJ33A3oQJ5OodJJM+RtVRPUuKklTyu8S0xMlNT8Ag4O+jUj?=
 =?us-ascii?Q?cJTnLwaNC2pAim4eAndw7A10xiHJv17U9iNUSoaBP7xcKvQWi0FqC6YIBWf0?=
 =?us-ascii?Q?ZxXu0x6HcYGaZRlZCc49yFHVP3YUremhkgwilI71uZhtUoJeuuMeDynOEnH5?=
 =?us-ascii?Q?nMiLHSrs7HeEYkRndmYUK0UTCWvWFTmyEu6idsSpn2p7U6llWztRMhGKF/P+?=
 =?us-ascii?Q?m8dvBb9SkeiV8tpk3/YYwYpWFU3awg/xyXcGr+uHNzEE4wtdGy53rohzXjqF?=
 =?us-ascii?Q?x0JIfG3BDorxjooUw9EfPtcYh9+dH00T6RW5Y1bCGQxRMC5Ya6CrC20y8ak1?=
 =?us-ascii?Q?i4gawrFwAjj+6++aJ9aAOY/CnpgP72w/H8+QsTqb6bl1C4zHZBqQ+XEuJMuZ?=
 =?us-ascii?Q?+TZyR8y2alE6Pr6uakkJtn2Q2q8YN7hFtPXviNX16xla2mCjK05tpCTk0BEy?=
 =?us-ascii?Q?8UyFgVRyrtXpYpNKOlNjSMr5kcX+jmDcObAAV/cIuIB380k3fXbgvPASGXI+?=
 =?us-ascii?Q?UwAlv2QVnfxtestF0xLj9C7ece/+jzK2c7571j0gUzBwf1ZRFyHbJGHok5xW?=
 =?us-ascii?Q?xpYeaUZbh+g/qv8CxohIHAJMOaEqSTWBLyfnTQnTQmSCg8D6WXhysekitgM7?=
 =?us-ascii?Q?ceGgr98pFQijFVTs1CsaChkgY73UODhzui+Nw8XgffusoP7TX/QN9dGtzbeX?=
 =?us-ascii?Q?Q8Tj8H1d9ZnA56TztIo51YzzaYntRcGOFElRwNJMMTBTaNp+GulE0V/vgutO?=
 =?us-ascii?Q?Pos5lEul/21IoFdVy/s7/EbqBcYv6FSalRPxd61x638fwsPmDuxH+p4qIV43?=
 =?us-ascii?Q?1GVTVixn7alYavcov72rKYXt2Qf0EGj/tvGZCaRP60/O+vWCeXoD3QY1/p6H?=
 =?us-ascii?Q?jpirkfxQ6VfBSRIdBIo4YOGtCP+56V9xORYpDovSCI0FiGFgwwVJQ9SOn3dQ?=
 =?us-ascii?Q?sBbvNx/UMfno0QvJZ0eAtNg7aS5w7OoN6r4UGHKSy5a0PBMZdfrG1Jgh2e+9?=
 =?us-ascii?Q?yNQLRMt3du5ngXz4KPCvhfyq400eUEruu+Ko3vFIKBMokjCUyFsZRjB7BpLv?=
 =?us-ascii?Q?doGiaXReQ9U6MVffe95qzUVbR+iFS5ailCh5P/TEqC57AIbXoJzcNwTef0H5?=
 =?us-ascii?Q?vUsxWRrF2OsCC7B1PTUp8NVPjYrKvTt06sImkzfhSK3FfZ1AsRcU6hJ8jh1a?=
 =?us-ascii?Q?9vgNHqFuzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 250a41f9-9173-4a50-10d7-08dedec3018d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 20:37:06.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hv9JEBpxS6rVN7Pxo+TKBNItdxtlErcLDG5A7jyssTCkcmdIanvrZwaQ+GkkYawdEdiNL5Fc6wO1R2bMb6J/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9176

On Fri, Jul 10, 2026 at 03:26:47AM +0530, Shrikanth Hegde wrote:
> schedule work at regular intervals. Interval is determined by
> interval_ms parameter. schedule_delayed_work is used since interval_ms
> is usually in order of milliseconds. Work need not happen instantly.
> 
> Periodic work function essentially does:
> - Calculate the steal_ratio as below.
> 
>        steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())
> 
>   It is calculated to consider the fractional values of steal time.
>   I.e 10 means 0.1% steal time. A few tricks such as divide by 10,000
>   are used to avoid possible overflow.
> - If steal value is higher than high threshold, call the method to reduce
>   the preferred CPUs.
> - If steal value is lower or equal to low threshold, call the method to
>   increase the preferred CPUs.
> - If the steal value is in between, no action is taken.
> - Save the values for next delta calculations.
> - Save the current direction of steal values to avoid oscillations.
>   So two consecutive values of high values or low values are taken for
>   decrease/increase of preferred CPUs.
> - Ensure design checks are met.
>   1. At least one core/CPU must be there in preferred mask.
>   2. preferred CPUs is subset of active CPUs.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v6->v7:
> - Merge two patches which did periodic work function.
> - Misc checks for early firing, requeue work, math safety.
> 
>  drivers/virt/steal_monitor/sm_core.c | 76 +++++++++++++++++++++++++++-
>  drivers/virt/steal_monitor/sm_core.h |  1 +
>  2 files changed, 76 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index 4a03c14337be..09a5c3a299c3 100644
> --- a/drivers/virt/steal_monitor/sm_core.c
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -20,6 +20,12 @@ struct steal_monitor sm_core_ctx = {
>  	.low_threshold = 200,	/* 2% */
>  };
>  
> +enum sm_direction {
> +	SM_DIR_INCREASE = -1,
> +	SM_DIR_NONE	=  0,
> +	SM_DIR_DECREASE	=  1,
> +};
> +
>  static int param_set_interval_ms(const char *val, const struct kernel_param *kp)
>  {
>  	unsigned int interval;
> @@ -106,14 +112,82 @@ module_param_cb(low_threshold, &low_threshold_ops, &sm_core_ctx.low_threshold, 0
>  MODULE_PARM_DESC(low_threshold,
>  		 "Low steal threshold. default: 200 i.e 2%. Must be < high_threshold");
>  
> +static void compute_preferred_cpus_work(struct work_struct *work)
> +{
> +	u64 curr_steal, delta_steal, delta_ns, steal_ratio;
> +	ktime_t now;
> +
> +	now = ktime_get();
> +	delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));
> +
> +	if (unlikely(delta_ns < NSEC_PER_MSEC)) {
> +		pr_err_ratelimited("steal_monitor: work scheduled too soon delta_ns: %llu\n",
> +				   delta_ns);
> +		goto requeue_work;
> +	}
> +
> +	curr_steal = get_system_steal_time();
> +	delta_steal = curr_steal > sm_core_ctx.prev_steal ?
> +		      curr_steal - sm_core_ctx.prev_steal : 0;
> +
> +	/* Update for next calculation */
> +	sm_core_ctx.prev_steal = curr_steal;
> +	sm_core_ctx.prev_time = now;
> +
> +	/*
> +	 * steal_ratio = (delta_steal * 100*100)/(delta_ns * num_cpus())
> +	 * To avoid possible overflow, divide the denominator early.
> +	 * Note minimum interval is 10ms.
> +	 */
> +	delta_ns = div_u64(delta_ns * get_num_cpus_steal_ratio(), 100 * 100);
> +	steal_ratio = div64_u64(delta_steal, delta_ns);
> +
> +	if (sm_core_ctx.prev_direction == SM_DIR_DECREASE &&
> +	    steal_ratio > sm_core_ctx.high_threshold)
> +		decrease_preferred_cpus(&sm_core_ctx);
> +	if (sm_core_ctx.prev_direction == SM_DIR_INCREASE &&
> +	    steal_ratio <= sm_core_ctx.low_threshold)
> +		increase_preferred_cpus(&sm_core_ctx);

I already said, I don't like this SM_DIR approach. If you want to
avoid oscillations, just increase the gap. If it doesn't work, then we
need to understand why.

> +
> +	/*
> +	 * mark the direction. Increasing the gap between hi and lo_threshold
> +	 * helps to avoid ping-pongs.
> +	 */
> +	if (steal_ratio > sm_core_ctx.high_threshold)
> +		sm_core_ctx.prev_direction = SM_DIR_DECREASE;
> +	else if (steal_ratio <= sm_core_ctx.low_threshold)
> +		sm_core_ctx.prev_direction = SM_DIR_INCREASE;
> +	else
> +		sm_core_ctx.prev_direction = SM_DIR_NONE;
> +
> +requeue_work:
> +	/* maintain design constructs always */
> +	WARN_ON_ONCE(cpumask_empty(cpu_preferred_mask));
> +	WARN_ON_ONCE(!cpumask_subset(cpu_preferred_mask, cpu_active_mask));

cpu_read_lock here? And again, you should do something to restore
integrity. WARN_ON is not enough. The simplest and safest thing you
can do is to unload the driver. You definitely shouldn't schedule a
new work against the broken cpu_preferred_mask.

> +
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
> +	sm_core_ctx.prev_steal = get_system_steal_time();
> +	sm_core_ctx.prev_time = ktime_get();
> +
> +	schedule_delayed_work(&sm_core_ctx.work,
> +			      msecs_to_jiffies(sm_core_ctx.interval_ms));
> +
>  	return 0;
>  }
>  
>  static void __exit steal_monitor_exit(void)
>  {
> +	cancel_delayed_work_sync(&sm_core_ctx.work);

cancel_delayed_work_sync() is not enough for a self-requeueing work.
compute_preferred_cpus_work() always requeues itself. Module unload
can return with delayed work armed against module text/data. Use
disable_delayed_work_sync() or a stop flag checked before requeueing.

>  	guard(cpus_read_lock)();
>  	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
>  
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> index ee68cd8b1944..7c7a9bced682 100644
> --- a/drivers/virt/steal_monitor/sm_core.h
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -14,6 +14,7 @@
>  #include <linux/kernel_stat.h>
>  #include <linux/topology.h>
>  #include <linux/sched/isolation.h>
> +#include <linux/math64.h>
>  
>  struct steal_monitor {
>  	struct delayed_work	work;
> -- 
> 2.47.3
