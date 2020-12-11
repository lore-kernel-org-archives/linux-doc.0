Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14B3C4361B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6607523EF2
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389421AbgLKUmY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389030AbgLKUmP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:42:15 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1149BC0613CF
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:41:35 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id jx16so14115021ejb.10
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E6ZVINXPsdzUvTi8y4F5dCQAcZ1z+AuX7onsYghdXXU=;
        b=QWWiLxi3n5qfdFyONIr2q2ssLsNW2+Y/Fm1gJOa6KJ7O8TwqDxIC5alcqwk19dNRU1
         PR3OJwLyy5Jl5QhBlZHCjStP2IOafpHAz3NLC8JC9kPe7FpNLPfNUCDlYPIiXTISHk/6
         RVXF0IoaSYhxySEwGA8a9hR7gkHaIBXb5cajEi8huBPeKDeLIjiPB/lPsn4vYoO8833X
         2fTjd4tRTNVBdPAItaDY7n8FmYGNK1mCyevS45WNvav8qR0fI5a8Hirkg3gHPlFy6puK
         X3++oIucgL1it8TgHK8uRisl6iSIAIBh+gx/ewyDkrAbZwOt91TUqQd+wmIvPOxitsXT
         FX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E6ZVINXPsdzUvTi8y4F5dCQAcZ1z+AuX7onsYghdXXU=;
        b=NX5ClUIsYUJmHmkL08sPy52+hOhxG2jRWlslQLoR6z5CmQ2sZkqD953giPb+vr+i6q
         2ZN/y0TDdKrfzYKcVDjUCRlPNayS33YD0btqibAUK6ShDgEocbzQGZZvLy+qTWWvXgoa
         AwUCNmAiBYCXjFrfh+hMzqOLt8jKC7TlYkyamGGG5YHArz7Dod+2lR1Xh8AT2ZSmlu+7
         FuR/5pbOgW3isGX8kmXZlk3UQ6xsTMPaedj5b2eUCgajoU9K/FypvD68/uYWCQ3ISzzf
         EDOgNNuMB1XhyASrTJ8eVkYYkoKVDr5Ke7QzUbPXayY0Mp38aL+USKonuzLocm7lpLTT
         MEQQ==
X-Gm-Message-State: AOAM53080XS1u5zLSH0v555kuH2oEGQ15diPYOYitv0Ep/gj2etl+n1v
        Ey35R+GKPyoZJAHItF4Sz4YOIKt97+vZqtu5byjydQ==
X-Google-Smtp-Source: ABdhPJwhZ3hcnDKpQaKtFRHwNLn5KQ58koBxmqgOXsc76EHMbiiKHOf39MDRAkuqekpT9xaF9RD78X1VcWZej0Q1Mww=
X-Received: by 2002:a17:906:5213:: with SMTP id g19mr8813843ejm.383.1607719293747;
 Fri, 11 Dec 2020 12:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
 <20201211202140.396852-6-pasha.tatashin@soleen.com> <20201211202354.GA2225686@ziepe.ca>
In-Reply-To: <20201211202354.GA2225686@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Fri, 11 Dec 2020 15:40:57 -0500
Message-ID: <CA+CK2bDPR8vH+H6cqBn=RTXRCp5kv3ExNPD8DHB09vVWLc3YmA@mail.gmail.com>
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

On Fri, Dec 11, 2020 at 3:23 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Fri, Dec 11, 2020 at 03:21:39PM -0500, Pavel Tatashin wrote:
> > @@ -1593,7 +1592,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
> >                               }
> >
> >                               if (!isolate_lru_page(head)) {
> > -                                     list_add_tail(&head->lru, &cma_page_list);
> > +                                     list_add_tail(&head->lru, &movable_page_list);
> >                                       mod_node_page_state(page_pgdat(head),
> >                                                           NR_ISOLATED_ANON +
> >                                                           page_is_file_lru(head),
> > @@ -1605,7 +1604,7 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
> >               i += step;
> >       }
> >
> > -     if (!list_empty(&cma_page_list)) {
> > +     if (!list_empty(&movable_page_list)) {
>
> You didn't answer my earlier question, is it OK that ZONE_MOVABLE
> pages leak out here if ioslate_lru_page() fails but the
> moval_page_list is empty?
>
> I think the answer is no, right?
In my opinion it is OK. We are doing our best to not pin movable
pages, but if isolate_lru_page() fails because pages are currently
locked by someone else, we will end up long-term pinning them.
See comment in this patch:
+        * 1. Pinned pages: (long-term) pinning of movable pages is avoided
+        *    when pages are pinned and faulted, but it is still possible that
+        *    address space already has pages in ZONE_MOVABLE at the time when
+        *    pages are pinned (i.e. user has touches that memory before
+        *    pinning). In such case we try to migrate them to a different zone,
+        *    but if migration fails the pages can still end-up pinned in
+        *    ZONE_MOVABLE. In such case, memory offlining might retry a long
+        *    time and will only succeed once user application unpins pages.


>
> Jason
