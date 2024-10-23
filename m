Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C71CEEB4
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729702653; cv=none; b=G+6JRMed8OKy7NCKQ6Kj7ee6DCAtDL4rklKnEHjaBJuatHAZ572aCgUYeLoW6tXQ4ZkelF4xmKubrtxYdpZsdfyHtQ4q27KqZzkShAfvvDiZutIY9XUufHCPi40rrhGKesNGSl8atgq3Sge7KkNUNbNxMKaFzR5FsiF9EUt951c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729702653; c=relaxed/simple;
	bh=PN3PI30mlWJZbmmYTwqKM1tqjl4S+h/wwTjNa0FVzeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSd1ZmAjiKUsuuzmNqVdxRqkBDEjJbKgdlv46qcf9ARiU9gLIbRX2lUQgBynvSiF0Oy7rezjzl8+K3muaOUFtq7elSUuwoSMMF+l0YWYi4yVt91zXz9FYSt0VlobfN68tfx34CI2c/4Oimp+qpma3ZBklVoBhebmH/ew3G4oGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MGyhsVb1; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MGyhsVb1"
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4a47cdaf158so2211422137.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 09:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729702640; x=1730307440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/rVx4xhU3buqF3s0gjUuJjCcbEqwnGQ1z7b5w2uvVo=;
        b=MGyhsVb1wb8I8SyZmZzjI+eKd3eL0J04qtSAN4rGcQZtkxkum92IDThx8i7JneXusQ
         wyTrlsJOUeux2bZSZ0lsbYyI0FjxVBH3oa77KIhki4xSEGhflWXD3ihWqrQh/HF0BYZ5
         BSQtybQbAuUvF2yFmLJxksuk98pczC2QfqfoRJYeagr4ORWmaMiZ6wGvwQSgbKMOdJVg
         40VFN4J1x/8OTcSiP1ZrDVyc2B+t5HaMZJpQ3GjtGBtw04oxfwnfB45D5qq2QlxvWhc8
         5JMwPgcyjCCA6npZ4nzLdxLk9fKNRQihQr9ZUTanYe5lViRfSjYjUb9Zw1JobaqkSZXU
         EG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702640; x=1730307440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/rVx4xhU3buqF3s0gjUuJjCcbEqwnGQ1z7b5w2uvVo=;
        b=D7VRtHUwbJVCuN5fNPsuOGVJ43dnBvls31Y8inRrNDF1vs3h1B/r4FV0aMjUMt69Sj
         4O29NF9F+IeRB3M+2FMTGihuvZ9DTcAOYAIPUmktHgjbXG/uxIvYmqSJckOT/fwLV8e4
         RcbSXZI/9bmz4LGEwqvwm4nSE8Fwf16DzLwL1BLUw8Y5Lm0m+EoMz6nWDM+R1hycsQoH
         iSLWVdcVShFJ+7foAevBD8Xxxntm+OztQzi6Fy3/y9yErLSOC+NyVqUacM964YM7zdR4
         +BRvhOz/tdzYJyXT7Tz4kw/WxXME4apu4zD6Pyy9nLna2nYQksVr4aVCYb1iZvLEJWXI
         97FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSqGI452inR6ePD07Y3Uph4FsgzF5w9u+xK/UOmLYYGaL9zJ2VxVADxGXkppkCCE2ktfZ8ht/0x9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPV/hYTwfKJNoSOuYQ5YVBCYf9ZuAzeeWuuVyEvQKH/LMUPRtL
	dj0xcdjTZLjz68yl3yyB8KtRaIKHCi1SW/TDAZz/8p5HUHboxWa+VX3ARaXvcvoNOOh/vabfp8z
	hEsF+IrpV9+UjNsd5Go+gpeQLyiW3+rcZGFFB
X-Google-Smtp-Source: AGHT+IGSJeWtcRaA8iYuESb6rplWy4Of3qzkk0PG4kshEpuHBGh03Nt3K4ZeA5mV5+18EYLdAnexB7Ty55xQ1ZXT/Bc=
X-Received: by 2002:a05:6102:3709:b0:492:a93d:7cab with SMTP id
 ada2fe7eead31-4a751a7ee61mr3970593137.1.1729702640436; Wed, 23 Oct 2024
 09:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830100438.3623486-1-usamaarif642@gmail.com>
 <20240830100438.3623486-3-usamaarif642@gmail.com> <4B7449C4-D2B8-4285-973C-97178C09CE7E@nvidia.com>
 <27d04537-ebda-4462-b008-878390d4b211@gmail.com>
In-Reply-To: <27d04537-ebda-4462-b008-878390d4b211@gmail.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 23 Oct 2024 10:56:43 -0600
Message-ID: <CAOUHufZeWWs8f4-BokLBgy_oSbT-pfjFpJFNZ+tW0qW9RifX0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] mm: remap unused subpages to shared zeropage when
 splitting isolated thp
To: Usama Arif <usamaarif642@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, 
	roman.gushchin@linux.dev, david@redhat.com, npache@redhat.com, 
	baohua@kernel.org, ryan.roberts@arm.com, rppt@kernel.org, willy@infradead.org, 
	cerasuolodomenico@gmail.com, ryncsn@gmail.com, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com, 
	Shuang Zhai <zhais@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 10:51=E2=80=AFAM Usama Arif <usamaarif642@gmail.com=
