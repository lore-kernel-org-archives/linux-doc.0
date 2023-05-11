Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E436FC7EE22
	for <linux-doc@archiver.kernel.org>; Thu, 11 May 2023 18:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238875AbjEKSz4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 May 2023 14:55:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238853AbjEKSzx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 May 2023 14:55:53 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA8149CC
        for <linux-doc@vger.kernel.org>; Thu, 11 May 2023 11:55:52 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-38dfbbfe474so2903132b6e.0
        for <linux-doc@vger.kernel.org>; Thu, 11 May 2023 11:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitbyteword.org; s=google; t=1683831351; x=1686423351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWM1jp+eGvaqbsAh0eljWb7kApkfVmgcMHgGBYQZHSA=;
        b=GgloZoW20h5o6vrR1LE41TasgCd5QxHVF4k+Yg8PDrsYtPXvGiyKNlzekAFTv1Burv
         kp1qiAXhTQJQumU00gqBboSeP+CqWLRCBksA3U44VRfpjbez66PefpE0DjmCcc+z1lm2
         elyKq5Ehhqeoy6DsHwLIAxeLRQnXKJm3H0K4nV0eRK73w25GJBYlNOge/+4gsahweYfV
         Kp1GHbHC3fspqw9LsE/v/PG+wSb3vdIPTn9u4vNf88lhAtQqnsmgYUP8gJ1wcamgpVjZ
         8kPR9v6MuN+ilshxJ1HvhurI9G0ILD+Fk5O9c9aA5YgJAR4tOiW2YoqgybcYYY5UUvKI
         d68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683831351; x=1686423351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWM1jp+eGvaqbsAh0eljWb7kApkfVmgcMHgGBYQZHSA=;
        b=TK5HsPlJg/B4WKUJCQyBEbLr+SzT7t1mnDLSzXQL500qCnFJSdUqi4NzQWqa/IlTZA
         GLBVE/DGsmCGgAa26xpKBJiMOM6SgemGGWxtNjKZFBkW8ixpslCDjM/OHpLLaVDwRvHb
         gmVL5kPP4BL8ORW9+VDYKsCY4AVLCmruLu4GG1DfcbQXTuaKjJhDGrmyfiYLV/Ii8qSI
         Z+N7L8QMUny8tDrYdOpRWLc0kzdRQ1Ui+wHyuQ26+ta9JrVTnUbGQI+1+0Ci0xgKIzGC
         oIo9gd96GSjGQe4RoZEj1ZMfUM1HgMVyUGYzo+ZOSZXWYc8DXkZmC1nhxni7qKTL3TcF
         0wAw==
X-Gm-Message-State: AC+VfDzHcQ8e4j6oPpXr2fRM/GIgxPa9hZkSstn05RjfYfMZ8IKJWU9A
        msOvRUdzHm2uixkQ0cALAVkv5y5Mo5bS/fk4uK8Jxg==
X-Google-Smtp-Source: ACHHUZ4ZDemwFdKa6QBjBELIU5y8cF6okicN9YUVEbfjUx++crs5h184yLAhqdbTqoBfz4gOEBGMT31VW7zAEiQ9mP0=
X-Received: by 2002:a05:6808:6087:b0:38f:76d7:38cb with SMTP id
 de7-20020a056808608700b0038f76d738cbmr5025661oib.0.1683831351468; Thu, 11 May
 2023 11:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230511014625.3443409-1-vineeth@bitbyteword.org> <CAEXW_YRjNAUXFD8rPQQ53Vu8j8ka=Z-WEZS54JXEroVH7TPVjg@mail.gmail.com>
In-Reply-To: <CAEXW_YRjNAUXFD8rPQQ53Vu8j8ka=Z-WEZS54JXEroVH7TPVjg@mail.gmail.com>
From:   Vineeth Remanan Pillai <vineeth@bitbyteword.org>
Date:   Thu, 11 May 2023 14:55:40 -0400
Message-ID: <CAO7JXPhnTWgqUYXBsGoczHC0RVJgsCHeKgVn+-cxtPkjspopMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] sched/deadline: Improve reclaim bandwidth accuracy
 for GRUB
To:     Joel Fernandes <joel@joelfernandes.org>
Cc:     luca.abeni@santannapisa.it, Juri Lelli <juri.lelli@redhat.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Joel,

