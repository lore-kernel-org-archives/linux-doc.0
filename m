Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3C33AA4F8;
	Fri, 10 Jul 2026 20:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783716830; cv=fail; b=pOC+TNDsY4XgyeSCZr86DO2UKcD4xxvU0zLOMmCGRht7JTrPKpUgrw8eWRNbRrZs3hJXUnPX0VoX+I9a/Ekjzrd95UoA/LgFi5q0F+5eQHtkaYoLKomlf4HQzbB7G+OWi/gTRRcCrBWPKej4M0sehCqvsHwyrEBAk3rnH13LWeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783716830; c=relaxed/simple;
	bh=lNhFNSaZe+c887MA1DdKxOiradvpkq/QzVSnfO8BlZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VTChjq6q+GPxChjaivrpEY65cdfSSnaHx77pCbQBquC3PF0M2uaIftygA4Urp+3omjiR6dYoeqvIFt8lJhDNCxUz4rRN0q/eTU0hECq4MBO+D/2AGxU0qfXpgxD5AMeLXMBmQ69AqXEkRzAVn0+MpU2hmsW6A9JwE2zaHRFRo74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NHnOez/V; arc=fail smtp.client-ip=40.107.208.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NHnOez/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gplvhXpY1f4cGdYQhjWJqPUnrHo1A5AKBXd2GQ0VyFcrVATKOTxJ4vx+Rp4hDZu13tkgSmcW75vBmr8IWWkmZqBBlvLHKAo615u/UGaGyy2vVLxp6fC4Ceuz8ZW/t1+7Uve+mMeIY7b+jVw9Ln7LgYmsBFWd3K7GheGmvlXwbQv8aq2HlrSPyPSwvHoDIWo+d7fyX+lU5pDKkOfT+l7GEECoqROTQu/Ga0TJOYWG/Fi1mjZ2e3FGS8HkGajOWcz5YOfaVirpm0xojNB3iZmziac7qpYpVOJd9f0HrvOkv5XBnP1RhwXjz9yVDHf7NR+P5kB44/hNYRWKJZB1B7jDGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny1kg2xGzlVLU8jtYTbbQs3lrHW+nIp+0WzG7UvQNkg=;
 b=nLHE/o3HYqr/ggOKBFQr8XwDt5scidlMMy8xU3w4IIDvVAoGeICdvmpaRrcxIOZbpTdFuAqNz2vWKWdFQaHq2Cy5fFmhHLD1mvkX7fprGjNnkVJ8JNtSlbQGuuApWRjahsYoCkJ2Jz2t3hBE9VfGUmb7vY6hq2/70pUO7W8wU2SSRcvTnG0ZV48No8CXd3IZ5fc51VydJ6kZ9kplW3k4s3HZC1+hYpTJluHfPDUfGHk3FKYmdby0O893yqdC3f0WCLKEFmVuB6Ikk1mXj+t64PA6cjALSCHxEGt47DYEwTMk1TEbwY9+QpeHh4XxU6JQ/CutVcW8uFgaq75SIPj3sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny1kg2xGzlVLU8jtYTbbQs3lrHW+nIp+0WzG7UvQNkg=;
 b=NHnOez/VlyRSwiUrLsWexUIyNvAX4G9rBBLve5+qLivZyp5O90PG7mQP7dFNuEXW+I1EQDqCg2XwXaYlbzp2xfoaopvHDu4B8vwq15XnxWQG1wn5mO0FV9iMTb5+tQk9Ru5TfBVAV7xwAJc78Jc0kS1r0oSMicf31IPeJdpQX1GlVGkaBsAW3Qxi0dYNe84xaFPW3FfCKB8zji3LSGNBAAwyOXZUVniK293FDg79CKVPw9nJtUcKJiuQqeRVytLJvuKuVzwsMFY+5POWHhE45L8yIoycmkC/3BeUx1JXDXed8E8beoGfkFc/Z6+LNVbmysmKHoO7alBC+kzW8IwYkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 20:53:39 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 20:53:39 +0000
