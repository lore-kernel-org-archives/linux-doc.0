Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADC38C43A;
	Tue, 14 Jul 2026 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034099; cv=fail; b=IXffL4jf+bk68h50InwEuU+3UAzZRvr4c2EjQLYno7dz/RUP4jyh8N4ELrqKYoozriOJPZUcHDnKdWoMEph3mMOXnbIYULC+1m5ynfktdKCYf51ZOA3PCUyOxu4O53AQldlge8YRWAmkRV9Wu98wwaTx9gWzKb6R1ANnbBJ5T6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034099; c=relaxed/simple;
	bh=+ok8Z+5kjRGPaDdiVVi7kAuvsJdHadtKpejKsT9rYSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W2h53I2fEfJ8d7f1iFASb4oOyVjjYGL/GwYOQSV1lTJV4uBGHWdVVqb86H7Byq7gmzM3MXTLc90kQJ79xRS6CQmVcBXKbYyvYMQG9v/QmQHu0LTraJA8D8oP3U1l0IhiBQk4VaB7SayyaG6wUWFeO3gf5hx/iiAMLyoVp3rwvZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a7S+f9hR; arc=fail smtp.client-ip=52.101.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a7S+f9hR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzDBACXIDncJiKd8xw5IW41Nhpn7krzaMZldDhA3iDDvbJFsHazlB5m601ShSS+K/Ke4TMU1CCjmpB9Y79s8PHOqAzoKBkwHcWpnmADYiLRdJYoQr68dZfNJ/xet1qppP+6otaOaejYVLHGtt5HJS/WEm6RiUmxkZhINFopyDGokwbugPsGcqwBNlxQh6IhNZTkErGVh+8oLzj8/mASCdYBo2Tbs6+kHhqFBO+tMwZhDkTxH78o2D4Ym0JKT4A05uWg0o6aWlPMk+27rU04gQUVCYNivEsGjj4x9FA3I2v0MnmtamnRxcj8p1dhSCqKCb+XayKSGCbM0wsG5JcYTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pelbizQI1y7BuxWWZrm3zZs9kuQEJXzSWNPcIldA8XA=;
 b=gR1+wIoXmH9MWSL8lGU7QMhrvAfShoshQzRVYyI1tMyot+1GD+D5HSi994kDth6GWmE7j6Uz/ug2dJFojQOT8cCoUfy9obzbDNt7Qfx6yvU/0ccdNc8KsouGX3K1IIwGq4kAkrpU/ybBgtE5bU81rdkyr02hC0SYCzDvXVKCZEOkekvggP/HVxBcFOz3RBxg3LCD7BByT2kJYGS3/qN9iXyNyt5V6Pl1mFtkOrs5C9Qaip+UH+aj/KXqd31LaE3FzhTM5kEeOG3HeqpwwkVl/M2sU1M9Ndc1WlP4+YTl1ZblaU5CKxxXJuDO9YObnMEyg1QJl/qkXGp9cGlf134rFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pelbizQI1y7BuxWWZrm3zZs9kuQEJXzSWNPcIldA8XA=;
 b=a7S+f9hRFQAqfRpvjdF4mBTEf476Mvq/JGUJDxMLqqb32WC47p3kyRo9pw6Pca9IPPwpdbexBkaYWjMhTDSr+D/wkqiIdTogUOvvN5rB0Fl7RQ2lY9o+s7WOgOzjWyAUb7EJ6kCw1OAQU+WzSKIAqSRpZVe0icv7GhbUdahzVteIN7r5O0dLXteB+/qnCPJcvbsc98L5iy5AhpHNPfMVpRUu8y3KmoHCLAcIpxkjjwXniEUyBSiAtkCi+dU2eneG4fB0PfvkFJH4y/9S12Ir2XwHNh9h7y1jJtu0LOwAWsnq0xKXXUF9wvNk+JheLq6njkXYaRDBF5QlviMKRkSnrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by DS4PR12MB999102.namprd12.prod.outlook.com (2603:10b6:8:2fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 13:01:32 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 13:01:32 +0000
Date: Tue, 14 Jul 2026 09:01:30 -0400
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
Subject: Re: [PATCH v7 02/12] cpumask: Introduce cpu_preferred_mask
Message-ID: <alYzKl-KKI6lnMFi@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-3-sshegde@linux.ibm.com>
 <alT78Nzt3xa-7G5Y@yury>
 <df198506-9c6e-4e79-bf3b-798668322708@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df198506-9c6e-4e79-bf3b-798668322708@linux.ibm.com>
X-ClientProxiedBy: BN0PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:408:ec::6) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|DS4PR12MB999102:EE_
X-MS-Office365-Filtering-Correlation-Id: 66ea692a-d04d-456c-23f4-08dee1a806e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|7416014|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PeuJ2eO3nQMemHssyuoZonUe5bQt9B8HTJPnh8W0NQ/r0dXIkyWRNO55Tvk+dbCzGMbXiSuifedS+MjLxiYYUJrHCR4rcnIOcNX5y510Y4gNnBxQbKJd1Svb47XmOBNu0eroM7ZW4Odr8aRXcXqGY2pnCngcr6uOdCLbPVwsUZK8wRrWeVndVekMN8aMCvuR0YkttPuUfpD5mtMzw75GZjb+sHCxxkErLmdDqe1jB2XZ+qvlVJmIX8lYdHrEt+N85IBlhJ/myldKCte/KR0Qc+sHk8CTj2FU60xlL7cYdA1yrkD5+4l6C3RFi81V8WmL/NuyKXAUjs7+2U8taBP/VXXohHPkjrOmps8VNVLhFns3ZprTSNp/edL5S3gny2ZCcCaoCBQ/ZH1oQPQNT0pF2/N5NOAZnsljrfZU23j48lvHMUH1xXpzIIcxAzrKAAK23E6CmsHPGzl4FQ/16sPXPfR3/3fRSiECLEoKOSySS1dlyVVz9sEzeRruFyynsk7aSjqlW6gC39tkuoSfTYoRfgKh2S85xOGS8A23lDS3q91iuw80zCmMWgWMpYKn/Czy+xS8buKASnWP/yG3etCqa2RdSxoqYKk/1lM+Fj2cbX21qvjTSUoT5PjdOgTfz4Rcfon3isY1JB7owWylboYJf5sIYg/2Faqda4SXwsWwBPU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(7416014)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?stgEGEtmL8PcqdwANJ+84uv226jTnwCzn6WbbWfsqk6pKjmUZ39vr2s4TnP4?=
 =?us-ascii?Q?lSo1tjDxJmw9tpt1q7F/hxwGSkWVqhxWS4Zl3UIuxJg/X0+TGamIPb7ld+TG?=
 =?us-ascii?Q?AmTZ6HElMQLoQ9j7fQhfJGDgIGGWTG8Go3pB2FIaYeP3pTSgwtDeX3Cohgzx?=
 =?us-ascii?Q?Af8jr7E3HeX39NpaccIZVt9cGsiXeJSyog1a78Qg+dShnQV8PSqYmq7JIpls?=
 =?us-ascii?Q?WOVacLmkYnNF/wngOVI3ghYZVVTiHxyu+E0BAeN6AoMu4Gq8XbUPa1tH6097?=
 =?us-ascii?Q?+b5WMfGiJ/GmJRF+eXbnikYjJGihTURiA59xXm/AkfYU13Z+ZO17kxogAWmu?=
 =?us-ascii?Q?Di0M5Df3dXi6/KbZ5zMniN4dJRTYUI4+ugNtIqemAAMzQLvBlJ0niKmSoEa1?=
 =?us-ascii?Q?oyWGo1WjeTzxHPF9gAFEDEFpdsYBrmn33nWRy6RdK2QMkY9PcX9GSTFvk1CZ?=
 =?us-ascii?Q?e+jfzUjwbm/5BhpiJIGuHHkt7dROeCAmpCWvq6dLo6TMB22Xq7/Z6MKtwAra?=
 =?us-ascii?Q?NEGe7PwE7f8SlhFBAO2L97ZHLADPqQi6Y5B0e6AGRkppZEvUK7axhtOnlNe9?=
 =?us-ascii?Q?+/j2lsx3kNIVzWnTYTcWIutrGQYekddUh7luMll1UYWv+P0ppNv2nYcbKUTb?=
 =?us-ascii?Q?UI+9oalhDrtnWKgJpm/z+/Fv5rteO3xfUuf5OBg1KJnHpUm/wGWDxXQSd4rS?=
 =?us-ascii?Q?1DDY4wYqPgtNEE9OxOWc6c1eo0321E2l43JpYR4wG71YAZCE8jl0rSWHqurr?=
 =?us-ascii?Q?UgzKezfEp2sZ8DH2NSkl3mh973QO0aUteuqh0a+VaJDzDqlpAUcL2/QObM3V?=
 =?us-ascii?Q?b+nVDE5ANTRbikjRYyfvTgXaiWdURK0iFvVQJ6eLHPiBkWidFiPzOgm45wWn?=
 =?us-ascii?Q?JFTm4mmerc1IzKX1e7lPvmVo7//i4d+s2gwqHQ7jKYto87aORsP8V1WJEF/L?=
 =?us-ascii?Q?vthwKevhcQU2PoNPa2HpluV2T9Z0yjKrquglB//gUrxC+ivjYDycDe8Uv00i?=
 =?us-ascii?Q?IZR+zsMrmSUq4jPmin43zXBS/L3TUDiRl5hDgyeC7CSnZ7cc+1y1EINNQKHv?=
 =?us-ascii?Q?CUvRKi5hmCDO39XyKzC967gjDAVDuyWPsVEztBDQ0mJ/1/PuT0YhhISL0kE2?=
 =?us-ascii?Q?atkY8TMCzMeJHjw5J9rJxyvo6XQHPX8HFtcnR45wYEthZEHiLfpBm7luACwI?=
 =?us-ascii?Q?TFcakwgeA+akHT7SV0gKLuuIzbcLgMw5cCtwQfL7D5mqt79taE0x3grOn0HP?=
 =?us-ascii?Q?LtoBPFoosdhfoaWoCRzYBMo8vckcANPidghzg2sANegffF3fkRecAuXBsSFu?=
 =?us-ascii?Q?wDfvjqoK0FhbiqPD67Aroi1g19FIVrBHUfZ3Kcc9tZdySZ+LUJVl9WmTkYeG?=
 =?us-ascii?Q?6M8hR46FfMpMad5mtTNA9Lq6fBe5WrkhdOIB/Y5L2BtYAS08cSKG4SWMhwle?=
 =?us-ascii?Q?/FBorDivV5MdDUBFWo5EnJ0UBkRsx1vrTZDZNE75xO9Odkz3cxhnXA/9+zP9?=
 =?us-ascii?Q?OvHpOQLGpTO8VRiIXjux/cU4+x6E8LO1/k8j8HPKxTvalVCRGOztpC3PaK1M?=
 =?us-ascii?Q?sIapmZPY5b4viKjGBM5XLRDbyASifLYzA0wckImdMv0foRUWBOd/aPgXBUuC?=
 =?us-ascii?Q?fCm9W0zLaFYm4oxb+lwO1nETd4HnV3cKsf54x0Xs+kOaPMr9fabR2gjZDfei?=
 =?us-ascii?Q?0kdD9twCHyOT81dMoNWK2MDGpDLNXnYumuBK86XHc6xRxKg9L3JqM4aK/EQ3?=
 =?us-ascii?Q?jsE+oSVLPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66ea692a-d04d-456c-23f4-08dee1a806e0
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 13:01:32.0917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxKznIv4duk2YPPA95RGQJTQyNXSkPvwM8FRWUE2qeMqj15NR7h/O5sIHZfm/M0BjmkiYWKm2vDLwcmmT4eV4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB999102

