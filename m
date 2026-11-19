Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091664;
	b=N+gRSrV12C2AVSJvNpWYgnrY+vVPDiQbb3aL3h1I6rogWcGT+BFJGm5s6dtsMfKt2IaA
	 XvQhNp7FasZ4i/FjnYgwf5prwo0OSYzz5DhNG/52DfoiGLkhDjvOnVlpRnSjVjX0A7wbn
	 KrzWC4c6yz9Rw8PlTDmifI+2ECB7SKVO3aESh2RyhDGX2rPWdtQpoKbupmiub+emX4OAv
	 5yGWEGkrOp0a+TfNmbNOU6eBDdsgTMCUwH0B3nAPE0F/2oBa2AhXnBuZ4BEIZCsY9HgcS
	 izrnV/aaGJJv35GONM9eoPoJmb50SiuhKDWLuUJ8YmopeAkL9BqQFrinulwHlIaMPQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091664;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Y2iIZRnth8ulS1CILFLJPpfWCZaKVFy46FRP2EgLNVs=;
	b=NwOGgDupg3biJQsW4gqnyeHEvHPWTa79vcha5enNtBBxbPvr1wKtUT1OEPH8SV5ykuey
	 09Tz8aPyfaK/WrQHt+JtzWm0dkFycEm9vtkKORc8ylzG6NnCHvCr52ZW3AwQ/K494HV6t
	 uUZgcexpM5FpcJaLtXlInWecLiv8Gx5WQUh4kWQqMGcmNnJ42R+nbWSRaQpAaWmKVoPKD
	 JwrzGda2sS4KdUpiZH4nJuEo6fRjBTK36xxxpGIVoakGQ9oVkvivQlDb0QlOO+3k4t6ZQ
	 BQUUfNxPgtamLm/XCPmR/BqCdli6c60Cjo9oSz4H/NFVlgwWbe2vaTcxMGpDZeb5Qew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JPtUwDC+;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FCB606A331;
	Thu, 19 Nov 2026 12:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FCB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JPtUwDC+
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC081575;
	Thu, 19 Nov 2026 04:34:19 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 548AB3F673;
	Thu, 19 Nov 2026 04:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795091662; bh=jgZvlLC3w6JleU9YhsULtK81xMaX+XiPZ3AYAnGKI3c=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=JPtUwDC+a7nGjcyXudDcdkl+AC15nhCakJB5i/KhujMchpLNchTh85K44S/gKMbk1
	 EdVDczcN2N06FNHXsAdn13MWWNhfJVo/8jV7T0d1EO48EloE+Mi0hW43ATmKF9r3Ty
	 GkYUQSoCIwr58vYn+ihppR/83GBOt6rRTH/6Twe8=
Message-ID: <daa2a116-a767-42bc-a31f-f1da84e1eeae@arm.com>
Date: Thu, 19 Nov 2026 12:34:18 +0000
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] fs/resctrl: Stop the limbo handler while resctrl
 is unmounted
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, bp@alien8.de, tan.shaopeng@fujitsu.com,
 gshan@redhat.com, jic23@kernel.org, fenghuay@nvidia.com,
 zengheng4@huawei.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261119094858.813874-1-ruanjinjie@huawei.com>
 <20261119094858.813874-5-ruanjinjie@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261119094858.813874-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 19/11/2026 09:48, Jinjie Ruan wrote:
