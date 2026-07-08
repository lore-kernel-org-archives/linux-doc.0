Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A63AE6E9;
	Wed,  8 Jul 2026 20:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540805; cv=fail; b=bVQScMtFUVm5u+5xmogq5UgtUJ2lpjC3FFxaFOTuXYOvW1QFovkK21glBefp6vZsy4cL7+g53ztNdYY3iEj094G0GJER0rZyrpQN/xdLM/Xzi5v0KWqvCJFydL/XOQvrFSgD4i0v1yMzwIFmZJUrkQ/Yw3QeWlCkr0ONlk2QZ78=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540805; c=relaxed/simple;
	bh=LCkq6zq0BAlgpVApGALT6v/LnhZ6b2obWtlpOJpyRy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vBDVBrO+xb88fsiMxlNKxORQbEOuS0Yyn/dqiyDByqDsKbbzeDItBpJ87gdtk7ItN0r1rTlBwUebxQ4PfatPFm6IfFVGEGhBiIB6KSdnTe+WMYM8avkNNTLJNfc+OK3se++YudAgjHm9grvYoPxF1899u7u0gmjDTqrRn49FJAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fkk/wuWj reason="signature verification failed"; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fkk/wuWj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pa0Gq/X6znOkLij6TzL3SFPZTWTsgluy/4ILSz42Vw1q5ufuOAO23YrULb3eslqfZjcaFBZCeecL0cyrkB86WVd784bt3DestceH6f6D2vN3/+jB7Xy2+O6A6OKjXjljVo1aHW3OJt9deZDNU/xYsXR1vkJc6fvsAxAvrwbn+0cQj0Bjh6o98JZwGUacmn4kSKXtf5SV2D8fwjVOTobIZKSPGbpvM0U/0dZ1Jia9eMDHvT/RkuFRoIfx5Gq35cZOQ7FAjESUzocbx3BkeW9d0oioTrJdw+I0QFrh2PMBOrTgWUQzvGR+ePnSKYmNSZGDgqyBdAc2zdie7tm2ObPUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vDTY+aVJFE6oEXoiQ7c6xYzNLuRz3KLmE0aIVHPcEE=;
 b=QpdH4vWeqywYzOxmfP+pJDw4pz5o+a7eVd+7F5Ywp0sQdYg6nIhfCmoQvlwA8jaeqQ7OBTp6D0aedSD/kB3AjPQT+pzlste20hdeMp4sw1Y+1L0d5K5ORBhYBhbwhIIwbPOmr3zeyQnGCay4mCE/Chx4kfxAz1KydrF8VU2JiJWnYAyJeDaHeUxOEPEpfRStovPTXVvOF5V5GxXCe3R0ig4QkB6i9DOH11hQVy5IR0G5e9/dlwh6SsBlQ/OCdzd2aUph+1PHRk45lPfXYzfAPd1WVzYp1MsoY4/HqjR6jPzdTridTpyyyARyKaI/M8foMy0Y6C0WR1oZnExtQJp3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vDTY+aVJFE6oEXoiQ7c6xYzNLuRz3KLmE0aIVHPcEE=;
 b=fkk/wuWjq3GFTpHt3WLmiySEY4V+OTH++gZl5YsOaR28r3OZv/Kx3hvQ9oDbN4hyot8B1fsV4+Sr6gz2jA/pJ0xDwSfpsLpi/acx4qt1ZGLn5ekMM1ZKFtTLdpyg+Io94t6N/QV64lOhy324gda5tuMMJmOLZEJ5uiFgzZwSPVCE8zh42WeYzmVS8TR6wC13bld+k4ULNJznfHJPQQVZ6io/iwIxlrn5wgl9hSUCMgTPHVmQmWw7atOXyK6KUaizbGSgkPtV+wABnfUVLI6uIMfKrRqh54m8qF6aN0UGd5F+ffEUJcrCgxVpsSsdeEePkf2k/vynMznguYVTt0s+iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS4PR12MB9585.namprd12.prod.outlook.com (2603:10b6:8:27e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:59:57 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 19:59:56 +0000
Date: Wed, 8 Jul 2026 15:59:55 -0400
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
Message-ID: <ak6sO7eAfC-AWEWe@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-21-sshegde@linux.ibm.com>
 <akwRJnQklymOjNTv@yury>
 <6548b668-d3e1-42dd-be9f-2fe3193874a1@linux.ibm.com>
 <be544e00-8cf7-4a09-8b13-2d8b5a98c2ce@linux.ibm.com>
 <ak53I9beUB-2plNQ@yury>
 <7eea685e-e5ab-4487-bafb-3131969e5acd@linux.ibm.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eea685e-e5ab-4487-bafb-3131969e5acd@linux.ibm.com>
X-ClientProxiedBy: MN2PR01CA0063.prod.exchangelabs.com (2603:10b6:208:23f::32)
 To LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS4PR12MB9585:EE_
X-MS-Office365-Filtering-Correlation-Id: 6facc0f7-13f4-4e4d-6612-08dedd2b7c01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|3023799007|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	5duXPUS6J2cn6H570MuS2VnbHFLyWk23U4Y0X1yanW+E5CX1/+yPcgcYqz7S1w5AjqumbSa9s5yQrFMoqYP/UIRLfceuSPDKVUAInmmsT4X1CaGMW5g5BB0NiJ9O9uEW4BU5oYMCfuS8wUKOg7nZmkzzE8RxUTXr+sVQ7gQ4tFk1Up2RJRk68J2VEqWdHYjWaKGYfwEPOy1lLMTy4bYFhZevgmlLE3l9OZbRrEB5ekl+IVnWv1FO5Uq3Ijyb9nw7iN7/Xq27MApJliD/FNZRQNwkHLWPibQxRWhjkQZCGXVgGbd7Wfcu8HJMP4Vl67vd5H8Yruusme51PMGCgEjXQRKIjH7Q6PgKeWqlj+d46schYjcQ/hKCV90ewUSQpztfN77PzUo5Vi+Sax+EWpGM6HPZi26JRwkgHvL/WrUhTuXQiz0Cod0jcckE/ZKkVt6nLAv2UvK7uBWt35iF8j1BK9bizQmvxPEGfPKHKF7SkeefKQtF3N0oPOtw5xPLVA7V68P7O4lf07rwyp2RNtlDHlfc4r0ntPETwQUQApjiDTD5D7RwHMr10xJo8uh/sBRCu/D+uGeBEGSg9+J+krVRNBHP4nvoBetcVBCHZjXrOFOoZZlScoAhPhHeozbX60NM1f2FvPiO7UTh5GfHdsBgwZFMRBtgTOQty8N42UjUhGs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(3023799007)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DLgOcIA9LKzDVsJf2vOGjlkH1mqwanh9Q6E5k4k6kv9oFlaV5T1mxmy8f/?=
 =?iso-8859-1?Q?3c2oBVoD+aIlrJ27MjWdpYNf/Hjv1wgMqQXxQStvbntsZ793wkI4oEhRJg?=
 =?iso-8859-1?Q?Oqp9q2yV+gw7tsBozdx4erWn3OOEdfsFr1URFdIU7xkoOHJHXYG0VP/k0N?=
 =?iso-8859-1?Q?xeztO3sLEHguhXa48PZmBpE/D2VI4EwuIl7A4zLFguQqO5JSMONFUiJEnE?=
 =?iso-8859-1?Q?njosp9uMRRi1Ik21SRXqG7+b9laPhcco/Mg1H0u79JM4SnRXR8zhmNjL29?=
 =?iso-8859-1?Q?Vs3V/RK8RzTadbnpz5g9tEO31wzIWiDETYZa7ewcQK1+kq8RanUyfTtOHX?=
 =?iso-8859-1?Q?kcYeHqvSSMSmhkhG4pLV6pyeJPxI3AXxwHqdiJMVGVpAmP1pYyuKqOxVwP?=
 =?iso-8859-1?Q?Pv+n2g7Nrd+URCHIbczZN9miYMhJIbpCYy0fzpGSWFWRUmYB6f57FnmdQm?=
 =?iso-8859-1?Q?lJizpSc3b6nlMhz4oGtCv+iWe/KhwfRTjHwy1M7bMhxw70bLKT0voZKjSz?=
 =?iso-8859-1?Q?XoomgIcqp7KIE0jCEjHKSLxryCPQVCKSMbph9DDmCjIKEa2VyiwTOQRY9b?=
 =?iso-8859-1?Q?YzBdZzopJnUL5ItgIjOrs0ZTzpiyJg2E3fgjhL50cVTLmjGTZCiTPYQkeT?=
 =?iso-8859-1?Q?S+f2Szuedc28jmOJugspJc1R02P9GVkl/MP0dYtXWW6daV4xfJy2a8o1eT?=
 =?iso-8859-1?Q?zHbI1dImC/SkuUVOBRb62/afWdCJlNPe8dq/j8evgiTMB8oYoNjojBEICZ?=
 =?iso-8859-1?Q?EaBLXFwX6g6Hv4TErWBw/of0l18zuolC9Xx4VJkacDReXbfo/Jx8R4GlZZ?=
 =?iso-8859-1?Q?v9SMVHn89MOE2vkgXx+2pj6KrPjCOzBGyfW+vhWQgvH0Zb8t6cot3oheG/?=
 =?iso-8859-1?Q?x+TZgRfkr8CxaL9hdglIK+DUfSUelfMEjJBAGXQjBYsJqOT4AgDBSRZTrU?=
 =?iso-8859-1?Q?RRLp6USyO08UXXZcL61+vP55QcCEcDLZJTYVMEUZjvn/4IFK+wrmMdfrFw?=
 =?iso-8859-1?Q?sCOtLdwQbDize5GIr+qjwnj3bxrJFbfYzHYGMQ6l/tMPyXuT64bs+dlzTn?=
 =?iso-8859-1?Q?X4pCaUSLw8UCi6vT7S6D9I2eluoUjMw3WoHMbKolyhHvdlQo56Qbm1Gvei?=
 =?iso-8859-1?Q?EU6oG4BcyPeQ1HcXud3jNLhte2I7upoc2ywVcgqLsQ0GvVjKFeKoNz85wW?=
 =?iso-8859-1?Q?6H0rPGB5bqHRxlqx5S42lN51XbGDFHb41Cjb0OhjdCJS31Mab+nXmAro7A?=
 =?iso-8859-1?Q?JxGGT8T7IkBYNFEDjzSA2uHBe6E+qzGp7c8asvUlanBDXjhgIgQFMIRaH6?=
 =?iso-8859-1?Q?zpCFlFwOYgIKcLC30g8m/p1yneVed+BkpUL+TY8eZZa+ve9mgjw9VUqAuZ?=
 =?iso-8859-1?Q?FvLCgo7OX46g+Cmf+FaybfC01w2aW5GtumTWpOxxBdSp69lZzF8wM2z9Xg?=
 =?iso-8859-1?Q?X0CRDyJY9DawzS9oCYTZAn02ridma3gpr/zJBEkFRHD67HcNE1+zN1QWdl?=
 =?iso-8859-1?Q?istOb/De5kbgDVDEjZD2gKbD5WJDtdLgbdOwFuk6KZgrQizyWW+lM0FCwC?=
 =?iso-8859-1?Q?Y+1qaJwMisNAl1XqoOHq80oTGRH5Uyxj5v5M7g028HV9bT5C2NQfAi1Zkt?=
 =?iso-8859-1?Q?GrjxOfXm0HSoeCbWIEujz4GaazgumS9a5XykT5k6fBCK7sSdLAaLx/KdZB?=
 =?iso-8859-1?Q?jHyRykxwlP3JoaYO7dxbQn5w3DBCQR1+vGolppo/m39x1CatUrHBXOptRo?=
 =?iso-8859-1?Q?1Ze7zKTfiUlPUI+YgAevpu7xu1q0mYcm/yxN7Ul1ZQsST2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6facc0f7-13f4-4e4d-6612-08dedd2b7c01
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:59:56.9167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeT1EnHC99ct50v7kVdS75FCka4BV2BAUr0cgCEnCaFeceYGWrFJcEjMatEV0JvjEYar1dfIQEvpg7gARhc6Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9585

On Wed, Jul 08, 2026 at 10:25:09PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 7/8/26 9:43 PM, Yury Norov wrote:
> > On Wed, Jul 08, 2026 at 04:03:18PM +0530, Shrikanth Hegde wrote:
> > > 
> > > 
> > > On 7/7/26 12:46 PM, Shrikanth Hegde wrote:
> > > > 
> > > > 
> > > > On 7/7/26 2:03 AM, Yury Norov wrote:
> > > > > On Wed, Jul 01, 2026 at 07:46:51PM +0530, Shrikanth Hegde wrote:
> > > > > > This is the steal_monitor core functionality done in periodic work
> > > > > > 
> > > > > > - Calculate the steal_ratio. It is multiplied by 100 to consider the
> > > > > >     fractional values of steal time. I.e 10 means 0.1% steal time.
> > > > > > - If steal value is higher than high threshold, call the method
> > > > > > to reduce
> > > > > >     the preferred CPUs.
> > > > > > - If steal value is lower or equal to low threshold, call the method to
> > > > > >     increase the preferred CPUs.
> > > > > > - If the steal value is in between, no action is taken.
> > > > > > - Save the values for next delta calculations.
> > > > > > 
> > > > > > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > > > > > ---
> > > > > > v5->v6:
> > > > > > - Address u64 overflow concerns.
> > > > > > 
> > > > > >    drivers/virt/steal_monitor/sm_core.c | 33 ++++++++++++++++++++++++++++
> > > > > >    1 file changed, 33 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/virt/steal_monitor/sm_core.c
> > > > > > b/drivers/virt/ steal_monitor/sm_core.c
> > > > > > index b499faa61010..7b7435f79b85 100644
> > > > > > --- a/drivers/virt/steal_monitor/sm_core.c
> > > > > > +++ b/drivers/virt/steal_monitor/sm_core.c
> > > > > > @@ -34,6 +34,37 @@ MODULE_PARM_DESC(low_threshold,
> > > > > >    static void compute_preferred_cpus_work(struct work_struct *work)
> > > > > >    {
> > > > > > +    u64 curr_steal, delta_steal, delta_ns, steal_ratio;
> > > > > > +    ktime_t now;
> > > > > > +
> > > > > > +    curr_steal = get_system_steal_time();
> > > > > > +    now = ktime_get();
> > > > > > +
> > > > > > +    /* get the deltas */
> > > > > > +    delta_steal = curr_steal > sm_core_ctx.prev_steal ?
> > > > > > +              curr_steal - sm_core_ctx.prev_steal : 0;
> > > > > > +    delta_ns = max_t(u64, ktime_to_ns(ktime_sub(now,
> > > > > > sm_core_ctx.prev_time)), 1);
> > > > > 
> > > > > The below return on '!delta_ns' makes this max(...) useless, right?
> > > > > Regardless, if the time between 2 measures is less then 1ns, I
> > > > > believe, the whole measure is not trustworthy
> > > > > 
> > > > 
> > > > Seeing sashiko comment on divide by zero, i forgot I had max above there :(
> > > > 
> > > > > > +
> > > > > > +    /* Update for next calculation */
> > > > > > +    sm_core_ctx.prev_steal = curr_steal;
> > > > > > +    sm_core_ctx.prev_time = now;
> > > > > 
> > > > > So below return should go prior to this update, because 'now' is actually
> > > > > the same as 'prev_time', right?
> > > > > 
> > > > > I don't understand why 'now' can be so close to prev_time, because
> > > > > you've scheduled this callback on the regular interval. But if that's
> > > > > possible, can you explain that and do like this at the very beginning
> > > > > of the function:
> > > > > 
> > > 
> > > I don't think it is possible.
> > > 
> > > > >           now = ktime_get();
> > > > >           if (unlikely(now < sm_core_ctx.prev_time +
> > > > > sm_core_ctx.interval / 2)) {
> > > > >                   pr_warn(...);
> > > > >                   return;
> > > > >           }
> > > > 
> > > > Pretty much, just have to requeue the work.
> > > > 
> > > > > 
> > > > > And if it's a never-happen condition, just use WARN_ON().
> > > > > 
> > > 
> > > I have decided keep just max_t() to ensure no divide by zero happens.
> > > 
> > > Issue with putting sm_core_ctx.interval_ms check is that, one may edit
> > > it while the work is queued, but not yet called. It would print wrongly
> > > in that case.
> > 
> > Who is that 'one'? If it's userspace, you can simply disallow changing
> > the interval. If it's kernel, you're already compromised, and
> > everything is not trustworthy.
> > 
> > I would simply disallow to change any parameters while the driver is
> > loaded. If I need to change something - I unload it and load with new
> > interval, or whatever.
> 
> It is user writing to /sys/module/steal_monitor/parameters/interval_ms
> that i thought of. So user.
> 
> If we disable then those checks can be valid.
> 
> > 
> > > Even if work function gets called prematurely, it should be fine since the
> > > steal also increases accordingly. No issues in delta logic.
> > > 
> > > So capping to 1 to ensure no divide by 0 happens due to scaling of
> > > delta_ns is good enough.
> > If there's 1 nanosecond between two calls, your statistics is very
> > inaccurate, pretty much a noise. You want to make decision based on
> > noise. That's simply wrong.
> 
> 
> yes, that makes sense too. I have kept interval_ms/8 as safe bet.
> Return will not queue the timer and effectively disables it.
> 
>         ktime_t now;
> 
>         now = ktime_get();
>         delta_ns = ktime_to_ns(ktime_sub(now, sm_core_ctx.prev_time));
> 
>         if (unlikely(delta_ns < sm_core_ctx.interval_ms * ((u64)NSEC_PER_MSEC >> 3))) {
>                 pr_err("work scheduled too soon delta_time: %llu ns. Abort steal_monitor.\n",
>                        delta_ns);
> 
>                 guard(cpus_read_lock)();
>                 cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
>                 return;
>         }

Don't overthink it. Simply don't allow user to change the parameters
while the driver is running. It may only cause troubles to those
compiling the driver into the Image. Those compiling it as a module
will only have to reload the driver. This is how most of the kernel
works.

So, when the driver is loaded, make sanity checks for all user parameters.
Interval, for example must be between 10ms and 10s. If user wants 20s,
pr_err() something and fail to load. After the driver is loaded, don't
allow to change the params exactly because it may bring certain type of
errors in the logic, and you don't want to mitigate them.

If there will be a real need to adjust parameters on the fly - it will
be another interesting topic (mostly interesting why user wants this).

Thanks,
Yury
