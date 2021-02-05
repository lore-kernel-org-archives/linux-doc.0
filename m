Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7245BC433E0
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 09:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F66D64FA3
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 09:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhBEJc6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 04:32:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbhBEJa1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 04:30:27 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F405C061793
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 01:29:47 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id u11so3240278plg.13
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 01:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8kbHhr5ieZ6ruSdfvIdIqaCIJRoZTwflsvjoo9BVnk=;
        b=XzVz7PTqFkJbrHQ4TD1ZAl9AGJX0cOmouGjHXf7luEbYx2a/fvA19GsbE/v7Q7hlss
         Rgy9kNec//SwFulmUbTHp39/OxOvGI8kXgMAutQ9LSk7ffcDDlJp73ljuyoXhuRrC2rP
         JlEoUBnwhs1JSUJ+MPRiiTcHjrgvpya2JDJFp2su4z+u70gcVbKAQJluHLIe2I+r1A3g
         CqPqc0SU5Veq7bZN5RDZQNqbT9FoWRvJBuXj4DkQIVqbiKDNNjS3nItULo43b49zfhmM
         0ANaUblgLe/rViiAT0sqcHFGpYESM3mtV11KpHlHPgdmzG5ffCa3Oz9XEU87vHjn0o9t
         GsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8kbHhr5ieZ6ruSdfvIdIqaCIJRoZTwflsvjoo9BVnk=;
        b=scLf9DfJBVEk0xV7E6wg9OBrzLNBMXo4qGBcKDq16nUgROXvrcFEqegHEoSbjya80u
         IfStX/4B4Dd6lvrLy4ithNIDx2JzdkTSNAQmvadTCAIwSY4jLUI1B5ORnDBIwXB+nKtZ
         TSh+oYvbRMWxVLmsX20h+Lb8cpUF72RhkB4+eUhpc3Grj2+TKUjpB7HkQfaWy+2eZ/IG
         /W/+BgBhvsowNQFnHIPyOTx0Ftohsn5CpUG2dkYyJbFgY+IB1H+EbfFaG65pv3wdyI3U
         qQGdqT2AjWZhhdlp9E8FcXUknvbWuJSsJP4hhG+cKQLzagAFjrnIA2PJTEfonYw3FEPo
         QBEA==
X-Gm-Message-State: AOAM531etNKWwBMBI7zlZMo7zsM+HMLicMRiv2dEBw0w+b0m0BefXPU3
        CQhQB3NcWxFU1VR+VkAN8EHfNHUGYH/COjAXBRve4Q==
X-Google-Smtp-Source: ABdhPJzdbcoYfGNkatXU7sCb36XXR5pRUSMhgM1xy54hkZlCntyENM+DaVCm9tJZ8VWY34sziTfMoyKpg/x1B2tSjR0=
X-Received: by 2002:a17:90a:b702:: with SMTP id l2mr3357990pjr.13.1612517386657;
 Fri, 05 Feb 2021 01:29:46 -0800 (PST)
MIME-Version: 1.0
References: <20210204035043.36609-1-songmuchun@bytedance.com> <20210204035043.36609-5-songmuchun@bytedance.com>
In-Reply-To: <20210204035043.36609-5-songmuchun@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 5 Feb 2021 17:29:09 +0800
Message-ID: <CAMZfGtUqX7ENkFLPS9OQ44Bh8=1FLwiBK3bwU6jAv=OBjZHZfA@mail.gmail.com>
Subject: Re: [PATCH v14 4/8] mm: hugetlb: alloc the vmemmap pages associated
 with each HugeTLB page
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Xiongchun duan <duanxiongchun@bytedance.com>,
        Michal Hocko <mhocko@suse.com>,
        Mina Almasry <almasrymina@google.com>, x86@kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>, hpa@zytor.com,
        viro@zeniv.linux.org.uk, mingo@redhat.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Kravetz <mike.kravetz@oracle.com>, luto@kernel.org,
        dave.hansen@linux.intel.com, oneukum@suse.com, paulmck@kernel.org,
        pawan.kumar.gupta@linux.intel.com,
        Andrew Morton <akpm@linux-foundation.org>, jroedel@suse.de,
        mchehab+huawei@kernel.org, anshuman.khandual@arm.com, bp@alien8.de,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>, David Rientjes <rientjes@google.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 4, 2021 at 11:54 AM Muchun Song <songmuchun@bytedance.com> wrote:
