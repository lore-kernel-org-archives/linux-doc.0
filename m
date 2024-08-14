Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0780510953
	for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2024 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723606272; cv=none; b=A/LGInaOeeqn1Mvqs9tt1Q6td4Vh5LAhlnLTnJhHVR6Tk7lGp5W3Kx8N2K1pRjO6RXkN3+D26qAK9SPc19AEfl9Cb+vmLYXEbDhfuJ+FQaHIRXljh2AZB67tR0Yrta5XsrOBxNQOuPl0T8mOdL3ONSNDQt6lEMcJR70+pF6FYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723606272; c=relaxed/simple;
	bh=qLVZFKDOfZiP1EG8a0DxFzqw3+0uKykLMxJ5BeW/Ak8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5zg0pW8pnhQ5K/Y3y/ItIEcWA1B8QcYGu/LhSIoXp/HP4r+5bau7PVwRj1TEZ8mgTBp44fHOy5cS0DPRNpaNiC/UCubmlOPP47OQFYWclceerXSQxoFIgr41v4tg325anQzrZSq46QIkP9HdkZt120h1/Dq8V9nUOsJN+OYhPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fWfh0xa4; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fWfh0xa4"
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-493e8ef36b4so2298499137.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Aug 2024 20:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723606270; x=1724211070; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5YMU657YZ05upGCS+aWT0db2wX9BIY3l1kVbynW98U=;
        b=fWfh0xa4R0WKEi7M2xnItupBK+NNSvycatM3XN0qFp0IEsh3isDil9j9Z4bd3ATW43
         6PyT+e9+Fp2o4X5WXd+V9Zp+dlYHtsiiej/GPiqykkqrO2QEQPLBqifVZWXXYKpq58Wt
         AqI2dea7ff4IVh32cuCbwek1m9EqKRvd1+jo8A7yiP3q5mpHOCLAvaBLgaTFYFF+ELu4
         8QxAYkFqN8Y/NzwRyeoAcw9i8R+8tncFxyJyoLXaOppIoO05eKQJB+TTf4y4rbyfFTon
         6wNwvoCLiaMiOzIFBw60Pp7L8uecgDq9kEQjamJGmvMALv/z95xypfT4dS5Niv0g/Wrn
         NT3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723606270; x=1724211070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y5YMU657YZ05upGCS+aWT0db2wX9BIY3l1kVbynW98U=;
        b=ftRmAg25dx7KaYCxrK9hWUj4zlwExfXgj35cGsRvRK57zIFIhWOLD7upw/IUbjCo7+
         EQGsfroeJiAfmGltoedZE7kUafcD/TZI9Dt14D9yut9yMEEsh/SymdIi7Sn2s3/uwPpe
         Cv6f3IBdDEN/tre7hxs21SSR4kYHp4EZddyUfjShHe1y/4DM1RbDTseXI74LCIDKi6xp
         mJRMykqeFhxQzu+6JfvX8t3GuiD5o9k1AXjv8lhdcEnzaiO/+MFcGfZqZzlbEoJbZsud
         /o1CcbcTIkKP2vCe6WQRrtFQ8X5CptDWyFyIW03JfjaA0dz49z14ojvThsxEIFtP8fRK
         EJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiRSzd70CCzR5SX/8cO7zja9shywnVcOUarK7gk1nTGOS+AMU5aTl/9LLHUEFKgLlkZnhH07MWe4U/Om92oY1n7Qf/fAdfsH8A
X-Gm-Message-State: AOJu0YxdQRvI0xK35OanJScn8yBNXPzOHzJd3WlyMCMpn0GMihbjM8fs
	NrDbbW8J32KkfygGvjMCQha25TC14hDla2I9LzRWc8CWcfis/GGDzXJu3kpYMfYURlMDuGj++73
	QTyZmr8OCACkxmxMqRw/8IX5osuuW9lUGnZdT
