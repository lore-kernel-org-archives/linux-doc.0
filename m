Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC030C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 15:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236421AbiBXPft (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 10:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235661AbiBXPfs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 10:35:48 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1411C60E5
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 07:35:18 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id em10-20020a17090b014a00b001bc3071f921so6009063pjb.5
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 07:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lsQgiVzP1TKRqYLV4++jxmoh8slLiUxtFgCPxjFlY0c=;
        b=vEh5lqRz8JWat204RnHZ/0ZhBBj0V+2xuqju6dJaXTJmcEU99tB7WTFV9jdSqDPAn+
         tska+3AyjJRJRI+jhKV2x/sV72O5+p6Zs8H4KUG2vxu7GI6BVa3KejeE7YrqTldlBF0N
         ZzwAf2Rh7ozrziYm/WgYsbv6B7VQEK/q4u6bqzbcKz+VmqkhLNztedKcnh+GrLeIVP71
         J/XhJYV7fOc80WRJBoQ6Z/2b6XVPXEcytOzncFT4/MBL9q9aHA4sc1Bm9tSU95ZZnR2j
         gwAXPzPQPh7PsqhBbPbcSKzp5zTlfI4J59MuA4wNPiHsEMErZm2p6Kb8uHT51tEbfEp2
         Lcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lsQgiVzP1TKRqYLV4++jxmoh8slLiUxtFgCPxjFlY0c=;
        b=rte78Nmrk/nEWHBcRPaxYmYmCWfT/ENdxwtpjtEEOKPw5Sgq3wU1LhpcKi5A0/oMbD
         i/sCQrgm0/T+PpxBalkO/FzENZIX11h+cM91TQt1s76w2ydq5+x/sr219PAGWnU5mo4b
         ooJcD2Q+7fX/iCNwl/ac1v0Ft0XR9yivC822BWa2YAIjevpUGZgJSUJIc3D7M+yT6z4e
         K8oLEd7E2bug0oeYIP1GTLXBUntG6Hwi5w6SyB5Wg2Crjz4T/3dz1JOFgk6sEASU85KO
         1We+mwlSujUl16wmASMIH5dPO379bR0wUoSg07XGTnRSPkbfleB1LOd9uZqaSlwUbaTP
         EshA==
X-Gm-Message-State: AOAM530ptteX1WgY957ZrO1bo2V0p6yy4m1MO1iPabATWZFdPoUW/Qv6
        9v63uMXNk04M14Td+c9X2UcMluF+Vb8Wr/puigbBkQ==
X-Google-Smtp-Source: ABdhPJy7tyw1CeQ6MqBWdqbcfJjWOEGOR64u7KAmeKWWG3aNdoFJVgpLnp9Qs8KNuOg3ROktAH6g5gTrP3v4ENNzOcg=
X-Received: by 2002:a17:902:a404:b0:14b:1100:aebc with SMTP id
 p4-20020a170902a40400b0014b1100aebcmr2988122plq.133.1645716917764; Thu, 24
 Feb 2022 07:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20220223194807.12070-1-joao.m.martins@oracle.com>
 <20220223194807.12070-5-joao.m.martins@oracle.com> <CAMZfGtXm5pLbTnzMCrWPg8Vm3gykB8XEg5DHFm0z1p1x2fhySQ@mail.gmail.com>
 <25983812-c876-ae82-0125-515500959696@oracle.com>
In-Reply-To: <25983812-c876-ae82-0125-515500959696@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Feb 2022 23:34:41 +0800
Message-ID: <CAMZfGtUFFT2fKCR8jUZkZxVDrh7tLSBhkCFUgifE-EmPvn=iBg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] mm/sparse-vmemmap: improve memory savings for
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

On Thu, Feb 24, 2022 at 7:47 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 2/24/22 05:54, Muchun Song wrote:
> > On Thu, Feb 24, 2022 at 3:48 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> >> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >> index 5f549cf6a4e8..b0798b9c6a6a 100644
> >> --- a/include/linux/mm.h
> >> +++ b/include/linux/mm.h
> >> @@ -3118,7 +3118,7 @@ p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
> >>  pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
> >>  pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
> >>  pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> >> -                           struct vmem_altmap *altmap);
> >> +                           struct vmem_altmap *altmap, struct page *block);
> >
> > Have forgotten to update @block to @reuse here.
> >
>
> Fixed.
>
> > [...]
> >> +
> >> +static int __meminit vmemmap_populate_range(unsigned long start,
> >> +                                           unsigned long end,
> >> +                                           int node, struct page *page)
> >
> > All of the users are passing a valid parameter of @page. This function
> > will populate the vmemmap with the @page
>
> Yeap.
>
> > and without memory
> > allocations. So the @node parameter seems to be unnecessary.
> >
> I am a little bit afraid of making this logic more fragile by removing node.
> When we populate the the tail vmemmap pages, we *may need* to populate a new PMD page
> . And we need the @node for those or anything preceeding that (even though it's highly
> unlikely). It's just the PTE reuse that doesn't need node :(

Agree. So I suggest adding @altmap to vmemmap_populate_range() like
you have done as follows.

>
> > If you want to make this function more generic like
> > vmemmap_populate_address() to handle memory allocations
> > (the case of @page == NULL). I think vmemmap_populate_range()
> > should add another parameter of `struct vmem_altmap *altmap`.
>
> Oh, that's a nice cleanup/suggestion. I've moved vmemmap_populate_range() to be
> used by vmemmap_populate_basepages(), and delete the duplication. I'll
> adjust the second patch for this cleanup, to avoid moving the same code
> over again between the two patches. I'll keep your Rb in the second patch, this is
> the diff to this version:
>
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 44cb77523003..1b30a82f285e 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -637,8 +637,9 @@ static pte_t * __meminit vmemmap_populate_address(unsigned long addr,
> int node,
>         return pte;
>  }
>
> -int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> -                                        int node, struct vmem_altmap *altmap)
> +static int __meminit vmemmap_populate_range(unsigned long start,
> +                                           unsigned long end, int node,
> +                                           struct vmem_altmap *altmap)
>  {
>         unsigned long addr = start;
>         pte_t *pte;
> @@ -652,6 +653,12 @@ int __meminit vmemmap_populate_basepages(unsigned long start,
> unsigned long end,
>         return 0;
>  }
>
> +int __meminit vmemmap_populate_basepages(unsigned long start, unsigned long end,
> +                                        int node, struct vmem_altmap *altmap)
> +{
> +       return vmemmap_populate_range(start, end, node, altmap);
> +}
> +
>  struct page * __meminit __populate_section_memmap(unsigned long pfn,
>                 unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
>                 struct dev_pagemap *pgmap)
>
> Meanwhile I'll adjust the other callers of vmemmap_populate_range() in this patch.

LGTM.

>
> > Otherwise, is it better to remove @node and rename @page to @reuse?
>
> I've kept the @node for now, due to the concern explained earlier, but
> renamed vmemmap_populate_range() to have its new argument be named @reuse.

Make sense.
