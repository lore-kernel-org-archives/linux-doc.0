Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774542641FB
	for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 18:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039439; cv=none; b=tbIlSquW0pin5Ip4dc8m97055M92BT8n9+IzFJq3sFzOvA8MZs5+J8AEQG9gmrrJrtQ+reUzrv65jrRrFf/NXtvy4fnZR09RSZnmlhjeMyVY7+iJt5QleAe3bIC2KXr2X5/9sSVnTtg1yGzKb5TUfAYgWi/T+5uzmMFt8SHeDYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039439; c=relaxed/simple;
	bh=jLNxZuKdPLFzw2D37mjvFJRplwDHIVtfY9G0E4/UmiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qSTZXuGHaAeBgTp/oJyzBg8z5Z5te3DozZtRQGaRPpuOovwILPTHaVRx0vCwhuVsU2u3fOkSyF1V2HE/HoB8JHCaOah6cPgqSeftE+nFvd5/b23T9iA46bup3B0ClVCRFZnOfftYsK+msHTTxJdpdQg4kDAPlG1w8A8eimolGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JE0nJKFr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JE0nJKFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746039435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LUsQSV7GXHv6XZvszLmYUY3LtVLyDJhgpBwbERYoVrc=;
	b=JE0nJKFrsoAdHsXW08iSyGjd7X2ntzT9ZDeYdB8vXY/J1tBn5yZ9LU+w5E6U296bK7ZVyG
	Fd23cNtojYe5i/b0YoOEDc2QUvUd8EOrNiMVb15YyYcEeeVSL0GYhfBmqy1QSGHURko0aD
	xKg8d/RGSuygPKa/1+ON0AY5bzcpIRc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-DwSJs8VANAOUi65QiW6-pA-1; Wed, 30 Apr 2025 14:57:13 -0400
X-MC-Unique: DwSJs8VANAOUi65QiW6-pA-1
X-Mimecast-MFC-AGG-ID: DwSJs8VANAOUi65QiW6-pA_1746039433
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-707d49f9c3bso3595107b3.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Apr 2025 11:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746039433; x=1746644233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUsQSV7GXHv6XZvszLmYUY3LtVLyDJhgpBwbERYoVrc=;
        b=NEd5nATaArEXs+Jd5XAhVVPgVoL4cZUggk4dUoz6Javh9Xug4i0a0muBOWh39ZuQAh
         OcgvwgpnuDfnCxoe3zObWy9IKiVl3CxrLkvdinuMZl0ABlSixbU2E2VZ4DF7LhPKqcdr
         NhEQgIOij8fAzbaQSgVJMrDFiD7ofqSe9utnO3XNWq9e9p3yfLEPBMnJC0sETDQmipHd
         AJEGDdMIWbVSQJ5FtvhOui1fFLMJ4bImlH5UQxcA/twN5HbhswU6rchUd6VpXKCICB9h
         QNDMzHun9sD0qTIMC87vNzJEGCvG0jdrAmk/rqGOZIdXGCZvxmIgnMhu5qy+rgzeM1n7
         u50A==
X-Forwarded-Encrypted: i=1; AJvYcCVHBOSaoWvLh0mOe7Z1CJd3yFbxOzElWPllfbseIQyGkIRsrJUInRI9rRR+dwyfxIZBROKYhL2DiIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7J9CJHDlYNx9jzlGKuhoMbQZitcfA3G6+INdyxXenR0c7H/nj
	974pN5nB8Yt0tYZO36Up2KCjEkC+dQmiSSPa5xhvts8AZHYLhLULDPID9qNLONZsYPs2CVvti05
	P/JO+A10HnRaN/8E+E+bJAkbrqhYeeTEqU59v79AJB2mX1SEiaWZ9XknQr8qhzQHi8WhQzKKQyd
	dMoIWw09KFB/tD2ZkFMVNvilwQnberpjZ9
X-Gm-Gg: ASbGncukpIin00qOZ51CRKTxQV3AmwoxsNnCqMg1LG/SVT+MqcFebq91LpAGy+Azwov
	jlghL9vSIsx6GRG4KWEGFNwWn2GgsBf+wfkTSP1cfBAj7S3ANLJ6hTt5ZiQAI+BbaD9632NtSWj
	z+BYnPrxs=