X-Google-Smtp-Source: AGHT+IFoI+9BATcpgFSTVKVtMi4ALVq7dXWMVdGEd4sX+JwZXcj4hFKUJe3baRzYW08dVcY16KYq9UFokwSeIr6zrFY=
X-Received: by 2002:a05:6102:a54:b0:493:e0cb:7263 with SMTP id
 ada2fe7eead31-497599d10fbmr2048954137.29.1723606269636; Tue, 13 Aug 2024
 20:31:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813120328.1275952-1-usamaarif642@gmail.com> <20240813120328.1275952-5-usamaarif642@gmail.com>
In-Reply-To: <20240813120328.1275952-5-usamaarif642@gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Tue, 13 Aug 2024 21:30:31 -0600
Message-ID: <CAOUHufbmgwZwzUuHVvEDMqPGcsxE2hEreRZ4PhK5yz27GdK-Tw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] mm: Introduce a pageflag for partially mapped folios
To: Usama Arif <usamaarif642@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, hannes@cmpxchg.org, 
	riel@surriel.com, shakeel.butt@linux.dev, roman.gushchin@linux.dev, 
	david@redhat.com, baohua@kernel.org, ryan.roberts@arm.com, rppt@kernel.org, 
	willy@infradead.org, cerasuolodomenico@gmail.com, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 6:03=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
