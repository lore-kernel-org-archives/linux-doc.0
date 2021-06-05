Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144EBC47082
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 04:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E46316140F
	for <linux-doc@archiver.kernel.org>; Sat,  5 Jun 2021 04:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhFEEXJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Jun 2021 00:23:09 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:39672 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhFEEXI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Jun 2021 00:23:08 -0400
Received: by mail-lf1-f51.google.com with SMTP id p17so16303978lfc.6
        for <linux-doc@vger.kernel.org>; Fri, 04 Jun 2021 21:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MHI92OzbTRuOfSGogKDicdkw31a8xsuWOtLJPqvNx58=;
        b=hMgR5HN4yLicvtzTkSenR0cUmaDMZ2bwQfTgqhAeBKkYQcwNCoeTgDZnEobu//usT8
         Ay/dOOX+J6E7bJRr1XvMPGgkoPiBmdX/2xqSg4Vo/W4VrAXO8PjhbgR9yQwpkcG6nlLc
         fbSbfa7bfIC6dmEr9rWwGKtkDi8RmjSZPBvphT0Cy+BprGCLoZauID7MlPnWzO2oeVnj
         W6ncU98HPZzq8jlGTu5Jn0PazLejKzS6xdoK7HomnNLR4CDiAtYCpS9t6mX+ejA6rgCS
         MiqK8pSbDacX5XdtYXY4wYvzqcnyf+9CXm5yqWHtv880W6cgl7d+qF4GLWNLYoWwX9z8
         t2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MHI92OzbTRuOfSGogKDicdkw31a8xsuWOtLJPqvNx58=;
        b=NAU2Q/HX/JBsyk/afxVLq9nzvU2v+mBFkt/HfSG8amy7odhUr6T1T/7ilHA58Gqwtb
         nNDUw1Peoo1w8DJ5ZZknz0Rt62giolpH4QtZRXEh2w+STfzZLGA4qeQ5YlK/lB9V17oF
         bdHXkZnJiHs4G66dZ9p8vy+Sc7MBosoApfqDzQrER3GGKeHQ3zR4wcZk17HnwgAaRWmb
         voSkzvz1PUMhGRHD/jZMTH4rHpPLbhwcyKSxrVLlOz8E01ISXy77T0OEyLQ+MzfB6P3I
         qoTLk01/862nWMMDCSDB9iiBJZ64MvgJ4U28fuRAZ6GzRl13UkMI5pOT3ZtuDLMS+dtr
         vfrQ==
X-Gm-Message-State: AOAM532vuns08N947Czq0r/M1gEMLQdowqAzAJYK/tSUiWOuanYlDU9s
        fZOe1AVAyD3I0ylJq73M6fOZHp7F447cFZr7Nf4i1g==
X-Google-Smtp-Source: ABdhPJzxYihxXg8hJVDo1Cgn/BkB4ckK/wPvPVxczOItEciBDrO1zlGB84+NZGpQvumQ3vq3TiIiFzC4d9tPVTCKElo=
X-Received: by 2002:a19:da12:: with SMTP id r18mr4769335lfg.549.1622866806719;
 Fri, 04 Jun 2021 21:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132725.12697-1-apopple@nvidia.com> <20210524132725.12697-4-apopple@nvidia.com>
 <20210525183710.fa2m2sbfixnhz7g5@revolver> <CALvZod5T1yjOk48Q_efppvP6iQWnSUwdOQL=G9TadrB6nS-s4Q@mail.gmail.com>
 <20210604204934.sbspsmwdqdtmz73d@revolver> <CALvZod6myLUu0j13=nn2vCbH7kQJ4yXs06=0+pZYie2ZN13Mxw@mail.gmail.com>
 <20210605033926.pkeq2saomieebrqa@revolver>
In-Reply-To: <20210605033926.pkeq2saomieebrqa@revolver>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Fri, 4 Jun 2021 21:19:55 -0700
Message-ID: <CALvZod5EWuUu7MfJ12_+QTY2MUinmShoS+0hoRGVcn5Q1G6eHw@mail.gmail.com>
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

On Fri, Jun 4, 2021 at 8:39 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> > Particularly the following paragraph:
> > ...
> >     Vlastimil Babka points out another race which this patch protects against.
> >      try_to_unmap_one() might reach its mlock_vma_page() TestSetPageMlocked a
> >     moment after munlock_vma_pages_all() did its Phase 1 TestClearPageMlocked:
> >     leaving PageMlocked and unevictable when it should be evictable.  mmap_sem
> >     is ineffective because exit_mmap() does not hold it; page lock ineffective
> >     because __munlock_pagevec() only takes it afterwards, in Phase 2; pte lock
> >     is effective because __munlock_pagevec_fill() takes it to get the page,
> >     after VM_LOCKED was cleared from vm_flags, so visible to try_to_unmap_one.
> > ...
>
> So this is saying the race with exit_mmap() isn't benign after all?
>

Yes, not benign at all.
