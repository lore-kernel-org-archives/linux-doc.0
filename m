Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDFF37B41F;
	Fri,  6 Mar 2026 14:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772806683; cv=fail; b=CWANrFEpW/XQ1sgoTFmP2FrqrMB+h3I1XBfO6fgcYhxwkom7/jfBD+RHcSoOtD2eA7+l4gwCZjirCio88c/aKEjvWzc6OeRT5l2xWEfA4aqzNH6uoFyUlLelZdwqUi0VhhnCIRBqMfYcwDWx1dYMTwveCnhC+hmuPbV2oyqyxu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772806683; c=relaxed/simple;
	bh=DavpZywiz6FPslgSd6TBjNLvK+9QSAUAT5zQw0MZVtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VAZEv2Jr7BS4aHDwj01EFw4EZdUw2v9pIbCo8GgnFdLJUmtQPP2maDMDd899ZExXzsfNDWavG95u8GqQ0VIAHpU3dGM3hApch9B21wc6Md23Tl8rX14VYrnKXW3LeyPAxsq74BYIOU3ijt90lC06REMi+tsfFkyYYe2hcQX6AaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CgFiboYH; arc=fail smtp.client-ip=52.101.53.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgFiboYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wmt0OTtU9a1evx2nf0k9zh4mt9/+sz82mr75UBYa3BbANcYUfKHJTE7bGz89cHuvwiYfObxDHE1kQlKmHI2m35Dyh1sQ9WWrVIDecbc6SBrwaeYEzL4F1FaMEeU6OwUe2vzkhSaYYhq1hCWz+QRw71ViegiVP/+txPUxvdv/oa8KKeqHnV4VuZf92A1auYVDI0331gMWCiCQ9paEZfvKYsU60PKlvzEgqqoWj1iIq9KMnslInugXHKJS2qIDIDxhM5oDUowl1t9uQ4WGj65qw1+UFicPMWwWynhtOJ4JaMIPYZddxoG2ckWVE6Rht6Peg8VBj8gBazcpScmeZrvULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YHaz/IzP+GqtX418M3IqwPf17DRPYj4cTDyFRefpBNA=;
 b=VFy3oSoFwr0rb6eUcAwospnI0iNYfZsol/PX6yO8bYw7k/m4acfO1/9Shrku1n1gQuUVV7PqlzJuhMIzN8eypNl2jK4lkbdfF4xJCNMBeV8kaenXo3KMmk0u8lHqS/nGX3hNsSUCISGy0BxV2HTbQT/BDIk3euJXzJV6Cxxp0/XtMjdMT5Nr2GKDCSD9DwrRkOKpBrbtHzvfA478PmHupCos3Juq+V9rK2L61rtXFnHMMWtyyuOcnSiQbfD/OIvQL1M2p6uVgX+ejFe3jiDMREEv3oqOgcoXRVCr+Rdf3OXjXohHSp0cyuKKKFRfnX1X7Hvd9AwWsV+giAcloE9l5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YHaz/IzP+GqtX418M3IqwPf17DRPYj4cTDyFRefpBNA=;
 b=CgFiboYHwymf+4f4r1d1dlLXG38Qa+Khlm37+llonvtQMP+ntOiBp9LtQdamHoKeny/CugBAuKZmVFhEyB52qUlq6tE4n4QXhFQhhVlk0bRtiqghhg9YZbbjN82IH/q33bvxJoCAiOK4+MyZNtLLklvwCjUquBQ4dVnmRqSXCJC+z8iKdbTSQvbZ9pbHGY7hppjavxJmPc+aWS2vAvKrlHD3mT0UqRbFystx93ypEnncw0Z46qDHlq7jTthclBeOVozdVndupTXtdAEUix8ncScHbS7hX/MfGsOQPYvECqKXrCo8Toji34AoPmuIoSnE96N6maAmwL3SG9uWTVKT/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by CH3PR12MB8355.namprd12.prod.outlook.com (2603:10b6:610:131::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 14:17:57 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 14:17:57 +0000
Date: Fri, 6 Mar 2026 15:17:54 +0100
From: Andrea Righi <arighi@nvidia.com>
To: Christian Loehle <christian.loehle@arm.com>
Cc: tj@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Mention scheduling class
 precedence
Message-ID: <aariEvEhRfA_PB5H@gpd4>
References: <20260306103051.1038604-1-christian.loehle@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306103051.1038604-1-christian.loehle@arm.com>
X-ClientProxiedBy: MI2P293CA0010.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::20) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|CH3PR12MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: d109d34b-c0b3-4d83-b930-08de7b8b2a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	7PrI3IcSAOPrcXyBP4kPLRsI1G6OoW6FMb+iE5aKUMEkPOdzjUKmlYogx/8VajIaRQRxZQv9caM+iium84llLZFPMAfhsw7y9WysTR0tr7GrbxurStkhiPPpLh6OUspg7Sr4hXDaR8erIG3VeOkkdX0kfYE/dVOASxjoR6EntAZ8OihL5Rr1N5qltusm2t7z0//5EKdI+6wNwV8sVP5nvpLgQT0C/3h5GOGEdl3R8unVJdARV5GgjLzfhnMgVmi9yCFAE9fd8mgs/6ti6YS8t008LrgaYpPLc0KRPZ/adCnN8we77MVfk4tHUB7ewN0iKnB+s6gRGNRADA2gtnkgHM6NSUhCvOtHAVQvKNfvDc707WS7qILUPG3p6+G1lGY0DJuwseBIUmLJQ1L/pV6NiXmsZnqMJq8JllOrLLqMyoFxiok9LRC71xtHoQIanay3ecDdJP7QR5oN0g7SillcTXaLDR71YRM+ma9ajeYZSCyGnTm8Qi7SPOV+LD/CFNkop6w5MJDDxqaId3jfkjvl4ddCkCMEpAr3pmUsdN2LIk+QZPiy70LE+AXeBRdSWEnBbBm5CfyIqYPOHBCrTSVOoKHABy3aZkuTW5Bpj6v5WM7ny3tpVZfeRrjJ3tfRwazMEb1cqm+PCnnckNZUQV3LzvosdnoPEtHFpKkus2jobN3Q+yAqjd/teWi3JS5hhzgu+ZiXzwoMku6mjve3Ji+79fNgEgc2MZS+28G7QkPv/sE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TeVNDoXrRIg+nePJcAcyYmQ7vJjhqcvlwXYTSThyw9FGyhAaJAE+AP9Oh+4V?=
 =?us-ascii?Q?7pLfTXD8P/FoUGrJgak9BgtWVtPWMHG7wEf02Ef8GHdQCHg/sp8XndeBCrWG?=
 =?us-ascii?Q?CQXmlxN2EmpJFSI3DXXeL7Y6q1RbemlJzx6Yv+Lz2in+s36yLBgm/UMQTzxo?=
 =?us-ascii?Q?ug+OfmunOmWmTWrFvnyfZo3H7kRfInMylUVybSvHfqwDtWezDaVZjAA/x8FB?=
 =?us-ascii?Q?EVwEhAAoFCROSYYTTpUt3BcEvrheBwqtY3USotAU+bjJuD3TkHAQdGrSIzMc?=
 =?us-ascii?Q?J1e0DioowqPb4TkPSZa+GpkUjirI5AsDaNlwNFF5LUGmEPNgPOdWGQpCnj52?=
 =?us-ascii?Q?HxZLDH1QVDzFyTAe4FT8ETRiJYnCSwOhVit0VUn8QdFU7A2e4ZBi6c07aOHY?=
 =?us-ascii?Q?VJEv/lqb57A5OAmAxsLHbFyDqbuvH5+FF9tdwsQ6W6P55POTRIq/diVTC3m5?=
 =?us-ascii?Q?k03BfnZwbXlanyGKxztweCSRkCBIRri2tV8hBaKZk+V7db9hxBLztRq7SZ4f?=
 =?us-ascii?Q?GjRkIu5TMa16tTZSzZB7eHNEBnZrY+D1oZRwZ85RkbHIm5ALOSehEGOXWcLW?=
 =?us-ascii?Q?w77tgCFKZjlEhbIwLVPEip5xE7pGc311kXuRfE9G0Y/P6zsx601oIYoZZv6o?=
 =?us-ascii?Q?i1kfNhP/x+kTgYRAQz9Jww6evf7S5CTrbqWXToizwGEtB1ZeUM5nOQMOX3jB?=
 =?us-ascii?Q?SQoqzdyE7plhZ3+NEZXnZ6rmtFhEgaR3jY3jFeoQbpqddGra+u9n563IEhy2?=
 =?us-ascii?Q?b1tmaISL8MxFkeYuLhoqnv9ksiVBf5CYV+hqpggS7MkKiihYbnniPNddDqIA?=
 =?us-ascii?Q?fYB7sEBkaqKp338LEiVYHk9MLHQ/28CWdxbW7mYereMOn5+Bk0Wbl8eXrljc?=
 =?us-ascii?Q?kIPIPT9UjPhN9CzuvKRyjS+Eo3aP2Z01im9KK7FLzdbSZ9e8OmohRIFvwgX3?=
 =?us-ascii?Q?iUKins6LRi10Vaik3hs98AFlIhOOoDkf13QUR6/Op+qFRJjqKR+2SU4z8r76?=
 =?us-ascii?Q?tgVxojpYXrqNuMz9ps6JcApt7AWfaeqbG8gYAYmGLpqW2XfNj/O87sENchWz?=
 =?us-ascii?Q?CwAc3ISODtQmrWywYvUOysCQ8XEDRIMYdhSHj2bTX3aLVHFL1jsL75nugtsD?=
 =?us-ascii?Q?zqFJHRcb8TaY2LyVrPniMSsdNhPxHhDmdg49g/8Lm+I8x1dQerR6RzVgVGd9?=
 =?us-ascii?Q?hR9VbhU9GlKgA+Q7nE/TZHTXqzzla85eytfYmJb67I7e05qQlKMuT03EORj0?=
 =?us-ascii?Q?4xxFF0tzIdlnf/r4txflLPwl/j0QTQW4XWEGii1d9oBU5/jrS3luGce5LVU6?=
 =?us-ascii?Q?ssn/Qt95MDvlh/qna9+IWeUsl/ZPjzPJGT43umfFyfruRkHyel3DtJVwISFb?=
 =?us-ascii?Q?fLF2q8wCm5yT/HAVSLAY5a0Igwe6nSNwjPWhlrm8dJEtKHFVhvTrwH2tgJVw?=
 =?us-ascii?Q?5sXzON36MerXUkXpHHzZg5ryJT7nLXlWPSWdijT5xrxMRNRpKg54xUMTzKqh?=
 =?us-ascii?Q?qdZfDT31yeCk7uKHDXYtP5DNdd2QB6ghNUrnRRQOXnpXWNo51Xg1xp8JB7qk?=
 =?us-ascii?Q?U5li5w2FwDDWsTJ2U3e6N7YptwZxbr+yyCAlocDkIlNWd34AV2la/i+EkP/h?=
 =?us-ascii?Q?4NrdBCbAPkeevwFMJGLk7azziBA68kCZH3oVcAmQFpbiJIGThp3I1N1M/wvb?=
 =?us-ascii?Q?eYFjqmISfzae1omCx/S9P9scxBVyvVlXWx+Odjk0r0TKDDKJstiIvW4k+C+q?=
 =?us-ascii?Q?enK6kHr9VA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d109d34b-c0b3-4d83-b930-08de7b8b2a7b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:17:57.7951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6RuTsSSDPwbjsQCdV1Lo8N0CyplSPhmZD8VC24072N46IgrCHRNw6YRUMOMlbgGgUCevYnb9RsKXrXF4ydc/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8355

