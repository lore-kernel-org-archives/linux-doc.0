Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A23807D062
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:44:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754553AbeEaKo1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:44:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48294 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754311AbeEaKoZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WREf3ESta4uEybD9RMP7dluESP93K0Uhm/lUkF60ykE=; b=JEgbALcl9+R0g4uTQF6XTbnOZ
        YkPKCVZK7At7NTmyDYjZPNrOAB1T5EHhsMT2+SezDkW1r/txC+yUkO0eOwSeFn/qZW5RadpVuXvz/
        dCyO5EuknrKafTVZ7UVzo1C1GpiZV1k4aP3gjYX884zbVQGzF+xe6Pwt85f4Z8bwBfU8zsjSLxaZV
        G8aNm3h/mq9sIC4zhRRDMj4l9CHus2ZXpAlv1XzX3usvXjCb7mLDgwAL4eEpFbPJX/rOVjAW+6hcw
        iltINkgCilJ8BipIvzLCDbDUmPeSIZ/x6Vtv4fE/BHmb3YruDJodPT4QhwJhy+sRdvm2rfB+vQRqC
        MR06Stkfw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOL43-0003no-3J; Thu, 31 May 2018 10:44:15 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 411CE202ACE62; Thu, 31 May 2018 12:44:13 +0200 (CEST)
Date:   Thu, 31 May 2018 12:44:13 +0200
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
Subject: Re: [PATCH v9 3/7] cpuset: Add cpuset.sched.load_balance flag to v2
Message-ID: <20180531104413.GH12180@hirez.programming.kicks-ass.net>
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
> diff --git a/Documentation/cgroup-v2.txt b/Documentation/cgroup-v2.txt
> index e7534c5..681a809 100644
> --- a/Documentation/cgroup-v2.txt
> +++ b/Documentation/cgroup-v2.txt
> @@ -1542,6 +1542,32 @@ Cpuset Interface Files
>  	Further changes made to "cpuset.cpus" is allowed as long as
>  	the first condition above is still true.
>  
> +	A parent scheduling domain root cgroup cannot distribute all
> +	its CPUs to its child scheduling domain root cgroups

This I think wants to be in the previous patch

>                                                            unless
> +	its load balancing flag is turned off.

And this is indeed for here.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