>
> When we free a HugeTLB page to the buddy allocator, we should allocate the
> vmemmap pages associated with it. But we may cannot allocate vmemmap pages
> when the system is under memory pressure, in this case, we just refuse to
> free the HugeTLB page instead of looping forever trying to allocate the
> pages.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  include/linux/mm.h   |  2 ++
>  mm/hugetlb.c         | 19 ++++++++++++-
>  mm/hugetlb_vmemmap.c | 30 +++++++++++++++++++++
>  mm/hugetlb_vmemmap.h |  8 ++++++
>  mm/sparse-vmemmap.c  | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  5 files changed, 132 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d7dddf334779..33c5911afe18 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2981,6 +2981,8 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
>
>  void vmemmap_remap_free(unsigned long start, unsigned long end,
>                         unsigned long reuse);
> +int vmemmap_remap_alloc(unsigned long start, unsigned long end,
> +                       unsigned long reuse, gfp_t gfp_mask);
>
>  void *sparse_buffer_alloc(unsigned long size);
>  struct page * __populate_section_memmap(unsigned long pfn,
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 4cfca27c6d32..5518283aa667 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1397,16 +1397,26 @@ static void __free_huge_page(struct page *page)
>                 h->resv_huge_pages++;
>
>         if (HPageTemporary(page)) {
> -               list_del(&page->lru);
>                 ClearHPageTemporary(page);
> +
> +               if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC)) {
> +                       h->surplus_huge_pages++;
> +                       h->surplus_huge_pages_node[nid]++;
> +                       goto enqueue;
> +               }
> +               list_del(&page->lru);
>                 update_and_free_page(h, page);
>         } else if (h->surplus_huge_pages_node[nid]) {
> +               if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC))
> +                       goto enqueue;
> +
>                 /* remove the page from active list */
>                 list_del(&page->lru);
>                 update_and_free_page(h, page);
>                 h->surplus_huge_pages--;
>                 h->surplus_huge_pages_node[nid]--;
>         } else {
> +enqueue:
>                 arch_clear_hugepage_flags(page);
>                 enqueue_huge_page(h, page);
>         }
> @@ -1693,6 +1703,10 @@ static int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
>                         struct page *page =
>                                 list_entry(h->hugepage_freelists[node].next,
>                                           struct page, lru);
> +
> +                       if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC))
> +                               break;
> +
>                         list_del(&page->lru);
>                         h->free_huge_pages--;
>                         h->free_huge_pages_node[node]--;
> @@ -1760,6 +1774,9 @@ int dissolve_free_huge_page(struct page *page)
>                         goto retry;
>                 }
>
> +               if (alloc_huge_page_vmemmap(h, head, GFP_ATOMIC))
> +                       goto out;
> +

Hi Oscar,

Because we allocate vmemmap pages and do the remapping
before setting the PG_hwpoision of tail struct page. So we do
not need the following patch.

[1] https://patchwork.kernel.org/project/linux-mm/patch/20210117151053.24600-7-songmuchun@bytedance.com/

