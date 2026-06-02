Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF6F383986
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421186; cv=pass; b=O8Vd6M0Fn05rI0OFYXNRk7YD/W7W6/ScnSmh8DUgvH74NIlKnAJpXloDqaHAKFhe6h6CbPRsBE7uwixAgjpHt/r7Bz/cst8J9Nwy29/hOfg6LhWlCK8cwVlxLi875mhoqynXtYIyXFyMjIMCc6+vREo9ww2xoTM+96NieRgz5ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421186; c=relaxed/simple;
	bh=42ogQ76ZmF9Uy7oYf1liIcr8XGIBcXfEyRpt1sQJYOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nd9bNAQFtUE0X0fgkC2imfcq9UqPD/koYUp3EqDcmYjItRFjHL+MRJt18X+y3vuiTn9nfYa6glQQEVeRktXaw+4Y6/6Szvvn9kwovc2SgybjASWPmrrOPI0yQXJE4aNRotKiQdhgYD1k3elP5lrZPh4HbjeSh0ozBp1J6i4gPf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y1rIO3/N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i3mItac+; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y1rIO3/N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i3mItac+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780421183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qijIJg1t/KsGTxOaIBw1J3YsN2KtDunWsuCz1Lo+IM=;
	b=Y1rIO3/NmBW6X/GFhXW1aiwJosoyHgwLWGJ/XMMAKcbkvRUT1LzyC+dkmVGKoHuNRDkda0
	BKGrqEBkVL4N2vT/sqrXucJqt8GbvC0ngG0K0oNM/ePi23e6980t4tR8JmZSfxeIvU0tgd
	bIyL17ng0gUDGwR3SXYZ9It71zDpUNA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-6TqvWM-7MeG-jDeuMyFdPw-1; Tue, 02 Jun 2026 13:26:21 -0400
X-MC-Unique: 6TqvWM-7MeG-jDeuMyFdPw-1
X-Mimecast-MFC-AGG-ID: 6TqvWM-7MeG-jDeuMyFdPw_1780421181
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7cff695e4a3so252566447b3.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 10:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780421180; cv=none;
        d=google.com; s=arc-20240605;
        b=POmFZn53f/ECrUY17snrzjfjbhPXRgju7G3vmuCPDLGf8PObsTOL/Pgc6+9LFm/xLa
         kV4izjP7/iXlxIAmk5hJIZYXSFXwwGmuMKUQY5lolrFGkEsf9pJKaAxlFLyT2vNvBjFM
         RDam+wxn4gSxFgwYZheBKocmgiVCMHcSIkZ31F6ciP9UyuczaWzy7t5zPQ89plTquDiq
         pBSM+fv1+G+YHcvgz++PYQpN4cJcbavggSEIyaDVF63OpQaVFXhQjyXYU480GQDnBhKe
         J2P2ZIKk3KGB88Gq2W0ZHPoHoVKCeZnrYcOgN+HOiAUsB0qzYAMuN2XHgvB2bIDPbgIF
         vmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7qijIJg1t/KsGTxOaIBw1J3YsN2KtDunWsuCz1Lo+IM=;
        fh=xq2M47Ct122L7EC3TXJqZYVPA+hqOpxm384DdLa7uIQ=;
        b=hOIxFkcPqEuotrG1ElKeqE+1wDcLoUQ5BZ6GxxVSDc9L0zFiTRTKJszQBzGdS2NwCB
         fDj3zep+0HXUNBXCkSqjiKBN2mici84qsj2WOmSx11uqs+Ln2p6hOsqDJ4qXxOVddK9y
         Gq/0W2Y5/qC1jY4SEWi9zvOAwxv6KxwUQ56wiuppoCm/OWE8VHn3t970KS/KOUL0qEDP
         9mYGykM+XqxMMbbgttg6HQ37+WLjdq4DW/WNDd/b28lPFeoM9HILvDAOd4R0UERvJyPj
         qQd/eQLmk56iwkUa0HXa9bHSn+ccwatulgUK8nzta0HkIW2Q86d6TuyR9+dcmpWXzF2g
         iOQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780421180; x=1781025980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qijIJg1t/KsGTxOaIBw1J3YsN2KtDunWsuCz1Lo+IM=;
        b=i3mItac+7rAYxQ6aIkrJTz6slaUUJqVi3RMrO5OLHpsURy189rnx/5y9FFdOZLeiEy
         OY7qMltw1ReI5RKTglGJA67HzCYIKf5f20ChmenMl3VHrPeWo7I72uE5bLtbajmR5FyC
         ZLP5CQeX4MOB4QWmeHVbbWycRhfbQbdoqA2ewIjFLvFeajzk4ISajOl/Sqt5rjqdQCJA
         PvU8SRUCxkCKUhNynkHU3nUAbwJ/C8xdjcR0eZ/GVeKosMr4hkokZOs0VZUR4uyIaFTB
         3lZ8CR+5ezqFlGulxHd8lU5oE0H+RA+TiTHYHuaoJvYsbt/wSdKo4MJwDfDgUIzUhEoe
         sNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421180; x=1781025980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qijIJg1t/KsGTxOaIBw1J3YsN2KtDunWsuCz1Lo+IM=;
        b=gzZRXwCryEXUOJmQJStKm5fHg0NaMUDS1LgpsuoXyQEV5tCSpw4MeAo5v1IkN6Ix4z
         9x+oP/9Vlx3sOp880tUziYm3PTHCS5B6V/AmdAyEMZP2/Em53FVp1/ESNtg7685UVMfN
         1zkvrWKv3clidbkU6UZjbVaTaV6RP7XIZgv8YGwMYjalD631EZd80gfirlTYadGDL7UO
         KJgXMHy4oLPkJFagXrDbnWM2oG8SWMzcFYTuMlgEpOkDqn2iT+NA1jMMRjR4Fl1qcVb+
         qbaq3PVqAqB9wpEFvKIwLzlaYa0l/lTjUWh7Ucwp64zM2DYs7TpZbRLPiHT1SG1f2dTh
         9w4Q==
