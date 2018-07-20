Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A19337D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 16:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731792AbeGTR0i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 13:26:38 -0400
Received: from merlin.infradead.org ([205.233.59.134]:41730 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731583AbeGTR0i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 13:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xAc+QZuJtG4zHD2LbKoFxMFVM9j39N2b5KvwLuHdD04=; b=GmGxolEYIkn8eJ7VfTqcOs/7+
        FH/69wphSVLxIANNeCL7TUzgLPbxsuT2cD/16hpbcL5zbP4s0Tplpe9UdetvOPrZMjod5OGccjAqy
        VUh5sEyI1SASotQXAT5iY9lX3bJtVMI+hR9ZbWJ4LLQhzOP0yXthjHKTmNf2kAXzjXz3criPPQu1i
        vYPIFKIpeCU8EAC6PJH040Er1Qb46n1xAa6pLvX5HKD2yyWr522uTsCjdIfirwvufrYm5d0J9Bc/k
        HLa38qCskeK5PjpGaQ5B/Vfw5TA453P3e2IyAKt5bO7716yS5/orErIAJ4Y8q210qSe+Ar4wTwGd6
        lXTxn0Ocg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fgYP3-0006gs-Sd; Fri, 20 Jul 2018 16:37:14 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 110C520275F4C; Fri, 20 Jul 2018 18:37:12 +0200 (CEST)
Date:   Fri, 20 Jul 2018 18:37:12 +0200
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
Subject: Re: [PATCH v11 7/9] cpuset: Expose cpus.effective and mems.effective
 on cgroup v2 root
Message-ID: <20180720163712.GU2494@hirez.programming.kicks-ass.net>
References: <20180719135224.GE2494@hirez.programming.kicks-ass.net>
 <1107494a-9667-df58-dcac-9366e969dc3a@redhat.com>
 <20180719153045.GT72677@devbig577.frc2.facebook.com>
 <de6f931d-613a-3e6a-2a4d-0e49b3bfe2e5@redhat.com>
 <20180719165201.GU72677@devbig577.frc2.facebook.com>
 <20180720113121.GJ2476@hirez.programming.kicks-ass.net>
 <20180720114549.GY72677@devbig577.frc2.facebook.com>
 <20180720154454.GR2494@hirez.programming.kicks-ass.net>
 <20180720155613.GB1934745@devbig577.frc2.facebook.com>
 <4857a9db-ebf5-24f8-c42d-d795f5c75854@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4857a9db-ebf5-24f8-c42d-d795f5c75854@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 20, 2018 at 12:19:29PM -0400, Waiman Long wrote:
> I am not against the idea of making it hierarchical eventually. I am
> just hoping to get thing going by merging the patchset in its current
> form and then we can make it hierarchical in a followup patch.

Where's the rush? Why can't we do this right in one go?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
