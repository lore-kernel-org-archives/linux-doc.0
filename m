Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A34E7D912
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 Jan 2019 18:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbfA2SFW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 Jan 2019 13:05:22 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54408 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbfA2SFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Jan 2019 13:05:21 -0500
Received: by mail-wm1-f66.google.com with SMTP id a62so18881990wmh.4
        for <linux-doc@vger.kernel.org>; Tue, 29 Jan 2019 10:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y+ap6Bq9i9Bosxjv/aC11VsPIK0N0Zh2bt/qMaK7RFo=;
        b=pTMYdsjVGlPjGB46EzZOJP2ZzDqCQrAqtMKteb4meGoxCxhdPbKwQR1sea+cC+6KTW
         G+seq4FJVEvK5CRhVUtH84btkAFM7Xc4jxG+SDLF8sUlDknTuC2WFvELFSNqQRh3hYCG
         CvcEgmI2ubiEKT3037EZFz8oCFJ9h2vrXZeY/DN5KatkMVTeIUt85CojWalyztZWPCu9
         5UNFCramOZsutLuabzLGoYyV22vjYFlPJrv+sIbEz+foWtJ/T43QYM6ELa5elREGVVhI
         DNszJWv4OwXbAtfHWrgmqegPvT7xs193W6REmvUd1rwEKb5NxMrkXxmOSbFn7DV+Sf2Z
         wrqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y+ap6Bq9i9Bosxjv/aC11VsPIK0N0Zh2bt/qMaK7RFo=;
        b=p6/NBzGWOKspuHsJJezwy/Kz1X5yxvxSnc8QsIkFO1wq+4mOfGI6kP7xp8+GMR8OTW
         TN0CWAR8cplH5MmYaPmPSV+3shuevcX5YzGc0pBHYjiIyAV94P5tgVwcIjDwcezqnhn/
         xbuJvXb+5KtGWascsxP+hIyJMdMfR92AnSN4MdLS7yNbC2/HmY1c3sxCBuLzrV/9xpcw
         V3Kuf2sB8PxeCiKjAfWlNk3f0Ts5MJMDJ0VPm6Lhfo3dp2Oh4JV1FgnLzE6Ql3GYRdjQ
         Aqd4TnsTXDDoqVpfwVb5xREKTS34ZlC2ZnMawzHb64JJWRsvBNSNp7Oe5ROXBj0rWFX4
         JytQ==
X-Gm-Message-State: AJcUukcVp1TLKRXlK6BNcx4VT5W1gVMHJATtv+krVzoMjcMB9vJoDO0y
        GXwgJrQee6Lsb7Mzo3xBmKOLUlNbTFmCWOHdrh8YvQ==
X-Google-Smtp-Source: ALg8bN7LYSdl+dRdBBbTvxW1GBHoyD6o/TBUVTnGWPtKZpAzgWSqhyM1ZtFKfRYRVtnOYo2pX0CGBDOWEMoPtBdoZiE=
X-Received: by 2002:a7b:c04e:: with SMTP id u14mr20579255wmc.133.1548785118461;
 Tue, 29 Jan 2019 10:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20190124211518.244221-1-surenb@google.com> <20190124211518.244221-6-surenb@google.com>
 <20190129104431.GJ28467@hirez.programming.kicks-ass.net>
In-Reply-To: <20190129104431.GJ28467@hirez.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 29 Jan 2019 10:05:07 -0800
Message-ID: <CAJuCfpH3k0rrZZw_HhrjXYuFX31p283qg_5vQEnyd_wAMaxbqA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] psi: introduce psi monitor
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

Thanks for review Peter!

On Tue, Jan 29, 2019 at 2:44 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Jan 24, 2019 at 01:15:18PM -0800, Suren Baghdasaryan wrote:
> >  static void psi_update_work(struct work_struct *work)
> >  {
> >       struct delayed_work *dwork;
> >       struct psi_group *group;
> > +     bool first_pass = true;
> > +     u64 next_update;
> > +     u32 change_mask;
> > +     int polling;
> >       bool nonidle;
> > +     u64 now;
> >
> >       dwork = to_delayed_work(work);
> >       group = container_of(dwork, struct psi_group, clock_work);
> >
> > +     now = sched_clock();
> > +
> > +     mutex_lock(&group->update_lock);
>
> actually acquiring a mutex can take a fairly long while; would it not
> make more sense to take the @now timestanp _after_ it, instead of
> before?

Yes, that makes sense. As long as *now* is set before the *retry*
label, otherwise the retry mechanism would get even more complicated
to understand with floating *now* timestamp. Will move the assignment
right after the mutex_lock()

> --
> You received this message because you are subscribed to the Google Groups "kernel-team" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
