Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7B0C4320A
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 06:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4643060FA0
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 06:05:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbhG1GFM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 02:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbhG1GFK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 02:05:10 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CED94C061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 23:05:08 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so8424584pjb.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 23:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S7De9cl6rnz9ISdIKsf2YW99C7Ty4jqzN9gqFoe2Kdc=;
        b=WrVtdYQO4ThTm8MRttwaCgaeAvU8yh35FxPt21mtICHGTQMVjYUMbeCck/xGO7vHp3
         DVvrq+BntGXqkffGd7wIoY2ktRw8HmuWoFvULqJkxiHPcqbPconQfN+PplhAqjz9toRY
         UCnn1Cg8YbrGWdVq6ZpIm+HjTXVXTj2wSoEEHhw8GTUJA+eeozsUY8RnPtER2+qKAPj/
         oUtCkMBuAYsxC3wjUJV9kbYHtLDprlDwxd2uWCLTuY36+ZoY19Urn6sHz5QBUMU3sYuJ
         vtWrjsrPq/yiVU8yiBQvvubQ8df6swkqWrhVdK+qKQEyJnJsQDLxdoDMvT+ZzTlJSZuz
         OpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S7De9cl6rnz9ISdIKsf2YW99C7Ty4jqzN9gqFoe2Kdc=;
        b=nvQwH7JiYITVA31X0bZoQzKgKKolW/SqKviM/SEpSFFWuHJoSa9Y1U8h1XKnM5PA3O
         davTInNsNZhndOKOScFC8UMOOUj/nEYf3xfCBv+u2jhvqSynHUhvRpL6OlgOV9TJTTcz
         SSJBIbgZHlDrW0onD0HKpzOSaj/rReWt4DxuH3xpw7pJFEnL84nLlpKQqwjBTJOyGIwJ
         XJklmTptGnmyhVWslD8KKeNr2Rr38yEuSeqZJnHyPavVujuApHd9d79A0/hdQNF600uH
         LTBb0aqMR4MkVvgR//xHi/6HOh4/3gmLu/irC8Pv/zsUU3WGA5VVjF580OumCXQcgcdm
         C1WQ==
X-Gm-Message-State: AOAM531BLQDxRKSlOhTfXgWe5Qa30IG/c0m2vXNXQAxhEerHnEtY9XR7
        VWvQDL7k0t7h0RV4CzLKhe1qADBxS+GEQ/EtRq0W9Q==
X-Google-Smtp-Source: ABdhPJwKAAossYI2q6UvsYvBLJL1fq+DZe/6tRo+YtbetwmSSE8kD/eIiedXsRYc1dv063oIth4g/rKmDYv1ItVMW4g=
X-Received: by 2002:a65:6248:: with SMTP id q8mr27652152pgv.279.1627452308333;
 Tue, 27 Jul 2021 23:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-7-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-7-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 27 Jul 2021 23:04:57 -0700
Message-ID: <CAPcyv4j=gqdkj-hT1dD5jyndG=P9DogUH7Ptr-aDeAk7uacpCQ@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] mm/sparse-vmemmap: refactor core of
 vmemmap_populate_basepages() to helper
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> In preparation for describing a memmap with compound pages, move the
> actual pte population logic into a separate function
> vmemmap_populate_address() and have vmemmap_populate_basepages() walk
> through all base pages it needs to populate.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  mm/sparse-vmemmap.c | 44 ++++++++++++++++++++++++++------------------
>  1 file changed, 26 insertions(+), 18 deletions(-)
>
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 80d3ba30d345..76f4158f6301 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -570,33 +570,41 @@ pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
>         return pgd;
>  }
>
> -int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> -                                        int node, struct vmem_altmap *altmap)
> +static int __meminit vmemmap_populate_address(unsigned long addr, int node,
> +                                             struct vmem_altmap *altmap)
>  {
> -       unsigned long addr = start;
>         pgd_t *pgd;
>         p4d_t *p4d;
>         pud_t *pud;
>         pmd_t *pmd;
>         pte_t *pte;
>
> +       pgd = vmemmap_pgd_populate(addr, node);
> +       if (!pgd)
> +               return -ENOMEM;
> +       p4d = vmemmap_p4d_populate(pgd, addr, node);
> +       if (!p4d)
> +               return -ENOMEM;
> +       pud = vmemmap_pud_populate(p4d, addr, node);
> +       if (!pud)
> +               return -ENOMEM;
> +       pmd = vmemmap_pmd_populate(pud, addr, node);
> +       if (!pmd)
> +               return -ENOMEM;
> +       pte = vmemmap_pte_populate(pmd, addr, node, altmap);
> +       if (!pte)
> +               return -ENOMEM;
> +       vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);

Missing a return here:

mm/sparse-vmemmap.c:598:1: error: control reaches end of non-void
function [-Werror=return-type]

Yes, it's fixed up in a later patch, but might as well not leave the
bisect breakage lying around, and the kbuild robot would gripe about
this eventually as well.


> +}
> +
> +int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> +                                        int node, struct vmem_altmap *altmap)
> +{
> +       unsigned long addr = start;
> +
>         for (; addr < end; addr += PAGE_SIZE) {
> -               pgd = vmemmap_pgd_populate(addr, node);
> -               if (!pgd)
> -                       return -ENOMEM;
> -               p4d = vmemmap_p4d_populate(pgd, addr, node);
> -               if (!p4d)
> -                       return -ENOMEM;
> -               pud = vmemmap_pud_populate(p4d, addr, node);
> -               if (!pud)
> -                       return -ENOMEM;
> -               pmd = vmemmap_pmd_populate(pud, addr, node);
> -               if (!pmd)
> -                       return -ENOMEM;
> -               pte = vmemmap_pte_populate(pmd, addr, node, altmap);
> -               if (!pte)
> +               if (vmemmap_populate_address(addr, node, altmap))
>                         return -ENOMEM;

I'd prefer:

rc = vmemmap_populate_address(addr, node, altmap);
if (rc)
    return rc;

...in case future refactoring adds different error codes to pass up.


> -               vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
>         }
>
>         return 0;
> --
> 2.17.1
>
