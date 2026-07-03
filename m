Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C251A9F8C;
	Fri,  3 Jul 2026 18:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783103285; cv=fail; b=fbGeoAKvLsP1oHq21z1JGeN3L7SC8Zu+tnUqrqlqKPTD4kq1Erb3fXDpXtObzJd+y5+/6YSvpgONYI8jtCZa4/Hd4dkEkdzos0sTk4ZodM8cLfvHmqS34SYSHule5D4aA2hWmrM3LsYVIjS3O9k6hoSAcin6atdCFrlj05rBb8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783103285; c=relaxed/simple;
	bh=gaCZ1fQKHq7fdFsJ4TI7g+HGgIExkASvrcZSta7BOtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vGDNNMsudueKXKT6IVaoHgAv3LPcwQh4Q3eGsZCgs+NowHUSNezuWZg+W1HmlISlnrqfcA18JiMGlyP6wEXG/+mSGdxOHU5eXDwbNKUnUp+ofNjEqCKboOp1r1zBd/xIHb+wVr8ieOXyYSV/g9vdSA/o+OlpTTuDxc+sJT3PGh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pehGRkwy; arc=fail smtp.client-ip=52.101.52.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pehGRkwy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNNJOP+yuCh8Lsc1etDZR/5uwUiRDIHX3pqmceAeKoOVGE9w+VNMM2B0R8Q35tvbmd+0/CaC2HV9Vj6Xm2/2Sxdr67nUVMwnUKjnkjebNdYgmuVueLYv9D4Pf355iEG6QMJvaJCUnxrmsd1k3J/CoNGZeg42jqTDbkWOw1Kio45s/ZORovnvuCxJy8fOWqjUovAYx67nmknaJGMta2zEeXKpqFX42vcGYSCzBgQLGglOlgmJ3f0pJdrjcRbXgcagKw1b2/ehuEW9uXpeBmZ+c0TBuisDarZaff+40PVJWKmyQfkvFQXur9CYDCNR2JW57Hr5TMUIakcwMy30nuoQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRE63VhSY5+AMkoNbWBJsuQ8X1IgMGJGa7nVr/kLweI=;
 b=QHLypWYldm6rDsON8O2/nzHa2P75fNpoYqhUMvwyaMZsT/ZjMQdIOSQYUfP/fOZ/tq/yA4P5tTGdjlcaTsnfKj0j/z5AvB8Y5Ty93qmVJf1n7THrChH+l1UV2IB9sBSo9SZRP4ohZhM2iJP6rkx/Wd38VyTNN/pZh9EQLGZCwiXvalO/L8kutV8RZgHcFp0klKPYz78T4eKOr1B//GBpfe/oIh1Iu5MMsgYNBImVc/agrMOailgH47JuRczRtwdBlAyI4qWnaHVW4k3fUbO+LkBO2OsQqWFLYhqP7cD4M/+JXXdj/3Uyo9ZjrY4P4MecQDyFPnrQOWuT6gRXEpz3TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRE63VhSY5+AMkoNbWBJsuQ8X1IgMGJGa7nVr/kLweI=;
 b=pehGRkwyt7amneGIPdNbvn6YD60Fa2VTx8IlkT4Ga1JfirXpbXZTx12rVlIqEk/rIN2uhXxRPypMRjPYeuBQeUwMiobNJuYM6mBbtSbWXB3zAL5wKJWHVyuM5omG6vVyPawadHsG9fHjqgzj917I0cTb+fAFKJhlix9jGAJAR8mPaE1hC9BdSclutnusUZWVuD5FQx8ovRozWkPC5+MpvG/7retpCq1PiaraGi/BewrBgdodwdyUZ0z3Ld+D4U5D031TCq8eD80X2/68CYpwIDbfzOUEB1IdPFr0BIv2FQjrJiEVazylwUkaXm7k3iOOWnSISVg39ctRTdFq36Fraw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by LV2PR12MB6016.namprd12.prod.outlook.com (2603:10b6:408:14e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 18:27:58 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 18:27:58 +0000
Date: Fri, 3 Jul 2026 14:27:54 -0400
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
Subject: Re: [PATCH v6 12/23] virt: Introduce steal monitor driver
Message-ID: <akf_Kg3jaenNbb-g@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-13-sshegde@linux.ibm.com>
 <akf9cE22wvPeYNiM@yury>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akf9cE22wvPeYNiM@yury>
X-ClientProxiedBy: CY5PR22CA0051.namprd22.prod.outlook.com
 (2603:10b6:930:1d::27) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|LV2PR12MB6016:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b65c07-1109-4b05-baa9-08ded930ce7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10070799003|3023799007|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	yxz5s/6pSUW/7wC4l638uVxbl7qejpXTpAF4Dy52KaMVt0dWgywFtYfsXyrXFf570r9xXYTxBbYdJtEmtHAAKUqqODHHUvt+MzT9XcqikcgQLVnfXIkqG4R0qxs6vJ54m7bqR+0+g1bNrVnG3GWyPPbX2rMUIKzvPeXBtW4DjTwFrLfErtLLC0YtuvnRP/P8bpwHflMNmSfLziFqGkJKNQ/BhxAbfAODj+P9dddGawAvLzwYHaAgAoG4dNQdLVqznQpPrTemcXPSdqWO4HJu8wqSk3CEZvj03FvIlaaQ+mGxP/878FS877ZCIZN3Ltbll5F/BqlifJUP3x/q7uT6SQcQX7Yd4MPJ3QQKajkmTgNoun/QWBKSx8+CtXu2k/CYFXBFkfJBkrJ+ZZJu4HeH9usHNWMEv1wF8HC5MZOeqJAEJTiAQId/S47jji+nHoa9XvTJe3SJMat/v8qMWm+r/qy21wb1+SthIQq6FDewxLqV+q5dJ20FGU74fkX+JHULOe2ACUhbKCZhe17m3iZrIlJB7cabWiZpGR4XxrtZD+nX89hnoG78XcVPDXNSAfWXevmpUAhZiGCOaWCxh9WuXXQlTDiF9M3PaabxKXph0YwSOkDbh5kbPxlLy79uqSPoTKU/88wcSwFtMlfmf6SzWSOvsUO1Py1+MDlI4kRSp/0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10070799003)(3023799007)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HWD+85SrjJ83ZQigFVFfSs0/sSPME7wt3jx7CL9W0AuAiehOJoJHdnSlR2pA?=
 =?us-ascii?Q?8bXfbqfnQtVXsCZFf7QV0w7ClsrOCj/5TMM0w4jK4GacdffYnWElAY7Guq0e?=
 =?us-ascii?Q?o2deDsjCyTlDGwKkFpU/yUQNDjD4gNSnbVMrMb1s/wl1BTuwQRZU9RNZnixZ?=
 =?us-ascii?Q?T3d5sNHif+IWMPMG1UKCziHUSpwh76PKResm1giD83yng/3Zv7WDslQdDisX?=
 =?us-ascii?Q?Xy5o/t/wgKElpEJjbttYNw5hoc1gepXDKB6lEWnK7gbEoH7XteNtCmKCF2pG?=
 =?us-ascii?Q?yJjIqkd16Ml9Yv1bJzxexCZZY0gqPPAeDLHiwVcfFR+sujI4KsYG8FLnjvO3?=
 =?us-ascii?Q?1+YxANkyASWBkFdr8U9zrNHFBXbzGfjWCzgm9pv8BnZlOAt4i0L5Y2EMkpdg?=
 =?us-ascii?Q?iyaCS8BkUo4B6NyyNmcq8ISsQP2WHvy/0wmsh7P1etmre7HrCJTRSnGt6zmG?=
 =?us-ascii?Q?3wJCLJi+VCxID/Yu3yVJ4VhsyBCJ423nxBWqUulzLVW00LfgIFV+oTq/v0+s?=
 =?us-ascii?Q?IFTswQPS6GsQGBf2/HStRCyG08wWjhiS35is7W85a2kDpnjNgrmwfThZzk6X?=
 =?us-ascii?Q?fk2QOLIOcTv3q4v99KUfVL8O3GpWuZd20qTsGweZQI2Nc09gegc5TAVdaIyo?=
 =?us-ascii?Q?6N6qC276eIv3PZxC3xE5irK/jsHxzXi1sgK91FETgvwzzt61Ek4h88lUf1W7?=
 =?us-ascii?Q?Eq5iWx8oqbY4QGLRyJT0rqoOk1MDLRfub5EwGmlhnjymO7/Ykw+PLI3kLS4Z?=
 =?us-ascii?Q?ZRV8T+N1lpzvtKu8Ms+/BTzBVK2K+sigHAw5tgaFQgykewhncW4jLnIvfQHU?=
 =?us-ascii?Q?XebcRylg8Gv77DUdID4n5vgir4mR6et1VwhW85608Uhn/X9SA4ObJM3qnIWq?=
 =?us-ascii?Q?oL1HSzyLjN4XHpxFYqiujOKBGC2q5u/gvXOX6x9BV8xS6Cu0ceetzKJe0S5l?=
 =?us-ascii?Q?dRJMqoCBf8qT4QK1QoZQ4rLWoDSp+M/F3cfbb0VhBMTf85IfYxdGrlhr29vk?=
 =?us-ascii?Q?LWsW1Io7NjnKf4/vaO/rUAZvYbfJskOUO4wH0VVdeJINzdtSVbjVHDnV6G2L?=
 =?us-ascii?Q?4e0OQ4q0CtC+dPeRbL3A26l4ePKpWceGuGtzS5PwSkw88dfRpgVRsC4II+zt?=
 =?us-ascii?Q?PY+Pgnzo5Ae03GhoWop7IMFonpChz3i8nEBaFNiDg3/W3WyuAIXotujlRpvG?=
 =?us-ascii?Q?ORQ0xaMIzcqvI6zpBURnjjSaN5/4ek9iKAF4VRyqcjdx3f52jpWR2KN6qi71?=
 =?us-ascii?Q?GK7TJA6l6KraGaibIdQ/xI16FkwAhHkec4iOuzD/+ma5g4gLRShPC5V8Fuib?=
 =?us-ascii?Q?baKNSA7Ufmpx2zQzqGZouVyndrjZyH5E02avRrxg0GdERaMUBwRP0dIrR+jY?=
 =?us-ascii?Q?MDYhnTDUkFMkFdy+VneMYywnoKyrU+bgy32I4ZdUxJTc4fYaaqWkzRGJSEtO?=
 =?us-ascii?Q?5xXMDfI+9gh837wbFhzILleNX4OKsq/e5hNCIZ9m5rum7GMvTUuZnUxfK2+n?=
 =?us-ascii?Q?lLQPhFU/KORvSjsXw0nd4mNw+oDljrYOl5d+71AmJRXZ8Z4J0gdtuv9NsRFY?=
 =?us-ascii?Q?ojQ7nm8u+tetDjn0olBZFgTJDzHEv/AVYBvjKsz223KVLZ5pC1KKfArSX56z?=
 =?us-ascii?Q?xRlbxeZ/sJWjV01TPUtEWtHi9xV617HbJiujOeB+7gFE3MgHwPZff/Z0egNV?=
 =?us-ascii?Q?LAqDyQyF4mBfzoovA4KF27X3mey8KyvMBHg1qTEC0ScEf8YM5i5Q58j0f7JX?=
 =?us-ascii?Q?xPFVCjDkgeVrheqbh7NOe+0z7+eGG9xgmZtCdvd2K6SNsDUBa1WI+17rVVpE?=
