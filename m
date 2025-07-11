Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740591ACEDE
	for <linux-doc@vger.kernel.org>; Fri, 11 Jul 2025 05:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752211192; cv=none; b=jkVCxn5fjElbLU52ykxXjZt1JfpfG6ip/UXlIH2zlwAYE/zZptVOevIDeTbc6e4zACHwZmHDUUBGeGxtUveYG9SLTxlDz2K5HOuG0MHR6kVir6UkcdQNd9oNI2sRctnO+7iaxm82d22v1/8akp9yQDZoTwuX4qXY86Xg829YGfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752211192; c=relaxed/simple;
	bh=Gl7BWTMG7L9ENrTs+uZGBMMib9ehBZnrbfosOksV5ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvr4aJEmorem+3cY6t78qJ1g/yHHq4+KGJXrEOrdaBZWpvYhde1G0ZAEiH4t/NtAE+32cS+Y2oYhUz/YTOE2REpl7uRuG6RqC1r4LfOVsMxzWjMAnOrBCOoNLifuPk5FsKncPgtJRfzVCVubvxS2L/s/Ru2wEHIAfw6cgkuMdkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PxVf1y+H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PxVf1y+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752211189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6vIHjG+X+ooer0kPEbKBb824B/b+sl4l3mrZB9ZZto=;
	b=PxVf1y+H08LxavdEGBnr1ko0JGGCrIqYS1sjYN4vcTCvpbQWtveGZAsY36CEIY5DHwDAVF
	ifnwP9YQNqyZXvUWdhYUCZkK+WuiLqPK+xbrfNcZTADjJZvoJUWJpBMKsxtrkEU04wzyXJ
	ld4MjEfmryGA7XUu5r3HF5031SW2rsA=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-Ou1aYFkVPnC9KpwypVKgEw-1; Fri, 11 Jul 2025 01:19:47 -0400
X-MC-Unique: Ou1aYFkVPnC9KpwypVKgEw-1
X-Mimecast-MFC-AGG-ID: Ou1aYFkVPnC9KpwypVKgEw_1752211187
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70e73d3c474so28394367b3.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Jul 2025 22:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752211187; x=1752815987;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6vIHjG+X+ooer0kPEbKBb824B/b+sl4l3mrZB9ZZto=;
        b=nHUejR9bLwbboVmzTflQP+c/0XmusCP6IRPVq8kvtr6UK1fmKEUlr0/WxAL7YD3zZd
         13Syc3R2Bx/qlvxHlAB8+CDr/bkhuAeiFXRxiBQTYwtENuvKFiL2XzqBWcL+wA/48vom
         mvqBDyKWQwCtGMGT8wWe2znryUIGh9O+xoZff0qg2fWmPulYA7CiS8AQC0764u1TUFZI
         REDM6ziUoD0Ag7HVVR72f5l2SWgWcMf3BzAI45ggFTpWG/7BUatH7qDUatzf+VWu/Imo
         lr/ITAEYVruO/s+rHIGcHO68jvWk8+jXJQh3JIm/P96gU+XFpllqBCaQ/QuWKFBYXng+
         UdPw==
X-Forwarded-Encrypted: i=1; AJvYcCWSnF5H8eXAwjeTKo8A4CT33zxO7KGLTvCPMbmak9oixipAhJeXM8nTrKsBaqWw0C0UU3MzIBy5PC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDZNQSzcUslSa8oHk4908UNzvylceS5y5cDU19TVzNJeDtN1Y+
	eCguarCTvB/v1w1CNWvbkEOIDzjfLe7w5MtCRZzuNig+fnUOG1pKz3tq9199RA3gWIu25A5osOR
	scnUgY/ULPlcjz9Zvd7SiL6rFFnf3HVZ9kE3q1+CDWDtegUMuFYsK27DbhYQkrjuOliyebOHCr6
	srlg837/CxgkyGb0YMeeaZzLMRmdh+kpungvCz
X-Gm-Gg: ASbGnct/Jz6NoFo1BtSOTDm5rmbjbWULWz2uVkd7Nkho3IwztKdAvYpOjUFpmhqHZFH
	3LoDLflNdInrW6tbiuuV4hv0KWFFf33MO8ikzswXLnCKbtGIC6t9/m98Ew8Q0AR6bKh6IYI7gw+
	UNbUcdnW5AzdnJbi8Gn4rlBu8=
X-Received: by 2002:a05:690c:3708:b0:6fb:9280:5bf4 with SMTP id 00721157ae682-717d7a60360mr30287167b3.30.1752211187013;
        Thu, 10 Jul 2025 22:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcWVC3GcSeJkTDnF3C9rnrmpzpkOrmkTr88hOUgI4ozfXlLJUBFIOZ+k63jCty+yYVBl88zRUE6c3Ln7c+0to=
X-Received: by 2002:a05:690c:3708:b0:6fb:9280:5bf4 with SMTP id
 00721157ae682-717d7a60360mr30286697b3.30.1752211186572; Thu, 10 Jul 2025
 22:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702055742.102808-1-npache@redhat.com> <20250702055742.102808-15-npache@redhat.com>
 <342d5fe1-cd39-462c-b2a4-b5d6979a8a21@linux.alibaba.com>
