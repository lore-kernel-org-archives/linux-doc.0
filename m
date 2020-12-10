Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E62C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 15:59:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFC8423770
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 15:59:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392040AbgLJP6j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 10:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391966AbgLJP6i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 10:58:38 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE4DC061793
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 07:57:58 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id b26so4491237pfi.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fnon7sDzka34R7LgC0De8tPIdaalVEeRV2dY0iPqfl8=;
        b=GgNwNSHdatu+tNWPwIJEz9GCAzeb56lDlxA8kMpi4aHDozUFZ5Sv3Lw+uEOWSVGtjT
         wI1Zn7rPAUosJLJx34F3dHvx8+ImP9VzS/i2vOXMsaD5sXMwTDygmfDuZhPeTcj7N3Js
         q9zMVql+zspvvDxtgweapTbN1vy/kjQ3CVgAq2dP4x0Pnr2rKswaR+rvKlUNjFwFjKke
         s/gM3raMy1TMT/t+GDJj7x4RRZKOtqPMsX39apcdidkcGjXIj4EFwSauxx4/FB3vyDsv
         4une5ur5AR6djKj+qUUGozr5Nfi2yvWNNUcR6tG4Xe5nRbhd+oZGFJK9H5aDHPqkcwJk
         hYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fnon7sDzka34R7LgC0De8tPIdaalVEeRV2dY0iPqfl8=;
        b=kroYsYBwQ7GcUXlTxwBYIH/rG+HJrRx9urVvhRU2MAP74PPVsGQOP4+I5SniuFb9/G
         6wHg/D3Qv2RgJqbbnhSDkff9n+YT0tllhQUnwsZpFjRh/3JsUFuystWefjgvxzaUs1V+
         Od/5CsEe5wDPHN8MIsMtB480dMKi9y4S0I3mIRalHlCUSsz59BLdNSH4WVO+25R4eY7a
         FROS9sSBGXjgOrWQbxQfghi2fqt+aECjfKpMYlXGXtH043L7eAtMAF0bJBG5OeBNR3MZ
         +MYvjN9pGOZibZQ0/AwWbdsBwA3BCXh01wNeWQrPxU0VWin1B1emN46upoIiEbCWNnvi
         410g==
X-Gm-Message-State: AOAM532UKkKxGy5s8raWnbcEOwM4mHaZe5ZcI3WaCCapI5ZDvkn36TgU
        NM2LzJ4awSw60r8v5ichJpm2HCbe3n+3/1sM6QF8cw==
X-Google-Smtp-Source: ABdhPJzqiQKGJsmus7zKhdtqlGPdLVV43tunbznKDaEHRk/DlgkMGu/McZ++C6DuhMpQ2zRSMZzvRSssSYYMEE1rsgQ=
X-Received: by 2002:a63:cd14:: with SMTP id i20mr7217766pgg.31.1607615877450;
 Thu, 10 Dec 2020 07:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20201210035526.38938-1-songmuchun@bytedance.com>
 <20201210035526.38938-5-songmuchun@bytedance.com> <20201210144256.GB8538@localhost.localdomain>
In-Reply-To: <20201210144256.GB8538@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 10 Dec 2020 23:57:21 +0800
Message-ID: <CAMZfGtWs06zRQ5qXV3bNmWh1kptDAe8eyKKzGHsLMhVaoLUp7A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 04/12] mm/hugetlb: Free the vmemmap
 pages associated with each HugeTLB page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 10, 2020 at 10:43 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Dec 10, 2020 at 11:55:18AM +0800, Muchun Song wrote:
> > The free_vmemmap_pages_per_hpage() which indicate that how many vmemmap
> > pages associated with a HugeTLB page that can be freed to the buddy
> > allocator just returns zero now, because all infrastructure is not
> > ready. Once all the infrastructure is ready, we will rework this
> > function to support the feature.
>
> I would reword the above to:
>
> "free_vmemmap_pages_per_hpage(), which indicates how many vmemmap
>  pages associated with a HugeTLB page can be freed, returns zero for
>  now, which means the feature is disabled.
>  We will enable it once all the infrastructure is there."

