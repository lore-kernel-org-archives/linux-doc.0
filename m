Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FB1C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 20:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D2FB60E9B
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 20:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhHTU0g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 16:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28058 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230453AbhHTU0f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Aug 2021 16:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629491157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OofmC3KmC1fAUo3gvf6inPC1PTd9MGar+6jrupGG0v8=;
        b=A0Ka8P8ZO2l8du+ik7CAJzZukKB3uv/FilVvFcHdz/2vHcH2O9ME+vVREWKM0TTbFurp/o
        +BrrIFQX9s9htLCZzLA4bPXMpCoONkr0fY4mjO5uddxQg4u09TBIFVU3AZhA/ZB+PQJYtb
        n+/Yes/XRpUvOOgTXVFOEc0Ujt7sLm4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-PjuADUR8Oo6rshacr8zLDw-1; Fri, 20 Aug 2021 16:25:56 -0400
X-MC-Unique: PjuADUR8Oo6rshacr8zLDw-1
Received: by mail-qk1-f200.google.com with SMTP id f16-20020a05620a409000b003f64aae951cso1659475qko.5
        for <linux-doc@vger.kernel.org>; Fri, 20 Aug 2021 13:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OofmC3KmC1fAUo3gvf6inPC1PTd9MGar+6jrupGG0v8=;
        b=cy9VNiyg9skHJrdsM/geWTrrKIikdMeLBDtdwFAb1CwU7DiKkkzFuRmeChS4DY7gg0
         P/aTqNyxnQfyubUJg4UD3bak3dV+FIHvPG/caAztYMIs6DmRRd7tXfAwCsYYDArM6WqS
         FFMT4EioCMcATi+Me9x4UsKzubh4ootqOaGq5+P7NDcNjmPDWA3A4mGMa3b92+dmgUsE
         0Vhrb7uyd+L6BuPeflP5/M9rsHgry11jibNuxbUmZglIeEjYbZXr5ag61gaSF9NxgNui
         9mCBJ8KsHFPUbroKc9mzLXI0VBvy5QpyjFQhwb89602sfvPMWben1ALI56I1P0KMk0As
         otCw==
X-Gm-Message-State: AOAM530igxe/W4ygnRGkoZOVwNeuklHZ1A1IXJdH4nz5euKg3f20ulq8
        3kLUC6iv2p+gd8hhhyTlHhP20ib+xOf/2+P5oZ2speg3On5sDArbsQaDTiYz3YPu74Y7MRA8T+s
        QoJA206YOUfkaMv8UoGtu
X-Received: by 2002:ac8:4f44:: with SMTP id i4mr19765430qtw.266.1629491155575;
        Fri, 20 Aug 2021 13:25:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6HJ8zVctL+Jg7KqH8AE4uaJHe3H55M1k+sET03T91QxBkiR7/qEROzUkpfDT8hyUwyG7pAw==
X-Received: by 2002:ac8:4f44:: with SMTP id i4mr19765411qtw.266.1629491155380;
        Fri, 20 Aug 2021 13:25:55 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
        by smtp.gmail.com with ESMTPSA id x9sm3732863qko.125.2021.08.20.13.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 13:25:54 -0700 (PDT)
Date:   Fri, 20 Aug 2021 16:25:53 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Tiberiu Georgescu <tiberiu.georgescu@nutanix.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "peter.xu@redhat.com" <peter.xu@redhat.com>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <flosch@nutanix.com>,
        "Carl Waldspurger [C]" <carl.waldspurger@nutanix.com>,
        Jonathan Davies <jond@nutanix.com>
Subject: Re: [PATCH] Documentation: update pagemap with SOFT_DIRTY & UFFD_WP
 shmem issue
Message-ID: <YSAP0d8nxBShQiF+@t490s>
References: <20210812155843.236919-1-tiberiu.georgescu@nutanix.com>
 <8f7d6856-7bcd-dedf-663b-cd7ef2d0827f@redhat.com>
 <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <F04C4283-0D25-4D0E-B3A8-05B36ACFF30D@nutanix.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Tiberiu,

