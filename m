Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CC7C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 19:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC99D20776
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 19:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728735AbhAMTpI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 14:45:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728723AbhAMTpH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 14:45:07 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658E5C061794
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 11:44:27 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id p22so3212866edu.11
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 11:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GzLWsELsR8oBhjbTdjrRDFjyjZTq2jjcpWmnVrGQ51I=;
        b=blkgyjyuXkDo5M/XULWxM5GW1ddqW2qXuIXAtWWMAqhHL+3/1zjCc7RoGJs7InE1v+
         CIEfh/FhW+eMnf1pvKFQdwu1ZaHYxwxeIyOr/oE15qji765qD9ZHGhLzQwpchiUtLLEU
         XQGul31+VseAFTmXOtU4RDBEdGBdyWI7bHMBWJMIHOCs4NWtcI/cO++YjmBn3qbCnGnW
         b+zgy7QI5U4IS3WONm+Uyy6v9TUvT1eC7CrvQv295dhZzrwlgDIoTVdkQlERaoceOB1N
         4IZxF81GGBSSBc2xDG0bSrjG5y5YoTDuIwLKwt3n6XVUBR+EZQ3rHWAM8/36PzT7edSi
         nzRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GzLWsELsR8oBhjbTdjrRDFjyjZTq2jjcpWmnVrGQ51I=;
        b=p7T40MgUiH7Ef7Inxl67ikqXvJhokD98ncVrWLkeQZrDhnbZ0xLd65keCxhGC/Ie9L
         Lgv5n7fSEigzRrU2PdKgVvPOaQYegTmwkn6JSOxyftd3j6fm2udgjG7roUZ+oLY0ZIYI
         krD33zuW/uIyk+3pGJ0ZFCoqYP71HX7/K3v/K3LbrzrUU9QhcxktzaLJe5mDhL5A/ROk
         46U2k+MC4J5i3UsBjRiPLOp2QSIi1EQ4o+FdzGRi4juGh0A/3m7G+tENpnA7izDY3jFA
         IorVUt6s0m0MWchBkquZvEDbgnkJU27RMWvaKmT3XbMY7+z+VAPOaPNN1F+0TfXupAd7
         1LqA==
X-Gm-Message-State: AOAM532EKrgFYFOJKrUOgsp1lGtn2sLAFZ7bMp2mHRcyYdwZwB3zAkaq
        WW+lR2SCIlX76QGxdAvWtpt4dBVlEqXhsG11ho+Dig==
X-Google-Smtp-Source: ABdhPJx/wAgqIbD+ZYNJG3iSEd9yk4DGHJF/U8NkN3WeGN5rGN1CxD05Wp/6PO3UCjHQRCOiNQz/xz0b3G4dzQS6UjM=
X-Received: by 2002:a05:6402:5246:: with SMTP id t6mr3107479edd.62.1610567066055;
 Wed, 13 Jan 2021 11:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-9-pasha.tatashin@soleen.com> <20201217205048.GL5487@ziepe.ca>
 <CA+CK2bA4F+SipkReJzFjCSC-8kZdK4yrwCQZM+TvCTrqV2CGHg@mail.gmail.com> <20201218141927.GM5487@ziepe.ca>
In-Reply-To: <20201218141927.GM5487@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 13 Jan 2021 14:43:50 -0500
Message-ID: <CA+CK2bDULopw649ndBybA-ST5EoRMHULwcfQcSQVKT9r8zAtwQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures,
 honor failures
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ira Weiny <ira.weiny@intel.com>,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 18, 2020 at 9:19 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Dec 17, 2020 at 05:02:03PM -0500, Pavel Tatashin wrote:
> > Hi Jason,
> >
> > Thank you for your comments. My replies below.
> >
> > On Thu, Dec 17, 2020 at 3:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Thu, Dec 17, 2020 at 01:52:41PM -0500, Pavel Tatashin wrote:
> > > > +/*
> > > > + * Verify that there are no unpinnable (movable) pages, if so return true.
> > > > + * Otherwise an unpinnable pages is found return false, and unpin all pages.
> > > > + */
> > > > +static bool check_and_unpin_pages(unsigned long nr_pages, struct page **pages,
> > > > +                               unsigned int gup_flags)
> > > > +{
> > > > +     unsigned long i, step;
> > > > +
> > > > +     for (i = 0; i < nr_pages; i += step) {
> > > > +             struct page *head = compound_head(pages[i]);
> > > > +
> > > > +             step = compound_nr(head) - (pages[i] - head);
> > >
> > > You can't assume that all of a compound head is in the pages array,
> > > this assumption would only work inside the page walkers if the page
> > > was found in a PMD or something.
> >
> > I am not sure I understand your comment. The compound head is not
> > taken from the pages array, and not assumed to be in it. It is exactly
> > the same logic as that we currently have:
> > https://soleen.com/source/xref/linux/mm/gup.c?r=a00cda3f#1565
>
> Oh, that existing logic is wrong too :( Another bug.

I do not think there is a bug.

> You can't skip pages in the pages[] array under the assumption they
> are contiguous. ie the i+=step is wrong.

If pages[i] is part of a compound page, the other parts of this page
must be sequential in this array for this compound page (it might
start in the middle through). If they are not sequential then the
translation will be broken, as these pages also correspond to virtual
addresses from [start, start + nr_pages) in __gup_longterm_locked.

For example, when __gup_longterm_locked() is returned, the following
must be true:
PHYSICAL                           VIRTUAL
page_to_phys(pages[0]) -> start + 0 * PAGE_SIZE
page_to_phys(pages[1]) -> start + 1 * PAGE_SIZE
page_to_phys(pages[2]) -> start + 2 * PAGE_SIZE
page_to_phys(pages[3]) -> start + 3 * PAGE_SIZE
...
page_to_phys(pages[nr_pages - 1]) -> start + (nr_pages - 1) * PAGE_SIZE

If any pages[i] is part of a compound page (i.e. huge page), we can't
have other pages to be in the middle of that page in the array..

>
> > >
> > > > +     if (gup_flags & FOLL_PIN) {
> > > > +             unpin_user_pages(pages, nr_pages);
> > >
> > > So we throw everything away? Why? That isn't how the old algorithm worked
> >
> > It is exactly like the old algorithm worked: if there are pages to be
> > migrated (not pinnable pages) we unpinned everything.
> > See here:
> > https://soleen.com/source/xref/linux/mm/gup.c?r=a00cda3f#1603
>
> Hmm, OK, but I'm not sure that is great either

I will send out a new series. We can discuss it there if you have
suggestions for improvement here.

>
> > cleaner, and handle errors. We must unpin everything because if we
> > fail, no pages should stay pinned, and also if we migrated some pages,
> > the pages array must be updated, so we need to call
> > __get_user_pages_locked() pin and repopulated pages array.
>
> However the page can't be unpinned until it is put on the LRU (and I'm
> hoping that the LRU is enough of a 'lock' to make that safe, no idea)
>
> > > I don't like this at all. It shouldn't be so flakey
> > >
> > > Can you do migration without the LRU?
> >
> > I do not think it is possible, we must isolate pages before migration.
>
> I don't like this at all :( Lots of stuff relies on GUP, introducing a
> random flakiness like this not good.

This is actually standard migration procedure, elsewhere in the kernel
we migrate pages in exactly the same fashion: isolate and later
migrate. The isolation works for LRU only pages.

>
> Jason
