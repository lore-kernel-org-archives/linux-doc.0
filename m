Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012047.outbound.protection.outlook.com [52.101.53.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CFD446856;
	Tue, 14 Jul 2026 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784032298; cv=fail; b=pWHCcv7WlgjakTTl1M7zwtHPl1glfr3l00tbBZw9/jHwhWUPfeiFTSbXgyLgqK7Fgki/cherGZnj4TFF37L80Vd7RlGayUeun7ujSiA6saPg4p5uSrff7V0woI5jpqDv5JuQxxkVbyFEyKYErXAaZe9H/Hnnb1lkGdKcWWqUHtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784032298; c=relaxed/simple;
	bh=UWvs9H31jxaidsiCatjAX2qREfyTiyN/UtyS6Nms4AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GgLVFPg29Ye6QOaH00vId8mK5YLek7MD0gb9kT5OOAnTRTQQeVdukEG5HgqEgB1l7VFINdPDs/IGbupitHBopF7TVHe7HhZKWWZv2Qg8PACQ5TnZBT7OFPCfyiWxtg14l0VX9YivFWJfBf3gflEob/T06Vdp+pH4M9SwSROMFik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HY0W6z95; arc=fail smtp.client-ip=52.101.53.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HY0W6z95"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ww+Zi8aepxdNMw0zwPUlircy4bluEyPP3yF+Lm8Hl8fds5SmBIzLazl1OPe8vcmqvWdij9kUYBmOe25gy0DvUJ+bkVWQzCdSDrcglaknpYI9WePzT2YfJElKGxzpXxckYB3Z3ZoDsTmLkoBdcubDlRDrjy9c6RPz5XnwjkO+i6r2h9lZ2yECxotfJweAb8UwchYyI4VUcOM90RKKd/eLClnQzbMjiRgiL+KjCIxLFNIjcREujBHNvw7Gw5o87seSIvyagUpyWiUloTKqZm+wO08m1OYKfZ6ER1ZaSc1m+bjuQ7BUZSYHBur8H0QBtM1654NfT5+VZTXR7mXUS4X9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zqnfb+xAFwxfedD0dGaeRIqB+3CCJ2QKWc5w2k5CWYM=;
 b=INuGXZMhZG5TRFoz7UspxIF+mqESHLGJqG8+pvTVdtQ9Tdn5zle1XJkN/TvX4BE3J5XoijaXl9Z0ywZsebpM9H0ByqzgUtHzUXJh88IrE9x6nDu7sJUs+5uw99NoBCNj+yBieGiFC/2q2C8VwVljCf4qyMW2g9uEBeE9hBfpSKs2o7Df6OY8IgZuBDmN0C3MsFbmtsKQAecXrcL8KTUwKwarleZJhadX/GLmJfvRZ/jWn84IhzcPBsSm8YdZiUKwhvbON/u/VywX9vmnoq2lKBcouI7qblN7ht7RN/yi2zXkYtPT5xN+wSBfNP9tlg8B7FjY8pMJMhJPGTjZQ0JCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zqnfb+xAFwxfedD0dGaeRIqB+3CCJ2QKWc5w2k5CWYM=;
 b=HY0W6z95YmTAst2ECcIkzLbtCOtrT8Y+ny1avGiJJ8SjGVP3kAkQyR2oQGhKfT1L+1Fw+8Hui72PsDIEbLQV5cmhlj3E8lRnZH/RO/FBo/mx6w0umxth02+EzpWm/z9UE4dAvwgRv7HXVpKbogfqTb3LR+hd+tvbSjHEF9YwvSkSVAOAtksgEuU5LdWDsRrD5lgVNchch4Cd74G/AUknoW6VD9aZEF4RzXW4W+vpsuGaKiTMbh/WZQNCuBIJ27DUFRK0sdX2pxdtfQVstkunfIxGwup4B616Sp1HWFtbW36TSDrz+9onfAj1lq6ZlM/VP4WIOWmO2vMklUKwyoe/UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by SA1PR12MB6872.namprd12.prod.outlook.com (2603:10b6:806:24c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 12:31:22 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 12:31:22 +0000
Date: Tue, 14 Jul 2026 08:31:21 -0400
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
Message-ID: <alYsGQhAyknF4X5b@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-12-sshegde@linux.ibm.com>
 <alFX75dzgkMnDXAD@yury>
 <9da4fd45-0a0f-495d-8207-816ee88c5937@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9da4fd45-0a0f-495d-8207-816ee88c5937@linux.ibm.com>
X-ClientProxiedBy: BN9PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:408:fe::34) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9206a5f0-8554-4c24-96ff-08dee1a3d028
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	vbUbpa2ZLbdEsZR7JC+ExUqFnm+7NRSUvvM8PW/SKqk9yEM41twUQF21YIUaRJJ5ioSVHc+ee9q7s8YX/TDeHDs3bNsDoEMlewl0fEisULzQeybFCE63SYr0dXZ451h1nyvoweh2E2Q27URcppKSnJuwFq8+8XEJTGzrwSMwuWv6PH/KogvOspANuoAHKlmLn12TDSySKP8GlXpsgRafIdJfnS/BG/8IpUaRIftsPTiO6pgbY+BLb9urfccYqboChAzAGGL9j7DhdaFJ1atBo4EcGf/zh/Y+K3y5E5e+m2TAFlq/gyScOe7o7sDZWT2gS0FMNx6L0jCvOM1/r9JtdKe9FujaaV+o241l08QN5X0R7UW/w1jtXCR6PHxOV8QttdSDwuXiVk8/53cBkT8IpMtoNCIVQsS3yletca6H9DYKDCTguQvQJ099iNgGEgArVmlI3AHQAvhnCXBfIW7fUrSaQcxSLBNlM5G9g3J98WTzspZrHuh6OQzsBojsTX7NrWRQqSJjFgkzjUGKTuWHi4kjexBdj1iEoEXcRdiotoZ3l6UmO9e6bn38E1uym06QMaf5HdbCQ7Jr5iZenOA7CzQIDu9evetcu47DCM+Hgz9IzbIXMo7OuVndssj14f2Jhr393ImPzC9IzbhHypI7H+QRPedqKmJ7QlZ31hHQ4oA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NnF3czClUvEA9he2aD7OePZC1k1gE1Wrvs7j+V8iDqscubEiFi5gesOxomv4?=
 =?us-ascii?Q?vC3sw0ctCvAPJO5Wlsy0w5T01re+x9Jy4TLp2pnGlyN9UmCOv2+0Ej1SU0WY?=
 =?us-ascii?Q?SjY8rPNXEF+1R0ahek2UMap0BOGMBWWqtKeDq6Uq4L6YAePxfCcuMdVov3+5?=
 =?us-ascii?Q?Lg3Z3+LVt9sS2v/L66Yd5lUkRRTUBxboaTNSA3KtXzp3QFHL7ziTy9yFECY0?=
 =?us-ascii?Q?vhDBYVVQJsUgZmVRE1x0pkPq0+mlzCeBugBctzTH875UUiqD2kKyKyjXMb+S?=
 =?us-ascii?Q?NrVuePcLEWLpSSnL4z5tnyE9GWto4JLeQ0JqnV1+PWyDtjzRba+ZiMnAaTZ9?=
 =?us-ascii?Q?d0Cjf3VYv6GfY9tujAZ09KwAStPUDBnJ/MRGZxWZTM1ehHZ58EihX84FAaF3?=
 =?us-ascii?Q?62GSNtGKmJL6wTW3cgJcxvjt9RtwzybXus33/Gv/TzIuSp4qzwmM8eWyvFZh?=
 =?us-ascii?Q?nYoQw9xKSRz5zjJyunvP8wPtg4K2RMFxSeZjNb16wKUvePAljszdWOoyw7Ww?=
 =?us-ascii?Q?9icHo7SD0G51ldZ8cfF6fM/eOlg575EO/ZkxHzkeCIaWHEjRgn1r8Hxl7BDy?=
 =?us-ascii?Q?fQ5Dh8cdyKxdI5nay93/MTqE9VF0dsRlRPyntTf00RJsfcWMeS6xeTbifkSv?=
 =?us-ascii?Q?ybdhsize3BIDkhQr0pI7ErbOMSHKIMJLLyMPjbLAv4lZ+4JWnBQIx4ZviatA?=
 =?us-ascii?Q?Uvb2B7sx/VhFAxuLzyxRAraBgRw/gaN2JAWAsJ2I9cVfIsKgLIxVf5BpMy+l?=
 =?us-ascii?Q?fbwipXc8YedRXck/RphQQY0pO8PKi7n/m+kNAIxQv9BiUNZBJwZNpKZuBOsZ?=
 =?us-ascii?Q?QzR0CA6CZUtopQfzUQQJJi3JM/T/RJruRu2F5XaRWq9NNTqja4riOVXPiMEF?=
 =?us-ascii?Q?ahlJ5Q1QSpdbBz5SwW3PXMBR/OVKwwzt3uk3aU8ndmBq8GF40e1IzB409CEq?=
 =?us-ascii?Q?SNaa6STz+r0476MtSVynPz2Hv937hhtUCZfkTLpo5DsuhISK2jB6/Uqqj8uW?=
 =?us-ascii?Q?1Sn2OFiRXFWM9hLzZQlIB/4r7qqjy1eKCvjrT+q5380EaATMscvmJoWYg6py?=
 =?us-ascii?Q?sjg6EZFunXEekWPYqRDFy25+l+DjiP9OeqCKCsXJrv5PM//pGhs44VbqOEUL?=
 =?us-ascii?Q?x9UphPVL33N6BiIIX4UK0s9RnOYOiuIEmfP/6S7hou7tzP/TvaFVYOi9uEp+?=
 =?us-ascii?Q?eHvIEr03unEDz/z+BMfELDARyNb4fb/Izp5jMX8JSwQX6HZ2DVwaZA+G4dHq?=
 =?us-ascii?Q?loCPskFb0Xp9QQX8i3fGzgvT38Fj4OtoM5xsMap4I1FABx6WD7W0zeMe6I47?=
 =?us-ascii?Q?S5Fhq2M84QDuYmH2EIAStZPMCGRXXRyHAr9hlsZKobPwbOteT9CXgKJ8ae7F?=
 =?us-ascii?Q?12KQ52z2/BqkxlxEz+CsO39qAYYwal2R2wJdsqe5nNlR6goAPleDHKyXmikP?=
 =?us-ascii?Q?bEqP8tA1ocNEo5laJ74arR7DBboapjy4SZvahmq9WjoqN9Gl9NiCOQDNaGP8?=
 =?us-ascii?Q?n7WPYDfd14Ugkpu/nNJ2ekwf/NrgGivCJnxlgwnY23sY13nrJrD5BgJicwNZ?=
 =?us-ascii?Q?8BOy7pa8ltBtMIKQoPZ97tt8xyUZGdtRTzFYAYdGg8hIGNjxpDYtcmGlsTfU?=
 =?us-ascii?Q?3Ob6GiE4vgEh9eWHDEE6htYvJgEpQ5Ngw9zJK/+e6ONNfOr/GytlBV1Lts1s?=
 =?us-ascii?Q?Ir296INQddEWnU9XXufcCT1UZxtScJ4KY0/gvgxoiH+YfXA+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9206a5f0-8554-4c24-96ff-08dee1a3d028
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 12:31:22.4503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyAvtP1Q+2xnJGSzIvHgzfGckPx0yG5d6inJFXBr+5XoYZCXwyjIhSjAEkOgQ8mBlqFyO8dOTVm5bIGNRd+MYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872

On Mon, Jul 13, 2026 at 11:18:59AM +0530, Shrikanth Hegde wrote:

... 

> > > +requeue_work:
> > > +	/* maintain design constructs always */
> > > +	WARN_ON_ONCE(cpumask_empty(cpu_preferred_mask));
> > > +	WARN_ON_ONCE(!cpumask_subset(cpu_preferred_mask, cpu_active_mask));
> > 
> > cpu_read_lock here? And again, you should do something to restore
> > integrity. WARN_ON is not enough. The simplest and safest thing you
> > can do is to unload the driver. You definitely shouldn't schedule a
> > new work against the broken cpu_preferred_mask.
> 
> How about not requeue the work if it broken. Add a pr_err and return.
> That makes driver pretty much nop until rmmod.
> 
>         /* maintain design constructs always */
>         if (cpumask_empty(cpu_preferred_mask)) {
>                 pr_err("empty cpu_preferred_mask, stop steal_monitor work");
>                 return;
>         }
> 
>         if (!cpumask_subset(cpu_preferred_mask, cpu_active_mask)) {
>                 pr_err("preferred: %*pbl is not a subset of active: %*pbl, stop steal_monitor work\n",
>                        pr_cpuamsk_args(cpu_preferred_mask), pr_cpuamsk_args(cpu_active_mask));
> 		return;
> 	}
 
That would keep broken preferred cpumask working in the kernel.

Imagine, it becomes empty on Friday night. That severely hurts 
the scheduling on the VMs. So, your approach requires the VM
admin to come and manually rmmod the driver. This is not how
he wanted to spend the evening, I guess. :)

So, ether unload the driver, or actively recover the invariant.

Thanks,
Yury
