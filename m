Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 279677D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 01:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726374AbeLRBPG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Dec 2018 20:15:06 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33964 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbeLRBPG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Dec 2018 20:15:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id j2so14219665wrw.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Dec 2018 17:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MtV8grmjLA0rwx3YhGhQj1UX/LL1RwYw0cDYDYDCZQ4=;
        b=HhtqGWhr4ELtOVTsQaCzl2jfH5UQSFbjJ7o0cQPu3tty6slMA5FrhcMyuWO1862TPC
         TovMgF0u9tuNUPWYSU3wBU+0sTAK7m7KKZ51S+rSpJNjy8Z5TEPt8HN2xJLke0aWMze2
         g6huHXJmZfpJgb82OUlb80GH6G72sXqfTLAkuFGOO8uML3Dw7NUlIwBiaAubDnk6GyiC
         RQxOzg3vvGHYzXPfDRWdgwrvpD3M3+HNrEUpI1oAKGR9FrpzlZ9mRzp4lf3qUM9Pij8v
         Uq/mmngb36fGkAijmpWMUx7rWM5WCXfaRx8ZyJokBUrz8Gt2kg+Fals6cH5C1wyK/Q4h
         qobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MtV8grmjLA0rwx3YhGhQj1UX/LL1RwYw0cDYDYDCZQ4=;
        b=ZgrBcxw+P+d7Cp+ERzS9ncs+XXNk26/61jy3flu1B3SpchuoyGF3hoWAMNOdDyjvcT
         Z/DleJxbMuXegSvzuqB2PFCAY7WOp73/kF363ll+yAeu2Te+M1kfqEmZYKOS1m+Lnfkc
         ztyoC3Csjq02ilTWOlzg+Ero4TMQw+dr/l41uvHx3gKoj0BhtELACI1KwB8txIJf38Z+
         MEQQx715u58dtgY3au9k82ix6vUm/ZOkHHD0DqJkGOotPMeDuAyx9YFADzFgmXsPIhUj
         qe2d0tNizy1mB+3AWGQnxkZYplXOi39hhwE3SjzD8BtF9dbP+hWG2wi/OT/cWnZyVXs8
         /keg==
X-Gm-Message-State: AA+aEWY4CyUNFpCH4rMBwEF0u3GQyUr9OhVmXEmong5MEmyaZfZPeEV2
        dfOO04/97JSnHlSNs/HES2DdSrRX2CDiuEP0QyJ0Vw==
X-Google-Smtp-Source: AFSGD/UgXuKn+3a1qdcEW43eWrLYEELDM6mjwQz2LqFVq3s3vrEjGagQxiaQO8dZFeEPY1t3L6G93/uIM6p4Fk1Pb1E=
X-Received: by 2002:a5d:4e82:: with SMTP id e2mr12163482wru.291.1545095704461;
 Mon, 17 Dec 2018 17:15:04 -0800 (PST)
MIME-Version: 1.0
References: <20181214171508.7791-1-surenb@google.com> <20181214171508.7791-5-surenb@google.com>
 <20181217155525.GC2218@hirez.programming.kicks-ass.net>
In-Reply-To: <20181217155525.GC2218@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 17 Dec 2018 17:14:53 -0800
Message-ID: <CAJuCfpHrQB7OtEC535=s4iJqwan17nAc-mbycV1aJ3RUQTWCPA@mail.gmail.com>
Subject: Re: [PATCH 4/6] psi: introduce state_mask to represent stalled psi states
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, lizefan@huawei.com,
        Johannes Weiner <hannes@cmpxchg.org>, axboe@kernel.dk,
        dennis@kernel.org, Dennis Zhou <dennisszhou@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 17, 2018 at 7:55 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Dec 14, 2018 at 09:15:06AM -0800, Suren Baghdasaryan wrote:
> > The psi monitoring patches will need to determine the same states as
> > record_times(). To avoid calculating them twice, maintain a state mask
> > that can be consulted cheaply. Do this in a separate patch to keep the
> > churn in the main feature patch at a minimum.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/psi_types.h |  3 +++
> >  kernel/sched/psi.c        | 29 +++++++++++++++++++----------
> >  2 files changed, 22 insertions(+), 10 deletions(-)
> >
> > diff --git a/include/linux/psi_types.h b/include/linux/psi_types.h
> > index 2cf422db5d18..2c6e9b67b7eb 100644
> > --- a/include/linux/psi_types.h
> > +++ b/include/linux/psi_types.h
> > @@ -53,6 +53,9 @@ struct psi_group_cpu {
> >       /* States of the tasks belonging to this group */
> >       unsigned int tasks[NR_PSI_TASK_COUNTS];
> >
> > +     /* Aggregate pressure state derived from the tasks */
> > +     u32 state_mask;
> > +
> >       /* Period time sampling buckets for each state of interest (ns) */
> >       u32 times[NR_PSI_STATES];
> >
>
> Since we spend so much time counting space in that line, maybe add a
> note to the Changlog about how this fits.

Will do.

> Also, since I just had to re-count, you might want to add explicit
> numbers to the psi_res and psi_states enums.

Sounds reasonable.

> > +             if (state_mask & (1 << s))
>
> We have the BIT() macro, but I'm honestly not sure that will improve
> things.

I was mimicking the rest of the code in psi.c that uses this kind of
bit masking. Can change if you think that would be better.
