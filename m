Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A47BF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Jul 2019 17:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfG3RpF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Jul 2019 13:45:05 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42510 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbfG3RpF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Jul 2019 13:45:05 -0400
Received: by mail-wr1-f65.google.com with SMTP id x1so16808618wrr.9
        for <linux-doc@vger.kernel.org>; Tue, 30 Jul 2019 10:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=55SXhObGMSQ3B0w5iMjyyzalfBJzrVOBbclW7iiKCkQ=;
        b=exjzghzO7EhbkTlYRFfZpr6tmrtVXcAc1TUpBd+Kl4u2JUg38zLUxXExvK1XJMeAHr
         SlyxbTxUP2z+uLswK5N+R5aD9XurFsnLC7er31ADmEw6e+cthpO8vgTny/Txh/AaxhZy
         UyP5/EwXK5UjoggTiOow6IAF0r7VTqfO69BIgtbWgyUNP0ncKxhxcQKicE91n2/lV9GL
         ULiImcXpHVtfhBQVZL6kj0KY15jtIpMDwL5j/EdSck5lUOzB7BhcXdADbWAn7+0ox4AY
         clZVy+4OW2s2Mz0wdzzmFCii/R+659YbFBpBorz3TPYwfRJ6Uo8crDJGkNoDfjYysPcj
         PCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=55SXhObGMSQ3B0w5iMjyyzalfBJzrVOBbclW7iiKCkQ=;
        b=hSsemD1gDHLC3jjQXIYX7RBudv83+mPtAsqQKbDX5+ApNjFbTs8XTEdxJbRt/e9/u5
         TUhSY8UUdGnXIaEpScKMC0n5F2QDgHFV9MTcgsi2QIIDqMenwjFXOLzrct+AWlg0VSw/
         gp1DSlRRKJBOVbaFhRiZ+JspskgY8Htda5j2Mbhu7kBfTsX2uVsr3oSwY1++J0YqofN0
         13GpUDlWmbt7ms1nLc8W/ASaKnvWNH1kgun9sjOtIa9iUBifD5NUL5sSYXFkayPyTa+l
         MwKApmGoaoUmqjEzbD1LLsX8e3Xa4zG/Md7nlTMoVc1xgwZyi6y+TMLG5TcC9F7YmJec
         g0/w==
X-Gm-Message-State: APjAAAVHO7mW8tzGXcvSvSWtBu577lhFYcMlJEAwLmyFTOtRiYKGtSPs
        lWs0ZITQ89H+QK+x6tsRvvs9OsCDztr/rHgl0jYIDg==
X-Google-Smtp-Source: APXvYqw7bdW2U1qAn58HfHRrUeJI5mayWPJXnuvI4caiQBk+twxM3cUV7/aucx0o+qhr7HnlZGa3XX7YY+oTszTwMDI=
X-Received: by 2002:adf:e50c:: with SMTP id j12mr45502820wrm.117.1564508702443;
 Tue, 30 Jul 2019 10:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190730013310.162367-1-surenb@google.com> <20190730081122.GH31381@hirez.programming.kicks-ass.net>
In-Reply-To: <20190730081122.GH31381@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 30 Jul 2019 10:44:51 -0700
Message-ID: <CAJuCfpH7NpuYKv-B9-27SpQSKhkzraw0LZzpik7_cyNMYcqB2Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] psi: do not require setsched permission from the
 trigger creator
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Ingo Molnar <mingo@redhat.com>, lizefan@huawei.com,
        Johannes Weiner <hannes@cmpxchg.org>, axboe@kernel.dk,
        Dennis Zhou <dennis@kernel.org>,
        Dennis Zhou <dennisszhou@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>,
        Nick Kralevich <nnk@google.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 30, 2019 at 1:11 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jul 29, 2019 at 06:33:10PM -0700, Suren Baghdasaryan wrote:
> > When a process creates a new trigger by writing into /proc/pressure/*
> > files, permissions to write such a file should be used to determine whether
> > the process is allowed to do so or not. Current implementation would also
> > require such a process to have setsched capability. Setting of psi trigger
> > thread's scheduling policy is an implementation detail and should not be
> > exposed to the user level. Remove the permission check by using _nocheck
> > version of the function.
> >
> > Suggested-by: Nick Kralevich <nnk@google.com>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  kernel/sched/psi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> > index 7acc632c3b82..ed9a1d573cb1 100644
> > --- a/kernel/sched/psi.c
> > +++ b/kernel/sched/psi.c
> > @@ -1061,7 +1061,7 @@ struct psi_trigger *psi_trigger_create(struct psi_group *group,
> >                       mutex_unlock(&group->trigger_lock);
> >                       return ERR_CAST(kworker);
> >               }
> > -             sched_setscheduler(kworker->task, SCHED_FIFO, &param);
> > +             sched_setscheduler_nocheck(kworker->task, SCHED_FIFO, &param);
>
> ARGGH, wtf is there a FIFO-99!! thread here at all !?

We need psi poll_kworker to be an rt-priority thread so that psi
notifications are delivered to the userspace without delay even when
the CPUs are very congested. Otherwise it's easy to delay psi
notifications by running a simple CPU hogger executing "chrt -f 50 dd
if=/dev/zero of=/dev/null". Because these notifications are
time-critical for reacting to memory shortages we can't allow for such
delays.
Notice that this kworker is created only if userspace creates a psi
trigger. So unless you are using psi triggers you will never see this
kthread created.

> >               kthread_init_delayed_work(&group->poll_work,
> >                               psi_poll_work);
> >               rcu_assign_pointer(group->poll_kworker, kworker);
> > --
> > 2.22.0.709.g102302147b-goog
> >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
