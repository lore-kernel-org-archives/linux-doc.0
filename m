Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8D7345CAA;
	Mon,  6 Jul 2026 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363786; cv=fail; b=Fs0gwd1ssvSloG+YpACnmpCwRbYlz3R/xdTpSCPdfIyxtBYQHK0kp+YtA++Q3vFAD+0BKyP6QIZrs6E1W0VgkoCt1hL2LhzwUm+all/23USwlfuCV63eCWXDcUaVcs8hT5XbunK2MyYTEZnfjk0ODo5QuB10OEeV6QeSpY6vecU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363786; c=relaxed/simple;
	bh=QIkVJ2BmwFVN0PMsYJahbBe15v6xrVky3J0+bJ/BqFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=S7CYPLsDtDnvddh6609LSQCx7oKl4Bk7xJXtC8q4edfVAw9D+XsFF3b2kAahHSw8H0sWlcE1FqpEFvBp1a/VQtW/KUgwdf+hlFvSKTZQhCAuNxSN53zXsyZ+DLnMAcACInG1+ZmUCEWyKFMjxWb/LSdrFGjyn8E63NBpDfYPpZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FnE28nkX; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FnE28nkX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQLFQyrYtKKKvNlGPqmzK3APQvFXVZxSBqgjhdjXGd2ZcWJV60ARphr8vHdABbwJ3Fxp8tgS85xFBN4B/saxW8hiDU0azmG4n4LXkIpAmkG7ahdv03/mlBuB4KGmzaWB+yHw01lY8Y/PYt43fR+P7Q8/nSTlIjkvSerlqng32c5XkWO+7iXZO4XfZ7REtXKiJ290WeMxWJHeCAaYOjwJ4Lr4GExZmwVtNy1MG6UB5VgOZJEhM3Bi/CgMPB4D0xD/CW7pY/1eLo/+bkAUrtuLjpz2Wvpr7fQfVVcWKn8jRoQo4m1BOPmfPkQjcHV8HpL1TIDY83JhCR7OdcwZ4EZSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94xO0ksVafZtb0ExBIkporCQ2rBaOQRwqddtDhXx51w=;
 b=vRUeRU1W/T59xtVe0DrJX9nUfOR4vlnyma4wLO9eLhswJ6VXyYORbNDNO5qYNYVUsQBQI8OMXlWvPhhcNsbG09RkTLuFEThFBzomP/c+2NMlJBty2AhMb5yvih1wGU+v2wW6obfaJIwb6UDCTxyf5sEU343R7jHTsXXYqPrwnrlaTXv1KKEnFgZvVENe+PzYROFOY3XZMu6CCjXCSfjpUAyUTQn0pdzDn+n3fTx97ZsV9ZRtrWn4y8afl4Tm9A4U0w2I9ST6CmoU7k2d++3BmT+XfD0T4hJnM59dCTv8TJEyrJOpWp7GLMVykZwENwLLO88i1LrkXg7akf2GSD5BAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94xO0ksVafZtb0ExBIkporCQ2rBaOQRwqddtDhXx51w=;
 b=FnE28nkXcLfkuWbJqxU8rpVtjKb1JBvdcTvM679Li69yv8tQYH662xJPXLgyC3bcCtBxBQ+FneHNW0JxqGBFDPtUI7ohw4l05+zm23Mw5E5dzl6XoS22XdEap1UzN6L8BkCjsiH/7OvsNa9VLC8yvxrs7ItnUK10XA70YGSAEmDgiZapYjeC4pNO6KfXfXxWOkNgKD9KuuvtVbXhxmAN0VBMcYPjel+S9T7RU8Y5EKsuOQ/HYjLxDrhojXMN5y4fbT/5qPRTFChh60DV9aMekPDHlFBgT7UL1s+NJS+R3l6pT/R1C8aOOe3mZaxe7rjndAQjubQcVIjnSOPyYXdEEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by PH8PR12MB7302.namprd12.prod.outlook.com (2603:10b6:510:221::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 18:49:38 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 18:49:34 +0000
Date: Mon, 6 Jul 2026 14:49:32 -0400
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
Message-ID: <akv4vGpII2tx4gSZ@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-13-sshegde@linux.ibm.com>
 <akf9cE22wvPeYNiM@yury>
 <akf_Kg3jaenNbb-g@yury>
 <ce2b5699-8e22-4eb4-bd55-c3df5ff30f74@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce2b5699-8e22-4eb4-bd55-c3df5ff30f74@linux.ibm.com>
X-ClientProxiedBy: CH0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:610:cc::7) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|PH8PR12MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 234aedd2-c4e5-4bf1-b487-08dedb8f521d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NYgQPSHR4+hgYotoFDi0SYnrZFi45akLeORkt0bdfmL9SEEAFA+GvEDNIU8xXtZ0FtN5gZbvYZKGzmaND/nUx3LZfDRP9X+QusZOvLpqa3zPZyYeZts9DY1yOUQJZjC7sjKhCsBxwkXSRVKpc5CJOG1380SudeZhioP0NkJi3/RWsasuGOqNgrkRtmQwXsXrsUiSUhfltr8WQF4tvyx5AhT6gwndz6O8sBupajklfzPsIvsof1ddBjouXhM8Hnmur77KVVWec/WuDG6OJgj7K0SlAOPbs9p5mzLdfGw0nZ2vKvSyZZlrymbHUtjcWWckPCOrJd96rlwY+HliqTcgFqGKUOffaq6F974gOAD88Ul7x1rf+JrjS3onlryvoSMY9KK0zyFhkTXyXThXsmDICjOZXQIbn4CbBXCyjKSoyN4TmX41EoOJcbha0e8jgBKybnjo/7xicxwEnHZLauWS74dZ2J5XyNiyKdDwDO5NtZFntE/PFe3sPj96WzukEeZ725UZmSQzyQdvy5NxwjEjAWZFyarzARbbYkJPmGJytK+vuFzHmdyuKPx5yMwzAcwps6+6NDZdX4hcZSiuXM4hNKDgaps3yLQj7CzgsKVFMKgXlN67vOB5fBns+RA4i/IAHfIz2RZVBuuzbn8qYGE45QwKd60QVWELEY46JQ9zhMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VbYWUXfDummvLIlirUWrJaJIpDbFBIsExZnVGt91OjcxL7eYxNu9OTEruJ62?=
 =?us-ascii?Q?nXcXb+V5vqZkBxAu/YQ86gQyqDcToANHCHSr2izr8X8xaI72JS1P6OxdU2zt?=
 =?us-ascii?Q?QEiny3TieuD9g8lTx9KFEES7qzzZmXqnHkpiP1y58S8CGticcumvws5vDGbI?=
 =?us-ascii?Q?lrRMeFGjN9Oy6u5pDLyIa9WGzm08f2c+67H6RNynsCwzA71YkR5l55oe+z6+?=
 =?us-ascii?Q?nxatxdYMwVTIJyrZJdy2qNiPe5fQ/1XXUjTjqVatMDUeqrqEau205nN+70PX?=
 =?us-ascii?Q?PIB8osOt8b3+pD4y0JY+w3rc+B3+s1OYDGt2HAtmKV5s1ZCCoDXaceqInNGJ?=
 =?us-ascii?Q?12iE0uob2AZpQUauHF6PVKPcqf+xP1hioeAU+30nw+d27WzcHKg+KFhZZG98?=
 =?us-ascii?Q?9G9LWHKUAG9MzUFpaUCqAl3FHje1azzxiWqCpr5fmmYab7xEcuzBvzNOaHe5?=
 =?us-ascii?Q?4QaL5SGT0QgI5j9kByUp83+2Dfs6dKO8/ZqFvG1VMgLLDBkGMtXLwrFkSXJ1?=
 =?us-ascii?Q?EmpRuH74GUvjCkDQCA4hnTe/w5+4SphcIQaR7Mf8ECMBMN1D79/+XnWha7G3?=
 =?us-ascii?Q?2oEwcmrwbEaSiZdfN1c9LrLHwo7bmU/q2VWt1/5luaLfA6yGMOz3zfRWtXwi?=
 =?us-ascii?Q?u9jDQfPS9GQX9AmSNU6cOtAsEOnzGFM0kcB4IIvqomYlNmaa1u1utgZZ/PWC?=
 =?us-ascii?Q?CqopdMg4Axgize4VXi/soDT0ACXCYmsOg7j9G/omSlSC2l6qf8qBvhsAsdTA?=
 =?us-ascii?Q?djxZ+4sOkjFOrBqEPlzpxzAP6P1EjKcrUEawQHbRyVFAf6cwE9zk+qi6FIqj?=
 =?us-ascii?Q?R8JxiuGpByXeNMTzqFyGRH78uC/BXzKKVWXKq4eI8r+5Qf6FUv9sGbbvlcJ8?=
 =?us-ascii?Q?vmLmQgNxCEqoEweuqrLRtyi9rd44cc4LlLkDpeATQEt2cwhebFmRfopL78bG?=
 =?us-ascii?Q?VpwGK7NpWjTYrFPPTwHn48vFWUW6jcvqIYBhXnU7ovJVPUtFZUAQ3urA04jy?=
 =?us-ascii?Q?3kvg03DqCmJYdSZJgtRiy44fA/XDiEtvlPek7S+DaQ8yFd7wrOTPBxXOBT9z?=
 =?us-ascii?Q?gappV+r/4zXu3fAwx29o22oNVtL85gTWvZCm+KGQx7STOuSC8GA51L7RNDUc?=
 =?us-ascii?Q?t+bck3IwCbEAcLCroKjvwjTMErM5CfWSnxmuJiwe2+yicqXIWI1c1iH3F8yt?=
 =?us-ascii?Q?gcNZJaSQpjxIdVMk24EkAJ/Zj/I2uxRagRhdbe8RNXjd33kVWPm/vGUaM9VS?=
 =?us-ascii?Q?0VsPKKjoHK1jcKxYZoRYRe2zEVOTzvS1RbnXCrBZRgt0VfSGJfmjfnAKSPL7?=
 =?us-ascii?Q?UahmcQ0Fv6ctAJHxm3qnUfXxnhpXG6NkvwkcjOi8phorZ1Ab8gr7lLVAHAL+?=
 =?us-ascii?Q?V4PxaloxXkcVtwHEiT4inBrVcz1cZ6o16qlk5Hn0Z+oGwDt1rfnv+odvR6sj?=
 =?us-ascii?Q?BnSdV8fwSiJy9bmzsF1Ujr1LDBwiN83SLcAu8SM5ScheJaA4npQ3x+Sjz+BH?=
 =?us-ascii?Q?KW68q1Ov54PNW1zgeDFBJU97+K3ASzt+Me4KZCKgl/J6xWXhLnR31ngXnqhR?=
 =?us-ascii?Q?xYcB6pl6YgRRDmTZP/bi2ljKXDTmwd71bjUjewIN9mTDMP/Ms9YYWXK1RUaM?=
 =?us-ascii?Q?bK+FJyhmYGR7SYBr4acO0kek2ZdBaoF1OFPgKJtZqGZD2neFkQwtYIGE1/Bj?=
 =?us-ascii?Q?caZMthRT3MuMasgLWYEikGu8FuVoftWdwR6KdvdpJYQg/eg7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 234aedd2-c4e5-4bf1-b487-08dedb8f521d
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 18:49:33.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ul2DeQPSElhITGJhYyjl2JN4wcF0xx2apSW3Aq4TTXe0HxruuO+wnpWwG4F00UddE5rFzoOI4m9/6+ZjdDbBDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7302