In-Reply-To: <342d5fe1-cd39-462c-b2a4-b5d6979a8a21@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 10 Jul 2025 23:19:20 -0600
X-Gm-Features: Ac12FXyWnkdFgO0eSnxKkRQ5LAIk8ZEY6SDq1ck6We4zFjeQk_isSPFYEbCbMbo
Message-ID: <CAA1CXcA9-JzToPQM4X9qB3sdXBYs3n9Sx4DWyM2i3qFtvu6w0g@mail.gmail.com>
Subject: Re: [PATCH v8 14/15] khugepaged: add per-order mTHP khugepaged stats
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
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
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 12:10=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/7/2 13:57, Nico Pache wrote:
> > With mTHP support inplace, let add the per-order mTHP stats for
> > exceeding NONE, SWAP, and SHARED.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   include/linux/huge_mm.h |  3 +++
> >   mm/huge_memory.c        |  7 +++++++
> >   mm/khugepaged.c         | 15 ++++++++++++---
> >   3 files changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> > index a6ea89fdaee6..6034b4c9dae5 100644
> > --- a/include/linux/huge_mm.h
> > +++ b/include/linux/huge_mm.h
> > @@ -141,6 +141,9 @@ enum mthp_stat_item {
> >       MTHP_STAT_SPLIT_DEFERRED,
> >       MTHP_STAT_NR_ANON,
> >       MTHP_STAT_NR_ANON_PARTIALLY_MAPPED,
> > +     MTHP_STAT_COLLAPSE_EXCEED_SWAP,
>
> This stat seems never used.
Ah good catch, I somehow dropped that piece on the V5->v6/7
>
> > +     MTHP_STAT_COLLAPSE_EXCEED_NONE,
> > +     MTHP_STAT_COLLAPSE_EXCEED_SHARED,
> >       __MTHP_STAT_COUNT
> >   };
>
> Please also update the 'Documentation/admin-guide/mm/transhuge.rst' for
> these new statistics.
Will do thanks :)
>
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 69777a35e722..3eb1c34be601 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -632,6 +632,10 @@ DEFINE_MTHP_STAT_ATTR(split_failed, MTHP_STAT_SPLI=
T_FAILED);
> >   DEFINE_MTHP_STAT_ATTR(split_deferred, MTHP_STAT_SPLIT_DEFERRED);
> >   DEFINE_MTHP_STAT_ATTR(nr_anon, MTHP_STAT_NR_ANON);
> >   DEFINE_MTHP_STAT_ATTR(nr_anon_partially_mapped, MTHP_STAT_NR_ANON_PAR=
TIALLY_MAPPED);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_swap_pte, MTHP_STAT_COLLAPSE_EXC=
EED_SWAP);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_none_pte, MTHP_STAT_COLLAPSE_EXC=
EED_NONE);
> > +DEFINE_MTHP_STAT_ATTR(collapse_exceed_shared_pte, MTHP_STAT_COLLAPSE_E=
XCEED_SHARED);
> > +
> >
> >   static struct attribute *anon_stats_attrs[] =3D {
> >       &anon_fault_alloc_attr.attr,
> > @@ -648,6 +652,9 @@ static struct attribute *anon_stats_attrs[] =3D {
> >       &split_deferred_attr.attr,
> >       &nr_anon_attr.attr,
> >       &nr_anon_partially_mapped_attr.attr,
> > +     &collapse_exceed_swap_pte_attr.attr,
> > +     &collapse_exceed_none_pte_attr.attr,
> > +     &collapse_exceed_shared_pte_attr.attr,
> >       NULL,
> >   };
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 2c0962637c34..636b84bf1ca1 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -594,7 +594,10 @@ static int __collapse_huge_page_isolate(struct vm_=
area_struct *vma,
> >                               continue;
> >                       } else {
> >                               result =3D SCAN_EXCEED_NONE_PTE;
> > -                             count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> > +                             if (order =3D=3D HPAGE_PMD_ORDER)
> > +                                     count_vm_event(THP_SCAN_EXCEED_NO=
NE_PTE);
> > +                             else
> > +                                     count_mthp_stat(order, MTHP_STAT_=
COLLAPSE_EXCEED_NONE);
> >                               goto out;
> >                       }
> >               }
> > @@ -623,8 +626,14 @@ static int __collapse_huge_page_isolate(struct vm_=
area_struct *vma,
> >               /* See khugepaged_scan_pmd(). */
> >               if (folio_maybe_mapped_shared(folio)) {
> >                       ++shared;
> > -                     if (order !=3D HPAGE_PMD_ORDER || (cc->is_khugepa=
ged &&
> > -                         shared > khugepaged_max_ptes_shared)) {
> > +                     if (order !=3D HPAGE_PMD_ORDER) {
> > +                             result =3D SCAN_EXCEED_SHARED_PTE;
> > +                             count_mthp_stat(order, MTHP_STAT_COLLAPSE=
_EXCEED_SHARED);
> > +                             goto out;
> > +                     }
> > +
> > +                     if (cc->is_khugepaged &&
> > +                             shared > khugepaged_max_ptes_shared) {
> >                               result =3D SCAN_EXCEED_SHARED_PTE;
> >                               count_vm_event(THP_SCAN_EXCEED_SHARED_PTE=
);
> >                               goto out;
>