X-Received: by 2002:a05:690c:3387:b0:6ff:1fac:c4fc with SMTP id 00721157ae682-708abe5a3e2mr67954607b3.37.1746039433175;
        Wed, 30 Apr 2025 11:57:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF4ZQb655eTq5ucVGhB0o4hLF87lKj2hNzrhrXVIac5oEHfdXIj33wjWB/sp/XfpX1P6jGwcuvi2204v5vWuo=
X-Received: by 2002:a05:690c:3387:b0:6ff:1fac:c4fc with SMTP id
 00721157ae682-708abe5a3e2mr67954387b3.37.1746039432864; Wed, 30 Apr 2025
 11:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428181218.85925-1-npache@redhat.com> <20250428181218.85925-7-npache@redhat.com>
 <5feb1d57-e069-4469-9751-af4fb067e858@linux.alibaba.com>
In-Reply-To: <5feb1d57-e069-4469-9751-af4fb067e858@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Wed, 30 Apr 2025 12:56:47 -0600
X-Gm-Features: ATxdqUE-PCD0QbncxgpNxUZLYADdbwYq2DLcTNeaPcitp4bfk1TL01R6iHWhZ94
Message-ID: <CAA1CXcDWX7zsW03Wwg_OHRhJ2nrt6OaLd5bn8ccX0StoN1kGUQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, rostedt@goodmis.org, 
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com, david@redhat.com, 
	baohua@kernel.org, ryan.roberts@arm.com, willy@infradead.org, 
	peterx@redhat.com, ziy@nvidia.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	dev.jain@arm.com, anshuman.khandual@arm.com, catalin.marinas@arm.com, 
	tiwai@suse.de, will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, 
	cl@gentwo.org, jglisse@google.com, surenb@google.com, zokeefe@google.com, 
	hannes@cmpxchg.org, rientjes@google.com, mhocko@suse.com, 
	rdunlap@infradead.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 4:08=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/4/29 02:12, Nico Pache wrote:
