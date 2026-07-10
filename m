Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010051.outbound.protection.outlook.com [52.101.46.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9233B3C05;
	Fri, 10 Jul 2026 23:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724555; cv=fail; b=bjuwe7HMjEBIDBiXeW6f1y9CATVB5UjjRvz0BNfqiSrhxw82Msk3p/qgvJn/1zrsmCzRRXHHB6Mj+wtvqbT5aF0glOHtVf7qJgGD4paQ8roDeZ8VEpuS3r22WR4TsRjhBqGzEWQ3PtBhKiSlHK6sC4b7RW6R3jqF96Y0O2MZFJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724555; c=relaxed/simple;
	bh=KsFl/tu4BdKVJaP0rSLwR8aExR4h4XDIyHlNNp/Zd20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KiraiTYmSXwez0snd1tfHpIXJTOumbu/zBDa6gcQ4qDyjoYXkYU/ISCbvOoh0Mrt3stBLjdPITI3Fy7FumTW1BJJS2VYFwvAOxF5vUrJbQrzxkXgVJV34mcGRPBu8ZSMNfxYbOalrzGpI2X3zJLLfDcMzog8UuJ+OW7iwtcNE1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rAfMzrJG; arc=fail smtp.client-ip=52.101.46.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rAfMzrJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVEfsKTGK7JCKxfoUyCdXfx0vtZrwdmNDWv133c/Sbvp8ro6vXjOC1DYQ1ewuvatmUlAsMTlhWCWKiBWeSiwPFe3ZezD9T7jKlvfjjFG1SmzMcVd5Pk/A3Z1cjLnWaWj6UnHP0l2SUL0bZrZvvwVbuQs7Ym78RIBS6f6r25BKcKWJuy9KM9Dkar4pu3LbBxDdDURhSOVHJ7PndK771/Ou7uorAtuJyTA2kuD8THrIMWmp3Pl44k89zvXsWbfUv2Sls9QFa/ct1eM8d38UU7jz/v4PO/j81n+uQw5dqkSMJVTl+vXkyXs1ytxfvPDIdcS/sKR9YzWhi4QCB72/binng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVfJc97+xcPyYJ+FxAepuicN8LA6cIPbsPeA5+fEJMQ=;
 b=qEozqPohYBW6Ue+mMJx2mCalxhdmZuVd+dRjJWbmzng6cxsT8eax4F+mx/fVQBjdK4gGXJP0MTA8KNJKFvH2YbvgT47CxLQqmyQPmd9eKC6Xyuz/sEEB+UXtTARatiL4+gqHlGCrLcJZAAFjxr2sgvbfn3CG3Zvz8Ly6hJU5+YqS/NyIqSF+XA61VAZVhQ10kHxGeTn37m1fgCqw56GNUEOWfEIqN0GkHm7gLhokrykQvsy60TkjW5D37K2CVPGnqSdTL/H7/iUsoztCcp6611KsXM001QvE0aYj+Z59711U5yhG/pt/Brs6OPfZUXfs+XHid9HHbALs2OUW3fbViw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SVfJc97+xcPyYJ+FxAepuicN8LA6cIPbsPeA5+fEJMQ=;
 b=rAfMzrJGCKT6EQEehsyl9yycR2r8DN2J2EFqF6haE9VcQ1duujKYaoXmq6jo+BtKzsdut8qnn3RluK508Upml6HLrtax/zlKMkpqNf+nxvAiL/LCPrNrmT4kq7Iwq1bwg1ywFbMLDwZ6uhUUff7QKj/DFaoR3b7W8MIfS97y0kgfYzPd6amwbsaXmifjDjjnbR1q2T9u1JLcf/sb/i0w1dAqXzgqm5SVyTgUj+qRMi1gxTdt6uJu54CUHPJKRaCbyynLr+qMH7ZrCT+qddN74qvs4pf8KijWA6910sDT6KJ99R3nN5T/8Ro4CAtMdYQJKRXMphtV71XJyypwiDjBQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by CY8PR12MB7244.namprd12.prod.outlook.com (2603:10b6:930:57::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Fri, 10 Jul
 2026 23:02:28 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 23:02:28 +0000
Date: Fri, 10 Jul 2026 19:02:26 -0400
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
Subject: Re: [PATCH v7 06/12] sched/core: Push current task from non
 preferred CPU
Message-ID: <alF6AqiSWZBlF_c2@yury>
References: <20260709215648.1246821-1-sshegde@linux.ibm.com>
 <20260709215648.1246821-7-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709215648.1246821-7-sshegde@linux.ibm.com>
X-ClientProxiedBy: SJ2P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::16) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|CY8PR12MB7244:EE_
X-MS-Office365-Filtering-Correlation-Id: 104af64b-0782-45c4-c36c-08deded75091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	6QgsS80VtEwLWSJjJJfe9VW4J3ZbLF4bbYR5N2ZGSNFl2Uvn1VWdYbgyyDfoifz59PPU/6peHXXt+FqV8cVON1NQ88SrLi9UMtkzathRqu8lrqUj8oWanG4O23409Vr4tikx4COqpulLfv1A3v/mLfejUHtwhzcrH9DbaxjR3ObLx0+DAjOMNkW67Ea6sSZqq50rON8VnHwhUxqNos1dadyyvGnJh6GE0ETTo0UFI5jqVD8jAWCOM0Dj4JXGM6tZdlog4Uwc0cz+h449TSfilK2emtIz4NoizmxUYtqF1A0jlrJ3GTS/qgGzJpYRYjriT9NrNKEzrqoPPfXcftby/rNDhD7+W5wsy/l9rR8YtE63qWsVfthRm5Av4cQbkbnPLhWBGZ4l6zLr2Zptrj5tkabAFzz/hvPU1zrFzbLQwdTFW80Z2MqplQ+fx7nNC5+B/lmjFoI2JpwB+9Z+r/PTzAz/U92jDZhcWG1hDOcvw+e7pTUXAUcsn7LGKCnfki+tcaz4lE2Yp80eZzSiJJUBmgTENsgHuE9+kJ86Dsfib4SUEVLojYbMPpmTRAiK0IUNQL5t/xLk86zKtSqEyFmWO+djceaNrGJL3iA1dsUg1CySoJkwdz4M/CoSR89feJTkWyvbLG3zg3Th3Tuy2whNgWkG1D/ucU88CZ9BevUwfO4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?D3+WdEya5VbE6cktZ8FXKj41PL84letNN9Rcab41KLLY5J212kN+lSXk8ngX?=
 =?us-ascii?Q?SrKKSyAJ9OlhSOxSK8Oe8hRIj1ZDMAyBlD3amyxZzEMmFORs5NjBBUS5u2oJ?=
 =?us-ascii?Q?xC5+DYxXvuwpd4ds6jKWxzBhYikfUqLStnxbspzrDcBpl7a11cXa9TeTtAsf?=
 =?us-ascii?Q?/rIp9OtWgHnSFyYgyEysDLrl0eZwP4tmTcaEk6ctX98VylTmHmn6c5gl0Arp?=
 =?us-ascii?Q?9dPm28/V1YJt7Trb9+3HizBXjLefXnH+l3AUIGIjDNtKfEpNV9JRzEjTPG1S?=
 =?us-ascii?Q?uih+HuPfiJSyQoOcEV8FvTyVWN2Hs5LeomAAGPP38jFrprZJN+vyO5oOL/MI?=
 =?us-ascii?Q?4D8CRAcuRLrrreeZpKY9uiZ/M19X64W5Nbq3pXQP+lw1En0giifkvl8g3mZh?=
 =?us-ascii?Q?LWDg1rTpppZkhYtHBXAOL3Dgt6H+3oOw0Dck3DDr4lw9MWjS/AgbIFDL/91s?=
 =?us-ascii?Q?bu9oIkpuIXNTFTvudSpQcP69qXPBR74Ym9VifqED/XvWvTrX7r2oaMvG1FET?=
 =?us-ascii?Q?Hwi3xfCYEbIOgDjZ3eOIiydeh/yfoLeJ+NG4Mw7dm3xqGQN6ESIP82YMQJ2F?=
 =?us-ascii?Q?CgYVUqaffTcuw/BT+n0SxPSinCvMIXXnFUY5lp4euY+o9wQNRBLyhMlsgrMX?=
 =?us-ascii?Q?jnR/nzDmimsJPQRNVb7nl95nQtBCg5c6FG5a2umhONePKRbGqNHIB3E6WqDc?=
 =?us-ascii?Q?R3c0fLT+IBaeGYsbYflgBUYuo0RqREKvJZhLGBIVH2ANjySSOAib4SxYi2XH?=
 =?us-ascii?Q?aK5mwD5NxjRt5v0liyGHxtJNImDsHTu3iMoL5dlTwXNTJEQ9OIaBBD1PqRxP?=
 =?us-ascii?Q?QiW+CEnHjMV8woGwybpVegdbZFEhVjiVRPf3ZIUQv84taITTTC+oUxQZ7VE5?=
 =?us-ascii?Q?QYdyWHS5A5R9oZxHaZ9eU3rY2MFBgw/+sE71YA39M9ZYTh0zcCQe8BtyAssa?=
 =?us-ascii?Q?8F8CDD4EO4NZi81xOMGq4d4O0S9IlqtVgMaEK9xUXE6WYuQf6/PHSBCEKBsS?=
 =?us-ascii?Q?t7jQvTQMJ30Svn+NaBImHuxe6BtruDj8Ryb8SSX8ayOK3WBFCu5ss9IuefVk?=
 =?us-ascii?Q?ULx4Q7KEpGOXPgCWu79gdT1WHEyUzWPDjJYS7R2IUw0ney3XKJPgI0quLkD4?=
 =?us-ascii?Q?fJpWVntPOGQq+rIXheyCbOE5byM6h9WZmWWZcjX/gw/fU9nt8ZIg3TRRFsDO?=
 =?us-ascii?Q?D4aTQm/u0qnBxO4fJXUYcZ4qdg+ABhBqQAIrnO2rZqdDb5hxqMuVYqAaFbVj?=
 =?us-ascii?Q?Thum0iSI87NSXR8WdvUibO/PvOKiWYwacqJdrZsdmoKrjmF5f/XSwWJv+xts?=
 =?us-ascii?Q?A3WWDHPFPkW39iX/vPRsx/Vi2EPstPJTRwle/oiVDaNXS1BKCbARFfscVDPQ?=
 =?us-ascii?Q?0LHA+ML/3d17NYRjEiYad04AWEElRpxuH+M1bh8EUkhN4YnuqWCP6ByHl5wz?=
 =?us-ascii?Q?E/B3FLlpU3CUCs33vEjoDau8pgY0ecfowaaGf2lvrq7ERfENEy509ltuFHKI?=
 =?us-ascii?Q?EC8TWnzwFYcGmDlbEn4Z3VpKeRQEVgSApxCHlsSIOCrTo16Ef3OlHvRRKn1M?=
 =?us-ascii?Q?Gs+QI/AHghUrblW5wyo0rTPTAeM7gn9/YtFVoujwtJkcHppx2xyqMfS7aSuM?=
 =?us-ascii?Q?9J9LGrRpt1uOZ9ZOKoo4f4QjTI7ec1hj589i8bzRs746yaD+pdPcSaD6Spj6?=
 =?us-ascii?Q?eQaeXDs0j7+X1P/t88YGQjwMIRUqdm83jhu/BwQd9J4WbIeLhIGVEcLYmL6y?=
 =?us-ascii?Q?Sd4vtj2qKQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104af64b-0782-45c4-c36c-08deded75091
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:02:28.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sLkAewtUseumqNbq6flPZcvZBV0LnNjTWo2XsY6Zu+MgReongFDho451Gd9geakd/HdAc4w4bL1/haT6N6WvCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7244

On Fri, Jul 10, 2026 at 03:26:42AM +0530, Shrikanth Hegde wrote:
> Actively push out task running on a non-preferred CPU. Since the task is
> running on the CPU, need to stop the cpu and push the task out.
> However, if the task is pinned only to non-preferred CPUs, it will continue
> running there. This will help in maintaining the userspace affinities
> unlike CPU hotplug or isolated cpusets.
> 
> Though code is similar to  __balance_push_cpu_stop and quite close to
> push_cpu_stop, it is being kept separate as it provides a cleaner
> implementation with CONFIG_PREFERRED_CPU.
> 
> Add push_task_work_done flag to protect work buffer.
> Works only with FAIR class.
> 
> For now, only current running task is pushed out. This keeps the code
> simpler. In future optimization maybe done to move all the queued
> task on the rq.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v6->v7:
> - Moved is_migration_disabled
> - removed fair class check 
> 
>  kernel/sched/core.c  | 78 ++++++++++++++++++++++++++++++++++++++++++++
>  kernel/sched/sched.h |  8 +++++
>  2 files changed, 86 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9e8eec4451b6..74c93a88bf84 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5774,6 +5774,9 @@ void sched_tick(void)
>  	unsigned long hw_pressure;
>  	u64 resched_latency;
>  
> +	if (!cpu_preferred(cpu))
> +		sched_push_current_non_preferred_cpu(rq);
> +
>  	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
>  		arch_scale_freq_tick();
>  
> @@ -11292,3 +11295,78 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  		p->sched_class->prio_changed(rq, p, ctx->prio);
>  	}
>  }
> +
> +#ifdef CONFIG_PREFERRED_CPU
> +static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
> +
> +static int sched_non_preferred_cpu_push_stop(void *arg)
> +{
> +	struct task_struct *p = arg;
> +	struct rq *rq = this_rq();
> +	struct rq_flags rf;
> +	int cpu;
> +
> +	/* sanity checks and clear */
> +	if (cpu_preferred(rq->cpu) || is_migration_disabled(p)) {
> +		scoped_guard(rq_lock, rq)
> +			rq->push_task_work_done = false;
> +		put_task_struct(p);
> +		return 0;
> +	}
> +
> +	raw_spin_lock_irq(&p->pi_lock);
> +
> +	/* This could take rq lock. So call it before rq lock is taken */
> +	cpu = select_fallback_rq(rq->cpu, p);
> +	rq_lock(rq, &rf);
> +	rq->push_task_work_done = false;
> +	update_rq_clock(rq);
> +
> +	context_unsafe_alias(rq);
> +
> +	if (task_rq(p) == rq && task_on_rq_queued(p))
> +		rq = __migrate_task(rq, &rf, p, cpu);
> +
> +	rq_unlock(rq, &rf);
> +	raw_spin_unlock_irq(&p->pi_lock);
> +	put_task_struct(p);
> +
> +	return 0;
> +}
> +
> +/*
> + * Push the current task running on non-preferred CPU(npc).
> + * Using this non preferred CPU will lead to more vCPU preemptions
> + * in the host. So it is better not to use this CPU.
> + *
> + * Since task is running, call a stopper to push the task out. This is
> + * similar to how task moves during hotplug. In select_fallback_rq a
> + * preferred CPU will be chosen and henceforth task shouldn't come back to
> + * this CPU again.
> + *
> + * Works for FAIR class only
> + *
> + * If task is affined only non-preferred CPUs, it can't be moved out
> + */
> +void sched_push_current_non_preferred_cpu(struct rq *rq)
> +{
> +	struct task_struct *push_task = rq->curr;
> +
> +	/* Don't push the task if task's affinity doesn't allow */
> +	if (!task_can_sched_on_preferred(rq->cpu, push_task))
> +		return;

Shouldn't you protect it with the rq lock against races with affinity or
policy changes? The task_can_sched_on_preferred() checks p->sched_class
and p->cpus_ptr.

> +
> +	/* There is already a stopper thread. Don't race with it. */
> +	if (rq->push_task_work_done)
> +		return;
> +
> +	/* sched_tick runs with interrupts disabled. */
> +	get_task_struct(push_task);
> +
> +	scoped_guard(rq_lock, rq)
> +		rq->push_task_work_done = true;
> +
> +	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
> +			    push_task, this_cpu_ptr(&npc_push_task_work));
> +}
> +#endif
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 6de6366f2faa..80c02e2c09eb 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1277,6 +1277,8 @@ struct rq {
>  
>  	struct list_head cfs_tasks;
>  
> +	bool			push_task_work_done;
> +
>  	struct sched_avg	avg_rt;
>  	struct sched_avg	avg_dl;
>  #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
> @@ -4242,4 +4244,10 @@ static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
>  	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
>  }
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +void sched_push_current_non_preferred_cpu(struct rq *rq);
> +#else	/* !CONFIG_PREFERRED_CPU */
> +static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
> +#endif
> +
>  #endif /* _KERNEL_SCHED_SCHED_H */
> -- 
> 2.47.3