Date: Fri, 10 Jul 2026 16:53:36 -0400
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
Subject: Re: [PATCH v7 08/12] virt: Introduce steal monitor driver
Message-ID: <alFb0PBu8P44DmXD@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-9-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709215648.1246821-9-sshegde@linux.ibm.com>
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f8e627f-88c3-4d0e-175d-08dedec55176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|11063799006|4143699003|5023799004|6133799003|18002099003|56012099006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	W81ITYLQBsDqbGuxSmH96gF0LXFK6YudeLmnnVeubtM1khzhk6aGxuhEU9WJUdhtMVIJoBdvfQCkoy45ykM66QTyiVcHBXb9EXRnQ+BUC0ag/PNM5ITA+uWvk6+ZkSf96LhZS518sVC/WCj7OuSke0WTnDSSfYv+CgtqwRcJnblkiMBfxJFCq4QN+rkvKVuQGbXVXXUtXkqO0gEAnVbXOg5Wi1OZG+EBB4Emgw/YEkoi8TGqctNTYETu4rPiSfPeOPEyHvhUx6sh7KKxZQwqGVgh7FkwMrYoLN3My8YeRpsAJaB8OJ9Eeh3sWiLgTjaeqvxzZqpr0MpJQlV7ct/KvuJ2lA9zcThY+rI7663xMgpKOsS9BEFamIsfSRa5T+wZ4BN82KnlyixUvbL2DDCfsZY50+cBS73t/OTtISynheFG7UmovtMit861tqCNvezcsKnkHwGMO4D8EVIrGkpyzS4bTXu01w3b2c/z6A403ICHDu3cOabgpCeEeLwIQrn06pSZN9cS516RT4YGZyMGzr5eCWkrY/mv0FBlcSaJmjiupZj2f+cv9DU9o+srclz8j4NYAZSy7htWd3Xpy0owv6NuLrhQ3sRTtaRfb3YYaMXjSwPVjco4EYeT1V4gosfzMij+gAQMiaOJFmfk9QYGk7wHpwhcY2R1c9TnFSkE+YM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(11063799006)(4143699003)(5023799004)(6133799003)(18002099003)(56012099006)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HciGE34t6ePe+zAi3G172ZiPfgFN2fSWsO0ZW6mLtKbNFp/9SDnzIDyMhrzG?=
 =?us-ascii?Q?HOYIWn1dgReckZ9Bz6/FPaIAPxHZWrE2K8bl5bVh8bgHO98N03lgu6bqIqVR?=
 =?us-ascii?Q?S7ExUpFF2Bq8iqFhYFBYrBjgfTP+//ucgsyyf5kpetA9/TMFDSBdb6Vwf3Gj?=
 =?us-ascii?Q?93N2Cqwqp5cGwBYeWgDhbMFvcl+029khCMgxSuQHYd0pZ+ptcRQHn8Y7oU2a?=
 =?us-ascii?Q?8vmpJ7D1k+WICb40YeZ2nStFrb3phoO/yL/qvZTM1n/myOGvCw2AKsutRva9?=
 =?us-ascii?Q?24w6sGVmHxELtokc4pe7Y2wjCyRTwrztwmgOk9pX7tMQvTqcxS0n2BdpEzsh?=
 =?us-ascii?Q?9gNpGNUbYKAKOtcU0DJbGfYGO+rrDck9QPRVMetXPJxIbRqM5JXE4bwvbsHK?=
 =?us-ascii?Q?JQkskTOhbmjDhvNsPMpRvJEu7WyY7UIJkHuGNn5+Tbo6T0z7Bjhi1blaRZyr?=
 =?us-ascii?Q?0V7ABa3xJCCZtw0euP3cuyeTbyqgpFlkgs7uGRUhLwEI5zRYewubh46zi2uh?=
 =?us-ascii?Q?YY9LJwayYzbbIdQg6t4sMj5azxIK1H7kuAPILGjhKj08vOXDok7uQAqJS25o?=
 =?us-ascii?Q?a0nWOa+go7oeNWBeNpXi6MTIsxl7gCCknl+O/OktJilXowDt69Ui87eJUZRX?=
 =?us-ascii?Q?L0+M9yautsGilYJNJgrQWIRh/KQGadRyTFKZmLxHPOqOg9g6iw1wB1B7mnaz?=
 =?us-ascii?Q?wwjraRhkRe4I5N+Zrao7LJvVAM6f+C2MWM0uK3/zlp+JenRTUok3qxgKG1z4?=
 =?us-ascii?Q?CyCrJ+TRyyGyJS8VOwfESWO40d3suZX8Gh04OixtwJx1b9f/BEQIjncKXSMd?=
 =?us-ascii?Q?/DyDo4K+3FF5pu/xHRyWYlAuU+Pa9IJlvzrJoXSnSyIW8qB2lR88y6s9g7FI?=
 =?us-ascii?Q?fsuVcaCtqm2jigYbrreD9qzmjTJfKBaQbW39GoMNVmxOI07t4zhXIuPYXn+C?=
 =?us-ascii?Q?LuFCxzkdkdST2THf2fSqT8te4ZRMcmMO612DrHkVOp2fWw1tSZpE7iWqBcIe?=
 =?us-ascii?Q?9Tk0cbNN83SRSDaU7TMJg7s79syHNmX4qzWi0+OZMaqZSX2QmEQlM/JbTQ3v?=
 =?us-ascii?Q?O/RkWa/6TIb7fD8dUn0Xe2tViXJ0kMoas2U7VoBHFhytKcd3Ab8KhSrJHV/O?=
 =?us-ascii?Q?TD4oE5L8mHUJRKre8e9Hht4GJH07qtGyCvoK1hHAz2QDzEgaYkyczwkDbAWr?=
 =?us-ascii?Q?FLCCsMqTwF/iJVA8Po7tbLdVutk6IS/r/aWqsIhQc94iXr5u6wQjWZmA7GAd?=
 =?us-ascii?Q?GVhAx1G9CiNW9gfUM/o12e+L17EYIntwo66KhuVwQxVvjJfD0LhXMZ/JVTNq?=
 =?us-ascii?Q?m0XDCxPvMsfPeFu7w7hzKmE3Ur9SAwyLBZJMz8N1bDKi2I11oru5lf6I3nnY?=
 =?us-ascii?Q?MkF/VdITmkNERjJcQ65kyJHyOJelRp8TTgEg8zSDO/wioUOa02F4zCAv4FfK?=
 =?us-ascii?Q?RliSfbic4TBiYUsJn+fFXZaIxkMG8Zb3jpZyf8wEYyl6b66HfuBF2p8KiriO?=
 =?us-ascii?Q?YPEsZEW2K83BCKtNaXY1ER2hVeTerXmml1kjXFgYQ2ySCJrTfFQfcGnAY+QW?=
 =?us-ascii?Q?ATfYiVbvCM4XNDfNI+HgoAcMrqGu5X/uyl0Xjik5llmHZNxp82tuRmz9PN/V?=
 =?us-ascii?Q?Qoc6TcgC0smvYUR5/EOBqGfui/5uNPQT/OyuRJzo474Ms9jlkqLYFFGTP2Qk?=
 =?us-ascii?Q?74nvYSjyqEiXKQ+XfA1lDpEQLtFb+y8e0w+6YZPn4NdxRo6kPeteHhzOuaGL?=
 =?us-ascii?Q?ahP2mcNGZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f8e627f-88c3-4d0e-175d-08dedec55176
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 20:53:39.1893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QV6rVCdLXgU8o56kk+XBYVqLsRBQAyh1RKqY47UojVUUY2Ooh/UErM78jOtDlVmn8HE49s2bWTirwGgx7tlQCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206