> wrote:
>
> On 23/10/2024 17:21, Zi Yan wrote:
> > On 30 Aug 2024, at 6:03, Usama Arif wrote:
> >
> >> From: Yu Zhao <yuzhao@google.com>
> >>
> >> Here being unused means containing only zeros and inaccessible to
> >> userspace. When splitting an isolated thp under reclaim or migration,
> >> the unused subpages can be mapped to the shared zeropage, hence saving
> >> memory. This is particularly helpful when the internal
> >> fragmentation of a thp is high, i.e. it has many untouched subpages.
> >>
> >> This is also a prerequisite for THP low utilization shrinker which wil=
l
> >> be introduced in later patches, where underutilized THPs are split, an=
d
> >> the zero-filled pages are freed saving memory.
> >>
> >> Signed-off-by: Yu Zhao <yuzhao@google.com>
> >> Tested-by: Shuang Zhai <zhais@google.com>
> >> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> >> ---
> >>  include/linux/rmap.h |  7 ++++-
> >>  mm/huge_memory.c     |  8 ++---
> >>  mm/migrate.c         | 72 ++++++++++++++++++++++++++++++++++++++-----=
-
> >>  mm/migrate_device.c  |  4 +--
> >>  4 files changed, 75 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> >> index 91b5935e8485..d5e93e44322e 100644
> >> --- a/include/linux/rmap.h
> >> +++ b/include/linux/rmap.h
> >> @@ -745,7 +745,12 @@ int folio_mkclean(struct folio *);
> >>  int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgof=
f_t pgoff,
> >>                    struct vm_area_struct *vma);
> >>
> >> -void remove_migration_ptes(struct folio *src, struct folio *dst, bool=
 locked);
> >> +enum rmp_flags {
> >> +    RMP_LOCKED              =3D 1 << 0,
> >> +    RMP_USE_SHARED_ZEROPAGE =3D 1 << 1,
> >> +};
> >> +
> >> +void remove_migration_ptes(struct folio *src, struct folio *dst, int =
flags);
> >>
> >>  /*
> >>   * rmap_walk_control: To control rmap traversing for specific needs
> >> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> >> index 0c48806ccb9a..af60684e7c70 100644
> >> --- a/mm/huge_memory.c
> >> +++ b/mm/huge_memory.c
> >> @@ -3020,7 +3020,7 @@ bool unmap_huge_pmd_locked(struct vm_area_struct=
 *vma, unsigned long addr,
> >>      return false;
> >>  }
> >>
> >> -static void remap_page(struct folio *folio, unsigned long nr)
> >> +static void remap_page(struct folio *folio, unsigned long nr, int fla=
gs)
> >>  {
> >>      int i =3D 0;
> >>
> >> @@ -3028,7 +3028,7 @@ static void remap_page(struct folio *folio, unsi=
gned long nr)
> >>      if (!folio_test_anon(folio))
> >>              return;
> >>      for (;;) {
> >> -            remove_migration_ptes(folio, folio, true);
> >> +            remove_migration_ptes(folio, folio, RMP_LOCKED | flags);
> >>              i +=3D folio_nr_pages(folio);
> >>              if (i >=3D nr)
> >>                      break;
> >> @@ -3240,7 +3240,7 @@ static void __split_huge_page(struct page *page,=
 struct list_head *list,
> >>
> >>      if (nr_dropped)
> >>              shmem_uncharge(folio->mapping->host, nr_dropped);
> >> -    remap_page(folio, nr);
> >> +    remap_page(folio, nr, PageAnon(head) ? RMP_USE_SHARED_ZEROPAGE : =
0);
> >>
> >>      /*
> >>       * set page to its compound_head when split to non order-0 pages,=
 so
> >> @@ -3542,7 +3542,7 @@ int split_huge_page_to_list_to_order(struct page=
 *page, struct list_head *list,
> >>              if (mapping)
> >>                      xas_unlock(&xas);
> >>              local_irq_enable();
> >> -            remap_page(folio, folio_nr_pages(folio));
> >> +            remap_page(folio, folio_nr_pages(folio), 0);
> >>              ret =3D -EAGAIN;
> >>      }
> >>
> >> diff --git a/mm/migrate.c b/mm/migrate.c
> >> index 6f9c62c746be..d039863e014b 100644
> >> --- a/mm/migrate.c
> >> +++ b/mm/migrate.c
> >> @@ -204,13 +204,57 @@ bool isolate_folio_to_list(struct folio *folio, =
struct list_head *list)
> >>      return true;
> >>  }
> >>
> >> +static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk=
 *pvmw,
> >> +                                      struct folio *folio,
> >> +                                      unsigned long idx)
> >> +{
> >> +    struct page *page =3D folio_page(folio, idx);
> >> +    bool contains_data;
> >> +    pte_t newpte;
> >> +    void *addr;
> >> +
> >> +    VM_BUG_ON_PAGE(PageCompound(page), page);
> >
> > This should be:
> >
> > diff --git a/mm/migrate.c b/mm/migrate.c
> > index e950fd62607f..7ffdbe078aa7 100644
> > --- a/mm/migrate.c
> > +++ b/mm/migrate.c
> > @@ -206,7 +206,8 @@ static bool try_to_map_unused_to_zeropage(struct pa=
ge_vma_mapped_walk *pvmw,
> >         pte_t newpte;
> >         void *addr;
> >
> > -       VM_BUG_ON_PAGE(PageCompound(page), page);
> > +       if (PageCompound(page))
> > +               return false;
> >         VM_BUG_ON_PAGE(!PageAnon(page), page);
> >         VM_BUG_ON_PAGE(!PageLocked(page), page);
> >         VM_BUG_ON_PAGE(pte_present(*pvmw->pte), page);
> >
> > Otherwise, splitting anonymous large folios to non order-0 ones just
> > triggers this BUG_ON.
> >
>
> That makes sense, would you like to send the fix?
>
> Adding Yu Zhao to "To" incase he has any objections.

LGTM. Thanks!
