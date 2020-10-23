Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F1AC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 17:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 977712192A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 17:53:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753874AbgJWRxq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 13:53:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:42880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753873AbgJWRxp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 13:53:45 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F13F120760;
        Fri, 23 Oct 2020 17:53:43 +0000 (UTC)
Date:   Fri, 23 Oct 2020 13:53:41 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 53/56] shed: fix kernel-doc markup
Message-ID: <20201023135341.450727fc@gandalf.local.home>
In-Reply-To: <21eac4426e02193aab877564f7d7d99114627a46.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
        <21eac4426e02193aab877564f7d7d99114627a46.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 23 Oct 2020 18:33:40 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Kernel-doc requires that a kernel-doc markup to be immediatly
> below the function prototype, as otherwise it will rename it.
> So, move sys_sched_yield() markup to the right place.
> 
> Also fix the cpu_util() markup: Kernel-doc markups
> should use this format:
>         identifier - description

The first change looks fine to me, but as I'm getting a new shed delivered
soon, I originally thought this email was about that delivery!

I do have a nit about the second change.

> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index aa4c6227cd6d..94386fcfafcf 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6287,7 +6287,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>  }
>  
>  /**
> - * Amount of capacity of a CPU that is (estimated to be) used by CFS tasks
> + * cpu_util - Amount of capacity of a CPU that is (estimated to be)
> + *	used by CFS tasks

The description is to be a single line. The line break is ugly, and the 80
col rule, is more of a guideline, and not something that *has* to be done.

Either shorten it, or just let it go a little longer.

-- Steve


>   * @cpu: the CPU to get the utilization of
>   *
>   * The unit of the return value must be the one of capacity so we can compare