> Currently folio->_deferred_list is used to keep track of
> partially_mapped folios that are going to be split under memory
> pressure. In the next patch, all THPs that are faulted in and collapsed
> by khugepaged are also going to be tracked using _deferred_list.
>
> This patch introduces a pageflag to be able to distinguish between
> partially mapped folios and others in the deferred_list at split time in
> deferred_split_scan. Its needed as __folio_remove_rmap decrements
> _mapcount, _large_mapcount and _entire_mapcount, hence it won't be
> possible to distinguish between partially mapped folios and others in
> deferred_split_scan.
>
> Eventhough it introduces an extra flag to track if the folio is
> partially mapped, there is no functional change intended with this
> patch and the flag is not useful in this patch itself, it will
> become useful in the next patch when _deferred_list has non partially
> mapped folios.
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/huge_mm.h    |  4 ++--
>  include/linux/page-flags.h |  3 +++
>  mm/huge_memory.c           | 21 +++++++++++++--------
>  mm/hugetlb.c               |  1 +
>  mm/internal.h              |  4 +++-
>  mm/memcontrol.c            |  3 ++-
>  mm/migrate.c               |  3 ++-
>  mm/page_alloc.c            |  5 +++--
>  mm/rmap.c                  |  3 ++-
>  mm/vmscan.c                |  3 ++-
>  10 files changed, 33 insertions(+), 17 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 4c32058cacfe..969f11f360d2 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -321,7 +321,7 @@ static inline int split_huge_page(struct page *page)
>  {
>         return split_huge_page_to_list_to_order(page, NULL, 0);
>  }
> -void deferred_split_folio(struct folio *folio);
> +void deferred_split_folio(struct folio *folio, bool partially_mapped);
>
>  void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
>                 unsigned long address, bool freeze, struct folio *folio);
> @@ -495,7 +495,7 @@ static inline int split_huge_page(struct page *page)
>  {
>         return 0;
>  }
> -static inline void deferred_split_folio(struct folio *folio) {}
> +static inline void deferred_split_folio(struct folio *folio, bool partia=
lly_mapped) {}
>  #define split_huge_pmd(__vma, __pmd, __address)        \
>         do { } while (0)
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index a0a29bd092f8..cecc1bad7910 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -182,6 +182,7 @@ enum pageflags {
>         /* At least one page in this folio has the hwpoison flag set */
>         PG_has_hwpoisoned =3D PG_active,
>         PG_large_rmappable =3D PG_workingset, /* anon or file-backed */
> +       PG_partially_mapped, /* was identified to be partially mapped */
>  };
>
>  #define PAGEFLAGS_MASK         ((1UL << NR_PAGEFLAGS) - 1)
> @@ -861,8 +862,10 @@ static inline void ClearPageCompound(struct page *pa=
ge)
>         ClearPageHead(page);
>  }
>  FOLIO_FLAG(large_rmappable, FOLIO_SECOND_PAGE)
> +FOLIO_FLAG(partially_mapped, FOLIO_SECOND_PAGE)
>  #else
>  FOLIO_FLAG_FALSE(large_rmappable)
> +FOLIO_FLAG_FALSE(partially_mapped)
>  #endif
>
>  #define PG_head_mask ((1UL << PG_head))
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 6df0e9f4f56c..c024ab0f745c 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3397,6 +3397,7 @@ int split_huge_page_to_list_to_order(struct page *p=
age, struct list_head *list,
>                          * page_deferred_list.
>                          */
>                         list_del_init(&folio->_deferred_list);
> +                       folio_clear_partially_mapped(folio);
>                 }
>                 spin_unlock(&ds_queue->split_queue_lock);
>                 if (mapping) {
> @@ -3453,11 +3454,12 @@ void __folio_undo_large_rmappable(struct folio *f=
olio)
>         if (!list_empty(&folio->_deferred_list)) {
>                 ds_queue->split_queue_len--;
>                 list_del_init(&folio->_deferred_list);
> +               folio_clear_partially_mapped(folio);
>         }
>         spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
>  }
>
> -void deferred_split_folio(struct folio *folio)
> +void deferred_split_folio(struct folio *folio, bool partially_mapped)
>  {
>         struct deferred_split *ds_queue =3D get_deferred_split_queue(foli=
o);
>  #ifdef CONFIG_MEMCG
> @@ -3485,14 +3487,17 @@ void deferred_split_folio(struct folio *folio)
>         if (folio_test_swapcache(folio))
>                 return;
>
> -       if (!list_empty(&folio->_deferred_list))
> -               return;
> -
>         spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
> +       if (partially_mapped)
> +               folio_set_partially_mapped(folio);
> +       else
> +               folio_clear_partially_mapped(folio);
>         if (list_empty(&folio->_deferred_list)) {
> -               if (folio_test_pmd_mappable(folio))
> -                       count_vm_event(THP_DEFERRED_SPLIT_PAGE);
> -               count_mthp_stat(folio_order(folio), MTHP_STAT_SPLIT_DEFER=
RED);
> +               if (partially_mapped) {
> +                       if (folio_test_pmd_mappable(folio))
> +                               count_vm_event(THP_DEFERRED_SPLIT_PAGE);
> +                       count_mthp_stat(folio_order(folio), MTHP_STAT_SPL=
IT_DEFERRED);
> +               }
>                 list_add_tail(&folio->_deferred_list, &ds_queue->split_qu=
eue);
>                 ds_queue->split_queue_len++;
>  #ifdef CONFIG_MEMCG
> @@ -3541,6 +3546,7 @@ static unsigned long deferred_split_scan(struct shr=
inker *shrink,
>                 } else {
>                         /* We lost race with folio_put() */
>                         list_del_init(&folio->_deferred_list);
> +                       folio_clear_partially_mapped(folio);
>                         ds_queue->split_queue_len--;
>                 }
>                 if (!--sc->nr_to_scan)
> @@ -3558,7 +3564,6 @@ static unsigned long deferred_split_scan(struct shr=
inker *shrink,
>  next:
>                 folio_put(folio);
>         }
> -

Unintentional change above?

>         spin_lock_irqsave(&ds_queue->split_queue_lock, flags);
>         list_splice_tail(&list, &ds_queue->split_queue);
>         spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1fdd9eab240c..2ae2d9a18e40 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -1758,6 +1758,7 @@ static void __update_and_free_hugetlb_folio(struct =
hstate *h,
>                 free_gigantic_folio(folio, huge_page_order(h));
>         } else {
>                 INIT_LIST_HEAD(&folio->_deferred_list);
> +               folio_clear_partially_mapped(folio);

Why does it need to clear a flag that should never be set on hugeTLB folios=
?

HugeTLB does really use _deferred_list -- it clears it only to avoid
bad_page() because of the overlapping fields:
                        void *_hugetlb_subpool;
                        void *_hugetlb_cgroup;
