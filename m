Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1FA225A5B
	for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 07:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752737130; cv=none; b=F4yM3xfOrJL9kpUTZvShtcQ/9UkNwTBiTp0vlQiGkaLEy6cBdhbpfs/ecDF6cIQ3LQ9BybN0xzjwoSbGR1I5fTZ8owO9agRkJzucbwdV+YcnBuLatdvgkmbxEksPBpYrl4utGhWqb9C1fruL4sHfMkO+Dr59rppwo4kofWPuDuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752737130; c=relaxed/simple;
	bh=j58zeUSOM0h/p9sADyLgvkI2QIcTR+seK1bRLizS8o0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eHwPU3Uwl5V/LxJvYuhi58Zlum6krBax3Ew345XG0Qdcmq+S+6ILww3rrve8eaOZow9yl2TJ/PkSsFODI1mozMl2FXu2dpjaLWSqFw/hHQqVdnCt3dtQ9ZOnjI7rM3ZtlutyrfeZfzW2bLdAQauNq7eof4wcKyFH5mCr1pNXlRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a8fpDqOO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a8fpDqOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752737128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g2qRJ0vhUxgZfAdGXu3qCJFwuvYHORHNNQHgAFNdhP0=;
	b=a8fpDqOOZ14SwwHWKQdxHb4j+ZjFwg9OBglWpTZswPtgDIaNVMepVTXocNqFPIBAYWw1vV
	93Rw40qd3MspumJe7532WsoS6UOmrY9v2XKA3hVg+5ryKIdKcjTg/omleO5oohlrVIVuGy
	ihR0fk2pFRQaRZEp8SC+8iDVOjrZhlA=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-reQF3iVsOlWrBR6xWlfZEw-1; Thu, 17 Jul 2025 03:25:26 -0400
X-MC-Unique: reQF3iVsOlWrBR6xWlfZEw-1
X-Mimecast-MFC-AGG-ID: reQF3iVsOlWrBR6xWlfZEw_1752737126
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-707cf1b0ecbso10383897b3.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Jul 2025 00:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737126; x=1753341926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2qRJ0vhUxgZfAdGXu3qCJFwuvYHORHNNQHgAFNdhP0=;
        b=AZqzX1/qLxpPh8yi9NZ0JqYc8cM/PTp5NknOnsObDgwsdHc/Jh94Mj4nCrkWe8LsSi
         XNcba9PE53Bilp5EKlVPzaPkAGyqJr96n1XlzinmuBU28kR8Ms+fRuoqgLRrN4OavyqK
         bHX4271RvjThwSSqv4YKUl8K1vWz9BKVTXdzpRfC3A/cDp8XS2eXPTp5IaUDwvut8jjW
         OEUufgMXtSi6+SRDMpDiA/6Bg0ntQlGXPbgDVqI/IFp/eMb3WsYfmK+0Hwg+WIxZFEkR
         wVyB1iXAEmdpdMXXzAVXSkq9BHCSocGe69WffaU/ZAL3XZa5elEk1thgV4mj4jEaI3ZR
         HgWw==
X-Forwarded-Encrypted: i=1; AJvYcCUN2LeCYQw+KyXIBUu9JF2MxCZMdpphWfApn6yblr8n7EDSET+eqXcOxe+5tmQn2IyVB4PTtJ8/zSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6e7bHJCyoOiTsO3JVRybLLPNVqd+pdK5x1kXUBGSyIxZD9i6
	xe75r3fERj3qQ6/bRiqp+wiR93xCGcE6yRrZplLzhPBSN9CDw5Otk5zQD6em4Tk0mwUqbdZzDzN
	8Ya6kNLrPh4P1Y9FhyYRWvAUgIQYsgAt9wyYD5CW/LTxZIrn7KwwMmHcPOqcxNmdFf0ZhfX+USf
	ZImRD0n4FbwzjHsQ47flDHmvlpxhl7BnNj+l1n
X-Gm-Gg: ASbGncsE0GX05nVD1Qwnn+I3Zm+2YTFcg5sDAolfm5BCBSkSLXI6qtPruEiOcn9fycu
	PuP1QQoh2XkxeocGy2/IPad4/TzwXRF+JaIA31ZMw/aFzgomwGmruEEZdqC4S3HXIj0nyTrPgv+
	z5CVJqETVHJWXNK5VttfpO3Nw=
X-Received: by 2002:a05:690c:6c8f:b0:70a:2675:70b3 with SMTP id 00721157ae682-71837475aaemr81219397b3.17.1752737126001;
        Thu, 17 Jul 2025 00:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3zLwOVx14CX9ZFk5M7NptbR4Vtkv7y2swdOQcVV2bdsXyIwCQieST6so7r6GPy5LTDbi4OxzkmKDiHQeVo40=
X-Received: by 2002:a05:690c:6c8f:b0:70a:2675:70b3 with SMTP id
 00721157ae682-71837475aaemr81219087b3.17.1752737125474; Thu, 17 Jul 2025
 00:25:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714003207.113275-1-npache@redhat.com> <20250714003207.113275-9-npache@redhat.com>
 <290d669f-e358-471a-95b7-c46f974742d0@redhat.com>
In-Reply-To: <290d669f-e358-471a-95b7-c46f974742d0@redhat.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 17 Jul 2025 01:24:58 -0600
X-Gm-Features: Ac12FXw-dqZQr1iCc1PpyFCVkqA86TGy_82hTQcSrhEKTcjVPQocXibYjfgQIuE
Message-ID: <CAA1CXcAciHMz7RCAqFZcnDk-nvhfd-G7QSdMub1aYzKAq8pdHw@mail.gmail.com>
Subject: Re: [PATCH v9 08/14] khugepaged: skip collapsing mTHP to smaller orders
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

On Wed, Jul 16, 2025 at 8:32=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 14.07.25 02:32, Nico Pache wrote:
> > khugepaged may try to collapse a mTHP to a smaller mTHP, resulting in
> > some pages being unmapped. Skip these cases until we have a way to chec=
k
> > if its ok to collapse to a smaller mTHP size (like in the case of a
> > partially mapped folio).
> >
> > This patch is inspired by Dev Jain's work on khugepaged mTHP support [1=
].
> >
> > [1] https://lore.kernel.org/lkml/20241216165105.56185-11-dev.jain@arm.c=
om/
> >
> > Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Co-developed-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > Signed-off-by: Nico Pache <npache@redhat.com>
> > ---
> >   mm/khugepaged.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 5d7c5be9097e..a701d9f0f158 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -612,7 +612,12 @@ static int __collapse_huge_page_isolate(struct vm_=
area_struct *vma,
> >               folio =3D page_folio(page);
> >               VM_BUG_ON_FOLIO(!folio_test_anon(folio), folio);
> >
> > -             /* See hpage_collapse_scan_pmd(). */
> > +             if (order !=3D HPAGE_PMD_ORDER && folio_order(folio) >=3D=
 order) {
> > +                     result =3D SCAN_PTE_MAPPED_HUGEPAGE;
> > +                     goto out;
> > +             }
>
> Probably worth adding a TODO in the code like
>
> /*
>   * TODO: In some cases of partially-mapped folios, we'd actually
>   * want to collapse.
>   */
Done! Good idea with these TODOs!
>
> Acked-by: David Hildenbrand <david@redhat.com>
Thank you :)
>
> --
> Cheers,
>
> David / dhildenb
>

