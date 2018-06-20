Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A9D667D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 14:12:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752924AbeFTOMB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 10:12:01 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59604 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752827AbeFTOMA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 10:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fszqOchqOK3zF6lfDyZsNt7DpBDbt1prSdKz0mQ/Vac=; b=nkDEBr1v+wQdIXBAbpPMewwXH
        ikym0EHbvTkNrpgGatILlOzNxqC+wGfnKDkFb4wHzyaPlqAa9xIz4J78Te/1OviOBCq9cI1D2GEhe
        /EGBiryv3/kSnaFw3rmlz3+Bt3Y4cR2CWnsxiApROVEyuXTM1G6SfS5U74vh2JDS0gYDyqHRv+rMb
        dofvYdyJCCySf/dkTUDDqHOZ94YzSHPT5xYLOBPwIRF2Vpf6heUKyM2Af3giTr42MXqgDjxmRuhds
        7bT6v1NvJflu5WfF/AzGhqyuRgzphX7XZAUpa/voOKaMRSAPASzn6rDb3BhygM23vJXWpppjYALJy
        gpSoX7y+w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fVdpq-0000fS-FA; Wed, 20 Jun 2018 14:11:46 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 61DEA2029F1D5; Wed, 20 Jun 2018 16:11:44 +0200 (CEST)
Date:   Wed, 20 Jun 2018 16:11:44 +0200
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
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v10 3/9] cpuset: Simulate auto-off of sched.domain_root
 at cgroup removal
Message-ID: <20180620141144.GI2494@hirez.programming.kicks-ass.net>
References: <1529295249-5207-1-git-send-email-longman@redhat.com>
 <1529295249-5207-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529295249-5207-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 12:14:02PM +0800, Waiman Long wrote:
> @@ -1058,7 +1060,12 @@ static int update_reserved_cpumask(struct cpuset *cpuset,
>  	 * Check if any CPUs in addmask or delmask are in the effective_cpus
>  	 * of a sibling cpuset. The implied cpu_exclusive of a scheduling
>  	 * domain root will ensure there are no overlap in cpus_allowed.
> +	 *
> +	 * This check is skipped if the cpuset is dying.

Comments that state what the code does are mostly useless; please
explain _why_ if anything.

>  	 */
> +	if (dying)
> +		goto updated_reserved_cpus;
> +
>  	rcu_read_lock();
>  	cpuset_for_each_child(sibling, pos_css, parent) {
>  		if ((sibling == cpuset) || !(sibling->css.flags & CSS_ONLINE))
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
