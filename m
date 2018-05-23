Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C4A1C7D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 17:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933870AbeEWRe7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 13:34:59 -0400
Received: from foss.arm.com ([217.140.101.70]:59200 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932667AbeEWRe6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 May 2018 13:34:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 873751435;
        Wed, 23 May 2018 10:34:58 -0700 (PDT)
Received: from e110439-lin (e110439-lin.cambridge.arm.com [10.1.210.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC103F589;
        Wed, 23 May 2018 10:34:55 -0700 (PDT)
Date:   Wed, 23 May 2018 18:34:53 +0100
From:   Patrick Bellasi <patrick.bellasi@arm.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
Subject: Re: [PATCH v8 4/6] cpuset: Make generate_sched_domains() recognize
 isolated_cpus
Message-ID: <20180523173453.GY30654@e110439-lin>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-5-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526590545-3350-5-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Waiman,

On 17-May 16:55, Waiman Long wrote:

[...]

> @@ -672,13 +672,14 @@ static int generate_sched_domains(cpumask_var_t **domains,
>  	int ndoms = 0;		/* number of sched domains in result */
>  	int nslot;		/* next empty doms[] struct cpumask slot */
>  	struct cgroup_subsys_state *pos_css;
> +	bool root_load_balance = is_sched_load_balance(&top_cpuset);
>  
>  	doms = NULL;
>  	dattr = NULL;
>  	csa = NULL;
>  
>  	/* Special case for the 99% of systems with one, full, sched domain */
> -	if (is_sched_load_balance(&top_cpuset)) {
> +	if (root_load_balance && !top_cpuset.isolation_count) {

Perhaps I'm missing something but, it seems to me that, when the two
conditions above are true, then we are going to destroy and rebuild
the exact same scheduling domains.

IOW, on 99% of systems where:

   is_sched_load_balance(&top_cpuset)
   top_cpuset.isolation_count = 0

since boot time and forever, then every time we update a value for
cpuset.cpus we keep rebuilding the same SDs.

It's not strictly related to this patch, the same already happens in
mainline based just on the first condition, but since you are extending
that optimization, perhaps you can tell me where I'm possibly wrong or
which cases I'm not considering.

I'm interested mainly because on Android systems those conditions
are always true and we see SDs rebuilds every time we write
something in cpuset.cpus, which ultimately accounts for almost all the
6-7[ms] time required for the write to return, depending on the CPU
frequency.

Cheers Patrick

-- 
#include <best/regards.h>

Patrick Bellasi
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