> A monitoring group's RMID is not returned to the free list when the
> group is removed. It stays in limbo until the cache occupancy still
> counted against it has dropped low enough for the RMID to be reused,
> which the limbo handler checks once a second.
> 
> The limbo handler keeps running after resctrl is unmounted, where there
> is nothing for it to achieve. An RMID is only allocated when a group is
> created, which needs resctrl to be mounted, so no RMID the limbo handler
> returns to the free list can be used before the next mount, and that
> mount can check them itself. The MBM overflow handler already stops for
> this reason once resctrl_mounted is cleared.
> 
> Reading the RMIDs in limbo while resctrl is unmounted is not safe on
> every architecture. On MPAM the counter of an RMID is selected by the
> CLOSID that owns it, and the CLOSID depends on the CDP state. Unmount
> clears the CDP state, so the limbo handler that keeps running reads the
> RMIDs freed under CDP through the CLOSIDs of the cleared state.
> 
> Stop the limbo handler while resctrl is unmounted, as the overflow
> handler does, and restart it after a mount on every domain that still
> has RMIDs in limbo. The worker can stay queued across the unmount, so
> cancel it before queuing it again.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org>
> ---
> v6:
> - Explain first why stopping the limbo handler is fine on every
>   architecture, and describe MPAM by CLOSID only (Reinette).
> - Rename resctrl_limbo_resume() to cqm_resume_limbo_handler() and declare
>   it with the other limbo handler helpers (Reinette).
> - Return early when the L3 resource is not mon_capable (Reinette).
> - Drop the stable version range, the Fixes tag already gives it.
> ---
>  fs/resctrl/internal.h |  2 ++
>  fs/resctrl/monitor.c  | 42 ++++++++++++++++++++++++++++++++++++++++--
>  fs/resctrl/rdtgroup.c |  2 ++
>  3 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 1c85e06f09bf..f52e0937702a 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -401,6 +401,8 @@ bool is_mba_sc(struct rdt_resource *r);
>  void cqm_setup_limbo_handler(struct rdt_l3_mon_domain *dom, unsigned long delay_ms,
>  			     int exclude_cpu);
>  
> +void cqm_resume_limbo_handler(void);
> +
>  void cqm_handle_limbo(struct work_struct *work);
>  
>  bool has_busy_rmid(struct rdt_l3_mon_domain *d);
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index ae9ddd380515..ede1708b920e 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -852,6 +852,13 @@ void cqm_handle_limbo(struct work_struct *work)
>  	 */
>  	mutex_lock(&rdtgroup_mutex);
>  
> +	/*
> +	 * If the filesystem has been unmounted this work no longer needs to
> +	 * run. cqm_resume_limbo_handler() restarts it on the next mount.
> +	 */
> +	if (!resctrl_mounted)
> +		goto out_unlock;
> +
>  	/*
>  	 * Ensure the worker is dedicated to a CPU as intended and not
>  	 * relocated by workqueue subsystem as part of CPU going offline.
> @@ -1001,8 +1008,8 @@ int setup_rmid_lru_list(void)
>  	/*
>  	 * Called on every mount, but the number of RMIDs cannot change
>  	 * after the first mount, so keep using the same set of rmid_ptrs[]
> -	 * until resctrl_exit(). Note that the limbo handler continues to
> -	 * access rmid_ptrs[] after resctrl is unmounted.
> +	 * until resctrl_exit(). Note that the RMIDs in limbo stay in limbo
> +	 * across an unmount and are checked again after the next mount.
>  	 */
>  	if (rmid_ptrs)
>  		return 0;
> @@ -1033,6 +1040,37 @@ int setup_rmid_lru_list(void)
>  	return 0;
>  }
>  
> +/**
> + * cqm_resume_limbo_handler() - Restart the limbo handler after a mount.
> + *
> + * The limbo handler stops while resctrl is unmounted. Restart it on every
> + * domain that still has RMIDs in limbo.
> + */
> +void cqm_resume_limbo_handler(void)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct rdt_l3_mon_domain *d;
> +
> +	lockdep_assert_cpus_held();
> +	lockdep_assert_held(&rdtgroup_mutex);
> +
> +	if (!r->mon_capable || !resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
> +		return;
> +
> +	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
> +				lockdep_is_cpus_held()) {

nit: Unnecessary line break.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> +		if (!has_busy_rmid(d))
> +			continue;
> +
> +		/*
> +		 * The unmount may have left the worker queued. Cancel it so
> +		 * it is queued again on a CPU picked now.
> +		 */
> +		cancel_delayed_work(&d->cqm_limbo);
> +		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
> +	}
> +}
> +
>  void free_rmid_lru_list(void)
>  {
>  	if (!resctrl_arch_mon_capable())
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 3312637fb514..c7c4f618208d 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3267,6 +3267,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  						   RESCTRL_PICK_ANY_CPU);
>  	}
>  
> +	cqm_resume_limbo_handler();
> +
>  	/*
>  	 * Ensure root remains accessible after mutex is unlocked so that
>  	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s

