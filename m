Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E02C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Feb 2022 14:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiBLOub (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Feb 2022 09:50:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232017AbiBLOub (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Feb 2022 09:50:31 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F480214
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 06:50:27 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id y6so33336611ybc.5
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 06:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Su7AQ/5xwTbM+10TxtxCdpVbmI06ysx1kE8vo59J6GE=;
        b=J2RdaV7sbB5sJNP4qFBdwADQQDjK3aTvY8zLZx/JDCUvMr+p330G43ATMom+WfAOs7
         OtGAQZnlVRFBgL/RTQjKL1TIgcOSPQrVRTX7uvsDcJ7B4NcUHLR2PXUAJbs/PLZYuhaF
         Fz2H2G5tDtAT35ha9NnAh50b+YFVLk1DN272G4SEVgHuBRV+ohNZOlDsLSNyViS4sMme
         PeGfb/YCmR2ZxHNa2eaNU2RYAK7HEJHD8EM4a0NacLt2IAu5vAN/mpe+jgSArEZeIp1X
         /FnFZOeHlGxk3gTYW8kbJiM6rN/NPC6L8Aduu+PJn8n0be/u5DL0ACECJshrljToWjSS
         CCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Su7AQ/5xwTbM+10TxtxCdpVbmI06ysx1kE8vo59J6GE=;
        b=c/jQ/ksp6tl1GFKebhWfmK8v1yJN1vVQOTKA+F1S+jMhbSyKn5hOj3kczsG5Pbqkb3
         vGD4V30Skx83o2YzbXXjmr8GRbiJlQPLjcxXRa6iFa5aO4f/5vBsPU6xTOcukcuSsjYB
         7ncZRZjU+duddGeR8qORKbDj/exbjDpgiErBEjz5s3S5Q4bfRN9tbIwhRiOQjXVOoSwP
         S8tgDHlv2mOeaRVeDzRhpDFmWW6Abk+gU9QJAYdmxr/8GQYrfIfNpBHViY1LBzKVoT4q
         maK/B/84KPxuXpRhs9sqfOFHo8WeAu8Cq7rRagEYQHfoPNunIkbm1GF+XsH8ShcDCA1+
         XU4A==
X-Gm-Message-State: AOAM532K2PIXuqO889YNd5Dcp/BbSmJyKoFupzXrybSzy30Zv7TKC4ak
        pQob/qcALjjtZTapUU6K2ciuGTk+aUpvWj2tMijFrA==
X-Google-Smtp-Source: ABdhPJwDUzQBxTRtxWwNY46Xv0JADh+f52XG44YUT4SrXJT3uIPLD0F239DDRKnvV/V4eRppK/aM7bAbaAEunNnv7Sw=
X-Received: by 2002:a25:4742:: with SMTP id u63mr5594569yba.523.1644677426443;
 Sat, 12 Feb 2022 06:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20220210193345.23628-1-joao.m.martins@oracle.com>
 <20220210193345.23628-5-joao.m.martins@oracle.com> <CAMZfGtUEaFg=CGLRJomyumsZzcyn8O0JE1+De2Vd3a5remcH6w@mail.gmail.com>
 <d258c471-1291-e0c7-f1b3-a495b4d40bb9@oracle.com> <CAMZfGtWUHRRfowwPf1o-SycKZMDzMdeGdahaR2OEJZzLhLioNg@mail.gmail.com>
In-Reply-To: <CAMZfGtWUHRRfowwPf1o-SycKZMDzMdeGdahaR2OEJZzLhLioNg@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 12 Feb 2022 22:49:49 +0800
Message-ID: <CAMZfGtUSxtnrY3Vkn8gP2T2jUjWdfVXu7+zt5Ny4VBi7ZDkWAg@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] mm/sparse-vmemmap: improve memory savings for
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

On Sat, Feb 12, 2022 at 6:08 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Fri, Feb 11, 2022 at 8:37 PM Joao Martins <joao.m.martins@oracle.com> wrote:
> >
> > On 2/11/22 07:54, Muchun Song wrote:
> > > On Fri, Feb 11, 2022 at 3:34 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> > > [...]
> > >>  pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> > >> -                                      struct vmem_altmap *altmap)
> > >> +                                      struct vmem_altmap *altmap,
> > >> +                                      struct page *block)
> > >
> > > Why not use the name of "reuse" instead of "block"?
> > > Seems like "reuse" is more clear.
> > >
> > Good idea, let me rename that to @reuse.
> >
> > >>  {
> > >>         pte_t *pte = pte_offset_kernel(pmd, addr);
> > >>         if (pte_none(*pte)) {
> > >>                 pte_t entry;
> > >>                 void *p;
> > >>
> > >> -               p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> > >> -               if (!p)
> > >> -                       return NULL;
> > >> +               if (!block) {
> > >> +                       p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> > >> +                       if (!p)
> > >> +                               return NULL;
> > >> +               } else {
> > >> +                       /*
> > >> +                        * When a PTE/PMD entry is freed from the init_mm
> > >> +                        * there's a a free_pages() call to this page allocated
> > >> +                        * above. Thus this get_page() is paired with the
> > >> +                        * put_page_testzero() on the freeing path.
> > >> +                        * This can only called by certain ZONE_DEVICE path,
> > >> +                        * and through vmemmap_populate_compound_pages() when
> > >> +                        * slab is available.
> > >> +                        */
> > >> +                       get_page(block);
> > >> +                       p = page_to_virt(block);
> > >> +               }
> > >>                 entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
> > >>                 set_pte_at(&init_mm, addr, pte, entry);
> > >>         }
> > >> @@ -609,7 +624,8 @@ pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
> > >>  }
> > >>
> > >>  static int __meminit vmemmap_populate_address(unsigned long addr, int node,
> > >> -                                             struct vmem_altmap *altmap)
> > >> +                                             struct vmem_altmap *altmap,
> > >> +                                             struct page *reuse, struct page **page)
> > >
> > > We can remove the last argument (struct page **page) if we change
> > > the return type to "pte_t *".  More simple, don't you think?
> > >
> >
> > Hmmm, perhaps it is simpler, specially provided the only error code is ENOMEM.
> >
> > Albeit perhaps what we want is a `struct page *` rather than a pte.
>
> The caller can extract `struct page` from a pte.
>
> [...]
>
> > >> -       if (vmemmap_populate(start, end, nid, altmap))
> > >> +       if (pgmap && pgmap_vmemmap_nr(pgmap) > 1 && !altmap)
> > >
> > > Should we add a judgment like "is_power_of_2(sizeof(struct page))" since
> > > this optimization is only applied when the size of the struct page does not
> > > cross page boundaries?
> >
> > Totally miss that -- let me make that adjustment.
> >
> > Can I ask which architectures/conditions this happens?
>
> E.g. arm64 when !CONFIG_MEMCG.

Plus !CONFIG_SLUB even on x86_64.

>
> Thanks.
