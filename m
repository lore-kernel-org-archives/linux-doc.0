Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C857C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 13:32:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD15B23E1F
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 13:32:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389276AbgLJNbi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 08:31:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389243AbgLJNbV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 08:31:21 -0500
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8186FC0617A6
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 05:30:40 -0800 (PST)
Received: by mail-ed1-x541.google.com with SMTP id k4so5503277edl.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 05:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIiXZlbTMuOjaSEMVqtFB6pB00HTPLen1qKXz/tc/w4=;
        b=d/xbjFBJuPt09Moenjfm3UdGX4TVhWRqyMqX0ktZwR79L40k4GEKzIkKORO2Z0CINr
         4T7jaqdKoxk5yuKKjHoECVhW8+UraRZYdD/PFnTDuUNn6gKFU2/t1QGEs3oyHNLZfP9s
         f/RXGctRNpk3r1kQ5UUt/OfZfP36nQ0BXQBBw9fcPiWhKmxYhVcOBuZ5zoy82p9a2Mww
         fI1y1QEiDQ1tXs1csraPkHWGPUh61JMtkYH7lstW8pdNCZ8iG3MId4ewJ55x1dGWx97f
         q2wZxVdAGrBJhpwUSYgNBwIeWdz+5Jm9lpFOeZ9v6Tt7S6IKoQWy4f7SRpOk7A2y4Ls+
         zXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIiXZlbTMuOjaSEMVqtFB6pB00HTPLen1qKXz/tc/w4=;
        b=H5akek/ZrwE4ojCww3Hfm6g9IEwXXj+eY0bHyGuX6jOdDKfW7V8xYOWXJv5nz8KBpQ
         2WCIIx3bTuv8Qq4iMNvRErpldxyqCAQ7s3muVX1GTHVkOfSoUg52LChRIx98z8bRD9bv
         9vUgUf6k/7zVr2q6Sz16mJA1nK7ZGJVa/rTh1xZA02v7JTO+eV3LbFRo8iEvIE3TMBAG
         d8gLeiXlXE1jrwDDYND6f6qeTtbCxLxqNFGEHqfzAJQ2z9dJ+r+cMgBeA0QQAjEpEYvA
         l9/RoxORrZ4B4JAw44uF366Myy4ULfqrdrpnneUa9qNekw3hAbKrK7Oa4C0ClzoxVUBZ
         xJvA==
X-Gm-Message-State: AOAM532yF62aud38rHvQw21+121B3AkfbgRGD+VBsVTIT6jFUey2sS4y
        eGnyuaDrw5Igk5VtuDhS9Jk1wUD2xZZCKHWm8RzLsA==
X-Google-Smtp-Source: ABdhPJzbv+0w87d8raPbwJYgG4lQqkPBXI5t6mWVFwqoR7W+om+Oee3IcTAbGBN3WSP8/XgWKhc5sKqsUR60nXXGBSs=
X-Received: by 2002:a50:e00f:: with SMTP id e15mr7078798edl.210.1607607039197;
 Thu, 10 Dec 2020 05:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
 <20201210004335.64634-4-pasha.tatashin@soleen.com> <20201210040618.GR1563847@iweiny-DESK2.sc.intel.com>
In-Reply-To: <20201210040618.GR1563847@iweiny-DESK2.sc.intel.com>
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
Date:   Thu, 10 Dec 2020 08:30:03 -0500
Message-ID: <CA+CK2bCVEnKKatQSxZcdcvNo+9rWNrGWXyLS3dnF-y7=5Ery7g@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] mm/gup: make __gup_longterm_locked common
To:     Ira Weiny <ira.weiny@intel.com>
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
        Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
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

On Wed, Dec 9, 2020 at 11:06 PM Ira Weiny <ira.weiny@intel.com> wrote:
>
> On Wed, Dec 09, 2020 at 07:43:30PM -0500, Pavel Tatashin wrote:
> > __gup_longterm_locked() has CMA || FS_DAX version and a common stub
> > version. In the preparation of prohibiting longterm pinning of pages from
> > movable zone make the CMA || FS_DAX version common, and delete the stub
> > version.
>
> I thought Jason sent a patch which got rid of this as well?

Yes, this series applies on the mainline so it can be easily tested.
The next version, I will sync with linux-next.

Thank you,
Pasha

>
> Ira
>
> >
> > Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> > Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> > ---
> >  mm/gup.c | 13 -------------
> >  1 file changed, 13 deletions(-)
> >
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 3a76c005a3e2..0e2de888a8b0 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -1567,7 +1567,6 @@ struct page *get_dump_page(unsigned long addr)
> >  }
> >  #endif /* CONFIG_ELF_CORE */
> >
> > -#if defined(CONFIG_FS_DAX) || defined (CONFIG_CMA)
> >  #ifdef CONFIG_FS_DAX
> >  static bool check_dax_vmas(struct vm_area_struct **vmas, long nr_pages)
> >  {
> > @@ -1757,18 +1756,6 @@ static long __gup_longterm_locked(struct mm_struct *mm,
> >               kfree(vmas_tmp);
> >       return rc;
> >  }
> > -#else /* !CONFIG_FS_DAX && !CONFIG_CMA */
> > -static __always_inline long __gup_longterm_locked(struct mm_struct *mm,
> > -                                               unsigned long start,
> > -                                               unsigned long nr_pages,
> > -                                               struct page **pages,
> > -                                               struct vm_area_struct **vmas,
> > -                                               unsigned int flags)
> > -{
> > -     return __get_user_pages_locked(mm, start, nr_pages, pages, vmas,
> > -                                    NULL, flags);
> > -}
> > -#endif /* CONFIG_FS_DAX || CONFIG_CMA */
> >
> >  static bool is_valid_gup_flags(unsigned int gup_flags)
> >  {
> > --
> > 2.25.1
> >
> >
