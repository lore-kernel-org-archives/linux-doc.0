Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA23C47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 01:44:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E995613C5
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 01:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhE0BqA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 May 2021 21:46:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231968AbhE0Bp7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 May 2021 21:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622079867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=VpnQjRLTYtvem4bmBp1ngvgaZaWU0A6eMfZva3aBJoc=;
        b=B5RO3BafCwdd5e/C/Vpai1TiK9oVxl7N85p58LNFZmyiYpB3wOBKScfaOlXzQY38yzO6zk
        QQUNjNueMVvgheq0bK6uocsAotVbB7ykN0boX5dJWSLyyExGZv2pn8EAdOriNdfKkgF01f
        rqXzYKmr0rie/Q4mjZTUWTWYd5bgl4s=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-zq8Z97YQMDuPqRmD_eIVbg-1; Wed, 26 May 2021 21:44:25 -0400
X-MC-Unique: zq8Z97YQMDuPqRmD_eIVbg-1
Received: by mail-qk1-f198.google.com with SMTP id a24-20020a05620a1038b02902fa6ba180ffso2310096qkk.0
        for <linux-doc@vger.kernel.org>; Wed, 26 May 2021 18:44:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VpnQjRLTYtvem4bmBp1ngvgaZaWU0A6eMfZva3aBJoc=;
        b=Ad6GzHiVYip6dTB7lMB/ImW1GMEAlMeWL+FRfgrJk6NUWySQ2UFeTof4ACNxC6WPpu
         CbEJyWjwMUSPxu/M3F/KXocRMfA3Bc8z6kx4ee1hrixxwWemcOA64DNoErFuCQbHcZpi
         0YbICED0SURhxn+qv4la2T0Rdl8afxggzLbrdFx4ktLcOvkdTP6oJK7vwhXI/JstUeOY
         3FcW+3+ILz4p+87kGCSHPXZoDZ7tR+AnYf7Z2A/oYv7O9OnbUVvQaHbmd1v5UB1Nnw0e
         AcKvw0OHELJK/GPIXj5bW9AuUIV88l/nGhEyk0kbEpEqWNV0SiMWivl/tG9c7/Gx8ein
         Jxwg==
X-Gm-Message-State: AOAM530HyjyVJ1wJ8XaYVHBQvNn7c+mJnHak/bluhS3jUMFWhqJEJ35w
        ioGXUIhd2/EeMUIUiaj4LYozDjdjVp9mR14M3j2YGy6vi6gXcImb3pVklZ17u925OBFkXMIoa9r
        kOzKn0ZRWMHYKzesX5Ojq
X-Received: by 2002:ac8:58c9:: with SMTP id u9mr1105869qta.58.1622079865059;
        Wed, 26 May 2021 18:44:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfR+dYiNTc8bzg8Cbe+4NPqyuhJDn00JrMrexnADTDq6kNzSW0QT/5/OWP1wZQyy97uuc2Sg==
X-Received: by 2002:ac8:58c9:: with SMTP id u9mr1105834qta.58.1622079864805;
        Wed, 26 May 2021 18:44:24 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id y1sm498232qkp.21.2021.05.26.18.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 18:44:23 -0700 (PDT)
Date:   Wed, 26 May 2021 21:44:22 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        jhubbard@nvidia.com, bsingharora@gmail.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, jglisse@redhat.com, willy@infradead.org,
        jgg@nvidia.com, hughd@google.com
Subject: Re: [PATCH v9 06/10] mm/memory.c: Allow different return codes for
 copy_nonpresent_pte()
Message-ID: <YK75dpdwU9AIKJ6i@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-7-apopple@nvidia.com>
 <YK6mbf967dV0ljHn@t490s>
 <2005328.bFqPmhE5MS@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2005328.bFqPmhE5MS@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 27, 2021 at 11:20:36AM +1000, Alistair Popple wrote:
> On Thursday, 27 May 2021 5:50:05 AM AEST Peter Xu wrote:
> > On Mon, May 24, 2021 at 11:27:21PM +1000, Alistair Popple wrote:
> > > Currently if copy_nonpresent_pte() returns a non-zero value it is
> > > assumed to be a swap entry which requires further processing outside the
> > > loop in copy_pte_range() after dropping locks. This prevents other
> > > values being returned to signal conditions such as failure which a
> > > subsequent change requires.
> > > 
> > > Instead make copy_nonpresent_pte() return an error code if further
> > > processing is required and read the value for the swap entry in the main
> > > loop under the ptl.
> > > 
> > > Signed-off-by: Alistair Popple <apopple@nvidia.com>
> > > 
> > > ---
> > > 
> > > v9:
> > > 
> > > New for v9 to allow device exclusive handling to occur in
> > > copy_nonpresent_pte().
> > > ---
> > > 
> > >  mm/memory.c | 12 +++++++-----
> > >  1 file changed, 7 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 2fb455c365c2..e061cfa18c11 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct
> > > mm_struct *src_mm,> 
> > >       if (likely(!non_swap_entry(entry))) {
> > >       
> > >               if (swap_duplicate(entry) < 0)
> > > 
> > > -                     return entry.val;
> > > +                     return -EAGAIN;
> > > 
> > >               /* make sure dst_mm is on swapoff's mmlist. */
> > >               if (unlikely(list_empty(&dst_mm->mmlist))) {
> > > 
> > > @@ -974,11 +974,13 @@ copy_pte_range(struct vm_area_struct *dst_vma,
> > > struct vm_area_struct *src_vma,> 
> > >                       continue;
> > >               
> > >               }
> > >               if (unlikely(!pte_present(*src_pte))) {
> > > 
> > > -                     entry.val = copy_nonpresent_pte(dst_mm, src_mm,
> > > -                                                     dst_pte, src_pte,
> > > -                                                     src_vma, addr, rss);
> > > -                     if (entry.val)
> > > +                     ret = copy_nonpresent_pte(dst_mm, src_mm,
> > > +                                             dst_pte, src_pte,
> > > +                                             src_vma, addr, rss);
> > > +                     if (ret == -EAGAIN) {
> > > +                             entry = pte_to_swp_entry(*src_pte);
> > > 
> > >                               break;
> > > 
> > > +                     }
> > > 
> > >                       progress += 8;
> > >                       continue;
> > >               
> > >               }
> > 
> > Note that -EAGAIN was previously used by copy_present_page() for early cow
> > use.  Here later although we check entry.val first:
> > 
> >         if (entry.val) {
> >                 if (add_swap_count_continuation(entry, GFP_KERNEL) < 0) {
> >                         ret = -ENOMEM;
> >                         goto out;
> >                 }
> >                 entry.val = 0;
> >         } else if (ret) {
> >                 WARN_ON_ONCE(ret != -EAGAIN);
> >                 prealloc = page_copy_prealloc(src_mm, src_vma, addr);
> >                 if (!prealloc)
> >                         return -ENOMEM;
> >                 /* We've captured and resolved the error. Reset, try again.
> > */ ret = 0;
> >         }
> > 
> > We didn't reset "ret" in entry.val case (maybe we should?). Then in the next
> > round of "goto again" if "ret" is unluckily untouched, it could reach the
> > 2nd if check, and I think it could cause an unexpected
> > page_copy_prealloc().
> 
> Thanks, I had considered that but saw "ret" was always set either by 
> copy_nonpresent_pte() or copy_present_pte(). However missed the "unlucky" case 
> at the start of the loop:
> 
> 	if (progress >= 32) {
> 		progress = 0;
> 		if (need_resched() ||
> 				spin_needbreak(src_ptl) || pin_needbreak(dst_ptl))
> 			break;
> 
> Looking at this again though checking different variables to figure out what 
> to do outside the locks and reusing error codes seems error prone. I reused -
> EAGAIN for copy_nonpresent_pte() simply because that seemed the most sensible 
> error code, but I don't think that aids readability and it might be better to 
> use a unique error code for each case needing extra handling.
> 
> So it might be better if I update this patch to:
> 1) Use unique error codes for each case requiring special handling outside the 
> lock.
> 2) Only check "ret" to determine what to do outside locks (ie. not entry.val)
> 3) Document these.
> 4) Always reset ret after handling.
> 
> Thoughts?

Looks good to me.  Thanks,

-- 
Peter Xu