> > khugepaged scans anons PMD ranges for potential collapse to a hugepage.
> > To add mTHP support we use this scan to instead record chunks of utiliz=
ed
> > sections of the PMD.
> >
> > khugepaged_scan_bitmap uses a stack struct to recursively scan a bitmap
> > that represents chunks of utilized regions. We can then determine what
> > mTHP size fits best and in the following patch, we set this bitmap whil=
e
> > scanning the anon PMD.
> >
> > max_ptes_none is used as a scale to determine how "full" an order must
> > be before being considered for collapse.
> >
> > When attempting to collapse an order that has its order set to "always"
> > lets always collapse to that order in a greedy manner without
> > considering the number of bits set.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   include/linux/khugepaged.h |  4 ++
> >   mm/khugepaged.c            | 94 ++++++++++++++++++++++++++++++++++---=
-
> >   2 files changed, 89 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/khugepaged.h b/include/linux/khugepaged.h
> > index 1f46046080f5..18fe6eb5051d 100644
> > --- a/include/linux/khugepaged.h
> > +++ b/include/linux/khugepaged.h
> > @@ -1,6 +1,10 @@
> >   /* SPDX-License-Identifier: GPL-2.0 */
> >   #ifndef _LINUX_KHUGEPAGED_H
> >   #define _LINUX_KHUGEPAGED_H
> > +#define KHUGEPAGED_MIN_MTHP_ORDER    2
>
> Still better to add some comments to explain explicitly why choose 2 as
> the MIN_MTHP_ORDER.
Ok i'll add a note that explicitly states that the min order of anon mTHPs =
is 2
>
> > +#define KHUGEPAGED_MIN_MTHP_NR       (1<<KHUGEPAGED_MIN_MTHP_ORDER)
> > +#define MAX_MTHP_BITMAP_SIZE  (1 << (ilog2(MAX_PTRS_PER_PTE) - KHUGEPA=
GED_MIN_MTHP_ORDER))
> > +#define MTHP_BITMAP_SIZE  (1 << (HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP=
_ORDER))
> >
> >   extern unsigned int khugepaged_max_ptes_none __read_mostly;
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index e21998a06253..6e67db86409a 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -94,6 +94,11 @@ static DEFINE_READ_MOSTLY_HASHTABLE(mm_slots_hash, M=
M_SLOTS_HASH_BITS);
> >
> >   static struct kmem_cache *mm_slot_cache __ro_after_init;
> >
> > +struct scan_bit_state {
> > +     u8 order;
> > +     u16 offset;
> > +};
> > +
> >   struct collapse_control {
> >       bool is_khugepaged;
> >
> > @@ -102,6 +107,18 @@ struct collapse_control {
> >
> >       /* nodemask for allocation fallback */
> >       nodemask_t alloc_nmask;
> > +
> > +     /*
> > +      * bitmap used to collapse mTHP sizes.
> > +      * 1bit =3D order KHUGEPAGED_MIN_MTHP_ORDER mTHP
> > +      */
> > +     DECLARE_BITMAP(mthp_bitmap, MAX_MTHP_BITMAP_SIZE);
> > +     DECLARE_BITMAP(mthp_bitmap_temp, MAX_MTHP_BITMAP_SIZE);
> > +     struct scan_bit_state mthp_bitmap_stack[MAX_MTHP_BITMAP_SIZE];
> > +};
> > +
> > +struct collapse_control khugepaged_collapse_control =3D {
> > +     .is_khugepaged =3D true,
> >   };
> >
> >   /**
> > @@ -851,10 +868,6 @@ static void khugepaged_alloc_sleep(void)
> >       remove_wait_queue(&khugepaged_wait, &wait);
> >   }
> >
> > -struct collapse_control khugepaged_collapse_control =3D {
> > -     .is_khugepaged =3D true,
> > -};
> > -
> >   static bool khugepaged_scan_abort(int nid, struct collapse_control *c=
c)
> >   {
> >       int i;
> > @@ -1118,7 +1131,8 @@ static int alloc_charge_folio(struct folio **foli=
op, struct mm_struct *mm,
> >
> >   static int collapse_huge_page(struct mm_struct *mm, unsigned long add=
ress,
> >                             int referenced, int unmapped,
> > -                           struct collapse_control *cc)
> > +                           struct collapse_control *cc, bool *mmap_loc=
ked,
> > +                               u8 order, u16 offset)
> >   {
> >       LIST_HEAD(compound_pagelist);
> >       pmd_t *pmd, _pmd;
> > @@ -1137,8 +1151,12 @@ static int collapse_huge_page(struct mm_struct *=
mm, unsigned long address,
> >        * The allocation can take potentially a long time if it involves
> >        * sync compaction, and we do not need to hold the mmap_lock duri=
ng
> >        * that. We will recheck the vma after taking it again in write m=
ode.
> > +      * If collapsing mTHPs we may have already released the read_lock=
.
> >        */
> > -     mmap_read_unlock(mm);
> > +     if (*mmap_locked) {
> > +             mmap_read_unlock(mm);
> > +             *mmap_locked =3D false;
> > +     }
> >
> >       result =3D alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
> >       if (result !=3D SCAN_SUCCEED)
> > @@ -1273,12 +1291,72 @@ static int collapse_huge_page(struct mm_struct =
*mm, unsigned long address,
> >   out_up_write:
> >       mmap_write_unlock(mm);
> >   out_nolock:
> > +     *mmap_locked =3D false;
> >       if (folio)
> >               folio_put(folio);
> >       trace_mm_collapse_huge_page(mm, result =3D=3D SCAN_SUCCEED, resul=
t);
> >       return result;
> >   }
> >
> > +// Recursive function to consume the bitmap
>
> Nit: please use '/* Xxxx */' for comments in this patch.
>
> > +static int khugepaged_scan_bitmap(struct mm_struct *mm, unsigned long =
address,
> > +                     int referenced, int unmapped, struct collapse_con=
trol *cc,
> > +                     bool *mmap_locked, unsigned long enabled_orders)
> > +{
> > +     u8 order, next_order;
> > +     u16 offset, mid_offset;
> > +     int num_chunks;
> > +     int bits_set, threshold_bits;
> > +     int top =3D -1;
> > +     int collapsed =3D 0;
> > +     int ret;
> > +     struct scan_bit_state state;
> > +     bool is_pmd_only =3D (enabled_orders =3D=3D (1 << HPAGE_PMD_ORDER=
));
> > +
> > +     cc->mthp_bitmap_stack[++top] =3D (struct scan_bit_state)
> > +             { HPAGE_PMD_ORDER - KHUGEPAGED_MIN_MTHP_ORDER, 0 };
> > +
> > +     while (top >=3D 0) {
> > +             state =3D cc->mthp_bitmap_stack[top--];
> > +             order =3D state.order + KHUGEPAGED_MIN_MTHP_ORDER;
> > +             offset =3D state.offset;
> > +             num_chunks =3D 1 << (state.order);
> > +             // Skip mTHP orders that are not enabled
> > +             if (!test_bit(order, &enabled_orders))
> > +                     goto next;
> > +
> > +             // copy the relavant section to a new bitmap
> > +             bitmap_shift_right(cc->mthp_bitmap_temp, cc->mthp_bitmap,=
 offset,
> > +                               MTHP_BITMAP_SIZE);
> > +
> > +             bits_set =3D bitmap_weight(cc->mthp_bitmap_temp, num_chun=
ks);
> > +             threshold_bits =3D (HPAGE_PMD_NR - khugepaged_max_ptes_no=
ne - 1)
> > +                             >> (HPAGE_PMD_ORDER - state.order);
> > +
> > +             //Check if the region is "almost full" based on the thres=
hold
> > +             if (bits_set > threshold_bits || is_pmd_only
> > +                     || test_bit(order, &huge_anon_orders_always)) {
>
> When testing this patch, I disabled the PMD-sized THP and enabled
> 64K-sized mTHP, but it still attempts to collapse into a PMD-sized THP
> (since bits_set > threshold_bits is ture). This doesn't seem reasonable?
We are still required to have PMD enabled for mTHP collapse to work.
It's a limitation of the current khugepaged code (it currently only
adds mm_slots when PMD is enabled).
We've discussed this in the past and are looking for a proper way
forward, but the solution becomes tricky.

However I'm surprised that it still collapses due to the code below.
I'll test this out later today.
    +             if (!test_bit(order, &enabled_orders))
    +                     goto next;
>
> > +                     ret =3D collapse_huge_page(mm, address, reference=
d, unmapped, cc,
> > +                                     mmap_locked, order, offset * KHUG=
EPAGED_MIN_MTHP_NR);
> > +                     if (ret =3D=3D SCAN_SUCCEED) {
> > +                             collapsed +=3D (1 << order);
> > +                             continue;
> > +                     }
> > +             }
> > +
> > +next:
> > +             if (state.order > 0) {
> > +                     next_order =3D state.order - 1;
> > +                     mid_offset =3D offset + (num_chunks / 2);
> > +                     cc->mthp_bitmap_stack[++top] =3D (struct scan_bit=
_state)
> > +                             { next_order, mid_offset };
> > +                     cc->mthp_bitmap_stack[++top] =3D (struct scan_bit=
_state)
> > +                             { next_order, offset };
> > +                     }
> > +     }
> > +     return collapsed;
> > +}
> > +
> >   static int khugepaged_scan_pmd(struct mm_struct *mm,
> >                                  struct vm_area_struct *vma,
> >                                  unsigned long address, bool *mmap_lock=
ed,
> > @@ -1445,9 +1523,7 @@ static int khugepaged_scan_pmd(struct mm_struct *=
mm,
> >       pte_unmap_unlock(pte, ptl);
> >       if (result =3D=3D SCAN_SUCCEED) {
> >               result =3D collapse_huge_page(mm, address, referenced,
> > -                                         unmapped, cc);
> > -             /* collapse_huge_page will return with the mmap_lock rele=
ased */
> > -             *mmap_locked =3D false;
> > +                                         unmapped, cc, mmap_locked, HP=
AGE_PMD_ORDER, 0);
> >       }
> >   out:
> >       trace_mm_khugepaged_scan_pmd(mm, &folio->page, writable, referenc=
ed,
>

