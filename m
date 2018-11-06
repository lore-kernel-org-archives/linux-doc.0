Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 879C07D8BB
	for <lwn-linux-doc@archive.lwn.net>; Tue,  6 Nov 2018 11:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730632AbeKFVGA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 6 Nov 2018 16:06:00 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51980 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730525AbeKFVGA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Nov 2018 16:06:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kFxUuHjpTxdn+Qfxz/i90rdrGYlXVZnA2uZTtMbZrV0=; b=CUAnfLXEDB7M65oP2yZiqICKv
        wt4SCNc9cR+YnL0IjaNZQrIl3uly8CxFCsTcRu5KP53AHW9BRvTmNFere2EPALbHKaCqTSdRppM69
        CZlALiKbuBW8//ugBMz5y73i9hQS1+MI28mJ25DlbW71KTPhlYGJKvHnDkW5L4HKWqgam5wW0F/m2
        QI/t0vJhtFHOcJ9s+qSQuXpgRMPiq09jul+FkUZPU/OipKZ8+bpP3txl4jlSZunf+5do631haSjXY
        yMUu4SBqpD1YsrSf2xwxOlsQTFtE+rS/35L8eM9ZTt6STMQbPxdPflXLno4IXhBY1qF+TF31OoPIN
        FtAyoKPTg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gJzjB-0001wL-48; Tue, 06 Nov 2018 11:41:01 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5CCC22029F9FF; Tue,  6 Nov 2018 12:40:55 +0100 (CET)
Date:   Tue, 6 Nov 2018 12:40:55 +0100
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
        Tom Hromatka <tom.hromatka@oracle.com>
Subject: Re: [PATCH v14 05/12] cpuset: Add an error state to
 cpuset.sched.partition
Message-ID: <20181106114055.GN22431@hirez.programming.kicks-ass.net>
References: <1539635377-22335-1-git-send-email-longman@redhat.com>
 <1539635377-22335-6-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1539635377-22335-6-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 15, 2018 at 04:29:30PM -0400, Waiman Long wrote:
> +			case PRS_ENABLED:
> +				if (update_parent_subparts_cpumask(cp,
> +					partcmd_update, NULL, tmp))
> +					update_tasks_cpumask(parent);
> +				break;

That code indenting had me go WTF a few times.
