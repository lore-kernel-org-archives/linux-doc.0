Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617D0C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:58:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D2DA23BCD
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393878AbgLKVKk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 16:10:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395123AbgLKVKT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 16:10:19 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C37FC0613D3
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 13:09:39 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id u19so10826507edx.2
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ao7xOAmYaX/ywGJg0iG/Mh6Kx1f1ZcL87diFd+Y1lgA=;
        b=aAfGSlEUgcDLpXRNkXIwp3DHZUaleYjADDcGxmniPbgCxhcNtqJwGP/McXAsdM/BAJ
         m9xejVVYuVGT+X0oCTQc5OkBSfq4uYXO1r0vnIGX6iznyDLybhsStAqQ8nE+VTYvT41/
         Q4AzJl/Rj5EBBtSby6Bvg346cED2t0FBYmJ1URTPm8E51HEVUW0ZlkLZ5mCMQ2HSZucZ
         nEm1DGQ0qOiATOM2Oc5DpmESg938oYmpTdtoJ8KTNWhi2qVmXaFEWcaFR8F4hLAn+D81
         B7LILJrvJvcZF/0nUbkByJepMPWl2TJXBXZ0L76aSvoQ0s31nM2o5dO4av6j9PkDHbjK
         YybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ao7xOAmYaX/ywGJg0iG/Mh6Kx1f1ZcL87diFd+Y1lgA=;
        b=qauJp19NZ9GbIZz0mOfttk81P4CkBeqm5vqQ72nmrmpkxKSZT3rDce4269iLsEZ4id
         tEa2Q0HCIfuMfUeSk82M7hIVsNgLM/S82zXRIvdFazbX97L651TZUtMJI8YUuUXdD/Pg
         8BCHfiaEUQw+5uAsS/xNcn1/EGkOHACk1L9RfFKQLPn/1t2noILHwwR/2DWC0BHqWQ9h
         388nvPIp6ZbqDDVUFpAt364T1SHbFZoIfW7cdXDH0T72gAJxDLs311w6QNqjwJuVC97f
         a119FV8KN6rcvP/7RPm3beYK9c0lJ2CZ2Yn+JjxRSXoIF12EwBPkFhA2bYS6U7L03av8
         zbCw==
X-Gm-Message-State: AOAM532gD0MB9hcmGaUEj0H/hsr3+vtewgW0YdSYjd1gRZyMp93wgByi
        PjWfcp6HVqKv0PRGxbbx9zBXfgNva46Y9pM7TIe6fg==
X-Google-Smtp-Source: ABdhPJwlIqvueU3MoneKnbIXloAwNr6Ag2h5LtdJXzZ0BBDjWxTCUfq7+QMT89nt5UYSontzpxc+l3g5STb19Q+QkAU=
X-Received: by 2002:a50:f404:: with SMTP id r4mr975568edm.62.1607720978232;
 Fri, 11 Dec 2020 13:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-6-pasha.tatashin@soleen.com> <20201211202354.GA2225686@ziepe.ca>
 <CA+CK2bDPR8vH+H6cqBn=RTXRCp5kv3ExNPD8DHB09vVWLc3YmA@mail.gmail.com> <20201211204600.GD5487@ziepe.ca>
In-Reply-To: <20201211204600.GD5487@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 11 Dec 2020 16:09:02 -0500
Message-ID: <CA+CK2bC6u4wnHX53ZhfPtQBLTDbD3t4V9Zuhj=HwD3gEyL4Puw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] mm/gup: migrate pinned pages out of movable zone
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Michal Hocko <mhocko@suse.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 11, 2020 at 3:46 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Dec 11, 2020 at 03:40:57PM -0500, Pavel Tatashin wrote:
> > On Fri, Dec 11, 2020 at 3:23 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Fri, Dec 11, 2020 at 03:21:39PM -0500, Pavel Tatashin wrote:
> > > > @@ -1593,7 +1592,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
> > > >                               }
> > > >
> > > >                               if (!isolate_lru_page(head)) {
> > > > -                                     list_add_tail(&head->lru, &cma_page_list);
> > > > +                                     list_add_tail(&head->lru, &movable_page_list);
> > > >                                       mod_node_page_state(page_pgdat(head),
> > > >                                                           NR_ISOLATED_ANON +
> > > >                                                           page_is_file_lru(head),
> > > > @@ -1605,7 +1604,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
> > > >               i += step;
> > > >       }
> > > >
> > > > -     if (!list_empty(&cma_page_list)) {
> > > > +     if (!list_empty(&movable_page_list)) {
> > >
> > > You didn't answer my earlier question, is it OK that ZONE_MOVABLE
> > > pages leak out here if ioslate_lru_page() fails but the
> > > moval_page_list is empty?
> > >
> > > I think the answer is no, right?
> > In my opinion it is OK. We are doing our best to not pin movable
> > pages, but if isolate_lru_page() fails because pages are currently
> > locked by someone else, we will end up long-term pinning them.
> > See comment in this patch:
> > +        * 1. Pinned pages: (long-term) pinning of movable pages is avoided
> > +        *    when pages are pinned and faulted, but it is still possible that
> > +        *    address space already has pages in ZONE_MOVABLE at the time when
> > +        *    pages are pinned (i.e. user has touches that memory before
> > +        *    pinning). In such case we try to migrate them to a different zone,
> > +        *    but if migration fails the pages can still end-up pinned in
> > +        *    ZONE_MOVABLE. In such case, memory offlining might retry a long
> > +        *    time and will only succeed once user application unpins pages.
>
> It is not "retry a long time" it is "might never complete" because
> userspace will hold the DMA pin indefinitely.
>
> Confused what the point of all this is then ??
>
> I thought to goal here is to make memory unplug reliable, if you leave
> a hole like this then any hostile userspace can block it forever.

You are right, I used a wording from the previous comment, and it
should be made clear that pin may be forever. Without these patches it
is guaranteed that hot-remove will fail if there are pinned pages as
ZONE_MOVABLE is actually the first to be searched. Now, it will fail
only due to exceptions listed in ZONE_MOVABLE comment:

1. pin + migration/isolation failure
2. memblock allocation due to limited amount of space for kernelcore
3. memory holes
4. hwpoison
5. Unmovable PG_offline pages (? need to study why this is a scenario).

Do you think we should unconditionally unpin pages, and return error
when isolation/migration fails?

Pasha

>
> Jason
