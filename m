Return-Path: <SRS0=+SUo=C5=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841D3C43466
	for <linux-doc@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4471B216C4
	for <linux-doc@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="uf2OGboF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgITJ7j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Sep 2020 05:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgITJ7j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Sep 2020 05:59:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CF5C0613CF
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2020 02:59:38 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id e4so5359060pln.10
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2020 02:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bsQK8LpuxrhLjsMMeuAwU+LPx3UZkeZ5l4b7tYvmwRw=;
        b=uf2OGboFLy/L86Po2Es5Zv7ilwDEHjiD68HdWMnC+2TTVeQq6+3TpQ8S4hx54ztRz6
         byRNGnVskkzKHg8WColeN7JdIRLxsd260424uAjNg9dOsUdX7kTpbuuiWjtlFCdyXxxB
         d6Ubn2mPsUlkDVPO/GCNxHunwKCXPScicvQszzSzCGq2eusF2u40NN0hrA9iqGzwzBvv
         oAM9YZQQn1IcETFhLtCe6kJ90ZtQoanr/NjfI2jG1VGZLhviiFKwbdZuJZbY3VsavHer
         xv1SnI9UsEv6Mwwu8/vVj4sP5FTPPSnySzsOPSPXrzB8ga5sgjTi1RXltGX/o1IXvm50
         RBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bsQK8LpuxrhLjsMMeuAwU+LPx3UZkeZ5l4b7tYvmwRw=;
        b=gkwwEQDeaR0E+xxDPQqxyhMH88+kieGNPR9KE5RpVKrRPx4YM40X32llh+XTjNfLeR
         daDKuiKMgPKsLWLnOrL5gFREjvJZFFqc5Z41a3A9LSDAR4QwzAW1NTw7G2MJviy2tKEj
         qfsS8pT0gbdMF9dwu162i2aPrtajws8sRvM+1eUjkrqk2AYI+ylMbQ27/9LRCEjneJJI
         XdEhKAwq3Ad9hRT2SUju+q27QR/p5uCbTFmZPZ8c24p+/E9ViKUasjWOQgtekGFHCQVi
         dpqwLf3HNn+07db2hqdghxcpvhcdm4QzOpMt0paATaCrcA98c7atZL9Fstb5LDazKaeL
         Df8Q==
X-Gm-Message-State: AOAM533rRYozUj3ott6SH/lNXgnVTnNtsArKoWuNjUQ4Ifz9xhc4dXjT
        TpwTkWZhYIGPvC9Uv7BAwHXcAUmzAogwMg9stuzgnXU98Jir5R46
X-Google-Smtp-Source: ABdhPJyLB6JeulC3J3qt+PdRVgQHD1bgo33KeQ7Z9TGvBKZsB/ZmYNsfj5G5KTW1QcP1SkVeA5KsxqzEv001KyERvQA=
X-Received: by 2002:a17:90a:bc8d:: with SMTP id x13mr20950424pjr.229.1600595978266;
 Sun, 20 Sep 2020 02:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125947.26204-1-songmuchun@bytedance.com> <20200915125947.26204-22-songmuchun@bytedance.com>
In-Reply-To: <20200915125947.26204-22-songmuchun@bytedance.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sun, 20 Sep 2020 17:59:01 +0800
Message-ID: <CAMZfGtWXr0A3ymf_trBmUggRudbZbhfwNCJWSHZdkK9JeBY1fg@mail.gmail.com>
Subject: Re: [RFC PATCH 21/24] mm/hugetlb: Merge pte to huge pmd only for
 gigantic page
To:     Jonathan Corbet <corbet@lwn.net>,
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
        David Rientjes <rientjes@google.com>
