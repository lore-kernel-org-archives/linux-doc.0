Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36EACC47088
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 23:45:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 083B561420
	for <linux-doc@archiver.kernel.org>; Tue, 25 May 2021 23:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231978AbhEYXrN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 May 2021 19:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbhEYXrM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 May 2021 19:47:12 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E27DFC061756
        for <linux-doc@vger.kernel.org>; Tue, 25 May 2021 16:45:41 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id v8so43672077lft.8
        for <linux-doc@vger.kernel.org>; Tue, 25 May 2021 16:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3bWAgXGiiTzRVKYdfnPTxYrHckcttw3uRegUUnWbckY=;
        b=hhrAWAHsfs4V6Q1rRk+5RzotFe5WWhSfBpNqaVfrq48cm1yZ4mCi/3DHK5lHSGhFsd
         SmJ1xpnVoC7GwKmpH3GoRruIKeU8Ih6iy6Ws79VyE23+Fo9+g4JbUuKztOnJQ/A75X32
         F6tDH6wZDjxQVpUNs2UF0fySZ6sghA7NntIauYgD3MF2VdG4v6OLxVduYDUv5zVgV76d
         JmwjeX0l2NgUtx/F5ZxGtsUf5xupPKtD5PS/OAlZL4HfxZcTuGUESs0ONaygDVe19cwv
         FQzPzjRzsZB6Fnrt5Ecm93WJVhOzxD/x/n3M9I7hGisNhSKHzTk/Tm0AJmUjDadrhVhA
         Z3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3bWAgXGiiTzRVKYdfnPTxYrHckcttw3uRegUUnWbckY=;
        b=af6JqV0FQx16ieage616hT5aiTNX8wIV2578anLR9Bv46o2Wyp9afk33HwA1anVUlS
         YaIkBHb+gvwkoxkIT36jTgpz9Ner6cZOhm+w2TDZGKBa95x54NjclOcf+A3dE1+9KSld
         dAX+jI8wh+w+KOVC+ImYFIScalbOLE6GpU4HJk58tR1AOHL84x276TRcDFm5mWdY+AgF
         gQ/whthqK8a1ZPTxDHrh5OLypz6jlsjp+JN2j0EuqDgGiDuV3CuQXG7O3jEOXVTdPGDt
         2vZlP5aTc+g5O42SCWJTMT9UmtNf447TiEOolfu2TeNvMviGkJFU4Yy/WokHOWSV2bjz
         DWfg==
X-Gm-Message-State: AOAM532vejphFFDjWGjpGy16uDgJOCR3jsbQzVL7ua3bRoQUMjrZY/ca
        4i2brfhPkjLVNwpi2agtk3Wdl4MvdyP/r16sVmF6GQ==
X-Google-Smtp-Source: ABdhPJy9hB4q6/cvtU+d+uGxv+1Wbe3+B9NkI4vv8arO0VwtZXiweVdebha1FQ1CcW8CnxfqxV9Z3KwiBdSb7es7wjA=
X-Received: by 2002:a05:6512:3da3:: with SMTP id k35mr69007lfv.347.1621986339891;
 Tue, 25 May 2021 16:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132725.12697-1-apopple@nvidia.com> <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver>
In-Reply-To: <20210525183710.fa2m2sbfixnhz7g5@revolver>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 25 May 2021 16:45:28 -0700
Message-ID: <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
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

On Tue, May 25, 2021 at 11:40 AM Liam Howlett <liam.howlett@oracle.com> wrote:
>
[...]
> >
> > +/*
> > + * Walks the vma's mapping a page and mlocks the page if any locked vma's are
> > + * found. Once one is found the page is locked and the scan can be terminated.
> > + */
>
> Can you please add that this requires the mmap_sem() lock to the
> comments?
>

Why does this require mmap_sem() lock? Also mmap_sem() lock of which mm_struct?

> > +static bool page_mlock_one(struct page *page, struct vm_area_struct *vma,
> > +                              unsigned long address, void *unused)
> > +{
> > +     struct page_vma_mapped_walk pvmw = {
> > +             .page = page,
> > +             .vma = vma,
> > +             .address = address,
> > +     };
> > +
> > +     /* An un-locked vma doesn't have any pages to lock, continue the scan */
> > +     if (!(vma->vm_flags & VM_LOCKED))
> > +             return true;
> > +
> > +     while (page_vma_mapped_walk(&pvmw)) {
> > +             /* PTE-mapped THP are never mlocked */
> > +             if (!PageTransCompound(page))
> > +                     mlock_vma_page(page);
> > +             page_vma_mapped_walk_done(&pvmw);
> > +
> > +             /*
> > +              * no need to continue scanning other vma's if the page has
> > +              * been locked.
> > +              */
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