X-Gm-Message-State: AOJu0Yw4LaIMf+D6SI+gEf/XJz24PbGPMhRCTNfVmvMI/r4zPvKYptmw
	ScaVAiA+qetW3QZEOrKemFn6XYcItl8mFIeeQQlRyqOBiLTYq25K3c4fPy9g6EedrWkJ0lluhAK
	InuKK2366yfgToib337O3Tbk2QdvZaS3u53hrlJK95csvW+tP1Uq4QDJty29ViCR20ktMMi8bDk
	hoR+8hLn2tUYMt+Wxi68jHX8YuO5xtNmfG+hVi
X-Gm-Gg: Acq92OGRJzWzDhTdoJRMxQjosu+zdhU0lV+PuVQm3+am9ImzGdrbaXB71woY2Iq5f/t
	2D8ngLwT+u8mwbE1Epa3mM+EmSxJ+RKP++z/D5UujOSm9iFNgpn5B+afKsodSE6+N+EmxKundLW
	RV6D6IEerWmCDyE7U+7XnInE/NYhODEBLZ3vqfgOcQZ25mQcd4VkuJl9lRqh9HmnHImVc85c7d8
	+TJfD6A9ORyO9QgYA==
X-Received: by 2002:a05:690c:c8e:b0:7af:6904:3f3f with SMTP id 00721157ae682-7ea32936c35mr3016827b3.45.1780421180553;
        Tue, 02 Jun 2026 10:26:20 -0700 (PDT)
X-Received: by 2002:a05:690c:c8e:b0:7af:6904:3f3f with SMTP id
 00721157ae682-7ea32936c35mr3016067b3.45.1780421180098; Tue, 02 Jun 2026
 10:26:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522150009.121603-1-npache@redhat.com> <20260522150009.121603-12-npache@redhat.com>
 <b8380eb3-096a-49f1-9ace-99c1e75888b4@kernel.org> <CAA1CXcBg1su-bk3i_H+TW4-nTgvGSGqRNeC9MpQo7sGeH8ejnA@mail.gmail.com>
 <d3c2b00c-6810-434a-b837-0707b0a11611@kernel.org> <19639b08-5bf1-4974-9635-c458d512fa38@redhat.com>
