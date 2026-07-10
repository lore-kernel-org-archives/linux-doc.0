Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7D434417;
	Fri, 10 Jul 2026 15:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698130; cv=fail; b=DS1akG1+Av3WiZYogKSMHa4xSPjcf8AdXQPLVgjO6tXiIk1U+5x08Exr2DsY4/o5zRDK+kpCK/eci+wL6TpzB4cAkAsHSOozrAZg3gAwcs7M0EUHG0RkSjt0eiAmpCIkU3OT9wdUUtqZikbcfgcQEkplLS/U6YKnKUfsMX1XkGk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698130; c=relaxed/simple;
	bh=Z5uYb8RBCi2gS6+j+XEwGuhi2u8rUejcknuLHj9W+nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=glm6RJ26xXM8frxzg+rAXDBV+KgIkhKGGOVgsfS7MRKM/cEfd7u95qoDTcfWwNneP9U6DMt8WdBbnUTFytFC/z/kOJiYp2Iqh+iF3bD88BdaPi2hDalYKrkpDSg40RbtcBgaKx/3/Un8WIN3jQ9DwRdIhrM1rjkMLNJzSGomBvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UW+BFAJ9; arc=fail smtp.client-ip=52.101.62.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UW+BFAJ9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XRia3S4j6HdIGrZ1b4QezLqfkSUtFw0noWMsNsqt257zZK746n+hOM8FTEerdXdq5JPMeu7UqZMF5f0ZYCOtBIcYcbU+yHfDw0VgOCfhBVSP6wvju78RL3f/AhX4PBY8gcBKCWC6pJfd4GUKJXiTrZBqfxMqOh4F74y3qIwYPK8JXkmnpGUH+w/Myb5RvaCVCrbiCJyKvnSxNVVC2NF4/jZ/82kLOoP+klNAB9mYvt7s5fasDC5JS/RFHg4AU+UdRXBU5a6UN9RQF2pMbh+ux8HoOSNYq0dcWZMZ/lmTZL4DMK651aW2rNecodNcGtVvC/gNDRfGzMUvOoCz0y0EaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T48y8LSED7mjLIHpX8aQFeEvKhSwDhb61EPPCQWaH88=;
 b=dfwAdqE8MHO7Ri4xWSZ92yJmnxgwq1/gaTEq1CEnQC2GWteCSaDq4a8ckoiFiAGgcp/+80wjxNrOIHlr+A2UmUAvWCeKaDx2LcF4NDxj4kRHT2BkrvGhE1fsibVxGvRgP8u3xKji4DLt73oeXurbaWSo1jeGPvU6VGifdTABsjVm4102ezWoh5s4Ki+WCeieyAAa0+R+YLjv8RLyubYVEUyOlsl/oAOh6OJ1ar7Nba6GHLWZMg01BYSw+79fx2KZCbtOECYWWDYq7j3V8Smo7rYiWyOZQPHfjCiL+WgrqpuZgOMfVBhyysgRSnPLgBMzt9WEx4kqHH79WqoHvGS3xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T48y8LSED7mjLIHpX8aQFeEvKhSwDhb61EPPCQWaH88=;
 b=UW+BFAJ9aGXT/mVuN4g37FCAzkNxwI5CsAx3x7uLRwkpEVrxTwfq5CZYMB1mi78faainFx5k1EA6sSxDLYf55ZTJPxvwgBTfEjNE/JR/DNhD2TPCFIqRnygpHWVTMxvExKlQy1FToGg6KVsID55lATJ3Q6CgL9o1v/suSj44/Aga++7IqwYI6Oa26mc3rOatsILFMMPxWBdtJyEzzSQBn1diNGGQCWarkJu8knzXbpYGwEtEZRiPuUDwf6LLiW3DLNjG0Sd7pxbDTkI2zewpq7ICZvf41yR1ON/B0u5r+iYDNIotN1I4W+hOwLbf+5TA9BF3vPmqxn6W7n8cXmbr6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SJ1PR12MB6025.namprd12.prod.outlook.com (2603:10b6:a03:48c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 15:42:04 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 15:42:03 +0000
Date: Fri, 10 Jul 2026 11:41:59 -0400
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
Subject: Re: [PATCH v7 03/12] sysfs: Add preferred CPU file
Message-ID: <alESuG6IYZCRESJY@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-4-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709215648.1246821-4-sshegde@linux.ibm.com>
X-ClientProxiedBy: BN9PR03CA0732.namprd03.prod.outlook.com
 (2603:10b6:408:110::17) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e8bd907-197b-42d3-96d5-08dede99c9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|18002099003|22082099003|6133799003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	RD8xSyJ7pM2dxP8sOVz4AZs8wrTbJa1T3sReffOZ8WyfZfTTsymndZxsHwui/hVw2KYG/A1otuIos5S8e38xzyDbODkorl4/54G0z8hTpG8HUvKyfpEdD/BGrGISbXwh63ehBQV7pRLh9VFm52alD2RaIMOKEQtHzUOWLYW+4PDiuXnRnrLQjl1DIBZD9M5xkcrT6jLAa/GF1u3r/Q67jYEN1QB1xIWq2uHVtZ+bD805FGIpUxhgAD6AjkGNNZq/gIi4/Ca1ckQQuaJx1JSsxrFoDS13eJzEY7lshIKDMs62NscJMMCHNXHLrvxwDTcK4qJirBwc/u2+LpahpyxG8JNutN+yhq2VQEARStnMZDvhcziDRMEjIKE2K3/ohW126iVhflxQOmtYgN3roADmDE11g0mRRobAqou35mesMQb0oR8JWCcg5jPQKV++nSJT5LKOjO7Lni/Ys86ZFyo0l7CTAV8f1vt2ttD52c7b94MurE2R4AoChOXewKd4EyRPb//GPWmHFdy3m8gVbBarYmgZrj7owOSRVfwtBurVEWXRAoOBSAAGqggL8HFywdqAMTHdcZ6N+se9PiWWFYGA83ZruphcsXKxHZY22hUYtjRo1um6Ok/jRbONJtbfNi2y87TW0vSF/+Qq5Frsm8sIr0KSZAXtEVa7uezlVjlJqfE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(18002099003)(22082099003)(6133799003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Que9MKn2aSW+Ldo3HG1iKy2NkL+7sgPoIX11+MLpHN/GIqziCuYWRgSqHRLj?=
 =?us-ascii?Q?e1/KYUegnicD8JWTTHO3aWl2iEvpl/jhuMr/VjGFKWVYtS4puh6BD2cU9+80?=
 =?us-ascii?Q?53noB/P53+DBl74248dCu8xPudLCGnrtgdffMPKzfNSnjpb/n4uW9VrQsv5V?=
 =?us-ascii?Q?0aVKh3x646Qtbz/RtILihPwwM9TMvEIXx2o/a+7QzXGPtEwbnG9AXBjRxW/H?=
 =?us-ascii?Q?goOE6GoHOVOW7kkiywgovrOVskuSpi/4zcbVG8t8dpVNqeOIWg9Fweg607IN?=
 =?us-ascii?Q?+oCqI/eypkZxgtOH4tG4Drpiujmie6abYyUu/nIXEn0kMfVCyoFkyaeJEfWW?=
 =?us-ascii?Q?AC3jF9ThNd+FDILQCaIaTZiJcFs3beVXIyYcqnoAKs5U4Cghqe6c/efyf8Qx?=
 =?us-ascii?Q?pbiZ/qB1vHueI2Eat8AsSO/VYAybTRdPYBlqigA+VOsOsS2obwScH1NAyYqs?=
 =?us-ascii?Q?HcOPd/Cuposm2u0io/acxt6g0BKkPhUJCym/uL858rqhRpoEqWEZFKGXghhy?=
 =?us-ascii?Q?yV2H1Xd36c4BDcn4CYzxOCsi66d+J65eVBGQHmc58MgOMqDibDMKmLK01Ej/?=
 =?us-ascii?Q?Ucx18AlQYrUVPzHFbrDdnpm9y/jyL+OByHzqqMKjEYI5/Xa+wdifpZvbDhjC?=
 =?us-ascii?Q?GtYeLFPEyNT8iDza8QTucbK53djkDoFhwJtWowtErjR7kqogDyBgKIBV7faa?=
 =?us-ascii?Q?DpH6rb35urS1g5R1MpH/JNrylQ8BtxR01RPg0J4OgpptquAS7vymyx8N8rKj?=
 =?us-ascii?Q?8oGcqKT7mAXlTUz78tYEpeNG2/jcGyrZOk+eFPQEsqgiXROxHIXi1KAV7Bch?=
 =?us-ascii?Q?488mXczoQ0G3ZKpVxg16Bo4WuJkDw+PEwz+ed3hGiJR4vbkFhhhjUHSl5IFr?=
 =?us-ascii?Q?2wW+TDCqQ9kzBM2r4tpGPMXTQ5vGVp/gLIV830kJzxkyXUEQpChruifaExC2?=
 =?us-ascii?Q?xqug3RkL6bJJTpt2w/KJZtAxcocOQqWFeCs5vIfwd2wg2ph3dI+KrgPJqLy5?=
 =?us-ascii?Q?eDcDC8ZGyD4vW5JmSsjVKic/2QsKX7lS0SYwjgLehWCf/mZlvA+W2rRHj0Vc?=
 =?us-ascii?Q?SgfQYtbRl4nWOTnkJNT4SpUd1cUepx2csdc+iHMDkWv6uHjI8kimzy6plRmA?=
 =?us-ascii?Q?5HOGEPyjcOQgZoYs+ta39gapMc2y87LDtSZO3jGmwPguG5imyPbik9FC2SCs?=
 =?us-ascii?Q?YJDlfxPOOiW3BN8/AVqdl55d3/IczT4dXzyswQgrRdCpbjVkrwjTVfQXPjIB?=
 =?us-ascii?Q?fLb31RMR04bkUjgZdyUhRzzXhbeYC7faAVCqG4CH4YhBnZUpdwxhjYvZa5XE?=
 =?us-ascii?Q?Hkb005eSjs0lxYcbHWG4Z17VcG9LZ8RTkydrYHPDb3PNlSXf46/wAHKKXNg4?=
 =?us-ascii?Q?xO1AtrrMvyNQgcQ1eH6kpN15YmzFgELEuEmxWARD44dQT3FYKPzoO4DGhLK0?=
 =?us-ascii?Q?HS3sAHo3TR08cn0CIvWJ30hmpzQoqgPffQ9bnwRYttJ7LJbbNTtRdtWmf0Wc?=
 =?us-ascii?Q?jy0ZPPTB9/au2zc3/pt1wUn4sL43eK1gNlP+MURlg0v1Yi9w17g8ma1L205j?=
 =?us-ascii?Q?Cf4pEmN8USKOCdIeB9BOlHhXm/TP4YQfLv64MG2VzFn+Kfx6iDh8mSDkguTK?=
 =?us-ascii?Q?77bPtqBCjudtDu0+tnA1V4czCbho5teKafwuRKArkkJav49VOg18Q/+7dy6Y?=
 =?us-ascii?Q?A7h6g5C9uUz+dXaQxaRFU+XHqQOwDsTotPB4SQWttluPQDVL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8bd907-197b-42d3-96d5-08dede99c9d4
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:42:03.4932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OO9s1MzquBDRpwsEqexoXBNdEh4qxSfO7gUXoKK5Uip4vooSChSnk9jvG587PmSb2v2hGYONpnieIHwZqeJ36w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025

On Fri, Jul 10, 2026 at 03:26:39AM +0530, Shrikanth Hegde wrote:
> Add "preferred" file in /sys/devices/system/cpu
> 
> This offers
> - User can quickly check which CPUs are marked as preferred at this
>   moment.
> - Userspace algorithms irqbalance could use this mask to send irq into
>   preferred CPUs.
> 
> For example:
> cat /sys/devices/system/cpu/online
> 0-719
> cat /sys/devices/system/cpu/preferred
> 0-599        <<< Implies 0-599 are preferred for workloads and 600-719
>                  should be avoided at this moment.
> 
> cat /sys/devices/system/cpu/preferred
> 0-719        <<< All CPUs are usable. There is no preference.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  Documentation/ABI/testing/sysfs-devices-system-cpu | 11 +++++++++++
>  drivers/base/cpu.c                                 |  8 ++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 82d10d556cc8..ac1dbb209cc7 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -806,3 +806,14 @@ Date:		Nov 2022
>  Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
>  Description:
>  		(RO) the list of CPUs that can be brought online.
> +
> +What:		/sys/devices/system/cpu/preferred
> +Date:		July 2026
> +Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> +Description:
> +		(RO) the list of preferred CPUs at this moment.
> +		These are the only CPUs meant to be used at the moment.
> +		Using CPU outside of the list could lead to more
> +		contention of underlying physical CPU resource. Dynamically
> +		changes based on steal time. With CONFIG_PREFERRED_CPU=n it
> +		is same as active CPUs. See sched-arch.rst for more details.

This should mention that it's about paravirtualization.

> diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> index 19d288a3c80c..4ac990efee7c 100644
> --- a/drivers/base/cpu.c
> +++ b/drivers/base/cpu.c
> @@ -391,6 +391,13 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
>  }
>  #endif
>  
> +static ssize_t preferred_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_preferred_mask));
> +}
> +static DEVICE_ATTR_RO(preferred);
> +
>  const struct bus_type cpu_subsys = {
>  	.name = "cpu",
>  	.dev_name = "cpu",
> @@ -532,6 +539,7 @@ static struct attribute *cpu_root_attrs[] = {
>  #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
>  	&dev_attr_modalias.attr,
>  #endif
> +	&dev_attr_preferred.attr,

 #ifdef CONFIG_PREFERRED_CPUS ?

>  	NULL
>  };
>  
> -- 
> 2.47.3
