Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CDF41CB50;
	Wed,  8 Jul 2026 16:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783527220; cv=fail; b=EerrdyrbaZmWSt9lcH6nEVtbY6Yu0fxoTdWN6Uq2WeW9hECDjGbQpuKQAn5N14Btw7hFk2VCaN/LzcaJAeaM8d47U0vZTcnjH8Okq7EcJGHqcxgEKrJxmMlaJyH6WNqVUEFu00qRmQqk7/DUv8g9vW/2dsMNh+gVA67vm6/WjQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783527220; c=relaxed/simple;
	bh=XKC6pmuTiF12GB5R1VLQXIcKiaMAEn+Rmph2IJZk10s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UH8SLMJa5O7E32Lp7y1IBFNqmQhcB/gAsRaQJbEwMb6sGPSlNlM0/p411QIDqIJz0Cq6Pa2rGiUYiluNcAMwKdMWDeqrI1z6eBL+1adYFnaaDniEsYShZGDSOqTf30kCfX/xsqgIm5eZWP95jToy3b5L4Co9M1QqHQvVjyqy8uE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X/CRvFPF reason="signature verification failed"; arc=fail smtp.client-ip=52.101.52.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X/CRvFPF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7EL0XZxmoI2ekOMc07caPtgEo7+uQkZiydsr1zTiEDDJyW6U3+7Frq+E6exCfbeSzlZAdqWUL+NeuprkDvOp/cYh1VMbsZoLNSVJjj4VcltTkvHLjWbJj3qcIgO7pg1ni51hbMKf3UfgVGlCfWv1XdeOkB+h7uEo4SYN8oAygbmETDqhQZucPtwr42v9cE2ed1+vIMqsJAhpTH3ahaXm4S17uNoDzAEGF7huo0Dn0Ty7YIM52BjN00UD9zaT1U8zTviXzGTwDIF/r33rHjoMtX4xT5XHtXPaQHZL6lviB3WZwSqy7f5gDaVUZqAk8stqxk4wpzY+R4l4KIHGsyVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMOI6d38p+crCdzPv13nQcSZa17tcdGB0DQiDKlgDEg=;
 b=ixMMwntWvjOpfqgHUWb1ndhy1pCwNgR1eCHZ0KhJlIGOLKGm6L9GFzEA6juNHZXc+3UCZPCNJ75TRf/tpNoelOmaO4poRE7dlkH8Mn41VkmcvXLqJCYLKprmy0Tio2p3gL5XG99/glml+Qgbx9EBfHvKyCR7W7fldxcIxlBancJPfbI2EDQePjTRI22f+DMYU1q3kx52A6kscDW9JnQu2+7sRgjacWgdesL2uvF9MxJiAVs+hbYIdAdWwSrd/wxOXi9uEQr5q4h5e8OrNsMn7xYCbKtswKWqfnIAtH/KZvL+ilJr3zELQT3w5t0RaUcVI3RlpJ6lCgVSY7o8q5jVog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMOI6d38p+crCdzPv13nQcSZa17tcdGB0DQiDKlgDEg=;
 b=X/CRvFPFlmELzlhuVZKyDXwqvWW9AAYv3S/hERIMOcIl9+2aah9r6kZK1PbkFePO4EM9FYWorcJPdh/wenQ45oFi3DjOuL2jDPSdF+kS3e0z8uWLE6dV1Tuksg31UBF7SnEmhfSzwUKz4Muf4qcVy0xTJXucBUNLDuU/WyJ9n1CYsS6t74m0l94JAao1IlfCFDL7qe9IuyiJ5WqYB0phjrUhlmwfMDM6xyIrkDgzyfWz42DC0tRxznwvkZWTM/fDGtPbhzX+9kdjuUavV3IB+EEOPz3jcmq46ro8tNbuPkN7qQ3v/PwFM0zcuJj4/pmsrAgus8p+Q3fxRkL6P9OHSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY5PR12MB9056.namprd12.prod.outlook.com (2603:10b6:930:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 16:13:26 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 16:13:26 +0000
Date: Wed, 8 Jul 2026 12:13:23 -0400
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
Message-ID: <ak53I9beUB-2plNQ@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-21-sshegde@linux.ibm.com>
 <akwRJnQklymOjNTv@yury>
 <6548b668-d3e1-42dd-be9f-2fe3193874a1@linux.ibm.com>
 <be544e00-8cf7-4a09-8b13-2d8b5a98c2ce@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be544e00-8cf7-4a09-8b13-2d8b5a98c2ce@linux.ibm.com>
X-ClientProxiedBy: SJ0PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::18) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY5PR12MB9056:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f6d1dcc-28a8-446e-a621-08dedd0bd713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|11063799006|56012099006|4143699003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	SeD8G3vptedMrqjFG6bIwtUps976tL4xFCTRNIeiB9V8UIYDaob87IkpNfHIRHfV7tznxe/ysBE63beZ0IiSPVAjWxeEBDVfCDf1iwcXWv64klWVU8VDsAk5ojSgO4uSLrlYmaf+nAPHSNgYKFJbI6QfbcVSdhrIhOOXytixUGibD0qWVVbeKKOggHx2DUPGaXkTHbGg2wTv316ILVun23bxXOiMlXBjBaZDAao1nfWErGCxbWizNCtKE+2sDrvbGkhAcv2mwgeUV0Wz4P4frpOK7RrPjvaJbm+vrXUI+dv/zblHWcr442dlZvsomn8TOiCX7tiPs+/FRGbrtn+M4HvuftHbR/LK48gap0+uctO14IzpT3feERIT/6KZEckEVMjS5h/uUUhuIyz4Pi4wi1638/W1R64lZ4LDdzVF6Az21ku5qLAjaUaq5TETCdXrFM1O/nCr/B1dEh1TqCLqMKg9B8zQPoYXPPPvMY9x630MvGOCmNUZMGpaKvaN73hRoUs2fdg0YRxTecR8Q7bBSDLew9GOUBB8p17coIXZ5wfGn/2kPQr6jNntd5WoW7XXrQWGa+rJufV6Ov4ZhRGYXRiele8G04qX3mg63xkzLQ9Xqf225OLY2dURFBB/vYpatvkdVXBIiDiddpYKixXny2cf2/8cYOapX41RgjKgcwY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(11063799006)(56012099006)(4143699003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?D8m1Ns8HRkUkxZEoKDTuyi76K7iVF9VJttv77TP4jW7O2RuhOTkC5Cnz0f?=
 =?iso-8859-1?Q?r0Qe0mNKKbFWFk0ot784Hy/TbPqbRKWEeiL2pvd7cQJQolbPVIMp2E6j25?=
 =?iso-8859-1?Q?YEMW9jcrdNezrcndGJh2Pd0D3YXDF3Z/boLsVBHgGMDAoToILC2zSbiRQB?=
 =?iso-8859-1?Q?A2ZUu2cqE7dPPrb3Xh2AtfrMj8yzjPSb99ZLgodcbR5Qm5VBPQPfwonLe8?=
 =?iso-8859-1?Q?GomreWpGYtjKX7wFX8b6wkhLj+nXByyuaEmHtHdK+NXaTx5wyC0vlAf/Ka?=
 =?iso-8859-1?Q?UxG5C7rLio/6EzMYi9cVbS2bZOHz2DzhrLbSFlHpzCeGiR6EjX2y+zohZR?=
 =?iso-8859-1?Q?3osgAwF2qPHFG/Awhd3qhscdP2JniV6m+VpnDX7VmuPs79ToOC4Rg2YN6/?=
 =?iso-8859-1?Q?I0jAxlhkDsqiuKE1FJ2W7kt+Q/pN0jwjoXWDMoOhPgwWYGTJQAZlYvOXc8?=
 =?iso-8859-1?Q?Sx50we/yh/nfSqB9s6pXw4EhyZIzLKx1/Tk4VzNLPBtlLfKcL7WgTPwHe/?=
 =?iso-8859-1?Q?zAAFTWYFONx/jTi42UJ7w08dQWygSc96QyBfLCqQE+ay0POiGX9QVxJDlH?=
 =?iso-8859-1?Q?YhS8MXNdO/Y9Mb4xLtFpwJlllIDV1B9/BTL+nIGJ3PZOds6DMsCoS5K7bK?=
 =?iso-8859-1?Q?vwjGODmUbSRi0OANBMLkiNJLxTHbr61BgDUaJQQvdlB0RNooYgdTA9WZZk?=
 =?iso-8859-1?Q?YxCXQh5Ip+bAIXn02K9ZcXYPPuC6L8shz60xS6zH0FgtzIq8GEvlKLredD?=
 =?iso-8859-1?Q?avuoDvDItryjT7RwDV8eShdhLpHQvLcY8F4SNfHzyGKdfZEwp8lvJpjr/D?=
 =?iso-8859-1?Q?rFS5y8PnfTpnldpnQPsw/atcP813HIoPOKrrQSE6ppqg99rSG0PlJ0CNW2?=
 =?iso-8859-1?Q?CYnZJOHdmK5Tzf+LjvJk8WWwXbUbkU3rxgZmeB9zJtfz4v92jYZjHhHHaw?=
 =?iso-8859-1?Q?VRyNTAHoFlWRFL5Ia2IsfzX9p+ShJsMQweEvaHHMatKbAXMLkyjwsariyg?=
 =?iso-8859-1?Q?Ru4SYBeI8I4awUKT2vz1TGOblxrVn5hdl8r4K2tLTCY/956bZ4/BlgjG82?=
 =?iso-8859-1?Q?5euHrH6TOTS88bfboptks/8lqSYSoPTR5xQ1M6nbKwgNGj+cpw1kGy6FrR?=
 =?iso-8859-1?Q?qe58EqqPIbxDLIPFrM4ZZr78FBfGG9rlEoVwxUd8qHndQfU/VcSk//fbLY?=
 =?iso-8859-1?Q?tFAe58wTXcxzVLjE0R+6FP2fwk5BhdPBBGok9Awgf6kVRzmT89eHiSuBT3?=
 =?iso-8859-1?Q?ZuwToWzHAvQTtQf2xjGPE3ISPXa5UR+Zb2Z9NIXpk0tRQvicKfd50Ev5Mp?=
 =?iso-8859-1?Q?AJJLxVdrRD/TvJ3br+3hRtQiyWQ3imvHUiGOrboK4hUog0poHfahIouBqm?=
 =?iso-8859-1?Q?zVuBPARYL9TqeFZSQa/HqR2hLrjlWDvGLU8Ob4JUDPMbPyCXDenlDpXHeq?=
 =?iso-8859-1?Q?ALKG6AsvLfEFrfBB5c33jix++6ActDpE2nCQrvgYHi4XyrtYen4afsl2r5?=
 =?iso-8859-1?Q?Nj7BCdU5UDI5YJSD9Kb0gz1okp3UjYLZxoLYZ58XBZFVvndLt9xZp/uYXA?=
 =?iso-8859-1?Q?sWgYJDd0UYIQamea4XXcMXApF5FsZG6Pm2DuBKzH+0pJ0x4sneizjIEkbw?=
 =?iso-8859-1?Q?bre5dBE2Lt2wtJZ6biDKAF+QOVwqvdg51EsCWxWlrooVi4V+VP7/VAiuyW?=
 =?iso-8859-1?Q?PxqBUMopIIjUi1+w2vFHBbRsyRi7h1aPvv6dEEIbvCJ3FzcD7749YzkVYk?=
 =?iso-8859-1?Q?0qhMnW7biJjZPBPUAybjgiJis2G7jS69BHJ0IMfnJDViComXuOmIdrkdVV?=
 =?iso-8859-1?Q?Qbrw/RhQOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6d1dcc-28a8-446e-a621-08dedd0bd713
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:13:26.0504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPeuusz7hKws09nafQoKuUETORdHWEGGTYrIuyMBrTFpzD4eEbQl+Sp3M15dewBYWg2r5PjoKgVvhhF0nTJfYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9056

On Wed, Jul 08, 2026 at 04:03:18PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 7/7/26 12:46 PM, Shrikanth Hegde wrote:
> > 
> > 
> > On 7/7/26 2:03 AM, Yury Norov wrote:
> > > On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
> > > > This is the steal_monitor core functionality done in periodic work
> > > > 
> > > > - Calculate the steal_ratio. It is multiplied by 100 to consider the
> > > >    fractional values of steal time. I.e 10 means 0.1% steal time.
> > > > - If steal value is higher than high threshold, call the method
> > > > to reduce
> > > >    the preferred CPUs.
> > > > - If steal value is lower or equal to low threshold, call the method to
> > > >    increase the preferred CPUs.
> > > > - If the steal value is in between, no action is taken.
> > > > - Save the values for next delta calculations.
> > > > 
> > > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > > ---
> > > > v5->v6:
> > > > - Address u64 overflow concerns.
> > > > 
> > > >   drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
> > > >   1 file changed, 33 insertions(+)
> > > > 
> > > > diff --git a/drivers/virt/steal_monitor/sm_core.c
> > > > b/drivers/virt/ steal_monitor/sm_core.c
> > > > index b499faa61010..7b7435f79b85 100644
> > > > --- a/drivers/virt/steal_monitor/sm_core.c
> > > > +++ b/drivers/virt/steal_monitor/sm_core.c
> > > > @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
> > > >   static void compute_preferred_cpus_work(struct work_struct *work)
> > > >   {
> > > > +    u64 curr_steal, delta_steal, delta_ns, steal_ratio;
> > > > +    ktime_t now;
> > > > +
> > > > +    curr_steal = get_system_steal_time();
> > > > +    now = ktime_get();
> > > > +
> > > > +    /* get the deltas */
> > > > +    delta_steal = curr_steal > sm_core_ctx.prev_steal ?
> > > > +              curr_steal - sm_core_ctx.prev_steal : 0;
> > > > +    delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now,
> > > > sm_core_ctx.prev_time)), 1);
> > > 
> > > The below return on '!delta_ns' makes this max(...) useless, right?
> > > Regardless, if the time between 2 measures is less then 1ns, I
> > > believe, the whole measure is not trustworthy
> > > 
> > 
> > Seeing sashiko comment on divide by zero, i forgot I had max above there :(
> > 
> > > > +
> > > > +    /* Update for next calculation */
> > > > +    sm_core_ctx.prev_steal = curr_steal;
> > > > +    sm_core_ctx.prev_time = now;
> > > 
> > > So below return should go prior to this update, because 'now' is actually
> > > the same as 'prev_time', right?
> > > 
> > > I don't understand why 'now' can be so close to prev_time, because
> > > you've scheduled this callback on the regular interval. But if that's
> > > possible, can you explain that and do like this at the very beginning
> > > of the function:
> > > 
> 
> I don't think it is possible.
> 
> > >          now = ktime_get();
> > >          if (unlikely(now < sm_core_ctx.prev_time +
> > > sm_core_ctx.interval / 2)) {
> > >                  pr_warn(...);
> > >                  return;
> > >          }
> > 
> > Pretty much, just have to requeue the work.
> > 
> > > 
> > > And if it's a never-happen condition, just use WARN_ON().
> > > 
> 
> I have decided keep just max_t() to ensure no divide by zero happens.
> 
> Issue with putting sm_core_ctx.interval_ms check is that, one may edit
> it while the work is queued, but not yet called. It would print wrongly
> in that case.

Who is that 'one'? If it's userspace, you can simply disallow changing
the interval. If it's kernel, you're already compromised, and
everything is not trustworthy.

I would simply disallow to change any parameters while the driver is
loaded. If I need to change something - I unload it and load with new
interval, or whatever.

> Even if work function gets called prematurely, it should be fine since the
> steal also increases accordingly. No issues in delta logic.
> 
> So capping to 1 to ensure no divide by 0 happens due to scaling of
> delta_ns is good enough.
 
If there's 1 nanosecond between two calls, your statistics is very
inaccurate, pretty much a noise. You want to make decision based on
noise. That's simply wrong.
 
> > Ya, it is a never-happen condition. I will use WARN_ON.
> > 
