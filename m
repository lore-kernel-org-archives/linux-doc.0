Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16F0C48BC2
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 00:41:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98E9D61003
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 00:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbhFEAnT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Jun 2021 20:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231189AbhFEAnT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jun 2021 20:43:19 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AAD9C061767
        for <linux-doc@vger.kernel.org>; Fri,  4 Jun 2021 17:41:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id e2so13794821ljk.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 17:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S0RNl1ValKKRLQbUx9zapSSxQl8HE3O+Grx55QC8BB8=;
        b=ojqlPcYN//lzjPCK23tdLtRIIYrgW9m/5kJ/xOjRInCF4R7iFC1/I0ZkVLmxGV8DXR
         MQWb07lHHZMwwI3mGCRqMAesfKm1mWvsT1fKDr2EyaZCEGoXBk5MRscqdZbVrfjd6byB
         UC2OAmXNTjZ1XXqU2QIkZUr+320CRdtEbj7InexW97stnDZxR/A2mRYURCjA4zPGoT8h
         zZKD7TJ6uy/9jzID2bu4rxwrKqn/bYNh5LMyz+lefblMFpIWrDYNy/UqqVnv9iY+GCYm
         zCIocFSTC5JEnil58sWiJDJ+0EtmDGYceal8ew26Jn/vZJQwmrzF2MxxEU2hsojtFjNK
         mK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S0RNl1ValKKRLQbUx9zapSSxQl8HE3O+Grx55QC8BB8=;
        b=L2WjH0akO1Eg8arriqgeBwppaWv77KC80+cPtwp0fHU2WQkJf7LGyQasfByR2YOtbV
         QN/AAqvGDAYXAsB9TOH76t9Oty0ROWUs7a5Be/lu7uuVaAVKLZjCAE76dcbwIJS5jiPC
         GO4cSW40WcA2GfKjLpAtzWx1HMnRtaE6aoBXKMvHgZOBo4ENDDtkUU5gwwpp/MBds+KZ
         LwlAAN5/mKalua3iCN03KpC7h8X+N/EGfEIq//uXsu/KD6GgXr1f5ravmgOvAZWR2j9r
         0XrdzpLePcy81olrIdGOd3JOWtPYBaaJ0skded7kmNW4g4JG9aXpZW/jF52rR0lai/G5
         WjIg==
X-Gm-Message-State: AOAM530gOzSSpbXY7KWxYXeLanbcLCIgTut6k+26kOc4by+Ynp9Lfhlg
        JFRdiabpqBeDSBEabszpuYBsvNdzvu0ZWWYON1C99Q==
X-Google-Smtp-Source: ABdhPJz1RZbFciQV1FijFF60AoPQ2WRU7bGHglkLlwJI2jhHqLCKOZ4khT7GPCOGC1aZRVomGnuidnciWbK1dWihUSA=
X-Received: by 2002:a05:651c:292:: with SMTP id b18mr5197181ljo.456.1622853674402;
 Fri, 04 Jun 2021 17:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132725.12697-1-apopple@nvidia.com> <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver> <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
 <20210604204934.sbspsmwdqdtmz73d@revolver>
In-Reply-To: <20210604204934.sbspsmwdqdtmz73d@revolver>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Fri, 4 Jun 2021 17:41:03 -0700
Message-ID: <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
Subject: Re: [PATCH v9 03/10] mm/rmap: Split try_to_munlock from try_to_unmap
To:     Liam Howlett <liam.howlett@oracle.com>
Cc:     Alistair Popple <apopple@nvidia.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
        "bskeggs@redhat.com" <bskeggs@redhat.com>,
        "rcampbell@nvidia.com" <rcampbell@nvidia.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "jhubbard@nvidia.com" <jhubbard@nvidia.com>,
        "bsingharora@gmail.com" <bsingharora@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "hch@infradead.org" <hch@infradead.org>,
        "jglisse@redhat.com" <jglisse@redhat.com>,
        "willy@infradead.org" <willy@infradead.org>,
        "jgg@nvidia.com" <jgg@nvidia.com>,
        "peterx@redhat.com" <peterx@redhat.com>,
        "hughd@google.com" <hughd@google.com>,
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 4, 2021 at 1:49 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> * Shakeel Butt <shakeelb@google.com> [210525 19:45]:
> > On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.com> wrote:
> > >
> > [...]
> > > >
> > > > +/*
> > > > + * Walks the vma's mapping a page and mlocks the page if any locked vma's are
> > > > + * found. Once one is found the page is locked and the scan can be terminated.
> > > > + */
> > >
> > > Can you please add that this requires the mmap_sem() lock to the
> > > comments?
> > >
> >
> > Why does this require mmap_sem() lock? Also mmap_sem() lock of which mm_struct?
>
>
> Doesn't the mlock_vma_page() require the mmap_sem() for reading?  The
> mm_struct in vma->vm_mm;
>

We are traversing all the vmas where this page is mapped of possibly
different mm_structs. I don't think we want to take mmap_sem() of all
those mm_structs. The commit b87537d9e2fe ("mm: rmap use pte lock not
mmap_sem to set PageMlocked") removed exactly that.

>
> From what I can see, at least the following paths have mmap_lock held
> for writing:
>
> munlock_vma_pages_range() from __do_munmap()
> munlokc_vma_pages_range() from remap_file_pages()
>

The following path does not hold mmap_sem:

exit_mmap() -> munlock_vma_pages_all() -> munlock_vma_pages_range().

I would really suggest all to carefully read the commit message of
b87537d9e2fe ("mm: rmap use pte lock not mmap_sem to set
PageMlocked").

Particularly the following paragraph:
...
    Vlastimil Babka points out another race which this patch protects against.
     try_to_unmap_one() might reach its mlock_vma_page() TestSetPageMlocked a
    moment after munlock_vma_pages_all() did its Phase 1 TestClearPageMlocked:
    leaving PageMlocked and unevictable when it should be evictable.  mmap_sem
    is ineffective because exit_mmap() does not hold it; page lock ineffective
    because __munlock_pagevec() only takes it afterwards, in Phase 2; pte lock
    is effective because __munlock_pagevec_fill() takes it to get the page,
    after VM_LOCKED was cleared from vm_flags, so visible to try_to_unmap_one.
...

Alistair, please bring back the VM_LOCKED check with pte lock held and
the comment "Holding pte lock, we do *not* need mmap_lock here".

One positive outcome of this cleanup patch is the removal of
unnecessary invalidation (unmapping for kvm case) of secondary mmus.
