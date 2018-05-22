Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 37D007D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 13:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751317AbeEVNU4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 09:20:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:54214 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751199AbeEVNUz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 22 May 2018 09:20:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 233827C6C4;
        Tue, 22 May 2018 13:20:55 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-182.bos.redhat.com [10.18.17.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D4D6C2140619;
        Tue, 22 May 2018 13:20:53 +0000 (UTC)
Subject: Re: [PATCH v8 2/6] cpuset: Add new v2 cpuset.sched.domain flag
To:     Juri Lelli <juri.lelli@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-3-git-send-email-longman@redhat.com>
 <20180522125750.GA31040@localhost.localdomain>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <1ad1c5ad-bb78-7d26-682f-a5dd8cf05a61@redhat.com>
Date:   Tue, 22 May 2018 09:20:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180522125750.GA31040@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 22 May 2018 13:20:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 22 May 2018 13:20:55 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/22/2018 08:57 AM, Juri Lelli wrote:
> Hi,
>
> On 17/05/18 16:55, Waiman Long wrote:
>
> [...]
>
>>  /**
>> + * update_isolated_cpumask - update the isolated_cpus mask of parent cpuset
>> + * @cpuset:  The cpuset that requests CPU isolation
>> + * @oldmask: The old isolated cpumask to be removed from the parent
>> + * @newmask: The new isolated cpumask to be added to the parent
>> + * Return: 0 if successful, an error code otherwise
>> + *
>> + * Changes to the isolated CPUs are not allowed if any of CPUs changing
>> + * state are in any of the child cpusets of the parent except the requesting
>> + * child.
>> + *
>> + * If the sched_domain flag changes, either the oldmask (0=>1) or the
>> + * newmask (1=>0) will be NULL.
>> + *
>> + * Called with cpuset_mutex held.
>> + */
>> +static int update_isolated_cpumask(struct cpuset *cpuset,
>> +	struct cpumask *oldmask, struct cpumask *newmask)
>> +{
>> +	int retval;
>> +	int adding, deleting;
>> +	cpumask_var_t addmask, delmask;
>> +	struct cpuset *parent = parent_cs(cpuset);
>> +	struct cpuset *sibling;
>> +	struct cgroup_subsys_state *pos_css;
>> +	int old_count = parent->isolation_count;
>> +	bool dying = cpuset->css.flags & CSS_DYING;
>> +
>> +	/*
>> +	 * Parent must be a scheduling domain with non-empty cpus_allowed.
>> +	 */
>> +	if (!is_sched_domain(parent) || cpumask_empty(parent->cpus_allowed))
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * The oldmask, if present, must be a subset of parent's isolated
>> +	 * CPUs.
>> +	 */
>> +	if (oldmask && !cpumask_empty(oldmask) && (!parent->isolation_count ||
>> +			!cpumask_subset(oldmask, parent->isolated_cpus))) {
>> +		WARN_ON_ONCE(1);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * A sched_domain state change is not allowed if there are
>> +	 * online children and the cpuset is not dying.
>> +	 */
>> +	if (!dying && (!oldmask || !newmask) &&
>> +	    css_has_online_children(&cpuset->css))
>> +		return -EBUSY;
>> +
>> +	if (!zalloc_cpumask_var(&addmask, GFP_KERNEL))
>> +		return -ENOMEM;
>> +	if (!zalloc_cpumask_var(&delmask, GFP_KERNEL)) {
>> +		free_cpumask_var(addmask);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (!old_count) {
>> +		if (!zalloc_cpumask_var(&parent->isolated_cpus, GFP_KERNEL)) {
>> +			retval = -ENOMEM;
>> +			goto out;
>> +		}
>> +		old_count = 1;
>> +	}
>> +
>> +	retval = -EBUSY;
>> +	adding = deleting = false;
>> +	if (newmask)
>> +		cpumask_copy(addmask, newmask);
>> +	if (oldmask)
>> +		deleting = cpumask_andnot(delmask, oldmask, addmask);
>> +	if (newmask)
>> +		adding = cpumask_andnot(addmask, newmask, delmask);
>> +
>> +	if (!adding && !deleting)
>> +		goto out_ok;
>> +
>> +	/*
>> +	 * The cpus to be added must be in the parent's effective_cpus mask
>> +	 * but not in the isolated_cpus mask.
>> +	 */
>> +	if (!cpumask_subset(addmask, parent->effective_cpus))
>> +		goto out;
>> +	if (parent->isolation_count &&
>> +	    cpumask_intersects(parent->isolated_cpus, addmask))
>> +		goto out;
>> +
>> +	/*
>> +	 * Check if any CPUs in addmask or delmask are in a sibling cpuset.
>> +	 * An empty sibling cpus_allowed means it is the same as parent's
>> +	 * effective_cpus. This checking is skipped if the cpuset is dying.
>> +	 */
>> +	if (dying)
>> +		goto updated_isolated_cpus;
>> +
>> +	cpuset_for_each_child(sibling, pos_css, parent) {
>> +		if ((sibling == cpuset) || !(sibling->css.flags & CSS_ONLINE))
>> +			continue;
>> +		if (cpumask_empty(sibling->cpus_allowed))
>> +			goto out;
>> +		if (adding &&
>> +		    cpumask_intersects(sibling->cpus_allowed, addmask))
>> +			goto out;
>> +		if (deleting &&
>> +		    cpumask_intersects(sibling->cpus_allowed, delmask))
>> +			goto out;
>> +	}
> Just got the below by echoing 1 into cpuset.sched.domain of a sibling with
> "isolated" cpuset.cpus. Guess you are missing proper locking about here
> above.
>
> --->8---
> [ 7509.905005] =============================
> [ 7509.905009] WARNING: suspicious RCU usage
> [ 7509.905014] 4.17.0-rc5+ #11 Not tainted
> [ 7509.905017] -----------------------------
> [ 7509.905023] /home/juri/work/kernel/linux/kernel/cgroup/cgroup.c:3826 cgroup_mutex or RCU read lock required!
> [ 7509.905026] 
>                other info that might help us debug this:
>
> [ 7509.905031] 
>                rcu_scheduler_active = 2, debug_locks = 1
> [ 7509.905036] 4 locks held by bash/1480:
> [ 7509.905039]  #0: 00000000bf288709 (sb_writers#6){.+.+}, at: vfs_write+0x18a/0x1b0
> [ 7509.905072]  #1: 00000000ebf23fc9 (&of->mutex){+.+.}, at: kernfs_fop_write+0xe2/0x1a0
> [ 7509.905098]  #2: 00000000de7c626e (kn->count#302){.+.+}, at: kernfs_fop_write+0xeb/0x1a0
> [ 7509.905124]  #3: 00000000a6a2bd9f (cpuset_mutex){+.+.}, at: cpuset_write_u64+0x23/0x140
> [ 7509.905149] 
>                stack backtrace:
> [ 7509.905156] CPU: 6 PID: 1480 Comm: bash Not tainted 4.17.0-rc5+ #11
> [ 7509.905160] Hardware name: LENOVO 30B6S2F900/1030, BIOS S01KT56A 01/15/2018
> [ 7509.905164] Call Trace:
> [ 7509.905176]  dump_stack+0x85/0xcb
> [ 7509.905187]  css_next_child+0x90/0xd0
> [ 7509.905195]  update_isolated_cpumask+0x18f/0x2e0
> [ 7509.905208]  update_flag+0x1f3/0x210
> [ 7509.905220]  cpuset_write_u64+0xff/0x140
> [ 7509.905230]  cgroup_file_write+0x178/0x230
> [ 7509.905244]  kernfs_fop_write+0x113/0x1a0
> [ 7509.905254]  __vfs_write+0x36/0x180
> [ 7509.905264]  ? rcu_read_lock_sched_held+0x6b/0x80
> [ 7509.905270]  ? rcu_sync_lockdep_assert+0x2e/0x60
> [ 7509.905278]  ? __sb_start_write+0x13e/0x1a0
> [ 7509.905283]  ? vfs_write+0x18a/0x1b0
> [ 7509.905293]  vfs_write+0xc1/0x1b0
> [ 7509.905302]  ksys_write+0x55/0xc0
> [ 7509.905317]  do_syscall_64+0x60/0x200
> [ 7509.905327]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [ 7509.905333] RIP: 0033:0x7fee4fdfe414
> [ 7509.905338] RSP: 002b:00007fff364a80a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [ 7509.905346] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fee4fdfe414
> [ 7509.905350] RDX: 0000000000000002 RSI: 000055eb12f93740 RDI: 0000000000000001
> [ 7509.905354] RBP: 000055eb12f93740 R08: 000000000000000a R09: 00007fff364a7c30
> [ 7509.905358] R10: 000000000000000a R11: 0000000000000246 R12: 00007fee500cd760
> [ 7509.905361] R13: 0000000000000002 R14: 00007fee500c8760 R15: 0000000000000002
> --->8---
>
> Best,
>
> - Juri
>
Thanks for the testing. I will fix that in the next version.

-Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
