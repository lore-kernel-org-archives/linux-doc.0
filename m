Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011027.outbound.protection.outlook.com [40.93.194.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964823E63A1;
	Mon,  6 Jul 2026 20:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783370219; cv=fail; b=dpDU2hRALdU1u/wYWPT75wNT21qVb+OMljg3hsUhN2nDk1pXW4PKak3x9CIzUYI/9nWUcgtRbgbDukbFm/RO+obMxbkNnkClRsoxO7WR6Bn6/3Iyd8QEvhICNBXAWPJanoiBe4wxZvLsuxqBkB6r0ZWcTljJlQEUrhDLKOSX4uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783370219; c=relaxed/simple;
	bh=zP1sXclMLhyxNgHd3BkjGRioZheSEhLvJmEcmoJQ+3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GHb45HWgwWBensVSTrWzI+F7BoIKaUVrA4jrlEyZO3aSJEtPG/cz/4C7NWv4GgCNoKw1u3Tm8qoug59wvuZQ/1umMlgIjzwFQsPT2H9RIzTdnzluj/PiymBSotTlaEKfmHMKeXwTHlzfTvRrlEXABQWaKLyEeGwRkVuaTQHAZYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aUTEjlqW; arc=fail smtp.client-ip=40.93.194.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aUTEjlqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLbe7GFpU6a2ht23ZlPys6VXzlCwgPCgq0e+9XgP5YVAN8RyrBccbYLGe2aMK3qvAqoqGYH0DqGJyH+n+1QD0hmS8clR6s9VGI+ZJg5kBEuaxm6iCxr+SP1jkC8saWpGDMyvJZC5Mi6A+qa2GjpfqVJuYa1XnUPaAuWzWqnmWqM06UsF6Amfwuvx1AoBNcFHR9koj02nApl8b+In1q75Kt/rof9WSCOt7X3W52TiVLekHez7U1VkyRcm47o3gKTho4AJxzKKMRAdzZDRttNWUzb+wKkTYsEGTROPELRQ5nwyXXb+qhg/FcDEWY3tx+v8Y+MSb64mJyaoCOaap11xwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqsJi57wKoaJl+qx9HTCG/Nze4XDjUHZLzwdIrr1o7A=;
 b=HkMBVAtfpSkRbrDxgqG64lAB3Tf5cz9TuQpnbMP3xV0sjUk4iHoHgZOWNutfQBEMgLLYBAw2sOjkeqRsr4wsV5JwsWEo+tPdyEZ3laZmUrHgXSbBv4IobLfPsIrnZGNUEvO2ePnE2R7FY1qHKJXp1RgjohcrCIiN65gQPSuWCZxeJ6I406n1u37q7wwN1hpy4K76Jp9GD/BnuErhF8QZQSfq4M5c7PE3SH7exV1KETCghtwCmLYFjJvUZjmUDiBxtkZdhFKYJMQrX9iw54iH2RTI1uuZxXE2KiSqk+1NwTL9rxP5tlbDOxWOG1jayXJUsXSwe+zLRUeeLoEr/Pye3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqsJi57wKoaJl+qx9HTCG/Nze4XDjUHZLzwdIrr1o7A=;
 b=aUTEjlqW4PmHpJhoPUNKMHyfe4NI4yJhO0UXXZF1P1TnOc38qhvDjte6fNyIwAWAFPYp1Qo/AGrFosA6pUlE0hPPk+3RWTDyQclgteVRwtdsym1pzKh3WK3e13weYUx0y8vr+Kk7A3VwsqfObArE+KQFtWBsRdAHbhjVQgwoJLtmfOb3uWaW+wfBlYflRhGeWZ73594g8EPnWnOyxNYFfgEkoyof99KYzMWPLtC7Lj88leOGWdOphFOPDJEpz1k6yFB9xQ4fQf3ovgERc9miTHmVZksvy7nONAV64oOxB8aZApXyuNnkGSlaM9CitI+HcBMRm2zSZ62FBcOYYClzqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 20:36:50 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 20:36:50 +0000
Date: Mon, 6 Jul 2026 16:36:47 -0400
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
Subject: Re: [PATCH v6 21/23] virt/steal_monitor: Add direction control
Message-ID: <akwR38ZsyB7tfNDl@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-22-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-22-sshegde@linux.ibm.com>
X-ClientProxiedBy: SJ2P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 83f78efd-b0c0-44d0-7f26-08dedb9e4e9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|22082099003|56012099006|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	8bsEIC6AMXMdTe0Y4dGXiCnCoA5lIRMs1mi6oszNE6X4QQdOQhw/w7tgjRnKdd9CycIPOeBwNdAkKdtopIS6PV/GqfS4Wgr5AZtAzaPVGmYJMtRfeS0QvwMDCNPzL/ty42/AbB9TGhyP9EQhL5L1cptiUY3QK4UehLYvxoQuDbWGbmpxRAJ+z0ODeIJo3LdZdX/6Cm9bAVQfnGO2ye6YWhi1prsQ0teHQOig3ewCQ5M1RYAw/y1e6LIsRsLHqTnIWF6Umd6AnjAKauZBOZjpi5isBKAcS5LCnynvWtkP/LAirEwH3W/v5G3s0/bmTcaFlSIX4Jzt07+jyzFjLLYmL2ZKgD0qAZmkOMJLUF5YDSFxoPUpDPRk2YX0M1T7dcJa7dutlSfl8lb+CPvT3g6HU/xfMdIrR0ftnv9IgS7f3uaHVuhdpwi+9Q5Hq2Zu/xcdtAYStxF6KCTMtZYOr4jJRi2D0p99NG+l/Ah3qZ0fzKXXCLDxn0Ctpjdf/XiwWOFN30tnRonCWhc+A24cVbDhLv/dURt3SR4vX0rt+/3zZRig1tIdnKjaZF9eYBdZj0t78AkJV+2jiqkhoY2iKr9y288MBm2Go0Ix/qz9sO6oGb3iuN9Wjtrjb5tzIuEP3tzdhKgSsYQvccfY687SQWNp5nqiPGCsDlFujNTtxq5DNMA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(22082099003)(56012099006)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7RvguJR/JLy0z2h7Mwh3qyZfxMLEKT/EHnIMAfX/ud0YYOkpDr8wlWAF3CQZ?=
 =?us-ascii?Q?0IBx9aHrCY4/RfrTcjO1ilRYQgmeQvPhCHAnXOxNiPZLJmESOb4+L7t40ZDA?=
 =?us-ascii?Q?blFcbpn7HjWVgvgXW4wJf2WL8to+8a+o5Tq6FmT1f4maUeATzoyulJX+3nux?=
 =?us-ascii?Q?R1DoKASPOFzzpmq8J+aU9RSZhlJBp/kDzX0JQXgjFNAqYunzcAYhJQNJSeQD?=
 =?us-ascii?Q?bCcyb8YnyptB4mJLdOOQBawnsfde3ayuMqtIuGWmXAeVTusFirmCgkDAm8PW?=
 =?us-ascii?Q?9KpFZcFeiJiGaCKAqnoVX+ppv+eZZnZeU6uYozXloSgARQg3v5AR2qPEJCpu?=
 =?us-ascii?Q?nk91NnPqGC/UNhGagV0RahMHvZS7HiStQsg6uubQRVSc9QghYKMjE1bwL6VS?=
 =?us-ascii?Q?yghgjFGOOy5slgbyoFnnK8txhlGjZnAGNwdGHLuQ7FWM/GGIYwolEFO3lHD/?=
 =?us-ascii?Q?UUZhAOA68y0N8FrHmdFr9Z25O215IaCdJzjB1uR9KceKGKX/6F6ZTHkGTS/y?=
 =?us-ascii?Q?kbjxZ0iX7of+F25WPgEEOnHsD4z5lkhMgrAcVWPZGW2Gst1pDHKSsenAAI9+?=
 =?us-ascii?Q?+Qt8Vy7JZFES8mF8C784K1bFuJxMwKNBuLTia4A8aaJDpmNSS0NAeEuwlUc+?=
 =?us-ascii?Q?HH4+NqNhYaUdBBYexNTJvlwS/iLSknIt0J6y1Xxv42M8VTUOPA0bvzn0gxjb?=
 =?us-ascii?Q?ZUOKz8tT7xVm0r4sL2RtqxGZgKfIZDplDi+G0oZyW+/wu010i5oThtf7g0jW?=
 =?us-ascii?Q?XkL/zviisxzV0clKo34VrY2XMQmUBPDEp1iucy2lWOXw8oXSfwB5oQwb3CE1?=
 =?us-ascii?Q?badfxEL7m1iH/99rLdLHfljVqn0CCaZTzfxgkB1SCp/FPx2hOgWkDhpI0dp8?=
 =?us-ascii?Q?V1ypFJLLoT+QhtVa1MN5FUYGt0xv/+vxFcKU7sFd9k3HIOZgguSflrDXhQwq?=
 =?us-ascii?Q?2C3TuJMNFMEld237TR6lkVWEgy8Rc6BIWp2I24tcMVkVzlvfoK97Z0K48chp?=
 =?us-ascii?Q?jrWTMsSk/nfrExESNa5clQOyvb+VkLGew7X3POD7il+2psSZJJy5zSoafsMB?=
 =?us-ascii?Q?nHKQVznbAp7+jtL5sEp4isr+DWhZMe6kmBqCRpiwAkyULDpd1nJ8Xe2J505p?=
 =?us-ascii?Q?pa1zBEtfFk5N+k46i9ugUM3JwGjFe1rduWDbiKvEWtyMnmqX8C6WCwzeR6w+?=
 =?us-ascii?Q?uFpWPJA7CkXqS8MRLW96o8aOaVTJ8FoDo+DXcioYHgUOMH3YTDfSUyByHF7J?=
 =?us-ascii?Q?c/Uouh6RiV7FNOUM1Vfo9FF5UrA9vQIEsjS27ACdnC7fVRW3qvAjG3xP5E10?=
 =?us-ascii?Q?Gfd6C3wWFn6z5yMv3nqvRy2i7mEbg84L6Dq3RUXWl6z+JAjedTKHx0W9Etfd?=
 =?us-ascii?Q?sYCy2lGVxBSC3UQCcnrxoS1xDGbAzPpF1NNzC4QDoq93sbIYB1figv4ENoAm?=
 =?us-ascii?Q?AYNDTc25CK/pNBNGt7V9/rbNDVIb8wSlm8GtjHtdQ0aaBcrPuD8ZsIIGES+c?=
 =?us-ascii?Q?uQWcvrMfNnCzUFJELitDelOuS4meCy5VL3PMi/LdzsUBhOVabUmr3EiO3ZNn?=
 =?us-ascii?Q?YwiK6qfEWLLH7FRb73nT+HqDSiQrRb5T8A1qsfk4oGwaJyentm5yg7uPU2k0?=
 =?us-ascii?Q?0UGJoUur2xclAuwBtqUy4RSnIo6nnPrFUkoLsWE09R9TGGIy4WFPXeR0G1JA?=
 =?us-ascii?Q?8PxW/fjWM+o2U6dRud67tcnBKl8f027+tBtBKpcNAMzKAYkWWH6vg7y1RcH3?=
 =?us-ascii?Q?u6o9YOPB7g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f78efd-b0c0-44d0-7f26-08dedb9e4e9a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 20:36:50.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zkmd4XaPd9F4/G9YH2r1mx9RGuyIzyiRDMbLFVkuXT8rA4zS043BLtjhyZSEGgWDmQMc6+p0cBwOr0s/AJFMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333

On Wed, Jul 01, 2026 at 07:46:52PM +0530, Shrikanth Hegde wrote:
> Cache the previous direction on steal time. So two consecutive values of
> high values or low values are taken for decrease/increase of preferred
> CPUs. This helps to avoid oscillations.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  drivers/virt/steal_monitor/sm_core.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> index 7b7435f79b85..4810bad96818 100644
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
>  module_param_named(interval_ms, sm_core_ctx.interval_ms, uint, 0644);
>  MODULE_PARM_DESC(interval_ms,
>  		 "Sampling frequency for steal values in milliseconds (default: 1000)");
> @@ -59,12 +65,22 @@ static void compute_preferred_cpus_work(struct work_struct *work)
>  
>  	steal_ratio = div64_u64(delta_steal, delta_ns);
>  	/* If the steal time values are high, reduce preferred CPUs */
> -	if (steal_ratio > sm_core_ctx.high_threshold)
> +	if (sm_core_ctx.prev_direction == SM_DIR_DECREASE &&
> +	    steal_ratio > sm_core_ctx.high_threshold)
>  		decrease_preferred_cpus(&sm_core_ctx);
>  	/* If the steal time values are low, increase preferred CPUs */
> -	if (steal_ratio <= sm_core_ctx.low_threshold)
> +	if (sm_core_ctx.prev_direction == SM_DIR_INCREASE &&
> +	    steal_ratio <= sm_core_ctx.low_threshold)
>  		increase_preferred_cpus(&sm_core_ctx);
>  
> +	/* mark the direction. This helps to avoid ping-pongs */

Increasing the gap between hi and lo_threshold helps to avoid
ping-pongs.

> +	if (steal_ratio > sm_core_ctx.high_threshold)
> +		sm_core_ctx.prev_direction = SM_DIR_DECREASE;
> +	else if (steal_ratio <= sm_core_ctx.low_threshold)
> +		sm_core_ctx.prev_direction = SM_DIR_INCREASE;
> +	else
> +		sm_core_ctx.prev_direction = SM_DIR_NONE;
> +
>  	/* At least one core is kept as preferred */
>  	WARN_ON(cpumask_empty(cpu_preferred_mask));
>  
> -- 
> 2.47.3