On Thu, May 11, 2023 at 2:19=E2=80=AFAM Joel Fernandes <joel@joelfernandes.=
org> wrote:
>
> Hi Vineeth,
> Nice work. ;-) Few quick comments below:
>
Thanks :-)

> On Wed, May 10, 2023 at 6:46=E2=80=AFPM Vineeth Pillai <vineeth@bitbytewo=
rd.org> wrote:

> > This patch fixes the issue by appropriatley caping the max allowed
> > utilization and also slightly adjusting GRUB algorithm to account
> > for a mix of normal deadline and SCHED_FLAG_RECLAIM tasks.
>
> Looked at the patch quickly as I am due for bedtime ;-). I feel like
> this does more than should be done in one patch. So you should
> consider splitting it IMHO.
I think the explanatory comments are what makes this patch look huge.
The code changes are pretty small and simple:
- track bw of SCHED_RECLAIM_TASKS
- modify the reclamation equation.

> > According to the GRUB rule, the runtime is depreciated as a factor
> > of active bandwidth of the runqueue: "dq =3D -dt", where U is the
>
> Saying "dq =3D -dt" where U does not make sense because U is not in the
> equation ;-). Suggest rephrase.
>
Sorry about this, I will rephrase it.

>
> > active bandwidth. Also, we do not allocate the full bandwidth of a
> > cpu to deadline task, but only a portion(Umax) to it, so as to avoid
> > deadline tasks starving lower class tasks. The equation could be
> > re-written as "dq =3D -(U / Umax) * dt"
>
> Isn't the equation in the code right now as:
> dq =3D -max{ Ui / Umax, (1 - Uinact - Uextra) } dt
>
> ?
>
> That's what the kernel docs say [1].
>
> So what do you mean by "could be re-written" ?
>
> [1] https://docs.kernel.org/scheduler/sched-deadline.html
>
This patch uses a different equation than [1] and updated the kernel
doc as well in patch 2 of this series. I understand "re-written" is
confusing and will rephrase it.

> > Following are the results with this patch:
> >
> > RUN 1: runtime=3D7ms, deadline=3Dperiod=3D10ms, RT capacity =3D 95%
> > TID[616]: RECLAIM=3D1, (r=3D7ms, d=3D10ms, p=3D10ms), Util: 94.98
> > TID[616]: RECLAIM=3D1, (r=3D7ms, d=3D10ms, p=3D10ms), Util: 95.04
> > TID[616]: RECLAIM=3D1, (r=3D7ms, d=3D10ms, p=3D10ms), Util: 95.01
>
> All these look 100% correct to me. Do these tasks start at the same
> time or are they shifted in their respective activations? Just wanted
> to be sure it behaves the same either way...
>
I have tested both. Actually I tested 3 scenarios:
- Started the threads at the same time
- Started the threads separately (5-10 seconds apart)
- Started the threads at the same time with some of them sleeping for
  a while before spinning. This was to see if transition from
  NonContending to Inactive was showing any issues with this patch.

> > +static inline bool dl_entity_is_reclaim(const struct sched_dl_entity *=
dl_se)
> > +{
> > +       return dl_se->flags & SCHED_FLAG_RECLAIM;
> > +}
> > +
>
> Can this helper addition be split out to a different patch?
>
I feel it could go with this patch as the code changes in this patch
are fairly small and the function is trivial. But I can split it if
you feel that this patch is really huge and needs splitting.

> > +        * Maximum available bandwidth for this runqueue. This is used =
to
> > +        * calculate reclaimable bandwidth for SCHED_FLAG_RECLAIM tasks=
.
> > +        * By restricting maximum usable bandwidth, we aim to give othe=
r
> > +        * tasks on lower classes a chance to run, when competing with
> > +        * SCHED_FLAG_RECLAIM tasks.
> >          */
> > -       u64                     bw_ratio;
> > +       u64                     max_bw;
> > +
> > +       /*
> > +        * Active bandwidth of SCHED_FLAG_RECLAIM tasks on this rq.
> > +        * This will be a subset of running_bw.
> > +        */
> > +       u64                     reclaim_bw;
> > +
>
> And perhaps addition and use of these new fields if it makes sense.
>
> I will take a closer look at your patches later or after v2..
>
Thanks :-)

Vineeth