On Fri, Aug 20, 2021 at 05:10:20PM +0000, Tiberiu Georgescu wrote:
> Currently, the missing information for shmem is this:
> 1. Difference between is_swap(pte) and is_none(pte).
>     * is_swap(pte) is always false;
>     * is_none(pte) is true when is_swap() should have been;
>     * is_present(pte) is fine.
> 2. swp_entry(pte)
>     Particularly, swp_type() and swp_offset().
> 3. SOFT_DIRTY_BIT
>     This is not always missing for shmem. 
>     Once 4 is written to clear_refs, if the page is dirtied, the bit is fine as long as it
>     is still in memory. If the page is swapped out, the bit is lost. Then, if the page is
>     brought back into memory, the bit is still lost.
> 
> For 1, you mentioned how lseek() and madvise() can be used to get this
> information [2], and I proposed a different method with a little help from
> the current pagemap[3]. They have slightly different output and applications, so
> the difference should be taken into consideration.
> For 2, if anyone knows of any way of retrieve the missing information cleanly,
> please let us know. 
> As for 3, AFAIK, we will need to leverage Peter's special PTE marker mechanism
> and implement it in another patch.
> 
> [2]: https://lore.kernel.org/lkml/5766d353-6ff8-fdfa-f8f9-764e8de9b5aa@redhat.com/
> [3]: https://lore.kernel.org/lkml/B130B700-B3DB-4D07-A632-73030BCBC715@nutanix.com/
> 
> ============================
> For completeness, I would like to mention Peter's RFC[4] and my own patch[5],
> which deal with adding missing functionality to the pagemap when pages are
> shmem/tmpfs.
> 
> Peter's patch[4] adds the missing information at 1 to the pagemap, with very little performance overhead. AFAIK, it is still WIP.
> 
> My patch[5] fixes both 1 and 2, at the expense of a significant loss in performance
> when dealing with swapped out shared pages. This performance loss can be
> reduced with batching, for use cases when high performance matters. Also, this
> patch on top of Peter's RFC yields better performance[6]. Still 2x as slow on
> average compared to pre-patch.
> 
> Peter's patch has a config flag, and I intend to add one to mine in the next
> version. So I wanted to propose, if alternatives are not implemented yet (mincore,
> lseek, map_files or otherwise are insufficient), we upstream our patches (once
> they are ready), so that users can toggle them on or off, depending on whether
> they need the extra functionality or not. And, of course, document their usage.
> 
> If neither sounds like a particularly useful/convenient option, we might need to
> look into designs of retrieving the missing information via another mechanism
> (sys/fs, ioctl, netlink etc).
> 
> That is, unless we find that we can/should place this info in the pagemap still, for
> the sake of correctness and completeness. For that though, we should convene
> on what do we expect the pagemap to do in the end. Is shmem/tmpfs out of
> bounds for it or not?
> 
> [4]: https://lore.kernel.org/lkml/20210807032521.7591-1-peterx@redhat.com/
> [5]: https://lore.kernel.org/lkml/20210730160826.63785-1-tiberiu.georgescu@nutanix.com/
> [6]: https://lore.kernel.org/lkml/C0DB3FED-F779-4838-9697-D05BE96C3514@nutanix.com/

Thanks for summarizing the issues.

Before going further, I really would like to understand a few questions that I
already raised in the other thread here:

https://lore.kernel.org/lkml/YR%2F+gfL8RCP8XoB1@t490s/

They're:

  (1) Whether does mincore() suit your need already?

  (2) What would you like to do with swap entries in pagemap?

I'm more interested in question (2) because I never figured it out before, and
I really don't see how it would work even if the kernel can share swap format
to userspace.  E.g., right after you decided to "zero copy" that page, the page
can be faulted in right before live migration finishes, and it can be dirtied
again.  Then the page on the shared network storage will be stall, the same to
the swap entry you just scanned.

Thanks,

-- 
Peter Xu