X-MS-Exchange-AntiSpam-MessageData-1: sCTeDdVgp5IhvA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b65c07-1109-4b05-baa9-08ded930ce7d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 18:27:58.0844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OLOWXIs/3BVtJaER+d+kUmiExOTiXRh1FpWjusbMX62ZgYKOCeUxLYGMhR3vcgz88J9QDgPEXByzxFj7jS0ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6016

On Fri, Jul 03, 2026 at 02:20:32PM -0400, Yury Norov wrote:
> On Wed, Jul 01, 2026 at 07:46:43PM +0530, Shrikanth Hegde wrote:
> > Introduce a new driver in virt named steal_monitor. This driver
> > will compute the steal time and drive the policy decisions of preferred
> > CPU state.
> > 
> > More on it can be found in the Documentation/driver-api/steal-monitor.rst
> > Introduce the skeleton code first.
> > 
> > There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
> > - If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
> >   loaded by default.

What if I've got my own monitor, and don't need this one? Please add a
way to not compile it, even if CONFIG_PREFERRED_CPU is enabled.

> > - If CONFIG_PREFERRED_CPU=n, module isn't compiled.
> > 
> > File layout of the driver is designed with having arch specific
> > files in the future.
> > 
> > - sm_core.c - contains main driver code. This includes the periodic
> >   work function and take action on steal time.
> > - defaults.c - contains the default implementation defined with __weak
> >   symbols.
> > - sm_core.h - header file which includes data structure.
> > 
> > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> 
> You've split the driver code into 12 patches. It makes it impossible
> to review the driver as a whole. Please make it less granular. 2 or 3
> patches for the new driver is more than enough, I think.
> 
> > ---
> >  drivers/virt/Makefile                |  1 +
> >  drivers/virt/steal_monitor/Makefile  | 14 ++++++++++++
> >  drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
> >  drivers/virt/steal_monitor/sm_core.h | 11 ++++++++++
> >  4 files changed, 59 insertions(+)
> >  create mode 100644 drivers/virt/steal_monitor/Makefile
> >  create mode 100644 drivers/virt/steal_monitor/sm_core.c
> >  create mode 100644 drivers/virt/steal_monitor/sm_core.h
> > 
> > diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> > index f29901bd7820..aff715cea42d 100644
> > --- a/drivers/virt/Makefile
> > +++ b/drivers/virt/Makefile
> > @@ -9,4 +9,5 @@ obj-y				+= vboxguest/
> >  
> >  obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
> >  obj-$(CONFIG_ACRN_HSM)		+= acrn/
> > +obj-$(CONFIG_PREFERRED_CPU)	+= steal_monitor/
> >  obj-y				+= coco/
> > diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
> > new file mode 100644
> > index 000000000000..24cee55342ce
> > --- /dev/null
> > +++ b/drivers/virt/steal_monitor/Makefile
> > @@ -0,0 +1,14 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Steal time monitor to alter preferred CPU state.
> > +#
> > +# Arch can implement strong function definitions and override the
> > +# default by adding them in arch specific file. It must ensure
> > +# that preferred is always subset of active.
> > +#
> > +# It is always compiled as module if CONFIG_PREFERRED_CPU=y
> > +# One has to enable the module.
> 
> Why?
> 
> > +#
> > +obj-$(subst y,m,$(CONFIG_PREFERRED_CPU)) += steal_monitor.o
> > +
> > +steal_monitor-y := sm_core.o
> > diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> > new file mode 100644
> > index 000000000000..e320559c6576
> > --- /dev/null
> > +++ b/drivers/virt/steal_monitor/sm_core.c
> > @@ -0,0 +1,33 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Steal time Monitor.
> > + *
> > + * Periodically compute steal time. Based on the thresholds either
> > + * reduce/increase the preferred CPUs which can be made use
> > + * by the workload to avoid vCPU preemption to an extent possible.
> > + *
> > + * Available as module with CONFIG_PREFERRED_CPU=y
> > + *
> > + * Copyright (C) 2026 IBM
> > + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
> > + */
> > +
> > +#include "sm_core.h"
> > +
> > +static int __init steal_monitor_init(void)
> > +{
> > +	pr_info("steal_monitor is enabled\n");
> > +	return 0;
> > +}
> > +
> > +static void __exit steal_monitor_exit(void)
> > +{
> > +	pr_info("steal_monitor is disabled\n");
> > +}
> > +
> > +module_init(steal_monitor_init);
> > +module_exit(steal_monitor_exit);
> > +
> > +MODULE_LICENSE("GPL");
> > +MODULE_AUTHOR("IBM Corporation");
> > +MODULE_DESCRIPTION("Virtualization Steal Time Monitor");
> > diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> > new file mode 100644
> > index 000000000000..684a258526e1
> > --- /dev/null
> > +++ b/drivers/virt/steal_monitor/sm_core.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __VIRT_STEAL_CORE_H
> > +#define __VIRT_STEAL_CORE_H
> > +
> > +#include <linux/types.h>
> > +
> > +#include <linux/module.h>
> > +#include <linux/kernel.h>
> > +#include <linux/init.h>
> > +
> > +#endif /* __VIRT_STEAL_CORE_H */
> > -- 
> > 2.47.3
