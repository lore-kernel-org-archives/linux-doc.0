Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCD3C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 14:17:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAF8A611CC
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 14:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343826AbhEROSa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 10:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50386 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240203AbhEROSa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 10:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621347432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cNUKCr7oEW4YoycabUCZ5TkkkBmsnw3r2ErIPXCKNh8=;
        b=i12pKO1RKYDjcrP3hmNwAffhNhCxRoYhRDqQq6jXj0bG5DZuap+fL43ViQF1jOwn/RIlwI
        9Nd+w60Gil0uHf7qOB67RlGOpp4mcVkM75zxHEVuvKmc4NZ1RsiIVQdM2PcJBgfvQ9gLe7
        XjEpexGFx0ZydG3eA+wPQSK/pjG+DjE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-QAK0nweMN5mb7tNd_e2Hcw-1; Tue, 18 May 2021 10:17:09 -0400
X-MC-Unique: QAK0nweMN5mb7tNd_e2Hcw-1
Received: by mail-qk1-f199.google.com with SMTP id a24-20020a05620a1038b02902fa6ba180ffso7282506qkk.0
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 07:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cNUKCr7oEW4YoycabUCZ5TkkkBmsnw3r2ErIPXCKNh8=;
        b=kYPnzUQbr88BJpIJZvAVD9ZN6gB4LYlM4Cd395oPuWiLhI6QDVlukJv5+H6lXiUqOZ
         eYqf0fuFrptecqE2UV2GGjRLmS6gAU1UZvH195RShQVZju1/uKye1eGbUzbsHaNt3FZO
         y+Oc5S435HxJC4PgRjpkYJcJqAjcdpDhhK6iG3DtGqf3BiNeC7TxLlMXJd41k7SAypZH
         c2IHu+RY/KUPRz2605IOIwIszPQrDZn1r7VgPuuB2T/xpluhBVuVkURo9V73Td7NWBIj
         5MRNSrIPThfXRGHxBGVbwbclQmV0TB0vnrjaInppxq2WANyYuWi2gs2Qbv2VCO512PEK
         +T1A==
X-Gm-Message-State: AOAM530u6Mr4ElnOz7YhCrm5x4JdOfbkzdYtp7YTVdvU8EPwFRU7JYgk
        DRWB7HtNhS76TLgPFR6lJfObsv6+6P/DP2t4PuyoQFkKPQUnJgS1jSnB7YrFyzTV6FmqQu8J1hv
        QzsYg0+ntKfx03Znsu1KY
X-Received: by 2002:a37:a854:: with SMTP id r81mr5567974qke.83.1621347429186;
        Tue, 18 May 2021 07:17:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNwMG50chJ/VK9YBnzgEPGUA+fkxk4jQnSOcxrE0QnRfHFDXo6jlaBwydyt2CUYa9cICfbkQ==
X-Received: by 2002:a37:a854:: with SMTP id r81mr5567929qke.83.1621347428799;
        Tue, 18 May 2021 07:17:08 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id a23sm12742012qtd.60.2021.05.18.07.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 07:17:07 -0700 (PDT)
Date:   Tue, 18 May 2021 10:17:06 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     linux-mm@kvack.org, nouveau@lists.freedesktop.org,
        bskeggs@redhat.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, jhubbard@nvidia.com,
        rcampbell@nvidia.com, jglisse@redhat.com, jgg@nvidia.com,
        hch@infradead.org, daniel@ffwll.ch, willy@infradead.org,
        bsingharora@gmail.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 1/8] mm: Remove special swap entry functions
Message-ID: <YKPMYuh06R2DXPHS@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210407084238.20443-2-apopple@nvidia.com>
 <YKMjvKGIHdwQN2Ml@t490s>
 <2009782.faHf7sVjGQ@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2009782.faHf7sVjGQ@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 18, 2021 at 09:58:09PM +1000, Alistair Popple wrote:
> On Tuesday, 18 May 2021 12:17:32 PM AEST Peter Xu wrote:
> > On Wed, Apr 07, 2021 at 06:42:31PM +1000, Alistair Popple wrote:
> > > +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> > > +{
> > > +     struct page *p = pfn_to_page(swp_offset(entry));
> > > +
> > > +     /*
> > > +      * Any use of migration entries may only occur while the
> > > +      * corresponding page is locked
> > > +      */
> > > +     BUG_ON(is_migration_entry(entry) && !PageLocked(p));
> > > +
> > > +     return p;
> > > +}
> > 
> > Would swap_pfn_entry_to_page() be slightly better?
> > 
> > The thing is it's very easy to read pfn_*() as a function to take a pfn as
> > parameter...
> > 
> > Since I'm also recently working on some swap-related new ptes [1], I'm
> > thinking whether we could name these swap entries as "swap XXX entries". 
> > Say, "swap hwpoison entry", "swap pfn entry" (which is a superset of "swap
> > migration entry", "swap device exclusive entry", ...).  That's where I came
> > with the above swap_pfn_entry_to_page(), then below will be naturally
> > is_swap_pfn_entry().
> 
> Equally though "hwpoison swap entry", "pfn swap entry", "migration swap 
> entry", etc. also makes sense (at least to me), but does that not fit in as 
> well with your series? I haven't looked too deeply at your series but have 
> been meaning to so thanks for the pointer.

Yeah it looks good too.  It's just to avoid starting with "pfn_" I guess, so at
least we know that's something related to swap not one specific pfn.

I found the naming is important as e.g. in my series I introduced another idea
called "swap special pte" or "special swap pte" (yeah so indeed my naming is
not that coherent as well... :), then I noticed if without a good naming I'm
afraid we can get lost easier.

I have a description here in the commit message re the new swap special pte:

https://lore.kernel.org/lkml/20210427161317.50682-5-peterx@redhat.com/

In which the uffd-wp marker pte will be the first swap special pte.  Feel free
to ignore the details too, just want to mention some context, while it should
be orthogonal to this series.

I think yet-another swap entry suites for my case too but it'll be a waste as
in that pte I don't need to keep pfn information, but only a marker (one single
bit would suffice), so I chose one single pte value (one for each arch, I only
defined that on x86 in my series which is a special pte with only one bit set)
to not pollute the swap entry address spaces.

> 
> > No strong opinion as this is already a v8 series (and sorry to chim in this
> > late), just to raise this up.
> 
> No worries, it's good timing as I was about to send a v9 which was just a 
> rebase anyway. I am hoping to try and get this accepted for the next merge 
> window but I will wait before sending v9 to see if anyone else has thoughts on 
> the naming here.
> 
> I don't have a particularly strong opinion either, and your justification is 
> more thought than I gave to naming these originally so am happy to rename if 
> it's more readable or fits better with your series.

I'll leave the decision to you, especially in case you still prefer the old
naming.  Or feel free to wait too until someone else shares the thoughts so as
to avoid unnecessary rebase work.

Thanks,

-- 
Peter Xu

