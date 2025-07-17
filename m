Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DA822068F
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737024; cv=none; b=LAllpNfrSgnnG9OqzJhDhIztkJumDem53isaGOZYYnnBSIGRLvfpdNdNg4AFUP0JjkwzlVsb5zqJRAfcWhpRnNhsb/qtyI/PgINvHZQPVlFiKKmvbxN/G6a/wpDXN4Qr+1HYxTMcZX/7IIYKLdnHnpO0BfkuBAJfi8Y4SZOFt/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737024; c=relaxed/simple;
	bh=izJ7p1OU0lCyCKa4cgyAx8Vf4UaU956Ivc4z6abcz2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0+t9z8EQIb4SKYnFgbqJiT236Zt7mHNEIAd25p3aL53NNnOFbZOjFyhRH8Di5dbZODqHUIGq9T5Huof8RHNOaYPS9bIilqI6L3OrohjHq2B3RRQ1+Hkm/oumTXxi7id+aQz516ySY6e4LOjHDjB/MYWS6RYlj9Y0mytxiTe3b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b8/y8Z3o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b8/y8Z3o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752737022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xka/ZuoT5H83UsFhmNwZ/doTSozyLFCxoHnEvCahLTQ=;
	b=b8/y8Z3oShXQyUJtFpkM5h6HLaFt7RJV02nkGsR0fEp3c4GerN7938gLYpm6EdFRSDAe8w
	VRwpE1K2CGHDERZtI7d+cjNwdUbdpZUdeGh2ZPTGGELf9GckdW9l/+kex/BmYWvp2CE0+n
	lOlFNf3PdeS+k1A098gPRz53I/vSi/I=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-omwT9J3wNOq8MkbEJFBLbg-1; Thu, 17 Jul 2025 03:23:40 -0400
X-MC-Unique: omwT9J3wNOq8MkbEJFBLbg-1
X-Mimecast-MFC-AGG-ID: omwT9J3wNOq8MkbEJFBLbg_1752737020
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7140227e02fso8094027b3.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 00:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737019; x=1753341819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xka/ZuoT5H83UsFhmNwZ/doTSozyLFCxoHnEvCahLTQ=;
        b=BrSLtE7d8pDU7T2niDY8/VQUWdGFQC5QOS1oSVU1jxdx9OdjKTYsbiXugfpvv2bxEw
         XxNPtmCzCwTjlkJDUIAA87WHLebWbVw334tvjseCGiVhFKeimMLTtVd5s7XtRIfsrnH9
         qCoaeNlYDbb+z1KELgEwcUETWbB9KuOXKl5boMjuas40y2pGptog3ZWpHVnxjARhr5nq
         YV5OubKJsb0Ugj6sa8Uu2DrAD9gUSoVfN+EX5rufELO7MiGMPXUNHQgay78tDLA1qIe2
         WD2piRrjIbaZ6ey+Cmlm9P8eYSchKJ0LfRnvuYHoU6fK3SzCUHWraXvYOVDqPQv+rMw3
         Eabw==
X-Forwarded-Encrypted: i=1; AJvYcCWxVS0qmMoVw7hRLvCONunS1Wq3Arfs7bOrBCodWQKLmOk+r8Fzj9NnRv80iznuEOGxzUN4bX8b62Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy++6nhtRHrMhGL10wfOcChILN59ARVIJ7mhFU39Fd2mkhKn23R
	Fq9azoF02onDCWwz/SXEVfPYI7B9jfiidzlVy+hXPQyNei7DMg+dH6lXsidjNhpAkPUNz2XKYOl
	U7OQDw94QZKUt95x2r/lsiOttvxlk9aDbpx0Y3/0nopbIovqA/GsQosziw0iH4QgETjCtnBhgPP
	y2EmcXAbiiQC9kbxzF4LZxzW4doP4byipB28ye
X-Gm-Gg: ASbGncsMHZwkHUsCWdvuH9wPHjtShtFUagJgxipR+E0sCYAfiZ4VimAyHjo30yxRr73
	gooiQnQBgwXRX6XUU0qQPqzCNLdYYxrXD6un9LrpMMFE7u6CS3k3RwPNWuw0A/ZxGGb7xGovyUn
	ADTqbQDYsRT/g4ShlEvSakzqU=
X-Received: by 2002:a05:690c:1c:b0:714:13:357a with SMTP id 00721157ae682-7183733e754mr75568627b3.20.1752737019372;
        Thu, 17 Jul 2025 00:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG062fQmQMTtzQaORYO8BQfLpIhFpvKSjhTVlHbWcaYDeY88CgnYk46dQY+VDz9L5BhRQfpAlIpXIV3Coe2VM0=