Cc:     linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 15, 2020 at 9:03 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> Merge pte to huge pmd if it has ever been split. Now only support
> gigantic page which's vmemmap pages size is an integer multiple of
> PMD_SIZE. This is the simplest case to handle.
>
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> ---
>  include/linux/hugetlb.h |   7 +++
>  mm/hugetlb.c            | 104 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 109 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index e3aa192f1c39..c56df0da7ae5 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -611,6 +611,13 @@ static inline bool vmemmap_pmd_huge(pmd_t *pmd)
>  }
>  #endif
>
> +#ifndef vmemmap_pmd_mkhuge
> +static inline pmd_t vmemmap_pmd_mkhuge(struct page *page)
> +{
> +       return pmd_mkhuge(mk_pmd(page, PAGE_KERNEL));
> +}
> +#endif
> +
>  #ifndef VMEMMAP_HPAGE_SHIFT
>  #define VMEMMAP_HPAGE_SHIFT            PMD_SHIFT
>  #endif
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 28c154679838..3ca36e259b4e 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1759,6 +1759,62 @@ static void __remap_huge_page_pte_vmemmap(struct page *reuse, pte_t *ptep,
>         }
>  }
>
> +static void __replace_huge_page_pte_vmemmap(pte_t *ptep, unsigned long start,
> +                                           unsigned int nr, struct page *huge,
> +                                           struct list_head *free_pages)
> +{
> +       unsigned long addr;
> +       unsigned long end = start + (nr  << PAGE_SHIFT);
> +
> +       for (addr = start; addr < end; addr += PAGE_SIZE, ptep++) {
> +               struct page *page;
> +               pte_t old = *ptep;
> +               pte_t entry;
> +
> +               prepare_vmemmap_page(huge);
> +
> +               entry = mk_pte(huge++, PAGE_KERNEL);
> +               VM_WARN_ON(!pte_present(old));
> +               page = pte_page(old);
> +               list_add(&page->lru, free_pages);
> +
> +               set_pte_at(&init_mm, addr, ptep, entry);
> +       }
> +}
> +
> +static void replace_huge_page_pmd_vmemmap(pmd_t *pmd, unsigned long start,
> +                                         struct page *huge,
> +                                         struct list_head *free_pages)
> +{
> +       unsigned long end = start + VMEMMAP_HPAGE_SIZE;
> +
> +       flush_cache_vunmap(start, end);
> +       __replace_huge_page_pte_vmemmap(pte_offset_kernel(pmd, start), start,
> +                                       VMEMMAP_HPAGE_NR, huge, free_pages);
> +       flush_tlb_kernel_range(start, end);
> +}
> +
> +static pte_t *merge_vmemmap_pte(pmd_t *pmdp, unsigned long addr)
> +{
> +       pte_t *pte;
> +       struct page *page;
> +
> +       pte = pte_offset_kernel(pmdp, addr);
> +       page = pte_page(*pte);
> +       set_pmd(pmdp, vmemmap_pmd_mkhuge(page));
> +
> +       return pte;
> +}
> +
> +static void merge_huge_page_pmd_vmemmap(pmd_t *pmd, unsigned long start,
> +                                       struct page *huge,
> +                                       struct list_head *free_pages)
> +{
> +       replace_huge_page_pmd_vmemmap(pmd, start, huge, free_pages);
> +       pte_free_kernel(&init_mm, merge_vmemmap_pte(pmd, start));
> +       flush_tlb_kernel_range(start, start + VMEMMAP_HPAGE_SIZE);
> +}
> +
>  static inline void alloc_vmemmap_pages(struct hstate *h, struct list_head *list)
>  {
>         int i;
> @@ -1772,6 +1828,15 @@ static inline void alloc_vmemmap_pages(struct hstate *h, struct list_head *list)
>         }
>  }
>
> +static inline void dissolve_compound_page(struct page *page, unsigned int order)
> +{
> +       int i;
> +       unsigned int nr_pages = 1 << order;
> +
> +       for (i = 1; i < nr_pages; i++)
> +               set_page_refcounted(page + i);
> +}
> +
>  static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
>  {
>         pmd_t *pmd;
> @@ -1791,10 +1856,45 @@ static void alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
>                                     __remap_huge_page_pte_vmemmap);
>         if (!freed_vmemmap_hpage_dec(pmd_page(*pmd)) && pmd_split(pmd)) {
>                 /*
> -                * Todo:
> -                * Merge pte to huge pmd if it has ever been split.
> +                * Merge pte to huge pmd if it has ever been split. Now only
> +                * support gigantic page which's vmemmap pages size is an
> +                * integer multiple of PMD_SIZE. This is the simplest case
> +                * to handle.
>                  */
>                 clear_pmd_split(pmd);
> +
> +               if (IS_ALIGNED(nr_vmemmap(h), VMEMMAP_HPAGE_NR)) {
> +                       unsigned long addr = (unsigned long)head;
> +                       unsigned long end = addr + nr_vmemmap_size(h);
> +
> +                       spin_unlock(ptl);
> +
> +                       for (; addr < end; addr += VMEMMAP_HPAGE_SIZE) {
> +                               void *to;
> +                               struct page *page;
> +
> +                               page = alloc_pages(GFP_VMEMMAP_PAGE & ~__GFP_NOFAIL,
> +                                                  VMEMMAP_HPAGE_ORDER);
> +                               if (!page)
> +                                       goto out;

Here forget to call dissolve_compound_page().

+                               dissolve_compound_page(page,
+                                                      VMEMMAP_HPAGE_ORDER);

> +
> +                               to = page_to_virt(page);
> +                               memcpy(to, (void *)addr, VMEMMAP_HPAGE_SIZE);
> +
> +                               /*
> +                                * Make sure that any data that writes to the
> +                                * @to is made visible to the physical page.
> +                                */
> +                               flush_kernel_vmap_range(to, VMEMMAP_HPAGE_SIZE);
> +
> +                               merge_huge_page_pmd_vmemmap(pmd++, addr, page,
> +                                                           &remap_pages);
> +                       }
> +
> +out:
> +                       free_vmemmap_page_list(&remap_pages);
> +                       return;
> +               }
>         }
>         spin_unlock(ptl);
>  }
> --
> 2.20.1
>


-- 
Yours,
Muchun
