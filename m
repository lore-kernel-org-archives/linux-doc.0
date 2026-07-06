Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010041.outbound.protection.outlook.com [40.93.198.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770FF2F7F00;
	Mon,  6 Jul 2026 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783364696; cv=fail; b=F8mKHWJRK4GIUMctXZh9wvRKm9NsZzDI9t6kftlNh/hMXPrPVyMHFUtts2yyeqvh+PYeAlBHwdlojowEd7LG0NofeRijH6epc3iWxrxuJvOwXdiaK3UphJlnlZhPYR8FMDiE0adWjq/dSrX1gNXNsS0MFh5kWQS/ZaD+LF5997o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783364696; c=relaxed/simple;
	bh=qFn6qyyT7H2qerzNqkn0PvbJDi3j8w9YErPfsk/W0UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZcTUf8rbqZOn4yMknTzS/IXFmckeAokI+g7o4dBucnjI1HC/fG79eAT/FkCNLBnyOFwBPRRw7iEVVZphOCeOD+C4RVnCiG1LJ80XGV41yN8mGGzM5wEzTwlkNzebmJOaIt7gdUjohw9RQgoebTLyfX1N0bbUpT082sbK1c+xAy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tcup2Kog; arc=fail smtp.client-ip=40.93.198.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tcup2Kog"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp3JdThiKmv33dnoeyJQLvTPz8ADxH9ZCy9wyEwpGjOmUs4+PcPHWa6RJ70gO7yvPu09q9qNZBsq0y3YvyYz7Y255LTbm0rQ3g5egmo5ie8QoCrmHqZ7S494WoanJ+GcQCoNiME06kJ6VulhDwK7oBhXG7S0LzeIRiFUJOlKevJUpl7ch16XfmQkQrZ/ROUj4K52X9sYOsMOK9igQ/DRB0EdI1ZqZ8GURjkBASfgJO567PwUEZktLkiAu3q24Lm4OUys5TcaMokgx0hCX8b5V88lnE2uclu7tWAGmY7N1nIhAYptG2oEUIvZq9ndjmOchXZwfLXwtO2lFLcb2i0gSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIURI6vtZGQQVTfY+ec4HBTUG5aFLWlOrPJxaqbrUk0=;
 b=sz45Q+o8EMFpkwHc2uo+7iLdISK1bTJcWoe3RGXZYR68UPuVzd7OMHZ4ZfXX5daPs6ec9TTwGwoBvp9dMl2Q9jK+EToLS4kXH7LO74qcO4lKawQsmaiI+gQdL6cBFBaqZ3LPj+2b7iEWOnisdjyHOLAGgglYNvdNz7bxko4Bg+u8bzVH1GeMPnDEMwKJ3D6Tu9Utaun5AbQIZvTVbp20KNyFFz5f5/R32fgIIJhmW7Pd7AGlHbwG9i+rJn+AUK06tMoVRZqG9ExpvST1hJplRl1yupQtnZwNcURbvmgaHCUY8Psm5wYRlN0mcZ4Pa2zjWF/zmpvbxym/QjBa7dnlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIURI6vtZGQQVTfY+ec4HBTUG5aFLWlOrPJxaqbrUk0=;
 b=tcup2KogwVLr9Yxw/NREGWtwm9PZfSEc5hxkTnBerA0GcOvThFMke1sMZeKKgLshxKU4HZsdjHoAuK8+h7OZ4vD6h+F6ERWyaQUNjNpVPSA7gWigHXrPdTghQpvPfXmFqh9a+uBLT52kvtS6WDDldWXF3mpxMQ9laqte7BBKHaSFpx98IaeLkMckClJ+aK1qGQ6fDKZwS4Me99OjBP95idQlnl1KMBEpGKo7ciEtDduLcnzgrW6169Xy/R0K9HxjBxsng3kLFDcl4kpC4d0PEsCczq73dkGmV+/9jdpEhXCgidmrf5NV1WnSjor+OJ5IQlU3ETyvjoIXFdHCHpimvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 19:04:49 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 19:04:49 +0000
Date: Mon, 6 Jul 2026 15:04:48 -0400
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
Message-ID: <akv8UNpSfrrkH2aU@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-18-sshegde@linux.ibm.com>
 <akgKfm_sSl_ZAXfT@yury>
 <8efa7a72-18c1-44b8-aaaf-80006a7c8fff@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8efa7a72-18c1-44b8-aaaf-80006a7c8fff@linux.ibm.com>
X-ClientProxiedBy: BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::31) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 4034cd9f-0308-4208-32d7-08dedb9173b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|23010399003|11063799006|4143699003|56012099006|3023799007|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	2vwIpdJ0ee++JTfOtmImwC2Xi07hODoem3LbJRHMgK3norOTrtZcr8HR+AB+7SlALZHE1p01I1uTs4ZSBkn/8Ri63XxakSgT9V0caVKmj5A0fo4BR/iIv82DHE3cQrd2edIZ76MqspZrcdUXnk3bBFeCnHDJe5PRS/CYWM7gaI/5DxQWfxYzkph9VtaFwIQWdcbZWTGZ2tQNjobZlpTkEXZ3dKO2fTiREHBHCh/Kf3UUvzg9Fpk/10xw0dD7prKWqLqBfrp+8Lr07XOUH/zF2cvH0cwbPxWn4fuw/V3xCdur+8VlOL83Q6oBOEV2nCTqX/jBMr/DTsPLYFQl+28beFHh3xEP1GwczALQwEryULVo2f7n6koontkdKDQOXD5yel6tZIcZhCzgIfL2SbFxU9h6D+kFf+BGmchR0dK7xCCXDWiqsC+FlM15yTUw5zauEKD7o0gU4mr6GAiFyLNuurE2YJ/jzvke3jBIW7qgxZbensqnZsQQOnf0NQJgyx2nlMHxR3+7VXHHSYt27B22EvIFLplVpxS6Flk8XLVR1aOlue9Ed+4tbNLseiQmsMKammSnbwcsl/N4sO7MpCE9J0iMzb3CCdmxuV3MFom9gvVXZHttiVLdPlpFbC2hY3HFlgLjAmUBHfk+Xr3LWrqYiwd7iml/oaZu7g0AoVatQO8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(3023799007)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sflx+CeviRzIEnyHPgnqzj9S3xnB+F9UcEQ1OEIRpHei8aPxUJxlcsNSo1z3?=
 =?us-ascii?Q?jTfTfmADDAF+XjvZFny+0rPJlKU4DknTUN/PwF/f5V9aqfrW1IAQ/y9D2MGc?=
 =?us-ascii?Q?wp0eXTskjZhMm67eYsIsDWwJJ+LAtODn+LkGXHPmSczmO56uS7rURiRdXB3k?=
 =?us-ascii?Q?d/hWOge3oGfZfiQ+l07gcqRCKSUOqv1TVhkeoKCt4iRpDmzPLKqeVCd9WPz/?=
 =?us-ascii?Q?yxE+WhuoF/9lHyM1pnqRCH9zN2in46lYnC3FxaXZJ0Bq9A87iCMg24eZhr+v?=
 =?us-ascii?Q?rvIiMPwLsakepsMx5TOn3OMjJMFUIgag9S15fIbYrPhDMHMtUIvGYWln65kV?=
 =?us-ascii?Q?KgHUI6X8MaIZ+6vixDurGB+L7EzZwND6f85VslaYd3mqS8QbqLXazT2Hb3Pa?=
 =?us-ascii?Q?gPa92Z6Ys6+FnTg+eHwHJSAiBZe7ppt3L8aBqR+qQna385JRRMTTHmP9Vlhr?=
 =?us-ascii?Q?P50TXKrx41pO5wlY7E1+P8vzlR2LQX4S0t5U2uF8HwPfVXCXj+UkK807hmAE?=
 =?us-ascii?Q?fyvYNzOEgg4eKWTCOMaz2z3MiJ59eXOeHcHGLc/NQcYWVDGs+RqZIcYpFsD0?=
 =?us-ascii?Q?kjfrVjfNcxFrN05Rwln/8+XP3ODFur/jC9+uIBr7zoYj4EvB+TqhBBlx4pyp?=
 =?us-ascii?Q?lS5+b5LFpR7jWTwXIK339YWOgDnU3dWCafpGWzf496CwlCy06Iggd7PNHK7m?=
 =?us-ascii?Q?U4g7BtTOJxOQec6v0OcLTYlenKtRiYjtnfiqxZOLU1rIhvbn7c5GC4At7iog?=
 =?us-ascii?Q?T94uLYcW754Q0KDeQub/6qVOXKe9EociSn9pg3WorJTAPIpm6ihOo1eYM2Ro?=
 =?us-ascii?Q?+oZF5pkZIb4y8rPHgv03Ym8n8dPjCRd5CWzMzglK3a0PR1u0lt16cG0PoVnc?=
 =?us-ascii?Q?yRb6a9xTud9eqpnqb1VtQ0CFXtJc2fnC9/TIZ0TT0/9iq1ovmKO2zrm4bDF8?=
 =?us-ascii?Q?SAy+BM3CpJQ/4AVMITYQJTb3Kjo8n7o0m8Bx9vf655HjQoYNjjhZizVAXfVF?=
 =?us-ascii?Q?ZGyO88d5YOrd59habT291fCUYCm+3r+9NjXlm359p0XLIZNoT9RdiBUZoE34?=
 =?us-ascii?Q?gNUgEHaRewwu0Xay1O1ZlUolVJTd4Tf0Q7Lyu+Qu213ZoBwzbzPmPnKh3M2h?=
 =?us-ascii?Q?iY0pb+nT6Monz0s27N0R+DkmkpfZ0emIoifzb32T7Mhab8iZ08tl/XmBdpB2?=
 =?us-ascii?Q?7jEJlA12QF1H4Q8DTe4u0FGHyHWiiiW0wWdboK0oDdEU80+7vTKbYwH1ctwb?=
 =?us-ascii?Q?L3Xc/C8jL1emZSLmjO/uOlrYBQmVmkAN6aw/99xWjRGBjQ/PWxP7NyXbgOuz?=
 =?us-ascii?Q?z0Z/Axq2mvpVQ87+WfsL4EdGT1dWBdD/jGGmX1jMw1/unhoQSvCtlaJeD9u1?=
 =?us-ascii?Q?DRcWYcr/tIZNlkZoZpTGfFPz+bnri9HnjOwaCysfLnuv78ynZRTwMTW20nEx?=
 =?us-ascii?Q?RyfJyr+ZY0HgwMQGj4rx9a9mrS4nmgirvTDz7siWYhDkkAsPO+D6kLr4114X?=
 =?us-ascii?Q?ZA3RxXNcArthcxC5Etuj6nDfQk5ORoN5N2oag6ocbps5HSzBOZrZE8tEeYrw?=
 =?us-ascii?Q?+2WrdThi0J3xA8WvbNqarljQWohdYNjabkPkZbvwPyBVINxqT0bKAl6/o7km?=
 =?us-ascii?Q?WJfbB5Pt1mYvrYHx57Pxsae5FlO6c7v0p5cZSL/b5YoexteLdtcjZraVZns5?=
 =?us-ascii?Q?H1o43k+O+4X40n9Zwaugkg5TVI0je9TCG6gHCyjLvn2IMAjl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4034cd9f-0308-4208-32d7-08dedb9173b4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 19:04:49.2475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqDtJRyHIvYJR/R5ODSqfmuFzlde8uOZDdiNtgElFcZ//FlnAwwcG/KofMwYBddSXtF2Ddp5rN4XGhXjtIv0CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960

