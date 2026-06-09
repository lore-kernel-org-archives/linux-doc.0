Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3466280A20
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995946; cv=pass; b=R1TdIiSYWPbbwETdnb+KyC/5T6db/dByLayvXqnVGxcqX1sP+E7MFSscCsrPvCIASSqbdo1pEy06KF6LGrz8KzFVRt1ATw+j438xzMAbxLegNi0ky3vnJzGeY3BJZArL58nZ+r47M9MPcOb606bTs8aj7HLRo6p6il9bcn7uhS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995946; c=relaxed/simple;
	bh=WYcC9vDs417GY/BpPGgXkSdMiE6T1BRyzU+3J0qq6Hg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uSE/WgVx8inhUOjNNmoajQmgjQLtzfC7BC58VHBdc5UyAA9sRRE+rrjoQDUW1sluGCHhdYOZ7U9xIp88Kt9nfQyKNcZLuafL0k4WQs1KTsuheMbg8dp+s+aj/LuLPL30osLk/V80gGVq3EKCJ0v0a4sytDM/FFWdmi1jYhXWLa0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4AMatA5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKQegZee; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4AMatA5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKQegZee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780995943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wxr1O8JNsfK2/FvtzBM7LZ4zEH7+MeXY2kg9gcsAEbU=;
	b=E4AMatA5H93x7Mc/TGR4PpLhZP+8Nh0WunhhaKpu6zohqSF6rweRfHdBVk+cnj/4fyoxLO
	vrm1iqjc6CFjVhGufA8io3KTt+0HX4pyUUnwgXwSqcbiVacoyVjwaPhwjgbLOm1w+iErqQ
	piSxGfe5hKYVOzz+zANvFhjSSoEpTBw=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-qQ_rfxE6O3OMpwpLcSiiZA-1; Tue, 09 Jun 2026 05:05:42 -0400