X-Received: by 2002:a05:690c:1c:b0:714:13:357a with SMTP id
 00721157ae682-7183733e754mr75568367b3.20.1752737018858; Thu, 17 Jul 2025
 00:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-6-npache@redhat.com>
 <5ff595db-3720-4ce3-8d92-5f08d0625c75@redhat.com>
In-Reply-To: <5ff595db-3720-4ce3-8d92-5f08d0625c75@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 17 Jul 2025 01:23:12 -0600
X-Gm-Features: Ac12FXxSdZgIpFjqwS2OfbfxZpFjuP_7yWTzmxJmAa7_DtUsx7oTR3r9FbXes2k
Message-ID: <CAA1CXcBsCagKHJndYTKr=NyNCDxvJ=wf_wo0AubFoUe=r+Rdyw@mail.gmail.com>
Subject: Re: [PATCH v9 05/14] khugepaged: generalize __collapse_huge_page_*
 for mTHP support
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 8:03=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 14.07.25 02:31, Nico Pache wrote:
> > generalize the order of the __collapse_huge_page_* functions
> > to support future mTHP collapse.
> >
> > mTHP collapse can suffer from incosistant behavior, and memory waste
> > "creep". disable swapin and shared support for mTHP collapse.
> >
> > No functional changes in this patch.
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 49 +++++++++++++++++++++++++++++++-----------------=
-
> >   1 file changed, 31 insertions(+), 18 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index cc9a35185604..ee54e3c1db4e 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -552,15 +552,17 @@ static int __collapse_huge_page_isolate(struct vm=
_area_struct *vma,
> >                                       unsigned long address,
> >                                       pte_t *pte,
> >                                       struct collapse_control *cc,
> > -                                     struct list_head *compound_pageli=
st)
> > +                                     struct list_head *compound_pageli=
st,
> > +                                     u8 order)
> >   {
> >       struct page *page =3D NULL;
> >       struct folio *folio =3D NULL;
> >       pte_t *_pte;
> >       int none_or_zero =3D 0, shared =3D 0, result =3D SCAN_FAIL, refer=
enced =3D 0;
> >       bool writable =3D false;
> > +     int scaled_none =3D khugepaged_max_ptes_none >> (HPAGE_PMD_ORDER =
- order);
> >
> > -     for (_pte =3D pte; _pte < pte + HPAGE_PMD_NR;
> > +     for (_pte =3D pte; _pte < pte + (1 << order);
> >            _pte++, address +=3D PAGE_SIZE) {
> >               pte_t pteval =3D ptep_get(_pte);
> >               if (pte_none(pteval) || (pte_present(pteval) &&
> > @@ -568,7 +570,7 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >                       ++none_or_zero;
> >                       if (!userfaultfd_armed(vma) &&
> >                           (!cc->is_khugepaged ||
> > -                          none_or_zero <=3D khugepaged_max_ptes_none))=
 {
> > +                          none_or_zero <=3D scaled_none)) {
> >                               continue;
> >                       } else {
> >                               result =3D SCAN_EXCEED_NONE_PTE;
> > @@ -596,8 +598,8 @@ static int __collapse_huge_page_isolate(struct vm_a=
rea_struct *vma,
> >               /* See hpage_collapse_scan_pmd(). */
> >               if (folio_maybe_mapped_shared(folio)) {
> >                       ++shared;
> > -                     if (cc->is_khugepaged &&
> > -                         shared > khugepaged_max_ptes_shared) {
> > +                     if (order !=3D HPAGE_PMD_ORDER || (cc->is_khugepa=
ged &&
> > +                         shared > khugepaged_max_ptes_shared)) {
> >                               result =3D SCAN_EXCEED_SHARED_PTE;
> >                               count_vm_event(THP_SCAN_EXCEED_SHARED_PTE=
);
> >                               goto out;
> > @@ -698,13 +700,14 @@ static void __collapse_huge_page_copy_succeeded(p=
te_t *pte,
> >                                               struct vm_area_struct *vm=
a,
> >                                               unsigned long address,
> >                                               spinlock_t *ptl,
> > -                                             struct list_head *compoun=
d_pagelist)
> > +                                             struct list_head *compoun=
d_pagelist,
> > +                                             u8 order)
> >   {
> >       struct folio *src, *tmp;
> >       pte_t *_pte;
> >       pte_t pteval;
> >
> > -     for (_pte =3D pte; _pte < pte + HPAGE_PMD_NR;
> > +     for (_pte =3D pte; _pte < pte + (1 << order);
> >            _pte++, address +=3D PAGE_SIZE) {
> >               pteval =3D ptep_get(_pte);
> >               if (pte_none(pteval) || is_zero_pfn(pte_pfn(pteval))) {
> > @@ -751,7 +754,8 @@ static void __collapse_huge_page_copy_failed(pte_t =
*pte,
> >                                            pmd_t *pmd,
> >                                            pmd_t orig_pmd,
> >                                            struct vm_area_struct *vma,
> > -                                          struct list_head *compound_p=
agelist)
> > +                                          struct list_head *compound_p=
agelist,
> > +                                          u8 order)
> >   {
> >       spinlock_t *pmd_ptl;
> >
> > @@ -768,7 +772,7 @@ static void __collapse_huge_page_copy_failed(pte_t =
*pte,
> >        * Release both raw and compound pages isolated
> >        * in __collapse_huge_page_isolate.
> >        */
> > -     release_pte_pages(pte, pte + HPAGE_PMD_NR, compound_pagelist);
> > +     release_pte_pages(pte, pte + (1 << order), compound_pagelist);
> >   }
> >
> >   /*
> > @@ -789,7 +793,7 @@ static void __collapse_huge_page_copy_failed(pte_t =
*pte,
> >   static int __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
> >               pmd_t *pmd, pmd_t orig_pmd, struct vm_area_struct *vma,
> >               unsigned long address, spinlock_t *ptl,
> > -             struct list_head *compound_pagelist)
> > +             struct list_head *compound_pagelist, u8 order)
> >   {
> >       unsigned int i;
> >       int result =3D SCAN_SUCCEED;
> > @@ -797,7 +801,7 @@ static int __collapse_huge_page_copy(pte_t *pte, st=
ruct folio *folio,
> >       /*
> >        * Copying pages' contents is subject to memory poison at any ite=
ration.
> >        */
> > -     for (i =3D 0; i < HPAGE_PMD_NR; i++) {
> > +     for (i =3D 0; i < (1 << order); i++) {
> >               pte_t pteval =3D ptep_get(pte + i);
> >               struct page *page =3D folio_page(folio, i);
> >               unsigned long src_addr =3D address + i * PAGE_SIZE;
> > @@ -816,10 +820,10 @@ static int __collapse_huge_page_copy(pte_t *pte, =
struct folio *folio,
> >
> >       if (likely(result =3D=3D SCAN_SUCCEED))
> >               __collapse_huge_page_copy_succeeded(pte, vma, address, pt=
l,
> > -                                                 compound_pagelist);
> > +                                                 compound_pagelist, or=
der);
> >       else
> >               __collapse_huge_page_copy_failed(pte, pmd, orig_pmd, vma,
> > -                                              compound_pagelist);
> > +                                              compound_pagelist, order=
);
> >
> >       return result;
> >   }
> > @@ -994,11 +998,11 @@ static int check_pmd_still_valid(struct mm_struct=
 *mm,
> >   static int __collapse_huge_page_swapin(struct mm_struct *mm,
> >                                      struct vm_area_struct *vma,
> >                                      unsigned long haddr, pmd_t *pmd,
> > -                                    int referenced)
> > +                                    int referenced, u8 order)
> >   {
> >       int swapped_in =3D 0;
> >       vm_fault_t ret =3D 0;
> > -     unsigned long address, end =3D haddr + (HPAGE_PMD_NR * PAGE_SIZE)=
;
> > +     unsigned long address, end =3D haddr + (PAGE_SIZE << order);
> >       int result;
> >       pte_t *pte =3D NULL;
> >       spinlock_t *ptl;
> > @@ -1029,6 +1033,15 @@ static int __collapse_huge_page_swapin(struct mm=
_struct *mm,
> >               if (!is_swap_pte(vmf.orig_pte))
> >                       continue;
> >
> > +             /* Dont swapin for mTHP collapse */
> > +             if (order !=3D HPAGE_PMD_ORDER) {
> > +                     count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_=
SWAP);
>
> Doesn't compile. This is introduced way later in this series.
Whoops I stupidly applied this fixup to the wrong commit.
>
> Using something like
>
> git rebase -i mm/mm-unstable --exec "make -j16"
Ah I remember you showing me this in the past! Need to start using it
more-- Thank you.

>
> You can efficiently make sure that individual patches compile cleanly.
>
> --
> Cheers,
>
> David / dhildenb
>

