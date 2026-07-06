Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02314437843
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783362524; cv=pass; b=j5UuDz7hWKj7+HiN2T7FZSDAn1yAq2jQCcUjLdr330JIbUpF/XyoChtT6H855z1DJMBWWAdUvGLXaZsA6SW//P/yjNwa2c1uznXh2oPiU/2M5oM2x6TnP6/OPxfYA5evC4H8RxF1uqgRdacxm4GZ50TqAwOO7N89cghF92m+dag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783362524; c=relaxed/simple;
	bh=RBdlnSBIejcLU8HswqHcQrgwnN/+BqwYu/B8LTkb1Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fu7ZuG88hbofhQNyI8Dv7frJ65Ze6QVNf7kDeLnnyymGdbWVZix/NvDeYKkOeWiBmRs4hmqUxU7pv7AJwYk3T+5g5y5mIJPlQXBxzopfGIAo458dVNidW+X2RRkfgjvYxh6K27sDr5qoLCvVwJAzIROF0u2uXNfT05GV9Q7P8y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X840Moj7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LUGDbn/0; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X840Moj7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LUGDbn/0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783362521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=33zy+d4yennwdrD0MnMHA1IqKApRwE8j9BcF6Z0iXAU=;
	b=X840Moj7dVaBQJSXa+JZP2f5zRYjewZzgw6YzRHw+jVCHCxQyDPjnld3UqdWRFtBSWKnmj
	iiIPf/GSwdEYujhhOl584ThSPjPUJXYr4RBVd93sUnB+YIrsXgWDD+2pNNYOo7yUAZcVVT
	0fqa22TMTNgbt1CarLCqsObhVWK5nNc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-E20m273-Psu7PiLyzIPs9A-1; Mon, 06 Jul 2026 14:28:39 -0400
X-MC-Unique: E20m273-Psu7PiLyzIPs9A-1
X-Mimecast-MFC-AGG-ID: E20m273-Psu7PiLyzIPs9A_1783362518
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-39b1e6524e9so22638411fa.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 11:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783362518; cv=none;
        d=google.com; s=arc-20260327;
        b=F5TmGLFD1DgPyVAlyczi7yc2jZ5LyTjueGiEHElqiyL+oPE+DC1R35n0sNgDJOcaJ5
         d1S8WCfauWBCcVSa925sxjM+tpC7AcIHwgaTcIFhi3RoihLdZ391bSVF6FrGFDE3N9xA
         4JeBfrtVZrOxtFeNObnTXl8940ace1S0tbk8hQaPKOrquP8rA1A+026HvO+yqrXym5u4
         R+XdHZmaRhG4+rCEIBAgYk4GjMDgKL/YhAdMAakMe44B2+tkSyHsl9cLCICKyaCayWtI
         u56pmIB2JwmvC7h13h4R8gSz7GOc9hnaMojK4muCO0RtaX+jLtSxsjVTbYlpbZYnDpoT
         Hu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=33zy+d4yennwdrD0MnMHA1IqKApRwE8j9BcF6Z0iXAU=;
        fh=/sfdQ4tctgJI9ge/75sQ+t/oGeTjcxHtOQ5Z5MqsOqA=;
        b=B6BGspv54WIFguM5xVNEjoeLoDHihNQOdL3k9ioxZCvFChFCpzeRhoHG4GTMD7kqOD
         mGvRx80pt/Z8LM0E4zJ77AiVuTpR9SP+N/b57dB5iWsGAkve03iohc4qGoqq68xHK2ym
         C7q/0at1i42EZ9EFFKELZYEvNnJwuJomRuaWigmKZcL1X+OD2M0krc/zBAhub9VVz86b
         drLSzikmaK3aRNVi7sbByp43SxEdms79r+H9rZ7QRcNrV9WJjduNHyMoTtIOIATeoLBJ
         3yOIV2vo2s6brNV2Clbp1e2sEBhKQAYd3AcIBtEL4e1Ijtx/vh7lrDhgHfe69piJYhb2
         /mBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783362518; x=1783967318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33zy+d4yennwdrD0MnMHA1IqKApRwE8j9BcF6Z0iXAU=;
        b=LUGDbn/05HxQKRJ63WCm5E9qqv4nGmNxLUAZWGhmS7cuAw2oYQo0ENKgmYoCfTFyyr
         G/0Cud0SIPfn281XatKQJCMgdPQR2p9hCOp2LpBwU9Su9eyKcikDbO4kaEYrJ79sLc3Z
         M9nzbP94iIcaplNEwDOgmQr759YtQVJ9iha4c4WehSo0lHYSg/MU8PSv3ifLWpt1p7yt
         VW3741t7ViPu0tcxUmzryL+klimS5Ny6nUF8CjdX9UArc2zon1sA+nq1pemnGY80MNQW
         NS10JbPIJn8nBjzfikwanetArLAMTVIZTxtETL7NUL5Rx8fU2zsa2Rxji9TZe+lEO2Mv
         Zn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783362518; x=1783967318;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33zy+d4yennwdrD0MnMHA1IqKApRwE8j9BcF6Z0iXAU=;
        b=Kei2qt87nEmluXgRdrqBmMLF2DVxG3pEM+Q6a7YrzTtOp5q3HCcIDs4wqgE4kImWrz
         G5IYCQEOZpyvJNUv16vb9eZ6ud4yscDd6tFz3D3xbLBHjlVOa43PyLZmQ7oGc375/iu4
         JNHoiWZSg4/YVNTVkWdDpq+sp0wM+8YSsFYnljEOLymwzwtTB9mLbL420wItvH2YVCkx
         PCPlxDoBoErQGM9CcsVRvRS9oc3BxRbrjheQoCqs6EJQRGniQ/H8xyYUayBY7DG0aQSL
         4j+EnSUBdLNvBfiatli5Is2mMA76uEzjBLMcmVgCuFyZwwI3/8xBBm2zGBBF0IMdDo5y
         26VA==
