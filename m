Return-Path: <SRS0=ZADm=B6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3BEC433DF
	for <linux-doc@archiver.kernel.org>; Thu, 20 Aug 2020 13:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB13220658
	for <linux-doc@archiver.kernel.org>; Thu, 20 Aug 2020 13:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f74DRrmw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgHTN1e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Aug 2020 09:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729033AbgHTN1E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Aug 2020 09:27:04 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFCD6C061386
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2020 06:27:02 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id c6so1573341ilo.13
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2020 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OV4Vp1ofAMr75B75qNJu3AEaL5Ppz0SQTP1brRp/NYI=;
        b=f74DRrmw4KTmCMG95Z6yT+SY04V3gPuQ25oxfDNfAFmqUtgBt0belJ/hRAcVrDLTO9
         h4iyImcHTzOYXeYLgdZPJMXjsBZq54JJg17f5zj/rt/Ad9CEuMjEY4VDZWT5OnEdAFfm
         4mDxLqw1zQi2+vzOQDizjxV3NrnNy4lz6ImhNY7Kg+lucW+u+sfEfgQTiqzgTArSQXFn
         hSWMLl37nR+87sju2ZhQBqAWVjxkAsyfUEnPThmCRxC1nZg1VibF+GfhA4R6XKzlI/DU
         rDSl8lguXk1VJ/Cem1iEXdhmlUDgeLAN63mUlOs1kw6nL6pWFhGFkBYHtbfmUXUFikI3
         cZcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OV4Vp1ofAMr75B75qNJu3AEaL5Ppz0SQTP1brRp/NYI=;
        b=emW0upG1aaiRgOCo2SFsL9LcygUF87aJYMbe7ZUgFIe+7niOxQB5Y5cTpM+KpFvKCV
         VAQec+qz3YqMTmJ9HJxZkBDBkAOubTT6rMwqJyxGcdFBS2cZ+GKygi93OlVewCh5jVjB
         RKcvh8rZAayoIH8phBpZVuZAPZ2NtRvWctc2iwnu4wpqXwNzbft3enNN4yZAy4SXsOb7
         BCsfjO+srv94rckmQ2wDyDPpJsUF4VE2Mg1iTZLUo7aJFscihItMRDPaQkolKh7Kqs3D
         1Ybr7MVfnlBLTRyekhxet1ao4+hv1hJdWEEQub0xcaSssVU1L83KOqQOL5vpuyROR81v
         cVpA==
X-Gm-Message-State: AOAM532j4xEM+8KGdINc2BuwXFL4agAY13iHNUavm3PnDx38IXLPcuIB
        kEVLGAJ8Dut9eJQB3/dpbEALaO9yea9yOMfh1Hr+kg==
X-Google-Smtp-Source: ABdhPJzT3Zd2sVLZXRm4cZqG6dYAx1x0LMdjWvDuGy/rnXv22AhhSqNLyCTAgqUH8AzWAaeAQSg3atKW/HYqp0qO+2g=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr2735836ilq.145.1597930021491;
 Thu, 20 Aug 2020 06:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <CALvZod5ZRUHO+=Bvwj4aEKNL0Egwea2dZKuYDKhkvvUyezbgdg@mail.gmail.com>
 <20200820071647.25280-1-sjpark@amazon.com>
In-Reply-To: <20200820071647.25280-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 20 Aug 2020 06:26:49 -0700
Message-ID: <CALvZod4i5f5RcsHao3DWddoDgHsO+vvGPZaAJUWkURZ2fqH9LA@mail.gmail.com>
Subject: Re: [RFC v7 06/10] mm/damon: Implement callbacks for physical memory monitoring
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        "Du, Fan" <fan.du@intel.com>, foersleo@amazon.de,
        Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>, mark.rutland@arm.com,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, rppt@kernel.org,
        sblbir@amazon.com, shuah@kernel.org, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 20, 2020 at 12:17 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> On Wed, 19 Aug 2020 17:26:15 -0700 Shakeel Butt <shakeelb@google.com> wrote:
>
> > On Tue, Aug 18, 2020 at 12:27 AM SeongJae Park <sjpark@amazon.com> wrote:
> > >
> > > From: SeongJae Park <sjpark@amazon.de>
> > >
> > > This commit implements the four callbacks (->init_target_regions,
> > > ->update_target_regions, ->prepare_access_check, and ->check_accesses)
> > > for the basic access monitoring of the physical memory address space.
> > > By setting the callback pointers to point those, users can easily
> > > monitor the accesses to the physical memory.
> > >
> > > Internally, it uses the PTE Accessed bit, as similar to that of the
> > > virtual memory support.  Also, it supports only user memory pages, as
> > > idle page tracking also does, for the same reason.  If the monitoring
> > > target physical memory address range contains non-user memory pages,
> > > access check of the pages will do nothing but simply treat the pages as
> > > not accessed.
> > >
> > > Users who want to use other access check primitives and/or monitor the
> > > non-user memory regions could implement and use their own callbacks.
> > >
> > > Signed-off-by: SeongJae Park <sjpark@amazon.de>
> > [snip]
> > > +static void damon_phys_mkold(unsigned long paddr)
> > > +{
> > > +       struct page *page = damon_phys_get_page(PHYS_PFN(paddr));
> > > +       struct rmap_walk_control rwc = {
> > > +               .rmap_one = damon_page_mkold,
> > > +               .anon_lock = page_lock_anon_vma_read,
> > > +       };
> > > +       bool need_lock;
> > > +
> > > +       if (!page)
> > > +               return;
> > > +
> > > +       if (!page_mapped(page) || !page_rmapping(page))
> > > +               return;
> >
> > I don't think you want to skip the unmapped pages. The point of
> > physical address space monitoring was to include the monitoring of
> > unmapped pages, so, skipping them invalidates the underlying
> > motivation.
>
> I think my answer to your other mail[1] could be an answer to this.  Let me
> quote some from it:
>
> ```
> Technically speaking, this patchset introduces an implementation of DAMON's low
> level primitives for physical address space of LRU-listed pages.  In other
> words, it is not designed for cgroups case.  Also, please note that this
> patchset is only RFC, because it aims to only show the future plan of DAMON and
> get opinions about the concept before being serious.  It will be serious only
> after the DAMON patchset is merged.  Maybe I didn' made this point clear in the
> CV, sorry.  I will state this clearly in the next spin.
> ```

The unmapped pages are also LRU pages. Let's forget about the cgroups
support for a moment, the only reason to use DAMON's physical address
space monitoring is also to track the accesses of unmapped pages
otherwise virtual address space monitoring already does the monitoring
for mapped pages.

>
> ```
> So, DAMON is a framework rather than a tool.  Though it comes with basic
> applications using DAMON as a framework (e.g., the virtual address space low
> primitives implementation, DAMON debugfs interface, and the DAMON user space
> tool) that could be useful in simple use cases, you need to code your
> application on it if your use cases are out of the simple cases.  I will also
> develop more of such applications for more use-cases, but it will be only after
> the framework is complete enough to be merged in the mainline.
> ```
>
> Of course, we could prioritize the cgroup support if strongly required, though
> I still prefer focusing on the framework itself for now.
>
> [1] https://lore.kernel.org/linux-mm/20200820071052.24271-1-sjpark@amazon.com/
>
>
> Thanks,
> SeongJae Park
