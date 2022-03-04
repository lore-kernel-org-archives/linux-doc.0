Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2177EC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  4 Mar 2022 03:10:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237803AbiCDDKt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 22:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbiCDDKs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 22:10:48 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90D66131106
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 19:09:58 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id g1so14261002ybe.4
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 19:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6q+ly/u39xYyKacUqKnY0+oHLRpmW1dHHfAGkiJCu1Y=;
        b=u3huWPeiz+Oe7K8PoY56nQ1fGZIlx5pbI1hIo7DmXRqmm88lM/h9wHq5wPisneW+3a
         i0lkATj0Tl5U90bQYe/pVgB9s3qNBIbZ5Idd8JZycguC0ViPbTVWGAkt4uXfvY9xdTHU
         GewXmlMYyrX+Jn38s7VSvnoEE0CU8K1ZcpP7EQDdaTlD2P6rIcAMF2MeCHJQobwlqX5s
         jIj6tX9ZiYJfiq68xVLTy/F5Wy0d3KKdnDgOiHcoih7x9LRQu18KasD4umDe5Mr5SWuc
         hIEKFs4kHra0W1WxYTsB3lG77rF080+GqLkMKeIXC/7C14sC4/Qe+oXSb5tqMofwU/Bd
         xukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6q+ly/u39xYyKacUqKnY0+oHLRpmW1dHHfAGkiJCu1Y=;
        b=AEfrK27wAM1AOOnHqwKgr7T7rSNV72y3GFGpPLYgOX1HMLvHbFGSyAfuEcD3jZBuwL
         3zI5uEwighMhwwLxXibE5RjBUVe3PeDbqGfX6HhLcJBwo65YsgZT6VoV9sBa4uxzvhZ+
         vS5Ea8y3lBg2jfIx5v4bTjrNWGyakCgb4phLlM0sBrnr17FdSUKbvqCwRDwABeae4hBF
         NGgx6ROtezjzdRz8K0RprDeHmsXjRzZhwEJJzWvXV+/bypg3Plct2DEJnt6lTpnVErtH
         x4KldAxtc2NhpSpzEAf1jYE8l979XOzYdPOrPCbVUg2TFJmfNTaI/liq/WHHeI3H+1l0
         P2Ew==
X-Gm-Message-State: AOAM530RhNkaeGgyI7mqZGzVOa6s79Azjm8VwGfqpUKI0Ksbc7rOoVeC
        9igUMeSbHi37qnfZs0Ww9ypQYP8J6aP03X5O6GV/EA==
X-Google-Smtp-Source: ABdhPJwn1/iKslLrd8kE67UZS3lsvCoC1aQ/in9KlZnkDOoOUsMSdpG+WvlGFvaQ1Sn1SoK7DfyY1+ZgFIwe/+lG8Bg=
X-Received: by 2002:a25:3d87:0:b0:61e:170c:aa9 with SMTP id
 k129-20020a253d87000000b0061e170c0aa9mr35759918yba.89.1646363397800; Thu, 03
 Mar 2022 19:09:57 -0800 (PST)
MIME-Version: 1.0
References: <20220303213252.28593-1-joao.m.martins@oracle.com> <20220303213252.28593-5-joao.m.martins@oracle.com>
In-Reply-To: <20220303213252.28593-5-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 4 Mar 2022 11:09:10 +0800
Message-ID: <CAMZfGtWmRfSzN+U-jxVXu6x3nRxHB2Wxse5y5835ezGzSqAQpA@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] mm/sparse-vmemmap: improve memory savings for
 compound devmaps
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 4, 2022 at 5:33 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> A compound devmap is a dev_pagemap with @vmemmap_shift > 0 and it
> means that pages are mapped at a given huge page alignment and utilize
> uses compound pages as opposed to order-0 pages.
>
> Take advantage of the fact that most tail pages look the same (except
> the first two) to minimize struct page overhead. Allocate a separate
> page for the vmemmap area which contains the head page and separate for
> the next 64 pages. The rest of the subsections then reuse this tail
> vmemmap page to initialize the rest of the tail pages.
>
> Sections are arch-dependent (e.g. on x86 it's 64M, 128M or 512M) and
> when initializing compound devmap with big enough @vmemmap_shift (e.g.
> 1G PUD) it may cross multiple sections. The vmemmap code needs to
> consult @pgmap so that multiple sections that all map the same tail
> data can refer back to the first copy of that data for a given
> gigantic page.
>
> On compound devmaps with 2M align, this mechanism lets 6 pages be
> saved out of the 8 necessary PFNs necessary to set the subsection's
> 512 struct pages being mapped. On a 1G compound devmap it saves
> 4094 pages.
>
> Altmap isn't supported yet, given various restrictions in altmap pfn
> allocator, thus fallback to the already in use vmemmap_populate().  It
> is worth noting that altmap for devmap mappings was there to relieve the
> pressure of inordinate amounts of memmap space to map terabytes of pmem.
> With compound pages the motivation for altmaps for pmem gets reduced.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
