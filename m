Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6DFC4332B
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 19:51:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABD2E23436
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jan 2021 19:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbhAMTva (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jan 2021 14:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726599AbhAMTva (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jan 2021 14:51:30 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028BDC0617A2
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 11:50:18 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id b2so3256284edm.3
        for <linux-doc@vger.kernel.org>; Wed, 13 Jan 2021 11:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hkaHio9VTNAaaJDmEyRQXcJxkwJ/XswHkEgfldp61ZI=;
        b=DBMGxCUOdCPD0SifYoweomw1Y4FfNHp7XMpRyORz8ICzEC8hnO9+W2gxv7dcufnUdd
         mXKHLNN2knZn79lKiaZvdkn9JBdhHK8YGSsYBTrNCdRjaCsWiITLit4uBUxaAIqmw96t
         c4/3iPlmfgXuPO2mCRmuE/KMs3pQiHRU4epXJfyPJFXb8GNt5ruvjRnr9oSrC8xPfqRI
         UolhQ3coOMcq1dKzP8kPDAIQSvn4JO9sDTe0s51fUJDPTeN4bWaG5+Ns0VRvHpzy8cgb
         qFWHBtZcUByskLYs9X9XNcVDq8kGxX0QZOkkwxzA7CqvKd86pO8h5wloNkkbz38TsRiz
         NEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hkaHio9VTNAaaJDmEyRQXcJxkwJ/XswHkEgfldp61ZI=;
        b=ewuEb5Uut//JW/GTABSIDrPDlE4LjncAeNxSTw9a3ZB08ff4G+reITV+uHEE45q3xg
         8LH9YOThFriQgel6GJNFy2FrIwSDdczsn9a6ceaSBSijTMKyKM7XlKjRHLELHdO3NKxS
         bsad/JX51n2F0KmFUCpgM8HVY/Jb1OXHZEuNzyYLSmxLC3/+sU1DrYqSn5gNbXGM8mop
         vZXh/vEMqW/M4u/r/cWsK4smaO3ZAkjPF1DE903LJv7RTubaXJ8Nm0fWXGr1VyMMZeh0
         Ayy/sqSr0sZK252KG1dOjhV0AbHaGNGP7I9AJp46eDGADuI1UAPNRiFaVSPtwvQObLZ6
         OiMg==
X-Gm-Message-State: AOAM533pqUXLBaEGm574RuwLJhdkMczuE5ocn4TVI1OdqXRrWCRimPPh
        Qt3WQ3HlNevWtGmNopPN+w0yU+da97IOyIyLApZbMg==
X-Google-Smtp-Source: ABdhPJxUwem33eQzEqaNtDEZLAOHpRjU0hOrw6ks7bEMUUESs7T5p/JZqZXOYsn7ezJOHVwn/vQhEdVylgMONGQxTP0=
X-Received: by 2002:a50:b282:: with SMTP id p2mr3241176edd.210.1610567417733;
 Wed, 13 Jan 2021 11:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20201217185243.3288048-1-pasha.tatashin@soleen.com>
 <20201217185243.3288048-9-pasha.tatashin@soleen.com> <20201218104655.GW32193@dhcp22.suse.cz>
 <CA+CK2bCn++2Sk4-Eunibj6f+JoOL77uJQXGU2+dScHQ3RgC7_Q@mail.gmail.com> <20201218131449.GZ32193@dhcp22.suse.cz>
In-Reply-To: <20201218131449.GZ32193@dhcp22.suse.cz>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 13 Jan 2021 14:49:41 -0500
Message-ID: <CA+CK2bB9REcktfq=kh9MhvAwg8GPpK_tHx_LiruF0DCkMWHXmA@mail.gmail.com>
Subject: Re: [PATCH v4 08/10] mm/gup: limit number of gup migration failures,
 honor failures
To:     Michal Hocko <mhocko@suse.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Sasha Levin <sashal@kernel.org>,
        Tyler Hicks <tyhicks@linux.microsoft.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>, mike.kravetz@oracle.com,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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

On Fri, Dec 18, 2020 at 8:14 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 18-12-20 07:43:15, Pavel Tatashin wrote:
> > On Fri, Dec 18, 2020 at 5:46 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Thu 17-12-20 13:52:41, Pavel Tatashin wrote:
> > > [...]
> > > > +#define PINNABLE_MIGRATE_MAX 10
> > > > +#define PINNABLE_ISOLATE_MAX 100
> > >
> > > Why would we need to limit the isolation retries. Those should always be
> > > temporary failure unless I am missing something.
> >
> > Actually, during development, I was retrying isolate errors
> > infinitely, but during testing found a hung where when FOLL_TOUCH
> > without FOLL_WRITE is passed (fault in kernel without write flag), the
> > zero page is faulted. The isolation of the zero page was failing every
> > time, therefore the process was hanging.
>
> Why would you migrate zero page in the first place? Simply instantiate
> it.

This is exactly the idea behind FOLL_WRITE; it causes zero pages to be
created in the right zone right away, and no migration is necessary.

>
> > Since then, I fixed this problem by adding FOLL_WRITE unconditionally
> > to FOLL_LONGTERM, but I was worried about other possible bugs that
> > would cause hangs, so decided to limit isolation errors. If you think
> > it its not necessary, I can unlimit isolate retires.
>
> It should have a really good reason to exist. Worries about some corner
> cases is definitely not a reason to put some awkward retry mechanism.
> My historical experience is that these things are extremely hard to get
> rid of later.
>
> > > I am not sure about the
> > > PINNABLE_MIGRATE_MAX either. Why do we want to limit that? migrate_pages
> > > already implements its retry logic why do you want to count retries on
> > > top of that? I do agree that the existing logic is suboptimal because
> >
> > True, but again, just recently, I worked on a race bug where pages can
> > end up in per-cpu list after lru_add_drain_all() but before isolation,
> > so I think retry is necessary.
>
> There are ways to make sure pages are not ending on pcp list. Have a
> look at how hotplug does that.

Sounds good to me, I will remove PINNABLE_MIGRATE_MAX, and leave only
PINNABLE_ISOLATE_MAX for transient isolation errors.

>
> > > the migration failure might be ephemeral or permanent but that should be
> > > IMHO addressed at migrate_pages (resp. unmap_and_move) and simply report
> > > failures that are permanent - e.g. any potential pre-existing long term
> > > pin - if that is possible at all. If not what would cause permanent
> > > migration failure? OOM?
> >
> > Yes, OOM is the main cause for migration failures.
>
> Then you can treat ENOMEM as a permanent failure.

Sounds good.
