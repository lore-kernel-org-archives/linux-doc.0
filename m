Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96116C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 23:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D19A60F59
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 23:23:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbhG0XXp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 19:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbhG0XXl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 19:23:41 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC54BC06179C
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 16:23:25 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id mz5-20020a17090b3785b0290176ecf64922so7135695pjb.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 16:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJppDtDekYuL4cldpvhWyZyRjcblITCSsPeqIjft4RM=;
        b=yr6kw4zf3gIwms/Q88NRoMz75sAKL02QThM0wQN+UqNWENuFrKmN+BaWXb7ywu+cYJ
         fU3LyjFZwemn2aKXNQl2EhOw1XmpolDFwb/6zlB8ROPTufuWXtwoD0Uxaut87feMA1q2
         jqgz7QMHLSk1uGXvOkPQ03plMlEQntwl/QOf7opT3eOBuODi/Iji1fjDl0nGXCjm9/gJ
         XZODtSaFfxiDXJB9BdfFmnGZk9BxuwqtZ54ym5WAC/vzHSxuCIXkw0Yk+YzRB8QQkhzL
         LuArIRpDS18WAYJWDMr8TDCFmRWjxSN2zfBSw6d28X6uRedeXFM2OgYDReK89s1M2P+w
         G+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJppDtDekYuL4cldpvhWyZyRjcblITCSsPeqIjft4RM=;
        b=kfIJuXliKkYgxFJ8EpTaPNI8bhkI1L5y13D5WRwQ3Vrdyiv/71GciXZGJ3NXx9hYtS
         fRVnrh7lbppGs/z2Rf2QHnGZthFWKaQqlhItIzV9MLCLWS+M4vgy90ylUIpJWB1+nNnz
         HHPvgBi4or+jvQeUQyEQYcZB/lhLffFuck8LQXp+DLP5tAkGAssHLUcR0MHo3aoj05LH
         euj5PBaAtxXoMXcRb3HVum4gHP3DitJGybkSXZu3bHwvxiX4RrKiECmQuBYnhNb9fitn
         aCrBX8mG5HaRUViouz8ahB32iQsPalMqBLe6ujKi7yjMkos331ri7qsmuFg8ddgFc0f/
         D2Uw==
X-Gm-Message-State: AOAM5318/b6jtOWMhGDlM4Xf2/uJ2jl1vtw4hekd17YVejgZ5O9JtB6D
        /8GI9rIk+OYzMapd7ig7qpPi7HGts62uHT6cFqFZmw==
X-Google-Smtp-Source: ABdhPJwLO7kXi5PzPgZkkGTm9QpggNSyfhWzfbITFv6b2qe0ZlE5ljlM6M13ncXAS3Z4qLENhnEhhA+Yvdr6t8zRaqU=
X-Received: by 2002:a65:5544:: with SMTP id t4mr25771932pgr.240.1627428205422;
 Tue, 27 Jul 2021 16:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714144830.29f9584878b04903079ef7eb@linux-foundation.org>
 <YPjW7tu1NU0iRaH9@casper.infradead.org> <5642c8c3-cf13-33dc-c617-9d1becfba1b1@oracle.com>
In-Reply-To: <5642c8c3-cf13-33dc-c617-9d1becfba1b1@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 27 Jul 2021 16:23:14 -0700
Message-ID: <CAPcyv4ho7idBPU8F4qE8XWhRttkdfzQRATaTAw2C3AfY+Z2BdQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, sparse-vmemmap: Introduce compound pagemaps
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 22, 2021 at 3:54 AM Joao Martins <joao.m.martins@oracle.com> wrote:
[..]
> > The folio work really touches the page
> > cache for now, and this seems mostly to touch the devmap paths.
> >
> /me nods -- it really is about devmap infra for usage in device-dax for persistent memory.
>
> Perhaps I should do s/pagemaps/devmap/ throughout the series to avoid confusion.

I also like "devmap" as a more accurate name. It matches the PFN_DEV
and PFN_MAP flags that decorate DAX capable pfn_t instances. It also
happens to match a recommendation I gave to Ira for his support for
supervisor protection keys with devmap pfns.