X-MC-Unique: qQ_rfxE6O3OMpwpLcSiiZA-1
X-Mimecast-MFC-AGG-ID: qQ_rfxE6O3OMpwpLcSiiZA_1780995942
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66043ac620fso3887867d50.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 02:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995942; cv=none;
        d=google.com; s=arc-20240605;
        b=Ne5g9mmQr8Dlz/vLs0lkoUW7SEndXA/+8m2MEP1IfxQJBwZxC7mHzn7smAtwmuyh7G
         mlXXGD1MQAVyMBFw0pjH3sNyA4uRlN3k0K8DogYvj3PbrPMbGHiQCO8UBXymlZ5H15kV
         E5nb5g10rvN89cbwaCb7UhWv9EZmeDbpj/t/Zwi0gh2zZu+3PrqagCZ5PxcJUVUHQmjY
         FwWij2gNipS5fxXskyMGQOI78PRcBHHBKimsuXNotTErhLFFC93vp4HfYH/wXm9n+yqe
         ykeygpBwpS8KRWuA6DM3qBM7SeTGt/y1TkYaIkEvqOphnU4TUZ40pRVZq+cwnySIIPJs
         GArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxr1O8JNsfK2/FvtzBM7LZ4zEH7+MeXY2kg9gcsAEbU=;
        fh=yOHdJdQKHfrC/QcgVP611Zd6nlW65dK5l7y/XTk5sUI=;
        b=dgORRdz+fJriAaQBF8ZyhieAqEd/7PyNmptFpCnYlmOcEgpSa8HEJAqZ75UdwGqlls
         6DVJRpR9n44Q9Cpzs27Zwxk29ycAjeZBEjvywrkzSk1J2T8wW+KDY5BrV/BI0D6Z0+OH
         ftVjkZM6lY2qxLcNv73/sWVgDSyNwbeUZll5wub6MFMCx65fPGzrlgVxtlDIvXkeJcQq
         gULpmEeW/BVFu0q1srv1LYLAl2VXyZJ0fmNrLG/Ov0XxU94FFrN0kQYr6wUcEqFlAvIq
         ZGWhcyUH7A15rC90YdtlUv/+sR2uk/2JN8dHDvHKwaKrYU4vBotuSUrqqPpUGYgPxPRR
         xHgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780995942; x=1781600742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wxr1O8JNsfK2/FvtzBM7LZ4zEH7+MeXY2kg9gcsAEbU=;
        b=VKQegZeedD+4ysiBSbKUzxjmpXP10sMWzz6xvvQ4U+ZYTY8EeHQDXyr30FftwJQEzF
         wf3pQJBHonahCp9O3W3IBE4YnzfcRSYKmuJB1LreRWcX3ArD7TF+fGTzNtW6uPf9XW3G
         RjxDLbmk8CKqO/BhRu2dQV0DTkWrTcCfi0sm2/oguZVK3cANwqurPhAJRsMeCZCRkVJB
         NIsio6srMYW0or6+AJYS+eU8h0tOPWuMN5yRNmHZyKBjJkR1Df3fwfS7wYo6vYhVEUT/
         Z4tCpk9EomJKEbeM3qExCkAKSWAEtLuabE7aDLVvqTktjEzBEbjeMF55F/rRhl6wZD4s
         QRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995942; x=1781600742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wxr1O8JNsfK2/FvtzBM7LZ4zEH7+MeXY2kg9gcsAEbU=;
        b=LvBugDsX1y7+NBhR6TCX0gOK3++xo9HR9nSJNG3FLBFZCM235XducDcUoMdP4Ilk8T
         XsKJb0epC3ShZjMytX5Fghl/bMAahsIWZqZYOVZz9thfktHXJxvU0LIZPsbnmDfQkDW6
         43aKYZrcxo0nYyFBpufDMxZ8XO7Ssx2EmnkIbNd1YXmP92A20OZ47cUF6TsaXvjm1nBX
         YEteuwOgFEuuL6ot7s7dwTparnbPxx40LzUCG4y8KnOiuZEiABSZRGzMTMERl0pZQLlC
         ItdexFipCe+69sauMGfb6A/1uP0z/Bmzrz0pk6pl8yMoZSodQGM4gjtGMYOqa/g2QfQQ
         Ck2w==
X-Gm-Message-State: AOJu0Yz4N6ux4NPEWpXpF8w73xaY7Pbqy0oBuzb5gxXCwVvf/mqR7Hs1
	zcqGzqh7fI7L35SomjRL/QfuAp8VuiPQ2R0uhMkdxP/MFQBhel9X3n+RAgJW29xIZPOC/H9bDTX
	IZLCXjaAUpyciJwThlvO+BOUacCb+B5ZoNwdt3SCR5aWJnfl5P70M0q06Dbaub+welxX2QfwfA3
	GPfFwDCot4IY34sFALYWubC5FwYfWJhmVFjFKM
X-Gm-Gg: Acq92OE9ovf8zx/yzTgjZXCtDaREBabnFiH+pb7gtqWrn0iIniPmi+e2ibvTMDHzhTD
	sfnb11Fky+dAh7yjVHS9+faE+1hSWZrdWbJwUZnknmP1QYaKxxBF1Kq0Ovz34m9TR0qtpyPlLYD
	e9OZoBURT0mO+lbPWDJ/3M48nkPsTFP6nUpn5lEXEgo5XAEi1xb6CAr3mnlfB3Ot8Mz0yFI91bb
	Yy7VF8vvb80jJMc
X-Received: by 2002:a05:690e:4190:b0:660:62e5:92c9 with SMTP id 956f58d0204a3-661070cd438mr15281234d50.63.1780995941959;
        Tue, 09 Jun 2026 02:05:41 -0700 (PDT)
