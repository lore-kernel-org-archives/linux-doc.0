Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFB2C49EA6
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 14:42:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C818E613F2
	for <linux-doc@archiver.kernel.org>; Thu, 24 Jun 2021 14:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232146AbhFXOpS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Jun 2021 10:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhFXOpR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Jun 2021 10:45:17 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17886C061574
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 07:42:58 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id i13so10710765lfc.7
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zPDOtaL+XLEb4/llfBA4wK0O+KTaocWklfCim100ic0=;
        b=AwNSCHRt5qjpDmU6yijGBadrKOXnnr9hVNiLlx/FbaOFqI7Oxqf65VBlsJ84NPRVUf
         Uk6MvF+XRWYMyea/gmTHmIUsLYO7xcwg9uhua6HSTwUNSWCMFDs8TG7TzLmj03SLlMLu
         nm+U/p9FibYIcXKi7fSqx93PopR7gtjTiBZHR3bsaYo0FD2sFQhJS5DGD3A8rJJh5InC
         +SOGjQ6qrQ/au6Oy7sPYBw1TPZPaqdfRUaAmVvuVuXWe2YEZ5fRR/HxaJPTbhGqJHLGE
         N1zbWFHepM00ofYSoqSVnrlyxnmfStngqHMx949hyPQtNpJz+7vR6NuPH/uXYf1W6sge
         jWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zPDOtaL+XLEb4/llfBA4wK0O+KTaocWklfCim100ic0=;
        b=KTv3IwwtzSEOXmxqiDvqoYKbNoHRDmMSqGC2lh8O5UxhKYzRdi5+SbTCsB+nEHAovf
         s1tilvByOX1ST5eTF+AihiBo5dhcpj8JrBmWALwZqQUHxb+BfnAT8NbEehI3MkhcLrZs
         JyYvGaXMAXu/8rdHLt9P1gkGKYCBGDkBTbE7QBQOA1LEKbaKDbxk0ptsALQaH6+ZT2e3
         xzHoxwPhdIWAmgrqjOiGuuRwhNccIXS6iOspoj8jfCZhVW5y7u5TGvTbgIR60aO7MPdx
         Q0u83+onOEV84/fYISY78dZgC5j395r11XrECpVn+0zg13PPLAHbO3pIu7Ry/b77SKJa
         82zg==
X-Gm-Message-State: AOAM530S4lkuDG85AQG8+nMkM3ylYhbAMLsFPkQJc/QL3y1R1V/t+Rhc
        tJMui59ID3+rboqotc9ey3XFTUZsGfcCzzoSJLFg2g==
X-Google-Smtp-Source: ABdhPJz9FhxmntnQWK4wpCGRR5Ld+FnwOhzVQjZ+p6hzlK1H8jz79mEJvtqeIDnDWjY+USditIlEcEmoOoq3XuphUdY=
X-Received: by 2002:a05:6512:3155:: with SMTP id s21mr4064815lfi.358.1624545776093;
 Thu, 24 Jun 2021 07:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210624102623.24563-1-sjpark@amazon.de> <20210624102623.24563-3-sjpark@amazon.de>
In-Reply-To: <20210624102623.24563-3-sjpark@amazon.de>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 24 Jun 2021 07:42:44 -0700
Message-ID: <CALvZod5dFVxJVFUP4zBCC97C7rr5pGjRZQoixzs=GcNRAosKgw@mail.gmail.com>
Subject: Re: [PATCH v31 05/13] mm/damon: Implement primitives for the virtual
 memory address spaces
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, greg@kroah.com,
        Greg Thelen <gthelen@google.com>, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, Mel Gorman <mgorman@suse.de>, mheyne@amazon.de,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
        sieberf@amazon.com, snu@zelle79.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        zgf574564920@gmail.com, linux-damon@amazon.com,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 24, 2021 at 3:26 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
[...]
> > > +/*
> > > + * Get the three regions in the given target (task)
> > > + *
> > > + * Returns 0 on success, negative error code otherwise.
> > > + */
> > > +static int damon_va_three_regions(struct damon_target *t,
> > > +                               struct damon_addr_range regions[3])
> > > +{
> > > +       struct mm_struct *mm;
> > > +       int rc;
> > > +
> > > +       mm = damon_get_mm(t);
> > > +       if (!mm)
> > > +               return -EINVAL;
> > > +
> > > +       mmap_read_lock(mm);
> > > +       rc = __damon_va_three_regions(mm->mmap, regions);
> > > +       mmap_read_unlock(mm);
> >
> > This is being called for each target every second by default. Seems
> > too aggressive. Applications don't change their address space every
> > second. I would recommend to default ctx->primitive_update_interval to
> > a higher default value.
>
> Good point.  If there are many targets and each target has a huge number of
> VMAs, the overhead could be high.  Nevertheless, I couldn't find the overhead
> in my test setup.  Also, it seems someone are already started exploring DAMON
> patchset with the default value. and usages from others.  Silently changing the
> default value could distract such people.  So, if you think it's ok, I'd like
> to change the default value only after someone finds the overhead from their
> usages and asks a change.
>
> If you disagree or you found the overhead from your usage, please feel free to
> let me know.
>

mmap lock is a source contention in the real world workloads. We do
observe in our fleet and many others (like Facebook) do complain on
this issue. This is the whole motivation behind SFP, maple tree and
many other mmap lock scalability work. I would be really careful to
add another source of contention on mmap lock. Yes, the user can
change this interval themselves but we should not burden them with
this internal knowledge like "oh if you observe high mmap contention
you may want to increase this specific interval". We should set a good
default value to avoid such situations (most of the time).