Thanks for your suggestion.

>
>  Or something along those lines.
>
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>
> Overall this looks good to me, and it has seen a considerable
> simplification, which is good.
> Some nits/questions below:
>
>
> > +#define vmemmap_hpage_addr_end(addr, end)                             \
> > +({                                                                    \
> > +     unsigned long __boundary;                                        \
> > +     __boundary = ((addr) + VMEMMAP_HPAGE_SIZE) & VMEMMAP_HPAGE_MASK; \
> > +     (__boundary - 1 < (end) - 1) ? __boundary : (end);               \
> > +})
>
> Maybe add a little comment explaining what are you trying to get here.

OK. Will do.

>
> > +/*
> > + * Walk a vmemmap address to the pmd it maps.
> > + */
> > +static pmd_t *vmemmap_to_pmd(unsigned long addr)
> > +{
> > +     pgd_t *pgd;
> > +     p4d_t *p4d;
> > +     pud_t *pud;
> > +     pmd_t *pmd;
> > +
> > +     pgd = pgd_offset_k(addr);
> > +     if (pgd_none(*pgd))
> > +             return NULL;
> > +
> > +     p4d = p4d_offset(pgd, addr);
> > +     if (p4d_none(*p4d))
> > +             return NULL;
> > +
> > +     pud = pud_offset(p4d, addr);
> > +     if (pud_none(*pud))
> > +             return NULL;
> > +
> > +     pmd = pmd_offset(pud, addr);
> > +     if (pmd_none(*pmd))
> > +             return NULL;
> > +
> > +     return pmd;
> > +}
>
> I saw that some people suggested to put all the non-hugetlb vmemmap
> functions under sparsemem-vmemmap.c, which makes some sense if some
> feature is going to re-use this code somehow. (I am not sure if the
> recent patches that take advantage of this feature for ZONE_DEVICE needs
> something like this).
>
> I do not have a strong opinion on this though.

Yeah, I also thought about this. I prefer moving the common code to
the sparsemem-vmemmap.c. If more people agree with this, I can do
this in the next version. :)

>
> > +static void vmemmap_reuse_pte_range(struct page *reuse, pte_t *pte,
> > +                                 unsigned long start, unsigned long end,
> > +                                 struct list_head *vmemmap_pages)
> > +{
> > +     /*
> > +      * Make the tail pages are mapped with read-only to catch
> > +      * illegal write operation to the tail pages.
> > +      */
> > +     pgprot_t pgprot = PAGE_KERNEL_RO;
> > +     pte_t entry = mk_pte(reuse, pgprot);
> > +     unsigned long addr;
> > +
> > +     for (addr = start; addr < end; addr += PAGE_SIZE, pte++) {
> > +             struct page *page;
> > +
> > +             VM_BUG_ON(pte_none(*pte));
>
> If it is none, page will be NULL and we will crash in the list_add
> below?

Yeah, I think that here should be a BUG_ON.

>
> > +static void vmemmap_remap_range(unsigned long start, unsigned long end,
> > +                             struct list_head *vmemmap_pages)
> > +{
> > +     pmd_t *pmd;
> > +     unsigned long next, addr = start;
> > +     struct page *reuse = NULL;
> > +
> > +     VM_BUG_ON(!IS_ALIGNED(start, PAGE_SIZE));
> > +     VM_BUG_ON(!IS_ALIGNED(end, PAGE_SIZE));
> > +     VM_BUG_ON((start >> PUD_SHIFT) != (end >> PUD_SHIFT));
> This last VM_BUG_ON, is to see if both fall under the same PUD table?

Right.

>
> > +
> > +     pmd = vmemmap_to_pmd(addr);
> > +     BUG_ON(!pmd);
>
> Which is the criteria you followed to make this BUG_ON and VM_BUG_ON
> in the check from vmemmap_reuse_pte_range?

Indeed, I am somewhat confused. Should be unified. I should use
BUG_ON here and in vmemmap_reuse_pte_range.

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