In-Reply-To: <19639b08-5bf1-4974-9635-c458d512fa38@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Tue, 2 Jun 2026 11:26:59 -0600
X-Gm-Features: AVHnY4I9v48A3rgiDLuUyB14mnYzMhbTSrwcxXwVg3dPVkqq7ukkIA4tijn81Ag
Message-ID: <CAA1CXcB5fZ2dJPjLvonbyT+1XGKZh4r76SpDNVkdn3r--uv-ZA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v18 11/14] mm/khugepaged: Introduce mTHP
 collapse support
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, aarcange@redhat.com, 
	akpm@linux-foundation.org, anshuman.khandual@arm.com, apopple@nvidia.com, 
	baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com, 
	catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, dev.jain@arm.com, gourry@gourry.net, 
	hannes@cmpxchg.org, hughd@google.com, jack@suse.cz, jackmanb@google.com, 
	jannh@google.com, jglisse@google.com, joshua.hahnjy@gmail.com, kas@kernel.org, 
	lance.yang@linux.dev, liam@infradead.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, 
	raquini@redhat.com, rdunlap@infradead.org, richard.weiyang@gmail.com, 
	rientjes@google.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sunnanyong@huawei.com, 
	surenb@google.com, thomas.hellstrom@linux.intel.com, tiwai@suse.de, 
	vbabka@suse.cz, vishal.moola@gmail.com, wangkefeng.wang@huawei.com, 
	will@kernel.org, willy@infradead.org, yang@os.amperecomputing.com, 
	ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com, 
	Usama Arif <usama.arif@linux.dev>, usamaarif642@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 11:22=E2=80=AFAM Nico Pache <npache@redhat.com> wrot=
e:
>
>
>
> On 6/1/26 7:15 AM, David Hildenbrand (Arm) wrote:
> >>>
> >>> Reading this, it is unclear why exactly do we need the stack.
> >>
> >> So I looked into your items below. It seems logical, and I think it
> >> works the same way; however, your method seems slightly harder to
> >> understand due to all the edge cases and more error-prone to future
> >> changes (the stack holds implicit knowledge of the offset/order that
> >> must now be tracked in the edge cases).
> >>
> >> Given the stack is 24 bytes, I'm not sure if the extra complexity is
> >> worth saving that small amount of memory. Although we would also be
> >> getting rid of (3?) functions, so both approaches have pros and cons.
> >
> > I consider a simple forward loop over the offset ... less complexity co=
mpared to
> > a stack structure :)
> >
> >>
> >> I will implement a patch comparing your solution against mine and send
> >> it here, then we can decide which approach is better.
> >
> > Right, throw it over the fence and I'll see how to improve it further.
>
> Ok heres what the diff looks like on top of my V19.
>
> you can access the tree here https://gitlab.com/npache/linux/-/commits/mt=
hp-v19?ref_type=3Dheads for easier review.
>
> So far I have no problem with this approach it appeared cleaner than i th=
ought. Did some light testing. Gonna throw it more through the ringer tomor=
row.

not sure why this didnt send with the proper encoding I guess my email
is still a little screwed up