>                 /*
>                  * Move PageHWPoison flag from head page to the raw error page,
>                  * which makes any subpages rather than the error page reusable.
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index ddd872ab6180..0bd6b8d7282d 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -169,6 +169,8 @@
>   * (last) level. So this type of HugeTLB page can be optimized only when its
>   * size of the struct page structs is greater than 2 pages.
>   */
> +#define pr_fmt(fmt)    "HugeTLB: " fmt
> +
>  #include "hugetlb_vmemmap.h"
>
>  /*
> @@ -198,6 +200,34 @@ static inline unsigned long free_vmemmap_pages_size_per_hpage(struct hstate *h)
>         return (unsigned long)free_vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
>  }
>
> +int alloc_huge_page_vmemmap(struct hstate *h, struct page *head, gfp_t gfp_mask)
> +{
> +       int ret;
> +       unsigned long vmemmap_addr = (unsigned long)head;
> +       unsigned long vmemmap_end, vmemmap_reuse;
> +
> +       if (!free_vmemmap_pages_per_hpage(h))
> +               return 0;
> +
> +       vmemmap_addr += RESERVE_VMEMMAP_SIZE;
> +       vmemmap_end = vmemmap_addr + free_vmemmap_pages_size_per_hpage(h);
> +       vmemmap_reuse = vmemmap_addr - PAGE_SIZE;
> +
> +       /*
> +        * The pages which the vmemmap virtual address range [@vmemmap_addr,
> +        * @vmemmap_end) are mapped to are freed to the buddy allocator, and
> +        * the range is mapped to the page which @vmemmap_reuse is mapped to.
> +        * When a HugeTLB page is freed to the buddy allocator, previously
> +        * discarded vmemmap pages must be allocated and remapping.
> +        */
> +       ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
> +                                 gfp_mask | __GFP_NOWARN | __GFP_THISNODE);
> +       if (ret == -ENOMEM)
> +               pr_info("cannot alloc vmemmap pages\n");
> +
> +       return ret;
> +}
> +
>  void free_huge_page_vmemmap(struct hstate *h, struct page *head)
>  {
>         unsigned long vmemmap_addr = (unsigned long)head;
> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> index 6923f03534d5..6f89a9eed02c 100644
> --- a/mm/hugetlb_vmemmap.h
> +++ b/mm/hugetlb_vmemmap.h
> @@ -11,8 +11,16 @@
>  #include <linux/hugetlb.h>
>
>  #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> +int alloc_huge_page_vmemmap(struct hstate *h, struct page *head,
> +                           gfp_t gfp_mask);
>  void free_huge_page_vmemmap(struct hstate *h, struct page *head);
>  #else
> +static inline int alloc_huge_page_vmemmap(struct hstate *h, struct page *head,
> +                                         gfp_t gfp_mask)
> +{
> +       return 0;
> +}
> +
>  static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
>  {
>  }
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 50c1dc00b686..277eb43aebd5 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -40,7 +40,8 @@
>   * @remap_pte:         called for each non-empty PTE (lowest-level) entry.
>   * @reuse_page:                the page which is reused for the tail vmemmap pages.
>   * @reuse_addr:                the virtual address of the @reuse_page page.
> - * @vmemmap_pages:     the list head of the vmemmap pages that can be freed.
> + * @vmemmap_pages:     the list head of the vmemmap pages that can be freed
> + *                     or is mapped from.
>   */
>  struct vmemmap_remap_walk {
>         void (*remap_pte)(pte_t *pte, unsigned long addr,
> @@ -237,6 +238,78 @@ void vmemmap_remap_free(unsigned long start, unsigned long end,
>         free_vmemmap_page_list(&vmemmap_pages);
>  }
>
> +static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
> +                               struct vmemmap_remap_walk *walk)
> +{
> +       pgprot_t pgprot = PAGE_KERNEL;
> +       struct page *page;
> +       void *to;
> +
> +       BUG_ON(pte_page(*pte) != walk->reuse_page);
> +
> +       page = list_first_entry(walk->vmemmap_pages, struct page, lru);
> +       list_del(&page->lru);
> +       to = page_to_virt(page);
> +       copy_page(to, (void *)walk->reuse_addr);
> +
> +       set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
> +}
> +
> +static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
> +                                  gfp_t gfp_mask, struct list_head *list)
> +{
> +       unsigned long addr;
> +       int nid = page_to_nid((const void *)start);
> +       struct page *page, *next;
> +
> +       for (addr = start; addr < end; addr += PAGE_SIZE) {
> +               page = alloc_pages_node(nid, gfp_mask, 0);
> +               if (!page)
> +                       goto out;
> +               list_add_tail(&page->lru, list);
> +       }
> +
> +       return 0;
> +out:
> +       list_for_each_entry_safe(page, next, list, lru)
> +               __free_pages(page, 0);
> +       return -ENOMEM;
> +}
> +
> +/**
> + * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
> + *                      to the page which is from the @vmemmap_pages
> + *                      respectively.
> + * @start:     start address of the vmemmap virtual address range that we want
> + *             to remap.
> + * @end:       end address of the vmemmap virtual address range that we want to
> + *             remap.
> + * @reuse:     reuse address.
> + * @gpf_mask:  GFP flag for allocating vmemmap pages.
> + */
> +int vmemmap_remap_alloc(unsigned long start, unsigned long end,
> +                       unsigned long reuse, gfp_t gfp_mask)
> +{
> +       LIST_HEAD(vmemmap_pages);
> +       struct vmemmap_remap_walk walk = {
> +               .remap_pte      = vmemmap_restore_pte,
> +               .reuse_addr     = reuse,
> +               .vmemmap_pages  = &vmemmap_pages,
> +       };
> +
> +       /* See the comment in the vmemmap_remap_free(). */
> +       BUG_ON(start - reuse != PAGE_SIZE);
> +
> +       might_sleep_if(gfpflags_allow_blocking(gfp_mask));
> +
> +       if (alloc_vmemmap_page_list(start, end, gfp_mask, &vmemmap_pages))
> +               return -ENOMEM;
> +
> +       vmemmap_remap_range(reuse, end, &walk);
> +
> +       return 0;
> +}
> +
>  /*
>   * Allocate a block of memory to be used to back the virtual memory map
>   * or to back the page tables that are used to create the mapping.
> --
> 2.11.0
>