On Tue, Jul 14, 2026 at 12:00:51PM +0530, Shrikanth Hegde wrote:
> Hi Yury,

...

> > > diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> > > index 88c594c6d7fc..ed02e4431230 100644
> > > --- a/kernel/Kconfig.preempt
> > > +++ b/kernel/Kconfig.preempt
> > > @@ -192,3 +192,6 @@ config SCHED_CLASS_EXT
> > >   	  For more information:
> > >   	    Documentation/scheduler/sched-ext.rst
> > >   	    https://github.com/sched-ext/scx
> > > +
> > > +config PREFERRED_CPU
> > > +	bool
> > 
> > This still should depend on PARAVIRT and SMP. And maybe to enforce it
> > even stronger, your driver should fail to build if PREFERRED_CPU is
> > disabled. Imagine a scenario when someone makes PREFERRED_CPU
> > depending on some other config, but doesn't modify your driver. That
> > way you'll build the STEAL_MONITOR successfully, but because
> > PREFERRED_CPU is off, you'll end up with non-working functionality at
> > best, or corrupted cpu_active_mask at worst.
> > 
> 
> Sorry, i may not understand all the intricacies of kconfigs.
> But, Since driver selects PREFERRED_CPU, and PREFERRED_CPU can't be enabled
> individually, driver again can't depend on PREFERRED_CPU right?
> 
> As per previous discussion, it is probably better that driver selects PREFERRED_CPU.
> Keeping them both independent and selectable brings too many variations.
> No?
> 
> I guess you meant below.
> 
> In kernel/Kconfig.preempt:
> config PREFERRED_CPU
> 	bool
> 	depends on SMP && PARAVIRT
> 
> Driver's Kconfig (this is there already)
> config VIRT_STEAL_GOVERNOR
> 	tristate "Virtual Steal Time Governor"
> 	depends on SMP && PARAVIRT
> 	select PREFERRED_CPU

It's just another precaution. In a hypothetical case of making
preferred CPUs config extended in future, one could keep the steal
governor configuration consistent to avoid this situation:

config PREFERRED_CPU
	depends on SMP && PARAVIRT && NEW_DEPENDENCY
	bool

config VIRT_STEAL_GOVERNOR
	tristate "Virtual Steal Time Governor"
	depends on SMP && PARAVIRT      # NEW_DEPENDENCY dependency missed
	select PREFERRED_CPU            # Selection doesn't happen

In sm_core.c:

  #if !IS_ENABLED(CONFIG_PREFERED_CPU)
  # error "Preferred CPUs is the requirement"
  #endif

As said, it's only precaution for hypothetical case, but it
makes you nice for those working on preferred CPUs in future.

Thanks,
Yury