>
>
> From 9496c5d17eba7f6d04820d78c7c6f1592a58888a Mon Sep 17 00:00:00 2001
> From: Nico Pache <npache@redhat.com>
> Date: Tue, 2 Jun 2026 10:26:18 -0600
> Subject: [PATCH] convert from stack to forward loop
>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 96 ++++++++-----------------------------------------
>  1 file changed, 15 insertions(+), 81 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 498eba009751..6de935e76ceb 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -100,28 +100,6 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, M=
M_SLOTS_HASH_BITS);
>  static struct kmem_cache *mm_slot_cache __ro_after_init;
>
>  #define KHUGEPAGED_MIN_MTHP_ORDER      2
> -/*
> - * mthp_collapse() does an iterative DFS over a binary tree, from
> - * HPAGE_PMD_ORDER down to KHUGEPAGED_MIN_MTHP_ORDER. The max stack
> - * size needed for a DFS on a binary tree is height + 1, where
> - * height =3D HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP_ORDER.
> - *
> - * ilog2 is used in place of HPAGE_PMD_ORDER because some architectures
> - * (e.g. ppc64le) do not define HPAGE_PMD_ORDER until after build time.
> - */
> -#define MTHP_STACK_SIZE        (ilog2(MAX_PTRS_PER_PTE) - KHUGEPAGED_MIN=
_MTHP_ORDER + 1)
> -
> -/*
> - * Defines a range of PTE entries in a PTE page table which are being
> - * considered for mTHP collapse.
> - *
> - * @offset: the offset of the first PTE entry in a PMD range.
> - * @order: the order of the PTE entries being considered for collapse.
> - */
> -struct mthp_range {
> -       u16 offset;
> -       u8 order;
> -};
>
>  struct collapse_control {
>         bool is_khugepaged;
> @@ -137,7 +115,6 @@ struct collapse_control {
>
>         /* Each bit represents a single occupied (!none/zero) page. */
>         DECLARE_BITMAP(mthp_present_ptes, MAX_PTRS_PER_PTE);
> -       struct mthp_range mthp_bitmap_stack[MTHP_STACK_SIZE];
>  };
>
>  /**
> @@ -1458,50 +1435,14 @@ static enum scan_result collapse_huge_page(struct=
 mm_struct *mm, unsigned long s
>         return result;
>  }
>
> -static void collapse_mthp_stack_push(struct collapse_control *cc, int *s=
tack_size,
> -                                    u16 offset, u8 order)
> -{
> -       const int size =3D *stack_size;
> -       struct mthp_range *stack =3D &cc->mthp_bitmap_stack[size];
> -
> -       VM_WARN_ON_ONCE(size >=3D MTHP_STACK_SIZE);
> -       stack->order =3D order;
> -       stack->offset =3D offset;
> -       (*stack_size)++;
> -}
> -
> -static struct mthp_range collapse_mthp_stack_pop(struct collapse_control=
 *cc,
> -                                                int *stack_size)
> -{
> -       const int size =3D *stack_size;
> -
> -       VM_WARN_ON_ONCE(size <=3D 0);
> -       (*stack_size)--;
> -       return cc->mthp_bitmap_stack[size - 1];
> -}
> -
>  /*
>   * mthp_collapse() consumes the bitmap that is generated during
>   * collapse_scan_pmd() to determine what regions and mTHP orders fit bes=
t.
>   *
>   * Each bit in cc->mthp_present_ptes represents a single occupied (!none=
/zero)
> - * page. A stack structure cc->mthp_bitmap_stack is used to check differ=
ent
> - * regions of the bitmap for collapse eligibility. The stack maintains a=
 pair
> - * of variables (offset, order), indicating the number of PTEs from the =
start
> - * of the PMD, and the order of the potential collapse candidate respect=
ively.
> - * We start at the PMD order and check if it is eligible for collapse; i=
f not,
> - * we add two entries to the stack at a lower order to represent the lef=
t and
> - * right halves of the PTE page table we are examining.
> - *
> - *                         offset       mid_offset
> - *                         |         |
> - *                         |         |
> - *                         v         v
> - *      --------------------------------------
> - *      |       cc->mthp_present_ptes         |
> - *      --------------------------------------
> - *                         <-------><------->
> - *                          order-1  order-1
> + * page. We start at the PMD order and check if it is eligible for colla=
pse;
> + * if not, we check the left and right halves of the PTE page table we a=
re
> + * examining at a lower order.
>   *
>   * For each of these, we determine how many PTE entries are occupied in =
the
>   * range of PTE entries we propose to collapse, then we compare this to =
a
> @@ -1517,26 +1458,20 @@ static enum scan_result mthp_collapse(struct mm_s=
truct *mm,
>  {
>         unsigned int nr_occupied_ptes, nr_ptes, max_ptes_none;
>         enum scan_result last_result =3D SCAN_FAIL;
> -       int collapsed =3D 0, stack_size =3D 0;
> +       int collapsed =3D 0;
>         bool alloc_failed =3D false;
>         unsigned long collapse_address;
> -       struct mthp_range range;
> -       u16 offset;
> -       u8 order;
> +       unsigned int offset =3D 0;
> +       unsigned int order =3D HPAGE_PMD_ORDER;
>
> -       collapse_mthp_stack_push(cc, &stack_size, 0, HPAGE_PMD_ORDER);
>
> -       while (stack_size) {
> -               range =3D collapse_mthp_stack_pop(cc, &stack_size);
> -               order =3D range.order;
> -               offset =3D range.offset;
> +       while (offset < HPAGE_PMD_NR) {
>                 nr_ptes =3D 1UL << order;
>
>                 if (!test_bit(order, &enabled_orders))
>                         goto next_order;
>
>                 max_ptes_none =3D collapse_max_ptes_none(cc, NULL, order)=
;
> -
>                 nr_occupied_ptes =3D bitmap_weight_from(cc->mthp_present_=
ptes, offset,
>                                                       offset + nr_ptes);
>
> @@ -1553,7 +1488,7 @@ static enum scan_result mthp_collapse(struct mm_str=
uct *mm,
>                                 collapsed +=3D nr_ptes;
>                                 fallthrough;
>                         case SCAN_PTE_MAPPED_HUGEPAGE:
> -                               continue;
> +                               goto next_offset;
>                         /* Cases where lower orders might still succeed *=
/
>                         case SCAN_ALLOC_HUGE_PAGE_FAIL:
>                                 alloc_failed =3D true;
> @@ -1581,15 +1516,14 @@ static enum scan_result mthp_collapse(struct mm_s=
truct *mm,
>                 }
>
>  next_order:
> -               if ((BIT(order) - 1) & enabled_orders) {
> -                       const u8 next_order =3D order - 1;
> -                       const u16 mid_offset =3D offset + (nr_ptes / 2);
> -
> -                       collapse_mthp_stack_push(cc, &stack_size, mid_off=
set,
> -                                                next_order);
> -                       collapse_mthp_stack_push(cc, &stack_size, offset,
> -                                                next_order);
> +               if (order > KHUGEPAGED_MIN_MTHP_ORDER &&
> +                       (BIT(order) - 1) & enabled_orders) {
> +                       order =3D order - 1;
> +                       continue;
>                 }
> +next_offset:
> +               offset +=3D nr_ptes;
> +               order =3D min_t(int, __ffs(offset), HPAGE_PMD_ORDER);
>         }
>  done:
>         if (collapsed)
> --
> 2.54.0
>
>
>
> >
> > [...]
> >
> >>>> +     bitmap_zero(cc->mthp_bitmap, MAX_PTRS_PER_PTE);
> >>>>       memset(cc->node_load, 0, sizeof(cc->node_load));
> >>>>       nodes_clear(cc->alloc_nmask);
> >>>> +
> >>>> +     enabled_orders =3D collapse_allowable_orders(vma, vma->vm_flag=
s, tva_flags);
> >>>> +
> >>>> +     /*
> >>>> +      * If PMD is the only enabled order, enforce max_ptes_none, ot=
herwise
> >>>> +      * scan all pages to populate the bitmap for mTHP collapse.
> >>>> +      */
> >>>
> >>> You should note here, that we re-verify in mthp_collapse().
> >>>
> >>> But the question is, whether we should relocate the check completely =
into
> >>> mthp_collapse(), instead of conditionally duplicating it.
> >>>
> >>> What speaks against always populating the bitmap and making the decis=
ion in
> >>> mthp_collapse()?
> >>>
> >>> Sure, we might scan a page table a bit longer, but the code gets clea=
rer ... and
> >>> I am not sure if scanning some more page table entries is really that=
 critical here.
> >>
> >> Someone asked me to preserve the legacy behavior (PMD only). Although
> >> rather trivial, if you set max_ptes_none=3D0 for example, we'd still
> >> have to do 511 iterations for no reason if PMD collapse is the only
> >> enabled order rather than bailing immediately.
> >>
> >> I'm ok with dropping it, but I think its the correct approach (despite
> >> the extra complexity). @Usama Arif brought up this point here
> >> https://lore.kernel.org/all/f8f7bb71-ca31-46ee-a62d-7ddfd83e0ead@gmail=
.com/
> >
> > We talk about regressions, but I am not sure if we care about scanning =
speed
> > within a page table that much?
> >
> > After all, we locked it and already read some entries.
> >
> > Having the same check at two places to optimize for PMD order might rig=
ht now
> > feel like a good optimization, but likely an irrelevant one in a near f=
uture?
> >
> > Anyhow, won't push back, as long as we document why we are special casi=
ng things
> > here.
> >
>