On Mon, Jul 06, 2026 at 02:17:15PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 7/4/26 12:46 AM, Yury Norov wrote:
> > On Wed, Jul 01, 2026 at 07:46:48PM +0530, Shrikanth Hegde wrote:
> > > steal monitor takes global view of steal time instead of individual
> > > vCPU. For this collect overall steal values across all the vCPUs or
> > > vCPUs of interest.
> > > 
> > > Default implementation chooses steal time across all active CPUs.
> > > 
> > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > ---
> > > v5->v6:
> > > - Add cpus_read_lock() for hotplug safety
> > > 
> > >   drivers/virt/steal_monitor/Makefile   |  2 +-
> > >   drivers/virt/steal_monitor/defaults.c | 28 +++++++++++++++++++++++++++
> > >   drivers/virt/steal_monitor/sm_core.h  |  3 +++
> > >   3 files changed, 32 insertions(+), 1 deletion(-)
> > >   create mode 100644 drivers/virt/steal_monitor/defaults.c
> > > 
> > > diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
> > > index 24cee55342ce..7c16f8cf9583 100644
> > > --- a/drivers/virt/steal_monitor/Makefile
> > > +++ b/drivers/virt/steal_monitor/Makefile
> > > @@ -11,4 +11,4 @@
> > >   #
> > >   obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
> > > -steal_monitor-y := sm_core.o
> > > +steal_monitor-y := sm_core.o defaults.o
> > > diff --git a/drivers/virt/steal_monitor/defaults.c b/drivers/virt/steal_monitor/defaults.c
> > > new file mode 100644
> > > index 000000000000..6681f9938f6a
> > > --- /dev/null
> > > +++ b/drivers/virt/steal_monitor/defaults.c
> > > @@ -0,0 +1,28 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Base file contains the default implementations.
> > > + * These are defined as __weak so that arch may define
> > > + * strong symbols to override.
> > 
> > But there's no arch doing that, right? It looks like overcomplication
> > with no benefit.
> > 
> > There's just ~50 drivers defining weak symbols, so this is not a
> > common practice. I think it would be much simpler for the arch people
> > to simply write their own driver controlling cpu_preferred_mask,
> > rather than tweaking your code.
> > 
> 
> s390 folks asked for explicit hooks since they have some of the info
> coming from HW w.r.t to vertical high/vertical low etc. So i have designed it that way.
> (I know code is not there yet)
> 
> If each arch writes its own driver, wouldn't that lead to
> - code duplication as each arch more or less may have to do same.
> - each arch has to catch up any improvements that happens to default monitor.
> - each arch has to honor design construct and not violate it.
> - kconfig puzzles, to choose generic or arch specific ones etc.
 
That sounds reasonable and logically correct. But wait...

Why only 50 drivers play nasty __weak games? How all others handle
that? Maybe callbacks? Maybe hooks or function tables? Something else?

You started this as a small demonstration, now it more reminds
a framework enterprise solution. Which it isn't
 
> If it makes sense,
> - I can make it as strong symbols for now.
> - when the arch specific implementations arrive, can make it as
>   __weak to accommodate that.

Please make the symbols all strong unless you actually have arch
implementation. If you think that weak functions is the best approach
for s390, feel free to provide such a patch as the very last in the
series, mentioning it's for those s390 people reference, not for
immediate imclusion.

Thanks,
Yury