X-Gm-Message-State: AOJu0YzreAZyuoT1nlyGJmq8M3UIB9Gaorwp+0rmgV5V0Gztz38wAK7n
	PdSUUMOagkeMAE8B6uaeR3EUlQ53IAgwMGq7yIeezKJhCBCqa3JtRzwCSy2fQTV76bJHaKROL+0
	78zd4g9LI37PkCcsel2pycDj22aNTKnB70gyZEbUAFau0hTcmAgrFsWLCcbsFNSYfsicUja2J2g
	7SHl6Fv6uo/u27lyQT41t7+Lnc16YtcMFT8mQe
X-Gm-Gg: AfdE7cmcZbAr0jyGYbSoCSUwksuyWSZrAlYhl/RX8kcgO9C3EyqVUUMbpDKhvJsEnf8
	C8EKaA9ujltHYEMZ9F/HBfzO/TaX6h+FYoTTZ9AdY93vAEBFwPFzht8DOuDYkkMiLcxVgCBZffC
	IhGPa4J21bwyDfijUK0349HCMwtPwXFzWr0oYXFsgpILX4x3fbRX2XK2hqwWGRu0zu
X-Received: by 2002:a2e:7a02:0:b0:396:7a05:6ed7 with SMTP id 38308e7fff4ca-39c5fd2fdb4mr3469751fa.2.1783362517813;
        Mon, 06 Jul 2026 11:28:37 -0700 (PDT)
X-Received: by 2002:a2e:7a02:0:b0:396:7a05:6ed7 with SMTP id
 38308e7fff4ca-39c5fd2fdb4mr3469661fa.2.1783362517222; Mon, 06 Jul 2026
 11:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706154500.39178-6-npache@redhat.com> <20260706174849.939490-1-usama.arif@linux.dev>
