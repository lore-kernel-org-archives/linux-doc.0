Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86047C433ED
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 14:09:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 634AE6135A
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 14:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347085AbhESOK7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 10:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40390 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347019AbhESOK6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 May 2021 10:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621433378;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=uA5LBQUpQQcpe5I2oDgwRimXB7jI4me/eAnHY5LMMkc=;
        b=UTUq2TTGyY9dE8Olt7QpXIu8mXkiPNygQpj9xSUaFHg/0+askFMEtXF/IGbj0QlitT8YAK
        kmfjFtvNbw9PYGwmytXHw+ZGCt+LW2Q5zJV+4+CbWuNbYsvebKTP0LlWWV+hjnwxLmeZia
        /ZX/ZMgArvz8UwNn5cVIBdAtoFhQrqk=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-Svvzq1hxP-e7a2GMMIFrNw-1; Wed, 19 May 2021 10:09:35 -0400
X-MC-Unique: Svvzq1hxP-e7a2GMMIFrNw-1
Received: by mail-qv1-f70.google.com with SMTP id l61-20020a0c84430000b02901a9a7e363edso10381020qva.16
        for <linux-doc@vger.kernel.org>; Wed, 19 May 2021 07:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uA5LBQUpQQcpe5I2oDgwRimXB7jI4me/eAnHY5LMMkc=;
        b=H0TG3vDHkORTRS4dpx19J1NyUmNrD1KTT04qhWZBuywj4YCpYE129TBxWSM9aABAPy
         cDY1TwuYibvlmIE89+bQ7GjFbI8qgUXTmivXHEISRH61SSZud68gBC8TWAECcxyh+JJI
         fuTaOUZ6RbbgBkUoSZNfOMqFELtwo82a5T3PWf1jxQ2RiwVjbt2ZpElz2eIKc/cKgtTL
         dFXB9m62slnQM3yWVUG4gxAy81sEKh/qX5cs3y0CWV1krL4/CSD4k82zg6k6zVCyth5m
         ZZRQu87eWQy5gdsb40LVYoiyzF5wBerD1VxgX5NTrYFEMNlNFHOqhxHwAum/PqHC/fTv
         qMwg==
X-Gm-Message-State: AOAM533Y1BG+NXX22Wq1tk2SVhHOByUe5+Tg0cB2sivI1JbW3dPrTboq
        tnQI+WTFfZTWRhe8RJbpSxSG2xUImDjAT+dvMErAkFcXjeIEq/idiQKUlTX7UnO5417YIGWl9jV
        YWJEu4zZ0HdwennoFBhPT
X-Received: by 2002:a05:622a:413:: with SMTP id n19mr11309598qtx.238.1621433375265;
        Wed, 19 May 2021 07:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfgXghdceBt0pzuJuLcMWZrj1qSDnzHPuTLDIdA4muPS9QaO8qeOo+lEtQMgzjzxGPQ17Ppg==
X-Received: by 2002:a05:622a:413:: with SMTP id n19mr11309576qtx.238.1621433375015;
        Wed, 19 May 2021 07:09:35 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-72-184-145-4-219.dsl.bell.ca. [184.145.4.219])
        by smtp.gmail.com with ESMTPSA id c20sm15634299qtm.52.2021.05.19.07.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 07:09:34 -0700 (PDT)
Date:   Wed, 19 May 2021 10:09:33 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
        nouveau@lists.freedesktop.org, bskeggs@redhat.com,
        akpm@linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        jhubbard@nvidia.com, rcampbell@nvidia.com, jglisse@redhat.com,
        hch@infradead.org, daniel@ffwll.ch, willy@infradead.org,
        bsingharora@gmail.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v8 5/8] mm: Device exclusive memory access
Message-ID: <YKUcHfhQMbDnjXC7@t490s>
References: <YKMhorngO2DVrxac@t490s>
 <47694715.suB6H4Uo8R@nvdebian>
 <YKP5Dj4Q/riGGc43@t490s>
 <20210518173334.GE1002214@nvidia.com>
 <YKQBACJCjsxeM3ro@t490s>
 <20210518194509.GF1002214@nvidia.com>
 <YKQjmtMo+YQGx/wZ@t490s>
 <20210518230327.GG1002214@nvidia.com>
 <YKRRgZmRMdk1vH7A@t490s>
 <20210519132842.GJ1002214@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210519132842.GJ1002214@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 19, 2021 at 10:28:42AM -0300, Jason Gunthorpe wrote:
> On Tue, May 18, 2021 at 07:45:05PM -0400, Peter Xu wrote:
> > On Tue, May 18, 2021 at 08:03:27PM -0300, Jason Gunthorpe wrote:
> > > Logically during fork all these device exclusive pages should be
> > > reverted back to their CPU pages, write protected and the CPU page PTE
> > > copied to the fork.
> > > 
> > > We should not copy the device exclusive page PTE to the fork. I think
> > > I pointed to this on an earlier rev..
> > 
> > Agreed.  Though please see the question I posted in the other thread: now I am
> > not very sure whether we'll be able to mark a page as device exclusive if that
> > page has mapcount>1.
> 
> IMHO it is similar to write protect done by filesystems on shared
> mappings - all VMAs with a copy of the CPU page have to get switched
> to the device exclusive PTE. This is why the rmap stuff is involved in
> the migration helpers

Right, I think Alistair corrected me there that I missed the early COW
happening in GUP.

Actually even without that GUP triggering early COW it won't be a problem,
because as long as one child mm restored the pte from exclusive to normal
(before any further COW happens) device exclusiveness is broken in the mmu
notifiers, and after that point all previous-exclusive ptes actually becomes
the same as a very normal PageAnon.  Then it's very sane to even not have the
original page in parent process, because we know each COWed page will contain
all the device atomic modifications (so we don't really have the requirement to
return the original page to parent).

Sorry for the noise.

-- 
Peter Xu