X-Received: by 2002:a05:690e:4190:b0:660:62e5:92c9 with SMTP id
 956f58d0204a3-661070cd438mr15281195d50.63.1780995941422; Tue, 09 Jun 2026
 02:05:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605161422.213817-12-npache@redhat.com> <20260606102800.26940-1-lance.yang@linux.dev>
 <2553caae-9e0e-42a7-8b61-d1216f1e81fa@kernel.org>
In-Reply-To: <2553caae-9e0e-42a7-8b61-d1216f1e81fa@kernel.org>
From: Nico Pache <npache@redhat.com>
Date: Tue, 9 Jun 2026 03:06:27 -0600
X-Gm-Features: AVVi8CdL9z1ryjSRfDfxfMh1RqlVgMHDGw_iSqBSnBDCj2SVI6kmrVDBphqzbx8
Message-ID: <CAA1CXcBY_2372eJru8VoCq90rUMxn7w23hHou68MmXRv48NRXg@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v19 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: "David Hildenbrand (Arm)" <david@kernel.org>, Lance Yang <lance.yang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com, 
	matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com, 
	peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com, 
	rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com, 
	rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com, shivankg@amd.com, 
	sunnanyong@huawei.com, surenb@google.com, thomas.hellstrom@linux.intel.com, 
	tiwai@suse.de, usamaarif642@gmail.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, ying.huang@linux.alibaba.com, ziy@nvidia.com, 
	zokeefe@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 8:57=E2=80=AFAM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 6/6/26 12:28, Lance Yang wrote:
