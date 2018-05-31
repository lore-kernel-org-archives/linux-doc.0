Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4FA787D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 12:27:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754197AbeEaM1M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 08:27:12 -0400
Received: from merlin.infradead.org ([205.233.59.134]:40716 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754733AbeEaM1L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 08:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/Ce+GiR7f8GPC4RGWVw1eZ2W6p6qw4Zj6LdWA+OkGos=; b=FNpdfgbMukA15Vx+a9lGPG5I6
        /h/VcT6HbCUx+bKnqd0K14YdyePXKXi5ZqQMSH3+sPX5kPa6UEMM65pvOMX7plq7WuW7bSUais8rc
        tpNPycDJ0u3Bmz+2fY6ELDUtCHlupEhKytiSP2G6yM9iOFGzi9Z6UNAuOITDGK8Dcd2b5pdzInLxy
        gFMiDYp65xihE1D5vlcFTSdhXER8i6FPlgim4DvrBdmyxoYtN6jwPw6fqIS0qb/ZhCY7Px4hocNU1
        2vHyz/SHlK8D64RPnFh9pdTQ0lnrk2lfyMco6Dsz3jpNNiCsjFbCVxskRJ4dIAuXn0m4/bItpqxch
        v829q4Pwg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOMfI-00066h-Ay; Thu, 31 May 2018 12:26:50 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 931F5201EA7A1; Thu, 31 May 2018 14:26:38 +0200 (CEST)
Date:   Thu, 31 May 2018 14:26:38 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v9 3/7] cpuset: Add cpuset.sched.load_balance flag to v2
Message-ID: <20180531122638.GJ12180@hirez.programming.kicks-ass.net>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <1527601294-3444-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527601294-3444-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 29, 2018 at 09:41:30AM -0400, Waiman Long wrote:
> The sched.load_balance flag is needed to enable CPU isolation similar to
> what can be done with the "isolcpus" kernel boot parameter. Its value
> can only be changed in a scheduling domain with no child cpusets. On
> a non-scheduling domain cpuset, the value of sched.load_balance is
> inherited from its parent. This is to make sure that all the cpusets
> within the same scheduling domain or partition has the same load
> balancing state.
> 
> This flag is set by the parent and is not delegatable.

> +  cpuset.sched.domain_root
> +	A read-write single value file which exists on non-root
> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> +	either "0" (off) or "1" (on).  This flag is set by the parent
> +	and is not delegatable.
> +
> +	If set, it indicates that the current cgroup is the root of a
> +	new scheduling domain or partition that comprises itself and
> +	all its descendants except those that are scheduling domain
> +	roots themselves and their descendants.  The root cgroup is
> +	always a scheduling domain root.
> +
> +	There are constraints on where this flag can be set.  It can
> +	only be set in a cgroup if all the following conditions are true.
> +
> +	1) The "cpuset.cpus" is not empty and the list of CPUs are
> +	   exclusive, i.e. they are not shared by any of its siblings.
> +	2) The parent cgroup is also a scheduling domain root.
> +	3) There is no child cgroups with cpuset enabled.  This is
> +	   for eliminating corner cases that have to be handled if such
> +	   a condition is allowed.
> +
> +	Setting this flag will take the CPUs away from the effective
> +	CPUs of the parent cgroup.  Once it is set, this flag cannot
> +	be cleared if there are any child cgroups with cpuset enabled.
> +	Further changes made to "cpuset.cpus" is allowed as long as
> +	the first condition above is still true.
> +
> +	A parent scheduling domain root cgroup cannot distribute all
> +	its CPUs to its child scheduling domain root cgroups unless
> +	its load balancing flag is turned off.
> +
> +  cpuset.sched.load_balance
> +	A read-write single value file which exists on non-root
> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> +	either "0" (off) or "1" (on).  This flag is set by the parent
> +	and is not delegatable.  It is on by default in the root cgroup.
> +
> +	When it is on, tasks within this cpuset will be load-balanced
> +	by the kernel scheduler.  Tasks will be moved from CPUs with
> +	high load to other CPUs within the same cpuset with less load
> +	periodically.
> +
> +	When it is off, there will be no load balancing among CPUs on
> +	this cgroup.  Tasks will stay in the CPUs they are running on
> +	and will not be moved to other CPUs.
> +
> +	The load balancing state of a cgroup can only be changed on a
> +	scheduling domain root cgroup with no cpuset-enabled children.
> +	All cgroups within a scheduling domain or partition must have
> +	the same load balancing state.	As descendant cgroups of a
> +	scheduling domain root are created, they inherit the same load
> +	balancing state of their root.

I still find all that a bit weird.

So load_balance=0 basically changes a partition into a
'fully-partitioned partition' with the seemingly random side-effect that
now sub-partitions are allowed to consume all CPUs.

The rationale, only given in the Changelog above, seems to be to allow
'easy' emulation of isolcpus.

I'm still not convinced this is a useful knob to have. You can do
fully-partitioned by simply creating a lot of 1 cpu parititions.

So this one knob does two separate things, both of which seem, to me,
redundant.

Can we please get better rationale for this?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