On Mon, Jul 06, 2026 at 01:54:05PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 7/3/26 11:57 PM, Yury Norov wrote:
> > On Fri, Jul 03, 2026 at 02:20:32PM -0400, Yury Norov wrote:
> > > On Wed, Jul 01, 2026 at 07:46:43PM +0530, Shrikanth Hegde wrote:
> > > > Introduce a new driver in virt named steal_monitor. This driver
> > > > will compute the steal time and drive the policy decisions of preferred
> > > > CPU state.
> > > > 
> > > > More on it can be found in the Documentation/driver-api/steal-monitor.rst
> > > > Introduce the skeleton code first.
> > > > 
> > > > There is no new kconfig. It depends on CONFIG_PREFERRED_CPU.
> > > > - If CONFIG_PREFERRED_CPU=y, it gets compiled as a module. It is not
> > > >    loaded by default.
> > 
> > What if I've got my own monitor, and don't need this one? Please add a
> > way to not compile it, even if CONFIG_PREFERRED_CPU is enabled.
> > 
> 
> You mean make a new config like VIRT_MONITOR depend on CONFIG_PREFERRED_CPU and
> make it as default n?
> 
> Can we defer this until such a new monitor is needed?
> We will in state where CONFIG_PREFERRED_CPU=y & VIRT_MONITOR=n.

I think the VIRT_MONITOR should select PREFERRED_CPU. Whether
PREFERRED_CPU should be enabled without an in-tree driver using it -
IDK. Probably yes.

Enabling some random driver, and even worse overriding user
preferences looks questionable, at least.

I'm one of those who build VMs with the localyes config, particularly
because it decouples me from rootfs headache. So please let me just
compile-in your monitor, if I want.
