Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D458C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 12:15:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E32661353
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 12:15:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346485AbhESMRG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 08:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26540 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241057AbhESMRG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 08:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621426546;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tpsW6GoLBuPX3m2t6ZDWDsXVHyOzAne0XpIqOVeHL30=;
        b=iWJyJ2JzQRelZ805GCtdPoB9VQ1XEdIFM564RmmA7mx2ZGzJqSwzReDjGZYbV/b2mEll1M
        EWEOflN3vFnYnv+LNtdPgqnUgeQAmdbryad4yfCU6fCUY9bC7BpELXBFv9n0mkZJyVjMMT
        fKznwmsLn0Y2agTqb3v5v8170IhBbME=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-voVX9FLxPuGvjW7HNbFSdQ-1; Wed, 19 May 2021 08:15:45 -0400
X-MC-Unique: voVX9FLxPuGvjW7HNbFSdQ-1
Received: by mail-qt1-f197.google.com with SMTP id d7-20020ac811870000b02901e65f85117bso9686450qtj.18
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 05:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tpsW6GoLBuPX3m2t6ZDWDsXVHyOzAne0XpIqOVeHL30=;
        b=C0DCN82C+C1FXkCE1lyNVLakaMQutsIWNHz6Ch3FwzNqziyezEuSE1MOs6xaTPP9iJ
         Db8gQ7GfRHMS0yvPorfzKSv+a5T6t3yBp8IZ8oI2Hc5ZQC2KzBc6Pt98OXTda87iAyQi
         52fWk7l5UDYrE9UkvrXDkoWMdTi3+aP9zyqrEPUP4GgdoKPrDFIcagTsYKHPdNMx9FHp
         38M1lJQDiUkyZLHcAc/Q+OrA/pszTeW1+8FyMfeRCBPm8/q4mSTh8A7GGIIF1BreZNvU
         Sg3Xelewkhtjr2N/WtOJKi3bQ0lq6XSgKBcOLhL6gJ8xsXEqCANYd6WNrenVFuIOU4Ja
         qkIA==
X-Gm-Message-State: AOAM531IAb3IhVEjEkceOsGTxiA3bpGMqjFuqajAp1Q6nxt+TEHr/WV4
        Cw6+xSu9QcqZUtJAOe0WmXM6FJq8iAo06tkGYCsEkX5gYwNe/58T9gDnr3deEmxnL7Hfef7CGfC
        fkKNPQfovHNxBUTQbIIQH
X-Received: by 2002:a05:6214:20c4:: with SMTP id 4mr13194998qve.38.1621426543764;
        Wed, 19 May 2021 05:15:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJeMvnD48yKledjvAvmUkVuVahWxfS9KHq8l5vFptQfcG6pDYRH4satuz1xLVBYj0ZmxaSVA==
X-Received: by 2002:a05:6214:20c4:: with SMTP id 4mr13194979qve.38.1621426543531;
        Wed, 19 May 2021 05:15:43 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id y9sm14576208qkm.19.2021.05.19.05.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 05:15:42 -0700 (PDT)
Date:   Wed, 19 May 2021 08:15:41 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Alistair Popple <apopple@nvidia.com>
Cc:     Jason Gunthorpe <jgg@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jhubbard@nvidia.com, rcampbell@nvidia.com, jglisse@redhat.com,
        hch@infradead.org, daniel@ffwll.ch, willy@infradead.org,
        bsingharora@gmail.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUBbVuvm5FUJRMl@t490s>
References: <20210407084238.20443-1-apopple@nvidia.com>
 <20210518230327.GG1002214@nvidia.com>
 <YKRRgZmRMdk1vH7A@t490s>
 <2235357.HsqDk0zIjc@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2235357.HsqDk0zIjc@nvdebian>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 19, 2021 at 09:04:53PM +1000, Alistair Popple wrote:
> Failing fork() because we couldn't take a lock doesn't seem like the right 
> approach though, especially as there is already existing code that retries. I 
> get this adds complexity though, so would be happy to take a look at cleaning 
> copy_pte_range() up in future.

Yes, I proposed that as this one won't affect any existing applications (unlike
the existing ones) but only new userspace driver apps that will use this new
atomic feature.

IMHO it'll be a pity to add extra complexity and maintainance burden into
fork() if only for keeping the "logical correctness of fork()" however the code
never triggers. If we start with trylock we'll know whether people will use it,
since people will complain with a reason when needed; however I still doubt
whether a sane userspace device driver should fork() within busy interaction
with the device underneath..

In all cases, please still consider to keep them in copy_nonpresent_pte() (and
if to rework, separating patches would be great).

Thanks,

-- 
Peter Xu