> >
> > On Fri, Jun 05, 2026 at 10:14:18AM -0600, Nico Pache wrote:
> >> Enable khugepaged to collapse to mTHP orders. This patch implements th=
e
> >> main scanning logic using a bitmap to track occupied pages and the
> >> algorithm to find optimal collapse sizes.
> >>
> >> Previous to this patch, PMD collapse had 3 main phases, a light weight
> >> scanning phase (mmap_read_lock) that determines a potential PMD
> >> collapse, an alloc phase (mmap unlocked), then finally heavier collaps=
e
> >> phase (mmap_write_lock).
> >>
> >> To enabled mTHP collapse we make the following changes:
> >>
> >> During PMD scan phase, track occupied pages in a bitmap. When mTHP
> >> orders are enabled, we remove the restriction of max_ptes_none during =
the
> >> scan phase to avoid missing potential mTHP collapse candidates. Once w=
e
> >> have scanned the full PMD range and updated the bitmap to track occupi=
ed
> >> pages, we use the bitmap to find the optimal mTHP size.
> >>
> >> Implement mthp_collapse() to walk forward through the bitmap and
> >> determine the best eligible order for each naturally-aligned region. T=
he
> >> algorithm starts at the beginning of the PMD range and, for each offse=
t,
> >> tries the highest order that fits the alignment. If the number of
> >> occupied PTEs in that region satisfies the max_ptes_none threshold for
> >> that order, a collapse is attempted. On failure, the order is
> >> decremented and the same offset is retried at the next smaller size. O=
nce
> >> the smallest enabled order is exhausted (or a collapse succeeds), the
> >> offset advances past the region just processed, and the next attempt
> >> starts at the highest order permitted by the new offset's natural
> >> alignment.
> >>
> >> The algorithm works as follows:
> >>    1) set offset=3D0 and order=3DHPAGE_PMD_ORDER
> >>    2) if the order is not enabled, go to step (5)
> >>    3) count occupied PTEs in the (offset, order) range using
> >>       bitmap_weight_from()
> >>    4) if the count satisfies the max_ptes_none threshold, attempt
> >>       collapse; on success, advance to step (6)
> >>    5) if a smaller enabled order exists, decrement order and retry
> >>       from step (2) at the same offset
> >>    6) advance offset past the current region and compute the next
> >>       order from the new offset's natural alignment via __ffs(offset),
> >>       capped at HPAGE_PMD_ORDER
> >>    7) repeat from step (2) until the full PMD range is covered
> >>
> >> mTHP collapses reject regions containing swapped out or shared pages.
> >> This is because adding new entries can lead to new none pages, and the=
se
> >> may lead to constant promotion into a higher order mTHP. A similar
> >> issue can occur with "max_ptes_none > HPAGE_PMD_NR/2" due to a collaps=
e
> >> introducing at least 2x the number of pages, and on a future scan will
> >> satisfy the promotion condition once again. This issue is prevented vi=
a
> >> the collapse_max_ptes_none() function which imposes the max_ptes_none
> >> restrictions above.
> >>
> >> We currently only support mTHP collapse for max_ptes_none values of 0
> >> and HPAGE_PMD_NR - 1. resulting in the following behavior:
> >>
> >>    - max_ptes_none=3D0: Never introduce new empty pages during collaps=
e
> >>    - max_ptes_none=3DHPAGE_PMD_NR-1: Always try collapse to the highes=
t
> >>      available mTHP order
> >>
> >> Any other max_ptes_none value will emit a warning and default mTHP
> >> collapse to max_ptes_none=3D0. There should be no behavior change for =
PMD
> >> collapse.
> >>
> >> Once we determine what mTHP sizes fits best in that PMD range a collap=
se
> >> is attempted. A minimum collapse order of 2 is used as this is the low=
est
> >> order supported by anon memory as defined by THP_ORDERS_ALL_ANON.
> >>
> >> Currently madv_collapse is not supported and will only attempt PMD
> >> collapse.
> >>
> >> We can also remove the check for is_khugepaged inside the PMD scan as
> >> the collapse_max_ptes_none() function handles this logic now.
> >>
> >> Signed-off-by: Nico Pache <npache@redhat.com>
> >> ---
> >> mm/khugepaged.c | 146 +++++++++++++++++++++++++++++++++++++++++++++---
> >> 1 file changed, 138 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> >> index ec886a031952..430047316f43 100644
> >> --- a/mm/khugepaged.c
> >> +++ b/mm/khugepaged.c
> >> @@ -99,6 +99,8 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, M=
M_SLOTS_HASH_BITS);
> >>
> >> static struct kmem_cache *mm_slot_cache __ro_after_init;
> >>
> >> +#define KHUGEPAGED_MIN_MTHP_ORDER   2
> >> +
> >> struct collapse_control {
> >>      bool is_khugepaged;
> >>
> >> @@ -110,6 +112,9 @@ struct collapse_control {
> >>
> >>      /* nodemask for allocation fallback */
> >>      nodemask_t alloc_nmask;
> >> +
> >> +    /* Each bit represents a single occupied (!none/zero) page. */
> >> +    DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
> >> };
> >>
> >> /**
> >> @@ -1440,20 +1445,130 @@ static enum scan_result collapse_huge_page(st=
ruct mm_struct *mm, unsigned long s
> >>      return result;
> >> }
> >>
> >> +/* Return the highest naturally aligned order that fits at @offset wi=
thin a PMD. */
> >> +static unsigned int max_order_from_offset(unsigned int offset)
> >> +{
> >> +    if (offset =3D=3D 0)
> >> +            return HPAGE_PMD_ORDER;
> >> +
> >> +    return min_t(unsigned int, __ffs(offset), HPAGE_PMD_ORDER);
> >> +}
> >> +
> >> +/*
> >> + * mthp_collapse() consumes the bitmap that is generated during
> >> + * collapse_scan_pmd() to determine what regions and mTHP orders fit =
best.
> >> + *
> >> + * Each bit in cc->mthp_present_ptes represents a single occupied (!n=
one/zero)
> >> + * page. We start at the PMD order and check if it is eligible for co=
llapse;
> >> + * if not, we check the left and right halves of the PTE page table w=
e are
> >> + * examining at a lower order.
> >> + *
> >> + * For each of these, we determine how many PTE entries are occupied =
in the
> >> + * range of PTE entries we propose to collapse, then we compare this =
to a
> >> + * threshold number of PTE entries which would need to be occupied fo=
r a
> >> + * collapse to be permitted at that order (accounting for max_ptes_no=
ne).
> >> + *
> >> + * If a collapse is permitted, we attempt to collapse the PTE range i=
nto a
> >> + * mTHP.
> >> + */
> >> +static enum scan_result mthp_collapse(struct mm_struct *mm,
> >> +            unsigned long address, int referenced, int unmapped,
> >> +            struct collapse_control *cc, unsigned long enabled_orders=
)
> >> +{
> >> +    unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
> >> +    enum scan_result last_result =3D SCAN_FAIL;
> >> +    int collapsed =3D 0;
> >> +    bool alloc_failed =3D false;
> >> +    unsigned long collapse_address;
> >> +    unsigned int offset =3D 0;
> >> +    unsigned int order =3D HPAGE_PMD_ORDER;
> >> +
> >> +    while (offset < HPAGE_PMD_NR) {
> >> +            nr_ptes =3D 1UL << order;
> >> +
> >> +            if (!test_bit(order, &enabled_orders))
> >> +                    goto next_order;
> >> +
> >> +            max_ptes_none =3D collapse_max_ptes_none(cc, NULL, order)=
;
> >> +            nr_occupied_ptes =3D bitmap_weight_from(cc->mthp_present_=
ptes, offset,
> >> +                                                  offset + nr_ptes);
> >> +
> >> +            if (nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> >
> > Looks broken for swap PTEs in PMD collapse ...
> >
> > collapse_scan_pmd() allows them up to max_ptes_swap and record them in
> > unmapped, but they don't get a bit in mthp_present_ptes. And then
> > mthp_collapse() does the check above:
>
> Right. I assumed this is implicitly handled by the optimization in collap=
se_scan_pmd:
>
>         if (enabled_orders !=3D BIT(HPAGE_PMD_ORDER))
>                 max_ptes_none =3D KHUGEPAGED_MAX_PTES_LIMIT;
>
> But we perform the check a second time.
>
> >
> > nr_occupied_ptes >=3D nr_ptes - max_ptes_none
> >
> > So max_ptes_none=3D0 + 511 present PTEs + one allowed swap PTE won't ev=
en
> > call collapse_huge_page() for PMD order.
> >
> > Shouldn't we account for them in the PMD-order check? Something like:
> >
> > if (is_pmd_order(order))
> >       nr_occupied_ptes +=3D unmapped;

This solution seems good for a temporary fixup. but longterm we may
want something else. I'm still not sure how we plan on supporting
swapin without causing creep. So I'd be ok with adding a fix for
legacy PMD behavior until we know how to handle mTHP creep correctly.

> As an alternative, we could either 1) skip the check there for
> pmd order (as the check was already done); or 2) introduce+maintain
> a bitmap that tracks non-present PTEs.
>
> @@ -1475,7 +1477,9 @@ static enum scan_result mthp_collapse(struct mm_str=
uct *mm,
>                 nr_occupied_ptes =3D bitmap_weight_from(cc->mthp_present_=
ptes, offset,
>                                                       offset + nr_ptes);
>
> -               if (nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
> +               /* Check was already done in the caller. */
> +               if (is_pmd_order(order) ||
> +                   nr_occupied_ptes >=3D nr_ptes - max_ptes_none) {
>                         enum scan_result ret;
>
>                         collapse_address =3D address + offset * PAGE_SIZE=
;
>
> 2) would probably be cleanest long-term.

That would be best for future swapin support in mTHP, but I still
don't think it solves the creep issue. Perhaps we could combine the
two bitmaps to determine if it would make the future collapse eligible
again? Not sure but ill start thinking about it.

Should I send a fixup for this using Lance's solution? Or does Lance
want to send a patch out with the fixes tag?

>
> --
> Cheers,
>
> David
>

