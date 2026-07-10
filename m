Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010022.outbound.protection.outlook.com [52.101.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A82E737D;
	Fri, 10 Jul 2026 23:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724985; cv=fail; b=DbpxhONt9U9O1jFjKCy4i2nRWGY83ZvQOUVA9Sm8hjZW7aaOT8aUTq5C4vb46tyvWxQfuqa+QpUJNWUtvqgwH0RKIFfOwW9QNjMEA4dSCbrT2ImXMeokSMuJ1eFX11nMLsWzYw/7r3ODmUNb7PgoHZ1S6kN9wu+Jbew8/EbMaJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724985; c=relaxed/simple;
	bh=qsxG4gyF9YB173Wn2ubnTVmTFmWK7clN7pePE9HP4xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dBmedsVoejEtcm6J6QYK9AWBZjuxhH56+QAqizXGcIxKGYuphq22UczzY3gJl2q4X36XMgfD47dM+aVAS67L/geMKscW5YFCMTQZ3HFdd5MFiA3ey8NOLz4uizdblAhKxHzMYLQLerOfra59gjdr1Saa8vY8WyxbjyuIGEOf4co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Uv96y4kn; arc=fail smtp.client-ip=52.101.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uv96y4kn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SR07S3bxw9X3I/x1BI6w3XP8O/m68QoGBd7tbeD0cz6QAB2qUUXSSbSY72J/LdJ6BXvlb0+X0EUUBWvPRuulnwj8HPhDN6ney+D5qCVndvqBfqAnS8VWGbGRUEtFlvlomkjXTY7xW6JLgxWkWu0+YZi0nhyUnZSHsP59rzRChMfqv+L//bcSZrGxWyEH1zlyEIWxcNHgPybgCCF5lRzZyNq4NQdIqLGIz1dWs/fa58gVEHUxxcA0h0M8Aik2nX+UhvSoRmbPrTMsR3ySme5GoOS2U78jp6v2D/xws89rJF6QfASWgcmB67VU8tP2ol0zNbA9uWSkLOH47N+qiqwnkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzkOfAz3bdyuD6tD/aw1ix6HAmFuqOEGHwHr42sC2RE=;
 b=JdSdRW7ZxoTZ7/o0Pv2Wk+60IbK7OER0VmbxB3MYZUet8UGxCngMtu0YYrkTWw2+iI1yXQHecstKqA7Eu4QG4m7r3HAMR8aum8ntvbvINcDIXxQbx1MlFpVRY7PutTB6mYI2Ums3VR70+ySbhsDLnD7TF0CbWBG8o3s22v8pY2XwcmOjCJzxpOlIO4V3ylnKe4PqwL7lwAWRIYeSXUFiEDYxMK+6GYNty7HgeTWtwrAEoO4Ii7G9vzDxyK0sY/ypVDrW602LECpRzUvUZq+eVA9VDYeMToJtjkhtgfRHxjLUCklGnwfqvhTFSpfswbcM+JLdURD2YHKn2sg5RAKkTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzkOfAz3bdyuD6tD/aw1ix6HAmFuqOEGHwHr42sC2RE=;
 b=Uv96y4knwL8KAxD/KWRxfbDhbMlCRWE1CBH/lBqcBXky8OVWdFpqXgcBhVwOqtADeX7WknOFCVJ4tkw2Iuz5nEtg3+OxITnOqvlBeoAiY9Ul6CJusolU2tyBE63KinTTJZ1qjcpI1ewjToOF8E/ETwp1l7WuIPMyoee6EdFB8d1xHGi5qEH+mmgGUUMBc6IFXENGWVUyzcYLT7fuJDQF+CJmny+TfgjnM/b1t7RMQgk0/SJshXjnVl19vmeCMJF4QR+l51sugOzlz+0KkXmRPM+enH1SkLx7joF1GkFMjQEDswb9l+WhVeIaiXu9b16q3e2XosQ+8G+A6L015r/MPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 10 Jul
 2026 23:09:38 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 23:09:38 +0000
Date: Fri, 10 Jul 2026 19:09:35 -0400
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
Message-ID: <alF7r_dWfUHKEofx@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-4-sshegde@linux.ibm.com>
 <alESuG6IYZCRESJY@yury>
 <adc1793e-694f-4531-ae61-b6b3eef568c5@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adc1793e-694f-4531-ae61-b6b3eef568c5@linux.ibm.com>
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e06898-c3b0-4972-46e6-08deded8507e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|6133799003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	SJYo2TeIG3vnRJXndtAgUH2x2aUQAbs1KgILMqmm5/IdXxgYwUheKa1P9mol03LXrp/TRCaZukvhAqnU3ZzWMhLO28m17FngErAMzH1Q7tC26grEmQu4ROHQqzVYrvQ/IPhAT4CRO2aHCAgQma/2cb1IMCtJkqMa8R7d4+kV44cwp00/W0n+aye3azn6muWhBtlDnA3Y7WSKn8MShp7bfF1Cgh4yrS7MsYWWL+Hli4UCH+0z/lX/ChGerAaSIIFWd1Lby+s3IGPtLU9hyyVnE45dfOcMt1gMV0HxEisqwPjb+YWZCSYapJ5SBu2/Ai6D3XYT7obwLtyl9NOCRMyadOpi2jTby9iXB/YQo+4U3gDx9tYy1lzGXNTOirDI6fxSkowd2EwHh1djvXqogELcxYokqPoj99+xD6R4Or9wdkYN9JbzSLZfpY9eOMHMVxI/IcA7v9WJIKXFfpcyL8CXJXQinbOhjL5HqlsCk8A+8eZMETSR4cZlc/Goio97PxyDZyvzeYq6ytobUilL2aNA79+b0BvsClIwYFGZEBN913XuXr+E9Y4diP3IGHXOtCkusnUshxFKzZGcItElGXcQuinvKyX1AbK/MJZPhU9o6zEP2l3yCf0t1m1kT6xlNZID85XsicHQxzL9Fj80YaPtsb+yU8YOo9gYo0LJ15ZL098=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eh6K1Qvw5vdZmRAeuoyzJBz9WI2lxpQFSn6vWkNl5UlbP3qfNrn9qnfZSkQU?=
 =?us-ascii?Q?UUWdhGviYKJRqZ1A/FUnB20R6GhjNDO5ThV92ACOYmz35Hi41zDzQ6bJ+I1k?=
 =?us-ascii?Q?hcNgPAJia9TVoMpiqFtiPDRB1GhNjwpScAtKWhD9iThzvv12r/8QIY/oEdZ8?=
 =?us-ascii?Q?GQbzigf3j07SB6lf7HXeV+3SGBa2sPLDswRoQBDk+f1QBaucFII26mtyPGg1?=
 =?us-ascii?Q?SsJeWwwAw5VMJjnOimbGPk1fxWTtQHp1vj7sXakL35j7uoDx7JcY7e08B6/h?=
 =?us-ascii?Q?4iQrp87+Lcp19HqkofRdrOREWqdU4m2JHmwazc9KjZsqGzylRc9Tm/QZNuhS?=
 =?us-ascii?Q?cPbesCU+A27XLj9gcJ3wtw+oqcBdMv4pODkwxqD7Rv6NGAMzJo+t+0JRcNFm?=
 =?us-ascii?Q?U3dedrwObFUYDYwhC62Wgic72XqI7ceoIAASG7Z69T47ylJAte5JAFukdAew?=
 =?us-ascii?Q?2pojfQUdfflGTYRPJy5TvUwFGpsnEQALrd54AvoPSJhr9Gsra1kF5TtsgCL8?=
 =?us-ascii?Q?9+9sWuKg91KQubiycYVVWQjIOkO26JrW3KJufoh+eyL9nNHzT4PrB7YJk5ko?=
 =?us-ascii?Q?4i19mG6WTagLVQinHPZpuC57P8XC5F3RXuRIE5T9sk8b7E74pDHbiHXhNZft?=
 =?us-ascii?Q?IdzJ10jgNEJKUDibaQl/R9j1omBxsJBP7inlmlJJQCDi8w1LZQprK2pkpegJ?=
 =?us-ascii?Q?uNppleQy3AqwCbCt07Tsza1BTmn1jNXIMlvAWpa8Nf3qHKiHJzy07mje8mif?=
 =?us-ascii?Q?wufBuC2umKmozduFZPgk6J8DMlfQAcsz9QhDInou6PzaJ6ig6xQdfDbYauCM?=
 =?us-ascii?Q?hNJi7AliTFR6WvKwYUTqRofJ/0skLhnD7jIysIIMR0Cq3VcQfLxFjvuJVgRX?=
 =?us-ascii?Q?Q4pMU+oRBmKKQ3k2AFInv7cbx4xYpBPjjHe2qKlvqdD0zvxeTaI3KrAFe5G3?=
 =?us-ascii?Q?ucFnqbBHsZtZzTML3YToROFaMM99vA5ShSQLyKNPy1f4yvTug/qgn/G4F5lg?=
 =?us-ascii?Q?pWF3tDTdl2S5/30DHAgZ7OmLZVTTrk1bH7y26LOCv3jcHU+we4tFJLIxWvZO?=
 =?us-ascii?Q?XqRl1nYiALBH2fYw306vjc16Ao/DJzFBZOgCe31qIp1N7rKDbDFoDjwv/bAT?=
 =?us-ascii?Q?EYNIYGKyY8Kcld8xK90aPPj+emTulWqxL/L1bTudMmty8y6aT0TEXVuTUHiI?=
 =?us-ascii?Q?6oW2gOSOBVwKRMDyLM+3tDmKIRRp9CLtwG20rzLQMzC0whl7zD0GNZFL5WNg?=
 =?us-ascii?Q?NXZtS6r/arVjpH+obGQTbXT9t2f8C0hHc6+VHZQaqGdAjidF1uxyT7DUH7yB?=
 =?us-ascii?Q?WXUWs92n5rrxXNQiKEhb8YLyt6d/XDRQ4HLwRi2tWgS4hflijh5+vQVinhif?=
 =?us-ascii?Q?9yVUPwtmOf5G21pnDCgIw7fJAoS8zcUYmPFgxaKzMTYRAIs7JXZqPQVYy052?=
 =?us-ascii?Q?QWqSle8/hpbZkmYwiYYNgY4hkTp5/plmPk8JMCxhL5u2YG6HTn4QclLdbI3N?=
 =?us-ascii?Q?aCErV0SMSLpkcdRtzPbKkwKXmxSShYzicdJi1pVPRea5Ej9p+BsXk7m9k72O?=
 =?us-ascii?Q?xb8DktG2b3EMPhagl00Bhj/+MQ2Nys1IG81zeRVKiwmPgTBAPcV+6OhI+F1N?=
 =?us-ascii?Q?JP9neBSZRsRDOFRF4yzBvP1ChRHJ+JoRrdp9pOKn89Vu4ydE9Y3Tp01TBRHZ?=
 =?us-ascii?Q?c5tvNf8MChyb3PboH58uuwdc9kwyFEXKvNsX/VCLBIRQc50Q+JD6xUT7Ywri?=
 =?us-ascii?Q?xitfcVB+1A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e06898-c3b0-4972-46e6-08deded8507e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:09:37.9765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jx+rRtYsbDWB0tunRLtZ0UyfV1qGgrc+Ag4YR8H7PnjaNFxPeV5wIYErsYwti7pPE7aW3MlFjdUMIZB4e2bWog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424

On Fri, Jul 10, 2026 at 10:30:43PM +0530, Shrikanth Hegde wrote:
> Hi Yury, thanks for taking a look.
> 
> On 7/10/26 9:11 PM, Yury Norov wrote:
> > On Fri, Jul 10, 2026 at 03:26:39AM +0530, Shrikanth Hegde wrote:
> > > Add "preferred" file in /sys/devices/system/cpu
> > > 
> > > This offers
> > > - User can quickly check which CPUs are marked as preferred at this
> > >    moment.
> > > - Userspace algorithms irqbalance could use this mask to send irq into
> > >    preferred CPUs.
> > > 
> > > For example:
> > > cat /sys/devices/system/cpu/online
> > > 0-719
> > > cat /sys/devices/system/cpu/preferred
> > > 0-599        <<< Implies 0-599 are preferred for workloads and 600-719
> > >                   should be avoided at this moment.
> > > 
> > > cat /sys/devices/system/cpu/preferred
> > > 0-719        <<< All CPUs are usable. There is no preference.
> > > 
> > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > ---
> > >   Documentation/ABI/testing/sysfs-devices-system-cpu | 11 +++++++++++
> > >   drivers/base/cpu.c                                 |  8 ++++++++
> > >   2 files changed, 19 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> > > index 82d10d556cc8..ac1dbb209cc7 100644
> > > --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> > > +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> > > @@ -806,3 +806,14 @@ Date:		Nov 2022
> > >   Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> > >   Description:
> > >   		(RO) the list of CPUs that can be brought online.
> > > +
> > > +What:		/sys/devices/system/cpu/preferred
> > > +Date:		July 2026
> > > +Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
> > > +Description:
> > > +		(RO) the list of preferred CPUs at this moment.
> > > +		These are the only CPUs meant to be used at the moment.
> > > +		Using CPU outside of the list could lead to more
> > > +		contention of underlying physical CPU resource. Dynamically
> > > +		changes based on steal time. With CONFIG_PREFERRED_CPU=n it
> > > +		is same as active CPUs. See sched-arch.rst for more details.
> > 
> > This should mention that it's about paravirtualization.
> 
> Ok. I will rephrase it.
> 
> > 
> > > diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
> > > index 19d288a3c80c..4ac990efee7c 100644
> > > --- a/drivers/base/cpu.c
> > > +++ b/drivers/base/cpu.c
> > > @@ -391,6 +391,13 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
> > >   }
> > >   #endif
> > > +static ssize_t preferred_show(struct device *dev,
> > > +			      struct device_attribute *attr, char *buf)
> > > +{
> > > +	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_preferred_mask));
> > > +}
> > > +static DEVICE_ATTR_RO(preferred);
> > > +
> > >   const struct bus_type cpu_subsys = {
> > >   	.name = "cpu",
> > >   	.dev_name = "cpu",
> > > @@ -532,6 +539,7 @@ static struct attribute *cpu_root_attrs[] = {
> > >   #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
> > >   	&dev_attr_modalias.attr,
> > >   #endif
> > > +	&dev_attr_preferred.attr,
> > 
> >   #ifdef CONFIG_PREFERRED_CPUS ?
> 
> Not needed no? It will print active CPUs.

If I didn't enable preferred CPUs, I'll be pretty surprised having
them in my statistics.
