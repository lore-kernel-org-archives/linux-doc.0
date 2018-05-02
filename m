Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 657F37E677
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 14:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751411AbeEBOCo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 10:02:44 -0400
Received: from merlin.infradead.org ([205.233.59.134]:56356 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751365AbeEBOCn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 10:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LM41facvwdAdcWlT+sVCARHogY3zOl1hiq5UQKcJaCY=; b=cUS4bgA6zI0xj359Td6zTURD0
        148vvFKWkWWDVGNThKgtvKFotDDGf3kPvLbQOQLD2b5gOnVp5/xFAMpOfIMLtpntPVMvGmC1Cnum8
        3dr6dJWyp/59YdX4QH/Rkp03xkYB1BQpL9hkQmQ846OrJ8nk+Pmk+GbQ5djourDJGt7rH1jAsv9ds
        XiiinU54TfAAjZfoy1UY7Ndf4SGvsoSV09KPExVWsrr16JXuchICDadPZoPn76cj/bAW30C9YGZ/3
        zas1FUXOI7sjpct3zEPtmNL5xRf/NULdNnSzOsizTB50S5QvC+JnQXgsjKYEetFZVwf5/SmgdiIL8
        /4b1ajwLg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fDsKy-0001Dn-4V; Wed, 02 May 2018 14:02:28 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id A6F3C2029FA14; Wed,  2 May 2018 16:02:26 +0200 (CEST)
Date:   Wed, 2 May 2018 16:02:26 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
Subject: Re: [PATCH v7 2/5] cpuset: Add cpuset.sched_load_balance to v2
Message-ID: <20180502140226.GU12217@hirez.programming.kicks-ass.net>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <1524145624-23655-3-git-send-email-longman@redhat.com>
 <20180502102416.GJ12180@hirez.programming.kicks-ass.net>
 <14d7604c-1254-1146-e2b6-23f4cc020b34@redhat.com>
 <20180502134225.GR12217@hirez.programming.kicks-ass.net>
 <94c80e1c-049d-6ec3-8e8c-40eb88d1341d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94c80e1c-049d-6ec3-8e8c-40eb88d1341d@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 02, 2018 at 09:47:00AM -0400, Waiman Long wrote:

> > I've read half of the next patch that adds the isolation thing. And
> > while that kludges around the whole root cgorup is magic thing, it
> > doesn't help if you move the above scenario on level down:
> >
> >
> > 	R
> >      /    \
> >    A        B
> >           /   \
> >         C       D
> >
> >
> > R: cpus=0-7, load_balance=0
> > A: cpus=0-1, load_balance=1
> > B: cpus=2-7, load_balance=0
> > C: cpus=2-3, load_balance=1
> > D: cpus=4-7, load_balance=1
> >
> >
> > Also, I feel we should strive to have a minimal amount of tasks that
> > cannot be moved out of the root group; the current set is far too large.
> 
> What exactly is the use case you have in mind with loading balancing
> disabled in B, but enabled in C and D? We would like to support some
> sensible use cases, but not every possible combinations.

Suppose A is your system group, and C and D are individual RT workloads
or something.

Or suppose B has siblings and each group at that level is a delegate to
a particular user/container. And the user/container in B happens to need
2 partitioned VMs or whatever.

The idea is the same in all the examples, you want to allow
sub-partitions.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
