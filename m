Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CF2297D08E
	for <lwn-linux-doc@archive.lwn.net>; Tue, 18 Dec 2018 01:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbeLRBWu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Dec 2018 20:22:50 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38478 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbeLRBWu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Dec 2018 20:22:50 -0500
Received: by mail-wm1-f65.google.com with SMTP id m22so1056619wml.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Dec 2018 17:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sFGWv6X8z3NwFialNaeSsACmFB5fqtUuW9oC4mugWj4=;
        b=l3yIC1z24v0r3Yyxrmq1CCmwuEpPGGLweeNlEXuGnjDG//zHj98KJs+aO07RlEWBJu
         EV91sC4cK59Ckg3Dws+kWuu4UFAIjAkw0VnO1ND8uINmrTH5BvLLqNQkhtg81i8LypjB
         KDXThdLTJoDH/kvvlzp/npeS4W63wz3InzwaXy2BIv83yINt9LwsktznaONO7pjFocSS
         TQAST/KPYuCDPGYTmFRXaJbnXYZ7CLeAwBnTCL1irL8YTL+7pPzVqT4t5Srl5QtOnK9R
         fyhyHFu7pmHzLq7eUhESXu5N88IaFh9VOF1AfVUmQ9waNF38I/Lne4mUwBs4lKQswV9j
         oloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sFGWv6X8z3NwFialNaeSsACmFB5fqtUuW9oC4mugWj4=;
        b=pbZi7A8buQx9UNKWK9yba6dsrjZHLCs8zsbJMkqedNQ6QM9G5fxS7jPj9y5nabtOLV
         x+m65s52Z46SEsPd/+akstomCtStn3L62phtbFckvKKMXLMELrCZ2Jxh1NOdtMVgJ0ra
         KxCYV7En+ia8M6hLsiwOEjWbhzD3IT3SWYnlRgPxhikJyRXeENX0nL5uXhLfJ86PYZPB
         MmsoYU+sFmHEOjJPC3jNvgE4qEX1exGXfXlJV1d5RlQR/MC+EW/i/c7qRxWXa/K7ruM7
         zN/c+NP0fvoI9gtMdBlVyE+10ouhDNfgXx6qUUdejySjHQjjjTVvVkXFrsbgV/0v/bhu
         REuA==
X-Gm-Message-State: AA+aEWYBiu6O724Mr6Iu78HnV9gPXjnew74+Gcrm3iGYTSBEm59YtlcD
        ZunpoKrYkOAhs/1rYX7/7GzFFnBIEAPAt99e/aH5xQ==
X-Google-Smtp-Source: AFSGD/Vt9bgOssRGjNM9g+zQkLmLmYp5ME/owlqbM1CoOLLX7DTPeAXAfe9QJ6+u0RyB5DzFmI7RL5z9zjuXz+1kFIg=
X-Received: by 2002:a1c:6442:: with SMTP id y63mr1042938wmb.143.1545096166849;
 Mon, 17 Dec 2018 17:22:46 -0800 (PST)
MIME-Version: 1.0
References: <20181214171508.7791-1-surenb@google.com> <20181214171508.7791-7-surenb@google.com>
 <20181217162713.GE2218@hirez.programming.kicks-ass.net>
In-Reply-To: <20181217162713.GE2218@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 17 Dec 2018 17:22:35 -0800
Message-ID: <CAJuCfpFp7v4oc9LL0TVMiYavOMOvDs5y=kQ8S7URtKojkWmH7Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] psi: introduce psi monitor
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

On Mon, Dec 17, 2018 at 8:37 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Dec 14, 2018 at 09:15:08AM -0800, Suren Baghdasaryan wrote:
> > @@ -358,28 +526,23 @@ static void psi_update_work(struct work_struct *work)
> >  {
> >       struct delayed_work *dwork;
> >       struct psi_group *group;
> > +     u64 next_update;
> >
> >       dwork = to_delayed_work(work);
> >       group = container_of(dwork, struct psi_group, clock_work);
> >
> >       /*
> > +      * Periodically fold the per-cpu times and feed samples
> > +      * into the running averages.
> >        */
> >
> > +     psi_update(group);
> >
> > +     /* Calculate closest update time */
> > +     next_update = min(group->polling_next_update,
> > +                             group->avg_next_update);
> > +     schedule_delayed_work(dwork, min(PSI_FREQ,
> > +             nsecs_to_jiffies(next_update - sched_clock()) + 1));
>
> See, so I don't at _all_ like how there is no idle option..

Copy that. Will see what we can do to bring it back.
Thanks!

> >  }
>
>
> --
> You received this message because you are subscribed to the Google Groups "kernel-team" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
