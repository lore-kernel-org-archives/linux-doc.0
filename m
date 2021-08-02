Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2595EC4338F
	for <linux-doc@archiver.kernel.org>; Mon,  2 Aug 2021 14:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 072ED60F36
	for <linux-doc@archiver.kernel.org>; Mon,  2 Aug 2021 14:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbhHBOWX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Aug 2021 10:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234284AbhHBOWQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Aug 2021 10:22:16 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAF17C06AB59
        for <linux-doc@vger.kernel.org>; Mon,  2 Aug 2021 07:06:32 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id z3so18409688plg.8
        for <linux-doc@vger.kernel.org>; Mon, 02 Aug 2021 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S30D7JnOgPGqBVRgaO8L0r6DfESVg4Q0tFc852vuoQg=;
        b=o7zchrRzGSGJvS1YaJA1zPgb9ncAEmQmS7wdtDRLvzTCTV0KV5fs6bh0F0NjLGNQdA
         hAsch3Th8KrrnTB3oABOyV9xGiM0mqxvjwcQkfhvu6p+CzBkBfEJS62qGuplsCP//3yg
         Y/7Pd6ryCB0f1VkCo8aXIsC1y4zhgDxhhN+SRDfojcY9OlwszZt73S0OMdSAGrrt/lEF
         DAL3uoym+fNdBMYLmsgLkKHhyp31BFULI/YtTh4pTa9xWKYuYTipXMvvP+ON9z6AxU2Y
         Ley1Tyza1FWHdyq3dJxbBTwJofGKtCqvbKWZgl3yHMFRcxOB/Pt8dJtPdR+vN52DMLVv
         44lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S30D7JnOgPGqBVRgaO8L0r6DfESVg4Q0tFc852vuoQg=;
        b=Ljl5U9cm0VVf/iRQu3yfk30poKMJH6fLFC7A+voRQZPT6kWN1EDwXRgDuhN84rzyiw
         WaH/stro3ll2wBP8GaXgpp2W3fXn7xT2sY17jZfgsrMFYcKHSnLmrh1HwJDKHTbqnqKc
         FRSoxTUyJ+pnkrM/++bR/ONTX0hqW6iifOvmHZg3V6GU/NyzkQKR6YXHPU4cjBhr7YbP
         9AIa7+gx3qhf6EGBH1wCkO29zhw9mnhKJHHNQKhSrpCH6QnjnZyqqQxFZyddWXp1L14m
         W4C8PagI9TMEPvJTtMAdP00NiZHHTRaC/+irQIbFZeb5Q9X264WYChdigF/wMNo6jz54
         ig1A==
X-Gm-Message-State: AOAM533yvOA7rPyZEFGrp/xpoKvpcjCttMSgkmbmciCq7G/BQaBOtkpw
        iGl9v9Olfs0R2xFHrtU3ohteZNLPNhGniFVxRYqnmw==
X-Google-Smtp-Source: ABdhPJyVKOnhVt0Wdh9gR5klKUeMY8LJl9xOy+rXAR1aL3gh/RyX3d+gIGycEUJ0HTA94nfjLHThyGCadYvcoTFdMUM=
X-Received: by 2002:a65:6248:: with SMTP id q8mr1176705pgv.279.1627913192152;
 Mon, 02 Aug 2021 07:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714144830.29f9584878b04903079ef7eb@linux-foundation.org>
 <YPjW7tu1NU0iRaH9@casper.infradead.org> <5642c8c3-cf13-33dc-c617-9d1becfba1b1@oracle.com>
 <CAPcyv4ho7idBPU8F4qE8XWhRttkdfzQRATaTAw2C3AfY+Z2BdQ@mail.gmail.com> <fbb77d0f-f1e9-3ef9-fd12-b412b845b7fc@oracle.com>
In-Reply-To: <fbb77d0f-f1e9-3ef9-fd12-b412b845b7fc@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Mon, 2 Aug 2021 07:06:21 -0700
Message-ID: <CAPcyv4gXrNnTQfHXGy-psWRq59UdrfqJ_1xDvxb2Db_rQGGxug@mail.gmail.com>
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

On Mon, Aug 2, 2021 at 3:41 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
>
>
> On 7/28/21 12:23 AM, Dan Williams wrote:
> > On Thu, Jul 22, 2021 at 3:54 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> > [..]
> >>> The folio work really touches the page
> >>> cache for now, and this seems mostly to touch the devmap paths.
> >>>
> >> /me nods -- it really is about devmap infra for usage in device-dax for persistent memory.
> >>
> >> Perhaps I should do s/pagemaps/devmap/ throughout the series to avoid confusion.
> >
> > I also like "devmap" as a more accurate name. It matches the PFN_DEV
> > and PFN_MAP flags that decorate DAX capable pfn_t instances. It also
> > happens to match a recommendation I gave to Ira for his support for
> > supervisor protection keys with devmap pfns.
> >
> /me nods
>
> Additionally, I think I'll be reordering the patches for more clear/easier
> bisection i.e. first introducing compound pages for devmap, fixing associated
> issues wrt to the slow pinning and then introduce vmemmap deduplication for
> devmap.
>
> It should look like below after the reordering from first patch to last.
> Let me know if you disagree.
>
> memory-failure: fetch compound_head after pgmap_pfn_valid()
> mm/page_alloc: split prep_compound_page into head and tail subparts
> mm/page_alloc: refactor memmap_init_zone_device() page init
> mm/memremap: add ZONE_DEVICE support for compound pages
> device-dax: use ALIGN() for determining pgoff
> device-dax: compound devmap support
> mm/gup: grab head page refcount once for group of subpages
> mm/sparse-vmemmap: add a pgmap argument to section activation
> mm/sparse-vmemmap: refactor core of vmemmap_populate_basepages() to helper
> mm/hugetlb_vmemmap: move comment block to Documentation/vm
> mm/sparse-vmemmap: populate compound devmaps
> mm/page_alloc: reuse tail struct pages for compound devmaps
> mm/sparse-vmemmap: improve memory savings for compound pud geometry

LGTM.
