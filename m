Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AFAC433E1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 22:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78EF061A42
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 22:02:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhCYV7l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 17:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCYV7F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 17:59:05 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D246C061760
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 14:59:05 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id g24so2903499qts.6
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 14:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8cwwbYqI+w00egCRCaNukq5DD3eWu7cnLa6VwLpjfl8=;
        b=iemGxUmO/N4+jYKKQX84i4qZHfAOjZ0sMxwEel3eFqXs0Le6ITeV/cBJkmMSijBW2Z
         SFZiF2c1K8SuXOa3Qi6l3FJqOcitfGQy7fSOPr04QhCcBGtOsX9e4qSTptdt/gbUxIJk
         oW5NHHV0nMxRaarldrMeEo8dRLYlryB2JZNTsxNCRLaJ4qpp5vAjMSt3fanGqtWP4pYq
         cdrc47Nerpk59SO3uM8OzvBMZrJwGo9LwBa3K4nEZAacJs+Uzc7iDMsAY4iaEw90rrtN
         SlTnny6qvBpkNv3UFeBVtepTAUIhtcn2tFMk6/Z4Mu8VD3BVFlg6DU8W0MPViCPLOrfW
         bb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8cwwbYqI+w00egCRCaNukq5DD3eWu7cnLa6VwLpjfl8=;
        b=krk2ZEvLf771gULWerznaYkRUi2rYSZ/XHvI3Vw2hfBlrHPROjVsRQ8yA+8fk0Ar+t
         aO5rYEanLKQY5EzSmcs8qNB+g2HBaYWe7NilyHidy8MAlhCeAv25V0kUiT+S8ylTFWHm
         ev817WlOBmalZimRrZ/nc8Xvv/quAfwz+CVjpnao5SHAMAPQ8AgpEtswJGfm0OpX2BfU
         eUAAOesCTU0AgsEZRhM+JhM4xVQSshIbKoyKzD0xo9RC3eAG1Z64pJ9hRT4vEPfH9xR3
         cmgmdflsc2RX84bN/lwIvUusMvYbYPANL538F8qPSYFVV3z+aeUhT5DIsaGGftA225O6
         8DfQ==
X-Gm-Message-State: AOAM5320SZVKOllkPMo6rg78XrnlSfWRcugw06ziIynhVnw0sFne/Sja
        z5c5/yyDM4/Yg1yQ/g9IfoUo4/42vv3AHY/qHr2NIw==
X-Google-Smtp-Source: ABdhPJwuyB5h6povrFbiMjtqMOpCb6E8TBZ5NJvyyB9321D1vLDelW47KKU1IDrskoNZDpQoWnbS4JsCSuGMyJpMjdA=
X-Received: by 2002:a05:622a:114:: with SMTP id u20mr9595291qtw.317.1616709543891;
 Thu, 25 Mar 2021 14:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210323035706.572953-1-joshdon@google.com> <YFsIZjhCFbxKyos3@hirez.programming.kicks-ass.net>
 <YFsaYBO/UqMHSpGS@hirez.programming.kicks-ass.net> <20210324114224.GP15768@suse.de>
 <YFssoD5NDl6dFfg/@hirez.programming.kicks-ass.net> <20210324133916.GQ15768@suse.de>
 <YFtOXpl1vWp47Qud@hirez.programming.kicks-ass.net> <20210324155224.GR15768@suse.de>
In-Reply-To: <20210324155224.GR15768@suse.de>
From:   Josh Don <joshdon@google.com>
Date:   Thu, 25 Mar 2021 14:58:52 -0700
Message-ID: <CABk29Nu7rR=_enuU8ecogtwCU3E4ygP0m+nmBH-KqKTRzDCe=A@mail.gmail.com>
Subject: Re: [PATCH v2] sched: Warn on long periods of pending need_resched
To:     Mel Gorman <mgorman@suse.de>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        David Rientjes <rientjes@google.com>,
        Oleg Rombakh <olegrom@google.com>, linux-doc@vger.kernel.org,
        Paul Turner <pjt@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> On Wed, Mar 24, 2021 at 01:39:16PM +0000, Mel Gorman wrote:
> I'm not going to NAK because I do not have hard data that shows they must
> exist. However, I won't ACK either because I bet a lot of tasty beverages
> the next time we meet that the following parameters will generate reports
> if removed.
>
> kernel.sched_latency_ns
> kernel.sched_migration_cost_ns
> kernel.sched_min_granularity_ns
> kernel.sched_wakeup_granularity_ns
>
> I know they are altered by tuned for different profiles and some people do
> go the effort to create custom profiles for specific applications. They
> also show up in "Official Benchmarking" such as SPEC CPU 2017 and
> some vendors put a *lot* of effort into SPEC CPU results for bragging
> rights. They show up in technical books and best practice guids for
> applications.  Finally they show up in Google when searching for "tuning
> sched_foo". I'm not saying that any of these are even accurate or a good
> idea, just that they show up near the top of the results and they are
> sufficiently popular that they might as well be an ABI.

+1, these seem like sufficiently well-known scheduler tunables, and
not really SCHED_DEBUG.