On Fri, Jul 10, 2026 at 03:26:44AM +0530, Shrikanth Hegde wrote:
> Introduce a new driver in virt named steal_monitor. This driver
> will compute the steal time and drive the policy decisions of preferred
> CPU state.
> 
> More on it can be found in the Documentation/driver-api/steal-monitor.rst
> 
> There is a new kconfig called STEAL_MONITOR. Having that driver is going
> to select PREFERRED_CPU. This makes configs driven by user preference.
> It is recommended to build it as module and let user load the module.
> 
> When the module is disabled, preferred is same as active.
> 
> File layout of the driver is designed with having arch specific
> files in the future.
> 
> - sm_core.c - contains main driver code. This includes the periodic
>   work function and take action on steal time.
> - defaults.c - contains the functions used for handling steal values.
> - sm_core.h - header file which includes data structure.
> 
> Main structure of steal monitor has,
> - work: deferred periodic work function
> - prev_steal, prev_time: To calculate the delta in periodic work.
> - interval_ms, high_threshold, low_threshold: debug knobs of
>   steal_monitor.
> - prev_direction: Simple direction control to avoid oscillations.
> 
> While there, Add MAINTAINERS entry for this new driver.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v6->v7:
> - Combined all introductory patches.
> - Introduce STEAL_MONITOR which selects PREFERRED_CPU.
> - Added MAINTAINERS entry.
> - Yury, I have kept you as reviewer entry, Let me know if it needs to
>   change.
> 
>  Documentation/driver-api/index.rst         |   1 +
>  Documentation/driver-api/steal-monitor.rst | 111 +++++++++++++++++++++
>  MAINTAINERS                                |   9 ++
>  drivers/virt/Kconfig                       |   2 +
>  drivers/virt/Makefile                      |   1 +
>  drivers/virt/steal_monitor/Kconfig         |  18 ++++
>  drivers/virt/steal_monitor/Makefile        |   6 ++
>  drivers/virt/steal_monitor/sm_core.c       |  38 +++++++
>  drivers/virt/steal_monitor/sm_core.h       |  27 +++++
>  9 files changed, 213 insertions(+)
>  create mode 100644 Documentation/driver-api/steal-monitor.rst
>  create mode 100644 drivers/virt/steal_monitor/Kconfig
>  create mode 100644 drivers/virt/steal_monitor/Makefile
>  create mode 100644 drivers/virt/steal_monitor/sm_core.c
>  create mode 100644 drivers/virt/steal_monitor/sm_core.h
> 
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index eaf7161ff957..ec12f396a5e6 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -138,6 +138,7 @@ Subsystem-specific APIs
>     sm501
>     soundwire/index
>     spi
> +   steal-monitor
>     surface_aggregator/index
>     switchtec
>     sync_file
> diff --git a/Documentation/driver-api/steal-monitor.rst b/Documentation/driver-api/steal-monitor.rst
> new file mode 100644
> index 000000000000..94f4aa1aaa7d
> --- /dev/null
> +++ b/Documentation/driver-api/steal-monitor.rst
> @@ -0,0 +1,111 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +=============
> +Steal Monitor
> +=============
> +
> +:Author: Shrikanth Hegde
> +
> +Introduction
> +============
> +
> +Steal monitor is a driver aimed at solving the Noisy Neighbour problem
> +in virtualized environments. The performance of workload
> +running in one VM gets affected significantly due to other VMs and
> +combined they make slower forward progress.
> +
> +When there is overcommit of CPU resources, i.e. sum of virtual CPUs (vCPUs)
> +of all VMs is greater than number of physical CPUs (pCPUs) and
> +when all or many VMs have high utilization, hypervisor won't be able
> +to satisfy the CPU requirement and has to context switch within or
> +across VMs. I.e. the hypervisor needs to preempt one vCPU to run
> +another. This is called vCPU preemption.
> +This is more expensive compared to task context switch within a vCPU.
> +
> +In such cases it is better that combined vCPU ask from all VMs is reduced
> +by not using some of the vCPUs. vCPUs where workload can be safely
> +scheduled which won't increase any contention for pCPU are called as
> +"Preferred CPUs".
> +
> +See more on "Preferred CPUs" in Documentation/scheduler/sched-arch.rst.
> +
> +This driver makes CONFIG_PREFERRED_CPU=y which enables the scheduler core
> +infrastructure to move tasks to Preferred CPUs where possible.
> +
> +Core idea
> +=========
> +steal time is an indication available today in Guest which shows contention
> +for underlying physical CPU. Use it as a hint in the guest to fold the
> +workload to a reduced set of vCPUs. When there is contention, steal time
> +will show up in all the guests. When each guest honors the hint and folds
> +the workload to a smaller set of vCPUs (Preferred CPUs), it reduces the
> +contention and thereby reduces vCPU preemption.
> +This is achieved without any cross-guest communication.
> +
> +Steal monitor driver effectively does:
> +
> +1. Periodically computes steal time across the system.
> +
> +2. If steal time is greater than high threshold, reduce the number of
> +   preferred CPUs by 1 core. Ensure at least one core is left always.
> +   This avoids running into extreme cases.
> +
> +3. If steal time is lower or equal to low threshold, increase the
> +   number of preferred CPUs by 1 core. If preferred is same as active,
> +   nothing to be done.
> +
> +4. Ensure preferred CPUs is always subset of active CPUs.
> +   On feature disable it is same as active CPUs.
> +
> +This feature works best only when all the VMs enable the feature as
> +it is a co-operative scheme. If a specific VM doesn't enable this feature
> +it may end up with more CPUs than others, still should lead to better
> +performance when seen from system view.
> +Those who enable this driver must ensure it is enabled in all VMs.
> +
> +Module Parameters
> +=================
> +interval_ms
> +-----------
> +How often steal monitor checks for steal time.
> +Default: 1000 i.e 1 second. Value should be in between 10ms to 100sec.
> +
> +This controls how fast steal monitor driver reacts to changes to
> +the contention of physical CPUs. Since it does a fair amount of
> +work, setting too low will have overheads. Setting it too
> +high might render it ineffective.
> +
> +low_threshold
> +-------------
> +lower threshold value in percentage * 100.
> +Default: 200, i.e 2% steal is considered as low threshold.
> +Can't be higher than high_threshold.
> +
> +This determines what values should be considered as nil/no steal values.
> +When steal monitor see steal time is below or equal to this value, it
> +will increase the preferred CPUs by 1 core. Having value as zero
> +might cause oscillations.
> +
> +high_threshold
> +--------------
> +higher threshold value in percentage * 100
> +Default: 500, i.e 5% steal is considered as high threshold.
> +Can't be lower than low_threshold. Must be less than 10000.
> +
> +This determines what values should be considered as high steal values.
> +When steal monitor sees steal time is higher than this value, it will
> +reduce the preferred CPUs by 1 core.
> +
> +Notes
> +=====
> +Selecting this driver makes CONFIG_PREFERRED_CPU=y. That makes configs
> +driven by user preference.
> +
> +It is recommended to build CONFIG_STEAL_MONITOR=m due ot below reasons:
> +
> +1. Doing periodic work has additional overheads. Enabling this driver
> +   in systems where steal time cannot happen is of no use. There is no
> +   benefit with additional overheads in such systems.
> +
> +2. This works well when all VMs work in co-operative manner. When an
> +   administrative user enables it in one VM, he/she will likely enable
> +   it all VMs.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..6735f9dae530 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25914,6 +25914,15 @@ F:	rust/helpers/jump_label.c
>  F:	rust/kernel/generated_arch_static_branch_asm.rs.S
>  F:	rust/kernel/jump_label.rs
>  
> +STEAL TIME MONITOR DRIVER
> +M:	Shrikanth Hegde <sshegde@linux.ibm.com>
> +R:	Yury Norov <yury.norov@gmail.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> +F:	Documentation/driver-api/steal-monitor.rst
> +F:	drivers/virt/steal_monitor/
> +
>  STI AUDIO (ASoC) DRIVERS
>  M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>  L:	linux-sound@vger.kernel.org
> diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
> index 52eb7e4ba71f..a52233b2502e 100644
> --- a/drivers/virt/Kconfig
> +++ b/drivers/virt/Kconfig
> @@ -47,6 +47,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
>  
>  source "drivers/virt/acrn/Kconfig"
>  
> +source "drivers/virt/steal_monitor/Kconfig"
> +
>  endif
>  
>  source "drivers/virt/coco/Kconfig"
> diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
> index f29901bd7820..b67fd8968ec3 100644
> --- a/drivers/virt/Makefile
> +++ b/drivers/virt/Makefile
> @@ -9,4 +9,5 @@ obj-y				+= vboxguest/
>  
>  obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
>  obj-$(CONFIG_ACRN_HSM)		+= acrn/
> +obj-$(CONFIG_STEAL_MONITOR)	+= steal_monitor/
>  obj-y				+= coco/
> diff --git a/drivers/virt/steal_monitor/Kconfig b/drivers/virt/steal_monitor/Kconfig
> new file mode 100644
> index 000000000000..c7d7599c30ce
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/Kconfig
> @@ -0,0 +1,18 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config STEAL_MONITOR

