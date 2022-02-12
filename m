Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54F1C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 12 Feb 2022 10:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233318AbiBLKJT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Feb 2022 05:09:19 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233065AbiBLKJS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Feb 2022 05:09:18 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3E526110
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 02:09:15 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id o19so31727519ybc.12
        for <linux-doc@vger.kernel.org>; Sat, 12 Feb 2022 02:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uY1QGZxvGJNV1jQzuanAqMu3WZtLOvsmLZnn0LbatKM=;
        b=FvtDkCYKqTsbh24ngYPII58GTtKLRiNNrwb9D+4lHh2yDSyJflk5IOHe/2Pz50gszB
         5+YhYc/POsGXJWz71gKctIlk2CC3NqaHnP+sWwAugLGyA0G/89+Fj/YxRWfL07IvADAu
         w550p0TJcrAcQHtjd4OSjbYQNY2cfsyJ1CmekQApWcmAagHnJM+CJVEvtoDG/yGkWdyh
         wr1tJAPNEXQdIgyaHbUqjNepODQHsQQrA/BlwTfTNiAg9pJw7BgLaJzx0eagMcX/Hp7g
         uemiY0fS7TobC04DACyRdjzDFvUe9+dUgJ2RnmK+tDcr2rx2uQ9Ta4tgRGY9lakN2+Kl
         c5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uY1QGZxvGJNV1jQzuanAqMu3WZtLOvsmLZnn0LbatKM=;
        b=aD3YOuojwEsHtSHadijrh3yKwHa2fwTusU9HdqLXiQe8dQgXbhKW3fNMh4Pmld7mZm
         oiNg87iCyxZ9wTwcLV7bnVJ5QASQq9CPnCMqo+7KrmDtamgjAcqOpM4ZC9Z0fR+AfYen
         SEY4A6kB8icWfzx7UoGvpBEMteDZWL+P5wVT/DhkkzQowCpHX2lgXtZ+JF9shs1PnlqY
         LMiZjJ1XJIGpOFlMUekyPNcqbaSBMI+TIr2Nznd6TJdqLl5K5S+hki6BN4Q1zKKfvfjs
         Y30U7qxYpaw6fu2IutW989Ip/6UCrhQcBnz9H+NTZvWkIF7Hsroud7ofOmpbGIRXt49M
         Yt9g==
X-Gm-Message-State: AOAM5330XQupYjCFIYY+ebngtQiDLa0VQQ73zZL0nulLk9KhiG279TcS
        ONCDyxnt96xDWJPe3Fblw7xSMWcFUP45cTiOn7KfSA==
X-Google-Smtp-Source: ABdhPJzYQpbf+Roqjp0GzTDpkzICPMdHmyElZzFdRcACcJ2hhbApUPi2w9MF5msS2pnfs6Amy4uo8UyalDQKMw0zp5Y=
X-Received: by 2002:a25:4742:: with SMTP id u63mr4863670yba.523.1644660554886;
 Sat, 12 Feb 2022 02:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20220210193345.23628-1-joao.m.martins@oracle.com>
 <20220210193345.23628-5-joao.m.martins@oracle.com> <CAMZfGtUEaFg=CGLRJomyumsZzcyn8O0JE1+De2Vd3a5remcH6w@mail.gmail.com>
 <d258c471-1291-e0c7-f1b3-a495b4d40bb9@oracle.com>
In-Reply-To: <d258c471-1291-e0c7-f1b3-a495b4d40bb9@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 12 Feb 2022 18:08:38 +0800
Message-ID: <CAMZfGtWUHRRfowwPf1o-SycKZMDzMdeGdahaR2OEJZzLhLioNg@mail.gmail.com>
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

On Fri, Feb 11, 2022 at 8:37 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 2/11/22 07:54, Muchun Song wrote:
> > On Fri, Feb 11, 2022 at 3:34 AM Joao Martins <joao.m.martins@oracle.com> wrote:
> > [...]
> >>  pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> >> -                                      struct vmem_altmap *altmap)
> >> +                                      struct vmem_altmap *altmap,
> >> +                                      struct page *block)
> >
> > Why not use the name of "reuse" instead of "block"?
> > Seems like "reuse" is more clear.
> >
> Good idea, let me rename that to @reuse.
>
> >>  {
> >>         pte_t *pte = pte_offset_kernel(pmd, addr);
> >>         if (pte_none(*pte)) {
> >>                 pte_t entry;
> >>                 void *p;
> >>
> >> -               p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> >> -               if (!p)
> >> -                       return NULL;
> >> +               if (!block) {
> >> +                       p = vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
> >> +                       if (!p)
> >> +                               return NULL;
> >> +               } else {
> >> +                       /*
> >> +                        * When a PTE/PMD entry is freed from the init_mm
> >> +                        * there's a a free_pages() call to this page allocated
> >> +                        * above. Thus this get_page() is paired with the
> >> +                        * put_page_testzero() on the freeing path.
> >> +                        * This can only called by certain ZONE_DEVICE path,
> >> +                        * and through vmemmap_populate_compound_pages() when
> >> +                        * slab is available.
> >> +                        */
> >> +                       get_page(block);
> >> +                       p = page_to_virt(block);
> >> +               }
> >>                 entry = pfn_pte(__pa(p) >> PAGE_SHIFT, PAGE_KERNEL);
> >>                 set_pte_at(&init_mm, addr, pte, entry);
> >>         }
> >> @@ -609,7 +624,8 @@ pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
> >>  }
> >>
> >>  static int __meminit vmemmap_populate_address(unsigned long addr, int node,
> >> -                                             struct vmem_altmap *altmap)
> >> +                                             struct vmem_altmap *altmap,
> >> +                                             struct page *reuse, struct page **page)
> >
> > We can remove the last argument (struct page **page) if we change
> > the return type to "pte_t *".  More simple, don't you think?
> >
>
> Hmmm, perhaps it is simpler, specially provided the only error code is ENOMEM.
>
> Albeit perhaps what we want is a `struct page *` rather than a pte.

The caller can extract `struct page` from a pte.

[...]

> >> -       if (vmemmap_populate(start, end, nid, altmap))
> >> +       if (pgmap && pgmap_vmemmap_nr(pgmap) > 1 && !altmap)
> >
> > Should we add a judgment like "is_power_of_2(sizeof(struct page))" since
> > this optimization is only applied when the size of the struct page does not
> > cross page boundaries?
>
> Totally miss that -- let me make that adjustment.
>
> Can I ask which architectures/conditions this happens?

E.g. arm64 when !CONFIG_MEMCG.

Thanks.
