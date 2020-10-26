Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC30C4363A
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 10:07:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40E2F222EC
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603706851;
	bh=oRd2QZwcb5kvNpN6vkk7OPKwRr2fGcwBASgsEzTaYvA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=W76WPZzpVm+4EboSv38yQ0B7P+eM/pLFW7s0FPTHQKQA+/GtQq7tSLqtlQjF5Et8m
	 M7mQX1oXl6frZXQTFGRqKYXXjj341dbTOFjTrSmkGP3IyJi3a+/CFIU8xD42o4d/Hg
	 c8v/1Z/ukDyBCB/wzMTtP1s9oW7CoGo8Kewa9il4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1769070AbgJZKHa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 06:07:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1768496AbgJZKHT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Oct 2020 06:07:19 -0400
Received: from coco.lan (ip5f5ad5a1.dynamic.kabel-deutschland.de [95.90.213.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8ACE320723;
        Mon, 26 Oct 2020 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603706838;
        bh=oRd2QZwcb5kvNpN6vkk7OPKwRr2fGcwBASgsEzTaYvA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TPv71Y5NKNxjMYIif68gFIjqobO5fdY6L9BaEwJBedVyaDLWrQoaDngZoQCtEwg3o
         B2+YfCA9bI17y/jzdCHJvb5ShDz81KP3GbFKIaPWAJGz5rVw06hSbNVlAby53bOqwi
         armEP65itz4B6iICAzPXmWu/pEfe3lW+vY28HAv8=
Date:   Mon, 26 Oct 2020 11:07:12 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>
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
Message-ID: <20201026110712.2f9cec69@coco.lan>
In-Reply-To: <20201023135341.450727fc@gandalf.local.home>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
        <21eac4426e02193aab877564f7d7d99114627a46.1603469755.git.mchehab+huawei@kernel.org>
        <20201023135341.450727fc@gandalf.local.home>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 23 Oct 2020 13:53:41 -0400
Steven Rostedt <rostedt@goodmis.org> escreveu:

> On Fri, 23 Oct 2020 18:33:40 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Kernel-doc requires that a kernel-doc markup to be immediatly
> > below the function prototype, as otherwise it will rename it.
> > So, move sys_sched_yield() markup to the right place.
> > 
> > Also fix the cpu_util() markup: Kernel-doc markups
> > should use this format:
> >         identifier - description  
> 
> The first change looks fine to me, but as I'm getting a new shed delivered
> soon, I originally thought this email was about that delivery!

:-)

> I do have a nit about the second change.
> 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index aa4c6227cd6d..94386fcfafcf 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -6287,7 +6287,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
> >  }
> >  
> >  /**
> > - * Amount of capacity of a CPU that is (estimated to be) used by CFS tasks
> > + * cpu_util - Amount of capacity of a CPU that is (estimated to be)
> > + *	used by CFS tasks  
> 
> The description is to be a single line. The line break is ugly, and the 80
> col rule, is more of a guideline, and not something that *has* to be done.
> 
> Either shorten it, or just let it go a little longer.

Agreed, but there are already some other descriptions over there that have
multiple lines[1]:

Anyway, on this specific case, I guess it can be easily shorten to
80 columns without losing anything. Would that work for you?

	/**
	 * cpu_util - Estimates the amount of capacity of a CPU used by CFS tasks.

Regards,
Mauro

[1] like this one:

	/**
	 * calculate_imbalance - Calculate the amount of imbalance present within the
	 *			 groups of a given sched_domain during load balance.
	 * @env: load balance environment
	 * @sds: statistics of the sched_domain whose imbalance is to be calculated.
	 */