The config should go in the last patch of the series. Otherwise,
in case of bisection, you'll have half-written driver enabled by
default.

> +	tristate "Dynamic vCPU management based on steal time"
> +	depends on PARAVIRT && SMP
> +	select PREFERRED_CPU
> +	default m
> +	help
> +	  This driver helps to reduce the steal time in paravirtualised
> +	  environment, thereby reducing vCPU preemption. Reducing vCPU
> +	  preemption provides improved lock holder preemption and reduces
> +	  cost of vCPU preemption in the host.
> +
> +	  By default preferred CPUs will be same as active CPUs. Depending
> +	  on the steal time when steal_monitor driver is enabled,
> +	  preferred CPUs could become subset of active CPUs.
> +
> +	  It is recommended to build it as module and load the module
> +	  to enable it.
> diff --git a/drivers/virt/steal_monitor/Makefile b/drivers/virt/steal_monitor/Makefile
> new file mode 100644
> index 000000000000..bd7d120a79b5
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Steal time monitor to alter preferred CPU state.
> +obj-$(CONFIG_STEAL_MONITOR) += steal_monitor.o
> +
> +steal_monitor-y := sm_core.o
> diff --git a/drivers/virt/steal_monitor/sm_core.c b/drivers/virt/steal_monitor/sm_core.c
> new file mode 100644
> index 000000000000..180db424846c
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/sm_core.c
> @@ -0,0 +1,38 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Steal time Monitor.
> + *
> + * Periodically compute steal time. Based on the thresholds either
> + * reduce/increase the preferred CPUs which can be used
> + * by the workload to avoid vCPU preemption to an extent possible.
> + *
> + * Available as module with CONFIG_STEAL_MONITOR=m
> + *
> + * Copyright (C) 2026 IBM
> + * Author: Shrikanth Hegde <sshegde@linux.ibm.com>
> + */
> +
> +#include "sm_core.h"
> +
> +struct steal_monitor sm_core_ctx;
> +
> +static int __init steal_monitor_init(void)
> +{
> +	pr_info("steal_monitor is enabled\n");
> +	return 0;
> +}
> +
> +static void __exit steal_monitor_exit(void)
> +{
> +	guard(cpus_read_lock)();
> +	cpumask_copy(&__cpu_preferred_mask, cpu_active_mask);
> +
> +	pr_info("steal_monitor is disabled\n");
> +}
> +
> +module_init(steal_monitor_init);
> +module_exit(steal_monitor_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("IBM Corporation");
> +MODULE_DESCRIPTION("Virtualization Steal Time Monitor");
> diff --git a/drivers/virt/steal_monitor/sm_core.h b/drivers/virt/steal_monitor/sm_core.h
> new file mode 100644
> index 000000000000..8bbb606add99
> --- /dev/null
> +++ b/drivers/virt/steal_monitor/sm_core.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __VIRT_STEAL_CORE_H
> +#define __VIRT_STEAL_CORE_H
> +
> +#include <linux/types.h>
> +
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/cpuhplock.h>
> +#include <linux/cpumask.h>
> +#include <linux/workqueue.h>
> +#include <linux/ktime.h>
> +
> +struct steal_monitor {
> +	struct delayed_work	work;
> +	u64			prev_steal;
> +	int			prev_direction;

Did you run pahole on it?

> +	unsigned int		interval_ms;
> +	unsigned int		high_threshold;
> +	unsigned int		low_threshold;
> +	ktime_t			prev_time;

This 'prev_' prefix is useless and distracting. Just drop it.

> +};
> +
> +extern struct steal_monitor sm_core_ctx;
> +
> +#endif /* __VIRT_STEAL_CORE_H */
> -- 
> 2.47.3