In-Reply-To: <20260706174849.939490-1-usama.arif@linux.dev>
From: Nico Pache <npache@redhat.com>
Date: Mon, 6 Jul 2026 12:29:47 -0600
X-Gm-Features: AVVi8CdVDHmZBsUQxsnlnAreAvd7DeSBfwwmvmZHKdLG52P9AfudUCCQoHtl6RI
Message-ID: <CAA1CXcBDQHtYqYMYMDm36hVCMPMGC9MMMDdeetpX89iFpfg6wQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] mm/khugepaged: Refactor the PTE state checks into a helper
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 11:49=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> On Mon,  6 Jul 2026 09:44:52 -0600 Nico Pache <npache@redhat.com> wrote:
>
> > For anonymous collapse, the collapse_scan_pmd() and
> > __collapse_huge_page_isolate() functions share a large portion of their
> > logic. These functions both check the state of the PTEs and verify the
> > following:
> >       - max_pte_* values are not exceeded
> >       - uffd is not active
> >       - lazyfree properties
> >       - non-anonymous
> >
> > Merge these checks into a helper collapse_check_pte() to reduce code
> > duplication. We also add a helper struct for this function called
> > pte_check_context which allows us to pass the required parameters in a
> > clean and elegant manner.
> >
> > A helper function is also introduced pte_check_fail() to provide a clea=
n
> > interface to set the pte_check_context failure results and return
> > PTE_CHECK_FAIL state. This helps reduce code duplications across the ne=
w
> > collapse_check_pte function.
> >
> > Two slight modifications are done to the original functionality. We now
> > warn (instead of crash) if the anon test fails, and we leverage the
> > vm_normal_folio function instead of page->folio, this should be
> > functionally equivalent.
> >
> > No other functional changes intended.
> >
> > This patch is heavily based off work done by Lance Yang, but modified t=
o
> > deal with conflicts and feedback received during the review cycle [1].
> >
> > [1] https://lore.kernel.org/all/20251008043748.45554-1-lance.yang@linux=
.dev/
> > Suggested-by: David Hildenbrand <david@kernel.org>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >  mm/khugepaged.c | 295 +++++++++++++++++++++++++-----------------------
> >  1 file changed, 155 insertions(+), 140 deletions(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 676f75773a6c..c4ea2dc1591b 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -63,6 +63,12 @@ enum scan_result {
> >       SCAN_PAGE_DIRTY_OR_WRITEBACK,
> >  };
> >
> > +enum pte_check_result {
> > +     PTE_CHECK_SUCCEED,
> > +     PTE_CHECK_FAIL,
> > +     PTE_CHECK_CONTINUE,
> > +};
> > +
> >  #define CREATE_TRACE_POINTS
> >  #include <trace/events/huge_memory.h>
> >
> > @@ -117,6 +123,20 @@ struct collapse_control {
> >       DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
> >  };
> >
> > +struct pte_check_context {
> > +     struct collapse_control *cc;
> > +     struct vm_area_struct *vma;
> > +     unsigned int order;
> > +     struct folio *folio;
> > +     int none_or_zero;
> > +     int shared;
> > +     int unmapped;
> > +     enum scan_result result;
> > +     unsigned int max_ptes_none;
> > +     unsigned int max_ptes_swap;
> > +     unsigned int max_ptes_shared;
> > +};
> > +
> >  /**
> >   * struct khugepaged_scan - cursor for scanning
> >   * @mm_head: the head of the mm list to scan
> > @@ -700,74 +720,130 @@ static void count_collapse_event(unsigned int or=
der, enum vm_event_item vm_event
> >       count_mthp_stat(order, mthp_event);
> >  }
> >
> > +/*
> > + * pte_check_fail() - A simple helper to set the pte_check_context res=
ult and
> > + * return PTE_CHECK_FAIL.
> > + */
> > +static enum pte_check_result pte_check_fail(struct pte_check_context *=
ctx,
> > +             enum scan_result result)
> > +{
> > +     ctx->result =3D result;
> > +     return PTE_CHECK_FAIL;
> > +}
> > +
> > +/*
> > + * collapse_check_pte() - Check if a PTE is suitable for collapse
> > + *
> > + * Check if a PTE is suitable for collapse based on the following crit=
eria:
> > + * - max_pte_* values are not exceeded
> > + * - uffd is not active
> > + * - lazyfree properties are not present
> > + * - only anonymous pages are present
> > + *
> > + * a helper struct pte_check_context is used to pass and store relevan=
t
> > + * information between the collapse_check_pte() function and the calle=
r.
> > + *
> > + * Return: PTE_CHECK_SUCCEED if the PTE is suitable for collapse,
> > + *         PTE_CHECK_FAIL if the PTE is not suitable for collapse,
> > + *         PTE_CHECK_CONTINUE if the scan should continue to check the=
 next PTE.
> > + */
> > +static enum pte_check_result collapse_check_pte(pte_t pteval,
> > +             unsigned long addr, struct pte_check_context *ctx)
> > +{
> > +     if (pte_none_or_zero(pteval)) {
> > +             if (++ctx->none_or_zero > ctx->max_ptes_none) {
> > +                     count_collapse_event(ctx->order, THP_SCAN_EXCEED_=
NONE_PTE,
> > +                                     MTHP_STAT_COLLAPSE_EXCEED_NONE);
> > +                     return pte_check_fail(ctx, SCAN_EXCEED_NONE_PTE);
> > +             }
> > +             return PTE_CHECK_CONTINUE;
> > +     }
> > +     if (!pte_present(pteval)) {
> > +             if (ctx->unmapped =3D=3D -1)
> > +                     return pte_check_fail(ctx, SCAN_PTE_NON_PRESENT);
> > +             if (++ctx->unmapped > ctx->max_ptes_swap) {
> > +                     count_collapse_event(ctx->order, THP_SCAN_EXCEED_=
SWAP_PTE,
> > +                                     MTHP_STAT_COLLAPSE_EXCEED_SWAP);
> > +                     return pte_check_fail(ctx, SCAN_EXCEED_SWAP_PTE);
> > +             }
> > +             if (pte_swp_uffd_wp_any(pteval))
> > +                     return pte_check_fail(ctx, SCAN_PTE_UFFD_WP);
> > +             return PTE_CHECK_CONTINUE;
> > +     }
> > +     /*
> > +      * Don't collapse if any of the small PTEs are armed with uffd
> > +      * write protection. Marking the new huge pmd as write protected
> > +      * could bring userfault messages that fall outside of the
> > +      * registered range.
> > +      */
> > +     if (pte_uffd_wp(pteval))
> > +             return pte_check_fail(ctx, SCAN_PTE_UFFD_WP);
> > +
> > +     ctx->folio =3D vm_normal_folio(ctx->vma, addr, pteval);
> > +     if (unlikely(!ctx->folio) || unlikely(folio_is_zone_device(ctx->f=
olio)))
> > +             return pte_check_fail(ctx, SCAN_PAGE_NULL);
> > +
> > +     /*
> > +      * If the vma has the VM_DROPPABLE flag, the collapse will
> > +      * preserve the lazyfree property without needing to skip.
> > +      */
> > +     if (ctx->cc->is_khugepaged && !(ctx->vma->vm_flags & VM_DROPPABLE=
) &&
> > +         folio_test_lazyfree(ctx->folio) && !pte_dirty(pteval))
> > +             return pte_check_fail(ctx, SCAN_PAGE_LAZYFREE);
> > +
> > +     if (folio_maybe_mapped_shared(ctx->folio)) {
> > +             /*
> > +              * TODO: Support shared pages without leading to further
> > +              * mTHP collapses. Currently bringing in new pages via
> > +              * shared may cause a future higher order collapse on a
> > +              * rescan of the same range.
> > +              */
> > +             if (++ctx->shared > ctx->max_ptes_shared) {
> > +                     count_collapse_event(ctx->order, THP_SCAN_EXCEED_=
SHARED_PTE,
> > +                                     MTHP_STAT_COLLAPSE_EXCEED_SHARED)=
;
> > +                     return pte_check_fail(ctx, SCAN_EXCEED_SHARED_PTE=
);
> > +             }
> > +     }
> > +
> > +     if (!folio_test_anon(ctx->folio)) {
> > +             VM_WARN_ON_FOLIO(!folio_test_anon(ctx->folio), ctx->folio=
);
> > +             return pte_check_fail(ctx, SCAN_PAGE_ANON);
> > +     }
>
> The order folio_maybe_mapped_shared() and !folio_test_anon() check is fli=
pped
> from what it was. Can we keep original ordering? The commit message says
> no other functional change inteded, but this could result in different co=
llapse
> even counters getting incremented.

Good catch, I didn't realize i reordered it.

It might make even more sense to move it to right after we get the
folio. All other checks are pointless are we somehow landed on a
!(anon) page.

Does that sound better?

>
>
> > +     return PTE_CHECK_SUCCEED;
> > +}
> > +
> >  static enum scan_result __collapse_huge_page_isolate(struct vm_area_st=
ruct *vma,
> >               unsigned long start_addr, pte_t *pte, struct collapse_con=
trol *cc,
> >               unsigned int order, struct list_head *compound_pagelist)
> >  {
> > -     const unsigned int max_ptes_none =3D collapse_max_ptes_none(cc, v=
ma, order);
> > -     const unsigned int max_ptes_shared =3D collapse_max_ptes_shared(c=
c, order);
> >       const unsigned long nr_pages =3D 1UL << order;
> > -     struct page *page =3D NULL;
> >       struct folio *folio =3D NULL;
> >       unsigned long addr =3D start_addr;
> > -     pte_t *_pte;
> > -     int none_or_zero =3D 0, shared =3D 0, referenced =3D 0;
> > +     pte_t *_pte, pteval;
> > +     int referenced =3D 0;
> >       enum scan_result result =3D SCAN_FAIL;
> > +     enum pte_check_result pte_check;
> > +     struct pte_check_context ctx =3D {
> > +             .cc =3D cc,
> > +             .vma =3D vma,
> > +             .order =3D order,
> > +             .unmapped =3D -1, /* don't check swap PTEs */
> > +             .max_ptes_none =3D collapse_max_ptes_none(cc, vma, order)=
,
> > +             .max_ptes_shared =3D collapse_max_ptes_shared(cc, order),
> > +     };
> >
> >       for (_pte =3D pte; _pte < pte + nr_pages;
> >            _pte++, addr +=3D PAGE_SIZE) {
> > -             pte_t pteval =3D ptep_get(_pte);
> > -             if (pte_none_or_zero(pteval)) {
> > -                     if (++none_or_zero > max_ptes_none) {
> > -                             result =3D SCAN_EXCEED_NONE_PTE;
> > -                             count_collapse_event(order, THP_SCAN_EXCE=
ED_NONE_PTE,
> > -                                             MTHP_STAT_COLLAPSE_EXCEED=
_NONE);
> > -                             goto out;
> > -                     }
> > -                     continue;
> > -             }
> > -             if (!pte_present(pteval)) {
> > -                     result =3D SCAN_PTE_NON_PRESENT;
> > -                     goto out;
> > -             }
> > -             if (pte_uffd_wp(pteval)) {
> > -                     result =3D SCAN_PTE_UFFD_WP;
> > -                     goto out;
> > -             }
> > -             page =3D vm_normal_page(vma, addr, pteval);
> > -             if (unlikely(!page) || unlikely(is_zone_device_page(page)=
)) {
> > -                     result =3D SCAN_PAGE_NULL;
> > -                     goto out;
> > -             }
> > -
> > -             folio =3D page_folio(page);
> > -             VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
> > -
> > -             /*
> > -              * If the vma has the VM_DROPPABLE flag, the collapse wil=
l
> > -              * preserve the lazyfree property without needing to skip=
.
> > -              */
> > -             if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) =
&&
> > -                 folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
> > -                     result =3D SCAN_PAGE_LAZYFREE;
> > +             pteval =3D ptep_get(_pte);
> > +             pte_check =3D collapse_check_pte(pteval, addr, &ctx);
> > +             if (pte_check =3D=3D PTE_CHECK_FAIL) {
> > +                     result =3D ctx.result;
> >                       goto out;
> >               }
> > +             if (pte_check =3D=3D PTE_CHECK_CONTINUE)
> > +                     continue;
> > +             folio =3D ctx.folio;
> >
> > -             /* See collapse_scan_pmd(). */
> > -             if (folio_maybe_mapped_shared(folio)) {
> > -                     /*
> > -                      * TODO: Support shared pages without leading to =
further
> > -                      * mTHP collapses. Currently bringing in new page=
s via
> > -                      * shared may cause a future higher order collaps=
e on a
> > -                      * rescan of the same range.
> > -                      */
> > -                     if (++shared > max_ptes_shared) {
> > -                             result =3D SCAN_EXCEED_SHARED_PTE;
> > -                             count_collapse_event(order, THP_SCAN_EXCE=
ED_SHARED_PTE,
> > -                                             MTHP_STAT_COLLAPSE_EXCEED=
_SHARED);
> > -                             goto out;
> > -                     }
> > -             }
> >               /*
> >                * TODO: In some cases of partially-mapped folios, we'd a=
ctually
> >                * want to collapse.
> > @@ -844,13 +920,13 @@ static enum scan_result __collapse_huge_page_isol=
ate(struct vm_area_struct *vma,
> >               result =3D SCAN_LACK_REFERENCED_PAGE;
> >       } else {
> >               result =3D SCAN_SUCCEED;
> > -             trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
> > +             trace_mm_collapse_huge_page_isolate(folio, ctx.none_or_ze=
ro,
> >                                                   referenced, result, o=
rder);
> >               return result;
> >       }
> >  out:
> >       release_pte_pages(pte, _pte, compound_pagelist);
> > -     trace_mm_collapse_huge_page_isolate(folio, none_or_zero,
> > +     trace_mm_collapse_huge_page_isolate(folio, ctx.none_or_zero,
> >                                           referenced, result, order);
> >       return result;
> >  }
> > @@ -1616,24 +1692,30 @@ static enum scan_result collapse_scan_pmd(struc=
t mm_struct *mm,
> >               struct vm_area_struct *vma, unsigned long start_addr,
> >               bool *lock_dropped, struct collapse_control *cc)
> >  {
> > -     const unsigned int max_ptes_shared =3D collapse_max_ptes_shared(c=
c, HPAGE_PMD_ORDER);
> > -     const unsigned int max_ptes_swap =3D collapse_max_ptes_swap(cc, H=
PAGE_PMD_ORDER);
> > -     unsigned int max_ptes_none =3D collapse_max_ptes_none(cc, vma, HP=
AGE_PMD_ORDER);
> >       enum tva_type tva_flags =3D cc->is_khugepaged ? TVA_KHUGEPAGED : =
TVA_FORCED_COLLAPSE;
> >       pmd_t *pmd;
> >       pte_t *pte, *_pte, pteval;
> >       int i;
> > -     int none_or_zero =3D 0, shared =3D 0, referenced =3D 0;
> > -     enum scan_result result =3D SCAN_FAIL;
> > -     struct page *page =3D NULL;
> >       struct folio *folio =3D NULL;
> > +     int referenced =3D 0;
> > +     enum scan_result result =3D SCAN_FAIL;
> >       unsigned long addr;
> >       unsigned long enabled_orders;
> >       spinlock_t *ptl;
> > -     int node =3D NUMA_NO_NODE, unmapped =3D 0;
> > +     int node =3D NUMA_NO_NODE;
> > +     enum pte_check_result pte_check;
> >
> >       VM_BUG_ON(start_addr & ~HPAGE_PMD_MASK);
> >
> > +     struct pte_check_context ctx =3D {
> > +             .cc =3D cc,
> > +             .vma =3D vma,
> > +             .order =3D HPAGE_PMD_ORDER,
> > +             .max_ptes_none =3D collapse_max_ptes_none(cc, vma, HPAGE_=
PMD_ORDER),
> > +             .max_ptes_swap =3D collapse_max_ptes_swap(cc, HPAGE_PMD_O=
RDER),
> > +             .max_ptes_shared =3D collapse_max_ptes_shared(cc, HPAGE_P=
MD_ORDER),
> > +     };
> > +
> >       result =3D find_pmd_or_thp_or_none(mm, start_addr, &pmd);
> >       if (result !=3D SCAN_SUCCEED) {
> >               cc->progress++;
> > @@ -1649,7 +1731,7 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
> >        * scan all pages to populate the bitmap for mTHP collapse.
> >        */
> >       if (enabled_orders !=3D BIT(HPAGE_PMD_ORDER))
> > -             max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
> > +             ctx.max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
> >
> >       pte =3D pte_offset_map_lock(mm, pmd, start_addr, &ptl);
> >       if (!pte) {
> > @@ -1665,81 +1747,14 @@ static enum scan_result collapse_scan_pmd(struc=
t mm_struct *mm,
> >
> >               cc->progress++;
> >
> > -             if (pte_none_or_zero(pteval)) {
> > -                     if (++none_or_zero > max_ptes_none) {
> > -                             result =3D SCAN_EXCEED_NONE_PTE;
> > -                             count_collapse_event(HPAGE_PMD_ORDER, THP=
_SCAN_EXCEED_NONE_PTE,
> > -                                             MTHP_STAT_COLLAPSE_EXCEED=
_NONE);
> > -                             goto out_unmap;
> > -                     }
> > -                     continue;
> > -             }
> > -             if (!pte_present(pteval)) {
> > -                     if (++unmapped > max_ptes_swap) {
> > -                             result =3D SCAN_EXCEED_SWAP_PTE;
> > -                             count_collapse_event(HPAGE_PMD_ORDER, THP=
_SCAN_EXCEED_SWAP_PTE,
> > -                                             MTHP_STAT_COLLAPSE_EXCEED=
_SWAP);
> > -                             goto out_unmap;
> > -                     }
> > -                     /*
> > -                      * Always be strict with uffd-wp
> > -                      * enabled swap entries.  Please see
> > -                      * comment below for pte_uffd_wp().
> > -                      */
> > -                     if (pte_swp_uffd_wp_any(pteval)) {
> > -                             result =3D SCAN_PTE_UFFD_WP;
> > -                             goto out_unmap;
> > -                     }
> > -                     continue;
> > -             }
> > -             if (pte_uffd_wp(pteval)) {
> > -                     /*
> > -                      * Don't collapse the page if any of the small
> > -                      * PTEs are armed with uffd write protection.
> > -                      * Here we can also mark the new huge pmd as
> > -                      * write protected if any of the small ones is
> > -                      * marked but that could bring unknown
> > -                      * userfault messages that falls outside of
> > -                      * the registered range.  So, just be simple.
> > -                      */
> > -                     result =3D SCAN_PTE_UFFD_WP;
> > -                     goto out_unmap;
> > -             }
> > -
> > -             page =3D vm_normal_page(vma, addr, pteval);
> > -             if (unlikely(!page) || unlikely(is_zone_device_page(page)=
)) {
> > -                     result =3D SCAN_PAGE_NULL;
> > -                     goto out_unmap;
> > -             }
> > -             folio =3D page_folio(page);
> > -
> > -             /*
> > -              * If the vma has the VM_DROPPABLE flag, the collapse wil=
l
> > -              * preserve the lazyfree property without needing to skip=
.
> > -              */
> > -             if (cc->is_khugepaged && !(vma->vm_flags & VM_DROPPABLE) =
&&
> > -                 folio_test_lazyfree(folio) && !pte_dirty(pteval)) {
> > -                     result =3D SCAN_PAGE_LAZYFREE;
> > -                     goto out_unmap;
> > -             }
> > -
> > -             if (!folio_test_anon(folio)) {
> > -                     result =3D SCAN_PAGE_ANON;
> > +             pte_check =3D collapse_check_pte(pteval, addr, &ctx);
> > +             if (pte_check =3D=3D PTE_CHECK_FAIL) {
> > +                     result =3D ctx.result;
> >                       goto out_unmap;
> >               }
> > -
> > -             /*
> > -              * We treat a single page as shared if any part of the TH=
P
> > -              * is shared.
> > -              */
> > -             if (folio_maybe_mapped_shared(folio)) {
> > -                     if (++shared > max_ptes_shared) {
> > -                             result =3D SCAN_EXCEED_SHARED_PTE;
> > -                             count_collapse_event(HPAGE_PMD_ORDER, THP=
_SCAN_EXCEED_SHARED_PTE,
> > -                                             MTHP_STAT_COLLAPSE_EXCEED=
_SHARED);
> > -                             goto out_unmap;
> > -                     }
> > -             }
> > +             if (pte_check =3D=3D PTE_CHECK_CONTINUE)
> > +                     continue;
> > +             folio =3D ctx.folio;
> >
> >               /* Set bit for occupied pages */
> >               __set_bit(i, cc->mthp_present_ptes);
> > @@ -1781,7 +1796,7 @@ static enum scan_result collapse_scan_pmd(struct =
mm_struct *mm,
> >       }
> >       if (cc->is_khugepaged &&
> >                  (!referenced ||
> > -                 (unmapped && referenced < HPAGE_PMD_NR / 2))) {
> > +                 (ctx.unmapped && referenced < HPAGE_PMD_NR / 2))) {
> >               result =3D SCAN_LACK_REFERENCED_PAGE;
> >       } else {
> >               result =3D SCAN_SUCCEED;
> > @@ -1792,13 +1807,13 @@ static enum scan_result collapse_scan_pmd(struc=
t mm_struct *mm,
> >               /* collapse_huge_page expects the lock to be dropped befo=
re calling */
> >               mmap_read_unlock(mm);
> >               result =3D mthp_collapse(mm, start_addr, referenced,
> > -                                    unmapped, cc, enabled_orders);
> > +                                    ctx.unmapped, cc, enabled_orders);
> >               /* mmap_lock was released above, set lock_dropped */
> >               *lock_dropped =3D true;
> >       }
> >  out:
> >       trace_mm_khugepaged_scan_pmd(mm, folio, referenced,
> > -                                  none_or_zero, result, unmapped);
> > +                                  ctx.none_or_zero, result, ctx.unmapp=
ed);
> >       return result;
> >  }
> >
> > --
> > 2.54.0
> >
> >
>

