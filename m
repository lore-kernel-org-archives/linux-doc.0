Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EF0C4707F
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 13:05:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D033610A2
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 13:05:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235903AbhE0NGg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 09:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36544 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235793AbhE0NGf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 May 2021 09:06:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622120702;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4rzzOa6q+9jkHUrjBMT6aDA8TmT+khUNIgkx743Uidw=;
        b=XBRT1l8UkjViDViZF7DaJKbAZGRmiVLPiLVkSlpEYfefyPR/5ZTaR+tJ5fE+3qnFRqG2W9
        pju/9VxBri6P7ws2r0LXe9ol7Foah3xnneRyJtqoqSFQfYMGgBrQiD/3lgntWoyYMmRWgY
        Zj5KD0dPuR/QVTeRBQFdOssNYJoQZ0o=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-xv_QOpyPOX-zAja9LSybng-1; Thu, 27 May 2021 09:05:00 -0400
X-MC-Unique: xv_QOpyPOX-zAja9LSybng-1
Received: by mail-qk1-f198.google.com with SMTP id s123-20020a3777810000b02902e9adec2313so405892qkc.4
        for <linux-doc@vger.kernel.org>; Thu, 27 May 2021 06:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4rzzOa6q+9jkHUrjBMT6aDA8TmT+khUNIgkx743Uidw=;
        b=K+rJDs2UH0Elu6fTWMEYbMj9NjfkaUtB1gbg0jwSvVM4aFLIKhDI0CNFzS4abiyTsy
         /8yfTeFLP8+SSgxSDg1/dapeqD/FO+W45UgLx1aZksITWT01irKpN8NSw58NiQD413vS
         hKvyuWOluszmTzBMpeTKQgWdfGv0g2b31SiBADMK+kx68erXdojWHpfmcFl+RJymKZWF
         ppIO9kkhnew7Kkrfb8DobFblY8hkrD6ognph/SmBUa/IJao+8rgL59E9ZxIZP5mzwEF1
         Ct5olCDM1p8ANHPCdXbauuRZljOuWz7yzEcbK5ZB5G9OJBNlifB4FsofifYYWBPyzPGc
         RuiA==
X-Gm-Message-State: AOAM531FYoUXtVqLvgG6BbI033geNzcthCoeioyLhfW8DedC/gHdxG09
        LEPSXrkeR+RlpxVGljLSO8EtRSs1aZXEX+WVYnTQ2fTnB37s8TeEUaqazHta8cahwbnhvBAW82d
        exOX3tNLHNuMDjg/P34rf
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr2991623qta.240.1622120700036;
        Thu, 27 May 2021 06:05:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzF9/f/oCcd+BBWrvSHgnJ7MXTSn158rInAQdiALMQLZF3k9Vcpr9xEm1OHlKUAk1TCJw9rGQ==
X-Received: by 2002:ac8:5f84:: with SMTP id j4mr2991568qta.240.1622120699489;
        Thu, 27 May 2021 06:04:59 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id p63sm1325517qkf.31.2021.05.27.06.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 06:04:58 -0700 (PDT)
Date:   Thu, 27 May 2021 09:04:57 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, akpm@linux-foundation.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        rcampbell@nvidia.com, linux-doc@vger.kernel.org,
        jhubbard@nvidia.com, bsingharora@gmail.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        hch@infradead.org, jglisse@redhat.com, willy@infradead.org,
        jgg@nvidia.com, hughd@google.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
Message-ID: <YK+Y+aAZHDv8+w+Q@t490s>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <YK6hYGEx+XzeZELV@t490s>
 <37725705.JvxlXkkoz5@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <37725705.JvxlXkkoz5@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 27, 2021 at 01:35:39PM +1000, Alistair Popple wrote:
> > > + *
> > > + * @MMU_NOTIFY_EXCLUSIVE: to signal a device driver that the device will
> > > no + * longer have exclusive access to the page. May ignore the
> > > invalidation that's + * part of make_device_exclusive_range() if the
> > > owner field
> > > + * matches the value passed to make_device_exclusive_range().
> > 
> > Perhaps s/matches/does not match/?
> 
> No, "matches" is correct. The MMU_NOTIFY_EXCLUSIVE notifier is to notify a 
> listener that a range is being invalidated for the purpose of making the range 
> available for some device to have exclusive access to. Which does also mean a 
> device getting the notification no longer has exclusive access if it already 
> did.
> 
> A unique type is needed because when creating the range a driver needs to form 
> a mmu critical section (with mmu_interval_read_begin()/
> mmu_interval_read_end()) to ensure the entry remains valid long enough to 
> program the device pte and hasn't been invalidated.
> 
> However without a way of filtering any invalidations will result in a retry, 
> but make_device_exclusive_range() needs to do an invalidation during 
> installation of the entry. To avoid this causing infinite retries the driver 
> ignores specific invalidation events that it knows don't apply, ie. the 
> invalidations that are a result of that driver asking for device exclusive 
> entries.

OK I think I get it now.. so the driver checks both EXCLUSIVE and owner, if all
match it skips the notify, otherwise it's treated like all the rest.  Thanks.

However then it's still confusing (as I raised it too in previous comment) that
we use CLEAR when re-installing the valid pte.  It's merely against what CLEAR
means.

How about sending EXCLUSIVE for both mark/restore?  Just that when restore we
notify with owner==NULL telling that no one is owning it anymore so driver
needs to drop the ownership.  I assume your driver patch does not need change
too.  Would that be much cleaner than CLEAR?  I bet it also makes commenting
the new notify easier.

What do you think?

[...]

> > > +                                   vma->vm_mm, address, min(vma->vm_end,
> > > +                                   address + page_size(page)),
> > > args->owner); +     mmu_notifier_invalidate_range_start(&range);
> > > +
> > > +     while (page_vma_mapped_walk(&pvmw)) {
> > > +             /* Unexpected PMD-mapped THP? */
> > > +             VM_BUG_ON_PAGE(!pvmw.pte, page);
> > > +
> > > +             if (!pte_present(*pvmw.pte)) {
> > > +                     ret = false;
> > > +                     page_vma_mapped_walk_done(&pvmw);
> > > +                     break;
> > > +             }
> > > +
> > > +             subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> > 
> > I see that all pages passed in should be done after FOLL_SPLIT_PMD, so is
> > this needed?  Or say, should subpage==page always be true?
> 
> Not always, in the case of a thp there are small ptes which will get device 
> exclusive entries.

FOLL_SPLIT_PMD will first split the huge thp into smaller pages, then do
follow_page_pte() on them (in follow_pmd_mask):

	if (flags & FOLL_SPLIT_PMD) {
		int ret;
		page = pmd_page(*pmd);
		if (is_huge_zero_page(page)) {
			spin_unlock(ptl);
			ret = 0;
			split_huge_pmd(vma, pmd, address);
			if (pmd_trans_unstable(pmd))
				ret = -EBUSY;
		} else {
			spin_unlock(ptl);
			split_huge_pmd(vma, pmd, address);
			ret = pte_alloc(mm, pmd) ? -ENOMEM : 0;
		}

		return ret ? ERR_PTR(ret) :
			follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
	}

So I thought all pages are small pages?

-- 
Peter Xu

