Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A9FC433E6
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 14:29:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 473692336E
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 14:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389406AbhATO3Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 09:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388833AbhATO17 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jan 2021 09:27:59 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1768DC0613D3
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 06:27:19 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id b5so17353501ejv.4
        for <linux-doc@vger.kernel.org>; Wed, 20 Jan 2021 06:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GkoyOR4GCbG3ynLuDWDdmAP5ksEvgcnDncmZjj1fgMM=;
        b=an5cja/qYdQGpAjEtPTDlH7M4BiW92BqboXSMssTNPV4yTjKD78MUD5pEtcL4HxxBn
         V/LZ/aoi8wlkrKsC8Qmg/qeRpOqO6Lc59buU1gR04o2c3slsze1h/DdHxyg39Lal1wwm
         J5BrNriuP70iDJRY2q8iuUHjmvvEU+rArKoGBYfILNJE0XzqViV6/UrZIGlk6hh1vt3Z
         UcO5hmOTFdXGBZFktmXXPChyN5Dt7ePCcUNR0/C44f7yXQIYPska3yhn7AscuXCZtO5D
         T9Qr4MLNFVfYa7eQjmjHJROH4PaCRUtdBjam1uR+qwsblSsnHUvuobpAb+hyYIHAx/i0
         z98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GkoyOR4GCbG3ynLuDWDdmAP5ksEvgcnDncmZjj1fgMM=;
        b=SMaWRnoFcB+iI8JciXvyt13x6riSue4AIZvX93Cijz4CR38/sEvyiLNO96Ytmv3fDA
         33WxRswu/arUoqRuWQP985PBFpqmcbbcVtVDqBnZGllR2R+ahVHBQ4KyOwlmHlKFEoDZ
         RLNplXd1tLBrQDnmgeb01grY/F+UzkfCR+s9hTs9vte0nSC63GhYxhJsqg6GVd0tfkEe
         mDDx6lm0dQ2J9cQsO0sh+cCyYJ3/pPW/TFNea0jgrtlE1ZIikuC+uR+Mg7ei99dm8J2P
         arSITpk8eGrnxLO1cBj4wHWAAqV7jis+i0XT0wo3KBlFEaZ7SCuqQoOp5aLLMgToqB7l
         4uQA==
X-Gm-Message-State: AOAM530jerf5XzzOx9M2fDyfkLh6FDcYDepkr2A05eIAPjY6q0EPhkIB
        8Kk867Heinrd+KkY9h9F3wYeYMkjgRA0BFAjOipbbg==
X-Google-Smtp-Source: ABdhPJx5zFMlZW8Q/2uSKGMxlwI9VWUTvzWik3bYe1Wpdl5R67YaRP8DqOj41K+I/K735EdU0sRXLJ/NpBzmj3Ecvvs=
X-Received: by 2002:a17:906:c5b:: with SMTP id t27mr6436494ejf.129.1611152837523;
 Wed, 20 Jan 2021 06:27:17 -0800 (PST)
MIME-Version: 1.0
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
 <20210120014333.222547-9-pasha.tatashin@soleen.com> <20210120131400.GF4605@ziepe.ca>
In-Reply-To: <20210120131400.GF4605@ziepe.ca>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Wed, 20 Jan 2021 09:26:41 -0500
Message-ID: <CA+CK2bCu-uWWOxS_sPhfgzXTq-cqYFsHK_QFo7F+rStKpJJDRA@mail.gmail.com>
Subject: Re: [PATCH v6 08/14] mm/gup: do not migrate zero page
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

On Wed, Jan 20, 2021 at 8:14 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Jan 19, 2021 at 08:43:27PM -0500, Pavel Tatashin wrote:
> > On some platforms ZERO_PAGE(0) might end-up in a movable zone. Do not
> > migrate zero page in gup during longterm pinning as migration of zero page
> > is not allowed.
> >
> > For example, in x86 QEMU with 16G of memory and kernelcore=5G parameter, I
> > see the following:
> >
> > Boot#1: zero_pfn  0x48a8d zero_pfn zone: ZONE_DMA32
> > Boot#2: zero_pfn 0x20168d zero_pfn zone: ZONE_MOVABLE
> >
> > On x86, empty_zero_page is declared in .bss and depending on the loader
> > may end up in different physical locations during boots.
> >
> > Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> >  include/linux/mmzone.h | 4 ++++
> >  mm/gup.c               | 2 ++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index fc99e9241846..f67427a8f22b 100644
> > +++ b/include/linux/mmzone.h
> > @@ -427,6 +427,10 @@ enum zone_type {
> >        *    techniques might use alloc_contig_range() to hide previously
> >        *    exposed pages from the buddy again (e.g., to implement some sort
> >        *    of memory unplug in virtio-mem).
> > +      * 6. ZERO_PAGE(0), kernelcore/movablecore setups might create
> > +      *    situations where ZERO_PAGE(0) which is allocated differently
> > +      *    on different platforms may end up in a movable zone. ZERO_PAGE(0)
> > +      *    cannot be migrated.
> >        *
> >        * In general, no unmovable allocations that degrade memory offlining
> >        * should end up in ZONE_MOVABLE. Allocators (like alloc_contig_range())
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 857b273e32ac..fdd5cda30a07 100644
> > +++ b/mm/gup.c
> > @@ -1580,6 +1580,8 @@ static long check_and_migrate_cma_pages(struct mm_struct *mm,
> >                * of the CMA zone if possible.
> >                */
> >               if (is_migrate_cma_page(head)) {
> > +                     if (is_zero_pfn(page_to_pfn(head)))
> > +                             continue;
>
> I think you should put this logic in is_pinnable_page()

I thought about this, and it would code a little cleaner. But, the
reason I did not is because zero_page is perfectly pinnable, it is not
pinnable only when it is in a movable zone (and it should not be in a
movable zones for other reasons as well), but that is another bug that
needs to be resolved, and once that bug is resolved this condition can
be removed from gup migration.

Pasha

>
> Jason