On Fri, Mar 06, 2026 at 10:30:51AM +0000, Christian Loehle wrote:
> Mention the scheduling class precedence of fair and sched_ext to
> clear up how sched_ext partial mode works.
> 
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Agreed, clarifying fair scheduling precedence here can help better
understand the implications of partial mode.

Acked-by: Andrea Righi <arighi@nvidia.com>

Thanks,
-Andrea

> ---
>  Documentation/scheduler/sched-ext.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
> index 9e2882d937b4..100d45963781 100644
> --- a/Documentation/scheduler/sched-ext.rst
> +++ b/Documentation/scheduler/sched-ext.rst
> @@ -58,7 +58,8 @@ in ``ops->flags``, all ``SCHED_NORMAL``, ``SCHED_BATCH``, ``SCHED_IDLE``, and
>  However, when the BPF scheduler is loaded and ``SCX_OPS_SWITCH_PARTIAL`` is
>  set in ``ops->flags``, only tasks with the ``SCHED_EXT`` policy are scheduled
>  by sched_ext, while tasks with ``SCHED_NORMAL``, ``SCHED_BATCH`` and
> -``SCHED_IDLE`` policies are scheduled by the fair-class scheduler.
> +``SCHED_IDLE`` policies are scheduled by the fair-class scheduler which has
> +higher sched_class precedence than ``SCHED_EXT``.
>  
>  Terminating the sched_ext scheduler program, triggering `SysRq-S`, or
>  detection of any internal error including stalled runnable tasks aborts the
> -- 
> 2.34.1
> 
