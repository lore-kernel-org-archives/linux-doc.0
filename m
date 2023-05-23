Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E95C7EE26
	for <linux-doc@archiver.kernel.org>; Tue, 23 May 2023 09:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235842AbjEWJXR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 May 2023 05:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235594AbjEWJXQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 May 2023 05:23:16 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38038E6
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 02:23:14 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-64d247a023aso3886690b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 23 May 2023 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684833794; x=1687425794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4HOxSRVzApR+fbfYRlO7PRlpChvkHSAVFcm4uggedBs=;
        b=iaEizCq0VZC4u5Q782TovPcJYy0mzXSh3W6Sk0W22Q+IN54LAhDeZ4HJjO668yQ9kU
         6QMBSelAOI/ocM7KF3w2hqiByjnTyucJVk1oTWAYoK+ZqSD00d6pTD5pMWieffLB+6b2
         N9/ppSzVN0UMd9fprtWTWNOHdrXvs++ir23PjChMfO1b/BZ6otdYxvTqaOjftGDihLiM
         Ij1l9C7umjE77Go13xepmKSwGJil/VMBi5pZsmAyXaHC0uDk8pxykzrcmXLCj2yAQo0u
         iqQaOV+ItLpQ4dMPGkRqkJS4rnNPbRMUm5ZuckC+ZPL/qxXdkLGmSoMFJuecj10621n4
         ZuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833794; x=1687425794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4HOxSRVzApR+fbfYRlO7PRlpChvkHSAVFcm4uggedBs=;
        b=T6arwy5Bko7Ri7s9YI52abJJu8ah+DCRVLB27vFg7KWzu7jLhEBp4PiPxMnxHUbszj
         yIqmWEn1Qojzpopt9wrtqnuBhkqZ7Q5kyLr8o+p5igJBjLRJxnLmQHKRigYpr6Xtrz9f
         bcmGkXoQGIH6R8UPocCLzU/BJI3sD/r723DAEK/IufKIPEmz4Qy0VA/FyDlsMnwls6ha
         HmXKGhgBHIbCQUjZpXeO3tJSy7kGZyKwBsXzjdq6xXWfhDm/fK3St8MECS84Rb4Nh4Cp
         Lh9k/qgqYPFEA3hVaYBS5deQlqbv3SvNTqr7xTVMJEOPXls5JvdpaTkICVNEuSckHT2q
         X4EA==
X-Gm-Message-State: AC+VfDyF4ixIxN1uF8s0PQ2/XG4KNBTqQ424hY2Rs9CKExf14NIM6h/+
        B0ojtm0ZdJKOndsfNASpLLiJSEr8USpTippW1b5KiQ==
X-Google-Smtp-Source: ACHHUZ5fiQT4DuQNkuyic2VbhzXC8m+KqeEYi6rdxbT+J5NY7Mnv2b78Rt10tVJYmpfcZQsHtIxxVuwOSMFE1g+c+QU=
X-Received: by 2002:a05:6a20:12c7:b0:10c:41a6:ac1f with SMTP id
 v7-20020a056a2012c700b0010c41a6ac1fmr3546948pzg.16.1684833793507; Tue, 23 May
 2023 02:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230505152440.142265-1-hongyan.xia2@arm.com> <20230518113000.pvboekaba7vspjyn@airbuntu>
 <8035fedb-820b-2a98-a1af-3a4a8971bcd1@arm.com>
In-Reply-To: <8035fedb-820b-2a98-a1af-3a4a8971bcd1@arm.com>
From:   Vincent Guittot <vincent.guittot@linaro.org>
Date:   Tue, 23 May 2023 11:23:02 +0200
Message-ID: <CAKfTPtAmV-0+2D5d8-CyQcowaFhWCB=C5xEUoEb0g1ObpmdegQ@mail.gmail.com>
Subject: Re: [PATCH] sched/documentation: elaborate on uclamp limitations
To:     Hongyan Xia <hongyan.xia2@arm.com>
Cc:     Qais Yousef <qyousef@layalina.io>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 18 May 2023 at 14:42, Hongyan Xia <hongyan.xia2@arm.com> wrote:
>
> Hi Qais,
>
> On 2023-05-18 12:30, Qais Yousef wrote:
> > Please CC sched maintainers (Ingo + Peter) next time as they should pick this
> > up ultimately and they won't see it from the list only.
>
> Will do. I was using the get_maintainers script and I thought that gave
> me all the CCs.
>
> > On 05/05/23 16:24, Hongyan Xia wrote:
> >> The story in 5.2 about util_avg abruptly jumping from 300 when
> >> Fmax/Fmin == 3 to 1024 when Fmax/Fmin == 4 hides some details about how
> >> clock_pelt works behind the scenes. Explicitly mention it to make it
> >> easier for readers to follow.
> >>
> >> Signed-off-by: Hongyan Xia <hongyan.xia2@arm.com>
> >> Cc: Qais Yousef <qyousef@layalina.io>
> >> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> >> ---
> >>   Documentation/scheduler/sched-util-clamp.rst | 17 +++++++++++++++++
> >>   1 file changed, 17 insertions(+)
> >>
> >> diff --git a/Documentation/scheduler/sched-util-clamp.rst b/Documentation/scheduler/sched-util-clamp.rst
> >> index 74d5b7c6431d..524df07bceba 100644
> >> --- a/Documentation/scheduler/sched-util-clamp.rst
> >> +++ b/Documentation/scheduler/sched-util-clamp.rst
> >> @@ -669,6 +669,19 @@ but not proportional to Fmax/Fmin.
> >>
> >>           p0->util_avg = 300 + small_error
> >>
> >> +The reason why util_avg is around 300 even though it runs for 900 at Fmin is:

What does it mean running for 900 at Fmin ? util_avg is a ratio in the
range [0:1024] without time unit

> >> +Although running at Fmin reduces the rate of rq_clock_pelt() to 1/3 thus
> >> +accumulates util_sum at 1/3 of the rate at Fmax, the clock period
> >> +(rq_clock_pelt() now minus previous rq_clock_pelt()) in:
> >> +
> >> +::
> >> +
> >> +        util_sum / clock period = util_avg

I don't get the meaning of the formula above ? There is no "clock
period" (although I'm not sure what it means here) involved when
computing util_avg

Also, there is no linear relation between util_avg and Fmin/Fmax
ratio. Fmin/Fmax ratio is meaningful in regards to the ratio between
running time and period time of a periodic task. I understand the
reference of pelt in this document as a quite simplified description
of PELT so I'm not sure that adding a partial explanation will help.
It will probably cause more confusion to people. The only thing that
is sure, is that PELT expects some idle time to stay fully invariant
for periodic task

> >> +
> >> +does not shrink to 1/3, since rq->clock_pelt is periodically synchronized with
> >> +rq->clock_task as long as there's idle time. As a result, we get util_avg of
> >> +about 300, not 900.
> >> +
> >
> > I feel neutral about these changes. It does answer some questions, but poses
> > more questions like what is clock_pelt. So we might end up in recursive
> > regression of explaining the explanation.
> >
> > I don't think we have a doc about clock_pelt. Worth adding one and just add
> > a reference to it from here for those interested in understanding more details
> > on why we need to go to idle to correct util_avg? I think our code has
> > explanation, a reference to update_rq_clock_pelt() might suffice too.
> >
> > Vincent, do you have an opinion here?
>
> Sounds reasonable. I don't mind drafting a doc or just a couple of
> paragraphs for clock_pelt (or all the different clocks like clock,
> clock_task, clock_idle_*), if that's what we can agree on.

I don't have a strong opinion on adding a doc on PELT.

>
> Hongyan
