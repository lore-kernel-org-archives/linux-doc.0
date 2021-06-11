Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81D8DC48BD1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 01:00:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A94761009
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 01:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhFKBCh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 21:02:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54174 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231156AbhFKBCg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 21:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623373239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=TIpFBpUgsa+CEYbS6beP9TgLZgicFH9y1D+Hi0H76zs=;
        b=XBoIPVwGPv8LQykIzfR6iBv2wfLahv4dyZIPpPMnhr2ISgg91Y2nJ+zuLluF6yphnL3nBw
        /x792pMXyV/M9/wMm+VrRJrQ477krIAFz7nF5T9LWPBVjdF2Hjn8llKLid4aWzcx6zKuWw
        jG+CszxG0PfkD32Cxpjvboa59EArR10=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-_E2F2A-KOIyDfJRir0FmqA-1; Thu, 10 Jun 2021 21:00:38 -0400
X-MC-Unique: _E2F2A-KOIyDfJRir0FmqA-1
Received: by mail-qt1-f197.google.com with SMTP id m18-20020a05622a1192b0290247a89f63bcso952582qtk.20
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 18:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TIpFBpUgsa+CEYbS6beP9TgLZgicFH9y1D+Hi0H76zs=;
        b=C4iIoPsRw1qz39cICVZrulJeQ/puX0te84fMaSYPVh3jWTG5opxSR2K1DvQucJIKTq
         s3OReRTlen9tWNYx7aYze5CyjGDQxx08yodMI/ivCjij6pJ771O9obS77E/PNJIdc9D4
         0LvwdK5zcib509m97dsdUaxJGxTs9ZB/c8sWirzMgLulq9wqtvA71RJyLDyGPlP5uCUf
         nEGy4Du2tGfJfU0uxgA2GogQm+L/KplnQPew/6sUUfvx7kLi5w0qXuO60r6aJPIpeB/C
         MFIozrwLfrYgSIMNVHBqyXUKlWKRrTwbNTGQasVCvKAt2GdIV/3f2Bt+56KlPDskjMfS
         o67g==
X-Gm-Message-State: AOAM53141BWr7sN/tabDrkBorgSLmlI0+DLApGfYdTGt5mrezOZ44kOL
        JDQ9e3IXaQaMDlnBOjbaSWupmMRBkgii9BcRyz/mlvZRBLi8la/ldQXp82VAa4faJra1hmaMnBS
        2DpNdLJJqXV0F58oLJmGj
X-Received: by 2002:ac8:478d:: with SMTP id k13mr1622129qtq.368.1623373237358;
        Thu, 10 Jun 2021 18:00:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz117hBHeZrmV+gnZTyf8CAZNSgcamMomZRLvbKE8N/5JXdDVGO68KnPLhpJxwzn8D7ZmVhUQ==
X-Received: by 2002:ac8:478d:: with SMTP id k13mr1622098qtq.368.1623373237054;
        Thu, 10 Jun 2021 18:00:37 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca. [174.93.75.200])
        by smtp.gmail.com with ESMTPSA id g15sm3527121qkl.53.2021.06.10.18.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 18:00:36 -0700 (PDT)
Date:   Thu, 10 Jun 2021 21:00:34 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        nouveau@lists.freedesktop.org, hughd@google.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, bskeggs@redhat.com, jgg@nvidia.com,
        shakeelb@google.com, jhubbard@nvidia.com, willy@infradead.org,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v10 07/10] mm: Device exclusive memory access
Message-ID: <YMK1snSH9q4Wkyq+@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <6429491.QiJgnDeYu7@nvdebian>
 <YMKacyNstEM9brUD@t490s>
 <4307769.9k6FjFFxS5@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4307769.9k6FjFFxS5@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 09:17:14AM +1000, Alistair Popple wrote:
> On Friday, 11 June 2021 9:04:19 AM AEST Peter Xu wrote:
> > External email: Use caution opening links or attachments
> > 
> > 
> > On Fri, Jun 11, 2021 at 12:21:26AM +1000, Alistair Popple wrote:
> > > > Hmm, the thing is.. to me FOLL_SPLIT_PMD should have similar effect to explicit
> > > > call split_huge_pmd_address(), afaict.  Since both of them use __split_huge_pmd()
> > > > internally which will generate that unwanted CLEAR notify.
> > >
> > > Agree that gup calls __split_huge_pmd() via split_huge_pmd_address()
> > > which will always CLEAR. However gup only calls split_huge_pmd_address() if it
> > > finds a thp pmd. In follow_pmd_mask() we have:
> > >
> > >       if (likely(!pmd_trans_huge(pmdval)))
> > >               return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
> > >
> > > So I don't think we have a problem here.
> > 
> > Sorry I didn't follow here..  We do FOLL_SPLIT_PMD after this check, right?  I
> > mean, if it's a thp for the current mm, afaict pmd_trans_huge() should return
> > true above, so we'll skip follow_page_pte(); then we'll check FOLL_SPLIT_PMD
> > and do the split, then the CLEAR notify.  Hmm.. Did I miss something?
> 
> That seems correct - if the thp is not mapped with a pmd we won't split and we
> won't CLEAR. If there is a thp pmd we will split and CLEAR, but in that case it
> is fine - we will retry, but the retry will won't CLEAR because the pmd has
> already been split.

Aha!

> 
> The issue arises with doing it unconditionally in make device exclusive is that
> you *always* CLEAR even if there is no thp pmd to split. Or at least that's my
> understanding, please let me know if it doesn't make sense.

Exactly.  But if you see what I meant here, even if it can work like this, it
sounds still fragile, isn't it?  I just feel something is slightly off there..

IMHO split_huge_pmd() checked pmd before calling __split_huge_pmd() for
performance, afaict, because if it's not a thp even without locking, then it
won't be, so further __split_huge_pmd() is not necessary.

IOW, it's very legal if someday we'd like to let split_huge_pmd() call
__split_huge_pmd() directly, then AFAIU device exclusive API will be the 1st
one to be broken with that seems-to-be-irrelevant change I'm afraid..

This lets me goes back a step to think about why do we need this notifier at
all to cover this whole range of make_device_exclusive() procedure..

What I am thinking is, we're afraid some CPU accesses this page so the pte got
quickly restored when device atomic operation is carrying on.  Then with this
notifier we'll be able to cancel it.  Makes perfect sense.

However do we really need to register this notifier so early?  The thing is the
GPU driver still has all the page locks, so even if there's a race to restore
the ptes, they'll block at taking the page lock until the driver releases it.

IOW, I'm wondering whether the "non-fragile" way to do this is not do
mmu_interval_notifier_insert() that early: what if we register that notifier
after make_device_exclusive_range() returns but before page_unlock() somehow?
So before page_unlock(), race is protected fully by the lock itself; after
that, it's done by mmu notifier.  Then maybe we don't need to worry about all
these notifications during marking exclusive (while we shouldn't)?

Sorry in advance if I overlooked anything as I know little on device side (even
less than mm itself).  Also sorry to know that this series got marked
to-be-update in -mm; hopefully it'll still land soon even if it still needs
some rebase to other more important bugfixes - I definitely jumped in too late
even if to mess this all up. :-)

-- 
Peter Xu

